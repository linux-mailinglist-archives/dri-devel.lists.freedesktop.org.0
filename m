Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78EFF819
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 07:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B076E0E3;
	Sun, 17 Nov 2019 06:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 783F96E0E3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 06:37:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F685720E2; Sun, 17 Nov 2019 06:37:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout causes system freeze
Date: Sun, 17 Nov 2019 06:37:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: saadnaji89@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112304-502-9QUSgNoCvf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112304-502@http.bugs.freedesktop.org/>
References: <bug-112304-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1177036035=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1177036035==
Content-Type: multipart/alternative; boundary="15739726780.7cdc9a8.8082"
Content-Transfer-Encoding: 7bit


--15739726780.7cdc9a8.8082
Date: Sun, 17 Nov 2019 06:37:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

--- Comment #10 from saadnaji89@gmail.com ---
Comment on attachment 145981
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145981
additional-journalctl-logs-during-game-play


>Nov 17 01:02:31 archlinux audit[1]: SERVICE_STOP pid=3D1 uid=3D0 auid=3D42=
94967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" =
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
>Nov 17 01:02:31 archlinux kernel: audit: type=3D1131 audit(1573970551.160:=
173): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsyst=
emd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D=
? addr=3D? terminal=3D? res=3Dsuccess'
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected:=
 146 0x066e480c
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTE=
CTION_FAULT_ADDR   0x00100DB3
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTE=
CTION_FAULT_STATUS 0x0E04800C
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x0c, vmi=
d 7) at page 1052083, read from '' (0x00000000) (72)
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected:=
 146 0x06ae880c
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTE=
CTION_FAULT_ADDR   0x00000000
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTE=
CTION_FAULT_STATUS 0x0F008010
>Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x10, vmi=
d 7) at page 0, write from '' (0x00000000) (8)
>Nov 17 01:02:45 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring gfx timeout, signaled seq=3D23, emitted seq=3D24
>Nov 17 01:02:45 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* Process information: process hl2_linux pid 2252 thread hl2_linux:cs0 pid=
 2254
>Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: GPU reset begin!
>Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: GPU reset succeeded=
, trying to resume
>Nov 17 01:02:45 archlinux kernel: [drm] PCIE gen 3 link speeds already ena=
bled
>Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: PCIE GART of 1024M =
enabled (table at 0x000000F400000000).
>Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: [drm:amdgpu_ring_te=
st_helper [amdgpu]] *ERROR* ring gfx test failed (-110)
>Nov 17 01:02:46 archlinux kernel: [drm:amdgpu_device_ip_resume_phase2 [amd=
gpu]] *ERROR* resume of IP block <gfx_v6_0> failed -110
>Nov 17 01:02:46 archlinux kernel: [drm:si_dpm_set_power_state [amdgpu]] *E=
RROR* si_restrict_performance_levels_before_switch failed
>Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: GPU reset(1) failed
>Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: GPU reset end with =
ret =3D -110
>Nov 17 01:02:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring gfx timeout, signaled seq=3D24, emitted seq=3D24
>Nov 17 01:02:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* Process information: process hl2_linux pid 2252 thread hl2_linux:cs0 pid=
 2254
