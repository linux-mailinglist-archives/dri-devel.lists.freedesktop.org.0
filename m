Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E43C1AC2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0C6E99C;
	Thu,  8 Jul 2021 20:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD476E99C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:57:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d2so9241950wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EPAE+lpM3FHyzbvUbBJ+5jGTzK9kOd9djjgpEHImG9s=;
 b=ZJ711D1UXqcJBIpZop7GgK9mTIgusjcd1Jbueyb7Xji3CD8FhWOlbKarWOC/Nc8TeB
 eExSxhj8w1u+TtL4LYR5tLQ+8iWqRxPGDwIld064lDiq+4pbEG5s77eNOM40Zukg1ary
 QJwVcA8eL4mEfKZUtO3PJojiLF4PeE05w8NQgcsMLQ1gOFb4yMT4VQWC/kbQ0kqp7llt
 9MbNF0WYZAAx8Ys5UYCbtRemVGYB8jjqx6eMXPARjuvtRwn/BxQqQ6/xYeTh6r80ldjV
 iV71m//IOVO8eHLafmKY55KV9FeoC12I80yS4qGiLvDin1ihElefF9GlTfr7r5q5jZC6
 qTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EPAE+lpM3FHyzbvUbBJ+5jGTzK9kOd9djjgpEHImG9s=;
 b=F0qFbCYi0mJgDQUDhwLnjlrtq8b0JFSDJ6VC6s+t8ohQSE1Iv0dyeaZIB9lCcq6TSb
 6ilCbG169YvigtA3PltDAeJyXx4eBO7Rro6wmjGFc2Mdb1bqUSxOjgVAdSs3svitkQtm
 wKv1sJ+HTe9dgJz78dH5+LUJGtoFGFuw0nJPnrcbxXMxZRwUs693VEfDWr3vVWZhy0ta
 150VT5IHM5Ip/wUEIi9Vp2skc22DKKYJYoaktO8lUtOpFDTiqK3q9C3nHZVkrh/UjDbb
 /Cl7PBas60e2mvTuZBxl5PzLV2qUL+zFO4KbA+nPZf9d/4MMOQLF1IAf1dTBqk6EYRHM
 YYxg==
X-Gm-Message-State: AOAM530O197nAH17zKF1dP4wwqNaCmc3rObC6aZM8zMNBRiMbAwhDfi9
 0OtC/ZdgSAb3d7a+4MYXjQQ=
X-Google-Smtp-Source: ABdhPJzc3BUgRsCo4j8YWsiPyuPWmC8LBjRKZV7oQS8ZIkLaxjNlnqN0goM4Ec4xM2vdDpA7vA/NHQ==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr5081320wrq.310.1625777861528; 
 Thu, 08 Jul 2021 13:57:41 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id v18sm3812578wrr.54.2021.07.08.13.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 13:57:40 -0700 (PDT)
Date: Thu, 8 Jul 2021 21:57:35 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: Re: [PATCH v2] drm/vkms: Creating a debug file to get/track vkms
 config in vkms_drv.c
Message-ID: <20210708205723.ldo3pll7qcoblfy7@smtp.gmail.com>
References: <20210708092002.11847-1-martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708092002.11847-1-martinsdecarvalhobeatriz@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/08, Beatriz Martins de Carvalho wrote:
> Creating a vkms_config_debufs file in vkms_drv.c to get/track vkms config
> data, for the long-term plan of making vkms configurable and have multiple
> different instances.
> 
> Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Applied to drm-misc-next.
Small issues in the message were handled when applying.

Thanks,

Melissa
> ---
> Changes in v2:
>     - corrected subject to make clear in terms of its purpose
>     - corrected commit message
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
