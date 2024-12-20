Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA89F8D66
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 08:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38BB10E100;
	Fri, 20 Dec 2024 07:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UwGHsMWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03810E100
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:42:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso1572795e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 23:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734680569; x=1735285369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MMf0ktzYAxvbWhoZv2EKwNd/4v1glW65xIb5pyiK7eo=;
 b=UwGHsMWa2GEHd0JdTX6rYwJf86eC8EnuXYZrLLJ+XsB1pu/i3AD4hWZotGBzTmuyXi
 vc5lyxy9djmgkL92PFALRvgdyHMMSTGEmIVLOHlikb3b+O1AjGrv/exhowkytzehQpsZ
 YoDVysbarnQ1eJShVW5zNxS2PgWQOmn2jFpfHJsGyj8FpC9eSNQNRb6TtjUayfq786qU
 ee5zy5u+fRxg/NQScsQV2VAZoPmXUftaZXQiHY75UECCHl+gptkG4XFsGA1w+WSQ9hw6
 hOqzXZ1hXRWkih00G0fgJsPWXKP/wZbKwXbflNzN1Z9UUdB/jTnYwN+tjOOzP5MlZ0BL
 oYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734680569; x=1735285369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMf0ktzYAxvbWhoZv2EKwNd/4v1glW65xIb5pyiK7eo=;
 b=Ae2bW7tD3YzNEzlj5Jgjq5Cc6tSpgAJMXIIC6E2hBAQT0cOiKeA3NLdMJ9LmE60gHJ
 g1frecRE29VIVkDpBUjhnTE95GWLmjpCUEbIfo0lYax5FCLEWeu0aJKmgH0gpWBkemyS
 wASIiib/dJ2qIWy6RGZsba4SaJ5blxMD/pLSoZOs/DsKUXCGhuHfrxRJWN94SUGYNUJW
 ormWEDUMrv+k8unvlh8YYJcbsrXxqoyCSGt0lJPR4Ql6YCgW4p7oyAHvlKEei0hITpfL
 TZ/M4GhD/01PfzMQ8ZKO7+aCQ+oIUwZfOiXSQKZHt+HvP4KmvBxl1BoyO8gaiTDXIFC0
 QuGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU/ODEyMo1xOMXayP7yUIZusIUZqrSzcreQx/FR+Kbp+HGvD0VYp92WePv5cFIvpgVOdG00ok0MqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/u81N3f65QU3LHEaK9T7/45i2u0XApt6MCtRf1MLmmjzc/ip3
 XyTvmsQOx6Ns8WiZRbgcVnQBfNiwKCl+kpCoXE2NUG2N+kkxVwIbSSNYsBXmPhc=
X-Gm-Gg: ASbGncstF19u0EAnoQDeJpmCyQxlTQGLc7lsQwVtuFPfPW75vLYuwu23F66zEOiWXyw
 bKgX4BW5B7l7fCONPX1uOUpTamrQ8HuwuLojRGGKT8NaPvBhfE7kHYdbnWwDG1a18paIF61aN8g
 FRmvi1+ciw/t9XrgTWnWBD1DTGo0T8XtvYL071NjWJrBAFXNdEnPMOTGKLr6DslCVa+vBNXE6dN
 qhzfLm8tOB6jf1KlCuGHpDONMxCoijePhk8rFlb7fj/+gDa926zjSmO30XUER5ZGcVGPP+VtTkZ
 kQE7zHsL8ARtW4bQmNzKRTuq032ExFRGh+VA
X-Google-Smtp-Source: AGHT+IEr2m5nVAnM2oVA+XlqIyj+MGkgyIXH0Mvf++9V/yDvxNczxdMg0p3NVrqpyxhiC1HTBPjDLQ==
X-Received: by 2002:a05:6512:1055:b0:540:2223:9b20 with SMTP id
 2adb3069b0e04-54229597f42mr515113e87.53.1734680568766; 
 Thu, 19 Dec 2024 23:42:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b096d3csm4541681fa.122.2024.12.19.23.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 23:42:47 -0800 (PST)
Date: Fri, 20 Dec 2024 09:42:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: ANANDU KRISHNAN E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <gq4wy7omvudevcmkb4ksfimul4ftfpmd622kxxlbvodao7gxoo@7nzx44jocn4s>
References: <20241220061854.24428-1-quic_anane@quicinc.com>
 <20241220061854.24428-2-quic_anane@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220061854.24428-2-quic_anane@quicinc.com>
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

On Fri, Dec 20, 2024 at 11:48:53AM +0530, ANANDU KRISHNAN E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Signed-off-by: ANANDU KRISHNAN E <quic_anane@quicinc.com>

Please fix your name in your Git setup. The patch misses Fixes: tag and
also cc:stable.

> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
