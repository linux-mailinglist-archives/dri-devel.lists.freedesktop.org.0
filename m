Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F79458CE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 09:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369510E998;
	Fri,  2 Aug 2024 07:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="zp/TqSzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1810 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2024 07:30:48 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFB010E99D;
 Fri,  2 Aug 2024 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=References:Cc:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNOEhidxMr88WUeRwjolcg948ZGsyDBZIrg4gRDa9l4=; b=zp/TqSztDeBrtRbgdjrSfwz3QT
 3IalpkIfeQjyLgkBeC/TOpv++FMXsYcKe3GFm88YWCaABWIOFBT9MnWHVay6jnMqfsW3vkiPbPOvl
 xLTNzJ8Dtk/YUElZJcwrtKrfh8oAbeqijEs/tgitD1AIYHn6ahOwxMfeEopYV6HtklI0n1OXlCrlu
 eeoNtryeqXSY3s5MUPCnY81iRgPqsWcpnCAvtcG0T7BRiLckh1Cc/gfGxCcH4rBwvq034ysVCchL/
 R64dgvXX8sZwl+RjuhPvTUuVvrIMXZtMD/nMQoJMLz8zcVk2ikaeUIVjF6Zc0XYawsH2KrNOXUJ2K
 yvyK8x/A==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1sZmH3-00E0j4-10;
 Fri, 02 Aug 2024 10:00:25 +0300
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 07:00:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <907bfa7ecffde2e2b0550edf183d6c58b6caf42d@iki.fi>
Subject: Re: [PATCH 9/9] drm/tilcdc: Use backlight power constants
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
References: undefined <20240731122311.1143153-1-tzimmermann@suse.de>
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

July 31, 2024 at 3:17 PM, "Thomas Zimmermann" <tzimmermann@suse.de mailto=
:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%40su=
se.de%3E > wrote:

>=20
>=20Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality or semantics.
>=20
>=20Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Thank,
Jyri

> drivers/gpu/drm/tilcdc/tilcdc_panel.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/=
tilcdc/tilcdc_panel.c
> index 68093d6b6b16..5f2d1b6f9ee9 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> @@ -49,7 +49,7 @@ static void panel_encoder_dpms(struct drm_encoder *en=
coder, int mode)
>=20
>=20 if (backlight) {
>  backlight->props.power =3D mode =3D=3D DRM_MODE_DPMS_ON ?
> - FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> + BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
>  backlight_update_status(backlight);
>  }
>=20
>=20--=20
>=202.45.2
>
