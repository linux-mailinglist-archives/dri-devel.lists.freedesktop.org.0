Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1779CF9894
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EFF10E531;
	Tue,  6 Jan 2026 17:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tw7FouFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62C10E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 17:07:23 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-78c66bdf675so12737337b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767719242; x=1768324042; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q6nTt/11MUDH8R8hrkZ2QVblriU08h0BLeK1WGmhNU8=;
 b=Tw7FouFwZq4Ve4dQPxwc1F6TGAHJzrn328/1T9OPcVexZUVr9M340AMSsaEgPPAGJw
 xR4jp5UrezWNkFC0fqw8JZU5UwH4faut+gS1/HLIe19T1vXwNhP8IEI6/PAKLdJxwjcI
 /zgONL6TKNswyIinYA0nA67A3qSPfAhJS1Mt7HiqvUcHQjapFaKJnyWNbvp0kEYLaJAb
 PLle0FY2nIKQ6SJ57qfVASn9/qKU78VoZpyWKFO+sP+tzPwc0umaSMwGc3DuoKyWLYOi
 HakupiJUkZ42U+6E7PvuqX9My/0TbUHWWHqux6FSVNzOdWajnHEGgLWUHaEhzHpViqVF
 7pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767719242; x=1768324042;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6nTt/11MUDH8R8hrkZ2QVblriU08h0BLeK1WGmhNU8=;
 b=YDUbbEMVLEwYe9lAsCSfoWEGaoBdVw4wQQT5hZXsN1fJVqSj3T7y7vapQ6gC69niPf
 scZ1c0bcSwR7kZNkTDX4mqkqBz+rWmj1JRRmXtTEOSOhiscUD1zePj7HXmoSk6LVVlye
 xkRHs5fv0f/iBnI6dLUO+3qzZEd8T4QojxHCM63YJXH73z89c2mqWCyDQ27LIJwzhlsp
 Rbv1I/h/NS6P9r3ajJm0Kzi8kCuWiViVNTPUUYm4c7fyRy7JMBYJt2YlggLao4Vp9Vh2
 MxDQ1E9wGSccYC2hQZYmmV68YJZl2MtDqaSrVWBEEFSM1syPwBowlVa39gqyTUYKaX9h
 y7qA==
X-Gm-Message-State: AOJu0YxzDVZDOYEj9KE315Ru7a18Wn0fqnnzRyWsZfRH9WFhgVOWbNac
 aJHFZj5IQ4l6Y5Yt85cEnuHHNwIr1vZ9JoB+jcT7CZfYVkLPjNn3Lk7fUFPzAeZTCcV4HZUvpQj
 CVZw9zRxwEjZr6fXasdpbspV9YCH/AlI3zD4+2fM=
X-Gm-Gg: AY/fxX6lCBAhTAY9mN7g7d68mmlgO9VX2KFyzfcZjQRuBvQGMJZQVdXkry+UHU0lPK+
 2cl6oN6rrOlb8qabZPxTmlpxP/MrhA/Mhwk6iy3vZql0owLeqJXyrTL1S/O7K8sSLGzRswBTQv3
 e5pptovcJuTwAJe3GhOPGsWQ0JU2BPd0Vx9psAcHQ11sKqJJZy1hm4NwJ18+yZyRgF0ajZamxfK
 S8JKLOrUAUMkkeCk3/R7OTJjlyHVssxVSYlaX6zXOEHun8zbJkSLA+5T9ngdQ4AKCthbcfhZRQ5
 te5VKAxuhM7LYSB7QjhGTJLQy/QUtayC4yRGJASSp0K3StAbk56Dn4c6jSmlma5rlPQLJFnLOVC
 tKCnXEOYkP7KYqA3oSW2PglrFVXKuTgM75UI/NEFcjwIgSLZY9gLhiNDS2Qs+2RxiI/53iw3jDH
 SetMf5FA==
X-Google-Smtp-Source: AGHT+IH3ns3qcLsuyziFRxibcF6slu4HcENIZdI/yJNA5wSAEWxegWGV8pJcRnXFcQEYamZlGx5cD/OleihTrg5dDgQ=
X-Received: by 2002:a05:690e:1a63:b0:645:5467:29f3 with SMTP id
 956f58d0204a3-6470c88c2cbmr1995668d50.39.1767719241691; Tue, 06 Jan 2026
 09:07:21 -0800 (PST)
