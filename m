Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAF759AE2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 18:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FC510E0E8;
	Wed, 19 Jul 2023 16:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DA910E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 16:35:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9939fbb7191so219722966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 09:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689784507; x=1692376507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rY626uYekdcI/2JZDKpmPtCyOmOx8df+pfUdozN9YOI=;
 b=naAbmlqjBUiWZ8Jap5t0ahtP5WACC/i8ja+jjWv8wAkuvcMYhDZAv7sArKskbeXajc
 lwOzHiuc7pCvC5oG9QP+C9vP0V0az1IclMARkmx13WRP2R1d5NDBNvlEFqz1OMQQQAF0
 qQcgrdpSvMgn4IVl0mgLJMoRUSv+GK53JefzHUK4Nxcij2wqeHLiIZyyqLgbKcD6i9eC
 ckOHZ7N4TFeC5QIuJpM46rV8J2jxwpn03BI0cOyzu028WXFJtgTviuF0YstvJIo7NFRr
 9/t4Yvm/Q+WDr2JX4mlR+SDSjanU2NbsaKCJmQb6drv9dqbwD7CX3ZMXEqnGJU7RT6ST
 szxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689784507; x=1692376507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rY626uYekdcI/2JZDKpmPtCyOmOx8df+pfUdozN9YOI=;
 b=k4w2upwpb6YS91R91vLoNbLzOYt/5bBpZxpCdvIYdDpgyDqOa7i9RANC7S6luie4kC
 V7zf0hn+2CkQL325el4xR7CmBPU8nCOnFVFdcCB5XtUxMs28RWtFWjFqSOenLk5XffbI
 m68UY5c6xN+8vWWDMHh8buHVzxgIoo71FzpNF9GSbf2F0whcG9Rp0q/bbETHs86krtpY
 EOmBDHCBVWHR6OXctmIL0sPQwcUVggWEF77RlHEhlR5Jbl+TKxutvdpuVaaKpf2o21Nn
 BK9xuYwFpZjqta6aguVzMq989ZlaS6VGwGdZfRB365HtiN8N7EeZxdyHwS3RTLd02Iro
 KkJg==
X-Gm-Message-State: ABy/qLYXQ6yrFaMFB2xiwwlHcl/2OmKffXffiyyK5880BiCft24owTge
 r5/hyuq3NwfHmzwn1e+FUNlH2yBrZPzqbm2Ips49+g==
X-Google-Smtp-Source: APBJJlGrJB5ugpUttTfBAh4xaTylwTJ5Htqrv2lIxJgvavdQsnECvR2DIcqGIfxWkYT2OrmTiBngzhyd3Gg1rXJZBEU=
X-Received: by 2002:a17:906:209d:b0:992:2f67:cd34 with SMTP id
 29-20020a170906209d00b009922f67cd34mr3242726ejq.22.1689784507480; Wed, 19 Jul
 2023 09:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
 <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
 <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
 <a7e6611a-a147-607c-9df4-9fcc4e2cf397@kontron.de>
 <CAJ+vNU00AsaGQ4nqCJ+XqUtYsbr8ow49BV78QZx6CgF0xn6s+g@mail.gmail.com>
 <2a57622c-402b-5df6-73b3-9ba9aad9843d@kontron.de>
