Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A9A93E6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 22:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FC189B20;
	Wed,  4 Sep 2019 20:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5174C89C82
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 20:41:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4E74F72161; Wed,  4 Sep 2019 20:41:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 04 Sep 2019 20:41:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spam@vidarholen.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-n0XaFl6e0M@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1514995052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1514995052==
Content-Type: multipart/alternative; boundary="15676296934.9E061fd3.6933"
Content-Transfer-Encoding: 7bit


--15676296934.9E061fd3.6933
Date: Wed, 4 Sep 2019 20:41:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #95 from koala_man <spam@vidarholen.net> ---
I am also seeing this issue on my stock Ubuntu.=20

>OS Info can be taken from neofetch
OS: Ubuntu 19.04 x86_64
Host: All Series
Kernel: 5.0.0-27-generic
Uptime: 8 mins
Packages: 2671 (dpkg), 6 (flatpak), 10 (snap)
Shell: bash 5.0.3
Terminal: /dev/pts/1
CPU: Intel i5-4690 (4) @ 3.900GHz
GPU: Intel HD Graphics
GPU: AMD ATI Radeon RX Vega 64
Memory: 861MiB / 23976MiB

> glxinfo | grep "OpenGL version"=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.8

>Game being played
glxgears in a window, no other applications running

>Native or Wine or Wine+DXVK
Native

> Crash type:=20
X crashed with colorful pattern, stopped responding to Ctrl-Alt-Fx. `ssh` s=
till
works. X server does not accept new commands, e.g. `DISPLAY=3D:0 glxgears`

>sudo dmesg | grep amdgpu
[    2.328917] [drm] amdgpu kernel modesetting enabled.
[    2.331916] fb0: switching to amdgpudrmfb from EFI VGA
[    2.333325] amdgpu 0000:03:00.0: No more image in the PCI ROM
[    2.333400] amdgpu 0000:03:00.0: VRAM: 8176M 0x000000F400000000 -
0x000000F5FEFFFFFF (8176M used)
[    2.333401] amdgpu 0000:03:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    2.333403] amdgpu 0000:03:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    2.333866] [drm] amdgpu: 8176M of VRAM memory ready
[    2.333870] [drm] amdgpu: 8176M of GTT memory ready.
[    2.871622] fbcon: amdgpudrmfb (fb0) is primary device
[    2.929315] amdgpu 0000:03:00.0: fb0: amdgpudrmfb frame buffer device
[    2.944233] amdgpu 0000:03:00.0: ring gfx uses VM inv eng 0 on hub 0
[    2.944249] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    2.944264] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    2.944279] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    2.944294] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    2.944308] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    2.944323] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    2.944338] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    2.944353] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    2.944368] amdgpu 0000:03:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    2.944382] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    2.944396] amdgpu 0000:03:00.0: ring page0 uses VM inv eng 1 on hub 1
[    2.944410] amdgpu 0000:03:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    2.944424] amdgpu 0000:03:00.0: ring page1 uses VM inv eng 5 on hub 1
[    2.944438] amdgpu 0000:03:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    2.944452] amdgpu 0000:03:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    2.944467] amdgpu 0000:03:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    2.944482] amdgpu 0000:03:00.0: ring vce0 uses VM inv eng 9 on hub 1
[    2.944496] amdgpu 0000:03:00.0: ring vce1 uses VM inv eng 10 on hub 1
[    2.944510] amdgpu 0000:03:00.0: ring vce2 uses VM inv eng 11 on hub 1
[    2.945073] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:03:00.0 on
minor 1
[  288.676190] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D72560, emitted seq=3D72562
[  288.676350] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glxgears pid 2963 thread glxgears:cs0 pid 2964
[  288.676358] amdgpu 0000:03:00.0: GPU reset begin!
[  288.759763] amdgpu 0000:03:00.0: GPU reset
[  289.208563] RIP: 0010:amdgpu_cs_ioctl+0xaa3/0x1320 [amdgpu]
[  289.208604]  ? amdgpu_cs_find_mapping+0x120/0x120 [amdgpu]
[  289.208647]  ? amdgpu_cs_find_mapping+0x120/0x120 [amdgpu]
[  289.208673]  amdgpu_drm_ioctl+0x4f/0x80 [amdgpu]
[  289.208690] Modules linked in: aufs overlay cmac bnep binfmt_misc
nls_iso8859_1 snd_hda_codec_ca0132 snd_hda_codec_realtek snd_hda_codec_gene=
ric
snd_hda_codec_hdmi ledtrig_audio snd_hda_intel snd_hda_codec snd_hda_core
snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi btusb input_l=
eds
btrtl btbcm btintel bluetooth eeepc_wmi asus_wmi snd_seq ecdh_generic
intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp sparse_keymap
kvm_intel intel_cstate intel_rapl_perf snd_seq_device snd_timer wmi_bmof snd
soundcore mei_me mei tpm_infineon mac_hid acpi_pad sch_fq_codel parport_pc
ppdev lp parport ip_tables x_tables autofs4 algif_skcipher af_alg hid_gener=
ic
usbhid hid dm_crypt crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel amdgpu i915 kvmgt vfio_mdev mdev chash aes_x86_64 amd_iommu_v2
crypto_simd vfio_iommu_type1 gpu_sched cryptd glue_helper ttm vfio ahci lib=
ahci
i2c_i801 kvm mxm_wmi lpc_ich irqbypass i2c_algo_bit pata_acpi e1000e
drm_kms_helper syscopyarea sysfillrect
[  289.208743] RIP: 0010:amdgpu_cs_ioctl+0xaa3/0x1320 [amdgpu]
[  289.395715] amdgpu 0000:03:00.0: GPU reset succeeded, trying to resume
[  289.395813] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is los=
t!
[  289.969158] amdgpu 0000:03:00.0: GPU reset(2) succeeded!
[  289.969333] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  289.969519] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!


