Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748245B6B28
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7294210E694;
	Tue, 13 Sep 2022 09:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2538 seconds by postgrey-1.36 at gabe;
 Tue, 13 Sep 2022 09:49:37 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0212610E694;
 Tue, 13 Sep 2022 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gBtxmYHP5Jj7f7rvEhp/JUGfwWkpfUScRndU2I8SJKo=; b=0ec/oNWAcu6fZuy69R295iV2bW
 GKpD/c2Y6/4qNCd7l3xd2mUi5qemziJ8Qih/18M1AHdYfsavxFhWvwtWjlQR3TYz1vZsCfgAZ9lMA
 08kFUyuPJF4D1ue988mez0SkX8jCUnhkSgIRfHDmAcjdCxoMyspjbdrha3Mc/Pwru2YzRUMQwRA2O
 0HQlKKnucH7qdrXalqSYe85DDFY9LDDtG2Hp9HmrvC+HhD7DdUF1sUhgDwoxxfhYNwEhu0BMg24m2
 TVL686NLtG1zK8CVvHAYxbns+jM3KSvO6KeMt+2ioiq/zwBFg2qVqM98Lb3hKG53uS9p6pw55fVQg
 61XRPOWQ==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jyri.sarha@iki.fi>)
 id 1oY1sB-00DLg3-RF; Tue, 13 Sep 2022 12:06:28 +0300
MIME-Version: 1.0
Date: Tue, 13 Sep 2022 09:06:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <04399a9fe6a4b53a2cc012dad40b3c67c32b875f@iki.fi>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
 tomba@kernel.org, sam@ravnborg.org
References: undefined <20220909105947.6487-1-tzimmermann@suse.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 1/4] drm/plane: Remove drm_plane_init()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

September 9, 2022 at 1:59 PM, "Thomas Zimmermann" <tzimmermann@suse.de ma=
ilto:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%=
40suse.de%3E > wrote:

>=20
>=20Open-code drm_plane_init() and remove the function from DRM. The
> implementation of drm_plane_init() is a simple wrapper around a call
> to drm_universal_plane_init(), so drivers can just use that instead.
>=20
>=20Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

> ---
> drivers/gpu/drm/drm_modeset_helper.c | 3 +-
> drivers/gpu/drm/drm_plane.c | 32 ----------------------
> drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 +++++----
> drivers/gpu/drm/shmobile/shmob_drm_plane.c | 7 +++--
> drivers/gpu/drm/tilcdc/tilcdc_plane.c | 9 +++---
> include/drm/drm_plane.h | 8 +-----
> 6 files changed, 17 insertions(+), 55 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/d=
rm_modeset_helper.c
> index bd609a978848..611dd01fb604 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -100,8 +100,7 @@ EXPORT_SYMBOL(drm_helper_mode_fill_fb_struct);
> * This is the minimal list of formats that seem to be safe for modeset =
use
> * with all current DRM drivers. Most hardware can actually support more
> * formats than this and drivers may specify a more accurate list when
> - * creating the primary plane. However drivers that still call
> - * drm_plane_init() will use this minimal format list as the default.
> + * creating the primary plane.
> */
> static const uint32_t safe_modeset_formats[] =3D {
>  DRM_FORMAT_XRGB8888,
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 726f2f163c26..0f14b4d3bb10 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -482,38 +482,6 @@ void drm_plane_unregister_all(struct drm_device *d=
ev)
>  }
> }
>=20
>=20-/**
> - * drm_plane_init - Initialize a legacy plane
> - * @dev: DRM device
> - * @plane: plane object to init
> - * @possible_crtcs: bitmask of possible CRTCs
> - * @funcs: callbacks for the new plane
> - * @formats: array of supported formats (DRM_FORMAT\_\*)
> - * @format_count: number of elements in @formats
> - * @is_primary: plane type (primary vs overlay)
> - *
> - * Legacy API to initialize a DRM plane.
> - *
> - * New drivers should call drm_universal_plane_init() instead.
> - *
> - * Returns:
> - * Zero on success, error code on failure.
> - */
> -int drm_plane_init(struct drm_device *dev, struct drm_plane *plane,
> - uint32_t possible_crtcs,
> - const struct drm_plane_funcs *funcs,
> - const uint32_t *formats, unsigned int format_count,
> - bool is_primary)
> -{
> - enum drm_plane_type type;
> -
> - type =3D is_primary ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY=
;
> - return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
> - formats, format_count,
> - NULL, type, NULL);
> -}
> -EXPORT_SYMBOL(drm_plane_init);
> -
> /**
> * drm_plane_cleanup - Clean up the core plane usage
> * @plane: plane to cleanup
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/d=
rm/nouveau/dispnv04/overlay.c
> index 37e63e98cd08..33f29736024a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
>  break;
>  }
>=20
>=20- ret =3D drm_plane_init(device, &plane->base, 3 /* both crtc's */,
> - &nv10_plane_funcs,
> - formats, num_formats, false);
> + ret =3D drm_universal_plane_init(device, &plane->base, 3 /* both crtc=
's */,
> + &nv10_plane_funcs,
> + formats, num_formats, NULL,
> + DRM_PLANE_TYPE_OVERLAY, NULL);
>  if (ret)
>  goto err;
>=20
>=20@@ -475,9 +476,9 @@ nv04_overlay_init(struct drm_device *device)
>  if (!plane)
>  return;
>=20
>=20- ret =3D drm_plane_init(device, &plane->base, 1 /* single crtc */,
> - &nv04_plane_funcs,
> - formats, 2, false);
> + ret =3D drm_universal_plane_init(device, &plane->base, 1 /* single cr=
tc */,
> + &nv04_plane_funcs, formats, 2, NULL,
> + DRM_PLANE_TYPE_OVERLAY, NULL);
>  if (ret)
>  goto err;
>=20
>=20diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu=
/drm/shmobile/shmob_drm_plane.c
> index 54228424793a..6c5f0cbe7d95 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> @@ -252,9 +252,10 @@ int shmob_drm_plane_create(struct shmob_drm_device=
 *sdev, unsigned int index)
