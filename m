Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D947D3D0DEE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AAF6E96D;
	Wed, 21 Jul 2021 11:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956AA6E96D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 11:43:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso809149wmm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MHmFKg+tWyTO7m5Hho0WwXLCloPOypR1PtpADrUqxQ0=;
 b=ZuDwxUvQVrRl8CCI+np4hZQMkIg7ouSAmJFYyq+Qru5vTdlEnVDve7aeLiYko+cQpe
 RrnH2nABzGWZ9bxb8CWNaq5Z2DxEXenMku5bPnDHcs6Td2Ht+bemtJTCpwY4BN4AoiIt
 n72gBK5IfygKE/xtU98f1zyGDHrojoOYYlyks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHmFKg+tWyTO7m5Hho0WwXLCloPOypR1PtpADrUqxQ0=;
 b=Xe271S1X0USCSEk4DWZuqjEjN7XDsJcpikuuCKGs5Hms6ASKfINj2C3XtATJyacIur
 p68guILdCHY1JGaRW0Er5YBQVx/WJifWoJzrkMPMF7B/mvpucTLipoSHlPuG6+zz3gNz
 Mi8nPpgLC7eIRyr6SGidtGh9R1XtI1KoBZ67g5yUdcIxltjuQRg3g1gGFSnjBbhWN5gs
 ONsDJW6juy+8yjYOBZCJ1DV4GkwYFZQR21WikqaBijssnZe5nqqXumFSX7lfUSn8UYtG
 EDNOsl10LUYEsyHuMrgkyaU5Hni5SdvW69sIv2VhrH5rab4JZB8ysV1JxkTtOgKZmirM
 Pvwg==
X-Gm-Message-State: AOAM530T6L6h5nPGzmZekJY+0rmxA+gsGPcQZoumMaXQCwqjq+Cm0y7g
 HVyTXcSem9duKyOr9sobeP6Q50lL7kLcjw==
X-Google-Smtp-Source: ABdhPJwsRzEcHbs4oYh90f8Soz3bQO2DrFC0gby/I7+5mI2+15tF0pf5q+QhAcvHQV4dGQylz3j35A==
X-Received: by 2002:a05:600c:3b0a:: with SMTP id
 m10mr36454697wms.79.1626867787354; 
 Wed, 21 Jul 2021 04:43:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm4742378wmb.14.2021.07.21.04.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:43:06 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:43:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_property_enum.value for bitfields
Message-ID: <YPgISaTbkBxYaBHX@phenom.ffwll.local>
References: <NUZTPTKKZtAlDhxIXFB1qrUqWBYKapkBxCnb1S1bc3g@cp3-web-033.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NUZTPTKKZtAlDhxIXFB1qrUqWBYKapkBxCnb1S1bc3g@cp3-web-033.plabs.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 06:51:30AM +0000, Simon Ser wrote:
> When a property has the type DRM_MODE_PROP_BITMASK, the value field
> stores a bitshift, not a bitmask, which can be surprising.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/drm/drm_property.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index bbf5c1fdd7b0..f3ea7f97f372 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -37,6 +37,11 @@
>   *
>   * For enumeration and bitmask properties this structure stores the symbolic
>   * decoding for each value. This is used for example for the rotation property.
> + *
> + * If the property has the type &DRM_MODE_PROP_BITMASK, @value stores a
> + * bitshift, not a bitmask. In other words, the enum entry is enabled if the
> + * bit number @value is set in the property's value. This enum entry has the
> + * bitmask ``1 << value``.

Please move this into an inline comment to make it clear that this is
specifically about @value. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I was also pondering whether we have a nice place to link to for
"property's value" but really they're just uint64_t all over the place,
and only stored in the drm_mode_object for non-atomic properties. So
wording sounds like the best option we have.

>   */
>  struct drm_property_enum {
>  	uint64_t value;
> -- 
> 2.32.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
