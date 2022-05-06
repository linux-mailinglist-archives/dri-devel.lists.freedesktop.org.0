Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF7551D5D6
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FE110E1AD;
	Fri,  6 May 2022 10:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369C510E035
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1651833531; x=1683369531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXeBs22u3irpJQ/qOA2xlt8evTjUfTXobAD0Uvo8Pa4=;
 b=NlsQ1xTEQCQank+z/X6qYtqYMfcWIf39DNrhpCVlMFdVcdRXId3EcRl2
 H/hclIbBUswBOxkgepYOZ+y2JcS404JU0ZjuryRzjuinaF1w+rMi9Pcel
 jzRQ7z68N3HzOBi2RGvvI8KuC8eS36DC7iRQBAWiY1k4paC8Fhm9M8Mwd
 jKR06kthXLVAixAFsR+mcPhF3YtK8CDIHTbwgJFwAwACXhdu+UTKOGp//
 bBGOi4hXt3LD/fso4XVfQ3B3kPZk1sZJFD3EztwEQq8ZsBb27ZfnK+GFM
 rQkvhr/K1fdKQbJHn7ywYqaqy68ekVAuoJ2iNpPVwGJzdrfkaT+Y1sphA Q==;
X-IronPort-AV: E=Sophos;i="5.91,203,1647298800"; d="scan'208";a="23718748"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 May 2022 12:38:48 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 06 May 2022 12:38:49 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 06 May 2022 12:38:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1651833529; x=1683369529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXeBs22u3irpJQ/qOA2xlt8evTjUfTXobAD0Uvo8Pa4=;
 b=EO3EvmWC3rVKjYV4twnWzLUIioOSwBAzba5sIH4XP24sCmkN1zgNpn1p
 FZWJL1EsZtvDydjo2rAHUQwa8QAOlQQt1+YgbZrZ7EqF0+mCa0rVcCX9u
 huXfKVhY6Oz5pDIFPUqpSGVt4AFjtXCcfReYjmdnNKSnyc0MJLq8fpNez
 azKwLcNWLdOjG82UIRX34NB8lIqRiqGtkwMzYgqhof4T+In8eRa+GfckF
 E4nRlrivzSVrex2VtedhuCxVbEOix0jFtrtn7uqXrnu1QyyOSurR8Blnx
 dw1MrWii0f4We6arPLR/DNnjjwwqv2KWgngxwRSI3gcC7ziB6hmTf69GX g==;
X-IronPort-AV: E=Sophos;i="5.91,203,1647298800"; d="scan'208";a="23718747"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 May 2022 12:38:48 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3B715280070;
 Fri,  6 May 2022 12:38:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI
 DSIM bridge
Date: Fri, 06 May 2022 12:38:45 +0200
Message-ID: <13011661.dW097sEU6C@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <3104069.5fSG56mABF@steina-w>
 <5671f394-763d-a999-a300-a230199e1eda@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Freitag, 6. Mai 2022, 10:57:05 CEST schrieb Marek Szyprowski:
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
> >>>> [2]
> >>>> https://protect2.fireeye.com/v1/url?k=569d5207-09066afa-569cd948-000ba
> >>>> bff317b-7f7572918a36c54e&q=1&e=1305c5cc-33c8-467e-a498-6862a854cf94&u=h
> >>>> ttps%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v2 [1]
> >>>> https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.184
> >>>> 5
> >>>> 83-> 1-jagan@amarulasolutions.com/
> >>>> 
> >>>> Any inputs?
> >>> 
> >>> I was able to get my LVDS display running using this driver and an LVDS
> >>> bridge. Actually my setup is similar to yours. My chain is like this:
> >>> MIPI-DSI -> sn65dsi83 -> LVDS panel
> >>> I noticed some things though:
> >>> My setup only works if I use less than 4 lanes. See [1]. When using 4
> >>> lanes
> >>> the image is flickering, but the content is "visible". Your DT has only
> >>> 2
> >>> lanes configured, do you have the possibility to use 4 lanes? I have no
> >>> idea how to tackle this. It might be the DSIM side or the bridge side.
> >>> Apparently the downstream kernel from NXP supports 4 lanes, if I can
> >>> trust
> >>> the config. I have no way to verify this though.
> >> 
> >> What is dsi_lvds_bridge node? have you added your dts changes on top
> >> of imx8mm-dsi-v2 branch I'm pointing it.
> >> 
> >> I will check 4 lanes and let you know.
> >> 
> >>> Another thing is I get the following warning
> >>> 
> >>>> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
> >>>> output
> >>> 
> >>> bridge driver. Falling back to SPWG24.
> >> 
> >> This couldn't be much affected but will fix it.
> > 
> > I found the cause. You need the following diff:
> > ----8<-----
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/ samsung-dsim.c
> > index 138323dec0eb..7fb96dc7bb2e 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1427,7 +1427,7 @@ static int samsung_dsim_attach(struct drm_bridge
> > *bridge,
> > 
> >   {
> >   
> >          struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> > 
> > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL,
> > flags);
> > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > flags);
> > 
> >   }
> >   
> >   static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
> > 
> > ----8<-----
> 
> Well, basically, the above change breaks DSI panels. :(

That's too bad :( I wonder why actually this breaks DSI setups. From my 
understanding, the diff above seems correct, even for DSI panels.
But I don't know a DSI setup in detail or the bridge/panel code involved or 
which part breaks with this change.

> I've spent another evening playing with that code and I have some more
> thoughts...
> 
> I agree that logically this should be like you pointed. However the the
> code has been hacked in such a way, that it forces a proper order of
> pre-enable operations of the DSI and the client (panel, next bridge).
> This works somehow with a chain of 2 entities (Trats board: DSI and a
> panel) or even 3 entities (Arndale board: DSI, TC358764 bridge, panel),
> but probably it fails in your case.

Well, setting e.g. the bus format from panel -> bridge -> bridge ->... -> 
encoder seems sensible to me. It should be similar for both names setups as 
well. Essentially the Arndale is quite a similar setup to my and Jagan's one.
The actual reason it fails for me is that this list is created incorrectly, 
which should also be the case for Arndale.

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

In the first place I'm inclined to raise a warning in drm_bridge_attach() if 
previous is NULL and encoder->bridge_chain is not empty. This means that you 
are adding two "root"-bridges which seems wrong to me.

There is also some documentation regarding 'special care dsi' in drivers/gpu/
drm/drm_bridge.c. There is some distinction between a DSI host using 
components or not. But I have no knowledge about those components. 
That being said, I would assume that the Exynos conversion using a DRM bridge 
now might needs some additional changes.

Best regards,
Alexander



