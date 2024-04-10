Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBC89ECEC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E939611322F;
	Wed, 10 Apr 2024 08:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LVQZZ0xr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3462113235
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:01:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34602c11302so255147f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1712736108; x=1713340908; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kOWG9GwkJxWE9bTNclMskdbXbIkh5Io7YnBkhyPxiLc=;
 b=LVQZZ0xr4EaRiT4L2t/dcrRG1kxKbq++hHGiS7b6UBQuwIlCMvhr7sLhcGhTgkFIAz
 kU6Cg1rvS0hEzJZekMlct4en4iKCz4Yjokcw5lGHlcswd5RaiU/JChFv1H8uJawBG2rQ
 VWpE5OATM6X1co8aIlDLBWJeVszz6fmscq6q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712736108; x=1713340908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOWG9GwkJxWE9bTNclMskdbXbIkh5Io7YnBkhyPxiLc=;
 b=ASOlp+g4qL/WCjqdkFRMzDRl89wS8lsHMPgFJ6jFU1aAOeoU51E0RkO3CXm4ZROFOQ
 ilTaSLBsGDIhTnQOFoNPUD418OTTPlDw0B/Cgs5qUGq7RXXuSFtVs5xdwtgfO9x3yUpz
 ycT6z4ZLhK2n9mw1eGp8BVseOK7IwR9utxhH0M2Z4dqZAOTo69PZVPb1SzgRFYLb4VBV
 1ndJNfFnK3ihsc0YED1XWxDXeNIzhmqSkX38zxB/Zu0fLDDxLpYAdZgcKHCUwD7PGT48
 7V3LLBbxIAJ8Pfhl7mVYqWYI53dveY+OsarRcKTlv3ry5WvxjFWsmtnunKqxg4Q00lln
 Coag==
X-Gm-Message-State: AOJu0YxnjXovb4ZMgEyEZDn0iH5fBL8mxkoX2BXGxJ1p7+LQ3JobLVdc
 RXTzRfD1PQzdKsIgm6AYaA0RR1H2mpQffQyQhVHXzFlgEH1gNiSxeIpBQYkfBBw=
X-Google-Smtp-Source: AGHT+IEve2lpewQ+VAZ7Km+esDKIXLTICkThS9Fm9D7xeQndZUkuMn12wRZmdKmE60TOBLc2X/b0YQ==
X-Received: by 2002:a05:6000:c4c:b0:343:f2e0:449c with SMTP id
 do12-20020a0560000c4c00b00343f2e0449cmr1229375wrb.0.1712736108015; 
 Wed, 10 Apr 2024 01:01:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b0034403ee44b1sm10984777wrt.14.2024.04.10.01.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:01:47 -0700 (PDT)
Date: Wed, 10 Apr 2024 10:01:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev, gpiccoli@igalia.com
Subject: Re: [PATCH v12 4/9] drm/panic: Add debugfs entry to test without
 triggering panic.
Message-ID: <ZhZHaQrH0Ov7U89j@phenom.ffwll.local>
References: <20240409163432.352518-1-jfalempe@redhat.com>
 <20240409163432.352518-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409163432.352518-5-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 09, 2024 at 06:30:43PM +0200, Jocelyn Falempe wrote:
> Add a debugfs file, so you can test drm_panic without freezing
> your machine. This is unsafe, and should be enabled only for
> developer or tester.
> 
> To display the drm_panic screen on the device 0:
> echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0
> 
> v9:
>  * Create a debugfs file for each plane in the device's debugfs
>    directory. This allows to test for each plane of each GPU
>    independently.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

I was pondering whether this guarantees that the debugfs file disappears
before drm_dev_unregister finishes (otherwise we have a bit a problem),
and looks like we're good.

Maybe add a todo that it would be nice to simulate nmi context, not sure
lockdept can help here ...

Anyway Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/Kconfig     |  9 ++++++++
>  drivers/gpu/drm/drm_panic.c | 43 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f8a26423369e..959b19a04101 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -127,6 +127,15 @@ config DRM_PANIC_BACKGROUND_COLOR
>  	depends on DRM_PANIC
>  	default 0x000000
>  
> +config DRM_PANIC_DEBUG
> +	bool "Add a debug fs entry to trigger drm_panic"
> +	depends on DRM_PANIC && DEBUG_FS
> +	help
> +	  Add dri/[device]/drm_panic_plane_x in the kernel debugfs, to force the
> +	  panic handler to write the panic message to this plane scanout buffer.
> +	  This is unsafe and should not be enabled on a production build.
> +	  If in doubt, say "N".
> +
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e1ec30b6c04a..78fd6d5d7adc 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -495,6 +495,45 @@ static void drm_panic(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
>  		draw_panic_plane(plane);
>  }
>  
> +
> +/*
> + * DEBUG FS, This is currently unsafe.
> + * Create one file per plane, so it's possible to debug one plane at a time.
> + */
> +#ifdef CONFIG_DRM_PANIC_DEBUG
> +#include <linux/debugfs.h>
> +
> +static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	bool run;
> +
> +	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
> +		struct drm_plane *plane = file->private_data;
> +
> +		draw_panic_plane(plane);
> +	}
> +	return count;
> +}
> +
> +static const struct file_operations dbg_drm_panic_ops = {
> +	.owner = THIS_MODULE,
> +	.write = debugfs_trigger_write,
> +	.open = simple_open,
> +};
> +
> +static void debugfs_register_plane(struct drm_plane *plane, int index)
> +{
> +	char fname[32];
> +
> +	snprintf(fname, 32, "drm_panic_plane_%d", index);
> +	debugfs_create_file(fname, 0200, plane->dev->debugfs_root,
> +			    plane, &dbg_drm_panic_ops);
> +}
> +#else
> +static void debugfs_register_plane(struct drm_plane *plane, int index) {}
> +#endif /* CONFIG_DRM_PANIC_DEBUG */
> +
>  /**
>   * drm_panic_register() - Initialize DRM panic for a device
>   * @dev: the drm device on which the panic screen will be displayed.
> @@ -514,8 +553,10 @@ void drm_panic_register(struct drm_device *dev)
>  		plane->kmsg_panic.max_reason = KMSG_DUMP_PANIC;
>  		if (kmsg_dump_register(&plane->kmsg_panic))
>  			drm_warn(dev, "Failed to register panic handler\n");
> -		else
> +		else {
> +			debugfs_register_plane(plane, registered_plane);
>  			registered_plane++;
> +		}
>  	}
>  	if (registered_plane)
>  		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
> -- 
> 2.44.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
