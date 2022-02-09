Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0F4AF345
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8748E10E4A4;
	Wed,  9 Feb 2022 13:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409110E4A4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644414678;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=tvGj33EBatPgN7fdgNMT5Uwzep9OEE1oZXhb92nFpC0=;
 b=M+b+B2eRZJtmNi+t+MYTpNrmc59i+XJFTVkzdWj3EENACd1/5TTXKY+OqXR5XyxmwT
 TAI578t9ilOZQU5S2BKANWK7+i8xQtAEZb5ARAi0raMtajkq2a7RuQd4bi+cna+eQhN6
 656boM9hWJ0Ffhiv+YMsdLnG+5E/RuDMyWtV7/KQsNWfEe0AXvsOXN65jSBC+HwX8+TW
 9n9h0EPlv96CD7D/7O5/4L8eNyz25by47IPa9Z+pLfUFqQ1Z0t4NdTdjGmp0JAgq34gj
 giOrg6vJKOkCDv5U9HP0R6bzmQBAXB6Bhum0alyjzB1Cy2ff/7NKJbVQI1N26tCGnk5K
 efJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMYawg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y19DpHguM
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 9 Feb 2022 14:51:17 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v13 6/9] dw-hdmi/ingenic-dw-hdmi: repair interworking with
 hdmi-connector
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <E6E17R.ND5XW1IG4SYA@crapouillou.net>
Date: Wed, 9 Feb 2022 14:51:17 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <987D3DDA-FA93-4EDB-ABCB-6973DB7FD943@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
 <866f84621974992f4831bd471ae5a53414de9255.1643819482.git.hns@goldelico.com>
 <E6E17R.ND5XW1IG4SYA@crapouillou.net>
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

Hi Paul,

> Am 09.02.2022 um 13:18 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mer., f=C3=A9vr. 2 2022 at 17:31:20 +0100, H. Nikolaus Schaller =
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
>> This fix is based on the observation that max_bpc =3D 0 when running =
this
>> function while info->bpc =3D 8. Since the formats checks before this =
always test
>> for max_bpc >=3D info->pbc indirectly my assumption is that we must =
check it
>> here as well.
>=20
> This fix looks really strange to me, so I'll let the DRM experts =
comment.

Well, yes. We should maybe look for comments by the synopsys/dw-hdmi =
specialists.

>=20
> It would still be better to move the patch before the introduction of =
dw-ingenic-hdmi.c, so that once this one is introduced, everything =
works. This also enables bisectability.

Ok, good.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>=20
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
>> index 52e7cd2e020d3..34703a15ee4ff 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2620,10 +2620,10 @@ static u32 =
*dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>> 	}
>> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +	if (max_bpc >=3D info->bpc && info->color_formats & =
DRM_COLOR_FORMAT_YCRCB422)
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +	if (max_bpc >=3D info->bpc && info->color_formats & =
DRM_COLOR_FORMAT_YCRCB444)
>> 		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>> 	/* Default 8bit RGB fallback */
>> --
>> 2.33.0
>=20
>=20

