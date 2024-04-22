Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A748AD518
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F20112D24;
	Mon, 22 Apr 2024 19:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P9iNfJaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BD2112D22
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:45:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51abd580902so3136680e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815157; x=1714419957; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oczHlzSC/UPaNc2LgQ5vSBFQ2KcNspCQ4fkb6GlVJw8=;
 b=P9iNfJaRa1gWu7AEvsZpyrPZ7G6AGUFgFITrsW50vvR7zVj/hr+BixlGk1zxzf2QDu
 wfKMgyFwqetE+7cyfurwQGG+igykHJZWWF8iJ6mnIYrEzUiu5hTvC85YjQ0RYjHKJfOD
 5mYAkj2euhUwMqMGUelYoa2sqVu1ErjGhUQtox9l293wx0MVy51h7jA8i0sJ8ujA3odB
 9vZuD12m2W2hxKl94usr9tvDydWROMg7IMUgvNW5TIOvvmekQ0V8/+zH2S9a5SV7aJKA
 dNstxyTZEWaeBxGDdoCAFB1MN8OgmQnN230XtlQ4qDEfOMfK1peD+OWHLjO4l2/hJHCf
 uUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815157; x=1714419957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oczHlzSC/UPaNc2LgQ5vSBFQ2KcNspCQ4fkb6GlVJw8=;
 b=pFwiHSW7AB4uCgOj5EyZxF/8P3QZElBQrzCp6LgelWLcr+XmGZId82zMIw3g0hDETX
 Uh4NSku7648L5gkT53e3igojRdmSRx4riFv7MQVkrRxHOUp/KvJsB1axy4m0b1ni3UGk
 n25duhGXtejS7863fCWqOJ6CeffkUnwUvB/CdwB1d81Zci3iSJmVBg+P6emXkNE8M3Et
 kx4momfjxeFPK66v3ODT8MQoarwV3eMn+GVycERALatx/b7ZYcnkCmlJ25MrPutfwYbB
 8cS8hdSFFMSJhi1uMyfg6oQrnSLpgrwBOgOefxtixYvakgH6fkZwLNMnsZB1noXFBfGY
 wmwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRwy/pWZI+poP1vRxXUzlZKEd2xHmuEVP2I+x4lgWNej3fNYJrN9J7PUpUTVgH2ezVK+HLr7uvRX4WG+vaJIV6C3f9Lz0bDAyzrzT/icOf
X-Gm-Message-State: AOJu0YzWKOOoNf7pPu2yKuRm50PNfZ+XpQk5LNep66eMvyLY4p5vVC+z
 UwygKlLt4IPx5tqofyptt0wzbweNA3FPAG1u5ohoA/k3l392oXEGVDlDZOH4DAI=
X-Google-Smtp-Source: AGHT+IF14L/T9IvkeZrOwqfHcwk2Y0hm4EP/cfe8FF6+164kRjiuEYO6k5CY9HCaFE2rH8uTWbvqcw==
X-Received: by 2002:a05:6512:20f:b0:519:65fe:ac10 with SMTP id
 a15-20020a056512020f00b0051965feac10mr201015lfo.32.1713815157475; 
 Mon, 22 Apr 2024 12:45:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a19f50e000000b005194167c042sm1806503lfb.171.2024.04.22.12.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:45:57 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:45:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/mdp4: don't destroy mdp4_kms in
 mdp4_kms_init error path
Message-ID: <4aovv43qe3nm7uwb32b655lv54rion6lw4ofegi4vkr4si2y27@w3rvyvcw7mda>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-2-96a70f64fa85@linaro.org>
 <313d9eed-098f-c09b-eb5d-ac9ad56a8e1d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <313d9eed-098f-c09b-eb5d-ac9ad56a8e1d@quicinc.com>
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

On Mon, Apr 22, 2024 at 11:17:15AM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > Since commit 3c74682637e6 ("drm/msm/mdp4: move resource allocation to
> > the _probe function") the mdp4_kms data is allocated during probe. It is
> > an error to destroy it during mdp4_kms_init(), as the data is still
> > referenced by the drivers's data and can be used later in case of probe
> > deferral.
> > 
> 
> mdp4_destroy() currently detaches mmu, calls msm_kms_destroy() which
> destroys pending timers and releases refcount on the aspace.
> 
> It does not touch the mdp4_kms as that one is devm managed.
> 
> In the comment https://patchwork.freedesktop.org/patch/590411/?series=132664&rev=1#comment_1074306,
> we had discussed that the last component's reprobe attempt is affected
> (which is not dpu or mdp4 or mdp5 right? )
> 
> If it was an interface (such as DSI OR DP), is it the aspace detach which is
> causing the crash?

I should have retained the trace log. I'll trigger the issue and post the trace.

> 
> Another note is, mdp5 needs the same fix in that case.
> 
> dpu_kms_init() looks fine.
> 
> > Fixes: 3c74682637e6 ("drm/msm/mdp4: move resource allocation to the _probe function")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 28 +++++++++-------------------
> >   1 file changed, 9 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > index 4ba1cb74ad76..4c5f72b7e0e5 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -392,7 +392,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	kms = priv->kms;
> > @@ -403,7 +403,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		ret = regulator_enable(mdp4_kms->vdd);
> >   		if (ret) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
> > -			goto fail;
> > +			return ret;
> >   		}
> >   	}
> > @@ -414,8 +414,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	if (major != 4) {
> >   		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
> >   			      major, minor);
> > -		ret = -ENXIO;
> > -		goto fail;
> > +		return -ENXIO;
> >   	}
> >   	mdp4_kms->rev = minor;
> > @@ -423,8 +422,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	if (mdp4_kms->rev >= 2) {
> >   		if (!mdp4_kms->lut_clk) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> > -			ret = -ENODEV;
> > -			goto fail;
> > +			return -ENODEV;
> >   		}
> >   		clk_set_rate(mdp4_kms->lut_clk, max_clk);
> >   	}
> > @@ -445,8 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	mmu = msm_iommu_new(&pdev->dev, 0);
> >   	if (IS_ERR(mmu)) {
> > -		ret = PTR_ERR(mmu);
> > -		goto fail;
> > +		return PTR_ERR(mmu);
> >   	} else if (!mmu) {
> >   		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> >   				"contig buffers for scanout\n");
> > @@ -458,8 +455,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		if (IS_ERR(aspace)) {
> >   			if (!IS_ERR(mmu))
> >   				mmu->funcs->destroy(mmu);
> > -			ret = PTR_ERR(aspace);
> > -			goto fail;
> > +			return PTR_ERR(aspace);
> >   		}
> >   		kms->aspace = aspace;
> > @@ -468,7 +464,7 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	ret = modeset_init(mdp4_kms);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
> > @@ -476,14 +472,14 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
> >   		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
> >   		mdp4_kms->blank_cursor_bo = NULL;
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->aspace,
> >   			&mdp4_kms->blank_cursor_iova);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
> > -		goto fail;
> > +		return ret;
> >   	}
> >   	dev->mode_config.min_width = 0;
> > @@ -492,12 +488,6 @@ static int mdp4_kms_init(struct drm_device *dev)
> >   	dev->mode_config.max_height = 2048;
> >   	return 0;
> > -
> > -fail:
> > -	if (kms)
> > -		mdp4_destroy(kms);
> > -
> > -	return ret;
> >   }
> >   static const struct dev_pm_ops mdp4_pm_ops = {
> > 

-- 
With best wishes
Dmitry