In-Reply-To: <2a57622c-402b-5df6-73b3-9ba9aad9843d@kontron.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 19 Jul 2023 09:34:54 -0700
Message-ID: <CAJ+vNU2p1qPqWxZ83N_goSt17rAH4GU9mh18zJm2iCGoRra=vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 12:05=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Tim,
>
> On 19.07.23 01:03, Tim Harvey wrote:
> > On Thu, Jul 13, 2023 at 3:01=E2=80=AFAM Frieder Schrempf
> > <frieder.schrempf@kontron.de> wrote:
> >>
> >> Hi Tim,
> >>
> >> On 13.07.23 09:18, Frieder Schrempf wrote:
> >>> Hi Tim,
> >>>
> >>> On 13.07.23 00:34, Tim Harvey wrote:
> >>>> On Wed, May 3, 2023 at 9:33=E2=80=AFAM Frieder Schrempf <frieder@fri=
s.de> wrote:
> >>>>>
> >>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>>
> >>>>> According to the documentation [1] the proper enable flow is:
> >>>>>
> >>>>> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
> >>>>> 2. Disable stop state to bring data lanes into HS mode
> >>>>>
> >>>>> Currently we do this all at once within enable(), which doesn't
> >>>>> allow to meet the requirements of some downstream bridges.
> >>>>>
> >>>>> To fix this we now enable the DSI in pre_enable() and force it
> >>>>> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
> >>>>> register until enable() is called where we reset the bit.
> >>>>>
> >>>>> We currently do this only for i.MX8M as Exynos uses a different
> >>>>> init flow where samsung_dsim_init() is called from
> >>>>> samsung_dsim_host_transfer().
> >>>>>
> >>>>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridg=
e-operation
> >>>>>
> >>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>> ---
> >>>>> Changes for v2:
> >>>>> * Drop RFC
> >>>>> ---
> >>>>>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++=
--
> >>>>>  1 file changed, 23 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/dr=
m/bridge/samsung-dsim.c
> >>>>> index e0a402a85787..9775779721d9 100644
> >>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsu=
ng_dsim *dsi)
> >>>>>         reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> >>>>>         reg &=3D ~DSIM_STOP_STATE_CNT_MASK;
> >>>>>         reg |=3D DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_S=
TATE_CNT]);
> >>>>> +
> >>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> >>>>> +               reg |=3D DSIM_FORCE_STOP_STATE;
> >>>>> +
> >>>>>         samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> >>>>>
> >>>>>         reg =3D DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
> >>>>> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(st=
ruct drm_bridge *bridge,
> >>>>>                 ret =3D samsung_dsim_init(dsi);
> >>>>>                 if (ret)
> >>>>>                         return;
> >>>>> +
> >>>>> +               samsung_dsim_set_display_mode(dsi);
> >>>>> +               samsung_dsim_set_display_enable(dsi, true);
> >>>>>         }
> >>>>>  }
> >>>>>
> >>>>> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struc=
t drm_bridge *bridge,
> >>>>>                                        struct drm_bridge_state *old=
_bridge_state)
> >>>>>  {
> >>>>>         struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> >>>>> +       u32 reg;
> >>>>>
> >>>>> -       samsung_dsim_set_display_mode(dsi);
> >>>>> -       samsung_dsim_set_display_enable(dsi, true);
> >>>>> +       if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> >>>>> +               samsung_dsim_set_display_mode(dsi);
> >>>>> +               samsung_dsim_set_display_enable(dsi, true);
> >>>>> +       } else {
> >>>>> +               reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> >>>>> +               reg &=3D ~DSIM_FORCE_STOP_STATE;
> >>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> >>>>> +       }
> >>>>>
> >>>>>         dsi->state |=3D DSIM_STATE_VIDOUT_AVAILABLE;
> >>>>>  }
> >>>>> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(str=
uct drm_bridge *bridge,
> >>>>>                                         struct drm_bridge_state *ol=
d_bridge_state)
> >>>>>  {
> >>>>>         struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> >>>>> +       u32 reg;
> >>>>>
> >>>>>         if (!(dsi->state & DSIM_STATE_ENABLED))
> >>>>>                 return;
> >>>>>
> >>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> >>>>> +               reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> >>>>> +               reg |=3D DSIM_FORCE_STOP_STATE;
> >>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> >>>>> +       }
> >>>>> +
> >>>>>         dsi->state &=3D ~DSIM_STATE_VIDOUT_AVAILABLE;
> >>>>>  }
> >>>>>
> >>>>> --
> >>>>> 2.40.0
> >>>>>
> >>>>
> >>>> Hi Frieder,
> >>>>
> >>>> I found this patch to break mipi-dsi display on my board which has:
> >>>>  - FocalTech FT5406 10pt touch controller (with no interrupt)
> >>>>  - Powertip PH800480T013-IDF02 compatible panel
> >>>>  - Toshiba TC358762 compatible DSI to DBI bridge
> >>>>  - ATTINY based regulator used for backlight controller and panel en=
able
> >>>>
> >>>> I enable this via a dt overlay in a pending patch
> >>>> imx8mm-venice-gw72xx-0x-rpidsi.dtso [1] which works on 6.4 but not
> >>>> 6.5-rc1 which has this patch.
> >>>>
> >>>> The issue appears as:
> >>>> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 0=
0
> >>>> 64 01 05 00 00 00
> >>>> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-=
110)
> >>>>
> >>>> Instead of
> >>>> [    1.011729] samsung-dsim 32e10000.dsi: supply vddcore not found,
> >>>> using dummy regulator
> >>>> [    1.019829] samsung-dsim 32e10000.dsi: supply vddio not found,
> >>>> using dummy regulator
> >>>> [    5.649928] samsung-dsim 32e10000.dsi:
> >>>> [drm:samsung_dsim_host_attach] Attached tc358762 device
> >>>>
> >>>> I'm curious what board/panel were you needing this for and do you ha=
ve
> >>>> any ideas why it broke my setup?
> >>>>
> >>>> I'm also curious what board/panel Alexander tested this with and if
> >>>> Adam or Jagan (or others) have tested this with their hardware?
> >>>
> >>> Sorry for breaking your setup. My test- and use-case is the same as
> >>> Alexander's. I have the SN65DSI84 downstream bridge and without this
> >>> patch it fails to come up in some cases.
> >>>
> >>> The failure is probably related to your downstream bridge being
> >>> controlled by the DSI itself using command mode. The SN65DSI84 is
> >>> instead controlled via I2C.
> >>>
> >>> Actually we should have tested this with a bridge that uses command m=
ode
> >>> before merging, now that I think of it. But I wasn't really aware of
> >>> this until now.
> >>>
> >>> I'll have a closer look at the issue and then will get back to you. I=
n
> >>> the meantime if anyone can help analyze the problem or has proposals =
how
> >>> to fix it, please let us know.
> >>
> >> With my patch samsung_dsim_init() now initializes the DSIM to stop
> >> state. When being called from samsung_dsim_atomic_pre_enable() this
> >> works as the stop state is cleared later in samsung_dsim_atomic_enable=
().
> >>
> >> When being called from samsung_dsim_host_transfer() to handle transfer=
s
> >> before samsung_dsim_atomic_pre_enable() was called, the stop state is
> >> never cleared and transfers will fail.
> >>
> >> This is the case in your setup as tc358762_init() is called in
> >> tc358762_pre_enable().
> >>
> >> I think that requiring to initialize the DSI host during transfer coul=
d
> >> be avoided in this case by moving tc358762_init() from
> >> tc358762_pre_enable() to tc358762_enable().
> >>
> >> But at the same time according to the docs at [1] this seems to be a
> >> valid case that we need to support in the DSIM driver:
> >>
> >>   Whilst it is valid to call host_transfer prior to pre_enable or
> >>   after post_disable, the exact state of the lanes is undefined at
> >>   this point. The DSI host should initialise the interface, transmit
> >>   the data, and then disable the interface again.
> >>
> >> Therefore I would propose to try a fix like in the attachement. If you
> >> could test this, that would be great.
> >>
> >> Thanks
> >> Frieder
> >>
> >> [1]
> >> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-opera=
tion
> >
> > Hi Frieder,
> >
> > The patch does not resolve the issue. I still get the 'xfer timed out'
> > from samsung-dsim but noticing today that this issue doesn't exist in
> > linux-next I've found that its resolved by Marek's patch:
> > commit 8a4b2fc9c91a ("drm/bridge: tc358762: Split register programming
> > from pre-enable to enable")
>
> Thanks for testing. I didn't notice there already is a patch from Marek
> for the tc358762 driver. This is exactly the change that I was
> considering above as a fix on the downstream bridge side.
>
> >
> > I'm not clear on how that patch is staged in linux-next. If we can get
> > that pulled into 6.5 then it will resolve the breakage.
>
> Still the documentation says that the DSI host must be able to handle
> this and there might be other drivers that are not yet fixed like this
> or can't be changed to make DSI transfers only after the host's
> pre_enable() was called.
>
> Therefore I would prefer to fix the DSIM driver and apply this fix to
> 6.5-rc instead of backporting the tc358762 patch. I gave it another shot
> and maybe you could do one more test with the attached patch and without
> the fix in tc358762.
>

Frieder,

This patch doesn't resolve the issue either. Let me know if there is
some quick debugging you want to add somewhere. I don't have a lot of
time to troubleshoot this week as I'm trying to wrap up some work
before a 2-week vacation but it's quick for me to apply patches and do
a quick boot test.

best regards,

Tim
