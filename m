Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40159FAD13
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A050610E46D;
	Mon, 23 Dec 2024 10:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BfBduqoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D7910E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:19:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso4490157e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734949165; x=1735553965; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnesPOoBogmfTizrXAOI/b0CVINnqBVaDGqobTCh+jY=;
 b=BfBduqoK9g7/8b7ZJLz8O/ND6CZ7uRDcnDBnEk+7blvh0DpWrOBJDVA9zxJ2cSFWoT
 ohFAMsvYU3MB/Nh9Fq9zcmDlEnHjFWNYArm9E3yDtSWXZT00+z1bQ+CANhezOVwUOQez
 875fOABmFyIi7PO1MGLsupW7uUJq6oRKgsEt/IkP76p/i47l4xXmcoS203ryLJdK+k6U
 7vevZjeS1KGz+Mhw4IH/frNyb+/11xwwVhuO7eLwM3F6Og0fP2cQvQ7X2sdQPgjf5MxB
 oEyT3bA6XmRm17MAoRMsqTrzZYPvPXoAaRoXTEG8gPQH8HiRT56vz/rNTMXp8QXZINvY
 SWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734949165; x=1735553965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnesPOoBogmfTizrXAOI/b0CVINnqBVaDGqobTCh+jY=;
 b=QCpEi322W8C2Jm7xtUrf+HivSsaJwi76yjGlRlHxXGrCL6KKyiBn66Wt+6dfzj5GBF
 danO4NMvH7THZ9VkPwz5Je3di1yAVkUS8D/sIZc45gUhydqQ1P8S/Mj/Fi0bGfGIxpyH
 9XTlDo0cYkjK5qe/ZWxz4Xb3qfHyeQ33b+j71/YS2QfVpdRfmvZmsVp9eNTS/DpprRwQ
 BlKldKVsX710TpOOh6DBHqxBuQgQEOOOsq122mgYTNNKaV+BVNFKTWykSJmFvCATjk3C
 GmHLVKBMfSpzhVijaz3nC2mjL7enq2eri64xXxkf8ILcuIWZ087CR1RnTOcktb8kdk0z
 TrqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdrclByX5ySh4L3OdqGmO/UHprW67mZps55vL/pMdSQqRBaR1SwPBGe8iisSMv3JBmEDIFdZfwn+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK7k6pjezJhtwFHO1scRhcVpDmk5UeNJAWhdWiZfqcyavbGUcH
 r9SmTNQ1nMp60A00o1g/JkiuhrYEEl/1Vuedd1MDv0GEEt1/5AszZl1WrewEjNI=
X-Gm-Gg: ASbGncs6zzwXmR0MQWhaXSAzwIPSwCLRFrdKqTmhE1tTe1wB0pS4nOL1KAQq2KsFw1H
 WoGagcJREIdTMrroygY12S8c2qQhzrA0W+QoXO9MMsJDglDyWCLiPzYBwhUhDrDk5wvxMbqhoX/
 IfbXz7A/Mz+xRcQY3lbdmYJuwkkSk35IQIpVzaslgflGOI+/99ZuxGLl928ZBtBxCHXNkgHwre6
 dheEO/5xrcX557fSo1La3GcD8/ROwzOo9nTsPtjzQUOtWmRGuo/qUZsmX9vfppbnbZdo2kXP6vK
 XmOaXYmLeTlvAYCtQsDbrcGf7QzMjaDfpb+Y
X-Google-Smtp-Source: AGHT+IEw23MfyGYTc8glJDZiTy976C6MVASgHyhkl2j0BvJGjObs/iKQ3qhQ3Z+Lq3SBAqIGzeX/6w==
X-Received: by 2002:a05:6512:2350:b0:542:1bdd:511a with SMTP id
 2adb3069b0e04-542295322ebmr3296349e87.13.1734949164983; 
 Mon, 23 Dec 2024 02:19:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm1252468e87.247.2024.12.23.02.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 02:19:23 -0800 (PST)
Date: Mon, 23 Dec 2024 12:19:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-2-quic_anane@quicinc.com>
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

On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This triggers checkpatch warning. If it is due to c&p from some internal
documentation, please fix it too.

> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 48d08eeb2d20..ff144f0aa337 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>  		if (err)
> -			goto fdev_error;
> +			goto populate_error;
>  		break;
>  	default:
>  		err = -EINVAL;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
