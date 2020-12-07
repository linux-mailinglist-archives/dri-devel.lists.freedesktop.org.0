Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07752D125E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809686E852;
	Mon,  7 Dec 2020 13:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C60489C14
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:43:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so12778918wrr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=arySWwJV+wO1szqOHqwMbGv0IrMvh0BzvNxFIFd0Iq8=;
 b=PuUjctRg0ix4IPPKWWOU5i27u4IN6AFGs95HRx35oh6qJgGxL86tNka1vVtamv5MH4
 m2Q9y+LFvWF2Yn/I8l1EgLWGbjrLQIQ/n3BwToBkrLzlRwUYPBaQVFDmJCWa2LwZSH7Y
 ds2dv91E01AQCa1LStgI0bC7wrrfdiECO9d18DqHiNyG+xiq+PLcwnoppYO4AZvGUqaM
 UV0jjJ2EHDrpjp4jsN/iEieuBkcciQ1sNhKoMfh8c3S0UkRNojpsxs6GiU1I3mRVOKgJ
 +avcHsgX0/Ug6kIY6UN4tF6h8bDAv01TElWDSOOu67V4K6LowZuwEVknZhXJoHraFL4n
 O+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arySWwJV+wO1szqOHqwMbGv0IrMvh0BzvNxFIFd0Iq8=;
 b=Y7mFwuFZ3qDuZkSyx8HerAeY0lLhsPGziDUKBr2ziS5ytGQsgI+hmFcH3x8HIEAjy5
 Olg+XL6vrqYZp8OBjv2yuYDFx2wsgLGZ74pzio69E3rfosjcrb6/tHGVDwwGLvOOSLtc
 YNlXI1H/bw1G88SN2qkDL0nyoVXFCOpZxEDzq6r+Eu1eVaVzD7feDBvMvmvr0RHRgll7
 72AsG5+AgyfDvYB82KNDRNJRnbX2EnCY2hcRofB59IxcnId2loiXpSV8EMLyfv390+R9
 OlGmMpjljxLXBZ6Fo/5D6pM9SgWDDX6kTRBKh9yRn/4FbHGXe4nlA6h6rK+28rgUQkY9
 h87w==
X-Gm-Message-State: AOAM532/6sbzdzQXAMiCZh2SnFEvIyACMrGoRglawDYprrKB1ZMQmsY7
 ZkGsKN5IrQz/xIhGfAVfep4=
X-Google-Smtp-Source: ABdhPJyoTg/V90+LHTxb3YBKe82TO9MDYzH9Peuzi2Dp/ZFeZHVxK8/RCjhcNEv753ZPVf/C/crxMg==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr7371197wrv.427.1607348588187; 
 Mon, 07 Dec 2020 05:43:08 -0800 (PST)
Received: from gmail.com ([2a01:e35:2fb2:a0d0:3697:f6ff:fe76:2bcd])
 by smtp.gmail.com with ESMTPSA id w5sm16347678wrm.29.2020.12.07.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:43:07 -0800 (PST)
Date: Mon, 7 Dec 2020 14:43:02 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: gpu: drm: virtio: fix dependency of
 DRM_VIRTIO_GPU on VIRTIO
Message-ID: <20201207134302.GA8339@gmail.com>
References: <20201204131221.2827-1-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204131221.2827-1-info@metux.net>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 02:12:21PM +0100, Enrico Weigelt, metux IT consult wrote:
>VIRTIO itself has no dependencies and therefore can easily be just
>select'ed, instead of depending on it. The current depends on causes
>any others trying to select VIRTIO to fail like this:
>
>   drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>   drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
>   drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
>   drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
>   drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
>   drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
>   drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
>   drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
>   drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
>   drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
>   drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>
>It seems that having both 'depends on' as well as 'select' on the same symbol
>sends us into big trouble, and Kconfig can't break up the circular dependency
>(note that in the tested configuration, neither I2C, FB or DRM are enabled at
>all). Perhaps we could consider this a bug in Kconfig, but the trouble can
>easily be circumvented by changing 'depends on' into 'select'.
>
>DRM_VIRTIO_GPU also depends on VIRTIO_MENU, so even after this change, that
>option will only show up if the user already enabled virtio in the config.
>
>This change didn't cause any changes in the .config after menuconfig run,
>so we should be completely safe here.
>
>Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Ok for me. Thank you.

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
>---
> drivers/gpu/drm/virtio/Kconfig | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
>index b925b8b1da16..51ec7c3240c9 100644
>--- a/drivers/gpu/drm/virtio/Kconfig
>+++ b/drivers/gpu/drm/virtio/Kconfig
>@@ -1,7 +1,8 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config DRM_VIRTIO_GPU
> 	tristate "Virtio GPU driver"
>-	depends on DRM && VIRTIO && VIRTIO_MENU && MMU
>+	depends on DRM && VIRTIO_MENU && MMU
>+	select VIRTIO
> 	select DRM_KMS_HELPER
> 	select DRM_GEM_SHMEM_HELPER
> 	select VIRTIO_DMA_SHARED_BUFFER
>-- 
>2.11.0
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
