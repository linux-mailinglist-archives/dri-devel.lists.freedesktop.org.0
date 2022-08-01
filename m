Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E25867DD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 12:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572E510F9CE;
	Mon,  1 Aug 2022 10:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5311A871
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 10:54:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gk3so7444714ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Wbcc09xUaIf01C1E4HXm0dIDLsAKCmlGM3/QPcRFjyo=;
 b=PsE/4CIWpVzsAX4KrNjGaY5eP7PjaJ+eVshBNmEg6EF1jLsSaHI3fOjqlHEPtclF18
 QuPts7lzxQGe7dh8OrgVKcm8yrJ6DrsAJ6kJX5kq0VaNymOK2Zo1pmAr4OMJux/flYtG
 PT3mIEKgnF7Kpkq1tbUmgSEwTLmCezPPvfBnnD8XpNrVP8qkV2WMp1e3qQl9QhPkmr9r
 aENjATsYRUl7HGCgJvr0ncXWIjicBieSVXeHXDoWWQjVeT1MbrdSXfYthA4rvEdtAKNE
 6nHNpcq1YxiUwzfDSSv/wtZj+vt1fc1HoCTIYiiDThgSsS1gEqAszxAGMZoCHnZXrmJP
 OD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Wbcc09xUaIf01C1E4HXm0dIDLsAKCmlGM3/QPcRFjyo=;
 b=VFCynjVoVnp/mG4mSZfGhL1Dr77gZjQ6iZ8d/ooaB/fFcyBP0wvFA3JCC6sVQkygcE
 m0ObJFs5XquP9cd5AnP1Tqpfg+Xq8SMw8SnlbsSC8RjR7yClJ2itugGOHGDy/2n9aw83
 G78fZoBHMFC+c7kalAmx/4KnL0lVa/5DcNANChBSzbq7YgZXBJZ0C9QS32mbBtD8/fyH
 QRfzVdg8FJDDEp1RlwDoJ+GIfk3QlU8ezxQnsiuONTKJL9RGGmpeC39LNBNla9a953eh
 fVEAScR8C8nXYDcL1Z0zhh2zUS7gJ7Su/2WrydlNv6rJmjsW7qHFDetGvht/ix/6bInB
 O3fw==
X-Gm-Message-State: AJIora8LCYXiHwOkfvPBj58SyotSbrViUX2DLT96sIO1sd9g7QZ9xWI3
 5odF+SFGolQZp2v6Wo8CWRlKedc4OkO7N4V9y+g=
X-Google-Smtp-Source: AGRyM1sCUcD7NqeJM5MgA4r77ZTTgYdj2zBCrytU/4cA3J1S85UcqaGpqyd5zZybVr5SM1fkJ4KPykuQvSDHU0einh0=
X-Received: by 2002:a17:907:6e12:b0:72e:6774:cb80 with SMTP id
 sd18-20020a1709076e1200b0072e6774cb80mr11686350ejc.504.1659351253340; Mon, 01
 Aug 2022 03:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <20220801061956.3wkakhwatvqlngff@pengutronix.de>
In-Reply-To: <20220801061956.3wkakhwatvqlngff@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 05:54:02 -0500
Message-ID: <CAHCN7xLSqyGHZwo=brm4xrj0jVi6R43wE8EJmWrYF72qDtYV0g@mail.gmail.com>
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

On Mon, Aug 1, 2022 at 1:20 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi Adam,
>
> On 22-07-30, Adam Ford wrote:
> > Hey all,
> >
> > I am trying to test Jagan's patch series [1] to add support for the
> > samsung dsim bridge which is used on the imx8mm to output DSI video.
> > The DSIM gets the video from the mxsfb, and in my case, the DSI is
> > sent to the adv7535 for connecting to HDMI.
>
> So you're using the NXP recommended evalboard setup :)

Yes and no.  Our design also adds audio to theADV7535 in addition to
the video signal.
For the 8M Plus design, we're looking to see if there are any 4K
DSI->HDMI bridge chips available.

>
> > I have been able to get the device tree setup and I don't get any
> > errors.  The Linux system appears to think the video is connected as
> > determined by modetest:
>
> ...
>
> > Unfortunately, there is no video in my monitor, and my monitor states
> > there is no signal.
>
> This is pretty much known, at least on our side. We also have a few more
> patches on top of the series [1] for fixing the horizontal porches.  Our
> current status is that we can get only one mode out of the ADV7535 which
> is 1080P. Our assumption is that the ADV7535 needs some attentions
> (fixes) but we can't verify that since the documentation is under NDA.

I am glad I am not alone.   Thanks for the tip.  That gives me
something to investigate.
>
> > If I use NXP's downstream kernel, this same hardware configuration
> > works fine and I can see the video.
>
> This is because of the NXP downstream kernel porch 'calculation' and
> workarounds. The values they are using for calculation don't take any
> mode values into account and instead they are using a table. We don't
> know where those values come from.

I would think the VESA group would have something like these published.
>
> > I have checked the clk_summary, and the working and non-working
> > conditions both have clock rates that are the same for DSI, LCDIF and
> > related items.  The power domains connected to the lcdif and the dsi
> > show they are active.
> >
> > Since I go no errors, and  Linux looks like it's happy, I was hoping
> > someone from who better understands the interconnections between all
> > these bridge layers might be able to offer a suggestion of something
> > to investigate and/or try.
> >
> > The kernel repo I am using is from Jagan located here:
> >
> > [1] - https://github.com/openedev/kernel
> >
> > I am not convinced it's a device tree issue since I get no errors when
> > the drivers enumerate, but I can provide my device tree updates if
> > that helps.
>
> Please see above. Our debugging showed that there is a strange behaviour
> of the ADV7535 but we don't have any documentation.
Thanks for the comments.

I'll look to see what I have for documentation.  I know my company
signed a bunch of NDA stuff and we have an HDMI license.  I'll go
through NXP's patches to their kernel and compare with whatever
documentation I can find to see if I can make any improvements.

adam
>
> Regards,
>   Marco
