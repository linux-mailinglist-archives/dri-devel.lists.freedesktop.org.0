Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8E69B35E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7261110E440;
	Fri, 17 Feb 2023 19:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B47810E440
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:51:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 t6-20020a7bc3c6000000b003dc57ea0dfeso1729113wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1676663497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YjDnN+WK9PTDaKwnd1XUi981l8Ah7+4e3p/FSR0Ln4A=;
 b=Bab8JqoBcZuQKP1wRnN2MzpuHH2WlKJpKf94h2Y8WzOGWCwU8KOfYr+ERBFt8PgHU2
 r2ZeB/sE/TkMPRbQdxMSIlNbUaQx+Nays2lX0zI0Rk7/xV+VNJ1XN2XynzARecu2cZvg
 z/8u8d24UKub7zaikIPFifPS86LjOfagFJKXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676663497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjDnN+WK9PTDaKwnd1XUi981l8Ah7+4e3p/FSR0Ln4A=;
 b=zn9QZ1ZB+H0MFoEZBui87rmClfSNacU9BBHCL/kB5+4DtPOlr4P7Uq6Mq3GuSvDp+e
 /Wsy6ZxMuvDEj9J30Fw6oxuv0yyMzCrKiwfXkK8PcK4aOpLUueFVtx0NPuumiR03tC1N
 IoaJ/9g7v3ebd117gTB4a/pIeuPEbo1kwCxkf35PguUs5p5590banEkCrSyhs6GX0iaP
 l+QGpt+RZkwh/gfh3pl6u2hv3dVHhicJCQb89ybCCnJLW05zaZIyMFvCJ9mB3gUllAsW
 u6/STbwWQoqxWZ2HImVSix7UtC+pTS7dv7lFOt6u2sH457SlQ69DNqOKjOTwDD6RXuZQ
 ipHg==
X-Gm-Message-State: AO0yUKXqz9nPJ/uTwKF9WNMenAGnE8/MzkHm79Oa/XnNw47jYSYk1rnA
 CqwnF0sVLjb3tI/GljIIKifR85Yn2UXP7n+j
X-Google-Smtp-Source: AK7set+eQjbIkfdDTuQRUqHe/1DmPScyvO4baFdbR4X9qFJEDfkCiE3XHl0N36ovDfVz93GiW1scTA==
X-Received: by 2002:a05:600c:512a:b0:3dd:1cd3:5d75 with SMTP id
 o42-20020a05600c512a00b003dd1cd35d75mr2008829wms.0.1676663497089; 
 Fri, 17 Feb 2023 11:51:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003daf6e3bc2fsm3342177wms.1.2023.02.17.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 11:51:36 -0800 (PST)
Date: Fri, 17 Feb 2023 20:51:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <Y+/axoSP21LXqAmO@phenom.ffwll.local>
References: <20230217162151.59996-1-contact@emersion.fr>
 <20230217162151.59996-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217162151.59996-2-contact@emersion.fr>
X-Operating-System: Linux phenom 6.0.0-6-amd64 
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 04:22:04PM +0000, Simon Ser wrote:
> v2: mention caps, note that the IOCTLs might fail, document that
> user-space needs a data structure to keep track of the
> handles (Daniel V.)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>

On both patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 292e4778a2f4..a87bbbbca2d4 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1025,7 +1025,37 @@ extern "C" {
>  #define DRM_IOCTL_UNLOCK		DRM_IOW( 0x2b, struct drm_lock)
>  #define DRM_IOCTL_FINISH		DRM_IOW( 0x2c, struct drm_lock)
>  
> +/**
> + * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
> + *
> + * User-space sets &drm_prime_handle.handle with the GEM handle to export and
> + * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
> + * &drm_prime_handle.fd.
> + *
> + * The export can fail for any driver-specific reason, e.g. because export is
> + * not supported for this specific GEM handle (but might be for others).
> + *
> + * Support for exporting DMA-BUFs is advertised via &DRM_PRIME_CAP_EXPORT.
> + */
>  #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_handle)
> +/**
> + * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
> + *
> + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
> + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> + * &drm_prime_handle.flags is unused.
> + *
> + * If an existing GEM handle refers to the memory object backing the DMA-BUF,
> + * that GEM handle is returned. Therefore user-space which needs to handle
> + * arbitrary DMA-BUFs must have a user-space lookup data structure to manually
> + * reference-count duplicated GEM handles. For more information see
> + * &DRM_IOCTL_GEM_CLOSE.
> + *
> + * The import can fail for any driver-specific reason, e.g. because import is
> + * only supported for DMA-BUFs allocated on this DRM device.
> + *
> + * Support for importing DMA-BUFs is advertised via &DRM_PRIME_CAP_IMPORT.
> + */
>  #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_handle)
>  
>  #define DRM_IOCTL_AGP_ACQUIRE		DRM_IO(  0x30)
> -- 
> 2.39.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
