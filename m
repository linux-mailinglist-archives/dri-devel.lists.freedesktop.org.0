Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1FA01919
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 11:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FD710E4F8;
	Sun,  5 Jan 2025 10:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWyzduvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9120D10E04E;
 Sat,  4 Jan 2025 17:43:00 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so8819581f8f.0; 
 Sat, 04 Jan 2025 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736012519; x=1736617319; darn=lists.freedesktop.org;
 h=in-reply-to:content-language:subject:references:cc:to:user-agent
 :mime-version:date:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ushr+PJEddWLPQk6ymhunwBn5OG4iCVTPM29EKsvDWI=;
 b=kWyzduvAx9K34JiisgpEYVwy//eh6mrIO7Zi3EMKv/YidGHPiri9NtU9fPg+o2Ntwd
 R4ytpoZXD4wnKW/BBx3hCsFwh3xDjiKu6sMyL4Il8gPky+f5VutwI0YYcLCGwBvVeCil
 5Xh2gsafyH8GOlIitsUeB/GxjDC/wsd1piubsmUz2AX1pnzcRphAX1dYWbz0CGSTkWaF
 2dcx/p01uOX5MYrDXN3xsvCCQzEKDUq6QPzLGi6OXWzxMQm3KdclDO6PvM0edJgjMkwb
 tbNGPOQs/dCinMBVJCytVrBI+H8RgpMDzez7WeD558cOfveVCRHzHnM9LnIs2pi3hyaX
 WBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736012519; x=1736617319;
 h=in-reply-to:content-language:subject:references:cc:to:user-agent
 :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ushr+PJEddWLPQk6ymhunwBn5OG4iCVTPM29EKsvDWI=;
 b=bAEwjVw/QBfL8SJRcVLRe7b/3IULPX/se+zh0AYpXYBO4l155pboeuzcRqmdFjpi7A
 EkTMpuVwieJXUVe34zyjWrdC2ADJXQRzSnc82/dN301U+AgaEd7nP0R8arGFY7I+jLaS
 e2lB9BbUvMgdx9UD9yne1XU8A1lQLmTQislImhdA3GjGKb/F6VmASFBgA83nlSKpN62L
 92POYvL8hGTHqAZPTZi76uf3XYM6SGIIXXVm8WxRxg7CpBUtAtNK29eXBfIzYcFyLIZs
 g3BbXUN0gj7UFCdb2Zq84n6Wvv8JODd/jaQ2iY3Vr+1wnkkQlUB3ONfqDbIiXtRun7zX
 sSxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk30ntihsI1gz72g7IljEq9PkKDC9Hu1u5aCtPP98WEF7JlU3/EaAh4YpbuA9qVpq68wa9xOCYXA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAtq3Dk5t1UahFetToC4Ao85zVy37tJvwmp1K78rNVfsnDV+C0
 nNKxl8vmK0Sl8iF2FYM1VT4bZ0X9AHwaLK+1OHAgfB89Zv9pakVJ
X-Gm-Gg: ASbGncvEF78vjWsuzhkWoTYYQG8PitWJUMK05CSVggY8tcMS3OrCEJanjC+xEVWFCpR
 IeFnDaNM9Bj0ZdosdprCslyFWevkQDz3N4iSzTTfnVFQv62ppJ/6MJNA0i50897QyzkKN2fmoX9
 UBgxkuE6ZgLcB2W2zBNeZrFFIb9uJbLZgvTmPbr9mwLBjQ8ePxrHCioTP1INpj9rFCZYNWpQ+0i
 YYtDWhoPa91MHuAutsedRL0+UB2ReKZ3n/9TrUZ/UqG/lOfM3raUY4Steqnwu1C4RfHXQ8=
X-Google-Smtp-Source: AGHT+IFwXrMciXAnEPPPGCnJqpykfoZ70FP5iQQcLVFFHg0EkZnDNDSidKu6aQe+oQBGwvfhd3KMHA==
X-Received: by 2002:adf:a3d0:0:b0:38a:49c1:8345 with SMTP id
 ffacd0b85a97d-38a58e0cbc3mr11507072f8f.18.1736012518633; 
 Sat, 04 Jan 2025 09:41:58 -0800 (PST)
