Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8442D587426
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 00:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811410EFC0;
	Mon,  1 Aug 2022 22:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259510E788
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 22:57:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o22so100009edc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3RtPyRzfB+HpbeEhTpVLyjlCEZhvDS/xfu2vrY2Ps+0=;
 b=BSJs3K6wmAEgOokteewdwhwrlGG6ViaQg8zXXgab7Z2kxWGLL0sgk+pFCtcw0JYS5w
 rWIMf8TSZQ93mdKn1UojbZ73I7kiq7PSD/+A+WrQBIElm2OYhHUk75wGYmTMrMcLN4dn
 ohBtLNk5Boz19RaAlAj3sEL7HVrosc7dDhUf3e8PEbKToq7X0LX+X5LUg9X8NvT2QVHc
 yvIbd/9Fp/7mIGUkmvRgwoZHAq17B8ofXwafQuL4u9iQ0JDIyCyw+R4F8Ngtn4qVDAL5
 8LBjIQkRKInarwtfe+0ks8vE8wGdyr43O/9NrH12+7q2cZ2TDZUuA/3PQeSHJNAi4qb9
 6FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3RtPyRzfB+HpbeEhTpVLyjlCEZhvDS/xfu2vrY2Ps+0=;
 b=6nAldbLwgVjTwHJoZisJZshBJy0+KDb6WBtXLkZ5E+ut72oTYYGMDbrQM1iyaYIkw6
 CglbNca1c2RcDmINjrTcyXIOO6rIvj/o6UmWwgryNEb9MTpLZDgIYzbSbO5ghrstTXKD
 pxqIoK6cSM/u5RMjmYpbArWUbpt+fKxcAvgK0LuIJRHRc8K1TDI6h1vcFFT49k8g/i6f
 GclI7OTvNIVCZ0j1sV0y6GbvG13lI/cy5H+dFiYaJaW9g0819ScVemmVeP3MdX833uuF
 J2jWZTtvhW9qnbqldsc8q3LvVK7u9hQ5RUWAEuMp83DJNDiVtOcG6jZumb2Gkrc2BXSI
 J9EA==
X-Gm-Message-State: ACgBeo2bHWzXij/7vBaV+tFsOln1ktNl0hOFoDDgnZ0GHORZbKisJPE2
 a66qZqPGcGa7emAKh8Kn6nNmEM3tWvmbxk58tb4=
X-Google-Smtp-Source: AA6agR6KXe7sXk/8IbFRkqOSPia+ub7FMqBjrXdEXQw2hy+FXvDfCZHeUz7nyVRMBZQOniflLDJz2S4z6+xC61LLPXs=
X-Received: by 2002:a05:6402:1e8c:b0:43d:db52:78a8 with SMTP id
 f12-20020a0564021e8c00b0043ddb5278a8mr2755420edf.324.1659394665341; Mon, 01
 Aug 2022 15:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <CAHCN7xLDPvQ__WJPeCptvq7mFtF3v3TGAG_vyDBxSdoqWwoO8A@mail.gmail.com>
In-Reply-To: <CAHCN7xLDPvQ__WJPeCptvq7mFtF3v3TGAG_vyDBxSdoqWwoO8A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 17:57:34 -0500
Message-ID: <CAHCN7xJ44L01tyCNyWZsvG-+=OuT93KrG8YLm8rCrzd=L6PkeA@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 3:07 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Aug 1, 2022 at 2:33 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Adam,
> >
> > On Sat, Jul 30, 2022 at 12:16 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > Hey all,
> > >
> > > I am trying to test Jagan's patch series [1] to add support for the
> > > samsung dsim bridge which is used on the imx8mm to output DSI video.
> > > The DSIM gets the video from the mxsfb, and in my case, the DSI is
> > > sent to the adv7535 for connecting to HDMI.
> >
> > I had to add some extra patches on top of Jagan's imx8mm-dsi-v3 to get
> > HDMI output functional on a imx8mm-evk via ADV7535:
> >
> > https://github.com/fabioestevam/kernel/commits/imx8mm-dsi-v3
> >
> > Does it work on your board?

Fabio,

I tried your branch, but I still get no video on the output of HDMI.
I do get a response to the modetest.  I won't post the whole thing
here, but here is a snippet

CRTCs:
id fb pos size
33 37 (0,0) (1920x1080)
  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
flags: nhsync, nvsync; type: driver
  props:
24 VRR_ENABLED:
flags: range
values: 0 1
value: 0

Planes:
id crtc fb CRTC x,y x,y gamma size possible crtcs
31 33 37 0,0 0,0 0        0x00000001
  formats: RG16 XR24
  props:
8 type:
flags: immutable enum
enums: Overlay=0 Primary=1 Cursor=2
value: 1
30 IN_FORMATS:
flags: immutable blob
blobs:

value:
01000000000000000200000018000000
01000000200000005247313658523234
03000000000000000000000000000000
0000000000000000
in_formats blob decoded:
RG16:  LINEAR
XR24:  LINEAR

Frame buffers:
id size pitch

When I compare this with NXP's downstream kernel that works with this
monitor, I get some different info:

CRTCs:
id fb pos size
33 41 (0,0) (1920x1080)
  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
flags: nhsync, nvsync; type: driver
  props:
24 VRR_ENABLED:
flags: range
values: 0 1
value: 0

Planes:
id crtc fb CRTC x,y x,y gamma size possible crtcs
31 33 41 0,0 0,0 0        0x00000001
  formats: XR24 AR24 RG16 XB24 AB24 RX24 RA24 AR15 XR15 AB15 XB15 BG16
  props:
8 type:
flags: immutable enum
enums: Overlay=0 Primary=1 Cursor=2
value: 1
32 zpos:
flags: immutable range
values: 0 0
value: 0

Frame buffers:
id size pitch

Notably, the  formats for the downstream list significantly more
formats.  I don't know how that translates to working video, but it
was something to note.

>
> I'll give them a try tonight.  I managed to get a hold of an adv7535
> user manual, and there are some items that it appears NXP did in their
> downstream kernel that never got pushed upstream. Based on my review
> of some of the changes, some of the NXP changes seem reasonable to me.
> If/when I can get it working, I'll try to report back some of my
> findings and push driver changes to the adv7535 as I find them.
>
> adam
