Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B2646E9F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 12:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3904510E1D7;
	Thu,  8 Dec 2022 11:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1C10E1D7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 11:32:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso10895797b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhZFBV4anZ9F8U1tpTEmxhqV1VbSgjjAY+rE0mwxuBg=;
 b=DcnYukqkd31K4Ou+0oMg4w3UfKdsMQ9hp07qWNLnESG5BYSNa3LivtkxMXwO2vMQqd
 Qe8sOLBO3ROZntM2PgDgjiA0YzX7FEDn0ko9OQvRel9GgcFsh2Qf6tXYNVLe44JuEo3n
 HsyR4SBIMjnhmY1E3FNXB41QzZc1PTYD1sTy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhZFBV4anZ9F8U1tpTEmxhqV1VbSgjjAY+rE0mwxuBg=;
 b=v+tGZk61xzOAwMKw5MbDi/5V93tLjfJX7jG/Hg4NBbJTeO4V7ZvUsMFQsUWqk178zt
 RmL+PJmC7QuAnv3N82RiP7tTgzzjeBHNim8WH4KdEnUxCb7Simzqp2NhgLIgkIxLo7iv
 choIGIm3vg4nA1P8uCDhxcDWvTjmdvG/9NqZeNWNFt6Kz/g9Zl7kyeDnDUmw1iwkK6Q7
 H2U4X6cgONCOPKAWhLEbZfAUdUVYCI56s+OxHZmAwKUQGQYGP7n6qDhjQ75XA4ei/OhG
 eh9ZQAPaFqgHRHyRr5zoLuMMVUen2mU7p2BYzCyyW+fHfPdsdSLa/F3mZzWoYjX38N2w
 eexg==
X-Gm-Message-State: ANoB5pksrizbLx33JzZk9/Y+mBksqNu8fFkQJJ3rkOWEktXAJsYq/R3j
 bI/gEiDGfQbMOFdYUMvJkb+eUx+bvPiuK6uptDghbA==
X-Google-Smtp-Source: AA0mqf4vTvB9Yf1szqHExXlcTm7mc8qW2JJPoGeWqaIbsrATgjSgxDiiaXqtIswGcSY2t4sdLrWUY8t6YHGuGJuHn2w=
X-Received: by 2002:a0d:e544:0:b0:392:1434:c329 with SMTP id
 o65-20020a0de544000000b003921434c329mr6947621ywe.72.1670499155736; Thu, 08
 Dec 2022 03:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
 <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
 <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
 <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
 <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
 <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
 <e32280e4-0c8e-f823-051b-8d0802d6fdb5@kontron.de>
 <fcef073d-3046-2714-d87c-4c42d6a4bce0@kontron.de>
