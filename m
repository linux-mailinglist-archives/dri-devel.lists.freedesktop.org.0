Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748151D5F8
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C910E0A5;
	Fri,  6 May 2022 10:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588FA10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 10:50:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p18so8243875edr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1nS6xKHG29lKG9M5NBEzyAVt0g3yPb4JZBKIqSJmDlM=;
 b=OZgw1lhOm42KiGxCjpNI6wr/surmxLobZMLcUskkSR045936n/t2wCu+JKdicE3BNQ
 zsVjg+8zTDzHq+mUxqN8DX2NycN5vSeJDYAXrNYduk9wukqpIkVMsp2BJuVGpgwOtSSL
 JTy3M10pVRwjby0cFQ3Xv0nRzBcyUuZ34luaWwlGcjNTBICgfgMIIHhu+oucACEGBmg2
 hpvWU+rBZ7x4HZOqKCwuNKHZXjA96Um9BYRbVY3Zap4mjs0xBAAXhK8Ui2xA669uQequ
 eEw6qC1A0GHu5udm6CRndBDKE+2eO/CHLZ8WZrv3R98hKet/JV1GCfox03voUvobxl5J
 +Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nS6xKHG29lKG9M5NBEzyAVt0g3yPb4JZBKIqSJmDlM=;
 b=2l3Zf5AYGHRWXCn7CwKn044tNSbWZ3rWnAX/BzSrF+xuvqnSP0bTmP/RZy0eC/Grbf
 wRsyLHoGs2gTNvCD0aoAPlhUtE+kx96kDa7uys8UDv9L3BLkBevvnNT3WcsdWHSTfZ+x
 +u1YX+RC9JFVjUwWvPhhRSB3PJCYdyOpuBzBwEkGMUR3i82Zd6ZJ+2dWRwOGD340DEzw
 Ht18Kv2P6P/x6U6vaj3pxAyqEE3vtBbSnZwmpyaX+XFUsJgxgF7uthLeHBzbaU3ykKnd
 xFgNMQx10EKuRi9mFOfIR00lRd/o4QbMCam5QNJmvDtQe5I5di+Dvj5PoI6kfZk0gvEu
 Wu4g==
X-Gm-Message-State: AOAM533+YHJpcwSwEzoG0nv4OffMyRZ/u3C8oowa1AJT1tWsXXuy8Xe1
 MT4apt9Qs7Rr8oPxCdTVAjH4OCPDjiz1rbyraTiGsQ==
X-Google-Smtp-Source: ABdhPJyVIz++X4+oGXCjRGBhpxqx5FUg8mUU7LBZqqIDazrf9kRZgPTJ+crPJe2Q5tMbOgZDIoQB+61xr36nJzn61U0=
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr2792317edx.128.1651834228722; Fri, 06
 May 2022 03:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <2184168.iZASKD2KPV@steina-w>
 <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
 <CGME20220505115537eucas1p16234d185961ff5f3fd8c6c1e5e4fb8d0@eucas1p1.samsung.com>
 <3104069.5fSG56mABF@steina-w>
 <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
In-Reply-To: <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 6 May 2022 11:50:12 +0100
Message-ID: <CAPY8ntD2uPqrb8mHy5ButBpWoBV5Z-epkHsL7SPha=TjMzP9jw@mail.gmail.com>
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI
 DSIM bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Robert Foss <robert.foss@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Fri, 6 May 2022 at 09:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Alexander,
