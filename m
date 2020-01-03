Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387E12FA02
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 16:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943676E0A0;
	Fri,  3 Jan 2020 15:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056AA6E0A0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:52:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204849] amdgpu (RX560X) traceboot in dmesg boot output, system
 instability
Date: Fri, 03 Jan 2020 15:52:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: robert@servermasters.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204849-2300-N923mLPpcM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204849-2300@https.bugzilla.kernel.org/>
References: <bug-204849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204849

Robert Hoffmann (robert@servermasters.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |robert@servermasters.com

--- Comment #1 from Robert Hoffmann (robert@servermasters.com) ---
Hi guys,

I am getting a very similar issue with a Ryzen 3400G  (AMDGPU).

OS Fedora 31: Linux asrock 5.3.16-300.fc31.x86_64 #1 SMP Fri Dec 13 17:59:04
UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

The problem manifests itself every time I enter into an Xorg (LXDE) session, I
guess one time per CPU core. So I am getting 10-12 errors every time I log in,
as popups.  Xfce also will not work at all, only LXDE (Openbox) seems to work
fine.

Operationally all seems relatively OK though, except if I turn off one of my 2
monitors, and turn them back on, I will get the errors again.


I dont have a kernel debugger or profiler installed.

-------- here is a snippet of a backtrace: -------------
WARNING: CPU: 1 PID: 917 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1758
write_i2c_retimer_setting.cold+0xae/0xb5 [amdgpu]
Modules linked in: serpent_avx2 serpent_avx_x86_64 serpent_sse2_x86_64
serpent_generic dm_crypt xt_CHECKSUM xt_MASQUERADE nf_nat_tftp
nf_conntrack_tftp xt_CT tun bridge stp llc ip6t_REJECT nf_reject_ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter sunrpc snd_hda_codec_realtek
snd_hda_codec_generic edac_mce_amd ledtrig_audio snd_hda_codec_hdmi kvm_amd ccp
snd_hda_intel snd_hda_codec kvm snd_hda_core snd_hwdep irqbypass snd_seq
crct10dif_pclmul snd_seq_device crc32_pclmul snd_pcm joydev wmi_bmof
ghash_clmulni_intel snd_timer nvme sp5100_tco nvme_core snd k10temp i2c_piix4
soundcore acpi_cpufreq ip_tables uas usb_storage amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper drm
 crc32c_intel r8169 wmi video pinctrl_amd fuse
CPU: 1 PID: 917 Comm: Xorg Tainted: G        W         5.3.16-300.fc31.x86_64
#1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A300M-STX, BIOS
P3.50 05/15/2019
RIP: 0010:write_i2c_retimer_setting.cold+0xae/0xb5 [amdgpu]
Code: 6c f4 a0 c1 0f 0b e9 0e 0d fd ff 48 c7 c7 80 ee 7f c0 e8 59 f4 a0 c1 0f
0b e9 27 0b fd ff 48 c7 c7 80 ee 7f c0 e8 46 f4 a0 c1 <0f> 0b e9 fd 09 fd ff 48
c7 c7 80 ee 7f c0 e8 33 f4 a0 c1 0f 0b e9
RSP: 0018:ffffbe23c190f6a0 EFLAGS: 00010246
RAX: 0000000000000024 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff99fc50657908 RDI: ffff99fc50657908
RBP: ffffbe23c190f71c R08: ffff99fc50657908 R09: 000000000000072a
R10: 0000000000024924 R11: 0000000000000003 R12: 000000000000005d
R13: 0000000000000000 R14: ffff99fc18140648 R15: 0000000000000000
FS:  00007fd0f4484f00(0000) GS:ffff99fc50640000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055800df036e8 CR3: 00000003ef71a000 CR4: 00000000003406e0
Call Trace:
--------------------------

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
