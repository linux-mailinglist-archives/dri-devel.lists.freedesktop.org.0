Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97120490651
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6478910E16F;
	Mon, 17 Jan 2022 10:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40A010E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:58:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C36A596;
 Mon, 17 Jan 2022 11:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642417119;
 bh=2MfXnISxZpD5GT3buZMIOFDdeUzf+jkWquwoznm+CpA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QoxgEmW7tEpf32vw46EL02yShDT8ytTRZVs84ucgFy9ITST9rMf+Be0d1CdbaEXo/
 VUP++tdx7splMTKkJfZ5THEIprTqLsRMmqqZoYGgfXVYShY+vyWLm7jcOO2hdUhQRm
 l4GXvE18BCit5D0fRFAoYiicmLyDMLjEG+YIIRlc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
 <80fdc5a0-ddb8-5a0f-eb8c-ef7988ced638@baylibre.com>
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 17 Jan 2022 10:58:37 +0000
Message-ID: <164241711700.10801.9011781958267060147@Monstersaurus>
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

Hi Neil,

Quoting Neil Armstrong (2022-01-17 10:08:38)
> Hi again,
>=20
> On 14/01/2022 15:40, Neil Armstrong wrote:
> > Hi,
> >=20
> > On 14/01/2022 15:23, Biju Das wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Neil Armstrong <narmstrong@baylibre.com>
> >>> Sent: 14 January 2022 13:56
> >>> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
> >>> <festevam@gmail.com>
> >>> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
> >>> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
> >>> martin.blumenstingl@googlemail.com; linux-amlogic@lists.infradead.org;
> >>> linux-arm-kernel@lists.infradead.org; dri-devel@lists.freedesktop.org;
> >>> linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> >>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >>> callbacks")
> >>>
> >>> Hi,
> >>>
> >>> On 14/01/2022 12:08, Biju Das wrote:
> >>>> Hi Neil,
> >>>>
> >>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
> >>>>> callbacks")
> >>>>>
> >>>>> On 14/01/2022 09:29, Biju Das wrote:
> >>>>>> Hi Neil,
> >>>>>>
> >>>>>> + renesas-soc
> >>>>>>
> >>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
> >>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fm=
ts
> >>>>>>> callbacks")
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
> >>>>>>>> Hi Biju,
> >>>>>>>>
> >>>>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
> >>>>>>>> <biju.das.jz@bp.renesas.com>
> >>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi All,
> >>>>>>>>>
> >>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
> >>>>>>>>> till the commit
> >>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
> >>>>>>>>> fmts
> >>>>>>> callbacks").
> >>>>>>>>>
> >>>>>>>>> After this patch, the screen becomes greenish(may be it is
> >>>>>>>>> setting it
> >>>>>>> into YUV format??).
> >>>>>>>>>
> >>>>>>>>> By checking the code, previously it used to call get_input_fmt
> >>>>>>>>> callback
> >>>>>>> and set colour as RGB24.
> >>>>>>>>>
> >>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
> >>>>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callbac=
k,
> >>>>>>>>> I see
> >>>>>>> the outputformat as YUV16 instead of RGB24.
> >>>>>>>>>
> >>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driv=
er.
> >>>>>>>
> >>>>>>> This patch was introduced to maintain the bridge color format
> >>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
> >>>>>>> seems it behaves incorrectly if the first bridge doesn't implement
> >>>>>>> the negotiation callbacks.
> >>>>>>>
> >>>>>>> Let me check the code to see how to fix that.
> >>>>>>
> >>>>>> Thanks for the information, I am happy to test the patch/fix.
> >>>>>>
> >>>>>> Cheers,
> >>>>>> Biju
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
> >>>>> shows:
> >>>>>>>>
> >>>>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
> >>>>>>>> HDCP (DWC HDMI 3D TX PHY)
> >>>>>>>>
> >>>>>>>> The colors are shown correctly here.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
> >>>>>>> negotiation fails and use the RGB fallback input & output format.
> >>>>>>>
> >>>>>>> Anyway thanks for testing
> >>>>>>>
> >>>>>>> Neil
> >>>>>
> >>>>> Can you test :
> >>>>>
> >>>>> =3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> diff --git a/drivers/gpu/drm/drm_bridge.c
> >>>>> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
> >>>>> 100644
> >>>>> --- a/drivers/gpu/drm/drm_bridge.c
> >>>>> +++ b/drivers/gpu/drm/drm_bridge.c
> >>>>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> >>>>> drm_bridge *bridge,
> >>>>>         last_bridge_state =3D
> >>>>> drm_atomic_get_new_bridge_state(crtc_state-
> >>>>>> state,
> >>>>>
> >>>>> last_bridge);
> >>>>>
> >>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>>>> +       /*
> >>>>> +        * Only negociate with real values if both end of the bridge
> >>> chain
> >>>>> +        * support negociation callbacks, otherwise you can end in a
> >>>>> situation
> >>>>> +        * where the selected output format doesn't match with the
> >>>>> + first
> >>>>> bridge
> >>>>> +        * output format.
> >>>>> +        */
> >>>>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
> >>>>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
> >>>>>                 const struct drm_bridge_funcs *funcs =3D
> >>>>> last_bridge->funcs;
> >>>>>
> >>>>>                 /*
> >>>>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
> >>>>> drm_bridge *bridge,
> >>>>>                 if (!out_bus_fmts)
> >>>>>                         return -ENOMEM;
> >>>>>
> >>>>> -               if (conn->display_info.num_bus_formats &&
> >>>>> +               /*
> >>>>> +                * If first bridge doesn't support negociation, use
> >>>>> MEDIA_BUS_FMT_FIXED
> >>>>> +                * as a safe value for the whole bridge chain
> >>>>> +                */
> >>>>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
> >>>>> +                   conn->display_info.num_bus_formats &&
> >>>>>                     conn->display_info.bus_formats)
> >>>>>                         out_bus_fmts[0] =3D conn-
> >>>>>> display_info.bus_formats[0];
> >>>>>                 else
> >>>>> =3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>
> >>>>> This should exclude your situation where the first bridge doesn't
> >>>>> support negociation.

