Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D309BD21C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 20:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCCD6EAD8;
	Tue, 24 Sep 2019 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0231B6EAD8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 18:53:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2EF072162; Tue, 24 Sep 2019 18:53:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111804] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.2.0 RC4 + llvm 9.0.0
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:47:crtc-0] flip_done timed out
Date: Tue, 24 Sep 2019 18:53:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111804-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1782210780=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1782210780==
Content-Type: multipart/alternative; boundary="15693512151.AEBfe.8464"
Content-Transfer-Encoding: 7bit


--15693512151.AEBfe.8464
Date: Tue, 24 Sep 2019 18:53:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111804

            Bug ID: 111804
           Summary: Annoying GPU stucks are continued on Vega 20 with
                    Kernel 5.4 + mesa 9.2.0 RC4 + llvm 9.0.0
                    [drm:drm_atomic_helper_wait_for_flip_done
                    [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done
                    timed out
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mikhail.v.gavrilov@gmail.com

Created attachment 145494
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145494&action=3Dedit
dmesg

What irony, while I uploaded the logs to the bugreport [1] on the machine w=
here
I was dumping the logs, another GPU Vega 20 also hung but with a different
error. There no games was launched, only the terminal and google chrome.


[51444.693417] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[51447.765592] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[51577.192782] sysrq: Show Blocked State
[51577.192869]   task                        PC stack   pid father
[51613.081407] sysrq: Show Blocked State
[51613.081417]   task                        PC stack   pid father
[51614.773136] perf: interrupt took too long (7178937 > 6588120), lowering
kernel.perf_event_max_sample_rate to 1000
[51621.729405] snd_hda_intel 0000:0b:00.1: Refused to change power state,
currently in D0
[51626.927361] snd_hda_intel 0000:0b:00.1: Refused to change power state,
currently in D0
[51747.797386] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[51879.183299] ------------[ cut here ]------------
[51879.183498] WARNING: CPU: 5 PID: 1938 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5851
amdgpu_dm_atomic_commit_tail.cold+0x1f/0xde [amdgpu]
[51879.183502] Modules linked in: uinput rfcomm xt_CHECKSUM xt_MASQUERADE
nf_nat_tftp nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_nat ip6table_ma=
ngle
ip6table_raw ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter cmac bnep
sunrpc vfat fat edac_mce_amd kvm_amd snd_hda_codec_realtek
snd_hda_codec_generic rtwpci kvm ledtrig_audio snd_hda_codec_hdmi rtw88
snd_hda_intel snd_intel_nhlt irqbypass mac80211 snd_hda_codec btusb btrtl
snd_hda_core btbcm btintel crct10dif_pclmul snd_hwdep bluetooth snd_seq joy=
dev
eeepc_wmi xpad crc32_pclmul ff_memless snd_seq_device asus_wmi snd_pcm cfg8=
0211
sparse_keymap ecdh_generic ghash_clmulni_intel snd_timer ecc video sp5100_t=
co
pcspkr wmi_bmof snd k10temp i2c_piix4
[51879.183547]  rfkill ccp libarc4 soundcore gpio_amdpt gpio_generic
acpi_cpufreq binfmt_misc ip_tables xfs libcrc32c amdgpu amd_iommu_v2 gpu_sc=
hed
ttm drm_kms_helper uas drm crc32c_intel igb usb_storage nvme dca i2c_algo_b=
it
nvme_core wmi pinctrl_amd fuse
[51879.183571] CPU: 5 PID: 1938 Comm: gnome-shell Not tainted
5.4.0-0.rc0.git4.1.fc32.x86_64 #1
[51879.183575] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
X470-I GAMING, BIOS 2703 08/20/2019
[51879.183677] RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0x1f/0xde [amdgp=
u]
[51879.183682] Code: e0 5d 41 5c 41 5d 41 5e 41 5f c3 48 c7 c7 78 a1 a3 c0 =
e8
11 98 80 c5 0f 0b e9 6c 21 ee ff 48 c7 c7 78 a1 a3 c0 e8 fe 97 80 c5 <0f> 0=
b e9
c1 12 ee ff 48 c7 c7 78 a1 a3 c0 e8 eb 97 80 c5 0f 0b e9
[51879.183686] RSP: 0018:ffffa3f7038678c0 EFLAGS: 00010046
[51879.183691] RAX: 0000000000000024 RBX: ffff965f2b33a1f8 RCX:
0000000000000000
[51879.183694] RDX: 0000000000000000 RSI: ffff965f3abd9e48 RDI:
ffff965f3abd9e48
[51879.183697] RBP: ffffa3f703867b70 R08: ffff965f3abd9e48 R09:
0000000000000000
[51879.183701] R10: 0000000000000001 R11: ffff965ecec78d08 R12:
0000000000000286
[51879.183704] R13: ffff965f2b33a000 R14: ffff9659547d4400 R15:
ffff965f21740000
[51879.183708] FS:  00007faa412c5d00(0000) GS:ffff965f3aa00000(0000)
knlGS:0000000000000000
[51879.183711] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[51879.183715] CR2: 000062d003847000 CR3: 000000078ed7c000 CR4:
00000000003406e0
[51879.183718] Call Trace:
[51879.183775]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[51879.183786]  commit_tail+0x3c/0x70 [drm_kms_helper]
[51879.183797]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[51879.183818]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[51879.183839]  set_property_atomic+0xcc/0x140 [drm]
[51879.183870]  drm_mode_obj_set_property_ioctl+0xcb/0x1c0 [drm]
[51879.183890]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[51879.183906]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[51879.183924]  drm_ioctl+0x208/0x390 [drm]
[51879.183944]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[51879.183951]  ? sched_clock_cpu+0x94/0xc0
[51879.183960]  ? lockdep_hardirqs_on+0xf0/0x180
[51879.184028]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[51879.184036]  do_vfs_ioctl+0x411/0x750
[51879.184048]  ksys_ioctl+0x5e/0x90
[51879.184055]  __x64_sys_ioctl+0x16/0x20
[51879.184060]  do_syscall_64+0x5c/0xb0
[51879.184066]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[51879.184070] RIP: 0033:0x7faa44ed527b
[51879.184075] Code: 0f 1e fa 48 8b 05 0d 9c 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d dd 9b 0c 00 f7 d8 64 89 01 48
[51879.184079] RSP: 002b:00007ffd601d6df8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[51879.184083] RAX: ffffffffffffffda RBX: 00007ffd601d6e30 RCX:
00007faa44ed527b
[51879.184086] RDX: 00007ffd601d6e30 RSI: 00000000c01864ba RDI:
0000000000000009
[51879.184089] RBP: 00000000c01864ba R08: 0000000000000000 R09:
00000000c0c0c0c0
[51879.184093] R10: 00007faa44f9f9e0 R11: 0000000000000246 R12:
000055fc4a875460
[51879.184096] R13: 0000000000000009 R14: 0000000000000002 R15:
0000000000000000
[51879.184110] irq event stamp: 149948702
[51879.184115] hardirqs last  enabled at (149948701): [<ffffffff86b4630b>]
_raw_spin_unlock_irqrestore+0x4b/0x60
[51879.184120] hardirqs last disabled at (149948702): [<ffffffff86b46ab3>]
_raw_spin_lock_irqsave+0x23/0x83
[51879.184124] softirqs last  enabled at (149948632): [<ffffffff86e0035d>]
__do_softirq+0x35d/0x45d
[51879.184130] softirqs last disabled at (149948625): [<ffffffff860f0787>]
irq_exit+0xf7/0x100
[51879.184133] ---[ end trace d718e3c1cb156c2c ]---


[1] https://bugs.freedesktop.org/show_bug.cgi?id=3D111803

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693512151.AEBfe.8464
Date: Tue, 24 Sep 2019 18:53:35 +0000
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
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done=
 [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111804">111804</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Annoying GPU stucks are continued on Vega 20 with Kernel 5.4 =
+ mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done [dr=
m_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145494=
" name=3D"attach_145494" title=3D"dmesg">attachment 145494</a> <a href=3D"a=
ttachment.cgi?id=3D145494&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

What irony, while I uploaded the logs to the bugreport [1] on the machine w=
here
I was dumping the logs, another GPU Vega 20 also hung but with a different
error. There no games was launched, only the terminal and google chrome.


[51444.693417] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[51447.765592] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[51577.192782] sysrq: Show Blocked State
[51577.192869]   task                        PC stack   pid father
[51613.081407] sysrq: Show Blocked State
[51613.081417]   task                        PC stack   pid father
[51614.773136] perf: interrupt took too long (7178937 &gt; 6588120), loweri=
ng
kernel.perf_event_max_sample_rate to 1000
[51621.729405] snd_hda_intel 0000:0b:00.1: Refused to change power state,
currently in D0
[51626.927361] snd_hda_intel 0000:0b:00.1: Refused to change power state,
currently in D0
[51747.797386] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[51879.183299] ------------[ cut here ]------------
[51879.183498] WARNING: CPU: 5 PID: 1938 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5851
amdgpu_dm_atomic_commit_tail.cold+0x1f/0xde [amdgpu]
[51879.183502] Modules linked in: uinput rfcomm xt_CHECKSUM xt_MASQUERADE
nf_nat_tftp nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_nat ip6table_ma=
ngle
ip6table_raw ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter cmac bnep
sunrpc vfat fat edac_mce_amd kvm_amd snd_hda_codec_realtek
snd_hda_codec_generic rtwpci kvm ledtrig_audio snd_hda_codec_hdmi rtw88
snd_hda_intel snd_intel_nhlt irqbypass mac80211 snd_hda_codec btusb btrtl
snd_hda_core btbcm btintel crct10dif_pclmul snd_hwdep bluetooth snd_seq joy=
dev
eeepc_wmi xpad crc32_pclmul ff_memless snd_seq_device asus_wmi snd_pcm cfg8=
0211
sparse_keymap ecdh_generic ghash_clmulni_intel snd_timer ecc video sp5100_t=
co
pcspkr wmi_bmof snd k10temp i2c_piix4
[51879.183547]  rfkill ccp libarc4 soundcore gpio_amdpt gpio_generic
acpi_cpufreq binfmt_misc ip_tables xfs libcrc32c amdgpu amd_iommu_v2 gpu_sc=
hed
ttm drm_kms_helper uas drm crc32c_intel igb usb_storage nvme dca i2c_algo_b=
it
nvme_core wmi pinctrl_amd fuse
[51879.183571] CPU: 5 PID: 1938 Comm: gnome-shell Not tainted
5.4.0-0.rc0.git4.1.fc32.x86_64 #1
[51879.183575] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
X470-I GAMING, BIOS 2703 08/20/2019
[51879.183677] RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0x1f/0xde [amdgp=
u]
[51879.183682] Code: e0 5d 41 5c 41 5d 41 5e 41 5f c3 48 c7 c7 78 a1 a3 c0 =
e8
11 98 80 c5 0f 0b e9 6c 21 ee ff 48 c7 c7 78 a1 a3 c0 e8 fe 97 80 c5 &lt;0f=
&gt; 0b e9
c1 12 ee ff 48 c7 c7 78 a1 a3 c0 e8 eb 97 80 c5 0f 0b e9
[51879.183686] RSP: 0018:ffffa3f7038678c0 EFLAGS: 00010046
[51879.183691] RAX: 0000000000000024 RBX: ffff965f2b33a1f8 RCX:
0000000000000000
[51879.183694] RDX: 0000000000000000 RSI: ffff965f3abd9e48 RDI:
ffff965f3abd9e48
[51879.183697] RBP: ffffa3f703867b70 R08: ffff965f3abd9e48 R09:
0000000000000000
[51879.183701] R10: 0000000000000001 R11: ffff965ecec78d08 R12:
0000000000000286
[51879.183704] R13: ffff965f2b33a000 R14: ffff9659547d4400 R15:
ffff965f21740000
[51879.183708] FS:  00007faa412c5d00(0000) GS:ffff965f3aa00000(0000)
knlGS:0000000000000000
[51879.183711] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[51879.183715] CR2: 000062d003847000 CR3: 000000078ed7c000 CR4:
00000000003406e0
[51879.183718] Call Trace:
[51879.183775]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[51879.183786]  commit_tail+0x3c/0x70 [drm_kms_helper]
[51879.183797]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[51879.183818]  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
[51879.183839]  set_property_atomic+0xcc/0x140 [drm]
[51879.183870]  drm_mode_obj_set_property_ioctl+0xcb/0x1c0 [drm]
[51879.183890]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[51879.183906]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[51879.183924]  drm_ioctl+0x208/0x390 [drm]
[51879.183944]  ? drm_mode_obj_find_prop_id+0x40/0x40 [drm]
[51879.183951]  ? sched_clock_cpu+0x94/0xc0
[51879.183960]  ? lockdep_hardirqs_on+0xf0/0x180
[51879.184028]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[51879.184036]  do_vfs_ioctl+0x411/0x750
[51879.184048]  ksys_ioctl+0x5e/0x90
[51879.184055]  __x64_sys_ioctl+0x16/0x20
[51879.184060]  do_syscall_64+0x5c/0xb0
[51879.184066]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[51879.184070] RIP: 0033:0x7faa44ed527b
[51879.184075] Code: 0f 1e fa 48 8b 05 0d 9c 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d dd 9b 0c 00 f7 d8 64 89 01 48
[51879.184079] RSP: 002b:00007ffd601d6df8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[51879.184083] RAX: ffffffffffffffda RBX: 00007ffd601d6e30 RCX:
00007faa44ed527b
[51879.184086] RDX: 00007ffd601d6e30 RSI: 00000000c01864ba RDI:
0000000000000009
[51879.184089] RBP: 00000000c01864ba R08: 0000000000000000 R09:
00000000c0c0c0c0
[51879.184093] R10: 00007faa44f9f9e0 R11: 0000000000000246 R12:
000055fc4a875460
[51879.184096] R13: 0000000000000009 R14: 0000000000000002 R15:
0000000000000000
[51879.184110] irq event stamp: 149948702
[51879.184115] hardirqs last  enabled at (149948701): [&lt;ffffffff86b4630b=
&gt;]
_raw_spin_unlock_irqrestore+0x4b/0x60
[51879.184120] hardirqs last disabled at (149948702): [&lt;ffffffff86b46ab3=
&gt;]
_raw_spin_lock_irqsave+0x23/0x83
[51879.184124] softirqs last  enabled at (149948632): [&lt;ffffffff86e0035d=
&gt;]
__do_softirq+0x35d/0x45d
[51879.184130] softirqs last disabled at (149948625): [&lt;ffffffff860f0787=
&gt;]
irq_exit+0xf7/0x100
[51879.184133] ---[ end trace d718e3c1cb156c2c ]---


[1] <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"show_bug.cgi?id=3D111803">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111803</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693512151.AEBfe.8464--

--===============1782210780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1782210780==--
