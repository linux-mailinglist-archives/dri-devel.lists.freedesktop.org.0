Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB9C9B87B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 13:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97510E06A;
	Tue,  2 Dec 2025 12:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ffvFEagv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E4C10E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 12:56:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1A8C34E419D8;
 Tue,  2 Dec 2025 12:56:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0331606D3;
 Tue,  2 Dec 2025 12:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDFCC119197A7; Tue,  2 Dec 2025 13:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764680176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QFgcSxDwjQGmQohC290QGXRTuVmXVyuOEalaNkjC4ws=;
 b=ffvFEagvHMxcxYiWtdroyPQNdvLv1ifz3VFkmfX4Ma1/lCwCnkcQ1z5TloYCThJtsNEbVR
 Tl/HXf05ZSSsQobwVSpvnrzOwTaoF2ngm/scJqKUw4cv0uYRkdxjpM1gD8kqvNzOsB7587
 mJ0C7A89FtwW3hcIYb3WEx0KSbOMoDe2FjigWHBimIoYM7Y08gzh8unAKgbBlc/8Y2Ts11
 Apq5W3jhmeRmm2svhWKmIIw4sHHpyUfjA7BCBRKtOdMPEnAR6VoYOa4zbh4TFL1Dd15DKi
 1nAQwvVkD6UErGkIJJIuJwWxon9Z21z/34FWPZaLONeELfD6Cis5CRYWNdejRw==
Date: Tue, 2 Dec 2025 13:56:05 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead
 of ti,tilcdc,panel driver
Message-ID: <20251202135605.053ada96@kmaincent-XPS-13-7390>
In-Reply-To: <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
 <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
 <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
 <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
 <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
 <20251202114416.09624a4b@kmaincent-XPS-13-7390>
 <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
 <20251202121856.0da62885@kmaincent-XPS-13-7390>
 <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
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

On Tue, 2 Dec 2025 13:51:59 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Kory,
>=20
> On 02/12/2025 13:18, Kory Maincent wrote:
> > On Tue, 2 Dec 2025 11:47:40 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:

> I will not NAK, removing bindings and breaking users is under some
> conditions acceptable. You just need to come with the reasons and impact.
>=20
> Reason "is ugly" is usually not good enough. Especially if things were
> working.

Thanks for you reply.

> >>
> >> DTS cannot go to drm, which means you either need to separate the chan=
ge
> >> and make entire work bisectable and backwards compatible for some time
> >> OR at least document clearly the impact as we always ask. =20
> >=20
> > The thing is, if I split it, it has to be in 3. One for the of DRM bus =
flags
> > support, a second for the the devicetree and binding change and a third=
 for
> > the whole tilcdc and tda998x cleaning stuff. I think I will go for one
> > series, with better documentation.
> >=20
> > Now, what is your point of view on my question. Will you nak any binding
> > removal even if the binding is ugly and legacy and imply maintaining an
> > non-standard tilcdc panel driver? I know it breaks DTB compatibility but
> > there is several argument to not keep it. See patch 6. =20
> The binding being ugly and having to maintain non-standard tilcdc panel
> driver may be nice things for us, the users don't care. The users care
> if their board no longer works.

Yes I understand but then I have another question. At what cost should we
continue to support legacy binding?

Just figured out this case already happened, ti,tilcdc,slave binding was
removed from the tilcdc driver:
739acd85ffdb7 ("drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding
support")

Even if there is still one mainline device tree that uses it:
am335x-base0033.dts. :/

> And how does this sync with u-boot? It also has code for at least for a
> few of these boards.

U-boot has indeed a driver for the ti,tilcdc,panel binding.
Changing this devicetree would beak display for these board in U-boot as it
currently does not support the "panel-dpi" binding.

> Are there even users for these boards? If not, maybe they can be just
> removed? I'm personally not familiar with these boards, so I have no
> idea of their age or distribution.

These boards are quite old (>10 years) but I don't know if they are still u=
sed
by people. After a quick look they seem not available on the market.

> One trick that can be done is to modify the loaded DTB at boot time,
> detecting the old format, converting it to the new one, so that when the
> drivers are probed they only see the new DTB.

Yes, indeed that could do the trick. The things is, I don't have one of
theses board to test it. I will try to look for an other way to test it.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
