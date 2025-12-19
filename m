Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF94CD10E9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 18:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0410F04B;
	Fri, 19 Dec 2025 17:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iurcc38x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0F610F04C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:08:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1A5AAC1B20C;
 Fri, 19 Dec 2025 17:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9C556071D;
 Fri, 19 Dec 2025 17:08:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B9D010AA9172; Fri, 19 Dec 2025 18:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766164113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZH46bQxb2Ubo9qlnssD68uQSXwsr8CWd4hPiAzbuELw=;
 b=iurcc38xzziKbrgKzIZ5kZHbMTUTZg139oY8cppy04kaoK13H4mJwT20AL1z33F/3ymDOc
 MgzPa0LyToGRd68C0/F+plCVAe0hYKqvFwFxZJwTl3SIJqF58BtektT/3qK/xIxWP91y63
 OiZj40ml3nf2rcCyNwh56Z4+4DfBYQHDPUqfA7IXYaPCsUYWEmm8uNK+aTCo2cjapP8DBM
 GjZUWR2IsUtEAQ+ufAku4zGXntdtrqjRdaYPc4vNyC08lyqRavPxR/fMv+Y/L5KwxXBMMA
 CBbhGJMDIcsQ2WPE3CQ+WOtuV6uMWgeEjFDrYRWb3m73K0VmwVtN4InUBe1YNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:30 +0100
Message-Id: <DF2CXBF8ZCSQ.28C9DWKRIFW8Y@bootlin.com>
Subject: Re: [PATCH RESEND v2 19/32] drm/vkms: Introduce config for plane
 zpos property
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-19-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-19-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> VKMS can render plane in any order. Introduce the appropriate
> configuration.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c

> @@ -606,6 +609,94 @@ static void vkms_config_test_valid_plane_color_range=
(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>
> +static void vkms_config_test_valid_plane_zpos(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_plane *plane_cfg;
> +
> +	config =3D vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	plane_cfg =3D get_first_plane(config);
> +
> +	/* Valid, all color range supported */
> +	plane_cfg =3D get_first_plane(config);

These 2 lines should be removed? Invalid comment and duplicated line,
apparently.

> +	/* Valid, zpos disabled */
> +	vkms_config_plane_set_zpos_enabled(plane_cfg, false);
> +	vkms_config_plane_set_zpos_mutable(plane_cfg, false);
> +	vkms_config_plane_set_zpos_initial(plane_cfg, 0);
> +	vkms_config_plane_set_zpos_min(plane_cfg, 0);
> +	vkms_config_plane_set_zpos_max(plane_cfg, 0);
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> +
> +	/* Valid, zpos disabled, min/max are ignored */
> +	vkms_config_plane_set_zpos_enabled(plane_cfg, false);
> +	vkms_config_plane_set_zpos_mutable(plane_cfg, false);
> +	vkms_config_plane_set_zpos_initial(plane_cfg, 8);
> +	vkms_config_plane_set_zpos_min(plane_cfg, 3);
> +	vkms_config_plane_set_zpos_max(plane_cfg, 2);
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> +
> +	/* Valid, zpos enabled but initial value is out of range */
> +	vkms_config_plane_set_zpos_enabled(plane_cfg, true);
> +	vkms_config_plane_set_zpos_mutable(plane_cfg, false);
> +	vkms_config_plane_set_zpos_initial(plane_cfg, 1);
> +	vkms_config_plane_set_zpos_min(plane_cfg, 0);
> +	vkms_config_plane_set_zpos_max(plane_cfg, 0);
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));

vkms_config_valid_plane_zpos() returns OK if mutable is false. So the test
is correct but the comment is misleading. It should read:

	/* Valid, zpos enabled but mutable disabled */

> +	/* Valid, zpos enabled with valid initial value */
> +	vkms_config_plane_set_zpos_enabled(plane_cfg, true);
> +	vkms_config_plane_set_zpos_mutable(plane_cfg, false);
> +	vkms_config_plane_set_zpos_initial(plane_cfg, 0);
> +	vkms_config_plane_set_zpos_min(plane_cfg, 0);
> +	vkms_config_plane_set_zpos_max(plane_cfg, 0);
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));

