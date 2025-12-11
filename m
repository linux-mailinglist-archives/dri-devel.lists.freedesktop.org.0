Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C4CB5611
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 10:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F63310E2A7;
	Thu, 11 Dec 2025 09:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N8BY+0RW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DBD10E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:40:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 17EB01A20DF;
 Thu, 11 Dec 2025 09:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF0096068C;
 Thu, 11 Dec 2025 09:40:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14F2B103C8D53; Thu, 11 Dec 2025 10:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765446032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WZVCcNfKSTt2Hd14gUawnCXPs39wl8U5m2GxT9YHICY=;
 b=N8BY+0RW1/KCWSmz1ejzT8wkU32hMHoROWuSW1FXKVX56lJPTLnrOG87aYRBJX3eLmwdQz
 ElonbiZKTB2yohpJE+9k8TDVw2t9dMGuu4ov3c9BVvflGTXLZViwe/G9lROCs1KMjA5Cg1
 HqAOW3glYucmbg2jWQCfC+vmSqV0f3bRAfIGwFYLKzsrZIZn5PifwpK4SdhZWFCK8zSDep
 NJinbhnm5mFm/zI9m2xrgrfv6TFXNgAyWJZmSCZG+MROAk2te2haBPin+EoimEwAAmRl4c
 665fBJnGyGTn7KpP/dBIwnBN6Ey1VxFEPONWoRQP8/KCoFPe22GeYDOR7es8FA==
Date: Thu, 11 Dec 2025 10:40:24 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
 <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Dec 2025 19:10:45 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hi K=C3=B6ry,
>=20
> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> > The tilcdc hardware does not generate VESA-compliant sync signals. It
> > aligns the vertical sync (VS) on the second edge of the horizontal sync
> > (HS) instead of the first edge. To compensate for this hardware
> > behavior, the driver applies a timing adjustment in mode_fixup().
> >
> > Previously, this adjustment was conditional based on the simulate_vesa_=
sync
> > flag, which was only set when using external encoders. This appears
> > problematic because:
> >
> > 1. The timing adjustment seems needed for the hardware behavior regardl=
ess
> >    of whether an external encoder is used
> > 2. The external encoder infrastructure is driver-specific and being
> >    removed due to design issues
> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
> >    may not be getting the necessary timing adjustments
> >
> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
> > adjustment unconditionally, ensuring consistent behavior across all
> > configurations. While it's unclear if the previous conditional behavior
> > was causing actual issues, the unconditional adjustment better reflects
> > the hardware's characteristics.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Only few board currently use tilcdc not associated to a bridge like the
> > am335x_evm or the am335x-evmsk. =20
>=20
> Have you tested this change on any affected board?
>=20
> The change looks good to me but without some testing it would be risky.

I have tested it on few boards but not these mainline devicetree as I don't
have them.

I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc with
ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 bri=
dge
(new Beagle Bone Green Eco board with HDMI cape).
That's all the boards I have.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
