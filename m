Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0A46F5E2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 22:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F0110E388;
	Thu,  9 Dec 2021 21:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AE710E386
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 21:24:26 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so7933886pjc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kETf6wQ7nxGjCjc4CgqPta+4XkgZdTT2tgeI2T6LND0=;
 b=VafOhCJcnf2l5WV8EpXs8gWEOpCDrm1Yy9Baltb02EyzQfRu/RfxVLbz0QgdPgH+TV
 WqKxK0r0XBeRUdM9acLXt0HfwaAg9pGI42kMjHFxcpEpzZWUhYprkZ0ON6sCuTs2ekFt
 1DKLPBbgFRaU0spb/bsGORX4aeQVwbKcRP7cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kETf6wQ7nxGjCjc4CgqPta+4XkgZdTT2tgeI2T6LND0=;
 b=DdXrLi9JQGrt5i8RHZ9fBhVaFIEoC0aYX4hk26TPQ5lmsiCe5GXr7YpQXX8I4O6WJQ
 sRTEjHQxvHS2aLh7xa8kR0nf2qeCEOujISoDaywfaIb/7g64FIWZHNr+2VoYdoP2yAIw
 Hhuhxcdbv3NTYItFOhoSC86hS+3YQHARdqUYYV2bQRq4XD6l0IakRmhE1WMyKQeg0sIp
 KauG+wlNdHavVlR3BD6P5hpBdbedBCk53t/9WUpkN/zk+wowbwgvj4a3bm5mXn8WEZZL
 R5TB2tIvnz23Jbe9pYTxgkA+pIQUzs75MEoWpbVC8Vk7UPA6ofPVxplIGdkk2CRMSK5v
 39+w==
X-Gm-Message-State: AOAM533/+HRLkdjXsSEYLVSgWLfoOVJpY3k2bi6FlYJCPlQ3NIrabl4V
 is9Y7rCwKubD33gIVRB5ag14Pb9PxV7bALaIqBODGg==
X-Google-Smtp-Source: ABdhPJzOTvW5y7BmVlKtK+tToV3wiJtGHpPWbYPXnPBCKZuXJM2ZuLzineNK+D1/xn66XJHyfIrrigujc6wSLcqpVto=
X-Received: by 2002:a17:90b:3ec1:: with SMTP id
 rm1mr18747164pjb.171.1639085066319; 
 Thu, 09 Dec 2021 13:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org>
 <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
 <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
 <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
 <CAOf5uw=Cts+V+amSrTzVyRyFZA=eKSVtRPtXae40-4M0bu6pwg@mail.gmail.com>
 <ad3feb990ea73d258075e9bf3d3034189266bad2.camel@lynxeye.de>
