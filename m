Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A949C46F4FE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 21:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B95710E1EB;
	Thu,  9 Dec 2021 20:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Thu, 09 Dec 2021 20:34:25 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4953410E1EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 20:34:25 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 8CDEBE74217; Thu,  9 Dec 2021 21:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from [192.168.178.22] (a89-183-24-88.net-htp.de [89.183.24.88])
 by lynxeye.de (Postfix) with ESMTPSA id E6DBFE74023;
 Thu,  9 Dec 2021 21:24:07 +0100 (CET)
Message-ID: <ad3feb990ea73d258075e9bf3d3034189266bad2.camel@lynxeye.de>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
From: Lucas Stach <dev@lynxeye.de>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Tim Harvey
 <tharvey@gateworks.com>
Date: Thu, 09 Dec 2021 21:24:07 +0100
In-Reply-To: <CAOf5uw=Cts+V+amSrTzVyRyFZA=eKSVtRPtXae40-4M0bu6pwg@mail.gmail.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org>
 <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
 <CAJ+vNU1Hy_94TYgs0isNc2pmiH2sOReZJLhphzQFTN2Z50JPrA@mail.gmail.com>
 <CAOf5uwm6+tFS8temhPmSx6nFVTSyk0Ckd9eDEToQNmNaiO2c=A@mail.gmail.com>
 <CAJ+vNU2pQCHqnyNJnz_rhczGRwcU=9XDFG1ix_V=Sc-1oWvhjA@mail.gmail.com>
 <CAOf5uw=Cts+V+amSrTzVyRyFZA=eKSVtRPtXae40-4M0bu6pwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Am Donnerstag, dem 09.12.2021 um 18:09 +0100 schrieb Michael Nazzareno
