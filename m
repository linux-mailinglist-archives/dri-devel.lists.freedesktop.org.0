Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E111C896
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6A06ECC0;
	Thu, 12 Dec 2019 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7336EC63
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:17:56 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ca19so637615pjb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 23:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=czAcFnKFTBHTdpHr0rMVUpWL5U0hh4o4DwfN6VFyqJ4=;
 b=ke8JfGsjS8dennR/6UzeEv5Ky07nDlsuqnCves+J9l/A8SzfCw3dDbm0FvPU7zeE50
 ibnlarpnP7Yk4PTd0n4/8GZ74y6D48nJT91NgaMECN+XbmSNrNwEoRSl6HZgnzDzcQRL
 ipJ8Ef0T5FoYcwzftdVlZMGiG42o1E14UYmrbm50oi+iTzX9uxmsBEFhCo3LF4cBfBqx
 3u+f0oMVVUW2KVL3wIGrSyehKcqtuIbtyJ9apC7tbS+JWiTclmjPmXD6pTWEB4h1IHvR
 gZLxZFomGlGjEDyVa+sL3U2kOBEx13fy5vri9rxTKzipfaYXUOTpS6rtwqxDYZ5bEwIP
 uEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=czAcFnKFTBHTdpHr0rMVUpWL5U0hh4o4DwfN6VFyqJ4=;
 b=qR/nEpVfuCfRXghrh2J8F+0grEHFVNueoETAQU8aIZ+9peo8Gq9nQPjokcDALwK+fQ
 kwdiUTgMC5azlgfN8k9taRxsDzcQvz2bq9JWR/EoBLDI/V9jNAURgkgi6JaXaTsJe8iC
 C61E5mq01MmII/ntbwMJphuf6Kk7EE6vJf8YaOAqf0GVPH63r5d++LaNQXePiNz7pDg/
 21kCYRAstZdortk9w0ulrBKHg5Zz8g8rMBD9kYqY9w8HIv/WR6+iUtUswA2NeWlmjlE7
 P21wS2gSriv4/ej+TAtQfWchUl2llR7yJrdUx80tIwIsDLS2zjAJ8M/kZPe/s016Ua56
 dWWQ==
X-Gm-Message-State: APjAAAVy7nRCSPONAvCnvhpV5zklcRi0BfnujEX5L6etIXphv2LeoAqs
 NmNXdA3FBOuAWh8zVrmnGlLwDQ==
X-Google-Smtp-Source: APXvYqwOlaHdCHfmxqXXIW1guuaCYDo5sz2f3PSVcR4quawA6l9h8sh7Xe4VvLvAmPVdP0SZ9CBzsw==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr8270089plb.130.1576135076097; 
 Wed, 11 Dec 2019 23:17:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id z4sm5681018pfn.42.2019.12.11.23.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 23:17:55 -0800 (PST)
Date: Wed, 11 Dec 2019 23:17:53 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 3/4] drm/msm/a3xx: set interconnect bandwidth vote
Message-ID: <20191212071753.GM3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-4-masneyb@onstation.org>
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
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 07ddcc529573..eff0ecd4e81a 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -504,6 +504,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.

I would expect that you have to worry about temperature before battery
life...

Regards,
Bjorn

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