In-Reply-To: <ad3feb990ea73d258075e9bf3d3034189266bad2.camel@lynxeye.de>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 9 Dec 2021 22:24:14 +0100
Message-ID: <CAOf5uwnSd0fBLHRgM2qvTH+4EorYamoED+XKL7dX=gA-eFKjkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To: Lucas Stach <dev@lynxeye.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 NXP Linux Team <Linux-imx@nxp.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Thu, Dec 9, 2021 at 9:24 PM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Donnerstag, dem 09.12.2021 um 18:09 +0100 schrieb Michael Nazzareno
> Trimarchi:
> > Hi Tim
> >
> > On Thu, Dec 9, 2021 at 5:40 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > On Thu, Dec 9, 2021 at 12:36 AM Michael Nazzareno Trimarchi
> > > <michael@amarulasolutions.com> wrote:
> > > >
> > > > Hi Tim
> > > >
> > > > On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > >
> > > > > On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > >
> > > > > > Hi Sam,
> > > > > >
> > > > > > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > > > >
> > > > > > > Hi Jagan,
> > > > > > >
> > > > > > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > > > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > > > > > which is used in Exynos and i.MX8MM SoC's.
> > > > > > > >
> > > > > > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > > > > > >
> > > > > > > > Right now bridge offers two sets of implementations.
> > > > > > > >
> > > > > > > > A. With component_ops and exynos specific code exclusively for
> > > > > > > >    exynos dsi drivers and it's legacy bindings.
> > > > > > > >
> > > > > > > > B. Without componenet_ops for newly implemented bridges and its
> > > > > > > >    users like i.MX8MM.
> > > > > > > >
> > > > > > > > The future plan is to fix the implementation A) by dropping
> > > > > > > > component_ops and fixing exynos specific code in order to make
> > > > > > > > the bridge more mature to use and the same is mentioned in
> > > > > > > > drivers TODO.
> > > > > > > >
> > > > > > > > Patch 0001 - 0006: Bridge conversion
> > > > > > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > > > > > >
> > > > > > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > > > > > >
> > > > > > > > Anyone interest, please have a look on this repo
> > > > > > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > > > > > >
> > > > > > > > Would appreciate anyone from the exynos team to test it on
> > > > > > > > the exynos platform?
> > > > > > > >
> > > > > > > > Any inputs?
> > > > > > >
> > > > > > > I really like where you are headign with this!
> > > > > > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > > > > > individual patches.
> > > > > > >
> > > > > > > I hope you find a way to move forward with this.
> > > > > >
> > > > > > Thanks for the response.
> > > > > >
> > > > > > We have found some issues with Bridge conversion on existing exynos
> > > > > > drivers. The component based DSI drivers(like exynos) are difficult to
> > > > > > attach if it involves kms hotplug. kms hotplug would require drm
> > > > > > pointer and that pointer would only available after the bind call
> > > > > > finishes. But the bridge attach in bind call will defer till it find
> > > > > > the attached bridge.
> > > > > >
> > > > > > Right now I'm trying to find the proper way to attach the bridges for
> > > > > > component based DSI drivers which involves kms hot-plug.
> > > > > >
> > > > > > If you have any ideas on this, please let me know.
> > > > > >
> > > > >
> > > > > Jagan,
> > > > >
> > > > > How is your progress on this series? Looking at your repo it looks
> > > > > like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> > > > > branch but you've got a lot of things there that are likely not
> > > > > related to this series?
> > > >
> > > > I have a bit of work on those patches and tested on imx8mn. Basically:
> > > >
> > > > - add the dsi timing calculation
> > > > - change few difference with samsung bridge
> > > > - fix crashes of my dsi panels
> > > > - compare with NXP driver the final results
> > > >
> > > > I found that I have one problem that gives me some instability. In the
> > > > NXP original driver the panel needs to be
> > > > enabled in bridge_enable before out the standby. If I understand
> > > > correctly, our standby should be done after.
> > > > I would like to have some feedback and help and testing on other
> > > > boards/devices and some suggestions on how to handle
> > > > some of the differences. Another big problem is etnavi that is not stable
> > > >
> > >
> > > Michael,
> > >
> > > Where can I find your patches?
> > >
> >
> > I will push on some tree and share
> >
> > > What do you mean by etnaviv not being stable?
> > >
> > > I did some limited testing with etnaviv on imx8mm with 5.15 + dsi
> >
> >
> >
> > > patches on an Ubuntu focal root filesystem by:
> > > apt update
> > > apt install gnome-session gnome-terminal
> > > ^^^ 2D hardware acceleration appears to be working (dragging opaque
> > > windows around)
> > > apt install mesa-utils glmark2
> > > glxgears
> > > ^^^ ~160fps on IMX8MM
> > > glmark2
> > > ^^^ score of 39 on IMX8MM
> > >
> > > I haven't seen any updates from Jagan since Nov 24
> > > (https://www.spinics.net/lists/dri-devel/msg324059.html) and am not
> > > sure if he's been able to work through drm/exynos issues that have
> > > been blocking his progress.
> >
> > I plan to push on github
> >
> > [17:07:42.315] Sending ready to systemd
> > [  214.052085] etnaviv-gpu 38000000.gpu: recover hung GPU!
> > [  214.595998] etnaviv-gpu 38000000.gpu: recover hung GPU!
> >
> > ** (maynard:386): WARNING **: 17:07:43.874: failed to setup mixer: Success
> > [17:07:44.175] Added surface 0xaaab02630440, app_id (null) to pending list
> > [17:07:44.176] Added surface 0xaaab026172b0, app_id (null) to pending list
> > ** Message: 17:07:44.289: New advertisement app id maynard
> > ** Message: 17:07:44.290: New advertisement app id maynard
> > [17:07:45.171] (background) position view 0xaaab0261f860, x 0, y 0, on
> > output DSI-1
> > [17:07:45.171] (panel) geom.width 100, geom.height 480, geom.x 0, geom.y 0
> > [17:07:45.171] (panel) edge 2 position view 0xaaab02634510, x 0, y 0
> > [17:07:45.172] panel type 2 inited on output DSI-1
> > [17:07:45.172] Usable area: 380x480+100,0
> > [  216.932080] etnaviv-gpu 38000000.gpu: recover hung GPU!
> > [  217.476015] etnaviv-gpu 38000000.gpu: recover hung GPU!
> > [  218.020157] etnaviv-gpu 38000000.gpu: recover hung GPU!
> >
> > This is my problem on imx8mn
>
> Note that the GPU on the 8MN is from the GC7000 generation, which
> genreally has bogus feature registers, as VeriSilicon stopped using
> them in favor of a hardware database. To get the GPu working you need
> to transcribe the entry for this specific GPU from the downstream GPU
> driver into the etanviv HWDB format, to make the kernel and userspace
> driver aware of how to drive this GPU.

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index f2fc645c7956..724f78fd37e5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -68,6 +68,37 @@ static const struct etnaviv_chip_identity
etnaviv_chip_identities[] = {
                .minor_features10 = 0x00004040,
                .minor_features11 = 0x00000024,
        },
+       {
+               .model = 0x7000,
+               .revision = 0x6203,
+               .product_id = ~0U,
+               .customer_id = ~0U,
+               .eco_id = 0,
+               .stream_count = 16,
+               .register_max = 64,
+               .thread_count = 512,
+               .shader_core_count = 2,
+               .vertex_cache_size = 16,
+               .vertex_output_buffer_size = 1024,
+               .pixel_pipes = 1,
+               .instruction_count = 512,
+               .num_constants = 320,
+               .buffer_size = 0,
+               .varyings_count = 16,
+               .features = 0xe0287c8c,
+               .minor_features0 = 0xc1589eff,
+               .minor_features1 = 0xfefbfad9,
+               .minor_features2 = 0xeb9d4fbf,
+               .minor_features3 = 0xedfffced,
+               .minor_features4 = 0xdb0dafc7,
+               .minor_features5 = 0x3b5ac333,
+               .minor_features6 = 0xfcce6000,
+               .minor_features7 = 0xfffbfa6f,
+               .minor_features8 = 0x00e10ef3,
+               .minor_features9 = 0x00c8003c,
+               .minor_features10 = 0x00004040,
+               .minor_features11 = 0x00000024,
+       },
        {
                .model = 0x7000,
                .revision = 0x6204,

Ok, should something like this. Only does not know about this
gcFEATURE_BIT_DE_2D_FAST_CLEAR. I put in features but can even a
minor. Do you know the right mapping?

Michael

Michael

>
> Regards,
> Lucas
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