Trimarchi:
> Hi Tim
> 
> On Thu, Dec 9, 2021 at 5:40 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > 
> > On Thu, Dec 9, 2021 at 12:36 AM Michael Nazzareno Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > > 
> > > Hi Tim
> > > 
> > > On Tue, Oct 5, 2021 at 11:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > 
> > > > On Sun, Jul 25, 2021 at 10:14 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > 
> > > > > Hi Sam,
> > > > > 
> > > > > On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > > > 
> > > > > > Hi Jagan,
> > > > > > 
> > > > > > On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > > > > > > This series supports common bridge support for Samsung MIPI DSIM
> > > > > > > which is used in Exynos and i.MX8MM SoC's.
> > > > > > > 
> > > > > > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > > > > > 
> > > > > > > Right now bridge offers two sets of implementations.
> > > > > > > 
> > > > > > > A. With component_ops and exynos specific code exclusively for
> > > > > > >    exynos dsi drivers and it's legacy bindings.
> > > > > > > 
> > > > > > > B. Without componenet_ops for newly implemented bridges and its
> > > > > > >    users like i.MX8MM.
> > > > > > > 
> > > > > > > The future plan is to fix the implementation A) by dropping
> > > > > > > component_ops and fixing exynos specific code in order to make
> > > > > > > the bridge more mature to use and the same is mentioned in
> > > > > > > drivers TODO.
> > > > > > > 
> > > > > > > Patch 0001 - 0006: Bridge conversion
> > > > > > > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> > > > > > > 
> > > > > > > Tested in Engicam i.Core MX8M Mini SoM.
> > > > > > > 
> > > > > > > Anyone interest, please have a look on this repo
> > > > > > > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> > > > > > > 
> > > > > > > Would appreciate anyone from the exynos team to test it on
> > > > > > > the exynos platform?
> > > > > > > 
> > > > > > > Any inputs?
> > > > > > 
> > > > > > I really like where you are headign with this!
> > > > > > No testing - sorry. But I will try to provide a bit of feedback on the
> > > > > > individual patches.
> > > > > > 
> > > > > > I hope you find a way to move forward with this.
> > > > > 
> > > > > Thanks for the response.
> > > > > 
> > > > > We have found some issues with Bridge conversion on existing exynos
> > > > > drivers. The component based DSI drivers(like exynos) are difficult to
> > > > > attach if it involves kms hotplug. kms hotplug would require drm
> > > > > pointer and that pointer would only available after the bind call
> > > > > finishes. But the bridge attach in bind call will defer till it find
> > > > > the attached bridge.
> > > > > 
> > > > > Right now I'm trying to find the proper way to attach the bridges for
> > > > > component based DSI drivers which involves kms hot-plug.
> > > > > 
> > > > > If you have any ideas on this, please let me know.
> > > > > 
> > > > 
> > > > Jagan,
> > > > 
> > > > How is your progress on this series? Looking at your repo it looks
> > > > like you've rebased on top of 5.13-rc3 in your 070121-imx8mm-dsim
> > > > branch but you've got a lot of things there that are likely not
> > > > related to this series?
> > > 
> > > I have a bit of work on those patches and tested on imx8mn. Basically:
> > > 
> > > - add the dsi timing calculation
> > > - change few difference with samsung bridge
> > > - fix crashes of my dsi panels
> > > - compare with NXP driver the final results
> > > 
> > > I found that I have one problem that gives me some instability. In the
> > > NXP original driver the panel needs to be
> > > enabled in bridge_enable before out the standby. If I understand
> > > correctly, our standby should be done after.
> > > I would like to have some feedback and help and testing on other
> > > boards/devices and some suggestions on how to handle
> > > some of the differences. Another big problem is etnavi that is not stable
> > > 
> > 
> > Michael,
> > 
> > Where can I find your patches?
> > 
> 
> I will push on some tree and share
> 
> > What do you mean by etnaviv not being stable?
> > 
> > I did some limited testing with etnaviv on imx8mm with 5.15 + dsi
> 
> 
> 
> > patches on an Ubuntu focal root filesystem by:
> > apt update
> > apt install gnome-session gnome-terminal
> > ^^^ 2D hardware acceleration appears to be working (dragging opaque
> > windows around)
> > apt install mesa-utils glmark2
> > glxgears
> > ^^^ ~160fps on IMX8MM
> > glmark2
> > ^^^ score of 39 on IMX8MM
> > 
> > I haven't seen any updates from Jagan since Nov 24
> > (https://www.spinics.net/lists/dri-devel/msg324059.html) and am not
> > sure if he's been able to work through drm/exynos issues that have
> > been blocking his progress.
> 
> I plan to push on github
> 
> [17:07:42.315] Sending ready to systemd
> [  214.052085] etnaviv-gpu 38000000.gpu: recover hung GPU!
> [  214.595998] etnaviv-gpu 38000000.gpu: recover hung GPU!
> 
> ** (maynard:386): WARNING **: 17:07:43.874: failed to setup mixer: Success
> [17:07:44.175] Added surface 0xaaab02630440, app_id (null) to pending list
> [17:07:44.176] Added surface 0xaaab026172b0, app_id (null) to pending list
> ** Message: 17:07:44.289: New advertisement app id maynard
> ** Message: 17:07:44.290: New advertisement app id maynard
> [17:07:45.171] (background) position view 0xaaab0261f860, x 0, y 0, on
> output DSI-1
> [17:07:45.171] (panel) geom.width 100, geom.height 480, geom.x 0, geom.y 0
> [17:07:45.171] (panel) edge 2 position view 0xaaab02634510, x 0, y 0
> [17:07:45.172] panel type 2 inited on output DSI-1
> [17:07:45.172] Usable area: 380x480+100,0
> [  216.932080] etnaviv-gpu 38000000.gpu: recover hung GPU!
> [  217.476015] etnaviv-gpu 38000000.gpu: recover hung GPU!
> [  218.020157] etnaviv-gpu 38000000.gpu: recover hung GPU!
> 
> This is my problem on imx8mn

Note that the GPU on the 8MN is from the GC7000 generation, which
genreally has bogus feature registers, as VeriSilicon stopped using
them in favor of a hardware database. To get the GPu working you need
to transcribe the entry for this specific GPU from the downstream GPU
driver into the etanviv HWDB format, to make the kernel and userspace
driver aware of how to drive this GPU.

Regards,
Lucas

