Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73FCD90DF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C722110E2B1;
	Tue, 23 Dec 2025 11:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CIblix8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9FD10E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:14:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A3D571A23A1;
 Tue, 23 Dec 2025 11:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A52960716;
 Tue, 23 Dec 2025 11:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 575C410AB09D9; Tue, 23 Dec 2025 12:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766488455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h3o+jYMgms8cRmesAzwy75E53VOTuMFwQGWtFoC/cuc=;
 b=CIblix8oQGNkFwa8tearxS9xKdlkic349PmeDnYyPm80lnKO1tsDzmUcEYjp0D7I/ZzokA
 l/CMR6b3ZKZO/8dsGBrElGdYOFUYXN50dVHdDMWjVytXobkueHKMy4fKQszX9qi+mzI1MO
 FJv0eOwM53drKtzyfRsMaGvY0p5dSfaWDn3GXclPGIupAHXZoT/uCEWq9F0lDN+XJi37RI
 gu97J8ss2UhhyN6aeXKY4P3a4NE4350q2CVFPAeYkUr1+8qcq0vwg7dFP/3t6B7nP2QxyM
 WOH6E0IgFrRBcRLNw/4QeMTouU42HoX+4wGzxfAs3SnT7J1u8xBSpBRl4UBIKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:14:12 +0100
Message-Id: <DF5JW87258M7.2BEL9XFX1RMTW@bootlin.com>
Subject: Re: [PATCH v3 10/33] drm/vkms: Introduce configfs for plane rotation
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
 <20251222-vkms-all-config-v3-10-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-10-ba42dc3fb9ff@bootlin.com>
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
> To allows the userspace to test many hardware configurations, introduce a
> new interface to configure the available rotation per planes. VKMS
> supports any rotation and reflection, so the userspace can choose any
> combination.
>
> The supported rotations are configured by writing a rotation bitmask to
> the file `supported_rotations` and the default rotation is chosen by
> writing a rotation bitmask to `default_rotation`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -365,24 +365,105 @@ static ssize_t plane_name_store(struct config_item=
 *item, const char *page,
>  	return (ssize_t)count;
>  }
>
> +static ssize_t plane_supported_rotations_show(struct config_item *item, =
char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_supported_rotations;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

You seem to have missed "assign on declaration" here (but you did it in
plane_default_rotation_show()).

The code added w.r.t. v2 looks OK as well, so with the above nit fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
