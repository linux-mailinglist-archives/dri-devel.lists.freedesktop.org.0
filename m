Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58987B8895
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 02:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928C6FC2C;
	Fri, 20 Sep 2019 00:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88B1D6FC20
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 00:34:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 857BE72167; Fri, 20 Sep 2019 00:34:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111234] amdgpu bug: kernel NULL pointer dereference during
 video playback
Date: Fri, 20 Sep 2019 00:34:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: jamespharvey20@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111234-502-v6l70pCaDC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111234-502@http.bugs.freedesktop.org/>
References: <bug-111234-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1407094165=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1407094165==
Content-Type: multipart/alternative; boundary="15689396701.42f304941.8572"
Content-Transfer-Encoding: 7bit


--15689396701.42f304941.8572
Date: Fri, 20 Sep 2019 00:34:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111234

--- Comment #4 from jamespharvey20@gmail.com ---
Just ran into this for my first time.  I've had pretty consistent problems =
with
the potentially related bug that Nicholas Kazlauskas mentioned at
https://bugzilla.kernel.org/show_bug.cgi?id=3D204181

Could certainly be the same bug, but definitely has a different backtrace.

Also running KDE, also running multi (5) monitor.

Was on linux 5.2.10, mesa 19.1.6, plasma 5.16.4.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] V=
ega
10 XL/XT [Radeon RX Vega 56/64] (rev c1) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RX Vega64
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 76
        NUMA node: 0
        Region 0: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at d0000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at 8000 [size=3D256]
        Region 5: Memory at dfb00000 (32-bit, non-prefetchable) [size=3D512=
K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[drm] amdgpu kernel modesetting enabled.
fb0: switching to amdgpudrmfb from EFI VGA
[drm] initializing kernel modesetting (VEGA10 0x1002:0x687F 0x1002:0x0B36
0xC1).
[drm] register mmio base: 0xDFB00000
[drm] register mmio size: 524288
[drm] add ip block number 0 <soc15_common>
[drm] add ip block number 1 <gmc_v9_0>
[drm] add ip block number 2 <vega10_ih>
[drm] add ip block number 3 <psp>
[drm] add ip block number 4 <gfx_v9_0>
[drm] add ip block number 5 <sdma_v4_0>
[drm] add ip block number 6 <powerplay>
[drm] add ip block number 7 <dm>
[drm] add ip block number 8 <uvd_v7_0>
[drm] add ip block number 9 <vce_v4_0>
[drm] UVD(0) is enabled in VM mode
[drm] UVD(0) ENC is enabled in VM mode
[drm] VCE enabled in VM mode
[drm] RAS INFO: ras initialized successfully, hardware ability[0] ras_mask[=
0]
[drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is
9-bit
[drm] Detected VRAM RAM=3D8176M, BAR=3D256M
[drm] RAM width 2048bits HBM
[drm] amdgpu: 8176M of VRAM memory ready
[drm] amdgpu: 8176M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
[drm] PCIE GART of 512M enabled (table at 0x000000F400900000).
[drm] use_doorbell being set to: [true]
[drm] use_doorbell being set to: [true]
[drm] Found UVD firmware Version: 65.29 Family ID: 17
[drm] PSP loading UVD firmware
[drm] Found VCE firmware Version: 57.4 Binary ID: 4
[drm] PSP loading VCE firmware
[drm] reserve 0x400000 from 0xf401000000 for PSP TMR SIZE
[drm] Display Core initialized with v3.2.27!
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 59]
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 62]
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 65]
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
[drm] UVD and UVD ENC initialized successfully.
[drm] VCE initialized successfully.
[drm] Cannot find any crtc or sizes
[drm] ECC is not present.
[drm] SRAM ECC is not present.
[drm] Initialized amdgpu 3.32.0 20150101 for 0000:05:00.0 on minor 0
[drm] amdgpu_dm_irq_schedule_work FAILED src 8
[drm] DM_MST: added connector: (____ptrval____) [id: 70] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 74] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 78] [master:
(____ptrval____)]
[drm] fb mappable at 0xC1400000
[drm] vram apper at 0xC0000000
[drm] size 14745600
[drm] fb depth is 24
[drm]    pitch is 10240
fbcon: amdgpudrmfb (fb0) is primary device
[drm] DM_MST: added connector: (____ptrval____) [id: 85] [master:
(____ptrval____)]
amdgpu 0000:05:00.0: fb0: amdgpudrmfb frame buffer device
[drm] DM_MST: added connector: (____ptrval____) [id: 89] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 93] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 97] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 107] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 113] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 117] [master:
(____ptrval____)]

