Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CE4DBDB5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 04:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D810EAE2;
	Thu, 17 Mar 2022 03:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CD510EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 03:40:40 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 22H3dJLM030819
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 23:39:20 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 4EF0915C3EA9; Wed, 16 Mar 2022 23:39:19 -0400 (EDT)
Date: Wed, 16 Mar 2022 23:39:19 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v5 00/21] DEPT(Dependency Tracker)
Message-ID: <YjKtZxjIKDJqsSrP@mit.edu>
References: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647397593-16747-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 11:26:12AM +0900, Byungchul Park wrote:
> I'm gonna re-add RFC for a while at Ted's request. But hard testing is
> needed to find false alarms for now that there's no false alarm with my
> system. I'm gonna look for other systems that might produce false
> alarms. And it'd be appreciated if you share it when you see any alarms
> with yours.

Is dept1.18_on_v5.17-rc7 roughly equivalent to the v5 version sent to
the list.  The commit date is March 16th, so I assume it was.  I tried
merging it with the ext4 dev branch, and tried enabling CONFIG_DEPT
and running xfstests.  The result was nearly test failing, because a 
DEPT warning.

I assume that this is due to some misconfiguration of DEPT on my part?
And I'm curious why DEPT_WARN_ONCE is apparently getting many, many
times?

[  760.990409] DEPT_WARN_ONCE: Pool(ecxt) is empty.
[  770.319656] DEPT_WARN_ONCE: Pool(ecxt) is empty.
[  772.460360] DEPT_WARN_ONCE: Pool(ecxt) is empty.
[  784.039676] DEPT_WARN_ONCE: Pool(ecxt) is empty.

(and this goes on over and over...)

Here's the full output of the DEPT warning from trying to run
generic/001.  There is a similar warning for generic/002, generic/003,
etc., for a total of 468 failures out of 495 tests run.

[  760.945068] run fstests generic/001 at 2022-03-16 08:16:53
[  760.985440] ------------[ cut here ]------------
[  760.990409] DEPT_WARN_ONCE: Pool(ecxt) is empty.
[  760.995166] WARNING: CPU: 1 PID: 73369 at kernel/dependency/dept.c:297 from_pool+0xc2/0x110
[  761.003915] CPU: 1 PID: 73369 Comm: bash Tainted: G        W         5.17.0-rc7-xfstests-00649-g5456f2312272 #520
[  761.014389] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
[  761.024363] RIP: 0010:from_pool+0xc2/0x110
[  761.028598] Code: 3d 32 62 96 01 00 75 c2 48 6b db 38 48 c7 c7 00 94 f1 ad 48 89 04 24 c6 05 1a 62 96 01 01 48 8b b3 20 9a 2f ae e8 2f dd bf 00 <0f> 0b 48 8b 04 24 eb 98 48 63 c2 48 0f af 86 28 9a 2f ae 48 03 86
[  761.048189] RSP: 0018:ffffa7ce4425fd48 EFLAGS: 00010086
[  761.053617] RAX: 0000000000000000 RBX: 00000000000000a8 RCX: 0000000000000000
[  761.060965] RDX: 0000000000000001 RSI: ffffffffadfb95e0 RDI: 00000000ffffffff
[  761.068322] RBP: 00000000001dc598 R08: 0000000000000000 R09: ffffa7ce4425fb90
[  761.075789] R10: fffffffffffe0aa0 R11: fffffffffffe0ae8 R12: ffff9768e07f0600
[  761.083063] R13: 0000000000000000 R14: 0000000000000246 R15: 0000000000000000
[  761.090312] FS:  00007fd4ecc4c740(0000) GS:ffff976999400000(0000) knlGS:0000000000000000
[  761.098623] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  761.104580] CR2: 0000563c61657eb0 CR3: 00000001328fa001 CR4: 00000000003706e0
[  761.111921] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  761.119171] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  761.126617] Call Trace:
[  761.129175]  <TASK>
[  761.131385]  add_ecxt+0x54/0x1c0
[  761.134736]  ? simple_attr_write+0x87/0x100
[  761.139063]  dept_event+0xaa/0x1d0
[  761.142687]  ? simple_attr_write+0x87/0x100
[  761.147089]  __mutex_unlock_slowpath+0x60/0x2d0
[  761.151866]  simple_attr_write+0x87/0x100
[  761.155997]  debugfs_attr_write+0x40/0x60
[  761.160124]  vfs_write+0xec/0x390
[  761.163557]  ksys_write+0x68/0xe0
[  761.167004]  do_syscall_64+0x43/0x90
[  761.170782]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  761.176204] RIP: 0033:0x7fd4ecd3df33
[  761.180010] Code: 8b 15 61 ef 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
[  761.199551] RSP: 002b:00007ffe772d4808 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  761.207240] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fd4ecd3df33
[  761.214583] RDX: 0000000000000002 RSI: 0000563c61657eb0 RDI: 0000000000000001
[  761.221835] RBP: 0000563c61657eb0 R08: 000000000000000a R09: 0000000000000001
[  761.229537] R10: 0000563c61902240 R11: 0000000000000246 R12: 0000000000000002
[  761.237239] R13: 00007fd4ece0e6a0 R14: 0000000000000002 R15: 00007fd4ece0e8a0
[  761.245283]  </TASK>
[  761.247586] ---[ end trace 0000000000000000 ]---
[  761.761829] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Quota mode: none.
[  769.903489] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Quota mode: none.

Let me know what I should do in order to fix this DEPT_WARN_ONCE?

Thanks,

						- Ted
