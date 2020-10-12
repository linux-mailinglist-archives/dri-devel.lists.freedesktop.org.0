Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CDC28C419
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 23:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B4A6E7DC;
	Mon, 12 Oct 2020 21:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35AF6E7DA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602538233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByWRY92fMU4wBwTlNUv/ZSHauYCNih98DAlLxy56we8=;
 b=IwFktQsp5U3ySffv0kPJyPC0frl1TpZI+e/g05IXYUAV689C+Dkdh8PRLKZ5oj71BG1j7r
 a92BGKhk/qHD9bAeTJxrOe+MarHIulCosaC3p3KkHrmOcvZdGKp7NQWhJ1Ez7FXEnRTRHw
 Q/NtnaC54fkfp5W64stJuibzP9k8Pcw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-ZjmT5P8uPG6vTVXYV_m77Q-1; Mon, 12 Oct 2020 17:30:29 -0400
X-MC-Unique: ZjmT5P8uPG6vTVXYV_m77Q-1
Received: by mail-qv1-f72.google.com with SMTP id s1so2625822qvq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ByWRY92fMU4wBwTlNUv/ZSHauYCNih98DAlLxy56we8=;
 b=B6lDzVgwOEWlMHTU1MLCjcA73NZqY3n/b2lVJKgdXPvCip/nNQ0mTXX1zbQQ7iQtTR
 NjnZk9rqy92ljKxqPoILvkFsRg+5OkZU0UUhlbhQoiNWW/WiiMb0xrkRhwKeRGyop2AV
 rketujHXIHDQb/NXMnUMPuEE3weoGhRfGyZFZpo5orQdvisFAuI6TrLUQk92ml3+ffiP
 QK8PXulFP8Jp4U4rVhestG21RZcr5DEmxU4jQGDswUbzpZUb203fnTtIm3FmvEZxvLiG
 TV9YqVK8xi0TjgZXe1n3ipsQ/XyM0uz4o77Tapp47kY0tD7GPEnz0D9Pjcs44f/25Fqy
 bTxg==
X-Gm-Message-State: AOAM5313Xf8RbJv8Wyg+Mvg+IDZYaTsv/XXLhjjvBDcIjINpJk7d4PAj
 rx3ubppBk4ONsagUSK7G7BFAeUb3FLEh6Q77DQTRYNfBR+I69pRzCZRXrdCg0JqaIv9XfYWNN6f
 gauh6dra+oPENWpxSQC/oexH82T+J
X-Received: by 2002:ac8:688b:: with SMTP id m11mr10029818qtq.177.1602538227932; 
 Mon, 12 Oct 2020 14:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoukR4gOSKG0pB8NrTDZ6vlc5dVaB6114hAedoRjjDKdoxqGAq1cbkVhXL29kXiz09KM6G1w==
X-Received: by 2002:ac8:688b:: with SMTP id m11mr10029803qtq.177.1602538227505; 
 Mon, 12 Oct 2020 14:30:27 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y125sm12791634qkb.114.2020.10.12.14.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 14:30:26 -0700 (PDT)
Message-ID: <842b9325bc232a1333f58788d538684f4738fc6a.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms: Fix NULL pointer dereference in
 nouveau_connector_detect_depth
From: Lyude Paul <lyude@redhat.com>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>, bskeggs@redhat.com
Date: Mon, 12 Oct 2020 17:30:25 -0400
In-Reply-To: <20201009181120.2360-1-alexander.kapshuk@gmail.com>
References: <20201009181120.2360-1-alexander.kapshuk@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! Thanks for the catch, just one comment down below

