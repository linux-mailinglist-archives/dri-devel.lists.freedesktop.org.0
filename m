Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B518F3D72
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 02:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C1C6F823;
	Fri,  8 Nov 2019 01:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7C6F826
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 01:35:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 49B63720E2; Fri,  8 Nov 2019 01:35:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Fri, 08 Nov 2019 01:35:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-UWOiluzafk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0123923357=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0123923357==
Content-Type: multipart/alternative; boundary="15731769251.87eCdEf8.13775"
Content-Transfer-Encoding: 7bit


--15731769251.87eCdEf8.13775
Date: Fri, 8 Nov 2019 01:35:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #39 from Shmerl <shtetldik@gmail.com> ---
With kernel 5.4-rc6 I'm now seeing such errors once in 20 minutes or so:

[37947.927301] WARNING: CPU: 5 PID: 992 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2806
dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[37947.927301] Modules linked in: snd_seq_dummy(E) snd_seq(E) macvtap(E)
macvlan(E) tap(E) xt_CHECKSUM(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_tcpudp(=
E)
nft_compat(E) nft_counter(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E)
nf_defrag_ipv6(E) nf_defrag_ipv4(E) tun(E) bridge(E) stp(E) llc(E) rfcomm(E)
nf_tables(E) nfnetlink(E) bnep(E) edac_mce_amd(E) kvm_amd(E) kvm(E)
irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) ghash_clmulni_intel(E)
btusb(E) snd_hda_codec_realtek(E) btrtl(E) btbcm(E) snd_hda_codec_generic(E)
btintel(E) ledtrig_audio(E) iwlmvm(E) snd_hda_codec_hdmi(E) bluetooth(E)
uvcvideo(E) snd_hda_intel(E) mac80211(E) videobuf2_vmalloc(E) snd_intel_nhl=
t(E)
videobuf2_memops(E) libarc4(E) snd_usb_audio(E) videobuf2_v4l2(E) nls_ascii=
(E)
snd_hda_codec(E) efi_pstore(E) videobuf2_common(E) snd_usbmidi_lib(E)
nls_cp437(E) snd_rawmidi(E) aesni_intel(E) snd_hda_core(E) snd_seq_device(E)
vfat(E) snd_hwdep(E) videodev(E) crypto_simd(E) drbg(E) fat(E) cryptd(E)
iwlwifi(E) snd_pcm(E) mc(E)
[37947.927323]  glue_helper(E) ansi_cprng(E) wmi_bmof(E) efivars(E) pcspkr(=
E)
sp5100_tco(E) snd_timer(E) ecdh_generic(E) ecc(E) ccp(E) watchdog(E) snd(E)
k10temp(E) crc16(E) soundcore(E) sg(E) rng_core(E) cfg80211(E) rfkill(E)
evdev(E) acpi_cpufreq(E) nct6775(E) hwmon_vid(E) parport_pc(E) ppdev(E) lp(=
E)
parport(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E)
xor(E) zstd_decompress(E) zstd_compress(E) raid6_pq(E) libcrc32c(E)
crc32c_generic(E) sd_mod(E) hid_generic(E) usbhid(E) hid(E) amdgpu(E)
gpu_sched(E) ttm(E) drm_kms_helper(E) ahci(E) mxm_wmi(E) libahci(E) drm(E)
crc32c_intel(E) xhci_pci(E) libata(E) xhci_hcd(E) i2c_piix4(E) mfd_core(E)
igb(E) scsi_mod(E) dca(E) usbcore(E) ptp(E) pps_core(E) i2c_algo_bit(E) nvm=
e(E)
nvme_core(E) wmi(E) button(E)
[37947.927347] CPU: 5 PID: 992 Comm: Xorg Tainted: G        W   E=20=20=20=
=20
5.4.0-rc6+ #29
[37947.927348] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.11 09/25/2019
[37947.927424] RIP: 0010:dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[37947.927426] Code: 5d 41 5c 41 5d e9 d0 fc ff ff f2 0f 11 85 70 21 00 00 =
31
d2 48 89 ee 4c 89 e7 e8 bb fc ff ff 41 89 c5 22 85 c8 1d 00 00 75 04 <0f> 0=
b eb
92 c6 85 c8 1d 00 00 00 41 89 c5 eb 86 0f 1f 44 00 00 41
[37947.927427] RSP: 0018:ffffbf3b41e67ad0 EFLAGS: 00010246
[37947.927428] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000017795
[37947.927429] RDX: 0000000000017794 RSI: ffff9e69fe96db40 RDI:
000000000002db40
[37947.927429] RBP: ffff9e695ce90000 R08: 0000000000000006 R09:
0000000000000000
[37947.927430] R10: ffff9e69eb8f0000 R11: 0000000100000001 R12:
ffff9e69eb8f0000
[37947.927431] R13: 0000000000000001 R14: 0000000000000000 R15:
ffff9e695ce90000
[37947.927432] FS:  00007f4774b06f00(0000) GS:ffff9e69fe940000(0000)
knlGS:0000000000000000
[37947.927433] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[37947.927434] CR2: 00007f46bc3c5200 CR3: 00000007dc9ba000 CR4:
0000000000340ee0
[37947.927434] Call Trace:
[37947.927508]  dc_validate_global_state+0x25f/0x2d0 [amdgpu]
[37947.927581]  amdgpu_dm_atomic_check+0x5a1/0x7e0 [amdgpu]
[37947.927597]  drm_atomic_check_only+0x554/0x7e0 [drm]
[37947.927611]  ? drm_connector_list_iter_next+0x7d/0x90 [drm]
[37947.927622]  drm_atomic_commit+0x13/0x50 [drm]
[37947.927634]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[37947.927648]  drm_mode_obj_set_property_ioctl+0x159/0x2b0 [drm]
[37947.927661]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[37947.927671]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[37947.927681]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[37947.927691]  drm_ioctl+0x208/0x390 [drm]
[37947.927702]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[37947.927750]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[37947.927754]  do_vfs_ioctl+0x40e/0x670
[37947.927757]  ? do_setitimer+0xde/0x230
[37947.927759]  ksys_ioctl+0x5e/0x90
[37947.927761]  __x64_sys_ioctl+0x16/0x20
[37947.927763]  do_syscall_64+0x52/0x160
[37947.927766]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[37947.927768] RIP: 0033:0x7f477504e5d7
[37947.927769] Code: 00 00 90 48 8b 05 b9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 89 78 0c 00 f7 d8 64 89 01 48
[37947.927770] RSP: 002b:00007ffcbf170a38 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[37947.927771] RAX: ffffffffffffffda RBX: 00007ffcbf170a70 RCX:
00007f477504e5d7
[37947.927772] RDX: 00007ffcbf170a70 RSI: 00000000c01064ab RDI:
000000000000000d
[37947.927773] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007f477471ad10
[37947.927773] R10: 00007f477471ad20 R11: 0000000000003246 R12:
000055962a2ad220
[37947.927774] R13: 000000000000000d R14: 0000559627814780 R15:
0000000000000000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731769251.87eCdEf8.13775
Date: Fri, 8 Nov 2019 01:35:25 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>With kernel 5.4-rc6 I'm now seeing such errors once in 20 minu=
tes or so:

