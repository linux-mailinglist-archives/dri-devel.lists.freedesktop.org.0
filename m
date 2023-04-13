Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF766E08ED
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052A10E161;
	Thu, 13 Apr 2023 08:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72910EA44;
 Thu, 13 Apr 2023 07:30:14 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id c2so3730496ybo.9;
 Thu, 13 Apr 2023 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681371014; x=1683963014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JGv1JkQ2XdUnq+6HP1fTrxYEFDSooshQ2NWaFXUJVlg=;
 b=RJ80LANdPZ3eEVYRjk8PRVsAF0ASP5oa2p1HahEZE8ObfM3jdIXDIlNcFIHCk2kyxO
 cqn1TCs3NWloHNTMNHAR3vQW1d1nchnc2cQNvtxlarNSR/IBsNPk0QzXONDWyDA3ibly
 r2GWNSig+EKE5+582c5Z2BWQM0M4Qg8eI8ianzgmrfyVfz0qi7B3JniJdoGFUuY3qVp3
 QDNQrGmwFyOTsZNlJyoBj94inmDVqYJS/9CkkWUcd32QyM1aPVz7PyOEQTKdRjW6GudI
 mDIj08L4mh9Hfg9weL532sO+qj8NstEMmr1xFAqSnbAKeMnmcgksKepTKtXo/xiDw4j0
 cebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681371014; x=1683963014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGv1JkQ2XdUnq+6HP1fTrxYEFDSooshQ2NWaFXUJVlg=;
 b=WhAvYmiUXD/Ff0awnTQhGrbHA3g4L+dRmPuUV/BF1GXDikzbSnmdRHR9pxqkybMYi/
 AyoP+vitwfem0i7N/uLcITZVlGptT0guNQjabhxArw3IAG4CpUIhIksNRoryCrdDmewb
 DKkmcyMdeBgChviTbdV4agKoUjYjz0YAhmeymWnyPtBlaSqqdp5CuDGJrB2hTNpYk3XU
 oG/in+msIBWvN8Fwr2GEKCruvRopM5kJr9HZ87Rwx6/ARSC1jP26gADUCeY3ISHWCyvx
 D5u5fP5nQcO/mMzIyBKGqhs8SiHBLmyfUbEqnzihc9ZYxj4xcQIajA6K1d1I3anXs7Yg
 vmGQ==
X-Gm-Message-State: AAQBX9eRzSP9rKDzk0gVDsfOrPAe7R0X+Zcfwa+oCTN5FGKHqbOanB0r
 MGTfBoHy391hdNCxBS/Jq4gwZBchoUdWuP+XWw==
X-Google-Smtp-Source: AKy350bbGvktxNXee/YBihEt5Sn6d7Hx3KYLd7vDuhpI131igW4XOGqtEgM4cL0ejgvc/mU96qOHjMCJFTJZI2CUVpg=
X-Received: by 2002:a25:ca56:0:b0:b8f:610b:e6b8 with SMTP id
 a83-20020a25ca56000000b00b8f610be6b8mr35800ybg.9.1681371013815; Thu, 13 Apr
 2023 00:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
 <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
In-Reply-To: <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 13 Apr 2023 08:30:02 +0100
Message-ID: <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks: {
 0-.... } 3 jiffies s: 309 root: 0x1/.
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, paulmck@kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi again, everyone.

So, while preparing to file the bug report with the requested
information, I got a trace completely unrelated to DRM (on a swapon
call, it seems).

[    4.868340] rcu: INFO: rcu_sched detected expedited stalls on
CPUs/tasks: { 4-.... } 3 jiffies s: 265 root: 0x10/.
[    4.868349] rcu: blocking rcu_node structures (internal RCU debug):
[    4.868351] Sending NMI from CPU 3 to CPUs 4:
[    4.868355] NMI backtrace for cpu 4
[    4.868357] CPU: 4 PID: 462 Comm: swapon Not tainted 6.3.0-rc6-debug+ #57
[    4.868359] Hardware name: Apple Inc.
Macmini6,2/Mac-F65AE981FFA204ED, BIOS 429.0.0.0.0 03/18/2022
[    4.868360] RIP: 0010:zram_submit_bio+0x57c/0x940
[    4.868365] Code: 04 4c 01 f0 48 8d 48 08 f0 48 0f ba 68 08 0d 0f
82 80 00 00 00 4c 89 ef e8 01 eb ff ff 49 8b 45 00 4a 8d 44 30 09 f0
80 20 df <f0> 48 ff 45 00 48 81 eb 00 10 00 00 41 83 c4 01 48 81 fb ff
0f 00
[    4.868366] RSP: 0018:ffff8881057dbcd8 EFLAGS: 00000246
[    4.868368] RAX: ffffc90001c186d9 RBX: 000000003e893000 RCX: ffffc90001c186d8
[    4.868369] RDX: ffffc90001c186d0 RSI: 0000000000000000 RDI: ffff88810083b400
[    4.868369] RBP: ffff88810083b470 R08: 0000000000027e40 R09: 0000000000025850
[    4.868370] R10: 000000000014b212 R11: ffff88810ba03180 R12: 00000000000c176d
[    4.868371] R13: ffff88810083b400 R14: 0000000000c176d0 R15: 0000000000000000
[    4.868372] FS:  00007fbd8f8ce800(0000) GS:ffff888266100000(0000)
knlGS:0000000000000000
[    4.868373] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.868374] CR2: 0000563005371000 CR3: 000000010355c003 CR4: 00000000001706e0
[    4.868375] Call Trace:
[    4.868377]  <TASK>
[    4.868378]  ? block_read_full_folio+0x23e/0x2e0
[    4.868383]  ? kmem_cache_alloc+0x1b/0x110
[    4.868385]  ? mempool_alloc+0x37/0x140
[    4.868388]  ? pcpu_block_update_hint_alloc+0xce/0x2f0
[    4.868390]  __submit_bio+0x41/0xd0
[    4.868394]  submit_bio_noacct_nocheck+0xc4/0x2b0
[    4.868396]  blk_next_bio+0x55/0x70
[    4.868398]  __blkdev_issue_discard+0xc8/0x180
[    4.868401]  blkdev_issue_discard+0x3c/0x80
[    4.868403]  __x64_sys_swapon+0xb71/0x1120
[    4.868407]  do_syscall_64+0x2b/0x50
[    4.868410]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[    4.868414] RIP: 0033:0x7fbd8f712d5b
[    4.868416] Code: 73 01 c3 48 8b 0d bd 30 0e 00 f7 d8 64 89 01 48
83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 a7 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8d 30 0e 00 f7 d8 64 89
01 48
[    4.868417] RSP: 002b:00007ffcaf9a3448 EFLAGS: 00000246 ORIG_RAX:
00000000000000a7
[    4.868418] RAX: ffffffffffffffda RBX: 0000000000018064 RCX: 00007fbd8f712d5b
[    4.868419] RDX: 0000000000018064 RSI: 0000000000018064 RDI: 000056300535fb10
[    4.868420] RBP: 00007ffcaf9a3530 R08: 000000014b213000 R09: 00007fbd8f7f70f0
[    4.868420] R10: 0000000000001000 R11: 0000000000000246 R12: 000056300535fb10
[    4.868421] R13: 0000000000000064 R14: 00007ffcaf9a3530 R15: 0000000000000000
[    4.868423]  </TASK>

Could it be that RCU is reporting expedited stalls too eagerly? And,
if so, why only on this machine?
