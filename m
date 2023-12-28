Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146281F437
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 03:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7D10E02D;
	Thu, 28 Dec 2023 02:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FA910E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 02:57:58 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d9b760610bso216132b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 18:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1703732278; x=1704337078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xjGt/UWPs7IIe1Ke3qZiLhv+zYLHUTVWeKUGbJl8a3E=;
 b=Ersw3fU7QbPoc2ovbrmvmFMoVC2mzob43dBnhi3Dy88yVBjvZH23JaI8Rbrlrer8Ps
 WV8CAq+81ABMSrOBr0d9kQlhULtvdyacEePhj9KKAQGiiVtroAH9AYsRAaDi+L58Tcw6
 jO4wJH84eVmdncnY6TsWeeqnee37MO6kWXfWcFmt1B+MPbifUUlqr1am5Z6oBidY8hgK
 U7Ne2nKRCraFkG5m7OKhAAXpoCoV1HZX6oaW0yxtEdJGpLVXgHuBrjVXx5trLq0RZS6Z
 MAaIvc18d4KfbeqETiPXrJY+hE/D7/eKTJBYqIwOFvZV5UmL30GGW4vNvVlqlgBtRdUq
 Ntng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703732278; x=1704337078;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xjGt/UWPs7IIe1Ke3qZiLhv+zYLHUTVWeKUGbJl8a3E=;
 b=N5BnaaTaMNUSgeCxhzq+JxzbZGGvDwz3sSOFaJQ8ec4xIxU7a0qVXpE004bheZeo0M
 LAEqf2t4gdPG+D4IwUssKY5URRUOMf1gpVbuTMSYMYwDoD2UJ6rGgqMPCnjE1WoCH/rP
 FdUOdifU0HMmSAWOsmh5JhvuHp6mIJgMUFYmrVRRNXocrXAMFXVBis3Rf85XojKdIaiw
 16fxohfD8WLd6k05nL0/Fw5ZPQTlcENZTn4AyDaDio0d9+5ch1jO6YPKDAvwZA9EEK1/
 Nro0s12MU2KoNp3hO3XSizQ2nQH9QVdrkkQ/qP3jlmRisjKqXm9yylxfOLtPo8uVluJH
 zOKw==
X-Gm-Message-State: AOJu0YxfR2d5NMZUQ4y1j+hZcynRHiZaCpPHnSBtApKX/oavhAZR6KKh
 GQj8nYiPTmsiwIY0vmPERQURbly1Xr5yHg==
X-Google-Smtp-Source: AGHT+IGWOV/7SIgU0mElNti5AvndC6AS0UK4Yz+sA8GGhSRlnDsw5D5kQyRmtDKZuQpJqhtQCwIB8g==
X-Received: by 2002:a05:6a20:320f:b0:195:3ab4:52b2 with SMTP id
 hl15-20020a056a20320f00b001953ab452b2mr15760686pzc.0.1703732278020; 
 Wed, 27 Dec 2023 18:57:58 -0800 (PST)
Received: from [10.84.155.44] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b001d3867b6424sm12720366plx.113.2023.12.27.18.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 18:57:57 -0800 (PST)
Message-ID: <0b0963c2-3c77-4037-a66c-f535c4422755@bytedance.com>
Date: Thu, 28 Dec 2023 10:57:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in drm_prime_destroy_file_private (2)
Content-Language: en-US
To: syzbot <syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com>
References: <000000000000f4faa2060d83f582@google.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <000000000000f4faa2060d83f582@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: sumit.semwal@linaro.org, jgg@nvidia.com, tzimmermann@suse.de,
 syzkaller-bugs@googlegroups.com, akinobu.mita@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, mripard@kernel.org, akpm@linux-foundation.org,
 airlied@gmail.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/12/28 04:51, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    5254c0cbc92d Merge tag 'block-6.7-2023-12-22' of git://git..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=10cc6995e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=314e9ad033a7d3a7
