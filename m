Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94D3BEC7A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827F26E141;
	Wed,  7 Jul 2021 16:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD46E141
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:43:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso2115102wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N1jcO0yI6pPJfzDKfj/96aZNPkzpA0/0vrFttiKfOXA=;
 b=HDl8nggq4jDLWfJVaXoLXI/XGpjg42wmsm+lscbHy6pywD9OsuSlUU2o4MTcvDEcpx
 cbErC3do9h7aOzQGK34uVcpgujTryhxd2V7ir+rKQOIMJO0b3+QhwRtK48bXTSQauWYy
 Dx+TwiTMO1mP8nLA+VAWcnBW+5NqGxa7pyMduyqIObWXu+3a4+E9chHaIUZ62Bm7Xk43
 HlxKyjExZmvO/D6kSbAP0Mm/ueEBmxBh1U5UpJ3ozdnH04G6hXBtCAvnrLlDOZNZQXeP
 DEgg/9ZkBMuvVESagNWQWbBzaTYvz0W28MntvUDeAertPvsyeTjRJxnNM4W12tG4IhVm
 KuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N1jcO0yI6pPJfzDKfj/96aZNPkzpA0/0vrFttiKfOXA=;
 b=kPyVRxgP5G+WoU4qYTg6ARmmj5aTG7tHU3uVWPsHK8yRSWmoReOISex7SlQwUfPTTn
 JEsVl+uVG+nNkbbyHi/UWRJ6BCHeAKtyEs5P8CHrtL/2ktMLBYUPJA8kZITgjUiQIJKx
 YadIODvuJ0cRDIJgtufZZYOV6IyYXAd514kWNG3DLhCncbC/eEzoI/51ofi+p8HCAmOw
 uTBF2zU29uHyYfRDm4S3Y+E97aHWEvuiucwjxw489qLhwQIutz7x4WapTH42nuIv8qhl
 LREm27BFBveOrnoo/W2Q0BjtawEIvwAu2ydwnGQNVog9n2hTEKErVEIemgSKtw7OwtSY
 vSLQ==
X-Gm-Message-State: AOAM533aCoat/EpS2Ftu7Ss9D8CTO33eAmAYyUe59i59eDe4uszuFD7X
 ThRbpU0VRVMY6/LL7f49c/g=
X-Google-Smtp-Source: ABdhPJzFJteyECZADdOlPal4VNNMEErlmEmuOKU6GXF0Wkq5u+/+j2Nfx+9GJyf1xeL60s+aZhTUVg==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr556224wmb.156.1625676195123; 
 Wed, 07 Jul 2021 09:43:15 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id d8sm652693wra.41.2021.07.07.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 09:43:14 -0700 (PDT)
Date: Wed, 7 Jul 2021 17:43:05 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: Re: [PATCH] drm/vkms: Create vkms_config_debufs in vkms_drv.c
Message-ID: <20210707164244.ktmizbd6gbuifu73@smtp.gmail.com>
References: <20210707092927.336244-1-martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707092927.336244-1-martinsdecarvalhobeatriz@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07, Beatriz Martins de Carvalho wrote:
> Development vkms_config_debufs in vkms_drv.c for the long term plan of
> making vkms configurable and have multiple different instances it's
> useful to be able to get at the config of each instance in debugfs
Hi Beatriz,

Thanks for your patch.

Changes lgtm.

However commit message needs small improvements. Besides typo, it would
be good to make the subject clearer in terms of its purpose (creating
a debugfs file to get/track vkms config data).

Please, address these minor things and add my r-b.
Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 027ffe759440..c81fba6c72f0 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -28,6 +28,9 @@
>  
>  #include "vkms_drv.h"
>  
> +#include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
> +
>  #define DRIVER_NAME	"vkms"
>  #define DRIVER_DESC	"Virtual Kernel Mode Setting"
>  #define DRIVER_DATE	"20180514"
> @@ -86,12 +89,37 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  
> +static int vkms_config_show(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *dev = node->minor->dev;
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +
> +	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> +	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> +	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +
> +	return 0;
> +}
> +
> +static const struct drm_info_list vkms_config_debugfs_list[] = {
> +	{ "vkms_config", vkms_config_show, 0 },
> +};
> +
> +static void vkms_config_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(vkms_config_debugfs_list, ARRAY_SIZE(vkms_config_debugfs_list),
> +				 minor->debugfs_root, minor);
> +}
> +
>  static const struct drm_driver vkms_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  
> +	.debugfs_init           = vkms_config_debugfs_init,
> +
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
>  	.date			= DRIVER_DATE,
> -- 
> 2.25.1
> 