>Nov 17 01:02:49 archlinux kernel: amdgpu 0000:01:00.0: GPU reset begin!
>Nov 17 01:03:49 archlinux kernel: [drm] schedsdma0 is not ready, skipping
>Nov 17 01:03:49 archlinux kernel: [drm] schedsdma1 is not ready, skipping
>Nov 17 01:03:49 archlinux kernel: amdgpu 0000:01:00.0: failed to clear pag=
e tables on GEM object close (-2)
>Nov 17 01:03:49 archlinux kernel: BUG: kernel NULL pointer dereference, ad=
dress: 0000000000000008
>Nov 17 01:03:49 archlinux kernel: #PF: supervisor read access in kernel mo=
de
>Nov 17 01:03:49 archlinux kernel: #PF: error_code(0x0000) - not-present pa=
ge
>Nov 17 01:03:49 archlinux kernel: PGD 0 P4D 0=20
>Nov 17 01:03:49 archlinux kernel: Oops: 0000 [#1] SMP PTI
>Nov 17 01:03:49 archlinux kernel: CPU: 1 PID: 2262 Comm: hl2_linu:shlo0 No=
t tainted 5.3.11-2-clear #1
>Nov 17 01:03:49 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 17 01:03:49 archlinux kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x34/0x1=
00 [amdgpu]
>Nov 17 01:03:49 archlinux kernel: Code: 49 89 f5 41 54 53 48 89 fb 48 83 e=
c 10 48 8b 47 08 48 8b 57 18 4c 8b b0 80 00 00 00 4c 8b a2 88 01 00 00 48 8=
b 80 c8 00 00 00 <4c> 8b 78 08 41 8b 44 24 08 4d 8d 47 88 85 c0 0f 84 49 ae=
 1e 00 49
>Nov 17 01:03:49 archlinux kernel: RSP: 0018:ffffb9290250b9a0 EFLAGS: 00010=
286
>Nov 17 01:03:49 archlinux kernel: RAX: 0000000000000000 RBX: ffffb9290250b=
9e8 RCX: 0000000000100400
>Nov 17 01:03:49 archlinux kernel: RDX: ffff9d2c19ba1c00 RSI: ffffb9290250b=
a60 RDI: ffffb9290250b9e8
>Nov 17 01:03:49 archlinux kernel: RBP: ffffb9290250b9d8 R08: 0000000000001=
000 R09: 0000000000200000
>Nov 17 01:03:49 archlinux kernel: R10: ffffb929004c5600 R11: 0000000000000=
012 R12: ffff9d2c19ba1df8
>Nov 17 01:03:49 archlinux kernel: R13: ffffb9290250ba60 R14: ffff9d2b3a472=
000 R15: ffff9d2bbc2f12a0
>Nov 17 01:03:49 archlinux kernel: FS:  0000000000000000(0000) GS:ffff9d2c1=
f040000(0000) knlGS:0000000000000000
>Nov 17 01:03:49 archlinux kernel: CS:  0010 DS: 002b ES: 002b CR0: 0000000=
080050033
>Nov 17 01:03:49 archlinux kernel: CR2: 0000000000000008 CR3: 0000000306a0a=
003 CR4: 00000000001606e0
>Nov 17 01:03:49 archlinux kernel: Call Trace:
>Nov 17 01:03:49 archlinux kernel:  amdgpu_vm_bo_update_mapping+0x9e/0xb0 [=
amdgpu]
>Nov 17 01:03:49 archlinux kernel:  amdgpu_vm_clear_freed+0xb5/0x170 [amdgp=
u]
>Nov 17 01:03:49 archlinux kernel:  amdgpu_gem_object_close+0x127/0x170 [am=
dgpu]
>Nov 17 01:03:49 archlinux kernel:  drm_gem_object_release_handle+0x81/0xc0
>Nov 17 01:03:49 archlinux kernel:  ? drm_gem_object_handle_put_unlocked+0x=
a0/0xa0
>Nov 17 01:03:49 archlinux kernel:  idr_for_each+0x51/0xc0
>Nov 17 01:03:49 archlinux kernel:  drm_gem_release+0x1c/0x30
>Nov 17 01:03:49 archlinux kernel:  drm_file_free.part.0+0x2b1/0x300
>Nov 17 01:03:49 archlinux kernel:  drm_close_helper.isra.0+0x6e/0x80
>Nov 17 01:03:49 archlinux kernel:  drm_release+0x4c/0x7e
>Nov 17 01:03:49 archlinux kernel:  __fput+0xbf/0x260
>Nov 17 01:03:49 archlinux kernel:  ____fput+0x9/0x10
>Nov 17 01:03:49 archlinux kernel:  task_work_run+0x8f/0xb0
>Nov 17 01:03:49 archlinux kernel:  do_exit+0x302/0x730
>Nov 17 01:03:49 archlinux kernel:  do_group_exit+0x36/0xa0
>Nov 17 01:03:49 archlinux kernel:  get_signal+0x15c/0x810
>Nov 17 01:03:49 archlinux kernel:  ? do_futex+0x121/0x540
>Nov 17 01:03:49 archlinux kernel:  do_signal+0x2f/0x260
>Nov 17 01:03:49 archlinux kernel:  ? __audit_syscall_entry+0xd6/0x120
>Nov 17 01:03:49 archlinux kernel:  exit_to_usermode_loop+0x98/0xc0
>Nov 17 01:03:49 archlinux kernel:  do_fast_syscall_32+0x29d/0x350
>Nov 17 01:03:49 archlinux kernel:  ? do_int80_syscall_32+0x195/0x1f0
>Nov 17 01:03:49 archlinux kernel:  entry_SYSENTER_compat+0x7c/0x8e
>Nov 17 01:03:49 archlinux kernel: RIP: 0023:0xf7f79949
>Nov 17 01:03:49 archlinux kernel: Code: Bad RIP value.
>Nov 17 01:03:49 archlinux kernel: RSP: 002b:00000000e84fb190 EFLAGS: 00000=
282 ORIG_RAX: 00000000000000f0
>Nov 17 01:03:49 archlinux kernel: RAX: fffffffffffffe00 RBX: 000000000ab84=
15c RCX: 0000000000000080
>Nov 17 01:03:49 archlinux kernel: RDX: 0000000000000000 RSI: 0000000000000=
000 RDI: 000000000ab84130
>Nov 17 01:03:49 archlinux kernel: RBP: 0000000000000000 R08: 0000000000000=
000 R09: 0000000000000000
>Nov 17 01:03:49 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
000 R12: 0000000000000000
>Nov 17 01:03:49 archlinux kernel: R13: 0000000000000000 R14: 0000000000000=
000 R15: 0000000000000000
>Nov 17 01:03:49 archlinux kernel: Modules linked in: xt_nat veth xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw snd_hda_codec_hdmi mac80211 snd_hda_codec_realtek sn=
d_hda_codec_generic ath mei_hdcp ledtrig_audio wmi_bmof snd_hda_intel uvcvi=
deo snd_hda_codec videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobu=
f2_common snd_hda_core videodev snd_hwdep cfg80211 joydev mc snd_pcm snd_ti=
mer rtsx_pci_ms r8169 i2c_i801 psmouse snd mei_me memstick rfkill soundcore=
 realtek mei lpc_ich libphy thermal wmi battery ac ip_tables hid_logitech_h=
idpp atkbd libps2 serio_raw i8042 amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 17 01:03:49 archlinux kernel: CR2: 0000000000000008
>Nov 17 01:03:49 archlinux kernel: ---[ end trace c63f21dbba2ef5cd ]---
>Nov 17 01:03:49 archlinux kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x34/0x1=
00 [amdgpu]
>Nov 17 01:03:49 archlinux kernel: Code: 49 89 f5 41 54 53 48 89 fb 48 83 e=
c 10 48 8b 47 08 48 8b 57 18 4c 8b b0 80 00 00 00 4c 8b a2 88 01 00 00 48 8=
b 80 c8 00 00 00 <4c> 8b 78 08 41 8b 44 24 08 4d 8d 47 88 85 c0 0f 84 49 ae=
 1e 00 49
>Nov 17 01:03:49 archlinux kernel: RSP: 0018:ffffb9290250b9a0 EFLAGS: 00010=
286
>Nov 17 01:03:49 archlinux kernel: RAX: 0000000000000000 RBX: ffffb9290250b=
9e8 RCX: 0000000000100400
>Nov 17 01:03:49 archlinux kernel: RDX: ffff9d2c19ba1c00 RSI: ffffb9290250b=
a60 RDI: ffffb9290250b9e8
>Nov 17 01:03:49 archlinux kernel: RBP: ffffb9290250b9d8 R08: 0000000000001=
000 R09: 0000000000200000
>Nov 17 01:03:49 archlinux kernel: R10: ffffb929004c5600 R11: 0000000000000=
012 R12: ffff9d2c19ba1df8
>Nov 17 01:03:49 archlinux kernel: R13: ffffb9290250ba60 R14: ffff9d2b3a472=
000 R15: ffff9d2bbc2f12a0
>Nov 17 01:03:49 archlinux kernel: FS:  0000000000000000(0000) GS:ffff9d2c1=
f040000(0000) knlGS:0000000000000000
>Nov 17 01:03:49 archlinux kernel: CS:  0010 DS: 002b ES: 002b CR0: 0000000=
080050033
>Nov 17 01:03:49 archlinux kernel: CR2: 00000000f7f7991f CR3: 0000000366c06=
002 CR4: 00000000001606e0
>Nov 17 01:03:49 archlinux kernel: Fixing recursive fault but reboot is nee=
ded!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739726780.7cdc9a8.8082
Date: Sun, 17 Nov 2019 06:37:58 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304">bug 11230=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saadnaji89&#64;gmail.com" title=3D"saadnaji89&#64;gmail.com">saadnaji89&#64=
;gmail.com</a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D145=
981" name=3D"attach_145981" title=3D"additional-journalctl-logs-during-game=
-play">attachment 145981</a> <a href=3D"attachment.cgi?id=3D145981&amp;acti=
on=3Dedit" title=3D"additional-journalctl-logs-during-game-play">[details]<=
/a></span>
additional-journalctl-logs-during-game-play


<span class=3D"quote">&gt;Nov 17 01:02:31 archlinux audit[1]: SERVICE_STOP =
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-ho=
stnamed comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quo=
t; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;Nov 17 01:02:31 archlinux kernel: audit: type=3D1131 audit(1573970551.1=
60:173): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Ds=
ystemd-hostnamed comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/sy=
stemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detect=
ed: 146 0x066e480c
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PR=
OTECTION_FAULT_ADDR   0x00100DB3
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PR=
OTECTION_FAULT_STATUS 0x0E04800C
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x0c, =
vmid 7) at page 1052083, read from '' (0x00000000) (72)
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detect=
ed: 146 0x06ae880c
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PR=
OTECTION_FAULT_ADDR   0x00000000
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:   VM_CONTEXT1_PR=
OTECTION_FAULT_STATUS 0x0F008010
&gt;Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x10, =
vmid 7) at page 0, write from '' (0x00000000) (8)
&gt;Nov 17 01:02:45 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* ring gfx timeout, signaled seq=3D23, emitted seq=3D24
&gt;Nov 17 01:02:45 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* Process information: process hl2_linux pid 2252 thread hl2_linux:cs0 =
pid 2254
&gt;Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: GPU reset begin!
&gt;Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: GPU reset succee=
ded, trying to resume
&gt;Nov 17 01:02:45 archlinux kernel: [drm] PCIE gen 3 link speeds already =
enabled
&gt;Nov 17 01:02:45 archlinux kernel: amdgpu 0000:01:00.0: PCIE GART of 102=
4M enabled (table at 0x000000F400000000).
&gt;Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: [drm:amdgpu_ring=
_test_helper [amdgpu]] *ERROR* ring gfx test failed (-110)
&gt;Nov 17 01:02:46 archlinux kernel: [drm:amdgpu_device_ip_resume_phase2 [=
amdgpu]] *ERROR* resume of IP block &lt;gfx_v6_0&gt; failed -110
&gt;Nov 17 01:02:46 archlinux kernel: [drm:si_dpm_set_power_state [amdgpu]]=
 *ERROR* si_restrict_performance_levels_before_switch failed
