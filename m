Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF0UEDlGc2mHuQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:58:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CD73C80
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC710EA99;
	Fri, 23 Jan 2026 09:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="FxljXwMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9207210EA98
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:58:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso1272457f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 01:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1769162291; x=1769767091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usTiplZ+HHUhH9M5hJvxEF67Q676YbpDRkINXSQfcYs=;
 b=FxljXwMM11ucGNwGGz2AtXMGB9oKF4M7MxPCDuNTiuTwAKnrMsKbgH2+pxkGKrgqaW
 cLJeL0acvz6sxKjm/acqVSHToEA8Cy0/3IgQLg7mHHXUaFiM7tNuG9PJb2beIOgrqzCl
 vTjsKlXRGN3JGcOXw66KeTSmYJa6HKmdiy4yDvMCF1tSQ1kcAiTDvyLDAGQRUquxm9eA
 lP3xve/adPix7JKlySLmLqHLpNvUFHcmdl4FAef7Jk8+T25svlbKTFHjZ9j17p03GmBY
 keTqpR2fLZZ81iap4IvV1qczcL1Ws4vgnhtZV/AuJxVQemMtO+Z8RVfYiGVzh20fVyIj
 7X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769162291; x=1769767091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usTiplZ+HHUhH9M5hJvxEF67Q676YbpDRkINXSQfcYs=;
 b=oth/NO5D/VoSyfsjNxD4FJ6YAi3KJPivIK5BsMMndcxr2o4LIcw//hGinSb47ybG6Y
 edOrGUrmUnYXEuYJ0q1c4Pw1WEShWiHdvFhIGkJx/ZMgFJvk4CZBcqLjTFb6Wo3EEaMy
 9oAsnGabQL5y7u+lX80Q+/g6w5knacrl3Z+Bg2DVobbAEPHSVrK+wRLd36w35fh10S+V
 Rl1PDCU0qEaedJQYwP3miHZEvEkKTzEWcUxzXYJv6zCTagfYNQK7R+1mqcLU2oDO80Dr
 cjSpHJcZ5XlaFRJ1oVlV3RXLgOAtzrduJXIurNP5990FYpvDOEohvD4rQloc48aoRKkn
 KXOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWN7hGVjhVlANQKCEX2p1fYeRWqNiCR+gu3bIRKaeMg+P+7Hk86wbHv58BQUDkqk7Kh96HmEcllDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNfHgNzCH1GR2s0p50chff/XNjl0mmPVjVrrqGf3watvudDIjX
 iQEtZdpXkxEjudVskUR+N4Hcr5ynbRKk5bnLl9Qu5rYn6hegrBTN4tQBbfjYObBV/Qc=
X-Gm-Gg: AZuq6aJfHlzmI80ywiCd7ZOa8BvFlPL2Nj2LtzMTtwZmnGWWHVjf99VTIDRHRSH8zlU
 4yPi5e16A2CyPKyQLt2p90ldVNLRPhX2KD+OV3kXyAfM/Ywv22GxCSClp+vqo4j4WwCxqvs8u0V
 gRp+SitvtwSJ56edvNaj7Hi2u2Xf6+NyvWmdecoXfOiF7yqKPHZ7ReeoIUmPcCCjFYbZqjOw+x4
 RddSIVNKk7rPkE+i99eP5r1qtP3KlcoGAOipX7RJRHNTK12qhTp2y3IvCfwAHBhKk29o3daLz7/
 DQGvvbEDsZ7xA78DbgIFp4qtziLuj+UF1NEn7A+++FGw/loOOy3wH7lWB3b6ZguLYiE1Bhu5Hr3
 qtrkpYWxPCY18xmrPIs6K4N7n80Ywt9RoXewXZi64jEm5dzJgxGbfIgooXvzmJi4Q2FrtJYPu22
 TrFZu4JEA31Buh/QCwZW3bRc7vKj1+GkdDfEg635zS3Zw=
X-Received: by 2002:a05:6000:420a:b0:432:586f:2a9d with SMTP id
 ffacd0b85a97d-435b162c2f6mr4088138f8f.32.1769162290764; 
 Fri, 23 Jan 2026 01:58:10 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24f15sm5579365f8f.18.2026.01.23.01.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 01:58:10 -0800 (PST)
Message-ID: <f0209960-7b71-4cf0-8531-b67d63cec68a@ursulin.net>
Date: Fri, 23 Jan 2026 09:58:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] WARNING in idr_alloc during drm_gem_change_handle_ioctl
To: =?UTF-8?B?546L5b+X?= <wangzhi_xd@stu.xidian.edu.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <6db3d523.bb3f.19ba843a1f9.Coremail.wangzhi_xd@stu.xidian.edu.cn>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <6db3d523.bb3f.19ba843a1f9.Coremail.wangzhi_xd@stu.xidian.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wangzhi_xd@stu.xidian.edu.cn,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.906];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: 6F6CD73C80
X-Rspamd-Action: no action


On 10/01/2026 14:16, 王志 wrote:
> Dear Maintainers,
> When using our customized Syzkaller to fuzz the latest Linux kernel, the following crash was triggered.
> HEAD commit:7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> git tree: upstream
> Output:https://github.com/manual0/crash/blob/main/report3.txt
> Kernel config: https://github.com/manual0/crash/blob/main/config.txt
> C reproducer:https://github.com/manual0/crash/blob/main/repro3.c
> Syz reproducer:https://github.com/manual0/crash/blob/main/repro3.syz
> 
> The kernel triggered a WARNING at lib/idr.c:84 in idr_alloc. This warning is typically triggered when the idr_alloc() function is called with a negative start value or an invalid range that violates the IDR expectations.
> 
> The call trace indicates that the issue originates from drm_gem_change_handle_ioctl within the DRM subsystem. This function is attempting to allocate or change a GEM handle, and it seems to pass an invalid parameter to the IDR allocator. This could be due to a lack of proper bounds checking on user-supplied values in the DRM_IOCTL_GEM_FLINK or similar handle-related IOCTLs.
> 
> If you fix this issue, please add the following tag to the commit:

