Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093019F646B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745A110EB68;
	Wed, 18 Dec 2024 11:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r2xBz9of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DB010EB68
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:12:44 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso32631351fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734520363; x=1735125163; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M8fJWDW28aqL8+QYcN+FgyuL9HZ8n5LHNGBtm/RG46M=;
 b=r2xBz9of982J21ngK8ZvHV8zM9fBv6Uw48YfK+I9FQWCqUc0UiTtJDTqwNy6srl8/Y
 yZyRVhhvzbxKRGHbrV4EFFfNGhF5aqbTo56DDOcFcIGWJerwVZCfPkUJpErs4J8lRGsN
 clytk79XNe7BHta+LPvOy5e8dF9WAXLDYBMTYr1BU8NLcKi8MWPW9V5wrER9iv3FoQ3g
 YcL4d0vECSRQqek/AVCUfcS9W8YDxIgBxlenICd0wiw39787o9kACEyaPa6s+Dcz61YP
 jwzUZTlWqEzNyCP/IqB/iPESCVh/IR5GqjxfqQJcuPm6L0061/C3HyGx0BH4UGucGW5w
 V73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734520363; x=1735125163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8fJWDW28aqL8+QYcN+FgyuL9HZ8n5LHNGBtm/RG46M=;
 b=gln1p9FD+UT4rFmDm8dzowXF7dN65u1g6CNWRk5v5j94HSWjqt7G7MOBW64jiNQI6Q
 uPnMTxgk65Pc1uGIIEG2ONmTDL89QMUnJppPuDzCfQ/kPmkwdKS8HIEzFtxL3Ndax81O
 2km5m58doHqmnfM+Arf/nHBZ4X7oSBJl/In045Xyd5Qfn+Kt3bvulTyZhfHVOuoVDrcp
 BbMsl5+68sRacNCD3OkW8tXeFVuZIhcNRuu9QbMYAKeX6r0YcYnuVwYuOlx3ULT9ghOD
 Y2NaWBVHz1vIJTbinJC5OL1D59etamBWfExXo1TyTqLyF8kSFFfFFnegbsq+Lep9KYOE
 15NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe2TRXl2VJDvNL6oGeege2LYrc++OkmKEiaUjL9l+2oY39ob+Ee7juMVj2rU3iTgZSrlQk2FIoiEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+8str+1ZthTFhsGBDFzxriimXqUcF7tlEDgYDxOc6n7RCiC/N
 ny/lZ0OSbpQ/zxp16rWt5b3X/Mxf8kVqQrqGb+F2ic3VEZGh+FMCq/eiGf/S0qk=
X-Gm-Gg: ASbGnct/hPC9B+7MnDTnj7P7YiGdvphTHrQlpW2608ztVwyaqRppnxYl2Mj//+cXa0n
 O5LOaldZb8Zn4jEinydlBxzL3Q/M8/sk1SiZCVOvE/uLg7NS4hBI68qFmksF0xQD6EPoRLR6AWM
 XrQZYPu8e85H1hgT5/M8ZUKWrA/HGvIVTLVVJGVmXFqmtCvxFBgA3ghzjCZDo1Wy7MSyTUsKSuX
 1IlC3m/Fs/jV3kxSDYCrD1djpML5jdhJ+rbqGGpBMWQrvzqMEEtPHqa7PCBDOBXy5kwEal3mOt1
 HEAM5h88K5mJlSNGNOm9ASjDufMPNY0q7Qdj
X-Google-Smtp-Source: AGHT+IFuXGztV8sXG+rRud35O75Nb0WUWHo3POitPYANEMAxnuB8yJlLwo5eYu7L75ovdSyOgRJzlw==
X-Received: by 2002:a2e:a7ca:0:b0:300:324e:3506 with SMTP id
 38308e7fff4ca-3044daab8demr8003641fa.13.1734520363212; 
 Wed, 18 Dec 2024 03:12:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303440452a8sm15586311fa.40.2024.12.18.03.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:12:42 -0800 (PST)
Date: Wed, 18 Dec 2024 13:12:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
Message-ID: <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2024 at 03:54:28PM +0530, Ekansh Gupta wrote:
> For registered  buffers, fastrpc driver sends the buffer information
> to remote subsystem. There is a problem with current implementation
> where the page address is being sent with an offset leading to
> improper buffer address on DSP. This is leads to functional failures
> as DSP expects base address in page information and extracts offset
> information from remote arguments. Mask the offset and pass the base
> page address to DSP.
> 
> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")

This was committed in 2019. Are you saying that the driver has been
broken since that time? If so, what is the impact? Because I've
definitely been running fastrpc workload after that moment.

Also, is there any reason for neglecting checkpatch warning?

> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 48d08eeb2d20..cfa1546c9e3f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			mmap_read_lock(current->mm);
>  			vma = find_vma(current->mm, ctx->args[i].ptr);
>  			if (vma)
> -				pages[i].addr += ctx->args[i].ptr -
> +				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
>  						 vma->vm_start;
>  			mmap_read_unlock(current->mm);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
