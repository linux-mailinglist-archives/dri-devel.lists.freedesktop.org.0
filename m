Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F37B8276
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 22:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ED56FB67;
	Thu, 19 Sep 2019 20:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24BC6FB67
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 20:31:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EF13472167; Thu, 19 Sep 2019 20:31:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111633] amdgpu driver crash with kernel NULL pointer dereference
Date: Thu, 19 Sep 2019 20:31:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: vakevk+freedesktopbugzilla@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111633-502-H6fABBJmZH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111633-502@http.bugs.freedesktop.org/>
References: <bug-111633-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1317393420=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1317393420==
Content-Type: multipart/alternative; boundary="15689250811.dc7f40b.3290"
Content-Transfer-Encoding: 7bit


--15689250811.dc7f40b.3290
Date: Thu, 19 Sep 2019 20:31:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111633

--- Comment #1 from vakevk+freedesktopbugzilla@gmail.com ---
Another one, different stacktrace.

BUG: kernel NULL pointer dereference, address: 0000000000000360
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 4 PID: 28005 Comm: kworker/u16:1 Not tainted 5.2.14-arch1-1-ARCH #1
Hardware name: ASUS All Series/Z87-PLUS, BIOS 2103 08/15/2014
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_retain+0x5/0x20 [amdgpu]
Call Trace:
dc_resource_state_copy_construct+0xa0/0xf0 [amdgpu]
dc_commit_updates_for_stream+0xa63/0xc20 [amdgpu]
amdgpu_dm_atomic_commit_tail+0xabe/0x19a0 [amdgpu]
? commit_tail+0x3c/0x70 [drm_kms_helper]
commit_tail+0x3c/0x70 [drm_kms_helper]
process_one_work+0x1d1/0x3e0
worker_thread+0x4a/0x3d0
kthread+0xfb/0x130
? process_one_work+0x3e0/0x3e0
? kthread_park+0x80/0x80
ret_from_fork+0x35/0x40
Modules linked in: tun nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c nf_tables_set cfg80211 8021q garp mrp nf_tables stp llc nfnetlink
intel_rapl ofpart nls_iso8859_1 nls_cp437 cmdlinepart vfat intel_spi_platfo=
rm
fat fuse intel_spi mei_hdcp spi_nor iTCO_wdt x86_pkg_temp_thermal mtd
iTCO_vendor_support intel_powerclamp uvcvideo coretemp videobuf2_vmalloc
kvm_intel btusb snd_hda_codec_realtek videobuf2_memops btrtl btbcm
snd_hda_codec_generic videobuf2_v4l2 btintel ledtrig_audio snd_hda_codec_hd=
mi
videobuf2_common bluetooth eeepc_wmi kvm snd_usb_audio snd_hda_intel videod=
ev
asus_wmi snd_hda_codec sparse_keymap wmi_bmof snd_usbmidi_lib mxm_wmi irqby=
pass
snd_hda_core snd_rawmidi snd_hwdep snd_seq_device intel_cstate ecdh_generic
snd_pcm intel_uncore mei_me i2c_i801 snd_timer intel_rapl_perf rfkill snd
pcspkr media cdc_acm pcc_cpufreq mousedev ecc joydev e1000e input_leds
soundcore mei lpc_ich evdev mac_hid wmi ip_tables x_tables ext4 crc32c_gene=
ric
crc16 mbcache jbd2
hid_generic usbhid hid dm_crypt dm_mod sd_mod crct10dif_pclmul crc32_pclmul
crc32c_intel ghash_clmulni_intel ahci libahci aesni_intel libata aes_x86_64
crypto_simd xhci_pci cryptd scsi_mod glue_helper xhci_hcd ehci_pci ehci_hcd
amdgpu gpu_sched i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect
sysimgblt fb_sys_fops drm agpgart
CR2: 0000000000000360
---[ end trace 3b3265e8a1ad7f82 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689250811.dc7f40b.3290
Date: Thu, 19 Sep 2019 20:31:21 +0000
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
   title=3D"NEW - amdgpu driver crash with kernel NULL pointer dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111633#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu driver crash with kernel NULL pointer dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111633">bug 11163=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vakevk+freedesktopbugzilla&#64;gmail.com" title=3D"vakevk+freedesktopbugzil=
la&#64;gmail.com">vakevk+freedesktopbugzilla&#64;gmail.com</a>
</span></b>
        <pre>Another one, different stacktrace.

BUG: kernel NULL pointer dereference, address: 0000000000000360
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 4 PID: 28005 Comm: kworker/u16:1 Not tainted 5.2.14-arch1-1-ARCH #1
Hardware name: ASUS All Series/Z87-PLUS, BIOS 2103 08/15/2014
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_retain+0x5/0x20 [amdgpu]
Call Trace:
dc_resource_state_copy_construct+0xa0/0xf0 [amdgpu]
dc_commit_updates_for_stream+0xa63/0xc20 [amdgpu]
amdgpu_dm_atomic_commit_tail+0xabe/0x19a0 [amdgpu]
? commit_tail+0x3c/0x70 [drm_kms_helper]
commit_tail+0x3c/0x70 [drm_kms_helper]
process_one_work+0x1d1/0x3e0
worker_thread+0x4a/0x3d0
kthread+0xfb/0x130
? process_one_work+0x3e0/0x3e0
? kthread_park+0x80/0x80
ret_from_fork+0x35/0x40
Modules linked in: tun nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c nf_tables_set cfg80211 8021q garp mrp nf_tables stp llc nfnetlink
intel_rapl ofpart nls_iso8859_1 nls_cp437 cmdlinepart vfat intel_spi_platfo=
rm
fat fuse intel_spi mei_hdcp spi_nor iTCO_wdt x86_pkg_temp_thermal mtd
iTCO_vendor_support intel_powerclamp uvcvideo coretemp videobuf2_vmalloc
kvm_intel btusb snd_hda_codec_realtek videobuf2_memops btrtl btbcm
snd_hda_codec_generic videobuf2_v4l2 btintel ledtrig_audio snd_hda_codec_hd=
mi
videobuf2_common bluetooth eeepc_wmi kvm snd_usb_audio snd_hda_intel videod=
ev
asus_wmi snd_hda_codec sparse_keymap wmi_bmof snd_usbmidi_lib mxm_wmi irqby=
pass
snd_hda_core snd_rawmidi snd_hwdep snd_seq_device intel_cstate ecdh_generic
snd_pcm intel_uncore mei_me i2c_i801 snd_timer intel_rapl_perf rfkill snd
pcspkr media cdc_acm pcc_cpufreq mousedev ecc joydev e1000e input_leds
soundcore mei lpc_ich evdev mac_hid wmi ip_tables x_tables ext4 crc32c_gene=
ric
crc16 mbcache jbd2
hid_generic usbhid hid dm_crypt dm_mod sd_mod crct10dif_pclmul crc32_pclmul
crc32c_intel ghash_clmulni_intel ahci libahci aesni_intel libata aes_x86_64
crypto_simd xhci_pci cryptd scsi_mod glue_helper xhci_hcd ehci_pci ehci_hcd
amdgpu gpu_sched i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect
sysimgblt fb_sys_fops drm agpgart
CR2: 0000000000000360
---[ end trace 3b3265e8a1ad7f82 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689250811.dc7f40b.3290--

--===============1317393420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1317393420==--