>sudo journalctl -b | grep amdgpu

Same as dmesg output (after dropping timestamps), verified by vimdiff.

>Other

No swap, 144hz monitor, GPU was very hot to the touch considering it had on=
ly
run glxgears @ 144 fps for 5 minutes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676296934.9E061fd3.6933
Date: Wed, 4 Sep 2019 20:41:33 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c95">Comme=
nt # 95</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
spam&#64;vidarholen.net" title=3D"koala_man &lt;spam&#64;vidarholen.net&gt;=
"> <span class=3D"fn">koala_man</span></a>
</span></b>
        <pre>I am also seeing this issue on my stock Ubuntu.=20

<span class=3D"quote">&gt;OS Info can be taken from neofetch</span >
OS: Ubuntu 19.04 x86_64
Host: All Series
Kernel: 5.0.0-27-generic
Uptime: 8 mins
Packages: 2671 (dpkg), 6 (flatpak), 10 (snap)
Shell: bash 5.0.3
Terminal: /dev/pts/1
CPU: Intel i5-4690 (4) &#64; 3.900GHz
GPU: Intel HD Graphics
GPU: AMD ATI Radeon RX Vega 64
Memory: 861MiB / 23976MiB

<span class=3D"quote">&gt; glxinfo | grep &quot;OpenGL version&quot; </span=
 >
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.8

<span class=3D"quote">&gt;Game being played</span >
glxgears in a window, no other applications running

<span class=3D"quote">&gt;Native or Wine or Wine+DXVK</span >
Native

<span class=3D"quote">&gt; Crash type: </span >
X crashed with colorful pattern, stopped responding to Ctrl-Alt-Fx. `ssh` s=
till
works. X server does not accept new commands, e.g. `DISPLAY=3D:0 glxgears`