Received: from [192.168.1.177] ([45.143.100.199])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1c0sm44348704f8f.77.2025.01.04.09.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jan 2025 09:41:58 -0800 (PST)
From: Andrea Amorosi <andrea.amorosi76@gmail.com>
X-Google-Original-From: Andrea Amorosi <Andrea.Amorosi76@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------wZzrhPPMiv0B20Q0SRMDQ4PP"
Message-ID: <13652a8e-bb9a-4a76-8324-580383ee8761@gmail.com>
Date: Sat, 4 Jan 2025 18:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lists@sapience.com
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 regressions@lists.linux.dev, rostedt@goodmis.org, stable@vger.kernel.org,
 thomas.hellstrom@linux.intel.com
References: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
Subject: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event xe_bo_move
 has unsafe dereference of argument 4
Content-Language: it-IT
In-Reply-To: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
X-Mailman-Approved-At: Sun, 05 Jan 2025 10:55:08 +0000
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

This is a multi-part message in MIME format.
--------------wZzrhPPMiv0B20Q0SRMDQ4PP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi to all,

I've just updated my archlinux to |6.12.8-arch1-1 and I still get the 
same issue:|

|gen 04 18:01:34 D9330 kernel: ------------[ cut here ]------------
gen 04 18:01:34 D9330 kernel: WARNING: CPU: 2 PID: 209 at 
kernel/trace/trace_events.c:577 trace_event_raw_init+0x159/0x660
gen 04 18:01:34 D9330 kernel: Modules linked in: xe(+) drm_ttm_helper 
gpu_sched drm_suballoc_helper drm_gpuvm drm_exec uas usb_storage i915 
i2c_algo_bit drm_buddy ttm serio_raw atkbd intel>
gen 04 18:01:34 D9330 kernel: CPU: 2 UID: 0 PID: 209 Comm: (udev-worker) 
Not tainted 6.12.8-arch1-1 #1 099de49ddaebb26408f097c48b36e50b2c8e21c9
gen 04 18:01:34 D9330 kernel: Hardware name: Dell Inc. Latitude 
9330/0RN079, BIOS 1.25.0 11/12/2024
gen 04 18:01:34 D9330 kernel: RIP: 0010:trace_event_raw_init+0x159/0x660
gen 04 18:01:34 D9330 kernel: Code: 89 ea 0f 83 3b 04 00 00 e8 44 db ff 
ff 84 c0 74 10 8b 0c 24 48 c7 c0 fe ff ff ff 48 d3 c0 49 21 c6 4d 85 f6 
0f 84 d6 fe ff ff <0f> 0b bb 01 00 00 00 41 >
gen 04 18:01:34 D9330 kernel: RSP: 0018:ffffa9b940987730 EFLAGS: 00010206
gen 04 18:01:34 D9330 kernel: RAX: ffffffffffffffdf RBX: 
ffffffffc0ca4731 RCX: 0000000000000005
gen 04 18:01:34 D9330 kernel: RDX: 0000000000000002 RSI: 
0000000000000001 RDI: ffffffffc0ca4727
gen 04 18:01:34 D9330 kernel: RBP: ffffffffc0ca4640 R08: 
0000000000000039 R09: 0000000000000000
gen 04 18:01:34 D9330 kernel: R10: 0000000000000076 R11: 
000000000000004e R12: 00000000000000f2
gen 04 18:01:34 D9330 kernel: R13: ffffffffc0ca5760 R14: 
0000000000000018 R15: 0000000000000000
gen 04 18:01:34 D9330 kernel: FS:  00007ba0e9fe9880(0000) 
GS:ffff9d957f500000(0000) knlGS:0000000000000000
gen 04 18:01:34 D9330 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
gen 04 18:01:34 D9330 kernel: CR2: 00007ba0e9dac000 CR3: 
00000001019ac000 CR4: 0000000000f50ef0
gen 04 18:01:34 D9330 kernel: PKRU: 55555554
gen 04 18:01:34 D9330 kernel: Call Trace:
gen 04 18:01:34 D9330 kernel:  <TASK>
gen 04 18:01:34 D9330 kernel:  ? trace_event_raw_init+0x159/0x660
gen 04 18:01:34 D9330 kernel:  ? __warn.cold+0x93/0xf6
gen 04 18:01:34 D9330 kernel:  ? trace_event_raw_init+0x159/0x660
gen 04 18:01:34 D9330 kernel:  ? report_bug+0xff/0x140
gen 04 18:01:34 D9330 kernel:  ? handle_bug+0x58/0x90
gen 04 18:01:34 D9330 kernel:  ? exc_invalid_op+0x17/0x70
gen 04 18:01:34 D9330 kernel:  ? asm_exc_invalid_op+0x1a/0x20
gen 04 18:01:34 D9330 kernel:  ? trace_event_raw_init+0x159/0x660
gen 04 18:01:34 D9330 kernel:  event_init+0x28/0x70
gen 04 18:01:34 D9330 kernel:  trace_module_notify+0x1a4/0x260
gen 04 18:01:34 D9330 kernel:  notifier_call_chain+0x5a/0xd0
gen 04 18:01:34 D9330 kernel: blocking_notifier_call_chain_robust+0x65/0xc0
gen 04 18:01:34 D9330 kernel:  load_module+0x1822/0x1cf0
gen 04 18:01:34 D9330 kernel:  ? vmap+0x83/0xe0
gen 04 18:01:34 D9330 kernel:  ? __vunmap_range_noflush+0x325/0x470
gen 04 18:01:34 D9330 kernel:  ? init_module_from_file+0x89/0xe0
gen 04 18:01:34 D9330 kernel:  init_module_from_file+0x89/0xe0
gen 04 18:01:34 D9330 kernel: idempotent_init_module+0x11e/0x310
gen 04 18:01:34 D9330 kernel:  __x64_sys_finit_module+0x5e/0xb0
gen 04 18:01:34 D9330 kernel:  do_syscall_64+0x82/0x190
gen 04 18:01:34 D9330 kernel:  ? vfs_read+0x299/0x370
gen 04 18:01:34 D9330 kernel:  ? syscall_exit_to_user_mode+0x37/0x1c0
gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190
gen 04 18:01:34 D9330 kernel:  ? terminate_walk+0xee/0x100
gen 04 18:01:34 D9330 kernel:  ? path_openat+0x495/0x12e0
gen 04 18:01:34 D9330 kernel:  ? syscall_exit_to_user_mode+0x37/0x1c0
gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190
gen 04 18:01:34 D9330 kernel:  ? do_filp_open+0xc4/0x170
gen 04 18:01:34 D9330 kernel:  ? __pfx_page_put_link+0x10/0x10
gen 04 18:01:34 D9330 kernel:  ? do_sys_openat2+0x9c/0xe0
gen 04 18:01:34 D9330 kernel:  ? syscall_exit_to_user_mode+0x37/0x1c0
gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190
gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190
gen 04 18:01:34 D9330 kernel: entry_SYSCALL_64_after_hwframe+0x76/0x7e
gen 04 18:01:34 D9330 kernel: RIP: 0033:0x7ba0ea7e01fd
gen 04 18:01:34 D9330 kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 
90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 
8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 >
gen 04 18:01:34 D9330 kernel: RSP: 002b:00007ffe5dee8d58 EFLAGS: 
00000246 ORIG_RAX: 0000000000000139
gen 04 18:01:34 D9330 kernel: RAX: ffffffffffffffda RBX: 
00005f717b3029c0 RCX: 00007ba0ea7e01fd
gen 04 18:01:34 D9330 kernel: RDX: 0000000000000004 RSI: 
00007ba0e9fe305d RDI: 0000000000000031
gen 04 18:01:34 D9330 kernel: RBP: 00007ffe5dee8e10 R08: 
0000000000000001 R09: 00007ffe5dee8da0
gen 04 18:01:34 D9330 kernel: R10: 0000000000000040 R11: 
0000000000000246 R12: 00007ba0e9fe305d
gen 04 18:01:34 D9330 kernel: R13: 0000000000020000 R14: 
00005f717b303600 R15: 00005f717b304360
gen 04 18:01:34 D9330 kernel:  </TASK>
gen 04 18:01:34 D9330 kernel: ---[ end trace 0000000000000000 ]---
gen 04 18:01:34 D9330 kernel: event xe_bo_move has unsafe dereference of 
argument 4
gen 04 18:01:34 D9330 kernel: print_fmt: "move_lacks_source:%s, migrate 
object %p [size %zu] from %s to %s device_id:%s", REC->move_lacks_source 
? "yes" : "no", REC->bo, REC->size, xe_mem_>|

