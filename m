Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A4586A5F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 14:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265791E51;
	Mon,  1 Aug 2022 12:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B6B91D8D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 12:15:20 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m8so13438740edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=CVzfo9DdvisneyDXyobtn/e72u2h3ldYCnBHERW/QDg=;
 b=AzXDGT8PxyvKO2GDmJBHBhkMSyIE+rqMegJ1iSeOWOptSdPzzCOkEv4KXhKyW2pd0C
 aWS1EOIVCL6Nl5X22R7fZkmVLgSsLMagBd/pGJ2vV6udhZa8NraikeHKLRGLVNORIDUm
 qS2YsL1gUA+i4jhZy61a44KqSvY1eXMvdVgPNSEHQa8niAJK8pz9y14DwgktEKBdyp1x
 g0XCgLBvbJfX3WocJDHQu07L2SFQZeyyGXt7l9GIE06i+ykTumxKcZ6AStmkS9jj4WRP
 kUjGKyCNvtGXpVH0GanQ6LKUUv3chImjv3h5WPZSYMg24Py/tKGrepMsQ9y402jH8Rvl
 CV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CVzfo9DdvisneyDXyobtn/e72u2h3ldYCnBHERW/QDg=;
 b=7v8FW3mqoP5QNSGYh7FPziOsDfbwsV+9fEv7/OC8Exa9u0QrnpAVe6XVSagtWWMarS
 OsMIK5UY3YJjp3n9jhE3VqY3AYugt0Rc1UVoMbJw2wsZxWoPTFlbcJyMtwRLV6noIFvi
 2rZUj6JIaz4DsG1ySwQmo5MbygjiBR1qxSs3yMQqZBj/e+7NiE3V4MB0qi8H/ShQWk99
 OeSgvm/3/VFRtl9lYrMNeg9Lgn879jJ49gZyvgBLV2wiEC22m2yI+XEk7bVDqkKk6IS8
 OTzDONbdjiyMsyVTSVSYWz9qR0BwWorUbD9iiTwtl43tUmQQ3/OugSsArUZquaF74lJ/
 XR6w==
X-Gm-Message-State: ACgBeo2SNcTA9/eTk3zFVVaGkF0QryvijLK09d8rALvJHyblqtWkOxmt
 /oCnyRZoiyJfnYPelLp9ZITFDZl7W5Bahe0+Jvk=
X-Google-Smtp-Source: AA6agR526khjrrpLYsW1IgG91hYvV5KATrbamHAryv/kbSTBgGUs6YndPqhMLeLaGOlrgw5dvWh8puw+QSBPyXScJgI=
X-Received: by 2002:a50:bace:0:b0:43d:370a:e1c1 with SMTP id
 x72-20020a50bace000000b0043d370ae1c1mr12778947ede.193.1659356118908; Mon, 01
 Aug 2022 05:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <20220801061956.3wkakhwatvqlngff@pengutronix.de>
 <CAHCN7xLSqyGHZwo=brm4xrj0jVi6R43wE8EJmWrYF72qDtYV0g@mail.gmail.com>
In-Reply-To: <CAHCN7xLSqyGHZwo=brm4xrj0jVi6R43wE8EJmWrYF72qDtYV0g@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 07:15:07 -0500
Message-ID: <CAHCN7xJ3deUnYMN5-NVmdknHZeFc-YOePVsGKNPb_XKqAFYLOQ@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Shawn Guo <shawnguo@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 5:54 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Aug 1, 2022 at 1:20 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi Adam,
> >
> > On 22-07-30, Adam Ford wrote:
> > > Hey all,
> > >
> > > I am trying to test Jagan's patch series [1] to add support for the
> > > samsung dsim bridge which is used on the imx8mm to output DSI video.
> > > The DSIM gets the video from the mxsfb, and in my case, the DSI is
> > > sent to the adv7535 for connecting to HDMI.
> >
> > So you're using the NXP recommended evalboard setup :)
>
> Yes and no.  Our design also adds audio to theADV7535 in addition to
> the video signal.
> For the 8M Plus design, we're looking to see if there are any 4K
> DSI->HDMI bridge chips available.
>
> >
> > > I have been able to get the device tree setup and I don't get any
> > > errors.  The Linux system appears to think the video is connected as
> > > determined by modetest:
> >
> > ...
> >
> > > Unfortunately, there is no video in my monitor, and my monitor states
> > > there is no signal.
> >
> > This is pretty much known, at least on our side. We also have a few more
> > patches on top of the series [1] for fixing the horizontal porches.  Our
> > current status is that we can get only one mode out of the ADV7535 which
> > is 1080P. Our assumption is that the ADV7535 needs some attentions
> > (fixes) but we can't verify that since the documentation is under NDA.
>
> I am glad I am not alone.   Thanks for the tip.  That gives me
> something to investigate.
> >
> > > If I use NXP's downstream kernel, this same hardware configuration
> > > works fine and I can see the video.
> >
> > This is because of the NXP downstream kernel porch 'calculation' and
> > workarounds. The values they are using for calculation don't take any
> > mode values into account and instead they are using a table. We don't
> > know where those values come from.
>
> I would think the VESA group would have something like these published.
> >
> > > I have checked the clk_summary, and the working and non-working
> > > conditions both have clock rates that are the same for DSI, LCDIF and
> > > related items.  The power domains connected to the lcdif and the dsi
> > > show they are active.
> > >
> > > Since I go no errors, and  Linux looks like it's happy, I was hoping
> > > someone from who better understands the interconnections between all
> > > these bridge layers might be able to offer a suggestion of something
> > > to investigate and/or try.
> > >
> > > The kernel repo I am using is from Jagan located here:
> > >
> > > [1] - https://github.com/openedev/kernel
> > >
> > > I am not convinced it's a device tree issue since I get no errors when
> > > the drivers enumerate, but I can provide my device tree updates if
> > > that helps.
> >
> > Please see above. Our debugging showed that there is a strange behaviour
> > of the ADV7535 but we don't have any documentation.
> Thanks for the comments.
>
> I'll look to see what I have for documentation.  I know my company
> signed a bunch of NDA stuff and we have an HDMI license.  I'll go
> through NXP's patches to their kernel and compare with whatever
> documentation I can find to see if I can make any improvements.

I checked our datasheet vault and I found no programming guide for the
ADV7535.  :-(
I've put in a request to see if we can get one.

I found one for the adv7511 on Analog Device's web site:
https://www.analog.com/media/en/technical-documentation/user-guides/ADV7511_Programming_Guide.pdf

They have a table of values for the different resolutions.  I am
guessing they might be the same or similar for 7535.
I'm going to look into NXP's alterations to this driver when I have more time.

adam
>
> adam
> >
> > Regards,
> >   Marco