> dashboard link: https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e35809e80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=155d5fd6e80000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ebe09a5995ee/disk-5254c0cb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/02178d7f5f98/vmlinux-5254c0cb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/12307f47d87c/bzImage-5254c0cb.xz
> 
> The issue was bisected to:
> 
> commit ea4452de2ae987342fadbdd2c044034e6480daad
> Author: Qi Zheng <zhengqi.arch@bytedance.com>
> Date:   Fri Nov 18 10:00:11 2022 +0000
> 
>      mm: fix unexpected changes to {failslab|fail_page_alloc}.attr
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13027f76e80000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=10827f76e80000
> console output: https://syzkaller.appspot.com/x/log.txt?x=17027f76e80000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com
> Fixes: ea4452de2ae9 ("mm: fix unexpected changes to {failslab|fail_page_alloc}.attr")
> 
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
> R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
>   </TASK>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5107 at drivers/gpu/drm/drm_prime.c:227 drm_prime_destroy_file_private+0x43/0x60 drivers/gpu/drm/drm_prime.c:227

The warning is caused by !RB_EMPTY_ROOT(&prime_fpriv->dmabufs):

drm_prime_destroy_file_private
--> WARN_ON(!RB_EMPTY_ROOT(&prime_fpriv->dmabufs));

It seems irrelevant to the logic of fault injection. So I don't see
why the commit ea4452de2ae9 can cause this warning. :(

> Modules linked in:
> CPU: 0 PID: 5107 Comm: syz-executor227 Not tainted 6.7.0-rc6-syzkaller-00248-g5254c0cbc92d #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
> RIP: 0010:drm_prime_destroy_file_private+0x43/0x60 drivers/gpu/drm/drm_prime.c:227
> Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 21 48 8b 83 90 00 00 00 48 85 c0 75 06 5b e9 13 f1 93 fc e8 0e f1 93 fc 90 <0f> 0b 90 5b e9 04 f1 93 fc e8 3f 9b ea fc eb d8 66 66 2e 0f 1f 84
> RSP: 0018:ffffc90003bdf9e0 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888019f28378 RCX: ffffc90003bdf9b0
> RDX: ffff888018ff9dc0 RSI: ffffffff84f380c2 RDI: ffff888019f28408
> RBP: ffff888019f28000 R08: 0000000000000001 R09: 0000000000000001
> R10: ffffffff8f193a57 R11: 0000000000000000 R12: ffff88814829a000
> R13: ffff888019f282a8 R14: ffff88814829a068 R15: ffff88814829a0a0
> FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007efe98050410 CR3: 000000006d1ff000 CR4: 0000000000350ef0
> Call Trace:
>   <TASK>
>   drm_file_free.part.0+0x738/0xb90 drivers/gpu/drm/drm_file.c:290
>   drm_file_free drivers/gpu/drm/drm_file.c:247 [inline]
>   drm_close_helper.isra.0+0x180/0x1f0 drivers/gpu/drm/drm_file.c:307
>   drm_release+0x22a/0x4f0 drivers/gpu/drm/drm_file.c:494
>   __fput+0x270/0xb70 fs/file_table.c:394
>   task_work_run+0x14d/0x240 kernel/task_work.c:180
>   exit_task_work include/linux/task_work.h:38 [inline]
>   do_exit+0xa8a/0x2ad0 kernel/exit.c:869
>   do_group_exit+0xd4/0x2a0 kernel/exit.c:1018
>   get_signal+0x23b5/0x2790 kernel/signal.c:2904
>   arch_do_signal_or_restart+0x90/0x7f0 arch/x86/kernel/signal.c:309
>   exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
>   exit_to_user_mode_prepare+0x121/0x240 kernel/entry/common.c:204
>   __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
>   syscall_exit_to_user_mode+0x1e/0x60 kernel/entry/common.c:296
>   do_syscall_64+0x4d/0x110 arch/x86/entry/common.c:89
>   entry_SYSCALL_64_after_hwframe+0x63/0x6b
> RIP: 0033:0x7efe98014769
> Code: Unable to access opcode bytes at 0x7efe9801473f.
> RSP: 002b:00007efe97fd2208 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> RAX: fffffffffffffe00 RBX: 00007efe9809c408 RCX: 00007efe98014769
> RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007efe9809c408
> RBP: 00007efe9809c400 R08: 0000000000003131 R09: 0000000000003131
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
> R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
>   </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
