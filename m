Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2ACCD0FC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DCA10EA30;
	Thu, 18 Dec 2025 17:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jouQLSqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C66410EA30
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:59:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 132BC4E41C91;
 Thu, 18 Dec 2025 17:59:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DCE6660715;
 Thu, 18 Dec 2025 17:59:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C03E102F0B52; Thu, 18 Dec 2025 18:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Yxjdl3FTPM8CPD5jrrBa+5KL65rwp5SllhtEuXSdl5Y=;
 b=jouQLSqsgkzPE574rPdY6/A0ickcnXpPIfYX/qQ0pnPa3vTJi2xkYqbQngP3As1V3dpFkY
 t1agY6DFqpLuzCVrt4dwAMHfXoi9jr+R91xVQB6cEKGVLq4gg3gse+k7v69VkBVXwNHKcm
 +8K9950MrYP/fWEA56vn6S7X0G3SJggUhCvIfQ04lV0bpHowouZX03UZN9ixO/QTbDT9vO
 ch1UzB3XISRjsxBPPhCYJBSy5B99k6yvW4lPWiQWwJ940wrNpGEP9p2NFKDKoR/sXg8MZP
 KkY7ZpYIyQK90tSLIFR9JeOqGMa98FsRT3mY71tYqNiIp8Iv/ttkeH0Dw7gxoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:39 +0100
Message-Id: <DF1JDXPWYWVQ.2FSDNACYTUOMH@bootlin.com>
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
Subject: Re: [PATCH RESEND v2 12/32] drm/vkms: Introduce configfs for plane
 color encoding
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-12-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-12-a49a2d4cba26@bootlin.com>
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
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color encoding per planes. VKMS
> supports multiple color encoding, so the userspace can choose any
> combination.
>
> The supported color encoding are configured by writing a color encoding
> bitmask to the file `supported_color_encoding` and the default color
> encoding is chosen by writing a color encoding bitmask to
> `default_color_encoding`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 104 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index eac1a942d6c4..dab6811687a2 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>
> -Planes have 4 configurable attributes:
> +Planes have 6 configurable attributes:
>
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -97,6 +97,11 @@ Planes have 4 configurable attributes:
>    (same values as those exposed by the "rotation" property of a plane)
>  - default_rotation: Default rotation presented to the userspace, same va=
lues as
>    possible_rotations.
> +- supported_color_encoding: Available encoding for a plane, as a bitmask=
:
                                         encodings

> +  0x01 YCBCR_BT601, 0x02: YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as=
 those exposed
                           ^

Unintended colon? While I think it's nice to have, there is none elsewhere,
even in previous patches, and I'd say we can live happy without.

> +  by the COLOR_ENCODING property of a plane)
> +- default_color_encoding: Default color encoding presented to the usersp=
ace, same
> +  values as supported_color_encoding
>
>  Continue by creating one or more CRTCs::
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index 7cc8ba315ef0..ee2e8d141f9e 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -439,16 +439,114 @@ static ssize_t plane_default_rotation_store(struct=
 config_item *item,
>  	return count;
>  }
>
> +static ssize_t plane_supported_color_encodings_show(struct config_item *=
item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_encoding;
                     supported_color_encodings

> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

As for patch 9, for consistency:

  struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane(i=
tem);

> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		supported_color_encoding =3D vkms_config_plane_get_supported_color_enc=
odings(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", supported_color_encoding);
> +}
> +
> +static ssize_t plane_supported_color_encodings_store(struct config_item =
*item,
> +						     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020))) =3D=3D 0)

I'm mentioning here as it comes to mind, but it's valid for other similar
patches in this series: why not adding a

  #define DRM_COLOR_ENCODINGS_SUPPORTED ( \
                   BIT(DRM_COLOR_YCBCR_BT601) |
                   BIT(DRM_COLOR_YCBCR_BT709) |
                   BIT(DRM_COLOR_YCBCR_BT2020))

and use it in place of the various bitwise-or sequences?

This would simplify work later on if adding a new color encoding (or color
range, or...).

Somewhat like DRM_MODE_*_MASK.

> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */
> +		if (plane->dev->enabled)
> +			return -EINVAL;

And here the comment is definitely wrong. :-)

> +
> +		vkms_config_plane_set_supported_color_encodings(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_c=
olor_encoding */

There's no such comment in other places, so for consistency remove it (or
add it everywhere?!? ... no, just kidding).

> +
> +static ssize_t plane_default_color_encoding_show(struct config_item *ite=
m, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int default_color_encoding;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		default_color_encoding =3D vkms_config_plane_get_default_color_encodin=
g(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", default_color_encoding);
> +}
> +
> +static ssize_t plane_default_color_encoding_store(struct config_item *it=
em,
> +						  const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020))) =3D=3D 0)
> +		return -EINVAL;

Shouldn't you check that exactly one bit is set? As in patch 9.

> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */
> +		if (plane->dev->enabled)
> +			return -EINVAL;

As before, wrong comment.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
