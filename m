Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE720B8D8D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1E36FC0D;
	Fri, 20 Sep 2019 09:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B2EA6FC01
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:22:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1291D72167; Fri, 20 Sep 2019 09:22:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111755] WARNING: CPU: 9 PID: 2908 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
 dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
Date: Fri, 20 Sep 2019 09:22:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111755-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0242075083=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0242075083==
Content-Type: multipart/alternative; boundary="15689713420.20c980.32522"
Content-Transfer-Encoding: 7bit


--15689713420.20c980.32522
Date: Fri, 20 Sep 2019 09:22:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111755

            Bug ID: 111755
           Summary: WARNING: CPU: 9 PID: 2908 at
                    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_h
                    wseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x220
                    [amdgpu]
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: stijn+bugs@linux-ipv6.be

Created attachment 145440
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145440&action=3Dedit
dmesg > dmesg.log

I have a Sapphire Radeon RX 5700 XT, running kernel 5.3.0, LLVM 9.0.0 git
branch release_90 at commit 5364ee5faec778f1ddf86b6b4b8452df7db191c5, mesa
19.2.0-rc4, libdrm 2.4.99, xf86-video-amdgpu git branch master at commit
e6fce59a071220967fcd4e2c9e4a262c72870761, KDE Plasma 5.16.5 and Qt 5.12.5.

When I set the rendering backend in the Plasma compositor settings to OpenGL
2.0 or OpenGL 3.1, I start to get desktop lag after only a few minutes of
uptime. I suspect this is related to the following recurring warning in dme=
sg:

[  106.734466] WARNING: CPU: 9 PID: 2908 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
[  106.748446] Modules linked in: cmac rfcomm cfg80211 nf_conntrack_netlink
nfnetlink xt_addrtype br_netfilter xfrm_user xfrm4_tunnel tunnel4 ipcomp
xfrm_ipcomp esp4 ah4 af_key xfrm_algo nls_utf8 cifs gcm libarc4 xt_CHECKSUM
xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_man=
gle
ip6table_nat iptable_mangle iptable_nat ebtable_filter ebtables ip6table_fi=
lter
ip6_tables iptable_filter ip_tables x_tables bpfilter bridge stp llc sctp b=
nep
nvidia_drm(PO) edac_core intel_rapl_msr intel_rapl_common nvidia_modeset(PO)
x86_pkg_temp_thermal nls_iso8859_1 intel_powerclamp nls_cp437 vfat fat amdg=
pu
nvidia(PO) crct10dif_pclmul snd_hda_codec_realtek crc32_pclmul
snd_hda_codec_hdmi snd_hda_codec_generic crc32c_intel gpu_sched snd_usb_aud=
io
snd_hda_intel ttm ghash_clmulni_intel snd_usbmidi_lib snd_hda_codec aesni_i=
ntel
drm_kms_helper snd_hda_core crypto_simd snd_rawmidi btusb iTCO_wdt btrtl bt=
bcm
snd_seq_device cryptd btintel snd_hwdep efi_pstore drm joydev glue_helper
intel_cstate
[  106.748507]  snd_pcm iTCO_vendor_support drm_panel_orientation_quirks ev=
dev
uinput bluetooth intel_uncore syscopyarea snd_timer sysfillrect intel_rapl_=
perf
wmi_bmof efivars cp210x i2c_i801 ecdh_generic lpc_ich uas ecc snd sysimgblt
e1000e fb_sys_fops soundcore usbserial button sch_fq_codel nct6775 hwmon_vid
coretemp openvswitch nsh nf_conncount nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 vhost_net tun vhost tap kvm_intel kvm nfsd irqbypass msr cpu=
id
auth_rpcgss nfs_acl efivarfs virtio_ring virtio xts aes_x86_64 ecb cbc
sha1_generic iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi bonding v=
xlan
ip6_udp_tunnel udp_tunnel macvlan igb i2c_algo_bit dca e1000 fuse overlay n=
fs
lockd grace sunrpc ext4 mbcache jbd2 multipath linear raid10 raid1 raid0
dm_raid raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx
md_mod dm_snapshot dm_bufio dm_crypt dm_mirror dm_region_hash dm_log dm_mod
firewire_core crc_itu_t hid_sony hid_samsung hid_petalynx hid_monterey
hid_microsoft
[  106.835796]  hid_logitech ff_memless hid_gyration hid_ezkey hid_cypress
hid_chicony hid_cherry hid_belkin hid_apple hid_a4tech hid_generic usbhid
ohci_pci ohci_hcd uhci_hcd hid arcmsr sr_mod cdrom sg usb_storage xhci_pci
ehci_pci xhci_hcd ehci_hcd ptp usbcore pps_core usb_common
[  106.947505] CPU: 9 PID: 2908 Comm: kworker/u24:17 Tainted: P           O=
=20=20=20
T 5.3.0-gentoo #1
[  106.956021] Hardware name: System manufacturer System Product Name/P9X79=
 WS,
