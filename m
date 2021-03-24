Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47019348272
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7EF6EA86;
	Wed, 24 Mar 2021 20:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EAE6EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:00:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D670B61A1F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616616058;
 bh=SNaaIjNUwoNq1ZpANwIo2xS73IycNSErahkJOfb6X44=;
 h=From:To:Subject:Date:From;
 b=NQdtOmUAw6vVxB0EW7rxrSqfA2oXHDZA9OYHLKOjedqNPZ9Sv4QZUEVPtSwPCW3b4
 PC8Mm+JcxMSrKGhYMVLZ8f91avIsIT4AB0zmEdDiZ9Myo2mJ53NiI7K+cmecg4fRXn
 FvwD+LjuMk3xNj6dgAAErX+RRTzqELyQ47qKEZq25Cf2KhgGhRDe+KYtf7ba0nOhK6
 hdr4pQxs82GBMiZjXT2GSbdMlCUqDwLRReqhHkaG1ZafaFTVPskMDHRPCXIm0mnBUB
 y1beboDXvLJhDQY0e+4Mc5Pe2yNHT9oAEhDZEQXZZYLDnFGeCrM2PlvlLtowJS4Xvi
 kixvKcSc14oNw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D03DC62AC1; Wed, 24 Mar 2021 20:00:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212425] New: Kernel warning at drivers/gpu/drm/ttm/ttm_bo.c:517
Date: Wed, 24 Mar 2021 20:00:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: custos.mentis@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212425-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212425

            Bug ID: 212425
           Summary: Kernel warning at drivers/gpu/drm/ttm/ttm_bo.c:517
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.9
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: custos.mentis@gmail.com
        Regression: No

After installing today's release of kernel 5.11.9 I am getting a bunch of
kernel warnings like:

 [   70.902471] WARNING: CPU: 6 PID: 2147 at drivers/gpu/drm/ttm/ttm_bo.c:517
ttm_bo_release+0x2b1/0x300
[   70.902481] Modules linked in: nls_iso8859_2 nls_cp852 vfat fat uinput
ipt_REJECT nf_reject_ipv4 iptable_filter ip_tables ip6t_REJECT nf_reject_ipv6
xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
ip6table_filter ip6_tables x_tables kvm_amd kvm pcspkr irqbypass sp5100_tco
snd_hda_codec_realtek snd_hda_codec_hdmi snd_hda_codec_generic ledtrig_audio
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm
snd_timer lm92 lm63 it87 hwmon_vid fam15h_power nfsd k10temp auth_rpcgss fuse
oid_registry lockd grace hid_logitech_hidpp hid_logitech_dj hid_generic sr_mod
cdrom sd_mod megaraid_sas 8250 8250_base serial_core usbhid sunrpc dm_mod dax
[   70.902541] CPU: 6 PID: 2147 Comm: kmail Tainted: G        W        
5.11.9-acrux #9
[   70.902554] Hardware name: To be filled by O.E.M. To be filled by
O.E.M./SABERTOOTH 990FX R2.0, BIOS 2901 05/04/2016
[   70.902556] RIP: 0010:ttm_bo_release+0x2b1/0x300
[   70.902559] Code: e8 74 2b 2f 00 e9 d9 fd ff ff 48 8b 7d 88 b9 30 75 00 00
31 d2 be 01 00 00 00 e8 3a 52 2f 00 48 8b 45 d8 eb 9d 4c 89 e0 eb 98 <0f> 0b c7
85 9c 00 00 00 00 00 00 00 4c 89 ef e8 4b f2 ff ff 48 8d
[   70.902561] RSP: 0018:ffffaf4a83313bb8 EFLAGS: 00010202
[   70.902566] RAX: 0000000000000001 RBX: ffff961b7553c500 RCX:
0000000000000008
[   70.902568] RDX: 0000000000000001 RSI: 0000000000000246 RDI:
ffffffffa1db5248
[   70.902570] RBP: ffff961b7553c570 R08: ffff961ba14f7a38 R09:
ffff9621dedaa3f8
[   70.902571] R10: ffff961ac60c1250 R11: ffff961ac60c1240 R12:
ffff961ac5fe5588
[   70.902572] R13: ffff961b7553c400 R14: 0000000000000000 R15:
ffff961ac5fe5f48
[   70.902573] FS:  00007ff78c2f5f00(0000) GS:ffff9621ded80000(0000)
knlGS:0000000000000000
[   70.902575] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.902576] CR2: 00007ff691820000 CR3: 0000000203d5d000 CR4:
00000000000406e0
[   70.902578] Call Trace:
[   70.902580]  ttm_bo_move_accel_cleanup+0x19d/0x398
[   70.902583]  amdgpu_bo_move+0x15c/0x698
[   70.902586]  ? amdgpu_vram_mgr_new+0x373/0x3d8
[   70.902587]  ttm_bo_handle_move_mem+0x8c/0x170
[   70.902590]  ttm_bo_validate+0x147/0x178
[   70.902592]  amdgpu_bo_fault_reserve_notify+0xbf/0x148
[   70.902594]  amdgpu_ttm_fault+0x33/0x80
[   70.902596]  __do_fault+0x33/0x90
[   70.902599]  handle_mm_fault+0xdff/0x1498
[   70.902601]  exc_page_fault+0x1a5/0x500
[   70.902604]  ? exit_to_user_mode_prepare+0x5d/0x118
[   70.902607]  ? asm_exc_page_fault+0x8/0x30
[   70.902609]  asm_exc_page_fault+0x1e/0x30
[   70.902611] RIP: 0033:0x7ff78d8f290d
[   70.902612] Code: 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 6f 46 bc f3
0f 6f 4e cc 4c 8b 4e dc 4c 8b 56 e4 4c 8b 5e ec 48 8b 4e f4 8b 56 fc <f3> 0f 7f
47 bc f3 0f 7f 4f cc 4c 89 4f dc 4c 89 57 e4 4c 89 5f ec
[   70.902614] RSP: 002b:00007ffdbd5bb838 EFLAGS: 00010207
[   70.902616] RAX: 00007ff691820000 RBX: 0000000000000044 RCX:
3f80000000000000
[   70.902617] RDX: 0000000000000000 RSI: 000055d1049acad4 RDI:
00007ff691820044
[   70.902618] RBP: 000055d1049aca90 R08: 000055d103fd9a30 R09:
0000000000000000
[   70.902619] R10: 000000003f800000 R11: 3f800000bf800000 R12:
0000000000000000
[   70.902620] R13: 000055d103f58320 R14: 0000000000000000 R15:
0000000000000044

Apparently the warnings show after commit      
7d09e9725b5dcc8d14e101de931e4969d033a6ad, which explains that the warning is
triggered by "very likely a driver bug".

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
