Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E216938B40
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94D510E424;
	Mon, 22 Jul 2024 08:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zk5NDakK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218D610E442
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:33:01 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso22220651fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721637179; x=1722241979; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U8sNrx4VreOw/LgPBLnoWulqquEYUzh0E/7dzJx6llQ=;
 b=Zk5NDakKvHMjwoiGkxTFSCNH2i8Bj6/+6ZoeFXs4MFrZgDT9BlPqutOemtUBtdSKg/
 pNY6j4fuKWOhBKyWG5PLZNpJkkOHu53bQ6XQhLl5JO7gBGjPi2rcTHHccds1BvBtbnKG
 QzwrQWYeAUOxNYP9Mue5zyBKIeKAXW+ClitxhhYVJDqHu0UbmxbxI8M0mhJHPsSmhTqN
 o73kF2j1rTCTPTLYw3niK6GhDfKG9tVr9A+20GlWne1m6oZTTQaUvE3aYy54xcqTvQAU
 1p+MCoU2mawLPMd6WEPqZ0g1f8OsiBTESpgTjacvGc7MucxI78NXjVizT4uavqfs9WiE
 Hksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637179; x=1722241979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8sNrx4VreOw/LgPBLnoWulqquEYUzh0E/7dzJx6llQ=;
 b=bCEWqvLf6JIcn9oN7kap0YY3KyWQ7n/m2PQbnb/X/t48h7O/S+8EIbYSPrgIBNgtqk
 pc5zzIGrpf63+fj1vperDyYdPwL0xV3nfzrS6OVDPMx5Yj5I93calT2No1a5Epxl56Ds
 X5Z5wchJviEMXOdKyKe9Q9TbYW5JaxuRCh+CV00NECsZ4hyBVEgTHkY439snydn2u/bm
 b90L6Acc7xTuNo7D9sJBm+9Iu8VUfutFbENVlZe2aMx9L584rzlbZ5DMzsPd0vbDnZEu
 bgVXX7kR4DzYjC3rX/ohFhWyF/9fCrpkhNan1bYDNZR4AeR9HVSpdC/Wa59zipXxi3km
 PfvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGPI/kkizSj5jkwlzelo3tpkvwK/5EDbT1ZQ1D6PstqYe0O8FlvANBBKWwW7xOeuliDJv0Lkgp8ZlCFO4Yu8T8CpV8SFcIUUKl6HX3f9O2
X-Gm-Message-State: AOJu0YykE5hXSmhVimZLCltLMlaIaEvzFFvw0dQ+Q8Lb840WKKWhtuP4
 n52yWnPswSwQeQiN6T0hd+GkCleGlyUZoZ0lpNY6Ow3/0EmoFB2RNoaiJ8rfYuA=
X-Google-Smtp-Source: AGHT+IGUVxNFBkmLm7Caxhwg1z9pIP1ZJJmKfA9dUPMTeOS6qsRdqa8z5TuJ7r3mhAByJG5dV2LBng==
X-Received: by 2002:a2e:3609:0:b0:2ef:2e3f:35d9 with SMTP id
 38308e7fff4ca-2ef2e3f368amr24399581fa.33.1721637179187; 
 Mon, 22 Jul 2024 01:32:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef28807aaesm6517221fa.43.2024.07.22.01.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:32:58 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:32:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v6 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <ydp5ntlresenovs6qaqt7wdaleuruubem5hajbfadkratfsiam@wjn33ymp4gyc>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722080200.3530850-2-quic_ekangupt@quicinc.com>
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

On Mon, Jul 22, 2024 at 01:31:59PM GMT, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. The size of this memory
> is decided based on the shell size that is passed by the user space.
> With the current implementation, a minimum of 2MB is always allocated
> for initmem even if the size passed by user is less than that. For this
> a MACRO is being used which is intended for shell size bound check.
> This minimum size of 2MB is not recommended as the PD will have very
> less memory for heap and will have to request HLOS again for memory.
> Define a new macro for initmem minimum length of 3MB.
> 
> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..a3a5b745936e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,7 @@
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)

So, what is the difference between INIT_FILELEN_MAX and
FASTRPC_INITLEN_MIN?

>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),

BTW: why is the code multiplying filelen by 4? Nothing in the source
code suggests that filelen is in u32 words, so I'd assume it's measured
in bytes.

>  		       1024 * 1024);
>  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
>  				&imem);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