BIOS 4901 05/07/2018
[  106.964914] Workqueue: events_unbound commit_work [drm_kms_helper]
[  106.971209] RIP: 0010:dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
[  106.977822] Code: b6 80 70 02 00 00 a8 01 0f 84 39 01 00 00 a8 02 0f 84 =
e6
00 00 00 a8 04 0f 84 4e 01 00 00 48 c7 c7 70 6f 57 a1 e8 af 3e c9 df <0f> 0=
b c6
83 50 02 00 00 00 48 c7 c7 70 6f 57 a1 e8 9a 3e c9 df 0f
[  106.996588] RSP: 0018:ffffc900021dba68 EFLAGS: 00010286
[  107.001817] RAX: 0000000000000024 RBX: ffff888e38820638 RCX:
0000000000000000
[  107.008950] RDX: 0000000000000000 RSI: ffff88901fa56598 RDI:
ffff88901fa56598
[  107.016081] RBP: 0000000000000001 R08: 0000000000000706 R09:
0000000000000009
[  107.023215] R10: 0000000000000000 R11: ffffc900021db918 R12:
ffff888fc1640000
[  107.030348] R13: ffff888e38821cb8 R14: ffff888e38820638 R15:
0000000000000006
[  107.037480] FS:  0000000000000000(0000) GS:ffff88901fa40000(0000)
knlGS:0000000000000000
[  107.045567] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  107.051313] CR2: 000056015dce91f8 CR3: 000000000220c004 CR4:
00000000000606e0
[  107.058445] Call Trace:
[  107.061020]  dcn20_pipe_control_lock.part.15+0xe5/0x1b0 [amdgpu]
[  107.067136]  dc_commit_updates_for_stream+0xd97/0x1290 [amdgpu]
[  107.073166]  amdgpu_dm_atomic_commit_tail+0xfd2/0x1e10 [amdgpu]
[  107.079117]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[  107.084185]  commit_tail+0x3d/0x70 [drm_kms_helper]
[  107.089073]  process_one_work+0x198/0x380
[  107.093089]  worker_thread+0x30/0x380
[  107.096758]  ? process_one_work+0x380/0x380
[  107.100949]  kthread+0x113/0x130
[  107.104191]  ? kthread_park+0x80/0x80
[  107.107860]  ret_from_fork+0x35/0x40
[  107.111444] ---[ end trace 9a7bcd62f5f5e527 ]---

This does not occur with the XRender rendering backend.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689713420.20c980.32522
Date: Fri, 20 Sep 2019 09:22:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/.=
./display/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x=
220 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755">111755</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/../di=
splay/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x220 =
[amdgpu]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>stijn+bugs&#64;linux-ipv6.be
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145440=
" name=3D"attach_145440" title=3D"dmesg &gt; dmesg.log">attachment 145440</=
a> <a href=3D"attachment.cgi?id=3D145440&amp;action=3Dedit" title=3D"dmesg =
&gt; dmesg.log">[details]</a></span>
dmesg &gt; dmesg.log

I have a Sapphire Radeon RX 5700 XT, running kernel 5.3.0, LLVM 9.0.0 git
branch release_90 at commit 5364ee5faec778f1ddf86b6b4b8452df7db191c5, mesa
19.2.0-rc4, libdrm 2.4.99, xf86-video-amdgpu git branch master at commit
e6fce59a071220967fcd4e2c9e4a262c72870761, KDE Plasma 5.16.5 and Qt 5.12.5.

When I set the rendering backend in the Plasma compositor settings to OpenGL
2.0 or OpenGL 3.1, I start to get desktop lag after only a few minutes of
uptime. I suspect this is related to the following recurring warning in dme=
sg:

