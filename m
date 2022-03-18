Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC114DD7AE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 11:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2110E93B;
	Fri, 18 Mar 2022 10:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200CE10E93B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:09:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so3768012wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jit3dOPH8T/QhXM9zfC9zlUSFCcw1fNy8s+Yd/FQSy8=;
 b=G1zlVCVf4K2m61DKg+6PJ4mMhL8cdwI9gtkFd1S7PYffToqq7bCRFErAOsG1ZEDek3
 aHe2EoIm5aIoX20CGOhkYH13BS0UDBZ25XIoC1q7uxk8Vgz3ffzc929cqSauKzSt9E3K
 cTxFcwlBwVME41Y+x75rauRXPqr/pyVUOyVPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jit3dOPH8T/QhXM9zfC9zlUSFCcw1fNy8s+Yd/FQSy8=;
 b=y0LG8w/+VuVzMYs7ASzZvL8DC91A4j8aAxXG4nD4S4797gSWOBUpERR68hqPRcAaNS
 bDVtMkmush9Ps+fDA0VSpU/zylv9959AkQQOdNeInkDTEFlj6/uzJnYA2tbOETOZDAmt
 m8NQdbiaZTMyqIR6wPyJlE9EOnRbkR1+O9ppDBppHoE18eAxzaUB1Ub5UTrFcGqMvLtr
 uqlyXichy1Q+c3qxxzfXp295ITmKoDZt/SoXgCw8+N2jAgh9Z/q7btD+pT+cnIv92pRd
 jMtue4YaU8piJXhQM1b626adTWTo0Yrxdw/SZrTmDARs1qvFQOXWYmTI7hOs0zr7lM2K
 JdQA==
X-Gm-Message-State: AOAM530WP6UeUR5CwkheB01GSZBTZtUDB+yy8dns8nTBjO/rOaqXcHWy
 QY1pXVRDqSumc8jJJngA/2Aip5dzVYozPfbOI4s=
X-Google-Smtp-Source: ABdhPJxL8Pfg5MORW2HP1l7pJyS0p48w1huGvtn1FO01TLcqZPQDk5GlKDYUiMuo5mKGLJ/xL64nRQ==
X-Received: by 2002:a05:600c:1550:b0:389:d623:cb7f with SMTP id
 f16-20020a05600c155000b00389d623cb7fmr15276939wmg.183.1647598176614; 
 Fri, 18 Mar 2022 03:09:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b001f0494de239sm6036704wrr.21.2022.03.18.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 03:09:36 -0700 (PDT)
Date: Fri, 18 Mar 2022 11:09:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] drm/panel: ili9341: fix optional regulator handling
Message-ID: <YjRaXoH9echQXSdp@phenom.ffwll.local>
References: <20220317225537.826302-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317225537.826302-1-daniel@zonque.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, sam@ravnborg.org, thierry.reding@gmail.com,
 dillon.minfei@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 11:55:37PM +0100, Daniel Mack wrote:
> If the optional regulator lookup fails, reset the pointer to NULL.
> Other functions such as mipi_dbi_poweron_reset_conditional() only do
> a NULL pointer check and will otherwise dereference the error pointer.
> 
> Fixes: 5a04227326b04c15 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Merged into drm-misc-fixes and added cc: stable.
-Daniel
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 2c3378a259b1..e1542451ef9d 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -612,8 +612,10 @@ static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
>  	int ret;
>  
>  	vcc = devm_regulator_get_optional(dev, "vcc");
> -	if (IS_ERR(vcc))
> +	if (IS_ERR(vcc)) {
>  		dev_err(dev, "get optional vcc failed\n");
> +		vcc = NULL;
> +	}
>  
>  	dbidev = devm_drm_dev_alloc(dev, &ili9341_dbi_driver,
>  				    struct mipi_dbi_dev, drm);
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