..........

BUG: kernel NULL pointer dereference, address: 00000000000002b4
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 1 PID: 2678499 Comm: kworker/u65:9 Tainted: G        W  OE=20=20=20=20
5.2.11-arch1-1-ARCH #1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./EP2C602, BIOS
P1.90 04/12/2018
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
Code: 04 00 00 49 8b bc 02 b0 02 00 00 48 8b 07 48 8b 40 50 e8 2d 3b 14 c9 =
b8
01 00 00 00 c3 0f 1f 80 00 00 00 00 66 66 66 66 90 53 <8b> 86 b4 02 00 00 4=
8 89
f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
RSP: 0018:ffffa0c6a365faf8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000005
RDX: ffffffffc0547710 RSI: 0000000000000000 RDI: ffff9a4bd62e5000
RBP: ffff9a4483080000 R08: ffff9a4483080000 R09: 0000000000000000
R10: ffff9a4483080000 R11: 0000000000000018 R12: ffff9a4bd62e5000
R13: ffffa0c6a365fd58 R14: ffff9a4bd67dcff0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff9a4bdf840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000002b4 CR3: 0000000ffbe76005 CR4: 00000000000626e0
Call Trace:
 dc_commit_state+0x99/0x580 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xc5d/0x19a0 [amdgpu]
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? _raw_spin_unlock_irq+0x1d/0x30
 ? finish_task_switch+0x84/0x2d0
 ? preempt_schedule_common+0x32/0x80
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3e0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3e0/0x3e0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x35/0x40
Modules linked in: netlink_diag uas usb_storage xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_mangle iptable_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ebtable_filter ebtables
ip6_tables iptable_filter tun rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver
nfs lockd grace fscache ib_isert iscsi_target_mod msr ib_srpt nct6775 hwmon=
_vid
target_core_mod ib_srp scsi_transport_srp rpcrdma sunrpc rdma_ucm ib_iser
rdma_cm ib_umad iw_cm
ib_ipoib libiscsi scsi_transport_iscsi ib_cm mlx4_ib ib_uverbs mlx4_en ib_c=
ore
nls_iso8859_1 nls_cp437 vfat fat ipmi_ssif intel_rapl sb_edac
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_codec_real=
tek
snd_hda_codec_generic ledtrig_audio kvm snd_hda_codec_hdmi snd_hda_intel br=
idge
snd_hda_codec snd_hda_core stp irqbypass llc intel_cstate snd_hwdep snd_pcm
iTCO_wdt iTCO_vendor_support snd_timer mousedev input_leds joydev pcspkr
intel_uncore ipmi_si mlx4_core mei_me e1000e snd ioatdma
 ipmi_devintf i2c_i801 pcc_cpufreq intel_rapl_perf lpc_ich mei soundcore dca
wmi ipmi_msghandler evdev mac_hid vmmon(OE) vmw_vmci vboxnetflt(OE)
vboxnetadp(OE) vboxpci(OE) vboxdrv(OE) sg crypto_user ip_tables x_tables bt=
rfs
xor raid6_pq dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio libcrc3=
2c
crc32c_generic hid_generic usbhid hid sr_mod cdrom sd_mod dm_crypt dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel isci aesni_i=
ntel
libsas ahci aes_x86_64 crypto_simd scsi_transport_sas libahci cryptd
glue_helper libata ehci_pci scsi_mod ehci_hcd amdgpu gpu_sched i2c_algo_bit=
 ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
CR2: 00000000000002b4
---[ end trace 2c71b3abb2d778a6 ]---
RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
Code: 04 00 00 49 8b bc 02 b0 02 00 00 48 8b 07 48 8b 40 50 e8 2d 3b 14 c9 =
b8
01 00 00 00 c3 0f 1f 80 00 00 00 00 66 66 66 66 90 53 <8b> 86 b4 02 00 00 4=
8 89
f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
RSP: 0018:ffffa0c6a365faf8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000005
RDX: ffffffffc0547710 RSI: 0000000000000000 RDI: ffff9a4bd62e5000
RBP: ffff9a4483080000 R08: ffff9a4483080000 R09: 0000000000000000
R10: ffff9a4483080000 R11: 0000000000000018 R12: ffff9a4bd62e5000
R13: ffffa0c6a365fd58 R14: ffff9a4bd67dcff0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff9a4bdf840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000002b4 CR3: 0000000ffbe76005 CR4: 00000000000626e0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689396701.42f304941.8572
Date: Fri, 20 Sep 2019 00:34:30 +0000
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
   title=3D"NEW - amdgpu bug: kernel NULL pointer dereference during video =
playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111234#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu bug: kernel NULL pointer dereference during video =
playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111234">bug 11123=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jamespharvey20&#64;gmail.com" title=3D"jamespharvey20&#64;gmail.com">jamesp=
harvey20&#64;gmail.com</a>
</span></b>
        <pre>Just ran into this for my first time.  I've had pretty consist=
ent problems with
the potentially related bug that Nicholas Kazlauskas mentioned at
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D204181">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D204181</a>

Could certainly be the same bug, but definitely has a different backtrace.

Also running KDE, also running multi (5) monitor.

Was on linux 5.2.10, mesa 19.1.6, plasma 5.16.4.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] V=
ega
10 XL/XT [Radeon RX Vega 56/64] (rev c1) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RX Vega64
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 76
        NUMA node: 0
        Region 0: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at d0000000 (64-bit, prefetchable) [size=3D2M]
        Region 4: I/O ports at 8000 [size=3D256]
        Region 5: Memory at dfb00000 (32-bit, non-prefetchable) [size=3D512=
K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[drm] amdgpu kernel modesetting enabled.
fb0: switching to amdgpudrmfb from EFI VGA
[drm] initializing kernel modesetting (VEGA10 0x1002:0x687F 0x1002:0x0B36
0xC1).
[drm] register mmio base: 0xDFB00000
[drm] register mmio size: 524288
[drm] add ip block number 0 &lt;soc15_common&gt;
[drm] add ip block number 1 &lt;gmc_v9_0&gt;
[drm] add ip block number 2 &lt;vega10_ih&gt;
[drm] add ip block number 3 &lt;psp&gt;
[drm] add ip block number 4 &lt;gfx_v9_0&gt;
[drm] add ip block number 5 &lt;sdma_v4_0&gt;
[drm] add ip block number 6 &lt;powerplay&gt;
[drm] add ip block number 7 &lt;dm&gt;
[drm] add ip block number 8 &lt;uvd_v7_0&gt;
[drm] add ip block number 9 &lt;vce_v4_0&gt;
[drm] UVD(0) is enabled in VM mode
[drm] UVD(0) ENC is enabled in VM mode
[drm] VCE enabled in VM mode
[drm] RAS INFO: ras initialized successfully, hardware ability[0] ras_mask[=
0]
[drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is
9-bit
[drm] Detected VRAM RAM=3D8176M, BAR=3D256M
[drm] RAM width 2048bits HBM
[drm] amdgpu: 8176M of VRAM memory ready
[drm] amdgpu: 8176M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
[drm] PCIE GART of 512M enabled (table at 0x000000F400900000).
[drm] use_doorbell being set to: [true]
[drm] use_doorbell being set to: [true]
[drm] Found UVD firmware Version: 65.29 Family ID: 17
[drm] PSP loading UVD firmware
[drm] Found VCE firmware Version: 57.4 Binary ID: 4
[drm] PSP loading VCE firmware
[drm] reserve 0x400000 from 0xf401000000 for PSP TMR SIZE
[drm] Display Core initialized with v3.2.27!
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 59]
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 62]
[drm] DM_MST: Differing MST start on aconnector: (____ptrval____) [id: 65]
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
[drm] UVD and UVD ENC initialized successfully.
[drm] VCE initialized successfully.
[drm] Cannot find any crtc or sizes
[drm] ECC is not present.
[drm] SRAM ECC is not present.
[drm] Initialized amdgpu 3.32.0 20150101 for 0000:05:00.0 on minor 0
[drm] amdgpu_dm_irq_schedule_work FAILED src 8
[drm] DM_MST: added connector: (____ptrval____) [id: 70] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 74] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 78] [master:
(____ptrval____)]
[drm] fb mappable at 0xC1400000
[drm] vram apper at 0xC0000000
[drm] size 14745600
[drm] fb depth is 24
[drm]    pitch is 10240
fbcon: amdgpudrmfb (fb0) is primary device
[drm] DM_MST: added connector: (____ptrval____) [id: 85] [master:
(____ptrval____)]
amdgpu 0000:05:00.0: fb0: amdgpudrmfb frame buffer device
[drm] DM_MST: added connector: (____ptrval____) [id: 89] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 93] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 97] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 107] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 113] [master:
(____ptrval____)]
[drm] DM_MST: added connector: (____ptrval____) [id: 117] [master:
(____ptrval____)]

..........