[  106.734466] WARNING: CPU: 9 PID: 2908 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
[  106.748446] Modules linked in: cmac rfcomm cfg80211 nf_conntrack_netlink
nfnetlink xt_addrtype br_netfilter xfrm_user xfrm4_tunnel tunnel4 ipcomp
xfrm_ipcomp esp4 ah4 af_key xfrm_algo nls_utf8 cifs gcm libarc4 xt_CHECKSUM
xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_man=
gle
ip6table_nat iptable_mangle iptable_nat ebtable_filter ebtables ip6table_fi=
lter
ip6_tables iptable_filter ip_tables x_tables bpfilter bridge stp llc sctp b=
nep
nvidia_drm(PO) edac_core intel_rapl_msr intel_rapl_common nvidia_modeset(PO)
x86_pkg_temp_thermal nls_iso8859_1 intel_powerclamp nls_cp437 vfat fat amdg=
pu
nvidia(PO) crct10dif_pclmul snd_hda_codec_realtek crc32_pclmul
snd_hda_codec_hdmi snd_hda_codec_generic crc32c_intel gpu_sched snd_usb_aud=
io
snd_hda_intel ttm ghash_clmulni_intel snd_usbmidi_lib snd_hda_codec aesni_i=
ntel
drm_kms_helper snd_hda_core crypto_simd snd_rawmidi btusb iTCO_wdt btrtl bt=
bcm
snd_seq_device cryptd btintel snd_hwdep efi_pstore drm joydev glue_helper
intel_cstate
[  106.748507]  snd_pcm iTCO_vendor_support drm_panel_orientation_quirks ev=
dev
uinput bluetooth intel_uncore syscopyarea snd_timer sysfillrect intel_rapl_=
perf
wmi_bmof efivars cp210x i2c_i801 ecdh_generic lpc_ich uas ecc snd sysimgblt
e1000e fb_sys_fops soundcore usbserial button sch_fq_codel nct6775 hwmon_vid
coretemp openvswitch nsh nf_conncount nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 vhost_net tun vhost tap kvm_intel kvm nfsd irqbypass msr cpu=
id
auth_rpcgss nfs_acl efivarfs virtio_ring virtio xts aes_x86_64 ecb cbc
sha1_generic iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi bonding v=
xlan
ip6_udp_tunnel udp_tunnel macvlan igb i2c_algo_bit dca e1000 fuse overlay n=
fs
lockd grace sunrpc ext4 mbcache jbd2 multipath linear raid10 raid1 raid0
dm_raid raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx
md_mod dm_snapshot dm_bufio dm_crypt dm_mirror dm_region_hash dm_log dm_mod
firewire_core crc_itu_t hid_sony hid_samsung hid_petalynx hid_monterey
hid_microsoft
[  106.835796]  hid_logitech ff_memless hid_gyration hid_ezkey hid_cypress
hid_chicony hid_cherry hid_belkin hid_apple hid_a4tech hid_generic usbhid
ohci_pci ohci_hcd uhci_hcd hid arcmsr sr_mod cdrom sg usb_storage xhci_pci
ehci_pci xhci_hcd ehci_hcd ptp usbcore pps_core usb_common
[  106.947505] CPU: 9 PID: 2908 Comm: kworker/u24:17 Tainted: P           O=
=20=20=20
T 5.3.0-gentoo #1
[  106.956021] Hardware name: System manufacturer System Product Name/P9X79=
 WS,
BIOS 4901 05/07/2018
[  106.964914] Workqueue: events_unbound commit_work [drm_kms_helper]
[  106.971209] RIP: 0010:dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
[  106.977822] Code: b6 80 70 02 00 00 a8 01 0f 84 39 01 00 00 a8 02 0f 84 =
e6
00 00 00 a8 04 0f 84 4e 01 00 00 48 c7 c7 70 6f 57 a1 e8 af 3e c9 df &lt;0f=
&gt; 0b c6
83 50 02 00 00 00 48 c7 c7 70 6f 57 a1 e8 9a 3e c9 df 0f
[  106.996588] RSP: 0018:ffffc900021dba68 EFLAGS: 00010286
[  107.001817] RAX: 0000000000000024 RBX: ffff888e38820638 RCX:
0000000000000000
[  107.008950] RDX: 0000000000000000 RSI: ffff88901fa56598 RDI:
ffff88901fa56598
[  107.016081] RBP: 0000000000000001 R08: 0000000000000706 R09:
0000000000000009
[  107.023215] R10: 0000000000000000 R11: ffffc900021db918 R12:
ffff888fc1640000
[  107.030348] R13: ffff888e38821cb8 R14: ffff888e38820638 R15:
0000000000000006
[  107.037480] FS:  0000000000000000(0000) GS:ffff88901fa40000(0000)
knlGS:0000000000000000
[  107.045567] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  107.051313] CR2: 000056015dce91f8 CR3: 000000000220c004 CR4:
00000000000606e0
[  107.058445] Call Trace:
[  107.061020]  dcn20_pipe_control_lock.part.15+0xe5/0x1b0 [amdgpu]
[  107.067136]  dc_commit_updates_for_stream+0xd97/0x1290 [amdgpu]
[  107.073166]  amdgpu_dm_atomic_commit_tail+0xfd2/0x1e10 [amdgpu]
[  107.079117]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[  107.084185]  commit_tail+0x3d/0x70 [drm_kms_helper]
[  107.089073]  process_one_work+0x198/0x380
[  107.093089]  worker_thread+0x30/0x380
[  107.096758]  ? process_one_work+0x380/0x380
[  107.100949]  kthread+0x113/0x130
[  107.104191]  ? kthread_park+0x80/0x80
[  107.107860]  ret_from_fork+0x35/0x40
[  107.111444] ---[ end trace 9a7bcd62f5f5e527 ]---

This does not occur with the XRender rendering backend.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689713420.20c980.32522--

--===============0242075083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0242075083==--
