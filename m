Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6D97E21A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164D10E20E;
	Sun, 22 Sep 2024 14:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BRLnHPgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FAD10E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:59:04 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f753375394so24972551fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727017142; x=1727621942; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WRVlfVpLc9FHcHudJGyIqnlngyV5hDJr/NHL08wSPBk=;
 b=BRLnHPgBFRUaCqHOHfiBIQ65e88zrtFQcu9kry3byCUjZU5kjpyjGUizfeSi4A+V6S
 jcf+WJmN0pJOub1PWau9ii7q+Q4+5ZtEi+t2hmO4wCfObi/dQl6IgXkmzfQMcEBPdtd2
 KVp8XXTV4NXCgtRnUJr8ZTt/v/7STc9RcIj8DM5zFp8V6BAl6JdN/tNEMbQBFNQWOtvY
 qYydQImQaWdip7BrE7rmcUfvN5+2+7AJe4ZHVO16mh8Z9+TT9UNi+X78m31M6vvRWjxZ
 /x40z1/C30HOEQAiIBP6Zt8Ry0MJ/KwEZ/wA+cpk+N7F5nD7C+BFXBeVTAepjk8pC5IJ
 q3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727017142; x=1727621942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRVlfVpLc9FHcHudJGyIqnlngyV5hDJr/NHL08wSPBk=;
 b=EUClIv1o0+CmjRVOI+K44JA48V7qLgFUeFWXx38khVMFWPyE21uquykN8o75/0GQlm
 mb5IQi/XXJbveLoolvp8CCwT6uf4W0AhqY8gK14Tx+80TtrZvGsVfqC4JhoT7HMNFX8j
 RAUPvxrCEXqR24L6hLgUmvV7gM57N+6x5KO7+vEUOCMzNqAa6r0OrbDyaiNFSHVLsgCw
 nxgSSIsthqhfavG4azE5QPSqTNACZtBcgIbD3PyHViKcDC0ltaT1GCZJ0YcicEVlcpyy
 CgpmLHSAgYFKHrWwU0qfymWtn1/ae6aqqCJTBkFRfwTj/xbHZXhp8cF/hN7CZIYWoDB6
 2Ymw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNvWHV6Nbk0l+BK3ZW9vxQyXNRk9Lk9ZsWx5Ku52PzmEVMOonIH8Am1hiuAPc93oTG7pq5VZiUFb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLtd9w37PbpDbLZCYlwo4dgE0ZX4fNZRmZFLbMpvs8pMAavWh7
 KHP77qGRdSaXJ/TMlVFrW7FXbQEfR+yC8s+3cj4+fEYxyI3rgsSlg9H54XlW63Y=
X-Google-Smtp-Source: AGHT+IErJoYMwonx3RpdmyPmJ/Pzin44DRxgCZHy3unFD5W/PYZ8gZQ4NI6urV/Ow7+IvTz6Ylx5lw==
X-Received: by 2002:a2e:751:0:b0:2f7:7cf7:474d with SMTP id
 38308e7fff4ca-2f7cc388465mr33065701fa.27.1727017142080; 
 Sun, 22 Sep 2024 07:59:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d37f949sm26072661fa.93.2024.09.22.07.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 07:59:00 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:58:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm: Refactor drm_core_init error path
Message-ID: <q2xtugg4itg3nxdhuiyrewqq63rexl2femkdewbx7rmc6oi3nw@3tnsi6xfqg65>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <3a659ed0-4072-4f01-9676-65d6b1a42678@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a659ed0-4072-4f01-9676-65d6b1a42678@gmail.com>
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

On Sun, Sep 08, 2024 at 02:10:30PM GMT, Heiner Kallweit wrote:
> These changes make the error path a little more robust, because exit
> steps in drm_core_exit() don't have to ensure any longer that they
> work properly even if the associated init step wasn't executed.

