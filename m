Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CBCCD10F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F95A10EA4E;
	Thu, 18 Dec 2025 18:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oavx17NP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670C10EA4E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:00:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C68054E41C91;
 Thu, 18 Dec 2025 18:00:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B75660715;
 Thu, 18 Dec 2025 18:00:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B1125102F0B66; Thu, 18 Dec 2025 18:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BFK3V89iVHuZJBa6vSsSmmmTu6bXzz29SnYF25k2xlc=;
 b=oavx17NPOGY8okb8f30ZWu45gJMJu3/0iigviezRHSlHzeMsXWnzqic0fmp/RkUdmVAO06
 AAiCFhl1zKWxfThXJxnOQ7cW4422qT4qBO1QoOUmzME1FXR+08R5biwK91Ob7a2wB0gyfR
 I50E0ZQmfJghU4+/LyVS0Qlh0AAYMtOhfLOyh46fmO5KmJwREEwlCOhm3BFXYW7bKYasfM
 swMPNXttNOAey/Nlfd+w4FnrfvldV3mRA6L5DGhA7AT0aAVB9p40XSpmsI9+loTkxJ8qXc
 LHj0fzX5ui0RRFBiLCaEXRs/RFPOD8uNW6fkSu4NdqT2AaWYiIHS0phXwYb4Dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:55 +0100
Message-Id: <DF1JE4UKS0X1.2KM5UAE92I3UZ@bootlin.com>
Subject: Re: [PATCH RESEND v2 14/32] drm/vkms: Introduce config for plane
 color range
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
 <20251029-vkms-all-config-v2-14-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-14-a49a2d4cba26@bootlin.com>
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
> VKMS driver supports all the color range on planes, but for testing it ca=
n
> be useful to only advertise few of them. This new configuration interface
> will allow configuring the color range per planes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c

> @@ -359,6 +379,16 @@ bool vkms_config_is_valid(const struct vkms_config *=
config)
>
>  		if (!vkms_config_valid_plane_color_encoding(config, plane_cfg))
>  			return false;
> +
> +		if (!vkms_config_valid_plane_color_range(config, plane_cfg))
> +			return false;
> +
> +		if ((vkms_config_plane_get_supported_color_encodings(plane_cfg) =3D=3D=
 0) !=3D
> +		    (vkms_config_plane_get_supported_color_ranges(plane_cfg) =3D=3D 0)=
) {
> +			drm_info(dev,
> +				 "Both supported color encoding and color range must be set, or none=
\n");
                                                       encodings          r=
anges

> @@ -441,6 +471,12 @@ static int vkms_config_show(struct seq_file *m, void=
 *data)
>  		seq_puts(m, "\n");
>  		seq_printf(m, "\tdefault color encoding=3D%s\n",
>  			   drm_get_color_encoding_name(vkms_config_plane_get_default_color_en=
coding(plane_cfg)));
> +		seq_puts(m, "\tsupported color range=3D");
                                               ranges

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -47,6 +47,8 @@ struct vkms_config {
>   *         must be managed by other means.
>   * @default_color_encoding: Default color encoding that should be used b=
y this plane
>   * @supported_color_encodings: Color encoding that this plane will suppo=
rt
> + * @default_color_range: Default color range that should be used by this=
 plane
> + * @supported_color_ranges: Color range that this plane will support
                                     ranges

With those fixed you can add:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
