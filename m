Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB747388B87
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082FF6ED08;
	Wed, 19 May 2021 10:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86066ED08
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:18:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j14so11664300wrq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xyINcyeG6uNOHs7d5xwzlIGwXNuutMrMd1PLJVAigTI=;
 b=NKG+Hng9HPSuNQMpBzRLx5HsVRTqv0DgAf9JQhoVTjQHmOnYJDlsZWzfPdfkBqWbN4
 LpWgayAQ+RukhU+T8Z0MlQ2YBzYWmGXW+rQ72xfrCqOHIVlYJuHDeuXVjcB66AEsGpDk
 WwtYB7u7DNCwY5Zv35SuwsjNO6/88zJ2waOPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xyINcyeG6uNOHs7d5xwzlIGwXNuutMrMd1PLJVAigTI=;
 b=kJoWQsZkRpoEOgGRrv2e0yUHuDNpeWZJK42zz7ikm3NF1zhN4jPB6rNivT3zr0z4Mn
 yWXidIdpJKlvhvzUnQc2EGSRB4XlFsvpi3KNENMcIt0CFF/qJMnswgpyFnA0jWUKl+ba
 UOpuq3lmvPyk6w6Fr/86ejHw94p7eSWJsw2W78cVMoZOIZVDvAZlsBCwiRDuBM8gUdEx
 eLM/QquFPiuOG9wrosmXLYPfH9V/tRux1BFMvCPELhk0lPSy8LDZdEZM+6LF1Qb4+nVs
 ncsEPS2ZSK7buYnP6yYCC5bpSsfDGI6HqdZZw+NxAsyFbrMievxfFDuSAvSpkc8pxpkW
 cq6Q==
X-Gm-Message-State: AOAM532R+r+Nb36y+sD9gRe2GdViLj3s5RYAqdHOOwVNsQFeqYv/T/M9
 M7Gbn7oqRszRJarM9gtUzpjIkw==
X-Google-Smtp-Source: ABdhPJy0ZKIJqPAoql5hNMS2Z3SX8f4ZzGHlBgr/CwWtlVJUzlqiHzT5u0VeWY5+DKf7lJolVSNxIg==
X-Received: by 2002:adf:f647:: with SMTP id x7mr1583556wrp.107.1621419490456; 
 Wed, 19 May 2021 03:18:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p10sm23371015wrr.58.2021.05.19.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:18:10 -0700 (PDT)
Date: Wed, 19 May 2021 12:18:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm: document minimum kernel version for
 DRM_CLIENT_CAP_*
Message-ID: <YKTl4Ei5rB5WH87u@phenom.ffwll.local>
References: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 11:14:52AM +0000, Simon Ser wrote:
> The kernel versions including the following commits are referenced:
> 
> DRM_CLIENT_CAP_STEREO_3D
> 61d8e3282541 ("drm: Add a STEREO_3D capability to the SET_CLIENT_CAP ioctl")
> 
> DRM_CLIENT_CAP_UNIVERSAL_PLANES
> 681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")
> c7dbc6c9ae5c ("drm: Remove command line guard for universal planes")
> 
> DRM_CLIENT_CAP_ATOMIC
> 88a48e297b3a ("drm: add atomic properties")
> 8b72ce158cf0 ("drm: Always enable atomic API")
> 
> DRM_CLIENT_CAP_ASPECT_RATIO
> 7595bda2fb43 ("drm: Add DRM client cap for aspect-ratio")
> 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> d67b6a206507 ("drm: writeback: Add client capability for exposing writeback connectors")
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

btw your threading is busted.
-Daniel
> ---
>  include/uapi/drm/drm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 87878aea4526..ec2b122cdcc5 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -780,6 +780,8 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose the stereo 3D capabilities of the
>   * monitor by advertising the supported 3D layouts in the flags of struct
>   * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
> + *
> + * This capability is always supported starting from kernel version 3.13.
>   */
>  #define DRM_CLIENT_CAP_STEREO_3D	1
>  
> @@ -788,6 +790,9 @@ struct drm_get_cap {
>   *
>   * If set to 1, the DRM core will expose all planes (overlay, primary, and
>   * cursor) to userspace.
> + *
> + * This capability has been introduced in kernel version 3.15. Starting from
> + * kernel version 3.17, this capability is always supported.
>   */
>  #define DRM_CLIENT_CAP_UNIVERSAL_PLANES  2
>  
> @@ -797,6 +802,13 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose atomic properties to userspace. This
>   * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
>   * &DRM_CLIENT_CAP_ASPECT_RATIO.
> + *
> + * If the driver doesn't support atomic mode-setting, enabling this capability
> + * will fail with -EOPNOTSUPP.
> + *
> + * This capability has been introduced in kernel version 4.0. Starting from
> + * kernel version 4.2, this capability is always supported for atomic-capable
> + * drivers.
>   */
>  #define DRM_CLIENT_CAP_ATOMIC	3
>  
> @@ -805,6 +817,8 @@ struct drm_get_cap {
>   *
>   * If set to 1, the DRM core will provide aspect ratio information in modes.
>   * See ``DRM_MODE_FLAG_PIC_AR_*``.
> + *
> + * This capability is always supported starting from kernel version 4.18.
>   */
>  #define DRM_CLIENT_CAP_ASPECT_RATIO    4
>  
> @@ -814,6 +828,9 @@ struct drm_get_cap {
>   * If set to 1, the DRM core will expose special connectors to be used for
>   * writing back to memory the scene setup in the commit. The client must enable
>   * &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is always supported for atomic-capable drivers starting from
> + * kernel version 4.19.
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
>  
> -- 
> 2.31.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
