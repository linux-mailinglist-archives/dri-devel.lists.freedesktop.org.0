Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C8CD90B5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C410E2A3;
	Tue, 23 Dec 2025 11:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bMsmfwAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053AB10E2A3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:13:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 47B3DC1AE1F;
 Tue, 23 Dec 2025 11:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B4B260716;
 Tue, 23 Dec 2025 11:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A4E8010AB091E; Tue, 23 Dec 2025 12:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766488376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mB0Qz80nHWgjnD9I+aol8xVD4b/U+N6gGueNxTCJ/Og=;
 b=bMsmfwAyPoECFEIzIAcVrxvcpScOAnBt6c2+htz2HQk99cUagpmeTVzjNb0g32k/0h2hUA
 eV541nb/Duw/vZVgVr2G8KPfCf33wdeYF872YWzp+VMQb9UqWMa6cbdcJoale8gqbVFbvz
 7OoNbxIr0DijClVPoUbCES15Wsd8gAZAJFO444+210jjbRPEwQVGY2iM641DTptZuE2mBg
 PdClYH8YwLbR4d7E9NDXG5+K6OHqLqD0Sy3d1jIrpAnW1+YqPt8Y5SUGKWYEb1Xn2ACyzW
 Cl1EB2NokaWXloTWjb5obEcoMIJzoi28zY6MbuVuphH3mP8rX76rrDg1H3hryg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:12:54 +0100
Message-Id: <DF5JV82SZNTD.2S30QYBBSO6DA@bootlin.com>
Subject: Re: [PATCH v3 02/33] drm/drm_mode_config: Add helper to get plane
 type name
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
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
 <20251222-vkms-all-config-v3-2-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-2-ba42dc3fb9ff@bootlin.com>
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
> Create and export an helper to display plane type using the
> property string. This could be used to display debug
> information in VKMS.
>
> Reviewed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito@redhat.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index d12db9b0bab8..c940a67e255b 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -231,6 +231,22 @@ static const struct drm_prop_enum_list drm_plane_typ=
e_enum_list[] =3D {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>
> +/**
> + * drm_get_plane_type_name - return a string for plane name
> + * @type: plane type to compute name of
> + *
> + * Returns: The name of the plane type. "(unknown)" if type is not a kno=
wn
> + * plane type.
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type > 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
This should be:  >=3D 0

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
