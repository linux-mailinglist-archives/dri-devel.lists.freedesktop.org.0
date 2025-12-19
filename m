Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364FCD0669
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 15:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B035810E49C;
	Fri, 19 Dec 2025 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rSZSLSSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647910E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 14:55:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DA13C4E41C87;
 Fri, 19 Dec 2025 14:55:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA7DD6071D;
 Fri, 19 Dec 2025 14:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58568102F0B7F; Fri, 19 Dec 2025 15:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766156110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GV9S+xc9D71Uwlbo2vNh/GdtKzweopawR08NIo0wto4=;
 b=rSZSLSSj61Ppq8s5mGApSpZT2fEpy5KklEyIXMQ7Z9kXpAN8YnfHpsq3dVgctjiKk3AAFq
 d/cQIW/kSKd89pVlQaxXtTt2ddv/67W29RJ+tjMWIwCjODjiN0Dlv/72H1V9Kl0aa9WINQ
 t08JcxDeU/m2WnXkNz7AaW1OVCm9EQr5CVvfoAizlmOocRtc/H+yljTe6HB1+9DiHCBiVA
 U6AUV55ome4WuGFMoSXBVMYFQrXWJ5SHTzHx38iG8Dn44QFbQBnsLBbk7tI7eFz/Bjm9rL
 Z2m98of2PcG109M9rL7WOWK1Akukb7j+U9cNTSeYsuLF64/Qr3b6RvtGe5iOUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 15:55:03 +0100
Message-Id: <DF2A35683YPN.2TH0WT8JJAJ70@bootlin.com>
Subject: Re: [PATCH RESEND v2 16/32] drm/vkms: Introduce config for plane
 format
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
 <20251029-vkms-all-config-v2-16-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-16-a49a2d4cba26@bootlin.com>
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

Hi Louis,

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> VKMS driver supports all the pixel formats for planes, but for testing it
> can be useful to only advertise few of them. This new configuration
> interface will allow configuring the pixel format per planes.

[...]

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> +int __must_check vkms_config_plane_add_format(struct vkms_config_plane *=
plane_cfg, u32 drm_format)
> +{
> +	bool found =3D false;
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(vkms_supported_plane_formats); i++) {
> +		if (vkms_supported_plane_formats[i] =3D=3D drm_format) {
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found)
> +		return -EINVAL;
> +	for (unsigned int i =3D 0; i < plane_cfg->supported_formats_count; i++)=
 {
> +		if (plane_cfg->supported_formats[i] =3D=3D drm_format)
> +			return 0;
> +	}
> +	u32 *new_ptr =3D krealloc_array(plane_cfg->supported_formats,
> +				      plane_cfg->supported_formats_count + 1,
> +				      sizeof(*plane_cfg->supported_formats), GFP_KERNEL);
> +	if (!new_ptr)
> +		return -ENOMEM;
> +
> +	plane_cfg->supported_formats =3D new_ptr;
> +	plane_cfg->supported_formats[plane_cfg->supported_formats_count] =3D dr=
m_format;
> +	plane_cfg->supported_formats_count++;
> +
> +	return 0;
> +}

This whole logic appears quite complex for what you need here. I suspect
using the facilities in linux/bitmap.h would make your code simpler by
allocating a (multi-)ulong array of
ARRAY_SIZE(vkms_supported_plane_formats) bits. This would surely use less
memory and avoid all reallocations, too.

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h

> +/**
> + * vkms_config_plane_remove_format - Remove a specific format from a pla=
ne
> + * @plane_cfg: Plane to remove the format to
> + * @drm_format: Format to remove
> + */
> +void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg=
, u32 drm_format);
> +
> +/**
> + * vkms_config_plane_remove_all_formats - Remove all formast from a plan=
e
                                                        formats

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
