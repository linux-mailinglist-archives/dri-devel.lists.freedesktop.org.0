Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64753112446
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BDE6F450;
	Wed,  4 Dec 2019 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EB06F453
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 08:16:52 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E5F420675;
 Wed,  4 Dec 2019 08:16:52 +0000 (UTC)
Date: Wed, 4 Dec 2019 09:16:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575447412;
 bh=Yt0CUSJagubBAQX6uTNxcqQuzIkcBfH1t8baRs8SOlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7fxNlrEVB9EFySevdXDf/z1CiVsGMDm92rYyWGExuFhs6ZLSvzTMxb3W7ZP8iQKM
 t280I+jOCHgM+lbLKFrmTg6FtfFK/0Gq1JvHNCiIy/ZAMC9E6CKo77Ffp3D3fPMKgc
 6P4rFJIt7apu1ThmX6/Oic+NdqU7qv/8yiQX7ZkA=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: multipart/mixed; boundary="===============2100899948=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2100899948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="voqjdysu66o2gyxb"
Content-Disposition: inline


--voqjdysu66o2gyxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:
> On Tue, Dec 3, 2019 at 8:47 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> > Using only the mode as we do currently has a bunch of shortcomings as
> > almost no encoder will be able to provide the typical pixel clock, and
> > that situation leads to multiple things:
> >
> >   - If someone working on one encoder wants to upstream a panel they
> >     have tested, chances are this will not be the typical pixel clock
> >     / timings being used but rather the one that will match what that
> >     SoC is capable of. Trouble comes when a second user comes in with
> >     a different encoder and different capabilities, and then we have a
> >     maintainance fight over which timing is the true timing (with a
> >     significant chance that none of them are).
> >
> >   - If we can't match the pixel clock, we currently have no easy way
> >     to make the usual measures of reducing / growing the porches and
> >     blankings areas to match the pixel clock we can provide, since we
> >     don't have an easy way to get the tolerance on those timings for a
> >     given panel. There's some ad hoc solutions on some drivers (I
> >     think vc4 has that?) to ignore the panel and just play around with
> >     the timings, but I think this should be generalised.
>
> I've been confused with these things as they look today and it seems
> the whole struct drm_display_mode could need some improvement?
>
> If .clock is supposed to be htotal * vtotal * vrefresh, what is the
> .clock doing there anyway.

It's one thing I wonder as well. I guess it's just more convenient for
everyone, since it's exposed by the VESA modes (iirc) and a lot of
drivers really care about the clock.

> Sadly I am too inexperienced to realize where the tolerances should
> be stated, but I guess just stating that hsync_start etc are typical,
> then specify some tolerance for each would help a bit?

The timings structure discussed in the patch that started this
discussion is actually doing this nicely, you have for each timing the
minimum, typical and maximum value. The current issue with it though
is that it's pretty difficult to use it, since it's not really tied to
any of the panel code (or DRM helpers). The only driver that was
supporting it was omapdrm and it was removed recently.

If we really wanted to support it, one path forward I can see would be
to make the timings structure the primary one, and only use
drm_display_mode for userspace facing code, and generate it from the
timings. This would be a pretty invasive change though...

> On the DSI displays in video mode there is also this EOL area
> which seems to be where the logic is normally just idling for a
> while, that can be adjusted on some hardware as well, but
> I don't quite understand it admittedly. Sometimes I wonder if
> anyone really understands DSI... :/

I'm not aware of any EOL area in MIPI-DSI that would make the hardware
idle, don't you mean LP-11?

Maxime

--voqjdysu66o2gyxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXedrcgAKCRDj7w1vZxhR
xdavAPjzTTCvwouCytfXW/t4u+SVB9rmOV3G+YlNApkfwiGrAP9ZY7cFIlhaaHR6
KPuqccewYOnD4eU7PSrJ9ryTiv4jDA==
=P7Ao
-----END PGP SIGNATURE-----

--voqjdysu66o2gyxb--

--===============2100899948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2100899948==--