In-Reply-To: <fcef073d-3046-2714-d87c-4c42d6a4bce0@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 8 Dec 2022 17:02:24 +0530
Message-ID: <CAMty3ZC+iyUmGgydjT-r1Nbbpipq+dm9tCAzeUvJyM7FAechGw@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 6, 2022 at 2:32 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 05.12.22 16:37, Frieder Schrempf wrote:
> > Hi Dave,
> >
> > On 05.12.22 16:20, Dave Stevenson wrote:
> >> Hi Frieder
> >>
> >> On Mon, 5 Dec 2022 at 07:30, Frieder Schrempf
> >> <frieder.schrempf@kontron.de> wrote:
> >>>
> >>> On 02.12.22 15:55, Dave Stevenson wrote:
> >>>> Hi Marek
> >>>>
> >>>> On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
> >>>>>
> >>>>> On 12/2/22 11:52, Marek Szyprowski wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Sorry for delay, I was on a sick leave last 2 weeks.
> >>>>>>
> >>>>>> On 28.11.2022 15:43, Jagan Teki wrote:
> >>>>>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrot=
e:
> >>>>>>>> On 11/23/22 21:09, Jagan Teki wrote:
> >>>>>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wro=
te:
> >>>>>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
> >>>>>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
> >>>>>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
> >>>>>>>>>>>>> DSI host initialization handling in previous exynos dsi dri=
ver has
> >>>>>>>>>>>>> some pitfalls. It initializes the host during host transfer=
() hook
> >>>>>>>>>>>>> that is indeed not the desired call flow for I2C and any ot=
her DSI
> >>>>>>>>>>>>> configured downstream bridges.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Host transfer() is usually triggered for downstream DSI pan=
els or
> >>>>>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host init=
ialization
> >>>>>>>>>>>>> as these downstream bridges use bridge operations hooks lik=
e pre_enable,
> >>>>>>>>>>>>> and enable in order to initialize or set up the host.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This patch is trying to handle the host init handler to sat=
isfy all
> >>>>>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITI=
ALIZED state
> >>>>>>>>>>>>> flag to ensure that host init is also done on first cmd tra=
nsfer, this
> >>>>>>>>>>>>> helps existing DSI panels work on exynos platform (form Mar=
ek
> >>>>>>>>>>>>> Szyprowski).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v8, v7, v6, v5:
> >>>>>>>>>>>>> * none
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v4:
> >>>>>>>>>>>>> * update init handling to ensure host init done on first cm=
d transfer
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v3:
> >>>>>>>>>>>>> * none
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v2:
> >>>>>>>>>>>>> * check initialized state in samsung_dsim_init
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v1:
> >>>>>>>>>>>>> * keep DSI init in host transfer
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 ++++++++++=
+++++++--------
> >>>>>>>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>>>>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_ir=
q(struct
> >>>>>>>>>>>>> samsung_dsim *dsi)
> >>>>>>>>>>>>>           disable_irq(dsi->irq);
> >>>>>>>>>>>>>       }
> >>>>>>>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *ds=
i)
> >>>>>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, uns=
igned int
> >>>>>>>>>>>>> flag)
> >>>>>>>>>>>>>       {
> >>>>>>>>>>>>>           const struct samsung_dsim_driver_data *driver_dat=
a =3D
> >>>>>>>>>>>>> dsi->driver_data;
> >>>>>>>>>>>>>       +    if (dsi->state & flag)
> >>>>>>>>>>>>> +        return 0;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>           samsung_dsim_reset(dsi);
> >>>>>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>>>>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
> >>>>>>>>>>>>>             if (driver_data->reg_values[RESET_TYPE] =3D=3D =
DSIM_FUNCRST)
> >>>>>>>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes)=
 - 1);