On Fri, 2020-10-09 at 21:11 +0300, Alexander Kapshuk wrote:
> This oops manifests itself on the following hardware:
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce G 103M]
> (rev a1)
> 
> Oct 09 14:17:46 lp-sasha kernel: BUG: kernel NULL pointer dereference,
> address: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: #PF: supervisor read access in kernel mode
> Oct 09 14:17:46 lp-sasha kernel: #PF: error_code(0x0000) - not-present page
> Oct 09 14:17:46 lp-sasha kernel: PGD 0 P4D 0
> Oct 09 14:17:46 lp-sasha kernel: Oops: 0000 [#1] SMP PTI
> Oct 09 14:17:46 lp-sasha kernel: CPU: 1 PID: 191 Comm: systemd-udevd Not
> tainted 5.9.0-rc8-next-20201009 #38
> Oct 09 14:17:46 lp-sasha kernel: Hardware name: Hewlett-Packard Compaq
> Presario CQ61 Notebook PC/306A, BIOS F.03 03/23/2009
> Oct 09 14:17:46 lp-sasha kernel: RIP:
> 0010:nouveau_connector_detect_depth+0x71/0xc0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00
> 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10
> 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
> Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010297
> Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4000
> RCX: ffff8880369d3000
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000000
> RDI: ffff8880369d4000
> Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da298
> R09: ffffffff8226201a
> Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84ff8
> R12: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002000
> R15: 0000000000000003
> Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000)
> GS:ffff8880bc900000(0000) knlGS:0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976000
> CR4: 00000000000006e0
> Oct 09 14:17:46 lp-sasha kernel: Call Trace:
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_connector_get_modes+0x1e6/0x240
> [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  ? kfree+0xb9/0x240
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_connector_list_iter_next+0x7c/0xa0
> Oct 09 14:17:46 lp-sasha
> kernel:  drm_helper_probe_single_connector_modes+0x1ba/0x7c0
> Oct 09 14:17:46 lp-sasha kernel:  drm_client_modeset_probe+0x27e/0x1360
> Oct 09 14:17:46 lp-sasha kernel:  ? nvif_object_sclass_put+0xc/0x20 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_cli_init+0x3cc/0x440 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  ? ktime_get_mono_fast_ns+0x49/0xa0
> Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_drm_open+0x4e/0x180 [nouveau]
> Oct 09 14:17:46 lp-sasha
> kernel:  __drm_fb_helper_initial_config_and_unlock+0x3f/0x4a0
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_file_alloc+0x18f/0x260
> Oct 09 14:17:46 lp-sasha kernel:  ? mutex_lock+0x9/0x40
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_client_init+0x110/0x160
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_fbcon_init+0x14d/0x1c0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_device_init+0x1c0/0x880
> [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_probe+0x11a/0x1e0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  pci_device_probe+0xcd/0x140
> Oct 09 14:17:46 lp-sasha kernel:  really_probe+0xd8/0x400
> Oct 09 14:17:46 lp-sasha kernel:  driver_probe_device+0x4a/0xa0
> Oct 09 14:17:46 lp-sasha kernel:  device_driver_attach+0x9c/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  __driver_attach+0x6f/0x100
> Oct 09 14:17:46 lp-sasha kernel:  ? device_driver_attach+0xc0/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  bus_for_each_dev+0x75/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  bus_add_driver+0x106/0x1c0
> Oct 09 14:17:46 lp-sasha kernel:  driver_register+0x86/0xe0
> Oct 09 14:17:46 lp-sasha kernel:  ? 0xffffffffa044e000
> Oct 09 14:17:46 lp-sasha kernel:  do_one_initcall+0x48/0x1e0
> Oct 09 14:17:46 lp-sasha kernel:  ? _cond_resched+0x11/0x60
> Oct 09 14:17:46 lp-sasha kernel:  ? kmem_cache_alloc_trace+0x19c/0x1e0
> Oct 09 14:17:46 lp-sasha kernel:  do_init_module+0x57/0x220
> Oct 09 14:17:46 lp-sasha kernel:  __do_sys_finit_module+0xa0/0xe0
> Oct 09 14:17:46 lp-sasha kernel:  do_syscall_64+0x33/0x40
> Oct 09 14:17:46 lp-sasha kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> Oct 09 14:17:46 lp-sasha kernel: RIP: 0033:0x7fd01a060d5d
> Oct 09 14:17:46 lp-sasha kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90
> f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64 89 01 48
> Oct 09 14:17:46 lp-sasha kernel: RSP: 002b:00007ffc8ad38a98 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> Oct 09 14:17:46 lp-sasha kernel: RAX: ffffffffffffffda RBX: 0000563f6e7fd530
> RCX: 00007fd01a060d5d
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000000 RSI: 00007fd01a19f95d
> RDI: 000000000000000f
> Oct 09 14:17:46 lp-sasha kernel: RBP: 0000000000020000 R08: 0000000000000000
> R09: 0000000000000007
> Oct 09 14:17:46 lp-sasha kernel: R10: 000000000000000f R11: 0000000000000246
> R12: 00007fd01a19f95d
> Oct 09 14:17:46 lp-sasha kernel: R13: 0000000000000000 R14: 0000563f6e7fbc10
> R15: 0000563f6e7fd530
> Oct 09 14:17:46 lp-sasha kernel: Modules linked in: nouveau(+) ttm xt_string
> xt_mark xt_LOG vgem v4l2_dv_timings uvcvideo ulpi udf ts_kmp ts_fsm ts_bm
> snd_aloop sil164 qat_dh895xccvf nf_nat_sip nf_nat_irc nf_nat_ftp nf_nat
> nf_log_ipv6 nf_log_ipv4 nf_log_common ltc2990 lcd intel_qat input_leds i2c_mux
> gspca_main videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
> videodev mc drivetemp cuse fuse crc_itu_t coretemp ch7006 ath5k ath algif_hash
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: ---[ end trace 0ddafe218ad30017 ]---
> Oct 09 14:17:46 lp-sasha kernel: RIP:
> 0010:nouveau_connector_detect_depth+0x71/0xc0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00
> 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10
> 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
> Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010297
> Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4000
> RCX: ffff8880369d3000
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000000
> RDI: ffff8880369d4000
> Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da298
> R09: ffffffff8226201a
> Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84ff8
> R12: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002000
> R15: 0000000000000003
> Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000)
> GS:ffff8880bc900000(0000) knlGS:0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976000
> CR4: 00000000000006e0
> 
> The disassembly:
> Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00 06 00 00 00 80 b9 4d 0a 00 00 00
> 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14
> 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
> All code
> ========
>    0:   0a 00                   or     (%rax),%al
>    2:   00 48 8b                add    %cl,-0x75(%rax)
>    5:   49                      rex.WB
>    6:   48 c7 87 b8 00 00 00    movq   $0x6,0xb8(%rdi)
>    d:   06 00 00 00
>   11:   80 b9 4d 0a 00 00 00    cmpb   $0x0,0xa4d(%rcx)
>   18:   75 1e                   jne    0x38
>   1a:   83 fa 41                cmp    $0x41,%edx
>   1d:   75 05                   jne    0x24
>   1f:   48 85 c0                test   %rax,%rax
>   22:   75 29                   jne    0x4d
>   24:   8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
>   2a:*  39 06                   cmp    %eax,(%rsi)              <-- trapping
> instruction
>   2c:   7c 25                   jl     0x53
>   2e:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>   35:   75 b7                   jne    0xffffffffffffffee
>   37:   c3                      retq
>   38:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
>   3f:   75                      .byte 0x75
> 
> Code starting with the faulting instruction
> ===========================================
>    0:   39 06                   cmp    %eax,(%rsi)
>    2:   7c 25                   jl     0x29
>    4:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>    b:   75 b7                   jne    0xffffffffffffffc4
>    d:   c3                      retq
>    e:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
>   15:   75                      .byte 0x75
> 
> objdump -SF --disassemble=nouveau_connector_detect_depth
> [...]
>         if (nv_connector->edid &&
>    c85e1:       83 fa 41                cmp    $0x41,%edx
>    c85e4:       75 05                   jne    c85eb
> <nouveau_connector_detect_depth+0x6b> (File Offset: 0xc866b)
>    c85e6:       48 85 c0                test   %rax,%rax
>    c85e9:       75 29                   jne    c8614
> <nouveau_connector_detect_depth+0x94> (File Offset: 0xc8694)
>             nv_connector->type == DCB_CONNECTOR_LVDS_SPWG)
>                 duallink = ((u8 *)nv_connector->edid)[121] == 2;
>         else
>                 duallink = mode->clock >= bios->fp.duallink_transition_clk;
> 
>         if ((!duallink && (bios->fp.strapless_is_24bit & 1)) ||
>    c85eb:       8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
>    c85f1:       39 06                   cmp    %eax,(%rsi)
>    c85f3:       7c 25                   jl     c861a
> <nouveau_connector_detect_depth+0x9a> (File Offset: 0xc869a)
>             ( duallink && (bios->fp.strapless_is_24bit & 2)))
>    c85f5:       f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>    c85fc:       75 b7                   jne    c85b5
> <nouveau_connector_detect_depth+0x35> (File Offset: 0xc8635)
>                 connector->display_info.bpc = 8;
> [...]
> 
> % scripts/faddr2line /lib/modules/5.9.0-rc8-next-
> 20201009/kernel/drivers/gpu/drm/nouveau/nouveau.ko
> nouveau_connector_detect_depth+0x71/0xc0
> nouveau_connector_detect_depth+0x71/0xc0:
> nouveau_connector_detect_depth at /home/sasha/linux-
> next/drivers/gpu/drm/nouveau/nouveau_connector.c:891
> 
> It is actually line 889. See the disassembly above.
> 889                     duallink = mode->clock >= bios-
> >fp.duallink_transition_clk;
> 
> The NULL pointer being dereferenced is mode.
> 
> Git bisect has identified the following commit as bad:
> f28e32d3906e drm/nouveau/kms: Don't change EDID when it hasn't actually
> changed
> 
> Here is the chain of events that causes the oops.
> On entry to nouveau_connector_detect_lvds, edid is set to NULL.
> The call to nouveau_connector_detect sets nv_connector->edid to valid
> memory, with status being set to connector_status_connected and the flow
> of execution branching to the out label.
> 
> The subsequent call to nouveau_connector_set_edid erronously clears
> nv_connector->edid, via the local edid pointer which remains set to NULL.
> 
> Fix this by setting edid to the value of the just acquired
> nv_connector->edid and call nouveau_connector_set_edid in the out label
> only if nv_connector->edid and edid point to different memory addresses
> thus preventing nv_connector->edid from being turned into a dangling
> pointer.
> 
> Fixes: f28e32d3906e ("drm/nouveau/kms: Don't change EDID when it hasn't
> actually changed")
> Signed-off-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 49dd0cbc332f..a3f53d2ac86e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -669,8 +669,10 @@ nouveau_connector_detect_lvds(struct drm_connector
> *connector, bool force)
>  	/* Try retrieving EDID via DDC */
>  	if (!drm->vbios.fp_no_ddc) {
>  		status = nouveau_connector_detect(connector, force);
> -		if (status == connector_status_connected)
> +		if (status == connector_status_connected) {
> +			edid = nv_connector->edid;
>  			goto out;
> +		}
>  	}
> 
>  	/* On some laptops (Sony, i'm looking at you) there appears to
> @@ -720,7 +722,8 @@ nouveau_connector_detect_lvds(struct drm_connector
> *connector, bool force)
>  		status = connector_status_unknown;
>  #endif
> 
> -	nouveau_connector_set_edid(nv_connector, edid);
> +	if (nv_connector->edid != edid)
> +		nouveau_connector_set_edid(nv_connector, edid);

Could we just update nouveau_connector_set_edid() to do the (nv_connector->edid
!= edid) check instead of open coding it here?

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>
>  	nouveau_connector_set_encoder(connector, nv_encoder);
>  	return status;
>  }
> --
> 2.28.0
> 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