|
|

|Later I get this other one which I do not know if it is related to the 
previous one or not:|

|gen 04 18:01:45 D9330 kernel: ------------[ cut here ]------------
gen 04 18:01:45 D9330 kernel: WARNING: CPU: 7 PID: 139 at 
drivers/usb/typec/ucsi/ucsi.c:1361 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
gen 04 18:01:45 D9330 kernel: Modules linked in: fat kvm_intel 
snd_soc_core mei_vsc snd_compress spi_pxa2xx_platform intel_ishtp_hid 
iwlmvm dell_rbtn hid_multitouch dw_dmac ac97_bus moused>
gen 04 18:01:45 D9330 kernel:  processor_thermal_rapl cfg80211 ucsi_acpi 
soundcore mei_me intel_rapl_common intel_lpss_pci i2c_mux typec_ucsi 
thunderbolt intel_lpss mei processor_thermal_w>
gen 04 18:01:45 D9330 kernel:  video cec spi_intel nvme_auth i8042 wmi serio
gen 04 18:01:45 D9330 kernel: CPU: 7 UID: 0 PID: 139 Comm: kworker/7:1 
Tainted: G        W  OE      6.12.8-arch1-1 #1 
099de49ddaebb26408f097c48b36e50b2c8e21c9
gen 04 18:01:45 D9330 kernel: Tainted: [W]=WARN, [O]=OOT_MODULE, 
[E]=UNSIGNED_MODULE
gen 04 18:01:45 D9330 kernel: Hardware name: Dell Inc. Latitude 
9330/0RN079, BIOS 1.25.0 11/12/2024
gen 04 18:01:45 D9330 kernel: Workqueue: events_long ucsi_init_work 
[typec_ucsi]
gen 04 18:01:45 D9330 kernel: RIP: 0010:ucsi_reset_ppm+0x1b4/0x1c0 
[typec_ucsi]
gen 04 18:01:45 D9330 kernel: Code: 8b 44 24 04 a9 00 00 00 08 0f 85 36 
ff ff ff 4c 89 74 24 10 48 8b 05 cb be 59 cf 49 39 c5 79 8f bb 92 ff ff 
ff e9 1b ff ff ff <0f> 0b e9 50 ff ff ff e8 >
gen 04 18:01:45 D9330 kernel: RSP: 0018:ffffa9b9407bfda8 EFLAGS: 00010206
gen 04 18:01:45 D9330 kernel: RAX: 0000000008000000 RBX: 
0000000000000000 RCX: 0000000000000002
gen 04 18:01:45 D9330 kernel: RDX: 00000000fffeaba3 RSI: 
ffffa9b9407bfdac RDI: ffff9d92089d7800
gen 04 18:01:45 D9330 kernel: RBP: ffff9d92089d7800 R08: 
0000000000000000 R09: 0000000000000014
gen 04 18:01:45 D9330 kernel: R10: 0000000000000001 R11: 
0000000000000000 R12: ffffa9b9407bfdac
gen 04 18:01:45 D9330 kernel: R13: 00000000fffeaba0 R14: 
ffff9d92089d7860 R15: ffff9d92089d78c0
gen 04 18:01:45 D9330 kernel: FS:  0000000000000000(0000) 
GS:ffff9d957f780000(0000) knlGS:0000000000000000
gen 04 18:01:45 D9330 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
gen 04 18:01:45 D9330 kernel: CR2: 0000585143bba648 CR3: 
000000023a822000 CR4: 0000000000f50ef0
gen 04 18:01:45 D9330 kernel: PKRU: 55555554
gen 04 18:01:45 D9330 kernel: Call Trace:
gen 04 18:01:45 D9330 kernel:  <TASK>
gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi 
97866a6a8562a088cda45de0ae83658868b451bb]
gen 04 18:01:45 D9330 kernel:  ? __warn.cold+0x93/0xf6
gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi 
97866a6a8562a088cda45de0ae83658868b451bb]
gen 04 18:01:45 D9330 kernel:  ? report_bug+0xff/0x140
gen 04 18:01:45 D9330 kernel:  ? handle_bug+0x58/0x90
gen 04 18:01:45 D9330 kernel:  ? exc_invalid_op+0x17/0x70
gen 04 18:01:45 D9330 kernel:  ? asm_exc_invalid_op+0x1a/0x20
gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi 
97866a6a8562a088cda45de0ae83658868b451bb]
gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0xc6/0x1c0 [typec_ucsi 
97866a6a8562a088cda45de0ae83658868b451bb]
gen 04 18:01:45 D9330 kernel:  ucsi_init_work+0x3c/0xac0 [typec_ucsi 
97866a6a8562a088cda45de0ae83658868b451bb]
gen 04 18:01:45 D9330 kernel:  process_one_work+0x17b/0x330
gen 04 18:01:45 D9330 kernel:  worker_thread+0x2ce/0x3f0
gen 04 18:01:45 D9330 kernel:  ? __pfx_worker_thread+0x10/0x10
gen 04 18:01:45 D9330 kernel:  kthread+0xcf/0x100
gen 04 18:01:45 D9330 kernel:  ? __pfx_kthread+0x10/0x10
gen 04 18:01:45 D9330 kernel:  ret_from_fork+0x31/0x50
gen 04 18:01:45 D9330 kernel:  ? __pfx_kthread+0x10/0x10
gen 04 18:01:45 D9330 kernel:  ret_from_fork_asm+0x1a/0x30
gen 04 18:01:45 D9330 kernel:  </TASK>
gen 04 18:01:45 D9330 kernel: ---[ end trace 0000000000000000 ]---
|

