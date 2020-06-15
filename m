Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC581FA9AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31AF6E82D;
	Tue, 16 Jun 2020 07:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956086E042
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:17:36 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2FFBC3C04C1;
 Mon, 15 Jun 2020 16:17:34 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q47JyVb-nhxw; Mon, 15 Jun 2020 16:17:28 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AB53F3C00BA;
 Mon, 15 Jun 2020 16:17:28 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.23) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 16:17:27 +0200
Date: Mon, 15 Jun 2020 16:17:23 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200615141723.GA22692@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
 <20200608094432.GA27063@lxhi-065.adit-jv.com>
 <20200612151209.xdaqimvpq7ysvu2q@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612151209.xdaqimvpq7ysvu2q@uno.localdomain>
X-Originating-IP: [10.72.94.23]
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, hien.dang.eb@renesas.com,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
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

Hi Jacopo,

On Fri, Jun 12, 2020 at 05:12:09PM +0200, Jacopo Mondi wrote:
> On Mon, Jun 08, 2020 at 11:44:32AM +0200, Eugeniu Rosca wrote:
> > FWIW, I seem to hit pre-existing issues in vanilla rcar-du,
> > while unplugging HDMI cable during a cyclic suspend-resume:
> >
> > HW: H3 ES2.0 Salvator-X
> > SW: renesas-drivers-2020-06-02-v5.7
> > .config: renesas_defconfig +CONFIG_PM_DEBUG +CONFIG_PM_ADVANCED_DEBUG
> > Use-case:
> >
> >   --------8<---------
> > $ cat s2ram.sh
> > modprobe i2c-dev
> > echo 9 > /proc/sys/kernel/printk
> > i2cset -f -y 7 0x30 0x20 0x0F
> 
> According to
> https://elinux.org/R-Car/Boards/Salvator-X#Suspend-to-RAM
> this is not needed anymore

Good to know. Thanks for the useful remark.

> > echo 0 > /sys/module/suspend/parameters/pm_test_delay
> > echo core  > /sys/power/pm_test
> > echo deep > /sys/power/mem_sleep
> > echo 1 > /sys/power/pm_debug_messages
> > echo 0 > /sys/power/pm_print_times
> > echo mem > /sys/power/state
> >
> > $ while true; do sh s2ram.sh ; done
> > $ # unplug HDMI cable several times
> 
> I tried unplugging an plugging the cable while the system was
> suspended and after resume but I was not able to reproduce anything.

Your comment sounds like you suspended the system once and resumed it
afterwards, while my description mentions "cyclic" :), meaning:

$ while true; do sh s2ram.sh; done
$ # connect-disconnect the hdmi display a couple of times
$ # NOTE: to avoid this manual step, I am thinking of a USB-controlled
    HDMI switcher long-term

> 
> Could you provide more precise instructions on how to reproduce this ?
> I.e. when to disconnect the cable to trigger the below error.

See above :)

BTW, using renesas-drivers-2020-06-02-v5.7 as base and performing the
use-case just described, I got today (with minimal effort):