>  splane->index =3D index;
>  splane->alpha =3D 255;
>=20
>=20- ret =3D drm_plane_init(sdev->ddev, &splane->plane, 1,
> - &shmob_drm_plane_funcs, formats,
> - ARRAY_SIZE(formats), false);
> + ret =3D drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
> + &shmob_drm_plane_funcs,
> + formats, ARRAY_SIZE(formats), NULL,
> + DRM_PLANE_TYPE_OVERLAY, NULL);
>=20
>=20 return ret;
> }
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_plane.c
> index 0ccf791301cb..cf77a8ce7398 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -105,11 +105,10 @@ int tilcdc_plane_init(struct drm_device *dev,
>  struct tilcdc_drm_private *priv =3D dev->dev_private;
>  int ret;
>=20
>=20- ret =3D drm_plane_init(dev, plane, 1,
> - &tilcdc_plane_funcs,
> - priv->pixelformats,
> - priv->num_pixelformats,
> - true);
> + ret =3D drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
> + priv->pixelformats,
> + priv->num_pixelformats,
> + NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>  if (ret) {
>  dev_err(dev->dev, "Failed to initialize plane: %d\n", ret);
>  return ret;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89ea54652e87..910cb941f3d5 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -631,7 +631,7 @@ struct drm_plane {
>  unsigned int format_count;
>  /**
>  * @format_default: driver hasn't supplied supported formats for the
> - * plane. Used by the drm_plane_init compatibility wrapper only.
> + * plane. Used by the non-atomic driver compatibility wrapper only.
>  */
>  bool format_default;
>=20
>=20@@ -762,12 +762,6 @@ int drm_universal_plane_init(struct drm_device *=
dev,
>  const uint64_t *format_modifiers,
>  enum drm_plane_type type,
>  const char *name, ...);
> -int drm_plane_init(struct drm_device *dev,
> - struct drm_plane *plane,
> - uint32_t possible_crtcs,
> - const struct drm_plane_funcs *funcs,
> - const uint32_t *formats, unsigned int format_count,
> - bool is_primary);
> void drm_plane_cleanup(struct drm_plane *plane);
>=20
>=20__printf(10, 11)
> --=20
>=202.37.2
>
