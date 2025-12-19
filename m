Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBACD17D9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EB710F05F;
	Fri, 19 Dec 2025 18:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="snV9zI0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028110F05F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 18:57:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C6AA44E41CBB;
 Fri, 19 Dec 2025 18:57:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D6DC6071D;
 Fri, 19 Dec 2025 18:57:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 372E9102F0CDA; Fri, 19 Dec 2025 19:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766170661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dIa+0Pm+rJC3c2yDGt7NMsO5ovUl2mVYboACIUpoTq4=;
 b=snV9zI0c3jlzWG+O7rOGmD4AaNnAdT1vEdSper2xcvA+4k6VdqFk0n8rUWTd7fG7fdIo59
 tAGa48MgpbtJQdvWWQiNGzEV0tqMauSFCytfEAo+jmEk0rTVU4lvMSZK9AT2yD8I6mCtAm
 CTZOLP6Ss574SxDh/tuNBAqzHj4uS0Hmfsie3gOiQLn7GCu/jlfzdKgwakEh8ZOI/MKoJz
 ukv2ib0H//2wiagIAVZ7lulOTOTQO0YejYWvefkyAbJ3/GsT7NvYo7aw5VpbsRa+N12qaN
 u7VvV2cHkyhku+fF3brkZjCuc57gXDIxEfPiiX7gZoH9oq00AdHoMtWXBtUPcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:57:37 +0100
Message-Id: <DF2F8V3VP4U5.HKD4OK3V0OT8@bootlin.com>
Subject: Re: [PATCH RESEND v2 28/32] drm/vkms: Store the enabled/disabled
 status for connector
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
 <20251029-vkms-all-config-v2-28-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-28-a49a2d4cba26@bootlin.com>
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
> In order to prepare for dynamic connector configuration, we need to store
> if a connector is dynamic and if it is enabled.
>
> The two new vkms_config_connector fields will helps for that.
>
> Co-developed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -130,6 +130,8 @@ struct vkms_config_encoder {
>   * @link: Link to the others connector in vkms_config
>   * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
> + * @dynamic: Store if a connector should be created with drm_connector_d=
ynamic_init
> + * @enabled: If @dynamic, this means that the correct is currently regis=
tered in drm
                                                 ^^^^^^^
						 "connector", I guess.

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