[  459.321733] Enabling non-boot CPUs ...
[  459.331132] Detected PIPT I-cache on CPU1
[  459.331189] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
[  459.332312] CPU1 is up
[  459.345635] Detected PIPT I-cache on CPU2
[  459.345671] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
[  459.346624] CPU2 is up
[  459.359912] Detected PIPT I-cache on CPU3
[  459.359942] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
[  459.360918] CPU3 is up
[  459.374183] Detected VIPT I-cache on CPU4
[  459.374252] CPU4: Booted secondary processor 0x0000000100 [0x410fd034]
[  459.375875] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 1199999 KHz
[  459.394204] cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 1200000 KHz
[  459.403879] CPU4 is up
[  459.406469] Detected VIPT I-cache on CPU5
[  459.406519] CPU5: Booted secondary processor 0x0000000101 [0x410fd034]
[  459.408520] CPU5 is up
[  459.421762] Detected VIPT I-cache on CPU6
[  459.421810] CPU6: Booted secondary processor 0x0000000102 [0x410fd034]
[  459.423831] CPU6 is up
[  459.437114] Detected VIPT I-cache on CPU7
[  459.437164] CPU7: Booted secondary processor 0x0000000103 [0x410fd034]
[  459.439258] CPU7 is up
[  459.456217] PM: noirq resume of devices complete after 3.878 msecs
[  459.471529] PM: early resume of devices complete after 8.590 msecs
[  469.726906] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:76:crtc-3] flip_done timed out
[  479.966889] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:78:VGA-1] flip_done timed out
[  490.206887] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:34:plane-1] flip_done timed out
[  490.282873] rcar-du feb00000.display: page flip timeout
[  490.288431] ------------[ cut here ]------------
[  490.293092] WARNING: CPU: 0 PID: 123 at drivers/gpu/drm/rcar-du/rcar_du_crtc.c:787 rcar_du_crtc_atomic_begin+0x64/0x70
[  490.303854] Modules linked in:
[  490.306933] CPU: 0 PID: 123 Comm: irq/192-fead000 Not tainted 5.7.0-arm64-renesas-00012-gbc5411732961 #131
[  490.316647] Hardware name: Renesas Salvator-X board based on r8a77951 (DT)
[  490.323568] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
[  490.329176] pc : rcar_du_crtc_atomic_begin+0x64/0x70
[  490.334174] lr : drm_atomic_helper_commit_planes+0x70/0x220
[  490.339781] sp : ffff80001258b960
[  490.343115] x29: ffff80001258b960 x28: 0000000000000038 
[  490.348463] x27: ffff0006f676a800 x26: ffff8000111c3718 
[  490.353811] x25: ffff0006f5e574c0 x24: ffff0006f6728000 
[  490.359157] x23: 0000000000000038 x22: 0000000000000000 
[  490.364503] x21: 0000000000000001 x20: 0000000000000002 
[  490.369849] x19: ffff0006f5e58e08 x18: ffffffffffffffff 
[  490.375195] x17: 0000000000000000 x16: 0000000000000000 
[  490.380541] x15: ffff8000111c09c8 x14: 0000000000000000 
[  490.385887] x13: 0000000000000000 x12: 0000000000000000 
[  490.391233] x11: 0000000000000000 x10: 0000000000000000 
[  490.396579] x9 : 0000000000000000 x8 : 0000000000000000 
[  490.401924] x7 : 0000000000000000 x6 : ffff0006f5e5aab8 
[  490.407270] x5 : 0000000000003a8b x4 : ffff0006f3154438 
[  490.412616] x3 : ffff0006f6728000 x2 : ffff800010649338 
[  490.417962] x1 : ffff0006f228dc00 x0 : 0000000000000000 
[  490.423308] Call trace:
[  490.425771]  rcar_du_crtc_atomic_begin+0x64/0x70
[  490.430418]  drm_atomic_helper_commit_planes+0x70/0x220
[  490.435678]  rcar_du_atomic_commit_tail+0xa0/0xd8
[  490.440412]  commit_tail+0x9c/0x160
[  490.443924]  drm_atomic_helper_commit+0x178/0x190
[  490.448661]  drm_atomic_commit+0x48/0x58
[  490.452611]  drm_client_modeset_commit_atomic+0x18c/0x280
[  490.458045]  drm_client_modeset_commit_locked+0x50/0x1e0
[  490.463390]  drm_client_modeset_commit+0x2c/0x50
[  490.468040]  drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0xe8
[  490.474085]  drm_fb_helper_set_par+0x2c/0x60
[  490.478383]  drm_fb_helper_hotplug_event.part.20+0xc0/0xd0
[  490.483904]  drm_fbdev_client_hotplug+0xc8/0x1d0
[  490.488551]  drm_client_dev_hotplug+0x78/0xc0
[  490.492939]  drm_kms_helper_hotplug_event+0x30/0x40
[  490.497848]  drm_helper_hpd_irq_event+0x12c/0x160
[  490.502583]  dw_hdmi_irq+0x118/0x1e0
[  490.506185]  irq_thread_fn+0x28/0x88
[  490.509783]  irq_thread+0x13c/0x1d8
[  490.513298]  kthread+0x150/0x158
[  490.516549]  ret_from_fork+0x10/0x18
[  490.520147] irq event stamp: 12676
[  490.523576] hardirqs last  enabled at (12675): [<ffff800010a725cc>] _raw_spin_unlock_irqrestore+0x7c/0x90
[  490.533206] hardirqs last disabled at (12676): [<ffff800010024918>] do_debug_exception+0x1a0/0x234
[  490.542223] softirqs last  enabled at (12634): [<ffff800010001598>] efi_header_end+0x598/0x5ac
[  490.550892] softirqs last disabled at (12625): [<ffff80001007cf9c>] irq_exit+0x13c/0x148
[  490.559032] ---[ end trace 5cdf3cb912c7ed2d ]---
[  490.563942] vsp1 fea28000.vsp: vsp1_du_pipeline_setup_inputs: failed to setup BRU source
[  490.572213] vsp1 fea28000.vsp: vsp1_du_pipeline_setup_inputs: failed to setup BRU source
[  490.580410] ------------[ cut here ]------------
[  490.585087] refcount_t: addition on 0; use-after-free.
[  490.590316] WARNING: CPU: 0 PID: 123 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x140
[  490.598807] Modules linked in:
[  490.601883] CPU: 0 PID: 123 Comm: irq/192-fead000 Tainted: G        W         5.7.0-arm64-renesas-00012-gbc5411732961 #131
[  490.612994] Hardware name: Renesas Salvator-X board based on r8a77951 (DT)
[  490.619912] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
[  490.625521] pc : refcount_warn_saturate+0x120/0x140
[  490.630430] lr : refcount_warn_saturate+0x120/0x140
[  490.635337] sp : ffff80001258b960
[  490.638671] x29: ffff80001258b960 x28: 0000000000000038 
[  490.644018] x27: ffff0006f676a800 x26: ffff8000111c3718 
[  490.649364] x25: ffff0006f228c200 x24: ffff0006f228c400 
[  490.654711] x23: 0000000000000038 x22: 0000000000000001 
[  490.660057] x21: ffff0006f3154000 x20: 0000000000000000 
[  490.665403] x19: ffff0006f228ec00 x18: ffffffffffffffff 
[  490.670748] x17: 0000000000000000 x16: 000000007a11fc18 
[  490.676095] x15: ffff8000111c09c8 x14: ffff80009258b677 
[  490.681441] x13: ffff80001258b685 x12: ffff8000111e2000 
[  490.686786] x11: 0000000005f5e0ff x10: 00000000000000b8 
[  490.692132] x9 : 0000000000000000 x8 : 0000000000000000 
[  490.697478] x7 : 0000000000000001 x6 : 0000000000000000 
[  490.702824] x5 : 0000000000000000 x4 : 0000000000000000 
[  490.708170] x3 : 0000000000000000 x2 : ffff0006fa12def8 
[  490.713516] x1 : f874420ef852bd00 x0 : 0000000000000000 
[  490.718862] Call trace:
[  490.721325]  refcount_warn_saturate+0x120/0x140
[  490.725884]  drm_atomic_helper_commit_hw_done+0x140/0x150
[  490.731318]  rcar_du_atomic_commit_tail+0xb4/0xd8
[  490.736051]  commit_tail+0x9c/0x160
[  490.739561]  drm_atomic_helper_commit+0x178/0x190
[  490.744296]  drm_atomic_commit+0x48/0x58
[  490.748244]  drm_client_modeset_commit_atomic+0x18c/0x280
[  490.753678]  drm_client_modeset_commit_locked+0x50/0x1e0
[  490.759023]  drm_client_modeset_commit+0x2c/0x50
[  490.763671]  drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0xe8
[  490.769717]  drm_fb_helper_set_par+0x2c/0x60
[  490.774014]  drm_fb_helper_hotplug_event.part.20+0xc0/0xd0
[  490.779535]  drm_fbdev_client_hotplug+0xc8/0x1d0
[  490.784182]  drm_client_dev_hotplug+0x78/0xc0
[  490.788567]  drm_kms_helper_hotplug_event+0x30/0x40
[  490.793476]  drm_helper_hpd_irq_event+0x12c/0x160
[  490.798210]  dw_hdmi_irq+0x118/0x1e0
[  490.801809]  irq_thread_fn+0x28/0x88
[  490.805408]  irq_thread+0x13c/0x1d8
[  490.808919]  kthread+0x150/0x158
[  490.812167]  ret_from_fork+0x10/0x18
[  490.815764] irq event stamp: 12796
[  490.819189] hardirqs last  enabled at (12795): [<ffff8000100eecf0>] console_unlock+0x418/0x638
[  490.827855] hardirqs last disabled at (12796): [<ffff800010024918>] do_debug_exception+0x1a0/0x234
[  490.836871] softirqs last  enabled at (12792): [<ffff800010001598>] efi_header_end+0x598/0x5ac
[  490.845538] softirqs last disabled at (12785): [<ffff80001007cf9c>] irq_exit+0x13c/0x148
[  490.853678] ---[ end trace 5cdf3cb912c7ed2e ]---
[  490.858414] ------------[ cut here ]------------
[  490.863065] WARNING: CPU: 0 PID: 123 at drivers/gpu/drm/drm_atomic_helper.c:2312 drm_atomic_helper_commit_hw_done+0x130/0x150
[  490.874438] Modules linked in:
[  490.877513] CPU: 0 PID: 123 Comm: irq/192-fead000 Tainted: G        W         5.7.0-arm64-renesas-00012-gbc5411732961 #131
[  490.888624] Hardware name: Renesas Salvator-X board based on r8a77951 (DT)
[  490.895542] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[  490.901150] pc : drm_atomic_helper_commit_hw_done+0x130/0x150
[  490.906932] lr : drm_atomic_helper_commit_hw_done+0x118/0x150
[  490.912713] sp : ffff80001258b970
[  490.916047] x29: ffff80001258b970 x28: 0000000000000038 
[  490.921393] x27: ffff0006f676a800 x26: ffff8000111c3718 
[  490.926739] x25: ffff0006f228dc00 x24: ffff0006f228f000 
[  490.932085] x23: 0000000000000038 x22: 0000000000000001 
[  490.937431] x21: ffff0006f3154000 x20: 0000000000000001 
[  490.942777] x19: ffff0006f228cc00 x18: ffffffffffffffff 
[  490.948122] x17: 0000000000000000 x16: 000000007a11fc18 
[  490.953468] x15: ffff8000111c09c8 x14: ffff80009258b677 
[  490.958814] x13: ffff80001258b685 x12: ffff8000111e2000 
[  490.964160] x11: 0000000005f5e0ff x10: 00000000000000b8 
[  490.969506] x9 : 0000000000000080 x8 : 0000000000000000 
[  490.974851] x7 : 0000000000000001 x6 : 0000000000000000 
[  490.980196] x5 : 0000000000000000 x4 : 0000000000006d40 
[  490.985542] x3 : 0000000000000000 x2 : 0000000000000002 
[  490.990887] x1 : 0000000000000001 x0 : ffff0006f5a76580 
[  490.996232] Call trace:
[  490.998694]  drm_atomic_helper_commit_hw_done+0x130/0x150
[  491.004127]  rcar_du_atomic_commit_tail+0xb4/0xd8
[  491.008861]  commit_tail+0x9c/0x160
[  491.012371]  drm_atomic_helper_commit+0x178/0x190
[  491.017105]  drm_atomic_commit+0x48/0x58
[  491.021053]  drm_client_modeset_commit_atomic+0x18c/0x280
[  491.026486]  drm_client_modeset_commit_locked+0x50/0x1e0
[  491.031832]  drm_client_modeset_commit+0x2c/0x50
[  491.036480]  drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0xe8
[  491.042524]  drm_fb_helper_set_par+0x2c/0x60
[  491.046822]  drm_fb_helper_hotplug_event.part.20+0xc0/0xd0
[  491.052343]  drm_fbdev_client_hotplug+0xc8/0x1d0
[  491.056989]  drm_client_dev_hotplug+0x78/0xc0
[  491.061374]  drm_kms_helper_hotplug_event+0x30/0x40
[  491.066283]  drm_helper_hpd_irq_event+0x12c/0x160
[  491.071017]  dw_hdmi_irq+0x118/0x1e0
[  491.074615]  irq_thread_fn+0x28/0x88
[  491.078214]  irq_thread+0x13c/0x1d8
[  491.081724]  kthread+0x150/0x158
[  491.084973]  ret_from_fork+0x10/0x18
[  491.088569] irq event stamp: 12824
[  491.091996] hardirqs last  enabled at (12823): [<ffff800010246bd0>] kfree+0x308/0x430
[  491.099877] hardirqs last disabled at (12824): [<ffff800010024918>] do_debug_exception+0x1a0/0x234
[  491.108892] softirqs last  enabled at (12818): [<ffff800010001598>] efi_header_end+0x598/0x5ac
[  491.117558] softirqs last disabled at (12799): [<ffff80001007cf9c>] irq_exit+0x13c/0x148
[  491.125699] ---[ end trace 5cdf3cb912c7ed2f ]---
[  491.130416] ------------[ cut here ]------------
[  491.135067] WARNING: CPU: 0 PID: 123 at drivers/gpu/drm/drm_atomic_helper.c:2312 drm_atomic_helper_commit_hw_done+0x130/0x150
[  491.146440] Modules linked in:
[  491.149515] CPU: 0 PID: 123 Comm: irq/192-fead000 Tainted: G        W         5.7.0-arm64-renesas-00012-gbc5411732961 #131
[  491.160625] Hardware name: Renesas Salvator-X board based on r8a77951 (DT)
[  491.167543] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[  491.173150] pc : drm_atomic_helper_commit_hw_done+0x130/0x150
[  491.178932] lr : drm_atomic_helper_commit_hw_done+0xc8/0x150
[  491.184625] sp : ffff80001258b970
[  491.187960] x29: ffff80001258b970 x28: 0000000000000038 
[  491.193306] x27: ffff0006f676a800 x26: ffff8000111c3718 
[  491.198651] x25: ffff0006f228d000 x24: ffff0006f228f600 
[  491.203998] x23: 0000000000000038 x22: 0000000000000001 
[  491.209343] x21: ffff0006f3154000 x20: 0000000000000003 
[  491.214689] x19: ffff0006f228fa00 x18: ffffffffffffffff 
[  491.220035] x17: 0000000000000000 x16: 000000007a11fc18 
[  491.225381] x15: ffff8000111c09c8 x14: ffff80009258b677 
[  491.230727] x13: ffff80001258b685 x12: ffff8000111e2000 
[  491.236073] x11: 0000000005f5e0ff x10: 00000000000000b8 
[  491.241418] x9 : 0000000000000080 x8 : 0000000000000000 
[  491.246764] x7 : 0000000000000001 x6 : 0000000000000000 
[  491.252109] x5 : 0000000000000001 x4 : 0000000000000000 
[  491.257455] x3 : 0000000000000000 x2 : 0000000000000002 
[  491.262801] x1 : 0000000000000001 x0 : ffff0006f5a76c80 
[  491.268146] Call trace:
[  491.270607]  drm_atomic_helper_commit_hw_done+0x130/0x150
[  491.276040]  rcar_du_atomic_commit_tail+0xb4/0xd8
[  491.280774]  commit_tail+0x9c/0x160
[  491.284284]  drm_atomic_helper_commit+0x178/0x190
[  491.289018]  drm_atomic_commit+0x48/0x58
[  491.292966]  drm_client_modeset_commit_atomic+0x18c/0x280
[  491.298399]  drm_client_modeset_commit_locked+0x50/0x1e0
[  491.303745]  drm_client_modeset_commit+0x2c/0x50
[  491.308392]  drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0xe8
[  491.314437]  drm_fb_helper_set_par+0x2c/0x60
[  491.318734]  drm_fb_helper_hotplug_event.part.20+0xc0/0xd0
[  491.324254]  drm_fbdev_client_hotplug+0xc8/0x1d0
[  491.328901]  drm_client_dev_hotplug+0x78/0xc0
[  491.333286]  drm_kms_helper_hotplug_event+0x30/0x40
[  491.338194]  drm_helper_hpd_irq_event+0x12c/0x160
[  491.342927]  dw_hdmi_irq+0x118/0x1e0
[  491.346526]  irq_thread_fn+0x28/0x88
[  491.350124]  irq_thread+0x13c/0x1d8
[  491.353635]  kthread+0x150/0x158
[  491.356884]  ret_from_fork+0x10/0x18
[  491.360480] irq event stamp: 12850
[  491.363904] hardirqs last  enabled at (12849): [<ffff800010a725cc>] _raw_spin_unlock_irqrestore+0x7c/0x90
[  491.373532] hardirqs last disabled at (12850): [<ffff800010024918>] do_debug_exception+0x1a0/0x234
[  491.382548] softirqs last  enabled at (12842): [<ffff800010001598>] efi_header_end+0x598/0x5ac
[  491.391213] softirqs last disabled at (12827): [<ffff80001007cf9c>] irq_exit+0x13c/0x148
[  491.399354] ---[ end trace 5cdf3cb912c7ed30 ]---
[  491.404400] sched: RT throttling activated
[  501.470891] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  511.710886] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:76:crtc-3] flip_done timed out
[  511.720062] ------------[ cut here ]------------
[  511.724740] refcount_t: underflow; use-after-free.
[  511.729624] WARNING: CPU: 0 PID: 123 at lib/refcount.c:28 refcount_warn_saturate+0xcc/0x140
[  511.738027] Modules linked in:
[  511.741102] CPU: 0 PID: 123 Comm: irq/192-fead000 Tainted: G        W         5.7.0-arm64-renesas-00012-gbc5411732961 #131
[  511.752214] Hardware name: Renesas Salvator-X board based on r8a77951 (DT)
[  511.759132] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
[  511.764740] pc : refcount_warn_saturate+0xcc/0x140
[  511.769561] lr : refcount_warn_saturate+0xcc/0x140
[  511.774381] sp : ffff80001258b9a0
[  511.777715] x29: ffff80001258b9a0 x28: 0000000000000038 
[  511.783062] x27: ffff0006f676a800 x26: ffff8000111c3718 
[  511.788408] x25: ffff0006f5e574c0 x24: ffff0006f6728440 
[  511.793755] x23: 0000000000000038 x22: 0000000000000001 
[  511.799101] x21: 0000000000000000 x20: 0000000000000000 
[  511.804447] x19: ffff0006f228c200 x18: ffffffffffffffff 
[  511.809793] x17: 0000000000000000 x16: 000000007a11fc18 
[  511.815139] x15: ffff8000111c09c8 x14: ffff80009258b6b7 
[  511.820485] x13: ffff80001258b6c5 x12: ffff8000111e2000 
[  511.825830] x11: 0000000005f5e0ff x10: 00000000000000b8 
[  511.831176] x9 : 0000000000000000 x8 : 0000000000000000 
[  511.836522] x7 : 0000000000000001 x6 : 0000000000000000 
[  511.841867] x5 : 0000000000000000 x4 : 0000000000000000 
[  511.847212] x3 : 0000000000000000 x2 : ffff0006fa12def8 
[  511.852558] x1 : f874420ef852bd00 x0 : 0000000000000000 
[  511.857904] Call trace:
[  511.860367]  refcount_warn_saturate+0xcc/0x140
[  511.864841]  __drm_atomic_helper_crtc_destroy_state+0xdc/0x100
[  511.870711]  rcar_du_crtc_atomic_destroy_state+0x18/0x30
[  511.876057]  drm_atomic_state_default_clear+0x120/0x2f0
[  511.881316]  drm_atomic_state_clear+0x28/0x30
[  511.885700]  __drm_atomic_state_free+0x18/0x60
[  511.890173]  drm_client_modeset_commit_atomic+0x238/0x280
[  511.895606]  drm_client_modeset_commit_locked+0x50/0x1e0
[  511.900952]  drm_client_modeset_commit+0x2c/0x50
[  511.905599]  drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0xe8
[  511.911643]  drm_fb_helper_set_par+0x2c/0x60
[  511.915941]  drm_fb_helper_hotplug_event.part.20+0xc0/0xd0
[  511.921462]  drm_fbdev_client_hotplug+0xc8/0x1d0
[  511.926109]  drm_client_dev_hotplug+0x78/0xc0
[  511.930494]  drm_kms_helper_hotplug_event+0x30/0x40
[  511.935403]  drm_helper_hpd_irq_event+0x12c/0x160
[  511.940136]  dw_hdmi_irq+0x118/0x1e0
[  511.943735]  irq_thread_fn+0x28/0x88
[  511.947333]  irq_thread+0x13c/0x1d8
[  511.950845]  kthread+0x150/0x158
[  511.954094]  ret_from_fork+0x10/0x18
[  511.957690] irq event stamp: 13016
[  511.961114] hardirqs last  enabled at (13015): [<ffff8000100eecf0>] console_unlock+0x418/0x638
[  511.969781] hardirqs last disabled at (13016): [<ffff800010024918>] do_debug_exception+0x1a0/0x234
[  511.978797] softirqs last  enabled at (13012): [<ffff800010001598>] efi_header_end+0x598/0x5ac
[  511.987464] softirqs last disabled at (13005): [<ffff80001007cf9c>] irq_exit+0x13c/0x148
[  511.995604] ---[ end trace 5cdf3cb912c7ed31 ]---
[  512.000549] vsp1 fea28000.vsp: vsp1_du_pipeline_setup_inputs: failed to setup BRU source
[  522.206891] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  532.446880] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  542.686878] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:80:HDMI-A-1] flip_done timed out
[  552.926877] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:45:plane-5] flip_done timed out
[  552.926932] vsp1 fea28000.vsp: vsp1_du_pipeline_setup_inputs: failed to setup BRU source
[  563.166888] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:74:crtc-1] flip_done timed out
[  563.234105] PM: resume of devices complete after 103756.305 msecs
[  563.247877] PM: Finishing wakeup.

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
