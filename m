Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FD1A089A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D44C6E575;
	Tue,  7 Apr 2020 07:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8543C6E575
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:48:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r26so757405wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bcEkOFfXXZd5u9NKuCuDe0ahlWfUYDe/CDpcHq/UZio=;
 b=O+9BI8Qvat3IFPNY730pzXmSTxvnPnEa3mVqAP3zJEyANUoSSGTEACv/fPgPj2J1Mu
 tY6WyPgg2nZPaYWktWlXGQkyvtUmrToJagfwQADQBisZBF1tYY5v+Tv6g+CMG1+1kiLS
 0PvCJwibSlx1rje2e0Zs74L7yJrL3fvP0Enic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bcEkOFfXXZd5u9NKuCuDe0ahlWfUYDe/CDpcHq/UZio=;
 b=TyOuGhsqHOjTWbPm5R32E1LPlTnCdFzE7BmT6+mIwRRJ1CjIIboKVjfg4a2VdyBnz9
 dznx/5A6BGGGC3z/IdJfJCLgMSps79BTGOj2HOlogW5B4jTCYSPAkUdcoQMjX84GaXdE
 Xt6sEVg06sk3l38kWHfqsFCUKXruwOAWajoJ5/qz2HIy51Pqgk1ednTsaLiDcwRl4g6A
 pwPZ/Z1pFI0/7SvrA2n3RkYG+Jziqo0ZL238NbMM0UYnCOzjUsYeGAfC/fAzO9c0hpnb
 0yqcgGkKTVJCNYTLVaE6NqsWV6RSl3GhVDKlkfAcVhOc1KmLDw3BVty32jYUiIfw7Rd1
 hcmQ==
X-Gm-Message-State: AGi0Pua+eNmCiKSyeuA+wIMKSmLde3V8kW/aMAEsI0zbGj0nccC4+oLY
 Do0BqeEuX0UK8P7uIWcTBewYDg==
X-Google-Smtp-Source: APiQypJ6TF2PRlgMW3si5sFyqj9PDKd6b5q0tTI80zMh8Qjx9XM3TK72SV3+cZjkvDYzStOmyE1D7g==
X-Received: by 2002:a7b:c404:: with SMTP id k4mr953343wmi.37.1586245694137;
 Tue, 07 Apr 2020 00:48:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm30545628wrm.35.2020.04.07.00.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 00:48:13 -0700 (PDT)
Date: Tue, 7 Apr 2020 09:48:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: plane: Verify that no or all planes have a zpos
 property
Message-ID: <20200407074811.GE3456981@phenom.ffwll.local>
References: <20200404181253.25873-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200404181253.25873-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 04, 2020 at 09:12:53PM +0300, Laurent Pinchart wrote:
> The zpos property is used by userspace to sort the order of planes.
> While the property is not mandatory for drivers to implement, mixing
> planes with and without zpos confuses userspace, and shall not be
> allowed. Clarify this in the documentation and warn at runtime if the
> drivers mixes planes with and without zpos properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 10 ++++++----
>  drivers/gpu/drm/drm_plane.c |  9 +++++++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 88eedee018d3..f1dcad96f341 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -135,7 +135,9 @@
>   *	are underneath planes with higher Z position values. Two planes with the
>   *	same Z position value have undefined ordering. Note that the Z position
>   *	value can also be immutable, to inform userspace about the hard-coded
> - *	stacking of planes, see drm_plane_create_zpos_immutable_property().
> + *	stacking of planes, see drm_plane_create_zpos_immutable_property(). If
> + *	any plane has a zpos property (either mutable or immutable), then all
> + *	planes shall have a zpos property.
>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_property().
> @@ -344,10 +346,10 @@ EXPORT_SYMBOL(drm_rotation_simplify);
>   * should be set to 0 and max to maximal number of planes for given crtc - 1.
>   *
>   * If zpos of some planes cannot be changed (like fixed background or
> - * cursor/topmost planes), driver should adjust min/max values and assign those
> - * planes immutable zpos property with lower or higher values (for more
> + * cursor/topmost planes), drivers shall adjust the min/max values and assign
> + * those planes immutable zpos properties with lower or higher values (for more
>   * information, see drm_plane_create_zpos_immutable_property() function). In such
> - * case driver should also assign proper initial zpos values for all planes in
> + * case drivers shall also assign proper initial zpos values for all planes in
>   * its plane_reset() callback, so the planes will be always sorted properly.
>   *
>   * See also drm_atomic_normalize_zpos().
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..efb9c16ddc21 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -289,6 +289,8 @@ EXPORT_SYMBOL(drm_universal_plane_init);
>  
>  int drm_plane_register_all(struct drm_device *dev)
>  {
> +	unsigned int num_planes = 0;
> +	unsigned int num_zpos = 0;
>  	struct drm_plane *plane;
>  	int ret = 0;
>  
> @@ -297,8 +299,15 @@ int drm_plane_register_all(struct drm_device *dev)
>  			ret = plane->funcs->late_register(plane);
>  		if (ret)
>  			return ret;
> +
> +		if (plane->zpos_property)
> +			num_zpos++;
> +		num_planes++;
>  	}
>  
> +	drm_WARN(dev, num_planes != num_zpos,

0day spotted that you should change this to num_zpos && num_zpos ==
num_planes. Otherwise it doesn't really implement what you claim it does
implement. With that fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		 "Mixing planes with and without zpos property is invalid\n");
> +
>  	return 0;
>  }
>  
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
