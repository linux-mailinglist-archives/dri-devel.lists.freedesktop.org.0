Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0D2A8709
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3616E177;
	Thu,  5 Nov 2020 19:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB166E177;
 Thu,  5 Nov 2020 19:24:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v5so2712777wmh.1;
 Thu, 05 Nov 2020 11:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c84j3FPt8y1UjleN+0uFFpolPY6RIuJxFH2eYBSSQwM=;
 b=r42bEGOeIz08DFt7u/ocu6oCFubXX1RmwgYMRnTBi0HVChg14xbAs+3qnBNHUNxHn1
 Fy9Bykw9VDs96zeTESor/LkcYogD5dX4+xwldrVgP26jPaXIdcmPVIqPUzul5We3TtfY
 rB8ncaJpSdm+aQKBMbw7GmWuNMVnYxrYIAOKFDrAUXhOuBZXggtmCYY+JueeHhUb7BGh
 t12SX7+IS041UB4051lhaZP7zj4sWW8KqZizZKJUSoLnG8rIfnXdpDMXVHMxBtwRhrJ+
 ce+sX2ZDlZsrIhs1SHm5O55Vo8DtkWqfWJrZMzHOhFUcA0l1jH5vQUWuIg6hs8wMk9Mf
 kwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c84j3FPt8y1UjleN+0uFFpolPY6RIuJxFH2eYBSSQwM=;
 b=Mo1gppmg2gOjGhE/15PyIn2XefIOvWNqiL0OCMswXgCDlnlkTpIwx9OFl5W+f26yU+
 hsErZA6rC5bRB3L8rxIDo8mE11++a+o2+b8qA2DHaGxZl3+7iJtEHwXTDwxKEELz/r7r
 7s/3oXoWQo0kEAtmh2xHvr3x/Xl9Gag0nkH8EZoosY5KiAFfUpyEyQzS/ymbBUTY484a
 cRXYSKYnYr0vcToO76hHD0bi2aHD9D9lbQR900VewZTo4M7aGTSc0qgAkjYlHX282css
 zGxKo9BJVlpn1CG9OCYNAkZWl/NlUl6fYaPIGtVY20jBBdBFo162IfEsFhoaUoCG9Dry
 P3/Q==
X-Gm-Message-State: AOAM533LVlM9pnjF3G9ex87ys4L8QDD4NEdIUeT6U5wl2O0EmZRfCpQb
 6tz83NeX6nfdCoyHOqlY9VFGDsFGI2C4tlo0m04=
X-Google-Smtp-Source: ABdhPJw4oMJwj2QNFJO5EVOC3Lp835RiEiDpQE7Hgn3mJaQ9tj4G+Ynr9KF0r6RHUs+Ms1UM+ZLQudg8QvBqgfoGtcQ=
X-Received: by 2002:a7b:cc05:: with SMTP id f5mr4304183wmh.123.1604604296642; 
 Thu, 05 Nov 2020 11:24:56 -0800 (PST)
MIME-Version: 1.0
References: <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
In-Reply-To: <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Nov 2020 11:24:44 -0800
Message-ID: <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 7:04 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 03-11-20, 08:50, Rob Clark wrote:
> > sorry, it didn't apply cleanly (which I guess is due to some other
> > dependencies that need to be picked back to v5.4 product kernel), and
> > due to some other things I'm in middle of debugging I didn't have time
> > yet to switch to v5.10-rc or look at what else needs to
> > cherry-picked..
> >
> > If you could, pushing a branch with this patch somewhere would be a
> > bit easier to work with (ie. fetch && cherry-pick is easier to deal
> > with than picking things from list)
>
> It has been in linux-next for a few days. Here is the HEAD to pick
> from. There are few patches there since rc1.
>
> commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")
>

sorry for the delay, with that cherry-picked, I'm getting a whole lot of:

[   10.191497] WARNING: CPU: 7 PID: 52 at drivers/opp/of.c:115
_find_table_of_opp_np+0x8c/0x94
[   10.191502] Modules linked in:
[   10.191517] CPU: 7 PID: 52 Comm: kworker/7:1 Tainted: G        W
     5.10.0-rc2+ #2
