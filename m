Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB6403E6C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022B8961E;
	Wed,  8 Sep 2021 17:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0F28961E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 17:39:08 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id e21so5738123ejz.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DZWBZ7D0lOsmiUja3fV8Q9y2p8lxH2st5nZHoQidNQI=;
 b=RLaGOEnJubuek23Sdhc+OmYFKUEk7wwJJlZm7hSEVG38gbRoNP5UPYqruWT56ez/3B
 pRa+ebExcsHxCx7jIpE15wQ/zWYz3GnpFDVegEKhzbMQP18MM7aZ/WY/wJEjIs8PaXk7
 1eGHPvKnigwslcnNN75zpMohBSP6eB+Zu+IZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DZWBZ7D0lOsmiUja3fV8Q9y2p8lxH2st5nZHoQidNQI=;
 b=kxSzehoBgyKZ97lgiGq47OcIeiS7Ab3T1EdkhyCFmM1EP5HkMu5mBqpVz7NNYipk5/
 Gt5NKGxk1Z7iY7sWzaNhc9FH1m/DjFBT79bZWlyDhBRyD95SiSeimGKTPW273OTmnv6M
 cDTaDHrW8jrpo+qjDauSK0EerMwoRNlqpWTspaYRAUflcFksMFCj48w24fXBoiPWSinE
 u1+8FoXQjkAst0dHEDdI5Y9/kV5+DK8FHmIpvy5/bQ7Wz+DSXQ8ncln/zWMLCEYAZSUH
 b6aJQN113RSlYqbUxgNnfZFdgV46piss5qGWzsua7Zdef9QsfzaqtNBllPrRZrd/ZQgs
 ap5Q==
X-Gm-Message-State: AOAM530VeZ3ES7GTLxgh2G8GSTHXcKGD5i1JX/ZgHxVHt/kQl5Cm0TYm
 WYJcE1j5qOtslJQJcU9hdpMBz1TnQltV5A==
X-Google-Smtp-Source: ABdhPJyItOp1y15phY6osZJtJ+LUmcw+OoPQjCFN+DZYaR89CiPy9+J7vU+hID8Tz4ZSSDbjsHvumw==
X-Received: by 2002:a17:906:8281:: with SMTP id
 h1mr1042956ejx.352.1631122747111; 
 Wed, 08 Sep 2021 10:39:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p23sm1710554edw.94.2021.09.08.10.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:39:06 -0700 (PDT)
Date: Wed, 8 Sep 2021 19:39:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH v2 1/2] drm: document drm_mode_create_lease object
 requirements
Message-ID: <YTj1OTyh8jOZS/WR@phenom.ffwll.local>
References: <20210903130000.1590-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903130000.1590-1-contact@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Sep 03, 2021 at 01:00:16PM +0000, Simon Ser wrote:
> validate_lease expects one CRTC, one connector and one plane.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Keith Packard <keithp@keithp.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_mode.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 90c55383f1ee..e4a2570a6058 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1110,6 +1110,9 @@ struct drm_mode_destroy_blob {
>   * struct drm_mode_create_lease - Create lease
>   *
>   * Lease mode resources, creating another drm_master.
> + *
> + * The @object_ids array must reference at least one CRTC, one connector and
> + * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
>   */
>  struct drm_mode_create_lease {
>  	/** @object_ids: Pointer to array of object ids (__u32) */
> -- 
> 2.33.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
