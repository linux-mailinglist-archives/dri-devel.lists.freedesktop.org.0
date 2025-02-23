Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BAA4210B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66710E3E4;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hRU43FgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225310E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A16F6114A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 653F8C4CEE4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740334442;
 bh=eGMA/LcH/x4FcPLgLZa1JjemGW9oKdy/zIpKfJRLdAk=;
 h=From:To:Subject:Date:From;
 b=hRU43FgC20qxqn/Xhk7HF8CXv79MYTLPvsOcyBh7/yh1NltOq6zpPlvuefAjM3zNs
 UamHPkI500tbICHe/PzfonhK8/EgYGtlLWmugwNrI3oP7oNXbszenDBMakaanPCucT
 Z5i7GxNbmVVdgq6rLiCWedmbLufrGu4A7XYCOcubi7FDEjtdLGJKbDzKRjdiwxkJHB
 YwCSGlF5c8TfKrELTSpW8X4s8Kr7aoQKjOg8XvdE0mUdJpDLT38t6lb+t0hebyUlIk
 IVxmECArkjdhZw8KPmmnODkgRLITfUpaiLKKIh3qnuS8JKAxZ33P71MrWlbscWA91B
 Fe8uRZp0T90kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5347EC41606; Sun, 23 Feb 2025 18:14:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219808] New: Commit 5009628d8509dbb90e1b88e01eda00430fa24b4b
 Breaks AMDGPU
Date: Sun, 23 Feb 2025 18:14:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kieran@dziallo.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219808-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219808

            Bug ID: 219808
           Summary: Commit 5009628d8509dbb90e1b88e01eda00430fa24b4b Breaks
                    AMDGPU
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kieran@dziallo.net
        Regression: No

Created attachment 307704
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307704&action=3Dedit
Bisect log finding commit 5009628d8509dbb90e1b88e01eda00430fa24b4b breaks my
kernel

PROBLEM:
When booting in a kernel after commit 5009628d8509dbb90e1b88e01eda00430fa24=
b4b
was accepted, amdgpu would fail to initialize with message:

kernel: [drm:amdgpu_discove6.12.9-00103-g42ef932bad9bry_set_ip_blocks [amdg=
pu]]
*ERROR* amdgpu_discovery_init failed
kernel: amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
kernel: amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
kernel: amdgpu 0000:03:00.0: probe with driver amdgpu failed with error -22

(full boot log can be found http://0x0.st/8cPi.txt)

Performing a bisect yielded the problem commit as
5009628d8509dbb90e1b88e01eda00430fa24b4b. (Bisect log is attached)

KERNEL INFORMATION:
Kernel 6.12.9 was the last working version, and kernel 6.12.10 broke.  The =
last
working compiled kernel is 6.12.9-00103-g42ef932bad9b.  Kernel was compiled
with the standard Arch Linux .config.

VER_LINUX OUTPUT:

GNU C                   14.2.1
GNU Make                4.4.1
Binutils                2.43.1
Util-linux              2.40.4
Mount                   2.40.4
Module-init-tools       33
E2fsprogs               1.47.2
Jfsutils                1.1.15
Reiserfsprogs           3.6.27
PPP                     2.5.2
Bison                   3.8.2
Flex                    2.6.4
Linux C++ Library       6.0.33
Dynamic linker (ldd)    2.40
Procps                  4.0.5
Kbd                     2.7.1
Console-tools           2.7.1
Sh-utils                9.5
Udev                    257
Wireless-tools          30
Modules Loaded          aesni_intel amd_atl amdgpu amdxcp asus_wmi bluetooth
btbcm btintel btmtk btrtl btusb ccm ccp cec cfg80211 crc16 crc32c_generic
crc32c_intel crc32_pclmul crct10dif_pclmul cryptd crypto_simd dm_mod drm_bu=
ddy
drm_display_helper drm_exec drm_suballoc_helper drm_ttm_helper eeepc_wmi ex=
t4
fat gf128mul ghash_clmulni_intel gpio_amdpt gpio_generic gpu_sched hid_gene=
ric
i2c_algo_bit i2c_piix4 i2c_smbus i8042 intel_rapl_common intel_rapl_msr
ip_tables jbd2 k10temp kvm kvm_amd libarc4 libphy loop mac80211 mac_hid mbc=
ache
mdio_devres mousedev mt76 mt76_connac_lib mt7925_common mt7925e mt792x_lib
nfnetlink nvme nvme_auth nvme_core pcspkr platform_profile polyval_clmulni
polyval_generic r8169 radeon rapl realtek rfkill roles serio sha1_ssse3
sha256_ssse3 sha512_ssse3 snd snd_hda_codec snd_hda_codec_generic
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_intel
snd_hda_scodec_component snd_hwdep snd_intel_dspcfg snd_intel_sdw_acpi snd_=
pcm
snd_timer soundcore sp5100_tco sparse_keymap spd5118 thunderbolt ttm typec
typec_ucsi uas ucsi_acpi usbhid usb_storage vfat video wmi wmi_bmof x_tables

HARDWARE:
CPU: AMD Ryzen 7 8700F (16) @ 5.054GHz
GPU: AMD ATI Radeon RX 6600

NOTES:
My thinking is that the lines removed from
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c are actually need for my
hardware and should be added back in.  I tested just writing the deleted li=
nes
back into the /gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c source for a kernel
version I knew to be bad, and this solved the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