Please use imperative style when describing changes. E.g. "Do this and
that because of ABCDEF". See
Documentation/process/submitting-patches.rst

> In addition these changes allow to annotate a few functions as __exit,
> saving some memory if drm is built-in.

This should be a separate commit.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/accel/drm_accel.c                |  2 +-
>  drivers/gpu/drm/drm_drv.c                | 18 ++++++++++++------
>  drivers/gpu/drm/drm_panic.c              |  4 ++--
>  drivers/gpu/drm/drm_privacy_screen_x86.c |  2 +-
>  drivers/gpu/drm/drm_sysfs.c              |  2 --
>  5 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index aa826033b..25fdbea36 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -191,7 +191,7 @@ static const struct file_operations accel_stub_fops = {
>  	.llseek = noop_llseek,
>  };
>  
> -void accel_core_exit(void)
> +void __exit accel_core_exit(void)
>  {
>  	unregister_chrdev(ACCEL_MAJOR, "accel");
>  	debugfs_remove(accel_debugfs_root);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ac30b0ec9..ea59994e5 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1062,7 +1062,7 @@ static const struct file_operations drm_stub_fops = {
>  	.llseek = noop_llseek,
>  };
>  
> -static void drm_core_exit(void)
> +static void __exit drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> @@ -1084,18 +1084,18 @@ static int __init drm_core_init(void)
>  	ret = drm_sysfs_init();
>  	if (ret < 0) {
>  		DRM_ERROR("Cannot create DRM class: %d\n", ret);
> -		goto error;
> +		goto err_ida;
>  	}
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> -		goto error;
> +		goto err_debugfs;
>  
>  	ret = accel_core_init();
>  	if (ret < 0)
> -		goto error;
> +		goto err_chrdev;
>  
>  	drm_panic_init();
>  
> @@ -1106,8 +1106,14 @@ static int __init drm_core_init(void)
>  	DRM_DEBUG("Initialized\n");
>  	return 0;
>  
> -error:
> -	drm_core_exit();
> +err_chrdev:
> +	unregister_chrdev(DRM_MAJOR, "drm");
> +err_debugfs:
> +	debugfs_remove(drm_debugfs_root);
> +	drm_sysfs_destroy();
> +err_ida:
> +	WARN_ON(!xa_empty(&drm_minors_xa));
> +	drm_connector_ida_destroy();
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 74412b7bf..d00fdb12d 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -679,7 +679,7 @@ static void __init drm_panic_qr_init(void)
>  				   GFP_KERNEL);
>  }
>  
> -static void drm_panic_qr_exit(void)
> +static void __exit drm_panic_qr_exit(void)
>  {
>  	kfree(qrbuf1);
>  	qrbuf1 = NULL;
> @@ -1058,7 +1058,7 @@ void __init drm_panic_init(void)
>  /**
>   * drm_panic_exit() - Free the resources taken by drm_panic_exit()
>   */
> -void drm_panic_exit(void)
> +void __exit drm_panic_exit(void)
>  {
>  	drm_panic_qr_exit();
>  }
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index 72ed40e49..6be96a0cc 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -98,7 +98,7 @@ void __init drm_privacy_screen_lookup_init(void)
>  	}
>  }
>  
> -void drm_privacy_screen_lookup_exit(void)
> +void __exit drm_privacy_screen_lookup_exit(void)
>  {
>  	if (arch_lookup.provider)
>  		drm_privacy_screen_lookup_remove(&arch_lookup);
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index a713f0500..f8577043e 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -155,8 +155,6 @@ int drm_sysfs_init(void)
>   */
>  void drm_sysfs_destroy(void)
>  {
> -	if (IS_ERR_OR_NULL(drm_class))
> -		return;
>  	drm_sysfs_acpi_unregister();
>  	class_destroy(drm_class);
>  	drm_class = NULL;
> -- 
> 2.46.0
> 
> 

-- 
With best wishes
Dmitry