I have sent a tentative fix for this, and it is a solid bug report, only 
two things which you could improve:

> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>, Bin Yu<byu@xidian.edu.cn>, MingYu Wang<w15303746062@163.com>, WenJian Lu<19861702678@163.com>, KeFeng Gao<2401553064@qq.com>

1)

I don't think this is a compliant Reported-by: tag. If you want multiple 
emails you need multiple tags. I couldn't be bothered and only picked 
the first reporter.

2)

It would be useful if your scripts would use git blame to find the 
offending commit and copy the relevant people in the report. That would 
give it more change someone actually acts on it.

Regards,

Tvrtko

> 
> RBP: 00007fb87fd4f010 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007fb881586038 R14: 00007fb881585fa0 R15: 00007fb87fd2f000
>   </TASK>
> ------------[ cut here ]------------
> WARNING: CPU: 2 PID: 13371 at lib/idr.c:84 idr_alloc+0x123/0x140 home/linux-6.18/lib/idr.c:84
> Modules linked in: bochs drm_shmem_helper drm_kms_helper drm ata_generic virtio_pci virtio_pci_legacy_dev i2c_piix4 drm_panel_orientation_quirks pata_acpi virtio_pci_modern_dev i2c_smbus
> CPU: 2 UID: 0 PID: 13371 Comm: syz.4.4127 Not tainted 6.18.0 #9 PREEMPT(voluntary)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> RIP: 0010:idr_alloc+0x123/0x140 home/linux-6.18/lib/idr.c:84
> Code: 8b 44 24 58 65 48 2b 05 83 50 c2 03 75 27 48 83 c4 60 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f e9 c3 a9 0b 00 e8 be 6a ba fb 90 <0f> 0b 90 41 bc ea ff ff ff eb b2 e8 4d 0f 09 00 66 66 2e 0f 1f 84
> RSP: 0018:ffff88811860fb60 EFLAGS: 00010216
> RAX: 0000000000000091 RBX: 0000000080000001 RCX: ffffc90006008000
> RDX: 0000000000080000 RSI: ffffffff85bbbfa2 RDI: 0000000000000005
> RBP: 1ffff110230c1f6c R08: 0000000000002800 R09: ffffed10230c1f71
> R10: 0000000080000000 R11: 0000000000000000 R12: 0000000080000000
> R13: ffff888104d29088 R14: ffff88810589f000 R15: 0000000000002800
> FS:  00007f9ee04cf640(0000) GS:ffff88819133f000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f9ee1a459c0 CR3: 000000010626e000 CR4: 00000000000006f0
> Call Trace:
>   <TASK>
>   drm_gem_change_handle_ioctl+0x2bf/0x4f0 home/linux-6.18/drivers/gpu/drm/drm_gem.c:988 [drm]
>   drm_ioctl_kernel+0x1f2/0x3e0 home/linux-6.18/drivers/gpu/drm/drm_ioctl.c:797 [drm]
>   drm_ioctl+0x580/0xb70 home/linux-6.18/drivers/gpu/drm/drm_ioctl.c:894 [drm]
>   vfs_ioctl home/linux-6.18/fs/ioctl.c:51 [inline]
>   __do_sys_ioctl home/linux-6.18/fs/ioctl.c:597 [inline]
>   __se_sys_ioctl home/linux-6.18/fs/ioctl.c:583 [inline]
>   __x64_sys_ioctl+0x194/0x210 home/linux-6.18/fs/ioctl.c:583
>   do_syscall_x64 home/linux-6.18/arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xc6/0x390 home/linux-6.18/arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9ee1a9059d
> Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f9ee04cef98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f9ee1d05fa0 RCX: 00007f9ee1a9059d
> RDX: 0000200000000380 RSI: 00000000c02064d2 RDI: 0000000000000003
> RBP: 00007f9ee1b2e078 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f9ee1d06038 R14: 00007f9ee1d05fa0 R15: 00007f9ee04af000
>   </TASK>
> irq event stamp: 1565
> hardirqs last  enabled at (1575): [<ffffffff8155bd39>] __up_console_sem+0x89/0xa0 home/linux-6.18/kernel/printk/printk.c:345
> hardirqs last disabled at (1584): [<ffffffff8155bd1e>] __up_console_sem+0x6e/0xa0 home/linux-6.18/kernel/printk/printk.c:343
> softirqs last  enabled at (1376): [<ffffffff813d2e09>] softirq_handle_end home/linux-6.18/kernel/softirq.c:468 [inline]
> softirqs last  enabled at (1376): [<ffffffff813d2e09>] handle_softirqs+0x509/0x760 home/linux-6.18/kernel/softirq.c:650
> softirqs last disabled at (1371): [<ffffffff813d3140>] __do_softirq home/linux-6.18/kernel/softirq.c:656 [inline]
> softirqs last disabled at (1371): [<ffffffff813d3140>] invoke_softirq home/linux-6.18/kernel/softirq.c:496 [inline]
> softirqs last disabled at (1371): [<ffffffff813d3140>] __irq_exit_rcu+0xd0/0x100 home/linux-6.18/kernel/softirq.c:723
> ---[ end trace 0000000000000000 ]---
> 
> Thanks,
> Zhi Wang

