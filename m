Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B02CD8F2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 21:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7C6E3DA;
	Sun,  6 Oct 2019 19:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 680E26E43C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 19:38:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6568872162; Sun,  6 Oct 2019 19:38:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Sun, 06 Oct 2019 19:38:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: exa.exa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-cjKjg4yKIw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0690488255=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0690488255==
Content-Type: multipart/alternative; boundary="15703907064.Aea71.771"
Content-Transfer-Encoding: 7bit


--15703907064.Aea71.771
Date: Sun, 6 Oct 2019 19:38:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #26 from Mirek Kratochvil <exa.exa@gmail.com> ---
Hello everyone,

reporting the same on thinkpad E585; blackscreen issue is triggered by star=
ting
X with compositor (lightdm works okay though).

Attaching my warning + backtrace + TEST_DEBUG_DATA from debian kernel, just=
 for
completeness. (I also tried 5.3 kernel with basically same result)

[   12.766637] [drm] pstate TEST_DEBUG_DATA: 0x37F60000
[   12.766640] ------------[ cut here ]------------
[   12.766844] WARNING: CPU: 5 PID: 1474 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high+0x30/0x40 [amdgpu]
[   12.766845] Modules linked in: psnap llc overlay snd_hrtimer snd_seq
snd_seq_device cpufreq_userspace cpufreq_powersave cpufreq_conservative arc4
uinput edac_mce_amd kvm_amd ccp rng_core kvm irqbypass crct10dif_pclmul
crc32_pclmul binfmt_misc ghash_clmulni_intel nls_ascii nls_cp437 vfat fat b=
tusb
btrtl btbcm btintel aesni_intel bluetooth efi_pstore aes_x86_64 crypto_simd
cryptd glue_helper ath10k_pci ath10k_core uvcvideo videobuf2_vmalloc ath
videobuf2_memops joydev drbg videobuf2_v4l2 efivars videobuf2_common serio_=
raw
mac80211 videodev snd_hda_codec_conexant snd_hda_codec_generic
snd_hda_codec_hdmi media wmi_bmof ansi_cprng sp5100_tco ecdh_generic
snd_hda_intel k10temp ecc crc16 sg snd_hda_codec watchdog cfg80211 snd_hda_=
core
snd_hwdep snd_pcm snd_timer thinkpad_acpi nvram ledtrig_audio snd ucsi_acpi
typec_ucsi soundcore typec rfkill battery ac evdev pcc_cpufreq acpi_cpufreq
loop parport_pc ppdev lp parport efivarfs ip_tables x_tables autofs4 xfs
libcrc32c crc32c_generic sd_mod amdgpu
[   12.766899]  gpu_sched i2c_algo_bit ttm ahci libahci drm_kms_helper xhci=
_pci
libata xhci_hcd crc32c_intel psmouse drm sdhci_pci scsi_mod usbcore cqhci s=
dhci
r8169 i2c_piix4 mmc_core nvme usb_common realtek mfd_core libphy nvme_core =
wmi
video i2c_scmi button
[   12.766925] CPU: 5 PID: 1474 Comm: Xorg Not tainted 5.2.0-3-amd64 #1 Deb=
ian
5.2.17-1
[   12.766926] Hardware name: LENOVO 20KV000DMC/20KV000DMC, BIOS R0UET74W (=
1.54
) 07/23/2019
[   12.767051] RIP: 0010:dcn10_verify_allow_pstate_change_high+0x30/0x40
[amdgpu]
[   12.767054] Code: 53 48 8b 87 80 02 00 00 48 89 fb 48 8b b8 b0 01 00 00 =
e8
63 21 01 00 84 c0 74 03 5b 5d c3 48 c7 c7 38 f8 81 c0 e8 ce 9c 1c d6 <0f> 0=
b 80
bb 93 01 00 00 00 74 e6 e9 1c 23 06 00 0f 1f 44 00 00 41
[   12.767056] RSP: 0018:ffffb890425bb7d0 EFLAGS: 00010246
[   12.767059] RAX: 0000000000000024 RBX: ffff9cd1aee06000 RCX:
0000000000000006
[   12.767061] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff9cd1bef57680
[   12.767062] RBP: 0000000000000001 R08: 00000000000003e0 R09:
0000000000000004
[   12.767064] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9cd1b54081b8
[   12.767065] R13: ffff9cd1b5409bc8 R14: ffff9cd1b54081b8 R15:
ffff9cd1afa01000
[   12.767068] FS:  00007fe2f471cf00(0000) GS:ffff9cd1bef40000(0000)
knlGS:0000000000000000
[   12.767070] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   12.767072] CR2: 00007fe2dc096000 CR3: 0000000430576000 CR4:
00000000003406e0
[   12.767073] Call Trace:
[   12.767203]  dcn10_pipe_control_lock.part.20+0x6a/0x70 [amdgpu]
[   12.767320]  dc_stream_set_cursor_attributes+0x11f/0x170 [amdgpu]
[   12.767450]  handle_cursor_update.isra.49+0x1b2/0x310 [amdgpu]
[   12.767580]  amdgpu_dm_commit_cursors.isra.50+0x5b/0x70 [amdgpu]
[   12.767712]  amdgpu_dm_atomic_commit_tail+0x146f/0x1960 [amdgpu]
[   12.767719]  ? _cond_resched+0x15/0x30
[   12.767725]  ? kmem_cache_alloc_trace+0x146/0x1c0
[   12.767736]  ? ttm_bo_validate+0x37/0x130 [ttm]
[   12.767838]  ? amdgpu_bo_pin_restricted+0x23d/0x270 [amdgpu]
[   12.767842]  ? _cond_resched+0x15/0x30
[   12.767847]  ? wait_for_completion_timeout+0x3b/0x1a0
[   12.767851]  ? refcount_inc_checked+0x5/0x30
[   12.767947]  ? amdgpu_bo_ref+0x17/0x20 [amdgpu]
[   12.768075]  ? dm_plane_helper_prepare_fb+0x126/0x300 [amdgpu]
[   12.768091]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[   12.768103]  commit_tail+0x3d/0x70 [drm_kms_helper]
[   12.768117]  drm_atomic_helper_commit+0xb4/0x120 [drm_kms_helper]
[   12.768129]  drm_atomic_helper_update_plane+0xf1/0x110 [drm_kms_helper]
[   12.768157]  drm_mode_cursor_universal+0x143/0x260 [drm]
[   12.768163]  ? __switch_to+0x147/0x3e0
[   12.768189]  drm_mode_cursor_common+0xc9/0x220 [drm]
[   12.768214]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[   12.768234]  drm_ioctl_kernel+0xac/0xf0 [drm]
[   12.768257]  drm_ioctl+0x201/0x3a0 [drm]
[   12.768282]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[   12.768369]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[   12.768375]  do_vfs_ioctl+0xa4/0x630
[   12.768379]  ksys_ioctl+0x60/0x90
[   12.768383]  ? ksys_read+0x99/0xd0
[   12.768385]  __x64_sys_ioctl+0x16/0x20
[   12.768390]  do_syscall_64+0x53/0x130
[   12.768394]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   12.768398] RIP: 0033:0x7fe2f4c5f5d7
[   12.768401] Code: 00 00 90 48 8b 05 b9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 89 78 0c 00 f7 d8 64 89 01 48
[   12.768402] RSP: 002b:00007ffceac65e78 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   12.768406] RAX: ffffffffffffffda RBX: 0000560127c7ce80 RCX:
00007fe2f4c5f5d7
[   12.768407] RDX: 00007ffceac65ec0 RSI: 00000000c02464bb RDI:
000000000000000d
[   12.768408] RBP: 00007ffceac65ec0 R08: 0000000000000001 R09:
0000000000003fff
[   12.768410] R10: 000000000000007f R11: 0000000000000246 R12:
00000000c02464bb
[   12.768411] R13: 000000000000000d R14: 0000000000000004 R15:
00005601280f7db0
[   12.768415] ---[ end trace d4348d0b513dc5d0 ]---

