Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF08C9406
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D84310E1C1;
	Sun, 19 May 2024 08:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wiOCOSJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034E10E1C1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:39:02 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so38905911fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716107941; x=1716712741; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0cb4fPfYgzOYuW1pgv7CvKiZmFOMdUrHUL+6WZbiuXk=;
 b=wiOCOSJYXCAMkcjUsbkjx1ub22ODgeX0KAH+OuZHd/EADMsV0vJwyn0M4QEJB3c4nD
 ceZhdOLhqdkpTKys3MFILqXOjv/rhMwaiQHdHGQj94rg+M+y87aHSPE/ug0eCIV55v/J
 PCfmXoGPonjCnKKHxTyD10gXCzTXAPgRqegnm4tyUqjaoI59zfDKec1nOKSAq8EwilUi
 jzjRLPZM2TCiUgciOPGpvWlmE+GBT1UP2V7uaEWXYXsKeGX/4a7/6FlnXanibWZO5mmK
 d5RB2qTRT/pHKgwjisyMi4zuTFEQwF3TQjkjy4lrfcUcpsZbLD79srXcgODQ38Gg3m+8
 P3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716107941; x=1716712741;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cb4fPfYgzOYuW1pgv7CvKiZmFOMdUrHUL+6WZbiuXk=;
 b=SbJfAp7OpWdotDcxLB598T29UcdJ5Ccj5yAbgJv762w0hbfJLedewwYYbWFTGggdNw
 ZtxX34svWYaX5c/MxCQPJieJsKgjvI3fIq3ZT/YRa7yr5pOFBnU4Fi8avTSMKUVsq2KI
 hxi0TeqEuba6+b0835UG+XzKR76prpPAm/8dFF8NXV9XIwC05NE2c245O/kbmVCYjz9S
 FjyHllSd3CFPBJtmUafAKEOOmdpkZ6wesQ4uCKR6YraY6ovxpKWX9uk9xPDNLnAxIzWH
 t4zksFzfjCIWA+IJ47hNGrKx3h4N+mbOFvoUAKGXUP1a6M+Q1Glo7zXwZ8EFUmcw3W3A
 NMAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRROyGjLLmSqtbv1whTmShrOj8FL3UhYGnrIe+NOUIJxk5hqDq/MGPyalEEaoZyOUGEFj+519wmdVK/7qshMmXDZ0E/VqTjqpWWTfK9Y+m
X-Gm-Message-State: AOJu0YxCqbAOYnb6LlF+V99l4k3RaluLfy04IbNmw/aJciJp7LRQ9Cxk
 gKxVSruqZRmwuxnZb5RIaAoyjmm9C/5LnD1r5qAGpZnaQ9602F8C6hPgmlDX+Ko=
X-Google-Smtp-Source: AGHT+IHYefh+mQmjGIqwtgVnBkjoxCYLHGVhRTDgsf8KtbzOLp5gK7ayorEtx6Nc/vIW66BM9/XciQ==
X-Received: by 2002:ac2:446c:0:b0:523:5dcc:c72 with SMTP id
 2adb3069b0e04-5235dcc0ea3mr9528424e87.57.1716107941093; 
 Sun, 19 May 2024 01:39:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba912sm3790508e87.75.2024.05.19.01.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:39:00 -0700 (PDT)
Date: Sun, 19 May 2024 11:38:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display
 mmu faults
Message-ID: <uywsmpko7ttzqxtlw6i4n5y7zvny5xgdoxc66azbts7cx6vi5d@myrilzxtu7le>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
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

On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
> In preparation to register a iommu fault handler for display
> related modules, register a fault handler for the backing
> mmu object of msm_kms.
> 
> Currently, the fault handler only captures the display snapshot
> but we can expand this later if more information needs to be
> added to debug display mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index af6a6fcb1173..62c8e6163e81 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  	return aspace;
>  }
>  
> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
> +{
> +	struct msm_kms *kms = arg;
> +	struct msm_disp_state *state;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&kms->dump_mutex);
> +	if (ret)
> +		return ret;
> +
> +	state = msm_disp_snapshot_state_sync(kms);
> +
> +	mutex_unlock(&kms->dump_mutex);
> +
> +	if (IS_ERR(state)) {
> +		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
> +		return PTR_ERR(state);
> +	}
> +
> +	return 0;

Hmm, after reading the rest of the code, this means that we won't get
the error on the console. Could you please change this to -ENOSYS?

> +}
> +
>  void msm_drm_kms_uninit(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>  		goto err_msm_uninit;
>  	}
>  
> +	if (kms->aspace)
> +		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
> +
>  	drm_helper_move_panel_connectors_to_head(ddev);
>  
>  	drm_for_each_crtc(crtc, ddev) {
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
