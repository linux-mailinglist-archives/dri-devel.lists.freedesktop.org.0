Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF96DF069
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9D10E00D;
	Wed, 12 Apr 2023 09:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0BC10E00D;
 Wed, 12 Apr 2023 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681291703; x=1712827703;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1XG569kGv8nlWRcNovu9X9F1sTsgpbkAJeSf7sdQN2g=;
 b=dM3mDFlBm5ZH7wYwCs9tgUDw9QanuxrGCe3D5ubCSZYBv7qyQLMM9h4o
 1UBL2Ge8ihgobGVYfJyiymTGvEVh64RYmdrEW1ybIcNN1rkeW2B1O23ZL
 NnBS2yodySQgEToWy9ZtFOASbS9zrOqemhLxQbzULHoeT7EtV4m6//jwc
 QGxbGupztXtecB6uQqyF/fO1nD69MJckMw/VbWECiidCHabc1Elu0fByc
 Unar75uaqnetpEI7f8wgLxhOQCeytdq5lPvMMLs61wi8Zizpy8I/9STuR
 wBFZZ+VAAz7BNJUZgWc9ZjhEUSpFy+F0hfKyXlTsBDQd6U9ehRDxU7rKg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346523261"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="346523261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="800237928"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="800237928"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:28:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rui Salvaterra <rsalvaterra@gmail.com>, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, paulmck@kernel.org
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks:
 { 0-.... } 3 jiffies s: 309 root: 0x1/.
In-Reply-To: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
Date: Wed, 12 Apr 2023 12:28:17 +0300
Message-ID: <87r0spcuvi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023, Rui Salvaterra <rsalvaterra@gmail.com> wrote:
> Hi, everyone,
>
> I apologise in advance if I've sent this to {too many, the wrong}
> people. For some time now, I've been getting sporadic (in about one
> out of five boots) DRM-related RCU complaints on an Ivy Bridge-based
> (Core i7-3720QM) Mac Mini. Call trace (on Linux 6.3-rc6) follows:

Please file a bug at fdo gitlab [1]. Add drm.debug=0xe and maybe
log_buf_len=4M or similar kernel parameters, and attach dmesg all the
way from boot to reproducing the problem.

How long is "for some time now"?

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs

>
> [    5.794026] rcu: INFO: rcu_sched detected expedited stalls on
> CPUs/tasks: { 0-.... } 3 jiffies s: 309 root: 0x1/.
> [    5.794044] rcu: blocking rcu_node structures (internal RCU debug):
> [    5.794045] Sending NMI from CPU 1 to CPUs 0:
> [    5.794049] NMI backtrace for cpu 0
> [    5.794051] CPU: 0 PID: 537 Comm: Xorg Not tainted 6.3.0-rc6-debug+ #57
> [    5.794053] Hardware name: Apple Inc.
> Macmini6,2/Mac-F65AE981FFA204ED, BIOS 429.0.0.0.0 03/18/2022
> [    5.794054] RIP: 0010:fwtable_read32+0x45/0x100
> [    5.794060] Code: 5e 00 49 89 c5 48 8b 45 08 8b b0 2c 1d 00 00 85
> f6 0f 85 94 00 00 00 8d 83 00 00 fc ff 3d ff 5f 0d 00 77 28 48 03 5d
> 00 8b 1b <48> 8b 45 08 8b 88 2c 1d 00 00 85 c9 75 48 4c 89 ee 4c 89 e7
> e8 82
> [    5.794061] RSP: 0018:ffff88810d17f968 EFLAGS: 00000082
> [    5.794063] RAX: 0000000000085010 RBX: 0000000000000200 RCX: ffff888101d80000
> [    5.794064] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff888101d81f28
> [    5.794064] RBP: ffff888101d81f08 R08: 0000000000000000 R09: 00000000000032ab
> [    5.794065] R10: 0000000000000001 R11: 00000000000061b2 R12: ffff888101d81f28
> [    5.794066] R13: 0000000000000246 R14: ffff888102f693d0 R15: ffff88810d17faef
> [    5.794067] FS:  00007f579a20da80(0000) GS:ffff888267200000(0000)
> knlGS:0000000000000000
> [    5.794068] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.794069] CR2: 000055fe9b660028 CR3: 0000000111e97004 CR4: 00000000001706f0
> [    5.794069] Call Trace:
> [    5.794071]  <TASK>
> [    5.794073]  get_reserved.isra.0+0x23/0x30
> [    5.794076]  get_clock+0x25/0x70
> [    5.794078]  sclhi+0x43/0x70
> [    5.794081]  i2c_stop+0x2b/0x40
> [    5.794083]  bit_xfer+0x22a/0x5d0
> [    5.794085]  ? __pm_runtime_resume+0x40/0x50
> [    5.794088]  ? __intel_display_power_get_domain.part.0+0x4d/0x60
> [    5.794092]  gmbus_xfer+0x3c/0x90
> [    5.794094]  __i2c_transfer+0x15b/0x4d0
> [    5.794096]  i2c_transfer+0x3c/0xa0
> [    5.794098]  drm_do_probe_ddc_edid+0xad/0x120
> [    5.794101]  drm_get_edid+0x71/0x90
> [    5.794104]  intel_crt_get_edid+0xf/0x80
> [    5.794106]  intel_crt_detect_ddc+0x28/0xc0
> [    5.794107]  intel_crt_detect+0x1f5/0xc40
> [    5.794108]  ? pollwake+0x61/0x70
> [    5.794111]  drm_helper_probe_detect+0x43/0xa0
> [    5.794115]  drm_helper_probe_single_connector_modes+0x403/0x490
> [    5.794117]  drm_mode_getconnector+0x32d/0x430
> [    5.794119]  ? drm_connector_list_iter_next+0x7c/0xa0
> [    5.794120]  ? drm_connector_property_set_ioctl+0x30/0x30
> [    5.794122]  drm_ioctl_kernel+0x91/0x130
> [    5.794124]  drm_ioctl+0x1d8/0x410
> [    5.794125]  ? drm_connector_property_set_ioctl+0x30/0x30
> [    5.794127]  __x64_sys_ioctl+0x3b9/0x8f0
> [    5.794129]  ? handle_mm_fault+0xc1/0x170
> [    5.794131]  ? exc_page_fault+0x18b/0x470
> [    5.794134]  do_syscall_64+0x2b/0x50
> [    5.794136]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [    5.794139] RIP: 0033:0x7f579a1119ef
> [    5.794141] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
> 00 00
> [    5.794142] RSP: 002b:00007ffc1dee7620 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [    5.794143] RAX: ffffffffffffffda RBX: 000055fe9b660060 RCX: 00007f579a1119ef
> [    5.794144] RDX: 00007ffc1dee76c0 RSI: 00000000c05064a7 RDI: 000000000000000f
> [    5.794144] RBP: 00007ffc1dee76c0 R08: 0000000000000000 R09: 0000000000000000
> [    5.794145] R10: 00007f579a6bc1d8 R11: 0000000000000246 R12: 00000000c05064a7
> [    5.794146] R13: 000000000000000f R14: 00000000c05064a7 R15: 00007ffc1dee76c0
> [    5.794147]  </TASK>
>
> Please let me know if you need any additional information (kconfig,
> etc.) in order to fix this. I will, of course, be happy to test any
> patch thrown my way.
>
> Kind regards,
> Rui

-- 
Jani Nikula, Intel Open Source Graphics Center