<span class=3D"quote">&gt;sudo dmesg | grep amdgpu</span >
[    2.328917] [drm] amdgpu kernel modesetting enabled.
[    2.331916] fb0: switching to amdgpudrmfb from EFI VGA
[    2.333325] amdgpu 0000:03:00.0: No more image in the PCI ROM
[    2.333400] amdgpu 0000:03:00.0: VRAM: 8176M 0x000000F400000000 -
0x000000F5FEFFFFFF (8176M used)
[    2.333401] amdgpu 0000:03:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    2.333403] amdgpu 0000:03:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    2.333866] [drm] amdgpu: 8176M of VRAM memory ready
[    2.333870] [drm] amdgpu: 8176M of GTT memory ready.
[    2.871622] fbcon: amdgpudrmfb (fb0) is primary device
[    2.929315] amdgpu 0000:03:00.0: fb0: amdgpudrmfb frame buffer device
[    2.944233] amdgpu 0000:03:00.0: ring gfx uses VM inv eng 0 on hub 0
[    2.944249] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    2.944264] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    2.944279] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    2.944294] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    2.944308] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    2.944323] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    2.944338] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    2.944353] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    2.944368] amdgpu 0000:03:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    2.944382] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    2.944396] amdgpu 0000:03:00.0: ring page0 uses VM inv eng 1 on hub 1
[    2.944410] amdgpu 0000:03:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    2.944424] amdgpu 0000:03:00.0: ring page1 uses VM inv eng 5 on hub 1
[    2.944438] amdgpu 0000:03:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    2.944452] amdgpu 0000:03:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    2.944467] amdgpu 0000:03:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    2.944482] amdgpu 0000:03:00.0: ring vce0 uses VM inv eng 9 on hub 1
[    2.944496] amdgpu 0000:03:00.0: ring vce1 uses VM inv eng 10 on hub 1
[    2.944510] amdgpu 0000:03:00.0: ring vce2 uses VM inv eng 11 on hub 1
[    2.945073] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:03:00.0 on
minor 1
[  288.676190] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D72560, emitted seq=3D72562
[  288.676350] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glxgears pid 2963 thread glxgears:cs0 pid 2964
[  288.676358] amdgpu 0000:03:00.0: GPU reset begin!
[  288.759763] amdgpu 0000:03:00.0: GPU reset
[  289.208563] RIP: 0010:amdgpu_cs_ioctl+0xaa3/0x1320 [amdgpu]
[  289.208604]  ? amdgpu_cs_find_mapping+0x120/0x120 [amdgpu]
[  289.208647]  ? amdgpu_cs_find_mapping+0x120/0x120 [amdgpu]
[  289.208673]  amdgpu_drm_ioctl+0x4f/0x80 [amdgpu]
[  289.208690] Modules linked in: aufs overlay cmac bnep binfmt_misc
nls_iso8859_1 snd_hda_codec_ca0132 snd_hda_codec_realtek snd_hda_codec_gene=
ric
snd_hda_codec_hdmi ledtrig_audio snd_hda_intel snd_hda_codec snd_hda_core
snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi btusb input_l=
eds
btrtl btbcm btintel bluetooth eeepc_wmi asus_wmi snd_seq ecdh_generic
intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp sparse_keymap
kvm_intel intel_cstate intel_rapl_perf snd_seq_device snd_timer wmi_bmof snd
soundcore mei_me mei tpm_infineon mac_hid acpi_pad sch_fq_codel parport_pc
ppdev lp parport ip_tables x_tables autofs4 algif_skcipher af_alg hid_gener=
ic
usbhid hid dm_crypt crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel amdgpu i915 kvmgt vfio_mdev mdev chash aes_x86_64 amd_iommu_v2
crypto_simd vfio_iommu_type1 gpu_sched cryptd glue_helper ttm vfio ahci lib=
ahci
i2c_i801 kvm mxm_wmi lpc_ich irqbypass i2c_algo_bit pata_acpi e1000e
drm_kms_helper syscopyarea sysfillrect
[  289.208743] RIP: 0010:amdgpu_cs_ioctl+0xaa3/0x1320 [amdgpu]
[  289.395715] amdgpu 0000:03:00.0: GPU reset succeeded, trying to resume
[  289.395813] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is los=
t!
[  289.969158] amdgpu 0000:03:00.0: GPU reset(2) succeeded!
[  289.969333] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  289.969519] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!


<span class=3D"quote">&gt;sudo journalctl -b | grep amdgpu</span >

Same as dmesg output (after dropping timestamps), verified by vimdiff.

<span class=3D"quote">&gt;Other</span >

No swap, 144hz monitor, GPU was very hot to the touch considering it had on=
ly
run glxgears &#64; 144 fps for 5 minutes.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676296934.9E061fd3.6933--

--===============1514995052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1514995052==--
