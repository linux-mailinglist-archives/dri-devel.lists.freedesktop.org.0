Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DC76E52A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 12:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A9110E5DF;
	Thu,  3 Aug 2023 10:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BB910E5DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:01:17 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56475c1b930so101194eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691056877; x=1691661677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qSznRHvFQAF30o8hXKa1nrLY2CgTYJQQQtmB9kbrY5g=;
 b=eC/eNZglpp14oyvhpnNnJhc8BGxY2ibdG/9b+XPruNWEp14SEHcFpNZrwZo5b30gvx
 KHjPfB218GMR49DjD1qzad1qtWlF5JJWLIvTQwbpuIr7F69z9c8O10yH/8/GMl+hu3E5
 sbzwoiPL7cZhuayfTtPiLlgeWwhtE19Xcdzas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691056877; x=1691661677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSznRHvFQAF30o8hXKa1nrLY2CgTYJQQQtmB9kbrY5g=;
 b=FsUf0bvgjdXYbGg8CaFPcfT7udQhk0LpMTO/C+1T1vTWowlbrk3EQMhTF2HBEqZUSY
 Gd+WfpU7ABblFywYAwDPnvoiHQEclboj/r5sPkDYphQ9xYqHg3ci9xUn72qaHKoP5dWt
 sYod2VF6eAc1Wca8VLxl3uRG5ZxW5phAdBEQlpZgCx7KXCgYPhqM1vdH1pTgvkqtad2e
 vrSutiJwrRlxw7mpeQhdjhmpfQVzpYprKJge+wWIM0k7fW+NKcIzIA+ytvOGGzZNYat6
 spRGDYEW5DtjQw6YOgHi0l60ookp8TywkxMYv7dwjVHzeZgAvs+Xsru4Cqcctj1b7Nxd
 sujA==
X-Gm-Message-State: ABy/qLZzt87PEV8n8OHwRbLJEA3cRsEuHmH60W6vJKqIgzG5bVMBmEdm
 zybJTVR4CCBEp//KUxRkTFkq8lGf2DYpdjdHueKKFsvs0rlgPD88
X-Google-Smtp-Source: APBJJlFBLEn6a5WE11kQj5SQvpzJXXLl7lk3wRxMcmC7ACHFocUKkJ/ZIf7IWy4J1K3VG1fw5So1wOfPKASKmIaO16w=
X-Received: by 2002:a4a:e251:0:b0:566:951e:140c with SMTP id
 c17-20020a4ae251000000b00566951e140cmr10104981oot.1.1691056876925; Thu, 03
 Aug 2023 03:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230803095734.386761-1-contact@emersion.fr>
In-Reply-To: <20230803095734.386761-1-contact@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 3 Aug 2023 12:01:05 +0200
Message-ID: <CAKMK7uFC9Opqh0D8OOXvOJ9XJ_+OaGdWpWa9q6-wTJrLeO2G0w@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: use proper cross-references for sections
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 11:57, Simon Ser <contact@emersion.fr> wrote:
>
> When I originally wrote these docs, I couldn't manage to insert a
> cross-reference to a section. Here's how it can be done.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>

Acked-by: me

> ---
>  Documentation/gpu/drm-kms.rst | 2 ++
>  Documentation/gpu/drm-mm.rst  | 2 ++
>  include/uapi/drm/drm.h        | 9 ++++-----
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index c92d425cb2dd..ca9210e47266 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -360,6 +360,8 @@ Format Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>     :export:
>
> +.. _kms_dumb_buffer_objects:
> +
>  Dumb Buffer Objects
>  ===================
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 3d5dc9dc1bfe..513197359aba 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -517,6 +517,8 @@ DRM Cache Handling and Fast WC memcpy()
>  .. kernel-doc:: drivers/gpu/drm/drm_cache.c
>     :export:
>
> +.. _drm_sync_objects:
> +
>  DRM Sync Objects
>  ===========================
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 863e47200911..75ec985d95e5 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -673,8 +673,8 @@ struct drm_gem_open {
>   * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
>   * and &DRM_PRIME_CAP_EXPORT.
>   *
> - * PRIME buffers are exposed as dma-buf file descriptors. See
> - * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
> + * PRIME buffers are exposed as dma-buf file descriptors.
> + * See :ref:`prime_buffer_sharing`.
>   */
>  #define DRM_CAP_PRIME                  0x5
>  /**
> @@ -756,15 +756,14 @@ struct drm_gem_open {
>  /**
>   * DRM_CAP_SYNCOBJ
>   *
> - * If set to 1, the driver supports sync objects. See
> - * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + * If set to 1, the driver supports sync objects. See :ref:`drm_sync_objects`.
>   */
>  #define DRM_CAP_SYNCOBJ                0x13
>  /**
>   * DRM_CAP_SYNCOBJ_TIMELINE
>   *
>   * If set to 1, the driver supports timeline operations on sync objects. See
> - * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + * :ref:`drm_sync_objects`.
>   */
>  #define DRM_CAP_SYNCOBJ_TIMELINE       0x14
>
> --
> 2.41.0
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