I will try the workaround in the X driver and see.

Is there any preliminary guess/chance for an official fix in kernel or in x=
org?

Thanks,
-mk

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703907064.Aea71.771
Date: Sun, 6 Oct 2019 19:38:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
exa.exa&#64;gmail.com" title=3D"Mirek Kratochvil &lt;exa.exa&#64;gmail.com&=
gt;"> <span class=3D"fn">Mirek Kratochvil</span></a>
</span></b>
        <pre>Hello everyone,

reporting the same on thinkpad E585; blackscreen issue is triggered by star=
ting
X with compositor (lightdm works okay though).

Attaching my warning + backtrace + TEST_DEBUG_DATA from debian kernel, just=
 for
completeness. (I also tried 5.3 kernel with basically same result)

[   12.766637] [drm] pstate TEST_DEBUG_DATA: 0x37F60000
[   12.766640] ------------[ cut here ]------------
[   12.766844] WARNING: CPU: 5 PID: 1474 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high+0x30/0x40 [amdgpu]
[   12.766845] Modules linked in: psnap llc overlay snd_hrtimer snd_seq
snd_seq_device cpufreq_userspace cpufreq_powersave cpufreq_conservative arc4
uinput edac_mce_amd kvm_amd ccp rng_core kvm irqbypass crct10dif_pclmul
crc32_pclmul binfmt_misc ghash_clmulni_intel nls_ascii nls_cp437 vfat fat b=
tusb
btrtl btbcm btintel aesni_intel bluetooth efi_pstore aes_x86_64 crypto_simd
cryptd glue_helper ath10k_pci ath10k_core uvcvideo videobuf2_vmalloc ath
videobuf2_memops joydev drbg videobuf2_v4l2 efivars videobuf2_common serio_=
raw
mac80211 videodev snd_hda_codec_conexant snd_hda_codec_generic
snd_hda_codec_hdmi media wmi_bmof ansi_cprng sp5100_tco ecdh_generic
snd_hda_intel k10temp ecc crc16 sg snd_hda_codec watchdog cfg80211 snd_hda_=
core
snd_hwdep snd_pcm snd_timer thinkpad_acpi nvram ledtrig_audio snd ucsi_acpi
typec_ucsi soundcore typec rfkill battery ac evdev pcc_cpufreq acpi_cpufreq
loop parport_pc ppdev lp parport efivarfs ip_tables x_tables autofs4 xfs
libcrc32c crc32c_generic sd_mod amdgpu
[   12.766899]  gpu_sched i2c_algo_bit ttm ahci libahci drm_kms_helper xhci=
_pci
libata xhci_hcd crc32c_intel psmouse drm sdhci_pci scsi_mod usbcore cqhci s=
dhci
r8169 i2c_piix4 mmc_core nvme usb_common realtek mfd_core libphy nvme_core =
wmi
video i2c_scmi button
[   12.766925] CPU: 5 PID: 1474 Comm: Xorg Not tainted 5.2.0-3-amd64 #1 Deb=
ian
5.2.17-1
[   12.766926] Hardware name: LENOVO 20KV000DMC/20KV000DMC, BIOS R0UET74W (=
1.54
) 07/23/2019
[   12.767051] RIP: 0010:dcn10_verify_allow_pstate_change_high+0x30/0x40
[amdgpu]
[   12.767054] Code: 53 48 8b 87 80 02 00 00 48 89 fb 48 8b b8 b0 01 00 00 =
e8
63 21 01 00 84 c0 74 03 5b 5d c3 48 c7 c7 38 f8 81 c0 e8 ce 9c 1c d6 &lt;0f=
&gt; 0b 80
bb 93 01 00 00 00 74 e6 e9 1c 23 06 00 0f 1f 44 00 00 41
[   12.767056] RSP: 0018:ffffb890425bb7d0 EFLAGS: 00010246
[   12.767059] RAX: 0000000000000024 RBX: ffff9cd1aee06000 RCX:
0000000000000006
[   12.767061] RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff9cd1bef57680
[   12.767062] RBP: 0000000000000001 R08: 00000000000003e0 R09:
0000000000000004
[   12.767064] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9cd1b54081b8
[   12.767065] R13: ffff9cd1b5409bc8 R14: ffff9cd1b54081b8 R15:
ffff9cd1afa01000
[   12.767068] FS:  00007fe2f471cf00(0000) GS:ffff9cd1bef40000(0000)
knlGS:0000000000000000
[   12.767070] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   12.767072] CR2: 00007fe2dc096000 CR3: 0000000430576000 CR4:
00000000003406e0
[   12.767073] Call Trace:
[   12.767203]  dcn10_pipe_control_lock.part.20+0x6a/0x70 [amdgpu]
[   12.767320]  dc_stream_set_cursor_attributes+0x11f/0x170 [amdgpu]
[   12.767450]  handle_cursor_update.isra.49+0x1b2/0x310 [amdgpu]
[   12.767580]  amdgpu_dm_commit_cursors.isra.50+0x5b/0x70 [amdgpu]
[   12.767712]  amdgpu_dm_atomic_commit_tail+0x146f/0x1960 [amdgpu]
[   12.767719]  ? _cond_resched+0x15/0x30
[   12.767725]  ? kmem_cache_alloc_trace+0x146/0x1c0
[   12.767736]  ? ttm_bo_validate+0x37/0x130 [ttm]
[   12.767838]  ? amdgpu_bo_pin_restricted+0x23d/0x270 [amdgpu]
[   12.767842]  ? _cond_resched+0x15/0x30
[   12.767847]  ? wait_for_completion_timeout+0x3b/0x1a0
[   12.767851]  ? refcount_inc_checked+0x5/0x30
[   12.767947]  ? amdgpu_bo_ref+0x17/0x20 [amdgpu]
[   12.768075]  ? dm_plane_helper_prepare_fb+0x126/0x300 [amdgpu]
[   12.768091]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[   12.768103]  commit_tail+0x3d/0x70 [drm_kms_helper]
[   12.768117]  drm_atomic_helper_commit+0xb4/0x120 [drm_kms_helper]
[   12.768129]  drm_atomic_helper_update_plane+0xf1/0x110 [drm_kms_helper]
[   12.768157]  drm_mode_cursor_universal+0x143/0x260 [drm]
[   12.768163]  ? __switch_to+0x147/0x3e0
[   12.768189]  drm_mode_cursor_common+0xc9/0x220 [drm]
[   12.768214]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[   12.768234]  drm_ioctl_kernel+0xac/0xf0 [drm]
[   12.768257]  drm_ioctl+0x201/0x3a0 [drm]
[   12.768282]  ? drm_mode_cursor_ioctl+0x70/0x70 [drm]
[   12.768369]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[   12.768375]  do_vfs_ioctl+0xa4/0x630
[   12.768379]  ksys_ioctl+0x60/0x90
[   12.768383]  ? ksys_read+0x99/0xd0
[   12.768385]  __x64_sys_ioctl+0x16/0x20
[   12.768390]  do_syscall_64+0x53/0x130
[   12.768394]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   12.768398] RIP: 0033:0x7fe2f4c5f5d7
[   12.768401] Code: 00 00 90 48 8b 05 b9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 89 78 0c 00 f7 d8 64 89 01 48
[   12.768402] RSP: 002b:00007ffceac65e78 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   12.768406] RAX: ffffffffffffffda RBX: 0000560127c7ce80 RCX:
00007fe2f4c5f5d7
[   12.768407] RDX: 00007ffceac65ec0 RSI: 00000000c02464bb RDI:
000000000000000d
[   12.768408] RBP: 00007ffceac65ec0 R08: 0000000000000001 R09:
0000000000003fff
[   12.768410] R10: 000000000000007f R11: 0000000000000246 R12:
00000000c02464bb
[   12.768411] R13: 000000000000000d R14: 0000000000000004 R15:
00005601280f7db0
[   12.768415] ---[ end trace d4348d0b513dc5d0 ]---

I will try the workaround in the X driver and see.

Is there any preliminary guess/chance for an official fix in kernel or in x=
org?

Thanks,
-mk</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703907064.Aea71.771--

--===============0690488255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0690488255==--