MIME-Version: 1.0
From: Satadru Pramanik <satadru@gmail.com>
Date: Tue, 6 Jan 2026 12:07:08 -0500
X-Gm-Features: AQt7F2pNquY56YVyxHy7ydQknVqSs1iLvrhNmAvZitHOaqj9cOig4ZyHNGKMZPw
Message-ID: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
Subject: 6.19.0-rc4 regression from 6.19.0-rc3 in i915: [drm] PCH PWM1 enabled
To: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000076b6110647bb353c"
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

--00000000000076b6110647bb353c
Content-Type: text/plain; charset="UTF-8"

Hello all, I'm newly getting this in my dmesg on my MacBookPro11,3 after
updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I'm using the
nouveau driver for my display, but this warning appears to be from i915,
which my laptop also may be using for some portion of display enablement.

[  200.760128] ------------[ cut here ]------------
[  200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled
[  200.760134] WARNING:
drivers/gpu/drm/i915/display/intel_display_power.c:1234 at
hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378
[  200.760351] Modules linked in: snd_seq_dummy snd_hrtimer
scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic libdes
md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdriver
nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859_1
cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE)
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_leds
i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic
snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coretemp
facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg
snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi
videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event
drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_bit
btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) joydev
hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_support
applesmc ghash_clmulni_intel nvme ttm rapl bluetooth
[  200.760418]  snd_seq intel_cstate uas usbhid drm_display_helper snd_pcm
nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbolt
apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux
usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device
acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd
industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash
dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp
parport nfnetlink dmi_sysfs autofs4 aesni_intel
[  200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainted: P     U
 W  OE       6.19.0-rc4 #1 PREEMPT(lazy)
[  200.760466] Tainted: [P]=PROPRIETARY_MODULE, [U]=USER, [W]=WARN,
[O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[  200.760468] Hardware name: Apple Inc.
MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
[  200.760470] Workqueue: pm pm_runtime_work
[  200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gnu
(enabled+all), task: runnable_at=+0ms
[  200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]
[  200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d 85
e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6
<67> 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84
[  200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282
[  200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:
ffffffffc180f0d0
[  200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:
ffffffffc1c038d0
[  200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:
0000000000000064
[  200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff920742008030
[  200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:
ffff920740ed4000
[  200.760666] FS:  0000000000000000(0000) GS:ffff920b06bfd000(0000)
knlGS:0000000000000000
[  200.760668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:
00000000001726f0
[  200.760671] Call Trace:
[  200.760673]  <TASK>
[  200.760678]  intel_display_power_suspend+0x61/0x80 [i915]
[  200.760852]  intel_runtime_suspend+0xd7/0x230 [i915]
[  200.760963]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[  200.760970]  pci_pm_runtime_suspend+0x6a/0x1a0
[  200.760974]  __rpm_callback+0x4b/0x1f0
[  200.760979]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[  200.760983]  rpm_callback+0x6f/0x80
[  200.760986]  rpm_suspend+0xe1/0x5e0
[  200.760990]  ? __schedule+0x44b/0x1650
[  200.760996]  pm_runtime_work+0x91/0xa0
[  200.761000]  process_one_work+0x188/0x360
[  200.761005]  worker_thread+0x327/0x460
[  200.761007]  ? __pfx_worker_thread+0x10/0x10
[  200.761010]  kthread+0x10b/0x220
[  200.761015]  ? __pfx_kthread+0x10/0x10
[  200.761018]  ret_from_fork+0x16e/0x1e0
[  200.761023]  ? __pfx_kthread+0x10/0x10
[  200.761027]  ret_from_fork_asm+0x1a/0x30
[  200.761034]  </TASK>
[  200.761035] ---[ end trace 0000000000000000 ]---


inxi -IG gives me this:
Graphics:
  Device-1: Intel Crystal Well Integrated Graphics driver: i915 v: kernel
  Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
    v: kernel
  Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
    compositor: gnome-shell v: 49.0 driver: X: loaded: modesetting
    unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution:
3840x2400~60Hz
  API: EGL v: 1.5 drivers: crocus,nouveau,swrast
    platforms: gbm,wayland,x11,surfaceless,device
  API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa
    v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7
  API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe
    surfaces: xcb,xlib,wayland
  Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
    xprop, xrandr
Info:
  Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)
  Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39

Please let me know if I'm sending this to the wrong list?

Regards,

Satadru Pramanik

--00000000000076b6110647bb353c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all, I&#39;m newly getting this in my dmesg on =
my MacBookPro11,3 after updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25=
.10. I&#39;m using the nouveau driver for my display, but this warning appe=
ars to be from i915, which my laptop also may be using for some portion of =
display enablement.</div><div><br></div><div>[ =C2=A0200.760128] ----------=
--[ cut here ]------------<br>[ =C2=A0200.760132] i915 0000:00:02.0: [drm] =
PCH PWM1 enabled<br>[ =C2=A0200.760134] WARNING: drivers/gpu/drm/i915/displ=
ay/intel_display_power.c:1234 at hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: =
kworker/u32:6/1378<br>[ =C2=A0200.760351] Modules linked in: snd_seq_dummy =
snd_hrtimer scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_ge=
neric libdes md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklay=
outdriver nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_is=
o8859_1 cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(=
POE) intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_=
leds i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic snd_hda_codec_=
nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coretemp facetimehd(OE) =
snd_hda_intel gpu_sched btusb videobuf2_dma_sg snd_intel_dspcfg drm_gpuvm v=
ideobuf2_memops btrtl snd_intel_sdw_acpi videobuf2_v4l2 snd_seq_midi snd_hd=
a_codec btintel snd_seq_midi_event drm_exec drm_buddy iTCO_wdt videodev kvm=
_intel btbcm mxm_wmi i2c_algo_bit btmtk snd_hwdep intel_pmc_bxt snd_rawmidi=
 spi_intel_platform wl(POE) joydev hid_generic videobuf2_common kvm spi_int=
el snd_hda_core iTCO_vendor_support applesmc ghash_clmulni_intel nvme ttm r=
apl bluetooth<br>[ =C2=A0200.760418] =C2=A0snd_seq intel_cstate uas usbhid =
drm_display_helper snd_pcm nvme_core cfg80211 cec efi_pstore rc_core hid mc=
 bcm5974 sbs thunderbolt apple_mfi_fastcharge drm_client_lib i2c_i801 drm_k=
ms_helper i2c_mux usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux =
snd_seq_device acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm =
snd industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash d=
m_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp parport=
 nfnetlink dmi_sysfs autofs4 aesni_intel<br>[ =C2=A0200.760461] CPU: 0 UID:=
 0 PID: 1378 Comm: kworker/u32:6 Tainted: P =C2=A0 =C2=A0 U =C2=A0W =C2=A0O=
E =C2=A0 =C2=A0 =C2=A0 6.19.0-rc4 #1 PREEMPT(lazy) <br>[ =C2=A0200.760466] =
Tainted: [P]=3DPROPRIETARY_MODULE, [U]=3DUSER, [W]=3DWARN, [O]=3DOOT_MODULE=
, [E]=3DUNSIGNED_MODULE<br>[ =C2=A0200.760468] Hardware name: Apple Inc. Ma=
cBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021<br>[ =C2=A0=
200.760470] Workqueue: pm pm_runtime_work<br>[ =C2=A0200.760478] Sched_ext:=
 lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gnu (enabled+all), task: runnab=
le_at=3D+0ms<br>[ =C2=A0200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i=
915]<br>[ =C2=A0200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b=
 67 50 4d 85 e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2=
 48 89 c6 &lt;67&gt; 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 =
00 0f 84<br>[ =C2=A0200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282=
<br>[ =C2=A0200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX: ff=
ffffffc180f0d0<br>[ =C2=A0200.760660] RDX: ffff920742008030 RSI: ffffffffc1=
d688a4 RDI: ffffffffc1c038d0<br>[ =C2=A0200.760661] RBP: ffffaf668250fc90 R=
08: 0000000000000002 R09: 0000000000000064<br>[ =C2=A0200.760663] R10: 0000=
000000000000 R11: 0000000000000001 R12: ffff920742008030<br>[ =C2=A0200.760=
664] R13: ffff920740ed4000 R14: 0000000000000000 R15: ffff920740ed4000<br>[=
 =C2=A0200.760666] FS: =C2=A00000000000000000(0000) GS:ffff920b06bfd000(000=
0) knlGS:0000000000000000<br>[ =C2=A0200.760668] CS: =C2=A00010 DS: 0000 ES=
: 0000 CR0: 0000000080050033<br>[ =C2=A0200.760669] CR2: 00007f72423b701c C=
R3: 00000001777eb004 CR4: 00000000001726f0<br>[ =C2=A0200.760671] Call Trac=
e:<br>[ =C2=A0200.760673] =C2=A0&lt;TASK&gt;<br>[ =C2=A0200.760678] =C2=A0i=
ntel_display_power_suspend+0x61/0x80 [i915]<br>[ =C2=A0200.760852] =C2=A0in=
tel_runtime_suspend+0xd7/0x230 [i915]<br>[ =C2=A0200.760963] =C2=A0? __pfx_=
pci_pm_runtime_suspend+0x10/0x10<br>[ =C2=A0200.760970] =C2=A0pci_pm_runtim=
e_suspend+0x6a/0x1a0<br>[ =C2=A0200.760974] =C2=A0__rpm_callback+0x4b/0x1f0=
<br>[ =C2=A0200.760979] =C2=A0? __pfx_pci_pm_runtime_suspend+0x10/0x10<br>[=
 =C2=A0200.760983] =C2=A0rpm_callback+0x6f/0x80<br>[ =C2=A0200.760986] =C2=
=A0rpm_suspend+0xe1/0x5e0<br>[ =C2=A0200.760990] =C2=A0? __schedule+0x44b/0=
x1650<br>[ =C2=A0200.760996] =C2=A0pm_runtime_work+0x91/0xa0<br>[ =C2=A0200=
.761000] =C2=A0process_one_work+0x188/0x360<br>[ =C2=A0200.761005] =C2=A0wo=
rker_thread+0x327/0x460<br>[ =C2=A0200.761007] =C2=A0? __pfx_worker_thread+=
0x10/0x10<br>[ =C2=A0200.761010] =C2=A0kthread+0x10b/0x220<br>[ =C2=A0200.7=
61015] =C2=A0? __pfx_kthread+0x10/0x10<br>[ =C2=A0200.761018] =C2=A0ret_fro=
m_fork+0x16e/0x1e0<br>[ =C2=A0200.761023] =C2=A0? __pfx_kthread+0x10/0x10<b=
r>[ =C2=A0200.761027] =C2=A0ret_from_fork_asm+0x1a/0x30<br>[ =C2=A0200.7610=
34] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0200.761035] ---[ end trace 0000000000000=
000 ]---</div><div><br></div><div><br></div><div>inxi -IG gives me this:<br=
>Graphics:<br>=C2=A0 Device-1: Intel Crystal Well Integrated Graphics drive=
r: i915 v: kernel<br>=C2=A0 Device-2: NVIDIA GK107M [GeForce GT 750M Mac Ed=
ition] driver: nouveau<br>=C2=A0 =C2=A0 v: kernel<br>=C2=A0 Display: waylan=
d server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8<br>=C2=A0 =C2=A0 composi=
tor: gnome-shell v: 49.0 driver: X: loaded: modesetting<br>=C2=A0 =C2=A0 un=
loaded: fbdev,vesa dri: nouveau gpu: nouveau resolution: 3840x2400~60Hz<br>=
=C2=A0 API: EGL v: 1.5 drivers: crocus,nouveau,swrast<br>=C2=A0 =C2=A0 plat=
forms: gbm,wayland,x11,surfaceless,device<br>=C2=A0 API: OpenGL v: 4.6 comp=
at-v: 4.3 vendor: mesa<br>=C2=A0 =C2=A0 v: 25.3.2+git2512181741.a943c55aea0=
~q~mesarc2 renderer: NVE7<br>=C2=A0 API: Vulkan v: 1.4.321 drivers: nvk,int=
el,llvmpipe<br>=C2=A0 =C2=A0 surfaces: xcb,xlib,wayland<br>=C2=A0 Info: Too=
ls: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,<br>=C2=A0 =
=C2=A0 xprop, xrandr<br>Info:<br>=C2=A0 Memory: total: 16 GiB available: 15=
.53 GiB used: 4.85 GiB (31.2%)<br>=C2=A0 Processes: 468 Uptime: 17m Shell: =
Bash inxi: 3.3.39</div><div><br></div><div>Please let me know if I&#39;m se=
nding this to the wrong list?</div><div><br></div><div>Regards,</div><div><=
br></div><div>Satadru Pramanik</div></div>

--00000000000076b6110647bb353c--
