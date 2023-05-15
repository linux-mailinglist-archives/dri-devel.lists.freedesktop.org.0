Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FC702A6F
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 12:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4110E009;
	Mon, 15 May 2023 10:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294410E009
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 10:25:38 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-517c840f181so6638243a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684146338; x=1686738338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SJD8s7/vlpUC+r9xw+PjNSxoRA6UPLfFdFyhR8/9gI=;
 b=KQHaZ6uirginWKjs5TjDpahbCg8auMau95vKtwgMirG1+Nx9CWp3NOpLX8tTx+m0ub
 MkfiOuAivpTEOc4Fg2xgwghITnNL0fEmgZMtTqJNoG6hTgfoSM5zJ+7L/VH3RmPdxiCg
 vfq+Aj+DdAaw1FH4pn6jydaMxBk5pRgcqvx+/MkxbKYbQwAcfXoEEm3wVrN5xt0cKHeo
 yk/RbOgs6gx2zgtHpX0s7ShO+YMaBL8g4zknoaXEjPOSZBHPttoZimmD+YS0bWR+yGOD
 rh1t1Tw+FWrjyZyWGC/K9j68ROiUGDNliednQmA0C3WIxb3prGpBGiwJojFqb15AgmIt
 u4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146338; x=1686738338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SJD8s7/vlpUC+r9xw+PjNSxoRA6UPLfFdFyhR8/9gI=;
 b=G9RKdSfPyzsRoa9vN9ND3qbdovVut1Tia9Gy8hTPeKCDy0iUdkwKu24eX1VF8Ux18B
 eRJr884VPsR2pHapUIwl8IvuJqE9txNoHQq1nRXTyZzQ9rxgoHtxAyIx+qvBWOfudIl9
 Jb+sWsUoqrta6j6k4EMec6hsw9XfkMt2yrm4i1VaO+SJ6XO4q8AouWOWSmevR02O8fJ8
 F5M3hHjV8eN8JDpTzWymqU2c1H/8iSA86L9EoYatQwjuKZfCl8PaqsCWQe8jqfxjCm/R
 Vla0DHks3gyiwylvy9ZNXx4/ag2hYVnOyXmNy0UUc+6QOMZFPpMvCAFN/oAhJdI9VDgY
 M/+g==
X-Gm-Message-State: AC+VfDwBl7W8ndUXiHOIqSrcB8TIrJLnPY2dIVg239lwW1invGihfksm
 5MJx9IYHYbIlmtnMMGNMBrgkTSP1j4lqneZGNx4=
X-Google-Smtp-Source: ACHHUZ7VZh44ksmzDFTWNKgZ/ZRBATJGXm44xz2asG416oMZTokNGZRbtejpG45L9VAFCD3q+1W5gnYg7STctGGcD8E=
X-Received: by 2002:a17:90a:cf95:b0:24e:4c8:3ae5 with SMTP id
 i21-20020a17090acf9500b0024e04c83ae5mr34750211pju.28.1684146337573; Mon, 15
 May 2023 03:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-6-aford173@gmail.com>
 <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
 <CGME20230512200115eucas1p180198d430c17b044e34d66b7246d4a7b@eucas1p1.samsung.com>
 <CAHCN7xKq_hZXWZVMG0xFK_zGfm18ag48a83BtL5OyE6VJ3FMTA@mail.gmail.com>
 <7a83b8c1-88ff-0ae6-9c3b-d49fc08c7ac0@samsung.com>
 <CAHCN7xLZNvMx=U9=Fp=qrG9xaMhU1PS_nQO5FfC2S+XLO8YLXQ@mail.gmail.com>
 <96150852-84ce-f750-2e2e-8cb53cde5719@samsung.com>
In-Reply-To: <96150852-84ce-f750-2e2e-8cb53cde5719@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 15 May 2023 05:25:26 -0500
Message-ID: <CAHCN7x+thNWWTfyARTdXb_zbdo2Aq-gqjs3kqSXB6nczsoFnRw@mail.gmail.com>
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 2:37=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 13.05.2023 06:25, Adam Ford wrote:
> > On Fri, May 12, 2023 at 4:02=E2=80=AFPM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 12.05.2023 22:00, Adam Ford wrote:
> >>> On Fri, May 12, 2023 at 2:37=E2=80=AFPM Lucas Stach <l.stach@pengutro=
nix.de> wrote:
> >>>> Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
> >>>>> The DPHY timings are currently hard coded. Since the input
> >>>>> clock can be variable, the phy timings need to be variable
> >>>>> too.  Add an additional variable to the driver data to enable
> >>>>> this feature to prevent breaking boards that don't support it.
> >>>>>
> >>>>> The phy_mipi_dphy_get_default_config function configures the
> >>>>> DPHY timings in pico-seconds, and a small macro converts those
> >>>>> timings into clock cycles based on the pixel clock rate.
> >>>>>
> >>>> This week I finally had some time to take a deeper look at this seri=
es
> >>>> and test it on some of my systems.
> >>> Thanks for testing this!
> >>>> This patch causes issues when the burst clock rate is fixed by
> >>>> supplying the DT entry. Instead of describing the issue below, I'm
> >>>> attaching the patch that makes things work on my system.
> >>> Oops, sorry about that.
> >>>
> >>>> I would appreciate if you could test this one on your side. Feel fre=
e
> >>>> to squash it into yours if you find it working properly.
> >>> I reviewed your patch, and it looks like it makes a lot of sense.
> >>> If it works, I'll squash them together and add your name to the sign-=
off.
> > That worked really well, I'll add it to my WIP directory since Marek S
> > said he'd test the other proposal of dropping the dynamic phy flag and
> > corresponding check in favor of pushing everyone to the same code.
> >
> >>>> Also I would almost bet that dynamic_dphy is working on the Exynos
> >>>> boards with that fix added. So if anyone with access to those boards
> >>>> would like to give it a shot, we may be able to get rid of the
> >>>> hardcoded PHY parameters altogether, which would be a nice cleanup.
> >>> I wondered the same thing, but I didn't want to create more work for
> >>> Marek S and since there was so much churn getting the original driver
> >>> ported, I thought it would be the safest thing to try to give the
> >>> imx8m m/n/p the features without breaking the Exynos.
> >>>
> >>> Marek S - Do you want me to post this file without the extra checks t=
o
> >>> see if it still works with Exynos?
> >> Feel free to send me patches to test or just point to your
> >> work-in-progress git repo.
> > Thanks for testing this, Marek S.  My work-in-progress branch is:
> >
> > https://protect2.fireeye.com/v1/url?k=3D2eeb1ed9-4e098384-2eea9596-000b=
abd9f1ba-9ad5c339e5ea6e4d&q=3D1&e=3D652be603-d622-4d0e-95d3-639656ab1af1&u=
=3Dhttps%3A%2F%2Fgithub.com%2Faford173%2Flinux%2Ftree%2Fdsim-updates-wip
> >
> > Depending on what you find will determine how I modify the next
> > revision of the code I push, so I very much appreciate your feedback.
> > Hopefully the suggestion from Lucas will work for your applications
> > and we can reduce some of the code complexity.
>
> The above mentioned 'dsim-updates-wip' branch works fine on all my
> Exynos based boards.

Thank you for testing.  I'll work on squashing some of the patches
together and eliminating some of the duplicative stuff so the end
result should be the same as what is in WIP and submit another
revision soon.

thanks!

adam
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
