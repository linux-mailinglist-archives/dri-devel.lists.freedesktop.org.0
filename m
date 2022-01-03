Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A1F482DA5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 04:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7053289D53;
	Mon,  3 Jan 2022 03:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3F89D53
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:41:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC68DB80AC6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90F49C36AED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 03:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641181277;
 bh=jLRfNFSTGWjuFullclJ3NrUPL/KgA8Ja5S76Vufxy00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S7kuiEftwOGzXu4UvW/RN7+sHX2y/Xmxk17921aaWPs0uFGbNqywYV56EPZtc+6XF
 vRmUk1IEf1aw39j4RW9IKpp/b0scUeN69EnIb3RwL4hhfzdGxKFx5apNHKhoT+4VQe
 skkXCS9wb+qAEIjiE/PcqqDi77SGx0q2Bbh7u4MTq6qOMGgAQNhbGdgF6dVfpWDhMo
 bQKkiCqYVTb5iigA9zHWZOr+B4n5WzEtTuALlzi84PgQdeu4SuaauBfPz0/zsoA2qU
 gF1uq8wLFgmVBVu9q804UGQxcM52X3XR1FCYj6f9y0WeMRbNl4sVoFu9odHVb1jKNt
 NhYUsddRaIidQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76DEDC05FCB; Mon,  3 Jan 2022 03:41:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] UBSAN: invalid-load in amdgpu_dm.c:5882:84 - load of
 value 32 is not a valid value for type '_Bool'
Date: Mon, 03 Jan 2022 03:41:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.pylypenko107@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215445-2300-OIBFDSFGNr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

--- Comment #2 from Bogdan (bogdan.pylypenko107@gmail.com) ---
> [    7.729181]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [    7.729183] UBSAN: invalid-load in
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5882:84
> [    7.729185] load of value 32 is not a valid value for type '_Bool'
> [    7.729186] CPU: 5 PID: 4803 Comm: systemd-udevd Tainted: G           =
O=20=20=20
>   5.15.12-gentoo-x86_64 #11
> [    7.729188] Hardware name: HP HP Pavilion Gaming Laptop 15-ec1xxx/87B1,
> BIOS F.20 11/04/2020
> [    7.729190] Call Trace:
> [    7.729192]  <TASK>
> [    7.729193]  dump_stack_lvl+0x45/0x59
> [    7.729200]  ubsan_epilogue+0x5/0x40
> [    7.729202]  __ubsan_handle_load_invalid_value.cold+0x43/0x48
> [    7.729204]  create_stream_for_sink.cold+0x3a/0x7d [amdgpu]
> [    7.729387]  create_validate_stream_for_sink+0x55/0x140 [amdgpu]
> [    7.729537]  amdgpu_dm_connector_mode_valid+0x4f/0x180 [amdgpu]
> [    7.729678]  drm_connector_mode_valid+0x35/0x80
> [    7.729682]  drm_helper_probe_single_connector_modes+0x3b2/0x880
> [    7.729684]  drm_client_modeset_probe+0x287/0x1380
> [    7.729686]  ? kmem_cache_alloc_trace+0x17d/0x380
> [    7.729689]  ? trace_hardirqs_on+0x2b/0x100
> [    7.729692]  ? ktime_get_mono_fast_ns+0x49/0xc0
> [    7.729694]  __drm_fb_helper_initial_config_and_unlock+0x44/0x500
> [    7.729696]  ? drm_file_alloc+0x199/0x280
> [    7.729698]  ? drm_client_init+0x12e/0x180
> [    7.729700]  amdgpu_fbdev_init+0xd6/0x140 [amdgpu]
> [    7.729749]  amdgpu_device_init.cold+0xfc0/0x1b4c [amdgpu]
> [    7.729749]  ? _raw_spin_unlock_irqrestore+0x15/0x40
> [    7.729749]  ? pci_conf1_read+0x99/0x100
> [    7.729749]  ? pci_bus_read_config_word+0x49/0x80
> [    7.729749]  amdgpu_driver_load_kms+0x67/0x340 [amdgpu]
> [    7.729749]  amdgpu_pci_probe+0x113/0x1c0 [amdgpu]
> [    7.729749]  pci_device_probe+0xe1/0x180
> [    7.729749]  really_probe+0x207/0x400
> [    7.729749]  __driver_probe_device+0x10d/0x1c0
> [    7.729749]  driver_probe_device+0x1e/0xc0
> [    7.729749]  __driver_attach+0xce/0x200
> [    7.729749]  ? __device_attach_driver+0x100/0x100
> [    7.729749]  bus_for_each_dev+0x78/0xc0
> [    7.729749]  bus_add_driver+0x12b/0x200
> [    7.729749]  driver_register+0x8f/0x100
> [    7.729749]  ? 0xffffffffc0d84000
> [    7.729749]  do_one_initcall+0x44/0x240
> [    7.729749]  ? kmem_cache_alloc_trace+0x17d/0x380
> [    7.729749]  do_init_module+0x87/0x280
> [    7.729749]  __do_sys_init_module+0x12d/0x1c0
> [    7.729749]  do_syscall_64+0x5c/0xc0
> [    7.729749]  ? trace_hardirqs_on_prepare+0x24/0xc0
> [    7.729749]  ? syscall_exit_to_user_mode+0x2c/0x80
> [    7.729749]  ? do_syscall_64+0x69/0xc0
> [    7.729749]  ? trace_hardirqs_on_prepare+0x24/0xc0
> [    7.729749]  ? syscall_exit_to_user_mode+0x2c/0x80
> [    7.729749]  ? do_syscall_64+0x69/0xc0
> [    7.729749]  ? do_user_addr_fault+0x1e6/0x6c0
> [    7.729749]  ? trace_hardirqs_off+0x26/0xc0
> [    7.729749]  ? exc_page_fault+0x89/0x140
> [    7.729749]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [    7.729749] RIP: 0033:0x701aa4f7be0a
> [    7.729749] Code: 48 8b 0d 61 80 0b 00 f7 d8 64 89 01 48 83 c8 ff c3 6=
6 2e
> 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 af 00 00 00 0f 05 <48>=
 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d 2e 80 0b 00 f7 d8 64 89 01 48
> [    7.729749] RSP: 002b:00007ffe4ebcb818 EFLAGS: 00000246 ORIG_RAX:
> 00000000000000af
> [    7.729749] RAX: ffffffffffffffda RBX: 000060e5c69b38b0 RCX:
> 0000701aa4f7be0a
> [    7.729749] RDX: 000060e5c69bea80 RSI: 000000000157d12f RDI:
> 0000701aa2499010
> [    7.729749] RBP: 00007ffe4ebcb860 R08: 0000701aa3c7f000 R09:
> 0000000000000000
> [    7.729749] R10: 000060e5c6b2d5f0 R11: 0000000000000246 R12:
> 000060e5c69bea80
> [    7.729749] R13: 0000701aa2499010 R14: 000000000000003c R15:
> 000060e5c6b152b0
> [    7.729749]  </TASK>
> [    7.730306]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