&gt;Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: GPU reset(1) fai=
led
&gt;Nov 17 01:02:46 archlinux kernel: amdgpu 0000:01:00.0: GPU reset end wi=
th ret =3D -110
&gt;Nov 17 01:02:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* ring gfx timeout, signaled seq=3D24, emitted seq=3D24
&gt;Nov 17 01:02:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* Process information: process hl2_linux pid 2252 thread hl2_linux:cs0 =
pid 2254
&gt;Nov 17 01:02:49 archlinux kernel: amdgpu 0000:01:00.0: GPU reset begin!
&gt;Nov 17 01:03:49 archlinux kernel: [drm] schedsdma0 is not ready, skippi=
ng
&gt;Nov 17 01:03:49 archlinux kernel: [drm] schedsdma1 is not ready, skippi=
ng
&gt;Nov 17 01:03:49 archlinux kernel: amdgpu 0000:01:00.0: failed to clear =
page tables on GEM object close (-2)
&gt;Nov 17 01:03:49 archlinux kernel: BUG: kernel NULL pointer dereference,=
 address: 0000000000000008
&gt;Nov 17 01:03:49 archlinux kernel: #PF: supervisor read access in kernel=
 mode
&gt;Nov 17 01:03:49 archlinux kernel: #PF: error_code(0x0000) - not-present=
 page
