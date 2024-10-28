Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39189B31A0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2410E4A9;
	Mon, 28 Oct 2024 13:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="var3YEaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB1810E4A9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:24:39 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53b1fbb8be5so4278850e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730121877; x=1730726677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NMNuqUjYdGsI/ewyp+O0XBZx++mguLN0/SFzlXkx3Qs=;
 b=var3YEaGe+rXkUhTcA4ff774P6stANcbA4gTlnEjRhpmsLBZKLnkXysblg9p3TdZ0b
 uIKRE8ZOU9m1cal8FNJo6PG494BzYpD+tKGSmsa/X5OAkOUTsSit5mOlwUWZz5oRt+th
 vN0pY8UzxQC5Y9I2O/YthSC0C4hBm9/AVPx3HbItgCjFK8l4E6bAs2pNiHIc/+pvhCkJ
 sZxov42mtLrC/lx4ovlZeLrqc9D3+TcbvnoNvYmTU5LClWZlACaArr0gjYB/xndpLXbH
 t7Zqx50qs80XsDNzXbkoamwrbUM+HvrEO8Q1nt5MX13OOJEWR5ypCIFAn+24BESnUlV6
 9jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730121877; x=1730726677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMNuqUjYdGsI/ewyp+O0XBZx++mguLN0/SFzlXkx3Qs=;
 b=AMH9smw15sPoibdtvwSJRZ3y2WjxtHbM2BHecCNzGcwayNY010pZurLTsPzrHTKOjs
 2uK7hxzGVwqlPxDHWsRttEQZBOJzK+huITDyTo5dWNN5ye5BHqTm/u8tX8rMN5SL1q4L
 jMGEuTnRSdT3bZKPAJsvH7CqqZXtn3XRh2Bf+kK8jdIfAflR1c7ZDZEQZE1lYiJp5CeJ
 5aaZh9N1RnwM7DtrMyZ5TePPDrWl4wVCss06YAbYKU7GIOnDlLHBmRhCxBdZoHWjla23
 UWUSW8N8kHxic5X9jVMYuTWWL8cdYebEAabzDWDZ81wwo8uHukh6nKP5DQebFkkkT3dt
 lp8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEjA7ZSwMDl/mjeNpGIexiNXUJAsK9bS1IsAevo8f8qOUh7H9q2Giyo2vT4JT8lgcYW6rLPCcHKhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDLKryYobE+b4kIw1yBHPnGh2hVKIsjdJUfrRrtlPWn9Y3PiTF
 zcTC5VzBJQO8Fa+hnJ89oHTvp5yHnssdv4QDQ67HanzUkphiKYjGD5KnZiYjzZo=
X-Google-Smtp-Source: AGHT+IFlXAGD3sK0EGlwnEyIN1CvxY4RrY4KK2nu6cRisAMsP9krXv9MwqNzhjFQoZf2iPSWh3OkvQ==
X-Received: by 2002:a05:6512:1190:b0:52f:27e:a82e with SMTP id
 2adb3069b0e04-53b33e4fab9mr2642044e87.21.1730121877021; 
 Mon, 28 Oct 2024 06:24:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1ec88fsm1069465e87.282.2024.10.28.06.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 06:24:36 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:24:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/client: Remove unused drm_client_modeset_check
Message-ID: <zvhtltfbu6dpwri7yuwwrpnno6g2hu7tv2q7ua73epfj6gi5e6@x2snh7otbalb>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-6-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022232934.238124-6-linux@treblig.org>
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

On Wed, Oct 23, 2024 at 12:29:34AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_client_modeset_check() was explicitly added in 2020 by
> commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
> but has never been used.
> 
> Remove it.

If you are removing it, it makes more sense to revert the mentioned
commit completely, dropping the third argument of
drm_client_modeset_commit_atomic().

> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 24 ------------------------
>  include/drm/drm_client.h             |  1 -
>  2 files changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index cee5eafbfb81..69e1ce4d18cd 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1126,30 +1126,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>  	return ret;
>  }
>  
> -/**
> - * drm_client_modeset_check() - Check modeset configuration
> - * @client: DRM client
> - *
> - * Check modeset configuration.
> - *
> - * Returns:
> - * Zero on success or negative error code on failure.
> - */
> -int drm_client_modeset_check(struct drm_client_dev *client)
> -{
> -	int ret;
> -
> -	if (!drm_drv_uses_atomic_modeset(client->dev))
> -		return 0;
> -
> -	mutex_lock(&client->modeset_mutex);
> -	ret = drm_client_modeset_commit_atomic(client, true, true);
> -	mutex_unlock(&client->modeset_mutex);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_client_modeset_check);
> -
>  /**
>   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
>   * @client: DRM client
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 560aae47e06d..e1fd32adb3e9 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -176,7 +176,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
>  void drm_client_modeset_free(struct drm_client_dev *client);
>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
> -int drm_client_modeset_check(struct drm_client_dev *client);
>  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
>  int drm_client_modeset_commit(struct drm_client_dev *client);
>  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
