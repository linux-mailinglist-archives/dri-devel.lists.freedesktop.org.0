Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F083C23CAE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD3C10E2BF;
	Fri, 31 Oct 2025 08:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2QsFma29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55110E2BF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:27:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CFDC4E41431;
 Fri, 31 Oct 2025 08:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40D1960704;
 Fri, 31 Oct 2025 08:27:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0386711808C56; Fri, 31 Oct 2025 09:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761899253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=76uNIUxc2i2CUF22jYSwyi2Mw9C6H4Old0YYKI8BGFg=;
 b=2QsFma29dzgoL8GUr672ddHPgk5H3bRCZwyWPO/lcE/c8IRQfgnWlJ7VmzRwUphzggoN0z
 xS4+8Zu5tnHf8b1uK+F2AtZVmJX+l0SmZIqwiScFnnCh4Vn4CfLaTqUUQ/wrtpdbPDl67z
 DwJWtTSOjFhAiohmYoTzzRSF1rXfG4VCpk7nUXb2EgMm1bivB5qEYmmkrLxBn72OIoQeqa
 CKkkXOfExYybIlCeIRa6DaCaYWq2lyD7q2ehignpSCor58ClX4aY2duiBY62IgjdPRgcA5
 j9bryYwyrdzqDUXRKbKg6XDgTTBkbLIlTqUN/iboXCRwEHzZfEXmkqyK8GT5xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Oct 2025 09:27:29 +0100
Message-Id: <DDWD5P3SKWMV.1LITMN6MAKGMA@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, <imx@lists.linux.dev>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.20.1
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-3-a1e8dab8ae40@oss.nxp.com>
In-Reply-To: <20250911-dcif-upstreaming-v5-3-a1e8dab8ae40@oss.nxp.com>
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

Hello Laurentiu,

On Thu Sep 11, 2025 at 1:37 PM CEST, Laurentiu Palcu wrote:
> i.MX94 series LDB controller shares the same LDB and LVDS control
> registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> frequency.
>
> Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> be able to set different max frequencies for other platforms.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

[...]

> @@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  		   const struct drm_display_mode *mode)

I'd suggest a couple possible code style improvements here:

>  {
>  	struct fsl_ldb *fsl_ldb =3D to_fsl_ldb(bridge);
> +	u32 ch_max_clk_khz =3D fsl_ldb->devdata->max_clk_khz;

You don't need a variable to use it only once.

>
> -	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> +	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_m=
ax_clk_khz))

And here you can use the ternary operator to compute the multiplier only:

	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->m=
ax_clk_khz)

Up to you whether you want to take my proposals above. The patch looks good
anyway, so with or without those changes:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
