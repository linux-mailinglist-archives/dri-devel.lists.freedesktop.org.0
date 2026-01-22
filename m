Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LFCODEucmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:03:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839467A99
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7410E9B8;
	Thu, 22 Jan 2026 14:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OkiQK3Bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DEA10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C03D600CB;
 Thu, 22 Jan 2026 14:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EDDC116D0;
 Thu, 22 Jan 2026 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769090604;
 bh=3SHkyRGYKQ9i0FYPx3pRbT9QJT80ZePTrHdczjnXiWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkiQK3BsP1UxoTEIDr+vIclBy0qGP6nUp9EjpTxDWH9+CXX0/Yg8JbgmmhpdMGcmE
 m94q7Pd0mQ7BV6F03TkQSVNiAafPQovTzjZc94OJCSjdokwbyUwLcYO+AEewleCh48
 AcsaREyJ5cy9B2bPVQHiGkMVPQpUkuL9V66imBc/Bwb0ta+3tfFvB1849FiTOvBRVz
 QyW3l/vevpPBhqN/QiaV1oSh+AQNTJGMdZDqHiI8caRNophFKmbgV8E636M1tVj4BS
 yjU5uAkTD0p85/R/NXcxrqZ8/TIaiSvPHehb33T9zC58dBVZgS4SDAYmyFgCBi9inm
 E0yYHmJO68rlQ==
Date: Thu, 22 Jan 2026 15:03:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge() helper
Message-ID: <20260122-camouflaged-cat-of-sorcery-7af8cf@houat>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
 <DFSVNE16870S.ABQUMH9BWMDY@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="koxasmrivanfnujl"
Content-Disposition: inline
In-Reply-To: <DFSVNE16870S.ABQUMH9BWMDY@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:kory.maincent@bootlin.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,iki.fi,ideasonboard.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.org,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se,baylibre.com,ti.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6839467A99
X-Rspamd-Action: no action


--koxasmrivanfnujl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge() helper
MIME-Version: 1.0

Hi,

On Mon, Jan 19, 2026 at 10:18:12PM +0100, Luca Ceresoli wrote:
> Maxime, I'd appreciate your opinion about the topic below.
>=20
> On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> > Replace drm_of_find_panel_or_bridge() with the newer
> > devm_drm_of_get_bridge() helper which simplifies the code by:
> > - Automatically handling both panel and bridge cases internally
> > - Managing the panel-to-bridge conversion when needed
> > - Using devres for resource management, eliminating manual cleanup
> >
> > This removes the need for explicit panel-to-bridge conversion via
> > devm_drm_panel_bridge_add_typed() and the associated error handling pat=
h.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v4:
> > - New patch
> > ---
> >  drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 18 ++++--------------
> >  1 file changed, 4 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/=
tilcdc/tilcdc_encoder.c
> > index a34a10337f6a8..546fe7e6ee815 100644
> > --- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> > @@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
> >  	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(ddev);
> >  	struct tilcdc_encoder *encoder;
> >  	struct drm_bridge *bridge;
> > -	struct drm_panel *panel;
> > -	int ret;
> >
> > -	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> > -					  &panel, &bridge);
> > -	if (ret =3D=3D -ENODEV)
> > +	bridge =3D devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0=
);
> > +	if (PTR_ERR(bridge) =3D=3D -ENODEV)
>=20
> This patch is technically OK in the sense that the code before and after
> would be equivalent. However if it were me I would not do this change. The
> reason is that both drm_of_find_panel_or_bridge() and *_of_get_bridge() a=
re
> problematic when introducing drm_bridge hotplug, which is the long-term
> goal I am working for, but *_of_get_bridge() is more problematic than
> drm_of_find_panel_or_bridge().
>=20
> These functions are still there and not deprecated because there is
> currently no better replacement (and drm_bridge hotplug is not yet
> supported because of this and other things still to be done). To have a
> replacement, the panel_bridge lifetime needs to be reworked first and
> that's not going to happen overnight. So, all in all, if this patch is not
> crucial to your series I'd consider dropping it. But if it is important I=
'm
> fine with applying it, it won't make a huge difference.

Eh. I'm fine either way. I understand what you're saying, but this patch
doesn't introduce any *new* problem while it cleans up the driver, so I
guess we could merge it still. And further clean it up with what you
were suggesting later on.

Maxime

--koxasmrivanfnujl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXIuKQAKCRAnX84Zoj2+
dmgwAYDLY4OXhO7mg+WUhmw0Yc4L5lUQhZ+IdcuEGFz8PoHCodhBLdEMRMEQeyrZ
Lg3ek6YBgKnjvmAsvQieYruFGJdc16JOzCVf95Xa7TlPn2/TL9Du2bGHrv7SWGiW
2GbEtp3WOw==
=T8Px
-----END PGP SIGNATURE-----

--koxasmrivanfnujl--
