Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21E20334B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702E06E0D6;
	Mon, 22 Jun 2020 09:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C626E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:27:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z13so4143019wrw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lepq6rJbwM4TeInEKirpSRbwvDeEasresiexhG2Ejk4=;
 b=D3raIQ/M6/Ilj2W9Qri5KZj0NttJXACka0P8ZbyUPCfIMQnw0xUvhfm83SXdvcZq4x
 ODzdMEh+gtiUBC3JuwlZGfT02G6bIRCjzHNcRCTQ6R/wIjeetc0TpoO5+9gv+nW7iSWM
 1HsvOC93doESqcV2La1/PUZx+1P4jt7S++oJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lepq6rJbwM4TeInEKirpSRbwvDeEasresiexhG2Ejk4=;
 b=UlF9PbkXUhMplFMX5OWEVw+ckkZEW/OHANGuZvNavGt0tQZ6rgPEGExoXYJtE99Tze
 le1UzL0eFdzYkH5BfMLZNLIh6ASOBB4iq+kfFYG1tNj48k7o/KN3VNl1al4BmSzT1xEj
 1pT2Gq+NYzMJrhWbLOVpbbM8xAtucBxaBMrPjPsHqycetkgqYNQ/yY5tc31p+VnrUSsI
 CdH7nKeyoCdIKhu2X2tmWIu80rsQUsFOcWJZT06HZCE1Vf+NMRytxQRFA+5TY2MfIB6G
 oI6PnCgA9cumRo8RmE3FQ4MumCITiDeBVw/7gckZwMXwFitjVfCZJ99KojP0vQSfeSH6
 VzRA==
X-Gm-Message-State: AOAM533mY7VbQHi63UlRsDbB8HEOCRCMm7uJ21lSQXxKeStRuU4Rptu/
 H5W+MkZR0y6zpaT/Yj7RfobDEA==
X-Google-Smtp-Source: ABdhPJwwGbYNhnOrYIqdeInNdwLdPByu0sRmNSU56auW9FrYv2wqm6Kc1rCkVFwsd8kWJc6DOLLy9A==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr6423751wrs.345.1592818046805; 
 Mon, 22 Jun 2020 02:27:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 2sm7821820wmo.44.2020.06.22.02.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:27:26 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:27:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm: uapi: Remove copies of GPL license text from
 headers
Message-ID: <20200622092724.GX20149@phenom.ffwll.local>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621020703.864-3-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 05:07:03AM +0300, Laurent Pinchart wrote:
> Several DRM drivers uAPI headers that are licensed under the GPL carry
> both an SPDX header and a copy of the license text. Drop the latter.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I do kinda wonder how much lolz these gpl-only headers are. With or
without syscall exception, the ioctls in here are imo very far away from a
standardized syscall of any form.

But also not my problem :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/armada_drm.h  |  4 ----
>  include/uapi/drm/etnaviv_drm.h | 12 ------------
>  include/uapi/drm/exynos_drm.h  |  5 -----
>  include/uapi/drm/omap_drm.h    | 12 ------------
>  4 files changed, 33 deletions(-)
> 
> diff --git a/include/uapi/drm/armada_drm.h b/include/uapi/drm/armada_drm.h
> index af1c14c837c5..f711e63a9758 100644
> --- a/include/uapi/drm/armada_drm.h
> +++ b/include/uapi/drm/armada_drm.h
> @@ -2,10 +2,6 @@
>  /*
>   * Copyright (C) 2012 Russell King
>   *  With inspiration from the i915 driver
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  #ifndef DRM_ARMADA_IOCTL_H
>  #define DRM_ARMADA_IOCTL_H
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
> index 09d0df8b71c5..e23e0f885655 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -1,18 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   * Copyright (C) 2015 Etnaviv Project
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published by
> - * the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef __ETNAVIV_DRM_H__
> diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
> index a51aa1c618c1..a96fa566433c 100644
> --- a/include/uapi/drm/exynos_drm.h
> +++ b/include/uapi/drm/exynos_drm.h
> @@ -6,11 +6,6 @@
>   *	Inki Dae <inki.dae@samsung.com>
>   *	Joonyoung Shim <jy0922.shim@samsung.com>
>   *	Seung-Woo Kim <sw0312.kim@samsung.com>
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
>   */
>  
>  #ifndef _UAPI_EXYNOS_DRM_H_
> diff --git a/include/uapi/drm/omap_drm.h b/include/uapi/drm/omap_drm.h
> index 5a142fad473c..b51dad32122d 100644
> --- a/include/uapi/drm/omap_drm.h
> +++ b/include/uapi/drm/omap_drm.h
> @@ -4,18 +4,6 @@
>   *
>   * Copyright (C) 2011 Texas Instruments
>   * Author: Rob Clark <rob@ti.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License version 2 as published by
> - * the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef __OMAP_DRM_H__
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
