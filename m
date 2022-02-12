Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5E4B35F4
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 16:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4710E29C;
	Sat, 12 Feb 2022 15:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D8210E29C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644681013;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IdS2QAviQYspg0Ww5TTCvAHcJJtpXKbwyF+95baAn64=;
 b=AKgnoXpnbkpWFz+c0XV/zf9gpMR37hCSLDHSZsVBNHSNAQZ/I1IFF+buNbgTwT35MF
 oS69gCfqcHF9MUTj7NpQYXj2b0YzkAtYd2IfhSx44WgSfowJn48dhza6L7nQI96jGd2T
 69fJhNx3qHf/XvcVosLvEPaq3KiQmH8tbfqPUOlA9gT4+ZN254NB0DfcbRKRNyF1EcVH
 12snh2S2L6MmbysLJh85MKBxTF8p9Md1GE6HrLgZDfrd3DxkznWyngCORxwTDZVSdBxg
 tWTTNSGrbu5X+8UNL4f72dSXjGuOglZY1XJDN1ZuhySs+g1ON8k7T0kl3wYwJ4TDB3qF
 daGQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDaqyA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1CFoCswi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sat, 12 Feb 2022 16:50:12 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v14 5/9] drm/bridge: dw-hdmi: repair interworking with
 hdmi-connector for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <7Y577R.WAL64FW8KJZJ1@crapouillou.net>
Date: Sat, 12 Feb 2022 16:50:12 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1AF73F85-8384-413C-8E2E-004E6DD75AAD@goldelico.com>
References: <cover.1644675566.git.hns@goldelico.com>
 <8703a3e48574c09e8756b79e8f69be7d84926fe9.1644675566.git.hns@goldelico.com>
 <7Y577R.WAL64FW8KJZJ1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 12.02.2022 um 16:06 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le sam., f=C3=A9vr. 12 2022 at 15:19:23 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus =
fmts callbacks")
>> introduced a new mechanism to negotiate bus formats between hdmi =
connector
>> and the synopsys hdmi driver inside the jz4780.
>> By this, the dw-hdmi is no longer the only bridge and sets up a list
>> of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().
>> This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780 =
but only
>> produces a black screen.
>=20
> Neil pushed a fix yesterday that looks like it could fix your issue.
> The fix is: 1528038385c0 ("drm/bridge: dw-hdmi: use safe format when =
first in bridge chain")
>=20
> Could you try if it does indeed fix your issue?

Sure.

Would have been nice and is a fix addressing same base commit, but is =
not a replacement for my attempt :(

Fortunately we can have both.

>=20
> Cheers,
> -Paul
>=20
>> This fix is based on the observation that max_bpc =3D 0 when running =
this
>> function while info->bpc =3D 8. Since the formats checks before this =
always test
>> for max_bpc >=3D info->pbc indirectly my assumption is that we must =
check it
>> here as well.
>> Adding the proposed patch makes the CI20/jz4780 panel work again in
>> MEDIA_BUS_FMT_RGB888_1X24 mode.
>> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus =
fmts callbacks")
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index b0d8110dd412c..826a055a7a273 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2620,10 +2620,10 @@ static u32 =
*dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>> 	}
>> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
>> +	if (max_bpc >=3D info->bpc && info->color_formats & =
DRM_COLOR_FORMAT_YCBCR422)
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>> +	if (max_bpc >=3D info->bpc && info->color_formats & =
DRM_COLOR_FORMAT_YCBCR444)
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> 	/* Default 8bit RGB fallback */
>> --
>> 2.33.0
>=20
>=20