&gt;Nov 17 01:03:49 archlinux kernel: PGD 0 P4D 0=20
&gt;Nov 17 01:03:49 archlinux kernel: Oops: 0000 [#1] SMP PTI
&gt;Nov 17 01:03:49 archlinux kernel: CPU: 1 PID: 2262 Comm: hl2_linu:shlo0=
 Not tainted 5.3.11-2-clear #1
&gt;Nov 17 01:03:49 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 17 01:03:49 archlinux kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x34/=
0x100 [amdgpu]
&gt;Nov 17 01:03:49 archlinux kernel: Code: 49 89 f5 41 54 53 48 89 fb 48 8=
3 ec 10 48 8b 47 08 48 8b 57 18 4c 8b b0 80 00 00 00 4c 8b a2 88 01 00 00 4=
8 8b 80 c8 00 00 00 &lt;4c&gt; 8b 78 08 41 8b 44 24 08 4d 8d 47 88 85 c0 0f=
 84 49 ae 1e 00 49
&gt;Nov 17 01:03:49 archlinux kernel: RSP: 0018:ffffb9290250b9a0 EFLAGS: 00=
010286
&gt;Nov 17 01:03:49 archlinux kernel: RAX: 0000000000000000 RBX: ffffb92902=
50b9e8 RCX: 0000000000100400
&gt;Nov 17 01:03:49 archlinux kernel: RDX: ffff9d2c19ba1c00 RSI: ffffb92902=
50ba60 RDI: ffffb9290250b9e8
&gt;Nov 17 01:03:49 archlinux kernel: RBP: ffffb9290250b9d8 R08: 0000000000=
001000 R09: 0000000000200000
&gt;Nov 17 01:03:49 archlinux kernel: R10: ffffb929004c5600 R11: 0000000000=
000012 R12: ffff9d2c19ba1df8
&gt;Nov 17 01:03:49 archlinux kernel: R13: ffffb9290250ba60 R14: ffff9d2b3a=
472000 R15: ffff9d2bbc2f12a0
&gt;Nov 17 01:03:49 archlinux kernel: FS:  0000000000000000(0000) GS:ffff9d=
2c1f040000(0000) knlGS:0000000000000000
&gt;Nov 17 01:03:49 archlinux kernel: CS:  0010 DS: 002b ES: 002b CR0: 0000=
000080050033
&gt;Nov 17 01:03:49 archlinux kernel: CR2: 0000000000000008 CR3: 0000000306=
a0a003 CR4: 00000000001606e0
&gt;Nov 17 01:03:49 archlinux kernel: Call Trace:
&gt;Nov 17 01:03:49 archlinux kernel:  amdgpu_vm_bo_update_mapping+0x9e/0xb=
0 [amdgpu]
&gt;Nov 17 01:03:49 archlinux kernel:  amdgpu_vm_clear_freed+0xb5/0x170 [am=
dgpu]
&gt;Nov 17 01:03:49 archlinux kernel:  amdgpu_gem_object_close+0x127/0x170 =
[amdgpu]
&gt;Nov 17 01:03:49 archlinux kernel:  drm_gem_object_release_handle+0x81/0=
xc0
&gt;Nov 17 01:03:49 archlinux kernel:  ? drm_gem_object_handle_put_unlocked=
+0xa0/0xa0
&gt;Nov 17 01:03:49 archlinux kernel:  idr_for_each+0x51/0xc0
&gt;Nov 17 01:03:49 archlinux kernel:  drm_gem_release+0x1c/0x30
&gt;Nov 17 01:03:49 archlinux kernel:  drm_file_free.part.0+0x2b1/0x300
&gt;Nov 17 01:03:49 archlinux kernel:  drm_close_helper.isra.0+0x6e/0x80
&gt;Nov 17 01:03:49 archlinux kernel:  drm_release+0x4c/0x7e
&gt;Nov 17 01:03:49 archlinux kernel:  __fput+0xbf/0x260
&gt;Nov 17 01:03:49 archlinux kernel:  ____fput+0x9/0x10
&gt;Nov 17 01:03:49 archlinux kernel:  task_work_run+0x8f/0xb0
&gt;Nov 17 01:03:49 archlinux kernel:  do_exit+0x302/0x730
&gt;Nov 17 01:03:49 archlinux kernel:  do_group_exit+0x36/0xa0
&gt;Nov 17 01:03:49 archlinux kernel:  get_signal+0x15c/0x810
&gt;Nov 17 01:03:49 archlinux kernel:  ? do_futex+0x121/0x540
&gt;Nov 17 01:03:49 archlinux kernel:  do_signal+0x2f/0x260
&gt;Nov 17 01:03:49 archlinux kernel:  ? __audit_syscall_entry+0xd6/0x120
&gt;Nov 17 01:03:49 archlinux kernel:  exit_to_usermode_loop+0x98/0xc0
&gt;Nov 17 01:03:49 archlinux kernel:  do_fast_syscall_32+0x29d/0x350
&gt;Nov 17 01:03:49 archlinux kernel:  ? do_int80_syscall_32+0x195/0x1f0
&gt;Nov 17 01:03:49 archlinux kernel:  entry_SYSENTER_compat+0x7c/0x8e
&gt;Nov 17 01:03:49 archlinux kernel: RIP: 0023:0xf7f79949
&gt;Nov 17 01:03:49 archlinux kernel: Code: Bad RIP value.
&gt;Nov 17 01:03:49 archlinux kernel: RSP: 002b:00000000e84fb190 EFLAGS: 00=
000282 ORIG_RAX: 00000000000000f0
&gt;Nov 17 01:03:49 archlinux kernel: RAX: fffffffffffffe00 RBX: 000000000a=
b8415c RCX: 0000000000000080
&gt;Nov 17 01:03:49 archlinux kernel: RDX: 0000000000000000 RSI: 0000000000=
000000 RDI: 000000000ab84130
&gt;Nov 17 01:03:49 archlinux kernel: RBP: 0000000000000000 R08: 0000000000=
000000 R09: 0000000000000000
&gt;Nov 17 01:03:49 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000000 R12: 0000000000000000
&gt;Nov 17 01:03:49 archlinux kernel: R13: 0000000000000000 R14: 0000000000=
000000 R15: 0000000000000000
&gt;Nov 17 01:03:49 archlinux kernel: Modules linked in: xt_nat veth xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw snd_hda_codec_hdmi mac80211 snd_hda_codec_realtek=
 snd_hda_codec_generic ath mei_hdcp ledtrig_audio wmi_bmof snd_hda_intel uv=
cvideo snd_hda_codec videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 vide=
obuf2_common snd_hda_core videodev snd_hwdep cfg80211 joydev mc snd_pcm snd=
_timer rtsx_pci_ms r8169 i2c_i801 psmouse snd mei_me memstick rfkill soundc=
ore realtek mei lpc_ich libphy thermal wmi battery ac ip_tables hid_logitec=
h_hidpp atkbd libps2 serio_raw i8042 amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 17 01:03:49 archlinux kernel: CR2: 0000000000000008
&gt;Nov 17 01:03:49 archlinux kernel: ---[ end trace c63f21dbba2ef5cd ]---
&gt;Nov 17 01:03:49 archlinux kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x34/=
0x100 [amdgpu]
&gt;Nov 17 01:03:49 archlinux kernel: Code: 49 89 f5 41 54 53 48 89 fb 48 8=
3 ec 10 48 8b 47 08 48 8b 57 18 4c 8b b0 80 00 00 00 4c 8b a2 88 01 00 00 4=
8 8b 80 c8 00 00 00 &lt;4c&gt; 8b 78 08 41 8b 44 24 08 4d 8d 47 88 85 c0 0f=
 84 49 ae 1e 00 49
&gt;Nov 17 01:03:49 archlinux kernel: RSP: 0018:ffffb9290250b9a0 EFLAGS: 00=
010286
&gt;Nov 17 01:03:49 archlinux kernel: RAX: 0000000000000000 RBX: ffffb92902=
50b9e8 RCX: 0000000000100400
&gt;Nov 17 01:03:49 archlinux kernel: RDX: ffff9d2c19ba1c00 RSI: ffffb92902=
50ba60 RDI: ffffb9290250b9e8
&gt;Nov 17 01:03:49 archlinux kernel: RBP: ffffb9290250b9d8 R08: 0000000000=
001000 R09: 0000000000200000
&gt;Nov 17 01:03:49 archlinux kernel: R10: ffffb929004c5600 R11: 0000000000=
000012 R12: ffff9d2c19ba1df8
&gt;Nov 17 01:03:49 archlinux kernel: R13: ffffb9290250ba60 R14: ffff9d2b3a=
472000 R15: ffff9d2bbc2f12a0
&gt;Nov 17 01:03:49 archlinux kernel: FS:  0000000000000000(0000) GS:ffff9d=
2c1f040000(0000) knlGS:0000000000000000
&gt;Nov 17 01:03:49 archlinux kernel: CS:  0010 DS: 002b ES: 002b CR0: 0000=
000080050033
&gt;Nov 17 01:03:49 archlinux kernel: CR2: 00000000f7f7991f CR3: 0000000366=
c06002 CR4: 00000000001606e0
&gt;Nov 17 01:03:49 archlinux kernel: Fixing recursive fault but reboot is =
needed!</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739726780.7cdc9a8.8082--

--===============1177036035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1177036035==--
