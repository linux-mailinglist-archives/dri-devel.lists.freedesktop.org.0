Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A633A1CB8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B456EA8E;
	Wed,  9 Jun 2021 18:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DCF6EA8E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 18:27:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3634602wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nXtC0TTdpsHcuJUUWVG3Np34/AsLwocmzwBcXSxRj/Q=;
 b=HfJ/RZQysPk9QdXC8tT3qAef2KiC/W+sa6+C3chbhaVnx4s3fINdbcMIx+9/WYp9Ua
 rSGvTtXkki9nHMB1d7HNACqPqJeHqK2bfGV+19jQTDbP1WsfyIYbktcvzyzDvAU2yXFL
 ODRmwQ5LfHMJpdwV7NzdRP4uKcVDzxULIXu/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nXtC0TTdpsHcuJUUWVG3Np34/AsLwocmzwBcXSxRj/Q=;
 b=nwkUOrIykQvkEcLWZWYKw0xupVdONtnlIgkzD/EhIPMPrNa+tGZdvyHP3GP4ZvCT9G
 DqnCZxl33RZfbq9JMLh+rcb5+mzxWBG6xsBLv1yxAgJKc3bJx/2U6ZH2Ikun9WPdD3Of
 2/OuIVnlRUDUJ6MGXHQ+V7ZdFapc+jDXWHjw5pDf4TgH7RS4D9OtCau7glrmHxiARH0u
 37JsW3ZNIVURS8LQJka9HYl1pTbPfNH2c3UHs++k1Bppv3xfR8atDh7znuiejX6mxLFZ
 Zaarv9KpkNEBSVbtgeQyiNT8wfV3c7uuvMGGbhKop9YgMfg/2XRSHM+YprUrV+Ae74xw
 hsVQ==
X-Gm-Message-State: AOAM530ySyIYwCEcAgkRUjM1vyI6fcADa2jIn2j0uif9aEsJA2FqyLAU
 56Owily6jS+CqDr07+Opk0wH6Q==
X-Google-Smtp-Source: ABdhPJwf5wymTOTx4isyKDiYxTSKvgQu1tFsxGtgpCUiybvhgJ6aZdFSBsjZYd81Y0DX08g0jbU2eg==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr10873557wmi.26.1623263267661; 
 Wed, 09 Jun 2021 11:27:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s62sm7585504wms.13.2021.06.09.11.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:27:47 -0700 (PDT)
Date: Wed, 9 Jun 2021 20:27:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 02/10] drm/arm: malidp: Use fourcc_mod_is_vendor()
 helper
Message-ID: <YMEIIDl3ftlQyWCq@phenom.ffwll.local>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145139.467072-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 03:51:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Rather than open-coding the vendor extraction operation, use the newly
> introduced helper macro.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On the first two patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index ddbba67f0283..cd218883cff8 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -165,7 +165,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
>  		return !malidp_hw_format_is_afbc_only(format);
>  	}
>  
> -	if ((modifier >> 56) != DRM_FORMAT_MOD_VENDOR_ARM) {
> +	if (!fourcc_mod_is_vendor(modifier, ARM)) {
>  		DRM_ERROR("Unknown modifier (not Arm)\n");
>  		return false;
>  	}
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