> >>>>>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
> >>>>>>>>>>>>> samsung_dsim *dsi)
> >>>>>>>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
> >>>>>>>>>>>>>           samsung_dsim_init_link(dsi);
> >>>>>>>>>>>>>       +    dsi->state |=3D flag;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>           return 0;
> >>>>>>>>>>>>>       }
> >>>>>>>>>>>>>       @@ -1269,6 +1276,10 @@ static void
> >>>>>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >>>>>>>>>>>>>           }
> >>>>>>>>>>>>>             dsi->state |=3D DSIM_STATE_ENABLED;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +    ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED)=
;
> >>>>>>>>>>>>> +    if (ret)
> >>>>>>>>>>>>> +        return;
> >>>>>>>>>>>>>       }
> >>>>>>>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_b=
ridge *bridge,
> >>>>>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
> >>>>>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >>>>>>>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
> >>>>>>>>>>>>>               return -EINVAL;
> >>>>>>>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> >>>>>>>>>>>>> -        ret =3D samsung_dsim_init(dsi);
> >>>>>>>>>>>>> -        if (ret)
> >>>>>>>>>>>>> -            return ret;
> >>>>>>>>>>>>> -        dsi->state |=3D DSIM_STATE_INITIALIZED;
> >>>>>>>>>>>>> -    }
> >>>>>>>>>>>>> +    ret =3D samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZE=
D);
> >>>>>>>>>>>> This triggers full controller reset and reprogramming upon f=
irst
> >>>>>>>>>>>> command transfer, is such heavy handed reload really necessa=
ry ?
> >>>>>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with =
Exynos DRM
> >>>>>>>>>>> DSI. If this is a real issue for you, then maybe the driver c=
ould do the
> >>>>>>>>>>> initialization conditionally, in prepare() callback in case o=
f IMX and
> >>>>>>>>>>> on the first transfer in case of Exynos?
> >>>>>>>>>> That's odd , it does actually break panel support for me, with=
out this
> >>>>>>>>>> double reset the panel works again. But I have to wonder, why =
would such
> >>>>>>>>>> a full reset be necessary at all , even on the exynos ?
> >>>>>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe che=
cking
> >>>>>>>>> whether a reset is required before calling it might fix the iss=
ue.  I
> >>>>>>>>> agree with double initialization is odd but it seems it is requ=
ired on
> >>>>>>>>> some panels in Exynos, I think tweaking them and adjusting the =
panel
> >>>>>>>>> code might resolve this discrepancy.
> >>>>>>>> Can someone provide further details on the exynos problem ?
> >>>>>>> If I'm correct this sequence is required in order to work the exi=
sting
> >>>>>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
> >>>>>>> possibly fix the sequence further.
> >>>>>>>
> >>>>>>> Marek Szyprowski, please add if you have anything.
> >>>>>>
> >>>>>>
> >>>>>> Well, frankly speaking the double initialization is not a correct
> >>>>>> sequence, but this is the only one that actually works on Exynos b=
ased
> >>>>>> boards with DSI panels after moving the initialization to bridge's
> >>>>>> .prepare() callback.
> >>>>>
> >>>>> Somehow, I suspect this is related to the LP11 mode handling, which
> >>>>> differs for different panels, right ? I think the RPi people worked=
 on
