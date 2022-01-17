Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07AB4909E9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AE210E25C;
	Mon, 17 Jan 2022 14:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E00310E2E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:05:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C4CC596;
 Mon, 17 Jan 2022 15:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642428321;
 bh=EFWc9x5oQLgJalVcGMLQ3Ss2XXIN3JwduH0SfyYscLE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U4uLKOZq9yAK1I89xheOZ0Qpcwz6lIi2vT3P3OfRBJLstA+ADTS686+95gzpIpoPs
 ahJEM+o7nbzmnWUx09aZDye6ezoxtfLudbYU44hFNR1bd5Ae93VRx+Slf8M07ZU0s1
 DJ88blTIe2aHX7Rp6K40pdtBmXndsE3T1388boQk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f214ea2-5f9f-1217-6e65-f92e434ed826@baylibre.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
 <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
 <164241711700.10801.9011781958267060147@Monstersaurus>
 <4f214ea2-5f9f-1217-6e65-f92e434ed826@baylibre.com>
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 17 Jan 2022 14:05:19 +0000
Message-ID: <164242831905.10801.10615379536917395435@Monstersaurus>
User-Agent: alot/0.10
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
Cc: jonas@kwiboo.se, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, linux-renesas-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Neil Armstrong (2022-01-17 13:53:47)
> On 17/01/2022 11:58, Kieran Bingham wrote:
> > Hi Neil,

<big snips to clear up contexts>

> > This fixes the issue for me here on an H3 Salvator-XS.
> >=20
> > Could you add...
> >=20
> > Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > alongside Biju's Reported-by: tag when posting as a fix please?
>=20
>=20
> Which patch did you test ?

Ah, yes that's not clear is it - sorry! I replied in the wrong place on
the thread when I went back to the mail ... see below...

> >> I'm not happy with this version since it's merely a hack which makes i=
t work.
> >>
> >> Can you test the following change instead, it's correctly handles your=
 situation in a generic manner.
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi.c
> >> index 54d8fdad395f..9f2e1cac0ae2 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus=
_fmts(struct drm_bridge *bridge,
> >>         if (!output_fmts)
> >>                 return NULL;
> >>
> >> -       /* If dw-hdmi is the only bridge, avoid negociating with ourse=
lves */
> >> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
> >> +       /* If dw-hdmi is the first or only bridge, avoid negociating w=
ith ourselves */
> >> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
> >> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridg=
e_chain)) {
> >>                 *num_output_fmts =3D 1;
> >>                 output_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
> >>
> >> @@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus=
_fmts(struct drm_bridge *bridge,
> >>         if (!input_fmts)
> >>                 return NULL;
> >>
> >> +       /* If dw-hdmi is the first bridge fall-back to safe output for=
mat */
> >> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridg=
e_chain))
> >> +               output_fmt =3D MEDIA_BUS_FMT_FIXED;
> >> +
> >>         switch (output_fmt) {
> >>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format=
 */
> >>         case MEDIA_BUS_FMT_FIXED:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

Sorry, I replied in the wrong part of the thread.

Here's the direct diff on my local tree:


diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/br=
idge/synopsys/dw-hdmi.c
index 54d8fdad395f..cac9a87949f1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2551,8 +2551,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmt=
s(struct drm_bridge *bridge,
        if (!output_fmts)
                return NULL;
=20
-       /* If dw-hdmi is the only bridge, avoid negociating with ourselves =
*/
-       if (list_is_singular(&bridge->encoder->bridge_chain)) {
+       /* If dw-hdmi is the first or only bridge, avoid negociating with o=
urselves */
+       if (list_is_singular(&bridge->encoder->bridge_chain) ||
+           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_cha=
in)) {
+
                *num_output_fmts =3D 1;
                output_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
=20
@@ -2673,6 +2675,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts=
(struct drm_bridge *bridge,
        if (!input_fmts)
                return NULL;
=20
+       /* If dw-hdmi is the first bridge fall-back to safe output format */
+       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_cha=
in))
+               output_fmt =3D MEDIA_BUS_FMT_FIXED;
+
        switch (output_fmt) {
        /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
        case MEDIA_BUS_FMT_FIXED:

Which I believe matches the above.

--
Kieran
