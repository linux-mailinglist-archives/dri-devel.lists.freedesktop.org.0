Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A233E2D37E8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109356E0D4;
	Wed,  9 Dec 2020 00:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4556E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:44:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e25so23355wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WBbHO055TDdHkxOg7jOYFdPzCq3mNcsnhSnfew3Y1EY=;
 b=gkn9GnyQglKnUhjGGYCXIKsVi5wfV6l/qEI1a2+K2hvW+PzEBba0WRfUqG5WqleEHH
 rYvJAfFHvVA1vSFpUDhC9St39gWYoj9oFpMSVof8etKlbdIgrXP/Fe/VJAoTRe1NW53r
 oINMGfzdvTBk2+JPfj2iGvrr651ssjNGtsJy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WBbHO055TDdHkxOg7jOYFdPzCq3mNcsnhSnfew3Y1EY=;
 b=FZ14qe4uzS74/SehqVDGmFYmHgrR9XAic3tTZFelLSOEWaGJVbetSR4SiWqy1JArgX
 88rlNi4FCchVKY1Cvl8qwLWbrnbmPiyGfyVQxgEuWlXO7ejJbwQU+LMiWdMROrEyPMBi
 QuSL2x5aFFp2oe3ioj6g8JeE1SM0qRBciXlzVO4h5O10yr/TdLrJb9QKicTx/WPR+mfJ
 9MNE2TO9LNo+UdvgMZHYxlOOLKBH58jR9th1Hi4MiviCijlZEhADoNeiZmGfU4WaIj5S
 uEL0SUzFV4XvgqSiK5YHmJa1TA9ouzNJL2M2E2d1EaAaox/+GazbML+YPaaCZczC3Bxw
 GsGQ==
X-Gm-Message-State: AOAM530HC3j6wl2Cvau+TnIkquHfqhV+jKao1e6QyXr7vNgtxUeX6jxx
 idSJm/Z5UzFoWWGWsp40WTRoOw==
X-Google-Smtp-Source: ABdhPJxLmZZZDr4AskPctoFwXO0CXDkm7krmiIzueb/sJB51n47BczDttWqZl8WpkJ2EVS9oYPgS8A==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr44691wmj.76.1607474658253;
 Tue, 08 Dec 2020 16:44:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 138sm37368wma.41.2020.12.08.16.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:44:17 -0800 (PST)
Date: Wed, 9 Dec 2020 01:44:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 4/6] drm/atomic: Avoid unused-but-set-variable warning
 on for_each_old_plane_in_state
Message-ID: <20201209004415.GM401619@phenom.ffwll.local>
Mail-Followup-To: Liu Ying <victor.liu@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 laurentiu.palcu@oss.nxp.com
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
 <1607311260-13983-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607311260-13983-5-git-send-email-victor.liu@nxp.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 11:20:58AM +0800, Liu Ying wrote:
> Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
> The precedent has already been set by other macros in the same file.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming someone will push this to drm-misc or some other tree. Should
probably land sooner than later.
-Daniel

> ---
> v2->v3:
> * Add a missing blank line.
> 
> v1->v2:
> * No change.
> 
>  include/drm/drm_atomic.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 54e051a..2e087d7 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -888,7 +888,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  	     (__i)++)							\
>  		for_each_if ((__state)->planes[__i].ptr &&		\
>  			     ((plane) = (__state)->planes[__i].ptr,	\
> -			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
> +			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
> +			      (old_plane_state) = (__state)->planes[__i].old_state, \
> +			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
> +
>  /**
>   * for_each_new_plane_in_state - iterate over all planes in an atomic update
>   * @__state: &struct drm_atomic_state pointer
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
