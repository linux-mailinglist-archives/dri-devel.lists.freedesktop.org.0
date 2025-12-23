Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C27CD986B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 14:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3710E0AC;
	Tue, 23 Dec 2025 13:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TFD0/RoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70B910E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 13:58:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9E8C31A22CA;
 Tue, 23 Dec 2025 13:58:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 726E360716;
 Tue, 23 Dec 2025 13:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02B5B10AB01FB; Tue, 23 Dec 2025 14:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766498320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HLkKJS2rHiIFhybIukApvYrnY+KhUJ/RYP4y50IAjSU=;
 b=TFD0/RoM8iG9/gTuY94gAMIllq8p9Plp0ZG7dZMO6MWFb7UiP0AhG4piN6REqTGUn18Zsh
 3vnIuAm2rg+7DouE/KwslaJhYdXQZr1agZG3NUult0CNOTkJdqRfH886EaHnIjnvpEQpK/
 XkymFCA0jKcJT3ibLBViK4+TbvH3MrORIWHu6i0LmaTRT0BupJgCsQMHWhu/4+6/+BU9vB
 ILshiZsL8kCF1LZk33jV3eV5iovbtnIg8cHgXMx+lR80oQ5RH6UBjFLqA+1JA1AHPepTPB
 w/I9aNTcj3YnQDUFFzSqlzlV8+3+yXqPqAvE4SNAdjIVeCCRzSFGktzCItz8QQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 14:58:37 +0100
Message-Id: <DF5NE3Y8O21F.1KKJWMX9JVXUP@bootlin.com>
Subject: Re: [PATCH v3 17/33] drm/vkms: Introduce config for plane format
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
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-17-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-17-ba42dc3fb9ff@bootlin.com>
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

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS driver supports all the pixel formats for planes, but for testing it
> can be useful to only advertise few of them. This new configuration
> interface will allow configuring the pixel format per planes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c

> +void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plan=
e_cfg)
> +{
> +	plane_cfg->supported_formats_count =3D 0;

Why not kfree(plane_cfg->supported_formats) too? You will be (re)allocating
anyway if adding one or all formats later on, so the buffer you're not
freeing won't be reused anyway.

> +}
> +
> +void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg=
, u32 drm_format)
> +{
> +	for (unsigned int i =3D 0; i < plane_cfg->supported_formats_count; i++)=
 {
> +		if (plane_cfg->supported_formats[i] =3D=3D drm_format) {
> +			plane_cfg->supported_formats[i] =3D plane_cfg->supported_formats[plan=
e_cfg->supported_formats_count - 1];

I doubt these are less than 100 chars. ;-)

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -49,6 +49,8 @@ struct vkms_config {
>   * @supported_color_encodings: Color encodings that this plane will supp=
ort
>   * @default_color_range: Default color range that should be used by this=
 plane
>   * @supported_color_ranges: Color ranges that this plane will support
> + * @supported_formats: List of supported formats
> + * @supported_formats_count: Length of @supported_formats

Nitpick: this description is not adding much. "Number of elements in
@supported_formats" would be more useful, as it would clarify it's number
of (4-bytes) elements and not size in bytes.

> +int __must_check vkms_config_plane_add_format(struct vkms_config_plane *=
plane_cfg, u32 drm_format);
> +
> +/**
> + * vkms_config_plane_add_all_formats - Helper to quickly add all the sup=
ported formats
> + * @plane_cfg: Plane to add the formats to
> + *
> + * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if =
the format is not supported
> + * by VKMS

The "-EINVAL ... VKMS" part of the sentence does not apply here.

> +/**
> + * vkms_config_plane_remove_format - Remove a specific format from a pla=
ne
> + * @plane_cfg: Plane to remove the format to
                                             ^^ from

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