Here the comment is misleading as well, it should still be:

	/* Valid, zpos enabled but mutable disabled */

> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c

> @@ -249,6 +252,37 @@ bool vkms_config_valid_plane_color_range(const struc=
t vkms_config *config,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_range);
>
> +VISIBLE_IF_KUNIT
> +bool vkms_config_valid_plane_zpos(const struct vkms_config *config,
> +				  const struct vkms_config_plane *plane_cfg)
> +{
> +	struct drm_device *dev =3D config->dev ? &config->dev->drm : NULL;
> +
> +	if (!vkms_config_plane_get_zpos_enabled(plane_cfg) ||
> +	    !vkms_config_plane_get_zpos_mutable(plane_cfg))
> +		return true;
> +
> +	if (vkms_config_plane_get_zpos_initial(plane_cfg) >
> +	    vkms_config_plane_get_zpos_max(plane_cfg)) {
> +		drm_info(dev, "Configured initial zpos value bigger than zpos max\n");
> +		return false;
> +	}
> +
> +	if (vkms_config_plane_get_zpos_max(plane_cfg) <
> +	    vkms_config_plane_get_zpos_min(plane_cfg)) {
> +		drm_info(dev, "Configured zpos max value smaller than zpos min\n");
> +		return false;
> +	}
> +
> +	if (vkms_config_plane_get_zpos_initial(plane_cfg) <
> +	    vkms_config_plane_get_zpos_min(plane_cfg)) {
> +		drm_info(dev, "Configured initial zpos value smaller than zpos min\n")=
;
> +		return false;
> +	}

Maybe merge the if(initial < min) and the if(initial > max) into a single
if(), to avoid unnecessarily detailed error reporting. Not a strong request
however, up to you.

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -51,6 +51,11 @@ struct vkms_config {
>   * @supported_color_ranges: Color range that this plane will support
>   * @supported_formats: List of supported formats
>   * @supported_formats_count: Length of @supported_formats
> + * @zpos_enabled: Enable or disable the zpos property
> + * @zpos_mutable: Make the zpos property mutable or not (ignored if @zpo=
s_enabled is false)
> + * @zpos_initial: Initial value for zpos property (ignored if @zpos_enab=
led is false)
> + * @zpos_min: Minimal value for zpos property (ignored if @zpos_enabled =
is false)
> + * @zpos_max: Maximal value for zpos property (ignored if @zpos_enabled =
is false)
>   */
>  struct vkms_config_plane {
>  	struct list_head link;

[...]

> +/**
> + * vkms_config_plane_set_zpos_min() - Set the minimum zpos value
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_min: Minimum zpos value
> + */
> +static inline
> +void vkms_config_plane_set_zpos_min(struct vkms_config_plane *plane_cfg,
> +				    unsigned int zpos_min)
> +{
> +	plane_cfg->zpos_min =3D zpos_min;
> +}
> +
> +/**
> + * vkms_config_plane_set_zpos_max() - Set the maximum zpos value
> + * @plane_cfg: Plane configuration to modify
> + * @zpos_max: Maximum zpos value
> + *
> + * Sets the maximum allowed value for the zpos property. This setting is
> + * ignored if zpos is disabled.

These two lines are not present for the other functions. I suggest removing
them here, the kdoc in struct vkms_config is already saying so.

> +/**
> + * vkms_config_plane_get_zpos_mutable() - Check if zpos property is muta=
ble
> + * @plane_cfg: Plane configuration to check
> + *
> + * Returns:
> + * True if the zpos property is mutable for this plane, false otherwise.
> + * Returns false if zpos is disabled.

This last line is correct? There is no check in the code. I think it's OK
to leave the code as is and remove this line.

> + */
> +static inline
> +bool vkms_config_plane_get_zpos_mutable(const struct vkms_config_plane *=
plane_cfg)
> +{
> +	return plane_cfg->zpos_mutable;
> +}

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
