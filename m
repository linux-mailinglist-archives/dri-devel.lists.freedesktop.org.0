Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB746F02C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82C610F955;
	Thu,  9 Dec 2021 16:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3810E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 16:40:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id m24so4282904pls.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XjBC6XUZJtPnhjTwfnkF808Zuq6NSOID5LVmEgkaOSQ=;
 b=w7Km7X5aTXVv4afJepuvvxUzlxaeKJkB6sKRFHDAPKphveY5UYuehMBl5Zgkz0c48s
 YW0+gmxf9V2Rn4oBHSkEY+MkK/J2o8HT5yUcBuotgbi/x1Odki/kiCJhSyeB7riY6+MD
 cBfNgfvIHQD33UUdIa9M2zULndAZv97MPUEOdlV7TLd1uqfCgKd8ipQkXx91qxCkq2xg
 17Q20lXqHkjWN3telzgJhms20L7mwI+EZUmNZXX39+EIZPqVOcZ6WeWf+nI+oApi6cvV
 jcnrdiMnASvfcpGnePC4rZ3bsOYr82BR5kCL7XWML42AipHPxITYKGmEekVIaU2dYZBx
 9byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XjBC6XUZJtPnhjTwfnkF808Zuq6NSOID5LVmEgkaOSQ=;
 b=fX6HKE3n4nqX3SITcytljbw5oQ8ljYAtqBoZy54HF7ykuVwIfX5LjsSq+XQCKDkzM9
 t46Zo3nUjoJ2TCfx4GYRMKSFK+DOMOE9aMno6pJruVNZSJqOcwP2vZfeSAU3GPOZAf78
 8WgmozkOqeXHbaB52j26Ci/dF7+0pc5TKbqidGuxeZiN2u5suzbqcaaqZT5ZiUIMpa3e
 ItfCSRcsHvHGntyKMYyYNnk65TThFLwdlOG3dirnTPQbwaXr1J7X6S95uxdCZVWJieox
 gE4v4eyKQP4AO84kruzPLH3zYcy4EMKL25oDics61Xfka82eGSOL+Z8dfhR5sOKb99G2
 7ENQ==
X-Gm-Message-State: AOAM5338E+8T8R5BhyRnU/Zzz4fZF/VmMklO364Sdc6xAFdfxZyDHi+B
 Noqq9TuPygj6yHq3tdmPC1jSvR33dKsNyvEtp6lUHg==
X-Google-Smtp-Source: ABdhPJzx3c4r0U+1q6LMafUGVo/WqdHyJSDJX1lRvhv0uEvpW1qCUNrk01ja1Jr5pkapoYydNfefkbMsZ9ornAF1028=
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr16962368pjb.66.1639068023870; 
 Thu, 09 Dec 2021 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org>
 <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
 <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
In-Reply-To: <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 9 Dec 2021 08:40:12 -0800
Message-ID: <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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

On Thu, Dec 9, 2021 at 12:36 AM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi Tim
>
> On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Hi Sam,
> > >
> > > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > >
> > > > Hi Jagan,
> > > >
> > > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > > which is used in Exynos and i.MX8MM SoC's.
> > > > >
> > > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > > >
> > > > > Right now bridge offers two sets of implementations.
> > > > >
> > > > > A. With component_ops and exynos specific code exclusively for
> > > > >    exynos dsi drivers and it's legacy bindings.
> > > > >
> > > > > B. Without componenet_ops for newly implemented bridges and its
> > > > >    users like i.MX8MM.
> > > > >
> > > > > The future plan is to fix the implementation A) by dropping
> > > > > component_ops and fixing exynos specific code in order to make
> > > > > the bridge more mature to use and the same is mentioned in
> > > > > drivers TODO.
> > > > >
> > > > > Patch 0001 - 0006: Bridge conversion
> > > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > > >
> > > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > > >
> > > > > Anyone interest, please have a look on this repo
> > > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > > >
> > > > > Would appreciate anyone from the exynos team to test it on
> > > > > the exynos platform?
> > > > >
> > > > > Any inputs?
> > > >
> > > > I really like where you are headign with this!
> > > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > > individual patches.
> > > >
> > > > I hope you find a way to move forward with this.
> > >
> > > Thanks for the response.
> > >
> > > We have found some issues with Bridge conversion on existing exynos
> > > drivers. The component based DSI drivers(like exynos) are difficult to
> > > attach if it involves kms hotplug. kms hotplug would require drm
> > > pointer and that pointer would only available after the bind call
> > > finishes. But the bridge attach in bind call will defer till it find
> > > the attached bridge.
> > >
> > > Right now I'm trying to find the proper way to attach the bridges for
> > > component based DSI drivers which involves kms hot-plug.
> > >
> > > If you have any ideas on this, please let me know.
> > >
> >
> > Jagan,
> >
> > How is your progress on this series? Looking at your repo it looks
> > like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> > branch but you've got a lot of things there that are likely not
> > related to this series?
>
> I have a bit of work on those patches and tested on imx8mn. Basically:
>
> - add the dsi timing calculation
> - change few difference with samsung bridge
> - fix crashes of my dsi panels
> - compare with NXP driver the final results
>
> I found that I have one problem that gives me some instability. In the
> NXP original driver the panel needs to be
> enabled in bridge_enable before out the standby. If I understand
> correctly, our standby should be done after.
> I would like to have some feedback and help and testing on other
> boards/devices and some suggestions on how to handle
> some of the differences. Another big problem is etnavi that is not stable
>

Michael,

Where can I find your patches?

What do you mean by etnaviv not being stable?

I did some limited testing with etnaviv on imx8mm with 5.15 + dsi
patches on an Ubuntu focal root filesystem by:
apt update
apt install gnome-session gnome-terminal
^^^ 2D hardware acceleration appears to be working (dragging opaque
windows around)
apt install mesa-utils glmark2
glxgears
^^^ ~160fps on IMX8MM
glmark2
^^^ score of 39 on IMX8MM

I haven't seen any updates from Jagan since Nov 24
(https://www.spinics.net/lists/dri-devel/msg324059.html) and am not
sure if he's been able to work through drm/exynos issues that have
been blocking his progress.

Best regards,

Tim