[   10.191522] Hardware name: Google Lazor (rev1+) with LTE (DT)
[   10.191537] Workqueue: events deferred_probe_work_func
[   10.191551] pstate: 60c00009 (nZCv daif +PAN +UAO -TCO BTYPE=--)
[   10.202819] mmc0: CQHCI version 5.10
[   10.206038] pc : _find_table_of_opp_np+0x8c/0x94
[   10.206045] lr : _find_table_of_opp_np+0x34/0x94
[   10.206050] sp : ffffffc010373810
[   10.206054] x29: ffffffc010373810 x28: ffffff94c5a3d170
[   10.206070] x27: ffffff94c5a3d168
[   10.249098] mmc0: SDHCI controller on 7c4000.sdhci [7c4000.sdhci]
using ADMA 64-bit
[   10.251366] x26: ffffff94c580c000
[   10.251374] x25: 0000000000000001 x24: ffffff963f02c750
[   10.251385] x23: 0000000000000000 x22: ffffff94c5aabc80
[   10.251397] x21: ffffff963f021c78 x20: ffffff94c5a75800
[   10.256963] sdhci_msm 7c4000.sdhci: mmc0: CQE init: success
[   10.260376]
[   10.260380] x19: ffffff963f02c750 x18: 0000000000000004
[   10.260392] x17: 000000000000002c x16: ffffffe2468e1e78
[   10.260404] x15: ffffffe246df3eb8 x14: ffffffff52f45308
[   10.311816] x13: 0000000000000000 x12: ffffffe24541aef0
[   10.317298] x11: ffffffe246df3eb8 x10: fffffffefe60e678
[   10.322776] x9 : 0000000000000000 x8 : ffffffb3f89a7000
[   10.328258] x7 : ffffffe245c5d9d0 x6 : 0000000000000000
[   10.333730] x5 : 0000000000000080 x4 : 0000000000000001
[   10.339206] x3 : 0000000000000000 x2 : 0000000000000006
[   10.344684] x1 : ffffffe24684aa88 x0 : 0000000000000000
[   10.350158] Call trace:
[   10.352695]  _find_table_of_opp_np+0x8c/0x94
[   10.353507] mmc0: Command Queue Engine enabled
[   10.357095]  _of_init_opp_table+0x15c/0x1e4
[   10.357103]  _opp_get_opp_table+0x168/0x280
[   10.357110]  dev_pm_opp_set_clkname+0x28/0xcc
[   10.357119]  dpu_bind+0x50/0x1a4
[   10.357128]  component_bind_all+0xf4/0x20c
[   10.357138]  msm_drm_init+0x180/0x588
[   10.361815] mmc0: new HS400 Enhanced strobe MMC card at address 0001
[   10.366050]  msm_drm_bind+0x1c/0x24
[   10.366057]  try_to_bring_up_master+0x160/0x1a8
[   10.366065]  component_master_add_with_match+0xc4/0x108
[   10.366072]  msm_pdev_probe+0x214/0x2a4
[   10.366081]  platform_drv_probe+0x94/0xb4
[   10.374415] mmcblk0: mmc0:0001 DA4064 58.2 GiB
[   10.374871]  really_probe+0x138/0x348
[   10.374881]  driver_probe_device+0x80/0xb8
[   10.379483] mmcblk0boot0: mmc0:0001 DA4064 partition 1 4.00 MiB
[   10.382446]  __device_attach_driver+0x90/0xa8
[   10.382453]  bus_for_each_drv+0x84/0xcc
[   10.382459]  __device_attach+0xc0/0x148
[   10.382466]  device_initial_probe+0x18/0x20
[   10.382473]  bus_probe_device+0x38/0x98
[   10.382483]  deferred_probe_work_func+0x7c/0xb8
[   10.387402] mmcblk0boot1: mmc0:0001 DA4064 partition 2 4.00 MiB
[   10.392780]  process_one_work+0x314/0x60c
[   10.392786]  worker_thread+0x238/0x3e8
[   10.392793]  kthread+0x148/0x158
[   10.392800]  ret_from_fork+0x10/0x18
[   10.392809] CPU: 7 PID: 52 Comm: kworker/7:1 Tainted: G        W
     5.10.0-rc2+ #2
[   10.397683] mmcblk0rpmb: mmc0:0001 DA4064 partition 3 16.0 MiB,
chardev (241:0)
[   10.401051] Hardware name: Google Lazor (rev1+) with LTE (DT)
[   10.401062] Workqueue: events deferred_probe_work_func
[   10.401069] Call trace:
[   10.401077]  dump_backtrace+0x0/0x1b4
[   10.401087]  show_stack+0x1c/0x24
[   10.427111]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[   10.427156]  dump_stack+0xdc/0x158
[   10.427165]  __warn+0xd8/0x16c
[   10.427173]  report_bug+0x88/0xe0
[   10.427179]  bug_handler+0x24/0x6c
[   10.535574]  brk_handler+0x78/0xb4
[   10.539090]  do_debug_exception+0x1a4/0x208
[   10.543395]  el1_sync_handler+0x8c/0x110
[   10.547434]  el1_sync+0x7c/0x100
[   10.550762]  _find_table_of_opp_np+0x8c/0x94
[   10.555166]  _of_init_opp_table+0x15c/0x1e4
[   10.559472]  _opp_get_opp_table+0x168/0x280
[   10.563779]  dev_pm_opp_set_clkname+0x28/0xcc
[   10.568270]  dpu_bind+0x50/0x1a4
[   10.571607]  component_bind_all+0xf4/0x20c
[   10.575826]  msm_drm_init+0x180/0x588
[   10.579603]  msm_drm_bind+0x1c/0x24
[   10.583205]  try_to_bring_up_master+0x160/0x1a8
[   10.587877]  component_master_add_with_match+0xc4/0x108
[   10.593251]  msm_pdev_probe+0x214/0x2a4
[   10.597203]  platform_drv_probe+0x94/0xb4
[   10.601334]  really_probe+0x138/0x348
[   10.605110]  driver_probe_device+0x80/0xb8
[   10.609329]  __device_attach_driver+0x90/0xa8
[   10.613821]  bus_for_each_drv+0x84/0xcc
[   10.617774]  __device_attach+0xc0/0x148
[   10.621729]  device_initial_probe+0x18/0x20
[   10.626044]  bus_probe_device+0x38/0x98
[   10.629998]  deferred_probe_work_func+0x7c/0xb8
[   10.634668]  process_one_work+0x314/0x60c
[   10.638797]  worker_thread+0x238/0x3e8
[   10.642661]  kthread+0x148/0x158
[   10.645997]  ret_from_fork+0x10/0x18
[   10.649683] irq event stamp: 117274
[   10.653290] hardirqs last  enabled at (117273):
[<ffffffe245ed8430>] _raw_spin_unlock_irqrestore+0x60/0x94
[   10.663213] hardirqs last disabled at (117274):
[<ffffffe245420ea0>] do_debug_exception+0x60/0x208
[   10.672420] softirqs last  enabled at (116976):
[<ffffffe245400eec>] __do_softirq+0x4bc/0x540
[   10.681184] softirqs last disabled at (116971):
[<ffffffe24547dd10>] __irq_exit_rcu+0x118/0x138
[   10.690123] ---[ end trace 00b127c206a99072 ]---
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
