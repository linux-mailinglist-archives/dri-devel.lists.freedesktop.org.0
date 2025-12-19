Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A0CD17A3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D94810F073;
	Fri, 19 Dec 2025 18:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BwdqPx0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C47510F073
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 18:56:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3BBE81A22FA;
 Fri, 19 Dec 2025 18:56:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11BB76071D;
 Fri, 19 Dec 2025 18:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2D9B102F0BC0; Fri, 19 Dec 2025 19:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766170574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xVLiT30rrzI+caALdQHc2M3O0nXczZJjjL/MlbRBpF4=;
 b=BwdqPx0VcpiDNIHSkTfo0mJ2lVV57ChAmcm97fpxB9S7YaKEaeX0eei/u9TpUUwjNwpT4a
 QdZuLk1hny96Sjk+jmb4fz/rl8spH5NG6C3uI5sNMQmpOP4jUfaeXTvubgWFKYAKZgv5T4
 VJ4NvNaXZBWqtHdgYpzr02eTGSoxbI3WiD50hk8gCKIAlRwiI4KJ4auvLf2orvs3I+xfRR
 zUisWXnI63jPgBWsrS2lXbXGNufTrkTL3Z5guF/PFXvu3PgntL5XAOEkVQK101T3DFV+78
 5rmFTXmAwZj/s+q8P2KrygdmacoQY8mYxrN6LZyDayyitDlOQg/ezjWzldXN6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:56:12 +0100
Message-Id: <DF2F7RYZIKZK.3JSY7DU2RCGOR@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 26/32] drm/vkms: Introduce config for
 connector EDID
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
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-26-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-26-a49a2d4cba26@bootlin.com>
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

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> Allows configuration of EDID for each connector.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> +/**
> + * vkms_config_connector_set_edid() - Set the EDID data for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @edid: Pointer to the EDID data buffer
> + * @len: Length of the EDID data
> + *
> + * If @len is 0, the EDID data will be cleared. If memory allocation fai=
ls,
                                                 ^

Adding "and @edid ignored" would be useful.

>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
> -	int count;
> +	struct vkms_connector *vkms_connector =3D drm_connector_to_vkms_connect=
or(connector);
> +	const struct drm_edid *drm_edid =3D NULL;
> +	int count =3D 0;
> +	struct vkms_config_connector *context =3D NULL;
> +	struct drm_device *dev =3D connector->dev;
> +	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
> +	struct vkms_config_connector *connector_cfg;
>
> -	/* Use the default modes list from DRM */
> -	count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> -	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +		if (connector_cfg->connector =3D=3D vkms_connector)
> +			context =3D connector_cfg;

You can add a break statement here to avoid keeping on looping after the
connector has been found.

With the above two changes:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
