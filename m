Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F69CD1D2C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AE410F0B0;
	Fri, 19 Dec 2025 20:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OYGJsedu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93E910F0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 20:47:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 71C4B4E41CB9;
 Fri, 19 Dec 2025 20:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4779A6071D;
 Fri, 19 Dec 2025 20:47:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE1F710AA98BF; Fri, 19 Dec 2025 21:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766177264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9gXg0kbUoCzWmdPvs9+PPLPaMkPQe5hr/VAOAnA+F0s=;
 b=OYGJseduHQ8jtvy/DjtZHNn701lAfDiSE6OZKcVWe4UeL1q59fhq6w9j3Q9IV+lEQkcYx8
 DZhIzQ8ZWDoFGm5ywfKjQna+9AQw3yNM/4U2YVLObQDXmuxX+tEXMQZGXHl5wV8g4vytdG
 McqpLNvjxAaE3WRewyV5s6qhM8RH1nJH0ucCrTFtEkVABwt4XlkqYVRYsM1idzZPuNqR7u
 tZ3Uw4cxKf6ZQ5Qbe5GbgrjKTkySOzONmS8R+RC4V3duh8m3EFKbTiTkEeBx7pbRc4QO0t
 yubsArcIyXn6GghzcPv9jmo2dyDdStwflEmntpX7NizGVUkPbRVs3bfgJfRjcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:47:42 +0100
Message-Id: <DF2HL59FY4JR.23CL0EHNOQF18@bootlin.com>
Subject: Re: [PATCH RESEND v2 31/32] drm/vkms: Allow to hot-add connectors
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
 <20251029-vkms-all-config-v2-31-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-31-a49a2d4cba26@bootlin.com>
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
> In order to allow creating dynamic connector, add the required
> infrastructure in vkms_connector.
>
> Co-developed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> [Louis Chauvet: use drm_atomic_helper_connector_reset instead of
> drm_mode_config_reset because connector is not yet registered]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -34,4 +34,36 @@ struct vkms_connector *vkms_connector_init_static(stru=
ct vkms_device *vkmsdev,
>   */
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
>
> +/**
> + * vkms_connector_hot_add() - Create a connector after the device is cre=
ated
> + * @vkmsdev: Device to hot-add the connector to
> + * @connector_cfg: Connector's configuration
> + *
> + * Returns:
> + * The connector or an error on failure.

"A pointer to the newly created connector or a PTR_ERR on failure."

> + */
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsde=
v,
> +					      struct vkms_config_connector *connector_cfg);
> +
> +/**
> + * vkms_connector_hot_remove() - Remove a connector after a device is cr=
eated

Missing kdoc for @vkmsdev:

@vkmsdev: Device to containing the connector to be removed

> + * @connector: The connector to hot-remove
> + */
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector);

With these changes:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