> >>>>> fixing that.
> >>>>>
> >>>>> +CC Dave
> >>>>
> >>>> Yes. I've just sent out a v3 of that patch set.
> >>>>
> >>>> Hopefully setting the pre_enable_prev_first flag on your peripheral'=
s
> >>>> drm_bridge, or prepare_prev_first if a drm_panel, will result in a
> >>>> more sensible initialisation order for your panel.
> >>>>
> >>>> Note that host_transfer should ensure that the host is initialised, =
as
> >>>> it is valid to call it with the host in any state. If it has to
> >>>> initialise, then it should deinitialise once the transfer has
> >>>> completed.
> >>>>
> >>>> Dave
> >>>>
> >>>>>> I've already explained this and shared the results
> >>>>>> of my investigation in my replies to the previous versions of this
> >>>>>> patchset. The original Exynos DSI driver does the initialization o=
n the
> >>>>>> first DSI command. This however doesn't work for Jagan with I2C
> >>>>>> controlled panels/bridges, so he moved the initialization to the
> >>>>>> .prepare() callback, what broke the Exynos case (in-short - all te=
sted
> >>>>>> panels works fine only if the DSI host initialization is done AFTE=
R
> >>>>>> turning the panel's power on). For more information, see this thre=
ad:
> >>>>>> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2Fe96197f9-948a-997e-5453-9f9d179b5f5a%40samsung.co=
m%2F&amp;data=3D05%7C01%7Cfrieder.schrempf%40kontron.de%7Cee7b57ee420e45a73=
b1d08dad6d45306%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C63805850467133=
0145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DTQIIKNa4OVGP1dZo3tM%2FOMO3=
dlXrjLr04U%2FJFhd2rAs%3D&amp;reserved=3D0
> >>>>>>
> >>>>>> Now, the more I think of it, the more I'm convinced that we simply
> >>>>>> should add a hack based on the HW type: do the initialization in
> >>>>>> .prepare() for non-Exynos case and before the first transfer for t=
he
> >>>>>> Exynos case, as there is no way to detect the panel/next bridge ty=
pe
> >>>>>> (I2C or DSI controlled).
> >>>>>
> >>>>> Let's see what Dave has to say about this, maybe there is some furt=
her help.
> >>>
> >>> Could we agree on adding the HW type based hack Marek S. proposed as =
a
> >>> quick fix?
> >>>
> >>> This patchset was tested on Exynos so it's likely to not break any
> >>> existing setups. And for i.MX8, this is a new driver so there's not
> >>> really a requirement to have all setups working/supported from the
> >>> beginning.
> >>>
> >>> Also having one or two hacks (marked with FIXME) in the code doesn't
> >>> hurt. As we can see there are drafts to fix them in conjunction with
> >>> changes in the DRM framework.
> >>>
> >>> This has been pending for months and in my opinion if there's a chanc=
e
> >>> to get this into v6.2-rc1 we should take it.
> >>
> >> My patchset was sent in March with no one seeming to care enough to re=
view it.
> >
> > I wasn't referring to your patchset but rather to the Samsung DSIM
> > bridge transformation patchset.
> >
> > My point was simply to not try getting everything done in one big step
> > because this will fail. The patchset this refers to needs testing on tw=
o
> > separate platforms which is painful enough (thanks to Marek for coverin=
g
> > the Exynos side!). I think we should focus on getting the DSIM bridge
> > transformation merged and accept a few small hacks that will be taken
> > care of in the next step.
> >
> >>
> >> If the situation is that your devices fall into the same camp as those
> >> for vc4 (the host needs to be initialised before the peripheral), at
> >> least verifying that would be useful before rushing into a hack.
> >>
> >> Your other comment references using a TI SN65DSI84. I know for certain
> >> that falls into the category of needing the DSI bus initialised before
> >> it is brought out of reset.
> >
> > I'm actually working on this right now and when I received your message
> > I was about to start typing a reply to your patchset.
> >
> > The SN65DSI84 works with the i.MX8MM DSIM even using the default order
> > of host init after peripheral init in our setup, but this configuration
> > doesn't seem to be stable and occasionally the bridge doesn't come up
> > properly.
> >
> > We are still in the process of verifying if the reversed order fixes
> > this reliably. But regardless of the results, without the reversal the
> > initialization sequence is way out of spec and we need to fix this in
> > any case.
> >
> > See here for my testing branch including some follow-up patches that
> > improve the initialization flow for my setup:
> > https://git.kontron-electronics.de/sw/misc/linux/-/commits/v6.1-dsim-mx=
8mm.
>
> To recap my thoughts on the two hacks for the DSIM bridge driver
> discussed before:
>
> (1) Passing null to previous bridge in samsung_dsim_attach()
> (2) Always initialize host on first transfer (see this patch, 06/14)
>
> My wild guess would be that both could be fixed up properly in the long
> run by the following changes:
>
> * Apply Dave's patchset [1]
> * Set pre_enable_prev_first flag in the downstream bridge drivers and
>   fix init flow if required ([2] for ti-sn65dsi83)
> * Fix DSIM init to keep data lanes in LP11 until enable() is called [3]
> * Only call init on transfer when not already initialized and deinit
>   after transfer (tbd)
>
> As that route needs proper testing on the affected hardware setups and
> includes changes to other drivers and the framework, I would suggest the
> following for the v9 of this patchset:

I did it on drm-misc-next [1].

>
> * Keep hack (1)

This has gone, not needed.

> * Make hack (2) dependent on the platform (Exynos)

I think with pre_enable_prev_first flag the Exynos pipeline will start
from bridge funcs like pre_enable so initializing the host will work
for exynos to work. [2]

Marek Sz. Can you confirm this?

[1] https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v9
[2] https://gitlab.com/openedev/kernel/-/commit/95ab71b797310952284fabfbc84=
76a9831902c5c

Jagan.
