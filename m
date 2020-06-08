Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF31F34E8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340A2892C1;
	Tue,  9 Jun 2020 07:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535926E179
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 09:44:45 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id F11B43C057C;
 Mon,  8 Jun 2020 11:44:42 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxN9Ro1gAF_T; Mon,  8 Jun 2020 11:44:37 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id DDF413C00BB;
 Mon,  8 Jun 2020 11:44:37 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.48) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 8 Jun 2020
 11:44:37 +0200
Date: Mon, 8 Jun 2020 11:44:32 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
 <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200608094432.GA27063@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607024158.GD7339@pendragon.ideasonboard.com>
X-Originating-IP: [10.72.94.48]
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, mrodin@de.adit-jv.com,
 dri-devel@lists.freedesktop.org, hien.dang.eb@renesas.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 gotthard.voellmeke@renesas.com, koji.matsuoka.xm@renesas.com,
 horms@verge.net.au, seanpaul@chromium.org, michael.dege@renesas.com,
 michael.klein@renesas.com, Harsha.ManjulaMallikarjun@in.bosch.com,
 ezequiel@collabora.com, efriedrich@de.adit-jv.com,
 ChaitanyaKumar.Borah@in.bosch.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, uli+renesas@fpond.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Many thanks for your comments and involvement.

On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> On Fri, Jun 05, 2020 at 03:53:15PM +0200, Jacopo Mondi wrote:
> > On Fri, Jun 05, 2020 at 03:41:24PM +0200, Eugeniu Rosca wrote:
> > > On Fri, Jun 05, 2020 at 03:29:00PM +0200, Jacopo Mondi wrote:
> > >> On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> > >>> Could you kindly share the cross compilation steps for your kmsxx fork?
> > >>
> > >> I usually build it on the target :)
> > >
> > > Interesting approach. With ARM getting more and more potent, why not? :)
> > 
> > For 'small' utilities like kmsxx it's doable
> > 
> > >>> Just out of curiosity, have you ever tried to pull the display's HDMI
> > >>> cable while reading from CM2_LUT_TBL?
> > >>
> > >> Ahem, not really :) Did I get you right, you mean disconnecting the
> > >> HDMI cable from the board ?
> > >
> > > Right.
> > 
> > So, no, I have not tried. Do you see any intersting failure with the
> > mainline version ?
> 
> Jacopo, would you be able to give this a try ?

FWIW, I seem to hit pre-existing issues in vanilla rcar-du,
while unplugging HDMI cable during a cyclic suspend-resume:

HW: H3 ES2.0 Salvator-X
SW: renesas-drivers-2020-06-02-v5.7
.config: renesas_defconfig +CONFIG_PM_DEBUG +CONFIG_PM_ADVANCED_DEBUG
Use-case:

  --------8<---------
$ cat s2ram.sh
modprobe i2c-dev
echo 9 > /proc/sys/kernel/printk
i2cset -f -y 7 0x30 0x20 0x0F
echo 0 > /sys/module/suspend/parameters/pm_test_delay
echo core  > /sys/power/pm_test
echo deep > /sys/power/mem_sleep
echo 1 > /sys/power/pm_debug_messages
echo 0 > /sys/power/pm_print_times
echo mem > /sys/power/state

$ while true; do sh s2ram.sh ; done
$ # unplug HDMI cable several times

[   55.568051] PM: noirq resume of devices complete after 3.862 msecs
[   55.583253] PM: early resume of devices complete after 8.496 msecs
[   65.757023] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[   75.996123] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[   86.236112] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[   96.476111] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:80:HDMI-A-1] flip_done timed out
[  106.716109] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:45:plane-5] flip_done timed out
[  116.956111] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  127.196112] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  137.436116] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:80:HDMI-A-1] flip_done timed out
[  147.676111] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:45:plane-5] flip_done timed out
[  157.916110] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
  --------8<---------

This looks to be unrelated to the CMM lockup I initially reported.

JYI, graphics pipelines in production R-Car3 targets are significantly
more complex (involving binding/unbinding serializer ICs at runtime
during non-trivial shutdown/suspend/resume sequences), as opposed
to the relatively straightforward VGA/HDMI outputs present on the
reference targets. So, my hope is that Renesas community can take
HDMI hot plugging seriously and make it a regular test-case during
rcar-du patch review, since this is a precondition for the R-Car3
platform and products to succeed as a whole.

BTW, if you happen to know an affordable programmable HDMI switcher
which can do the hot-plugging job in an automated test environment,
please let me know.

> 
> > >>> At least with the out-of-tree CMM implementation [*], this sends the
> > >>> R-Car3 reference targets into an unrecoverable freeze, with no lockup
> > >>> reported by the kernel (i.e. looks like an serious HW issue).
> > >>>
> > >>>> CMM functionalities are retained between suspend/resume cycles (tested with
> > >>>> suspend-to-idle) without requiring a re-programming of the LUT tables.
> > >>>
> > >>> Hmm. Is this backed up by any statement in the HW User's manual?
> > >>> This comes in contrast with the original Renesas CMM implementation [**]
> > >>> which does make use of suspend (where the freeze actually happens).
> > >>>
> > >>> Can we infer, based on your statement, that we could also get rid of
> > >>> the suspend callback in [**]?
> > >>
> > >> As Geert (thanks) explained what I've tested with is suspend-to-idle,
> > >> which retains the state of the LUT tables (and I assume other
> > >> not-yet-implemented CMM features, like CLU). I recall the out-of-tree
> > >> driver has suspend/resume routines but I never really tested that.
> > >
> > > I see. JFYI, there is a flaw in the suspend handling in the out-of-tree
> > > CMM patch [*], which renders the SoC unresponsive on HDMI hotplug. The
> > > fix is currently under review. Hopefully it will make its way to [*]
> > > in the nearest future. Just to keep in mind for the moment when CMM
> > > s2ram will become a mainline feature.
> > 
> > Thanks, let's keep this in mind. Next week I'll run a few tests again
> > with s2ram and will get back to you.
> 
> Note that the CMM driver is controlled by the DU driver. As the DU
> driver will reenable the display during resume, it will call
> rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> should thus be no need for manual suspend/resume handling in the CMM as
> far as I can tell, but we need to ensure that the CMM is suspended
> before and resumed after the DU. I believe this could be implemented
> using device links.

Does this apply to vanilla rcar-du only (where CMM support differs
from [*]) or would also be relevant for rcar.9.6 kernel?

> 
> > >>> [*] https://github.com/renesas-rcar/du_cmm
> > >>> [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
