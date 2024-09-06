Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149096F6E3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9C310EA68;
	Fri,  6 Sep 2024 14:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oeodf737";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14010EA79
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 14:34:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CB682A4505B;
 Fri,  6 Sep 2024 14:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48836C4CECB;
 Fri,  6 Sep 2024 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725633267;
 bh=GJhdh1KL6sQuQwMV3OtKllaFyTdDwk8Rn9pISls1GlQ=;
 h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
 b=Oeodf737b6AFFx4Kr6GnO9BnmgcUssKIwZ8gGfjzhQP1O55srkqsQQfstsM5EEn0O
 2ZZXS4n6Cdw/xQlH9EtlcuhlHktS1nkTpHONG6XeEYcyWth+4jQHIwxUgZtbSoylsj
 wZ11yX2W0pJ9kUiQlBq0MWEUpjbssT+k26gveVgOts2HgiGjQXfNe3axfNAJ/hSDK4
 1hgpkQzCc5BolbX5xQoDa3P0ptOMKBWGvnyOK7vbghZ2c7RILpbidDSzjrwC+Z7Kh8
 dUDoWHlRMweBEbae6rkOrHIf/v83537Ushy91usqBZ+D2eB+3UgfgHC1STX5ITeKFl
 m4+dSUdMxZPhw==
Content-Type: multipart/signed;
 boundary=e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 16:34:23 +0200
Message-Id: <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
To: "Daniel Semkowicz" <dse@thaumatec.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay
 calculation
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Vinay Simha BN" <simhavcs@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
 <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
In-Reply-To: <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
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

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

> > To cite the datasheet on VSDELAY:
> >   During DSI link speed is slower than that of LVDS link=E2=80=99s, dat=
a needs
> >   to be buffer within 775XBG before outputting to prevent data from
> >   underflow. Register field VPCTRL[VSDELAY] is used to for this purpose
> >
> > This driver assumes that the DSI link speed is the pixel clock (as does
> > every DSI bridge driver), after all the LVDS clock is derived from the
> > DSI clock. Thus we know for a fact, that the DSI link is not slower tha=
n
> > the LVDS side. Just use the (sane) default value of the bridge and drop
> > the complicated calculation here.
>
> I am not convinced this is a good idea to revert to a default
> VSdelay value. I tested your patch series with RK3399 platform
> and default value (5) was not enough there. There was small data
> underflow visible, resulting in display offset. Removing this patch
> and using the original calculation formula fixed the problem.
> The calculated VSDELAY value seems to be a lot bigger than required,
> but keeps us on the safe side.

Did you use just parts of this series or did you port the "lp11
notify" mechanism to the rk3399 platform? Please keep in mind, that
this bridge doesn't really work if the reset isn't deasserted during
lp-11 mode and lots of odd things happen.

Also, do you know if you have an EEPROM attached to the bridge or
does any firmware part initialize that bridge?

> It looks that hback-porch value for panel is used also on DSI link,
> effectively delaying hactive data delivered to TC358775 bridge.
> I suspect this causes the requirement for higher VSDELAY.

It was ages ago since I've worked on this bridge and extensively
tested and even measured and decoded the DSI link and the LVDS
stream. But IIRC this delay was only to compensate the difference
between the DSI clock and the LVDS clock, that is, if you push the
pixel stream slower into the bridge than the bridge is pushing it
out to the LVDS panel.

So the back porch should be irrelevant here (?!).

-michael

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtsS8BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jrSQF/dh0L7uqo4iFgWteWoYgl5oebRy9RWFyV
GIMN9nOpNVjk4Qk35Rw5AMwTJ2loI9hGAX9gKMZj5wZtErKpKvkIAqbL0vCimlYi
c9LSAvT6UG+2c6Fu/Fb0C0Cu0idGKpxaoCU=
=Ydxr
-----END PGP SIGNATURE-----

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a--
