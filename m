Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770046EE5D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C8710E715;
	Thu,  9 Dec 2021 16:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB6310E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 08:36:14 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id m24so3336454pls.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 00:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gPSjlKUX+9Y5n3Sl0KL4uogsgbWr6pQzNUKzPDrEag4=;
 b=G7/Osq/HdjMvsJZjUwRfMyRbmVjGGXZpTKgarrqHDrUumHPJ1ehTj8it04M095FdrM
 Fn6RLK+ICZBDRLHJ9Ji9y66nI9SAl83MQ9Dox3m2la7OAUAvGLYn7k/yCrBudjYAmwxn
 t+i2KZMc2qzpZUyptdwwVfJR7sHpJw02H3F2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPSjlKUX+9Y5n3Sl0KL4uogsgbWr6pQzNUKzPDrEag4=;
 b=RqxItCkgYbnm2E9247joSXeTp5rfOo/jRnKKfO1gYgzRryefZJnTXmufGmWgR7449P
 tdKeiMVEEwCfOB29pP1DNnaUwzHb5fSaoVe8U9RNECmVOn4MNAEhUM/koW/gIiu80PCU
 iAVwoO80LqDcKfnswxoR6Ol4yjv71S8Qy9YFRFbeEfTc40cTsl1B6PkWA81t7RA6/UAT
 BkqRuSngxAMRjJTeuUlkkASAQDHAiRIG7pLL7qt6p/EHNW2NwS2Ozj8sBIB0gPya1i9b
 xL5TrJjOw36B6sHvHH0+UeoE4o5HQtGoNSgrPszzJTOCgT0+Nwu6SW+k48yX2jgtGeel
 JJGQ==
X-Gm-Message-State: AOAM533zYbyJxYpNEY7mKu7ee7kieq0ytpxgu13lbIU4giBoOY7czwnu
 CM8bM4fliM/lR8Vde4yfU/v3SwyyipNLdiPpegGPcg==
X-Google-Smtp-Source: ABdhPJw1c0KcLi7N1D0PrOBHMYuJDIXaLytxTcKjVE/FYrLOKMR01K4Ff3ReAIBG4TbdHAkUD9WaMzuK76CUVt18pSw=
X-Received: by 2002:a17:902:8302:b0:143:6e5f:a4a0 with SMTP id
 bd2-20020a170902830200b001436e5fa4a0mr65790309plb.20.1639038974084; Thu, 09
 Dec 2021 00:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org>
 <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
In-Reply-To: <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 9 Dec 2021 09:36:02 +0100
Message-ID: <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <Linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tim

On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Sam,
> >
> > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Jagan,
> > >
> > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > which is used in Exynos and i.MX8MM SoC's.
> > > >
> > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > >
> > > > Right now bridge offers two sets of implementations.
> > > >
> > > > A. With component_ops and exynos specific code exclusively for
> > > >    exynos dsi drivers and it's legacy bindings.
> > > >
> > > > B. Without componenet_ops for newly implemented bridges and its
> > > >    users like i.MX8MM.
> > > >
> > > > The future plan is to fix the implementation A) by dropping
> > > > component_ops and fixing exynos specific code in order to make
> > > > the bridge more mature to use and the same is mentioned in
> > > > drivers TODO.
> > > >
> > > > Patch 0001 - 0006: Bridge conversion
> > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > >
> > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > >
> > > > Anyone interest, please have a look on this repo
> > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > >
> > > > Would appreciate anyone from the exynos team to test it on
> > > > the exynos platform?
> > > >
> > > > Any inputs?
> > >
> > > I really like where you are headign with this!
> > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > individual patches.
> > >
> > > I hope you find a way to move forward with this.
> >
> > Thanks for the response.
> >
> > We have found some issues with Bridge conversion on existing exynos
> > drivers. The component based DSI drivers(like exynos) are difficult to
> > attach if it involves kms hotplug. kms hotplug would require drm
> > pointer and that pointer would only available after the bind call
> > finishes. But the bridge attach in bind call will defer till it find
> > the attached bridge.
> >
> > Right now I'm trying to find the proper way to attach the bridges for
> > component based DSI drivers which involves kms hot-plug.
> >
> > If you have any ideas on this, please let me know.
> >
>
> Jagan,
>
> How is your progress on this series? Looking at your repo it looks
> like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> branch but you've got a lot of things there that are likely not
> related to this series?

I have a bit of work on those patches and tested on imx8mn. Basically:

- add the dsi timing calculation
- change few difference with samsung bridge
- fix crashes of my dsi panels
- compare with NXP driver the final results

I found that I have one problem that gives me some instability. In the
NXP original driver the panel needs to be
enabled in bridge_enable before out the standby. If I understand
correctly, our standby should be done after.
I would like to have some feedback and help and testing on other
boards/devices and some suggestions on how to handle
some of the differences. Another big problem is etnavi that is not stable

Michael

>
> Best regards,
>
> Tim
>
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