This fixes the issue for me here on an H3 Salvator-XS.

Could you add...

Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

alongside Biju's Reported-by: tag when posting as a fix please?


> >>>>
> >>>> I have tested this fix with Linux next-20220114. Still I see colour
> >>> issue.
> >>>>
> >>>> It is still negotiating and it is calling get_output_fmt_callbck
> >>>>
> >>>> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_UYVY8_1X16=3D0#########
> >>>> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_YUV8_1X24=3D1#########
> >>>> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
> >>> MEDIA_BUS_FMT_RGB888_1X24=3D2#########
> >>>>
> >>>> And In get_input_fmt callback, I See the outputformat as YUV16 inste=
ad
> >>> of RGB24.
> >>>>
> >>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
> >>> MEDIA_BUS_FMT_UYVY8_1X16#########
> >>>> [    3.473644] ########hdmi_video_sample
> >>> MEDIA_BUS_FMT_UYVY8_1X16#########
> >>>
> >>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to t=
he
> >>> encoder.
> >>
> >> Yep.
> >>
> >>>
> >>> Let me figure that out, no sure I can find a clean solution except pu=
tting
> >>> back RGB24 before YUV.
> >>>
> >>> Anyway please test that:
> >>
> >> It works now after reordering.
> >>
> >> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA=
_BUS_FMT_RGB888_1X24=3D0#########
> >> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA=
_BUS_FMT_YUV8_1X24=3D1#########
> >> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA=
_BUS_FMT_UYVY8_1X16=3D2#########
> >>
> >> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_=
BUS_FMT_RGB888_1X24#########
> >> [    3.506797] ########hdmi_video_sample MEDIA_BUS_FMT_RGB888_1X24####=
#####
> >>
> >> Is it acceptable solution to the users of dw_hdmi driver? May be it is=
 worth to post a patch.
> >> at least it is fixing the colour issue??
> >=20
> > Yes, it gets back to default behavior before negociation, nevertheless =
we need to think
> > how to handle your use-case correctly at some point.
> >=20
> > I'll post this as a patch ASAP so it gets applied before landing in lin=
us master.
> >=20
> > Neil
> >=20
> >>
> >> Regards,
> >> Biju
> >>
> >>>
> [...]
>=20
> I'm not happy with this version since it's merely a hack which makes it w=
ork.
>=20
> Can you test the following change instead, it's correctly handles your si=
tuation in a generic manner.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..9f2e1cac0ae2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fm=
ts(struct drm_bridge *bridge,
>         if (!output_fmts)
>                 return NULL;
>=20
> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselve=
s */
> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +       /* If dw-hdmi is the first or only bridge, avoid negociating with=
 ourselves */
> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_c=
hain)) {
>                 *num_output_fmts =3D 1;
>                 output_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
>=20
> @@ -2673,6 +2674,10 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fm=
ts(struct drm_bridge *bridge,
>         if (!input_fmts)
>                 return NULL;
>=20
> +       /* If dw-hdmi is the first bridge fall-back to safe output format=
 */
> +       if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_c=
hain))
> +               output_fmt =3D MEDIA_BUS_FMT_FIXED;
> +
>         switch (output_fmt) {
>         /* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>         case MEDIA_BUS_FMT_FIXED:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=
<=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>=20
> Thanks,
> Neil
>=20
>=20
> >>>
> >>> Neil
> >>>
> >>>>
> >>>> Regards,
> >>>> Biju
> >>>>
> >>
> >=20
>