[37947.927301] WARNING: CPU: 5 PID: 992 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2806
dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[37947.927301] Modules linked in: snd_seq_dummy(E) snd_seq(E) macvtap(E)
macvlan(E) tap(E) xt_CHECKSUM(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_tcpudp(=
E)
nft_compat(E) nft_counter(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E)
nf_defrag_ipv6(E) nf_defrag_ipv4(E) tun(E) bridge(E) stp(E) llc(E) rfcomm(E)
nf_tables(E) nfnetlink(E) bnep(E) edac_mce_amd(E) kvm_amd(E) kvm(E)
irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) ghash_clmulni_intel(E)
btusb(E) snd_hda_codec_realtek(E) btrtl(E) btbcm(E) snd_hda_codec_generic(E)
btintel(E) ledtrig_audio(E) iwlmvm(E) snd_hda_codec_hdmi(E) bluetooth(E)
uvcvideo(E) snd_hda_intel(E) mac80211(E) videobuf2_vmalloc(E) snd_intel_nhl=
t(E)
videobuf2_memops(E) libarc4(E) snd_usb_audio(E) videobuf2_v4l2(E) nls_ascii=
(E)
snd_hda_codec(E) efi_pstore(E) videobuf2_common(E) snd_usbmidi_lib(E)
nls_cp437(E) snd_rawmidi(E) aesni_intel(E) snd_hda_core(E) snd_seq_device(E)
vfat(E) snd_hwdep(E) videodev(E) crypto_simd(E) drbg(E) fat(E) cryptd(E)
iwlwifi(E) snd_pcm(E) mc(E)
[37947.927323]  glue_helper(E) ansi_cprng(E) wmi_bmof(E) efivars(E) pcspkr(=
E)
sp5100_tco(E) snd_timer(E) ecdh_generic(E) ecc(E) ccp(E) watchdog(E) snd(E)
k10temp(E) crc16(E) soundcore(E) sg(E) rng_core(E) cfg80211(E) rfkill(E)
evdev(E) acpi_cpufreq(E) nct6775(E) hwmon_vid(E) parport_pc(E) ppdev(E) lp(=
E)
parport(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) xfs(E) btrfs(E)
xor(E) zstd_decompress(E) zstd_compress(E) raid6_pq(E) libcrc32c(E)
crc32c_generic(E) sd_mod(E) hid_generic(E) usbhid(E) hid(E) amdgpu(E)
gpu_sched(E) ttm(E) drm_kms_helper(E) ahci(E) mxm_wmi(E) libahci(E) drm(E)
crc32c_intel(E) xhci_pci(E) libata(E) xhci_hcd(E) i2c_piix4(E) mfd_core(E)
igb(E) scsi_mod(E) dca(E) usbcore(E) ptp(E) pps_core(E) i2c_algo_bit(E) nvm=
e(E)
nvme_core(E) wmi(E) button(E)
[37947.927347] CPU: 5 PID: 992 Comm: Xorg Tainted: G        W   E=20=20=20=
=20
5.4.0-rc6+ #29
[37947.927348] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X570 Taichi, BIOS P2.11 09/25/2019
[37947.927424] RIP: 0010:dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[37947.927426] Code: 5d 41 5c 41 5d e9 d0 fc ff ff f2 0f 11 85 70 21 00 00 =
31
d2 48 89 ee 4c 89 e7 e8 bb fc ff ff 41 89 c5 22 85 c8 1d 00 00 75 04 &lt;0f=
&gt; 0b eb
92 c6 85 c8 1d 00 00 00 41 89 c5 eb 86 0f 1f 44 00 00 41
[37947.927427] RSP: 0018:ffffbf3b41e67ad0 EFLAGS: 00010246
[37947.927428] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000017795
[37947.927429] RDX: 0000000000017794 RSI: ffff9e69fe96db40 RDI:
000000000002db40
[37947.927429] RBP: ffff9e695ce90000 R08: 0000000000000006 R09:
0000000000000000
[37947.927430] R10: ffff9e69eb8f0000 R11: 0000000100000001 R12:
ffff9e69eb8f0000
[37947.927431] R13: 0000000000000001 R14: 0000000000000000 R15:
ffff9e695ce90000
[37947.927432] FS:  00007f4774b06f00(0000) GS:ffff9e69fe940000(0000)
knlGS:0000000000000000
[37947.927433] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[37947.927434] CR2: 00007f46bc3c5200 CR3: 00000007dc9ba000 CR4:
0000000000340ee0
[37947.927434] Call Trace:
[37947.927508]  dc_validate_global_state+0x25f/0x2d0 [amdgpu]
[37947.927581]  amdgpu_dm_atomic_check+0x5a1/0x7e0 [amdgpu]
[37947.927597]  drm_atomic_check_only+0x554/0x7e0 [drm]
[37947.927611]  ? drm_connector_list_iter_next+0x7d/0x90 [drm]
[37947.927622]  drm_atomic_commit+0x13/0x50 [drm]
[37947.927634]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[37947.927648]  drm_mode_obj_set_property_ioctl+0x159/0x2b0 [drm]
[37947.927661]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[37947.927671]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[37947.927681]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[37947.927691]  drm_ioctl+0x208/0x390 [drm]
[37947.927702]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[37947.927750]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[37947.927754]  do_vfs_ioctl+0x40e/0x670
[37947.927757]  ? do_setitimer+0xde/0x230
[37947.927759]  ksys_ioctl+0x5e/0x90
[37947.927761]  __x64_sys_ioctl+0x16/0x20
[37947.927763]  do_syscall_64+0x52/0x160
[37947.927766]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[37947.927768] RIP: 0033:0x7f477504e5d7
[37947.927769] Code: 00 00 90 48 8b 05 b9 78 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 89 78 0c 00 f7 d8 64 89 01 48
[37947.927770] RSP: 002b:00007ffcbf170a38 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[37947.927771] RAX: ffffffffffffffda RBX: 00007ffcbf170a70 RCX:
00007f477504e5d7
[37947.927772] RDX: 00007ffcbf170a70 RSI: 00000000c01064ab RDI:
000000000000000d
[37947.927773] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007f477471ad10
[37947.927773] R10: 00007f477471ad20 R11: 0000000000003246 R12:
000055962a2ad220
[37947.927774] R13: 000000000000000d R14: 0000559627814780 R15:
0000000000000000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731769251.87eCdEf8.13775--

--===============0123923357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0123923357==--
