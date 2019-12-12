Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA211C899
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012266ECC2;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038916EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:18:14 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id az3so189059plb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 23:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
 b=RxxXcjFLgonLF4fmVQ9Uh8NGPA48JCLXcBG419PPiBNe6e/fN4bT3KGOPvAsCdib1s
 CV7whYpnFFggopMXHXah8xrpY8aY0pwmZyDzR08smFDcAuwxKR2Sa4xjVGgiJxBQSm6Z
 5i9ViaE59/8nrQrcp9mRVH41oPVaQcU8Qr9ZPo2HUPw7SVcP/osuBNIHgu/RtPlKNbX/
 6yxBEheHDeIB/oaTQP6sATllHhzDBVffb30K27VGcaJsenKqYw9gcYYxM41KUnIxeoaZ
 V2bCnEheP3IyYIt7YqG/Z8nuhlfHRZ1oqmKawJHvW0upRhf0JvSBVVrFJPefVm2vbB3O
 4qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
 b=met3quoXT8R1a3378clvVSvHU09M+cPlcC9uxYITojDxNurGv1Ak9EdCc56am86DIF
 mBhBF+R4w6ad3rsQmatfECbmR55IbYdB1YZRpXoikvFxAp/0AAsocSTATm6/Jo9vyPr5
 Y5ZP1L68bQyQRyTz8AQmGwzpMsdcQlIUc3Y6yhL08+/cKQDwWakB3CbZJ79mN57kg3US
 JQrsU+SmJhw5yPHnaJ2HEUOtl3QrZ2cn1Q5L3SvgbzXlz8saqq1i+P0q9TAnXc9aQSYC
 GiJXhUvJSt/+oLajT/SuSj/SA+eowBHsM7KrjtvsWr1L+44Ak7qXXcmvYmlwTbp2vYH6
 P5/Q==
X-Gm-Message-State: APjAAAUPaLCKhxZ+dLgMHr3VZwzEv0rsTdCe8KzsnYYxWLAaRIMHgfGQ
 Lv7SYaPPrJ55fN/cbbigAxQ+9A==
X-Google-Smtp-Source: APXvYqy+m0lCq/UpeupyAuDYMkcEh9rkfCM4GG+6qHKYU/CjEuXA+ig6axKgP0DJrVQrHbcsf678BA==
X-Received: by 2002:a17:90a:2808:: with SMTP id
 e8mr8279272pjd.63.1576135094383; 
 Wed, 11 Dec 2019 23:18:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id i127sm5601071pfc.55.2019.12.11.23.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 23:18:13 -0800 (PST)
Date: Wed, 11 Dec 2019 23:18:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 4/4] drm/msm/a4xx: set interconnect bandwidth vote
Message-ID: <20191212071811.GN3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-5-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Set the two interconnect paths for the GPU to maximum speed for now to
> work towards getting the GPU working upstream. We can revisit a later
> time to optimize this for battery life.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a9e89e..253d8d85daad 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -591,6 +591,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.
> +	 */
> +	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +
>  	return gpu;
>  
>  fail:
> -- 
> 2.21.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