>
> On 05.05.2022 13:55, Alexander Stein wrote:
> > Am Donnerstag, 5. Mai 2022, 09:38:48 CEST schrieb Jagan Teki:
> >> On Thu, May 5, 2022 at 12:57 PM Alexander Stein
> >>
> >> <alexander.stein@ew.tq-group.com> wrote:
> >>> Hello Jagan,
> >>>
> >>> thanks for the second version of this patchset.
> >>>
> >>> Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> >>>> This series supports common bridge support for Samsung MIPI DSIM
> >>>> which is used in Exynos and i.MX8MM SoC's.
> >>>>
> >>>> Previous v1 can be available here [1].
> >>>>
> >>>> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >>>>
> >>>> On, summary this patch-set break the entire DSIM driver into
> >>>> - platform specific glue code for platform ops, component_ops.
> >>>> - common bridge driver which handle platform glue init and invoke.
> >>>>
> >>>> Patch 0000:   Samsung DSIM bridge
> >>>>
> >>>> Patch 0001:   Common lookup code for OF-graph or child
> >>>>
> >>>> Patch 0002:   platform init flag via driver_data
> >>>>
> >>>> Patch 0003/10:  bridge fixes, atomic API's
> >>>>
> >>>> Patch 0011:   document fsl,imx8mm-mipi-dsim
> >>>>
> >>>> Patch 0012:   add i.MX8MM DSIM support
> >>>>
> >>>> Tested in Engicam i.Core MX8M Mini SoM.
> >>>>
> >>>> Anyone interested, please have a look on this repo [2]
> >>>>
> >>>> [2] https://protect2.fireeye.com/v1/url?k=569d5207-09066afa-569cd948-000babff317b-7f7572918a36c54e&q=1&e=1305c5cc-33c8-467e-a498-6862a854cf94&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v2
> >>>> [1]
> >>>> https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.1845
> >>>> 83-> 1-jagan@amarulasolutions.com/
> >>>>
> >>>> Any inputs?
> >>> I was able to get my LVDS display running using this driver and an LVDS
> >>> bridge. Actually my setup is similar to yours. My chain is like this:
> >>> MIPI-DSI -> sn65dsi83 -> LVDS panel
> >>> I noticed some things though:
> >>> My setup only works if I use less than 4 lanes. See [1]. When using 4
> >>> lanes
> >>> the image is flickering, but the content is "visible". Your DT has only 2
> >>> lanes configured, do you have the possibility to use 4 lanes? I have no
> >>> idea how to tackle this. It might be the DSIM side or the bridge side.
> >>> Apparently the downstream kernel from NXP supports 4 lanes, if I can trust
> >>> the config. I have no way to verify this though.
> >> What is dsi_lvds_bridge node? have you added your dts changes on top
> >> of imx8mm-dsi-v2 branch I'm pointing it.
> >>
> >> I will check 4 lanes and let you know.
> >>
> >>> Another thing is I get the following warning
> >>>
> >>>> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
> >>>> output
> >>> bridge driver. Falling back to SPWG24.
> >> This couldn't be much affected but will fix it.
> > I found the cause. You need the following diff:
> > ----8<-----
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/
> > samsung-dsim.c
> > index 138323dec0eb..7fb96dc7bb2e 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1427,7 +1427,7 @@ static int samsung_dsim_attach(struct drm_bridge
> > *bridge,
> >   {
> >          struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> >
> > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL,
> > flags);
> > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > flags);
> >   }
> >
> >   static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
> > ----8<-----
>
> Well, basically, the above change breaks DSI panels. :(
>
> I've spent another evening playing with that code and I have some more
> thoughts...
>
> I agree that logically this should be like you pointed. However the the
> code has been hacked in such a way, that it forces a proper order of
> pre-enable operations of the DSI and the client (panel, next bridge).
> This works somehow with a chain of 2 entities (Trats board: DSI and a
> panel) or even 3 entities (Arndale board: DSI, TC358764 bridge, panel),
> but probably it fails in your case.
>
> I really have no clue how to fix this mess. It has been pointed many
> times that this insane per-order call chain of the pre_enable()
> operations is completely useless for the DSI hardware and noone pointed
> how to solve this. Exynos DSI (and VC4) called those operations directly
> to achieve proper order. So what happened? Now Exynos DSI got converted
> to the generic bridge call chain. To get it working with existing hw,
> the order of the bridges has been hacked. Probably in the next few
> releases more mess will come to get around this known issue, especially
> when support for the next set of imx boards is added.
>
> I'm really open to help fixing this issue. I've spent a lot of time
> analyzing this code and I have boards to test. Just please give me some
> advice how to avoid this reverse-order call chain of the pre_enable()
> operations in the widely accepted, non-hacky way.

I sent [1] to try and offer a solution for DSI back in March, but no
one has responded to it at all. Care to review it?

As noted in the cover letter for that series, splitting the
bridge_chain (as Exynos and vc4 do) does not work with atomic
operations due to the bridges beyond the split never being added to
the state. That approach is a dead end, and I'm trying to move vc4
away from it. That's not possible until the framework issue is
resolved, unless you adopt the hack done by dw-mipi and msm to power
up the DSI host in mode_set.

Thanks.
  Dave

[1] https://patchwork.kernel.org/project/dri-devel/cover/cover.1646406653.git.dave.stevenson@raspberrypi.com/

> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