BUG: kernel NULL pointer dereference, address: 00000000000002b4
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 1 PID: 2678499 Comm: kworker/u65:9 Tainted: G        W  OE=20=20=20=20
5.2.11-arch1-1-ARCH #1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./EP2C602, BIOS
P1.90 04/12/2018
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
Code: 04 00 00 49 8b bc 02 b0 02 00 00 48 8b 07 48 8b 40 50 e8 2d 3b 14 c9 =
b8
01 00 00 00 c3 0f 1f 80 00 00 00 00 66 66 66 66 90 53 &lt;8b&gt; 86 b4 02 0=
0 00 48 89
f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
RSP: 0018:ffffa0c6a365faf8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000005
RDX: ffffffffc0547710 RSI: 0000000000000000 RDI: ffff9a4bd62e5000
RBP: ffff9a4483080000 R08: ffff9a4483080000 R09: 0000000000000000
R10: ffff9a4483080000 R11: 0000000000000018 R12: ffff9a4bd62e5000
R13: ffffa0c6a365fd58 R14: ffff9a4bd67dcff0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff9a4bdf840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000002b4 CR3: 0000000ffbe76005 CR4: 00000000000626e0
Call Trace:
 dc_commit_state+0x99/0x580 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xc5d/0x19a0 [amdgpu]
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? _raw_spin_unlock_irq+0x1d/0x30
 ? finish_task_switch+0x84/0x2d0
 ? preempt_schedule_common+0x32/0x80
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3e0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3e0/0x3e0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x35/0x40
Modules linked in: netlink_diag uas usb_storage xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_mangle iptable_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ebtable_filter ebtables
ip6_tables iptable_filter tun rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver
nfs lockd grace fscache ib_isert iscsi_target_mod msr ib_srpt nct6775 hwmon=
_vid
target_core_mod ib_srp scsi_transport_srp rpcrdma sunrpc rdma_ucm ib_iser
rdma_cm ib_umad iw_cm
ib_ipoib libiscsi scsi_transport_iscsi ib_cm mlx4_ib ib_uverbs mlx4_en ib_c=
ore
nls_iso8859_1 nls_cp437 vfat fat ipmi_ssif intel_rapl sb_edac
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_codec_real=
tek
snd_hda_codec_generic ledtrig_audio kvm snd_hda_codec_hdmi snd_hda_intel br=
idge
snd_hda_codec snd_hda_core stp irqbypass llc intel_cstate snd_hwdep snd_pcm
iTCO_wdt iTCO_vendor_support snd_timer mousedev input_leds joydev pcspkr
intel_uncore ipmi_si mlx4_core mei_me e1000e snd ioatdma
 ipmi_devintf i2c_i801 pcc_cpufreq intel_rapl_perf lpc_ich mei soundcore dca
wmi ipmi_msghandler evdev mac_hid vmmon(OE) vmw_vmci vboxnetflt(OE)
vboxnetadp(OE) vboxpci(OE) vboxdrv(OE) sg crypto_user ip_tables x_tables bt=
rfs
xor raid6_pq dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio libcrc3=
2c
crc32c_generic hid_generic usbhid hid sr_mod cdrom sd_mod dm_crypt dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel isci aesni_i=
ntel
libsas ahci aes_x86_64 crypto_simd scsi_transport_sas libahci cryptd
glue_helper libata ehci_pci scsi_mod ehci_hcd amdgpu gpu_sched i2c_algo_bit=
 ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
CR2: 00000000000002b4
---[ end trace 2c71b3abb2d778a6 ]---
RIP: 0010:dc_stream_log+0x6/0xb0 [amdgpu]
Code: 04 00 00 49 8b bc 02 b0 02 00 00 48 8b 07 48 8b 40 50 e8 2d 3b 14 c9 =
b8
01 00 00 00 c3 0f 1f 80 00 00 00 00 66 66 66 66 90 53 &lt;8b&gt; 86 b4 02 0=
0 00 48 89
f3 48 89 f2 8b 8e 10 01 00 00 bf 04 00 00
RSP: 0018:ffffa0c6a365faf8 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000005
RDX: ffffffffc0547710 RSI: 0000000000000000 RDI: ffff9a4bd62e5000
RBP: ffff9a4483080000 R08: ffff9a4483080000 R09: 0000000000000000
R10: ffff9a4483080000 R11: 0000000000000018 R12: ffff9a4bd62e5000
R13: ffffa0c6a365fd58 R14: ffff9a4bd67dcff0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff9a4bdf840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000002b4 CR3: 0000000ffbe76005 CR4: 00000000000626e0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689396701.42f304941.8572--

--===============1407094165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1407094165==--