|
|

|
|

--------------wZzrhPPMiv0B20Q0SRMDQ4PP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi to all, <br>
    </p>
    <p>I've just updated my archlinux to <code>6.12.8-arch1-1 and I
        still get the same issue:</code></p>
    <p><code>gen 04 18:01:34 D9330 kernel: ------------[ cut here
        ]------------<br>
        gen 04 18:01:34 D9330 kernel: WARNING: CPU: 2 PID: 209 at
        kernel/trace/trace_events.c:577 trace_event_raw_init+0x159/0x660<br>
        gen 04 18:01:34 D9330 kernel: Modules linked in: xe(+)
        drm_ttm_helper gpu_sched drm_suballoc_helper drm_gpuvm drm_exec
        uas usb_storage i915 i2c_algo_bit drm_buddy ttm serio_raw atkbd
        intel&gt;<br>
        gen 04 18:01:34 D9330 kernel: CPU: 2 UID: 0 PID: 209 Comm:
        (udev-worker) Not tainted 6.12.8-arch1-1 #1
        099de49ddaebb26408f097c48b36e50b2c8e21c9<br>
        gen 04 18:01:34 D9330 kernel: Hardware name: Dell Inc. Latitude
        9330/0RN079, BIOS 1.25.0 11/12/2024<br>
        gen 04 18:01:34 D9330 kernel: RIP:
        0010:trace_event_raw_init+0x159/0x660<br>
        gen 04 18:01:34 D9330 kernel: Code: 89 ea 0f 83 3b 04 00 00 e8
        44 db ff ff 84 c0 74 10 8b 0c 24 48 c7 c0 fe ff ff ff 48 d3 c0
        49 21 c6 4d 85 f6 0f 84 d6 fe ff ff &lt;0f&gt; 0b bb 01 00 00 00
        41 &gt;<br>
        gen 04 18:01:34 D9330 kernel: RSP: 0018:ffffa9b940987730 EFLAGS:
        00010206<br>
        gen 04 18:01:34 D9330 kernel: RAX: ffffffffffffffdf RBX:
        ffffffffc0ca4731 RCX: 0000000000000005<br>
        gen 04 18:01:34 D9330 kernel: RDX: 0000000000000002 RSI:
        0000000000000001 RDI: ffffffffc0ca4727<br>
        gen 04 18:01:34 D9330 kernel: RBP: ffffffffc0ca4640 R08:
        0000000000000039 R09: 0000000000000000<br>
        gen 04 18:01:34 D9330 kernel: R10: 0000000000000076 R11:
        000000000000004e R12: 00000000000000f2<br>
        gen 04 18:01:34 D9330 kernel: R13: ffffffffc0ca5760 R14:
        0000000000000018 R15: 0000000000000000<br>
        gen 04 18:01:34 D9330 kernel: FS:  00007ba0e9fe9880(0000)
        GS:ffff9d957f500000(0000) knlGS:0000000000000000<br>
        gen 04 18:01:34 D9330 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
        0000000080050033<br>
        gen 04 18:01:34 D9330 kernel: CR2: 00007ba0e9dac000 CR3:
        00000001019ac000 CR4: 0000000000f50ef0<br>
        gen 04 18:01:34 D9330 kernel: PKRU: 55555554<br>
        gen 04 18:01:34 D9330 kernel: Call Trace:<br>
        gen 04 18:01:34 D9330 kernel:  &lt;TASK&gt;<br>
        gen 04 18:01:34 D9330 kernel:  ?
        trace_event_raw_init+0x159/0x660<br>
        gen 04 18:01:34 D9330 kernel:  ? __warn.cold+0x93/0xf6<br>
        gen 04 18:01:34 D9330 kernel:  ?
        trace_event_raw_init+0x159/0x660<br>
        gen 04 18:01:34 D9330 kernel:  ? report_bug+0xff/0x140<br>
        gen 04 18:01:34 D9330 kernel:  ? handle_bug+0x58/0x90<br>
        gen 04 18:01:34 D9330 kernel:  ? exc_invalid_op+0x17/0x70<br>
        gen 04 18:01:34 D9330 kernel:  ? asm_exc_invalid_op+0x1a/0x20<br>
        gen 04 18:01:34 D9330 kernel:  ?
        trace_event_raw_init+0x159/0x660<br>
        gen 04 18:01:34 D9330 kernel:  event_init+0x28/0x70<br>
        gen 04 18:01:34 D9330 kernel:  trace_module_notify+0x1a4/0x260<br>
        gen 04 18:01:34 D9330 kernel:  notifier_call_chain+0x5a/0xd0<br>
        gen 04 18:01:34 D9330 kernel: 
        blocking_notifier_call_chain_robust+0x65/0xc0<br>
        gen 04 18:01:34 D9330 kernel:  load_module+0x1822/0x1cf0<br>
        gen 04 18:01:34 D9330 kernel:  ? vmap+0x83/0xe0<br>
        gen 04 18:01:34 D9330 kernel:  ?
        __vunmap_range_noflush+0x325/0x470<br>
        gen 04 18:01:34 D9330 kernel:  ? init_module_from_file+0x89/0xe0<br>
        gen 04 18:01:34 D9330 kernel:  init_module_from_file+0x89/0xe0<br>
        gen 04 18:01:34 D9330 kernel: 
        idempotent_init_module+0x11e/0x310<br>
        gen 04 18:01:34 D9330 kernel:  __x64_sys_finit_module+0x5e/0xb0<br>
        gen 04 18:01:34 D9330 kernel:  do_syscall_64+0x82/0x190<br>
        gen 04 18:01:34 D9330 kernel:  ? vfs_read+0x299/0x370<br>
        gen 04 18:01:34 D9330 kernel:  ?
        syscall_exit_to_user_mode+0x37/0x1c0<br>
        gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190<br>
        gen 04 18:01:34 D9330 kernel:  ? terminate_walk+0xee/0x100<br>
        gen 04 18:01:34 D9330 kernel:  ? path_openat+0x495/0x12e0<br>
        gen 04 18:01:34 D9330 kernel:  ?
        syscall_exit_to_user_mode+0x37/0x1c0<br>
        gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190<br>
        gen 04 18:01:34 D9330 kernel:  ? do_filp_open+0xc4/0x170<br>
        gen 04 18:01:34 D9330 kernel:  ? __pfx_page_put_link+0x10/0x10<br>
        gen 04 18:01:34 D9330 kernel:  ? do_sys_openat2+0x9c/0xe0<br>
        gen 04 18:01:34 D9330 kernel:  ?
        syscall_exit_to_user_mode+0x37/0x1c0<br>
        gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190<br>
        gen 04 18:01:34 D9330 kernel:  ? do_syscall_64+0x8e/0x190<br>
        gen 04 18:01:34 D9330 kernel: 
        entry_SYSCALL_64_after_hwframe+0x76/0x7e<br>
        gen 04 18:01:34 D9330 kernel: RIP: 0033:0x7ba0ea7e01fd<br>
        gen 04 18:01:34 D9330 kernel: Code: ff c3 66 2e 0f 1f 84 00 00
        00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d
        89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73
        01 &gt;<br>
        gen 04 18:01:34 D9330 kernel: RSP: 002b:00007ffe5dee8d58 EFLAGS:
        00000246 ORIG_RAX: 0000000000000139<br>
        gen 04 18:01:34 D9330 kernel: RAX: ffffffffffffffda RBX:
        00005f717b3029c0 RCX: 00007ba0ea7e01fd<br>
        gen 04 18:01:34 D9330 kernel: RDX: 0000000000000004 RSI:
        00007ba0e9fe305d RDI: 0000000000000031<br>
        gen 04 18:01:34 D9330 kernel: RBP: 00007ffe5dee8e10 R08:
        0000000000000001 R09: 00007ffe5dee8da0<br>
        gen 04 18:01:34 D9330 kernel: R10: 0000000000000040 R11:
        0000000000000246 R12: 00007ba0e9fe305d<br>
        gen 04 18:01:34 D9330 kernel: R13: 0000000000020000 R14:
        00005f717b303600 R15: 00005f717b304360<br>
        gen 04 18:01:34 D9330 kernel:  &lt;/TASK&gt;<br>
        gen 04 18:01:34 D9330 kernel: ---[ end trace 0000000000000000
        ]---<br>
        gen 04 18:01:34 D9330 kernel: event xe_bo_move has unsafe
        dereference of argument 4<br>
        gen 04 18:01:34 D9330 kernel: print_fmt: "move_lacks_source:%s,
        migrate object %p [size %zu] from %s to %s device_id:%s",
        REC-&gt;move_lacks_source ? "yes" : "no", REC-&gt;bo,
        REC-&gt;size, xe_mem_&gt;</code></p>
    <p><code><br>
      </code></p>
    <p><code>Later I get this other one which I do not know if it is
        related to the previous one or not:</code></p>
    <p><code>gen 04 18:01:45 D9330 kernel: ------------[ cut here
        ]------------<br>
        gen 04 18:01:45 D9330 kernel: WARNING: CPU: 7 PID: 139 at
        drivers/usb/typec/ucsi/ucsi.c:1361 ucsi_reset_ppm+0x1b4/0x1c0
        [typec_ucsi]<br>
        gen 04 18:01:45 D9330 kernel: Modules linked in: fat kvm_intel
        snd_soc_core mei_vsc snd_compress spi_pxa2xx_platform
        intel_ishtp_hid iwlmvm dell_rbtn hid_multitouch dw_dmac ac97_bus
        moused&gt;<br>
        gen 04 18:01:45 D9330 kernel:  processor_thermal_rapl cfg80211
        ucsi_acpi soundcore mei_me intel_rapl_common intel_lpss_pci
        i2c_mux typec_ucsi thunderbolt intel_lpss mei
        processor_thermal_w&gt;<br>
        gen 04 18:01:45 D9330 kernel:  video cec spi_intel nvme_auth
        i8042 wmi serio<br>
        gen 04 18:01:45 D9330 kernel: CPU: 7 UID: 0 PID: 139 Comm:
        kworker/7:1 Tainted: G        W  OE      6.12.8-arch1-1 #1
        099de49ddaebb26408f097c48b36e50b2c8e21c9<br>
        gen 04 18:01:45 D9330 kernel: Tainted: [W]=WARN, [O]=OOT_MODULE,
        [E]=UNSIGNED_MODULE<br>
        gen 04 18:01:45 D9330 kernel: Hardware name: Dell Inc. Latitude
        9330/0RN079, BIOS 1.25.0 11/12/2024<br>
        gen 04 18:01:45 D9330 kernel: Workqueue: events_long
        ucsi_init_work [typec_ucsi]<br>
        gen 04 18:01:45 D9330 kernel: RIP:
        0010:ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]<br>
        gen 04 18:01:45 D9330 kernel: Code: 8b 44 24 04 a9 00 00 00 08
        0f 85 36 ff ff ff 4c 89 74 24 10 48 8b 05 cb be 59 cf 49 39 c5
        79 8f bb 92 ff ff ff e9 1b ff ff ff &lt;0f&gt; 0b e9 50 ff ff ff
        e8 &gt;<br>
        gen 04 18:01:45 D9330 kernel: RSP: 0018:ffffa9b9407bfda8 EFLAGS:
        00010206<br>
        gen 04 18:01:45 D9330 kernel: RAX: 0000000008000000 RBX:
        0000000000000000 RCX: 0000000000000002<br>
        gen 04 18:01:45 D9330 kernel: RDX: 00000000fffeaba3 RSI:
        ffffa9b9407bfdac RDI: ffff9d92089d7800<br>
        gen 04 18:01:45 D9330 kernel: RBP: ffff9d92089d7800 R08:
        0000000000000000 R09: 0000000000000014<br>
        gen 04 18:01:45 D9330 kernel: R10: 0000000000000001 R11:
        0000000000000000 R12: ffffa9b9407bfdac<br>
        gen 04 18:01:45 D9330 kernel: R13: 00000000fffeaba0 R14:
        ffff9d92089d7860 R15: ffff9d92089d78c0<br>
        gen 04 18:01:45 D9330 kernel: FS:  0000000000000000(0000)
        GS:ffff9d957f780000(0000) knlGS:0000000000000000<br>
        gen 04 18:01:45 D9330 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
        0000000080050033<br>
        gen 04 18:01:45 D9330 kernel: CR2: 0000585143bba648 CR3:
        000000023a822000 CR4: 0000000000f50ef0<br>
        gen 04 18:01:45 D9330 kernel: PKRU: 55555554<br>
        gen 04 18:01:45 D9330 kernel: Call Trace:<br>
        gen 04 18:01:45 D9330 kernel:  &lt;TASK&gt;<br>
        gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0
        [typec_ucsi 97866a6a8562a088cda45de0ae83658868b451bb]<br>
        gen 04 18:01:45 D9330 kernel:  ? __warn.cold+0x93/0xf6<br>
        gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0
        [typec_ucsi 97866a6a8562a088cda45de0ae83658868b451bb]<br>
        gen 04 18:01:45 D9330 kernel:  ? report_bug+0xff/0x140<br>
        gen 04 18:01:45 D9330 kernel:  ? handle_bug+0x58/0x90<br>
        gen 04 18:01:45 D9330 kernel:  ? exc_invalid_op+0x17/0x70<br>
        gen 04 18:01:45 D9330 kernel:  ? asm_exc_invalid_op+0x1a/0x20<br>
        gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0x1b4/0x1c0
        [typec_ucsi 97866a6a8562a088cda45de0ae83658868b451bb]<br>
        gen 04 18:01:45 D9330 kernel:  ? ucsi_reset_ppm+0xc6/0x1c0
        [typec_ucsi 97866a6a8562a088cda45de0ae83658868b451bb]<br>
        gen 04 18:01:45 D9330 kernel:  ucsi_init_work+0x3c/0xac0
        [typec_ucsi 97866a6a8562a088cda45de0ae83658868b451bb]<br>
        gen 04 18:01:45 D9330 kernel:  process_one_work+0x17b/0x330<br>
        gen 04 18:01:45 D9330 kernel:  worker_thread+0x2ce/0x3f0<br>
        gen 04 18:01:45 D9330 kernel:  ? __pfx_worker_thread+0x10/0x10<br>
        gen 04 18:01:45 D9330 kernel:  kthread+0xcf/0x100<br>
        gen 04 18:01:45 D9330 kernel:  ? __pfx_kthread+0x10/0x10<br>
        gen 04 18:01:45 D9330 kernel:  ret_from_fork+0x31/0x50<br>
        gen 04 18:01:45 D9330 kernel:  ? __pfx_kthread+0x10/0x10<br>
        gen 04 18:01:45 D9330 kernel:  ret_from_fork_asm+0x1a/0x30<br>
        gen 04 18:01:45 D9330 kernel:  &lt;/TASK&gt;<br>
        gen 04 18:01:45 D9330 kernel: ---[ end trace 0000000000000000
        ]---<br>
      </code></p>
    <p><code><br>
      </code></p>
    <p><code><br>
      </code></p>
  </body>
</html>

--------------wZzrhPPMiv0B20Q0SRMDQ4PP--
