Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F89FF818
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 07:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ED76E277;
	Sun, 17 Nov 2019 06:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E07C66E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 06:36:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D74A2720E2; Sun, 17 Nov 2019 06:36:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout causes system freeze
Date: Sun, 17 Nov 2019 06:36:08 +0000
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
Message-ID: <bug-112304-502-zKW8F676YO@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1127156878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1127156878==
Content-Type: multipart/alternative; boundary="15739725680.71a00.7282"
Content-Transfer-Encoding: 7bit


--15739725680.71a00.7282
Date: Sun, 17 Nov 2019 06:36:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

--- Comment #9 from saadnaji89@gmail.com ---
Comment on attachment 145980
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145980
journalctl-logs-after-hardware-reboot

>-- Logs begin at Sun 2019-06-30 23:10:01 EDT, end at Sat 2019-11-16 23:43:=
27 EST. --
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
Actions to perform:=20
>                                                                   Primary=
 Output: false
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
        Change Screen Size: false
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
        Disable outputs: false
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
        Change outputs: false
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
        Enable outputs: false
>Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrandr: =
XRandR::setConfig done!
>Nov 16 23:41:39 archlinux kernel: lxqt-powermanag: Corrupted page table at=
 address 7fd643ec8080
>Nov 16 23:41:39 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e406=
7 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
>Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#1] SMP PTI
>Nov 16 23:41:39 archlinux kernel: CPU: 2 PID: 1623 Comm: lxqt-powermanag N=
ot tainted 5.3.11-2-clear #1
>Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 89 f=
7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c2 1=
0 48 85 ff 74 1d <48> 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84 c0 75 4d=
 49 8b 56
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007fd64994ad80 GS:  0000000000000=
000
>Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6da ]---
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 89 f=
7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c2 1=
0 48 85 ff 74 1d <48> 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84 c0 75 4d=
 49 8b 56
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007fd64994ad80(0000) GS:ffff9d5f9=
f080000(0000) knlGS:0000000000000000
>Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:39 archlinux kernel: CR2: 00007fd643ec8080 CR3: 000000039221c=
004 CR4: 00000000001606e0
>Nov 16 23:41:39 archlinux kernel: Chrome_ChildIOT: Corrupted page table at=
 address 1689e6ba5e10
>Nov 16 23:41:39 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000f [#2] SMP PTI
>Nov 16 23:41:39 archlinux kernel: CPU: 3 PID: 1843 Comm: Chrome_ChildIOT T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fce0d69770c
>Nov 16 23:41:39 archlinux kernel: Code: 00 00 0f 83 43 01 00 00 b9 03 00 0=
0 00 b8 07 00 00 00 01 f0 48 d3 e8 48 8d 0d 18 85 5b 00 0f b6 04 08 48 63 9=
4 81 fc 02 00 00 <49> 29 94 24 10 0c 00 00 0f 88 2b 01 00 00 48 89 c3 48 c1=
 e3 05 4d
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fce0069f580 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 000000000000002d RBX: 00007fce0d7f2=
748 RCX: 00007fce0dc4fc18
>Nov 16 23:41:39 archlinux kernel: RDX: 0000000000002800 RSI: 0000000000002=
738 RDI: 0000000000000008
>Nov 16 23:41:39 archlinux kernel: RBP: 00007fce0069f610 R08: 0000000000000=
000 R09: 00007fce0069f7d8
>Nov 16 23:41:39 archlinux kernel: R10: 00007fce0069f7d0 R11: 0000000000000=
000 R12: 00001689e6ba5200
>Nov 16 23:41:39 archlinux kernel: R13: 0000000000000008 R14: 00007fce0069f=
668 R15: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: FS:  00007fce006a0700 GS:  0000000000000=
000
>Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6db ]---
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007fce006a0700(0000) GS:ffff9d5f9=
f0c0000(0000) knlGS:0000000000000000
>Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
004 CR4: 00000000001606e0
>Nov 16 23:41:39 archlinux kernel: https-jsse-nio-: Corrupted page table at=
 address 7fd978001310
>Nov 16 23:41:39 archlinux kernel: PGD 800000041a726067 P4D 800000041a72606=
7 PUD 39dc52067 PMD 39216a067 PTE ffffffffffffffff
>Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000f [#3] SMP PTI
>Nov 16 23:41:39 archlinux kernel: CPU: 4 PID: 1676 Comm: https-jsse-nio- T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fda692a4ba0
>Nov 16 23:41:39 archlinux kernel: Code: 48 8b 45 f8 49 ba 00 00 00 00 00 0=
0 00 00 4d 89 97 c0 01 00 00 49 ba 00 00 00 00 00 00 00 00 4d 89 97 c8 01 0=
0 00 49 8b 4f 38 <c7> 81 00 01 00 00 00 00 00 00 c9 49 81 7f 08 00 00 00 00=
 0f 85 01
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fd9a8eeb670 EFLAGS: 00010=
246
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 00007fd978001210
>Nov 16 23:41:39 archlinux kernel: RDX: 0000000000002000 RSI: 00007fda78e63=
000 RDI: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RBP: 00007fd9a8eeb6b0 R08: 0000000000000=
000 R09: 00007fd9a8eeb5d8
>Nov 16 23:41:39 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
000 R12: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: R13: 00007fd9a8eeb960 R14: 0000000000000=
000 R15: 00007fda78605800
>Nov 16 23:41:39 archlinux kernel: FS:  00007fd9a8eec700 GS:  0000000000000=
000
>Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6dc ]---
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007fd9a8eec700(0000) GS:ffff9d5f9=
f100000(0000) knlGS:0000000000000000
>Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 00000004095b0=
005 CR4: 00000000001606e0
>Nov 16 23:41:39 archlinux kernel: Chrome_IOThread: Corrupted page table at=
 address 7f3b9cad9450
>Nov 16 23:41:39 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f606=
7 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
>Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#4] SMP PTI
>Nov 16 23:41:39 archlinux kernel: CPU: 2 PID: 1820 Comm: Chrome_IOThread T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7f3ba7014207
>Nov 16 23:41:39 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 49 8=
b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 00 0=
f 87 22 01 00 00 <4c> 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00 00 4c 0f=
 42 e2 4c
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007f3b96f98880 EFLAGS: 00010=
297
>Nov 16 23:41:39 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000000=
00a RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000000=
000 RDI: 000000000000000a
>Nov 16 23:41:39 archlinux kernel: RBP: 0000000000000000 R08: 0000000000000=
009 R09: 0000000000000010
>Nov 16 23:41:39 archlinux kernel: R10: 00000000000001f9 R11: 0000000000000=
206 R12: 0000000000000001
>Nov 16 23:41:39 archlinux kernel: R13: 0000000000000000 R14: 0000000000000=
006 R15: 00007f3b9c1ca560
>Nov 16 23:41:39 archlinux kernel: FS:  00007f3b96f9a700 GS:  0000000000000=
000
>Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6dd ]---
>Nov 16 23:41:39 archlinux kernel: ThreadPoolSingl: Corrupted page table at=
 address 7f3b9cad9450
>Nov 16 23:41:39 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f606=
7 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
>Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#5] SMP PTI
>Nov 16 23:41:39 archlinux kernel: CPU: 3 PID: 1828 Comm: ThreadPoolSingl T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7f3ba7014207
>Nov 16 23:41:39 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 49 8=
b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 00 0=
f 87 22 01 00 00 <4c> 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00 00 4c 0f=
 42 e2 4c
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007f3b92daccf0 EFLAGS: 00010=
297
>Nov 16 23:41:39 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000000=
00a RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000000=
000 RDI: 000000000000000a
>Nov 16 23:41:39 archlinux kernel: RBP: 0000000000000000 R08: 0000000000000=
009 R09: 0000000000000010
>Nov 16 23:41:39 archlinux kernel: R10: 00000000000001f9 R11: 0000000000000=
206 R12: 0000000000000001
>Nov 16 23:41:39 archlinux kernel: R13: 0000000000000000 R14: 0000000000000=
006 R15: 00007f3b9c1ca560
>Nov 16 23:41:39 archlinux kernel: FS:  00007f3b92dae700 GS:  0000000000000=
000
>Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6de ]---
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007f3b92dae700(0000) GS:ffff9d5f9=
f0c0000(0000) knlGS:0000000000000000
>Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 000000039215c=
004 CR4: 00000000001606e0
>Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:39 archlinux kernel: FS:  00007f3b96f9a700(0000) GS:ffff9d5f9=
f080000(0000) knlGS:0000000000000000
>Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 000000039215c=
001 CR4: 00000000001606e0
>Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring sdma0 timeout, signaled seq=3D112, emitted seq=3D114
>Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* Process information: process  pid 0 thread  pid 0
>Nov 16 23:41:49 archlinux kernel: [drm] GPU recovery disabled.
>Nov 16 23:41:52 archlinux kernel: steamwebhelper: Corrupted page table at =
address 1689e6ba2cc8
>Nov 16 23:41:52 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:41:52 archlinux kernel: Bad pagetable: 000d [#6] SMP PTI
>Nov 16 23:41:52 archlinux kernel: CPU: 7 PID: 1840 Comm: steamwebhelper Ta=
inted: G      D           5.3.11-2-clear #1
>Nov 16 23:41:52 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:41:52 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:41:52 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:41:52 archlinux kernel: RSP: 002b:00007ffed3ebeef0 EFLAGS: 00010=
202
>Nov 16 23:41:52 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000c7d
>Nov 16 23:41:52 archlinux kernel: RDX: 00001689e6c7dd00 RSI: 00001689e6c7d=
d00 RDI: 00001689e6c7dd00
>Nov 16 23:41:52 archlinux kernel: RBP: 00007ffed3ebef20 R08: 0000000000000=
000 R09: 00007ffed3ebef18
>Nov 16 23:41:52 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba2cc0
>Nov 16 23:41:52 archlinux kernel: R13: 00001689e6ba2c80 R14: 00001689e6c7a=
b70 R15: 0000000000000002
>Nov 16 23:41:52 archlinux kernel: FS:  00007fce03035680 GS:  0000000000000=
000
>Nov 16 23:41:52 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:41:52 archlinux kernel: ---[ end trace 0bfef23d2a61f6df ]---
>Nov 16 23:41:52 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:41:52 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:41:52 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:41:52 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:41:52 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:41:52 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:41:52 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:41:52 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:41:52 archlinux kernel: FS:  00007fce03035680(0000) GS:ffff9d5f9=
f1c0000(0000) knlGS:0000000000000000
>Nov 16 23:41:52 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:41:52 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
004 CR4: 00000000001606e0
>Nov 16 23:42:08 archlinux assert_20191116234208_28.dmp[1973]: Uploading du=
mp (out-of-process)
>                                                              /tmp/dumps/a=
ssert_20191116234208_28.dmp
>Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: Finished upl=
oading minidump (out-of-process): success =3D yes
>Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: response: Cr=
ashID=3Dbp-41559f84-c03a-4cef-9b4d-0f6c82191116
>Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: file ''/tmp/=
dumps/assert_20191116234208_28.dmp'', upload yes: ''CrashID=3Dbp-41559f84-c=
03a-4cef-9b4d-0f6c82191116''
>Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 1689e6ba90c8
>Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#7] SMP PTI
>Nov 16 23:42:10 archlinux kernel: CPU: 5 PID: 1848 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdfde9a730 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000c93
>Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c93380 RSI: 00001689e6c93=
380 RDI: 00001689e6c93380
>Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdfde9a760 R08: 0000000000000=
000 R09: 00007fcdfde9a758
>Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba90c0
>Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba9080 R14: 00001689e6d00=
b90 R15: 0000000000000002
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfde9b700 GS:  0000000000000=
000
>Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e0 ]---
>Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 1689e6ba6b48
>Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#8] SMP PTI
>Nov 16 23:42:10 archlinux kernel: CPU: 2 PID: 1845 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdff69d730 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000c93
>Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c93480 RSI: 00001689e6c93=
480 RDI: 00001689e6c93480
>Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdff69d760 R08: 0000000000000=
000 R09: 00007fcdff69d758
>Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba6b40
>Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba6b00 R14: 00001689e6d00=
f50 R15: 0000000000000002
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdff69e700 GS:  0000000000000=
000
>Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e1 ]---
>Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 1689e6ba8448
>Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#9] SMP PTI
>Nov 16 23:42:10 archlinux kernel: CPU: 1 PID: 1847 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdfe69b730 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000d14
>Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6d14fc0 RSI: 00001689e6d14=
fc0 RDI: 00001689e6d14fc0
>Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdfe69b760 R08: 0000000000000=
000 R09: 00007fcdfe69b758
>Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba8440
>Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba8400 R14: 00001689e6d00=
d70 R15: 0000000000000002
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfe69c700 GS:  0000000000000=
000
>Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e2 ]---
>Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 1689e6ba45c8
>Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#10] SMP PTI
>Nov 16 23:42:10 archlinux kernel: CPU: 7 PID: 1842 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fce00ea0730 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000d14
>Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6d14f00 RSI: 00001689e6d14=
f00 RDI: 00001689e6d14f00
>Nov 16 23:42:10 archlinux kernel: RBP: 00007fce00ea0760 R08: 0000000000000=
000 R09: 00007fce00ea0758
>Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba45c0
>Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba4580 R14: 00001689e6c9a=
cd0 R15: 0000000000000002
>Nov 16 23:42:10 archlinux kernel: FS:  00007fce00ea1700 GS:  0000000000000=
000
>Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e3 ]---
>Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 1689e6ba5ec8
>Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dca06=
7 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
>Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#11] SMP PTI
>Nov 16 23:42:10 archlinux kernel: CPU: 6 PID: 1844 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
>Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8b 3=
c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c1 e=
3 05 4e 8d 24 2b <45> 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8 24 e0 9a=
 f9 45 89
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdffe9e730 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000000=
040 RCX: 0000000000000c93
>Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c930c0 RSI: 00001689e6c93=
0c0 RDI: 00001689e6c930c0
>Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdffe9e760 R08: 0000000000000=
000 R09: 00007fcdffe9e758
>Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000000=
286 R12: 00001689e6ba5ec0
>Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba5e80 R14: 00001689e6cfa=
410 R15: 0000000000000002
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdffe9f700 GS:  0000000000000=
000
>Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e4 ]---
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfde9b700(0000) GS:ffff9d5f9=
f140000(0000) knlGS:0000000000000000
>Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdff69e700(0000) GS:ffff9d5f9=
f080000(0000) knlGS:0000000000000000
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
003 CR4: 00000000001606e0
>Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfe69c700(0000) GS:ffff9d5f9=
f040000(0000) knlGS:0000000000000000
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
002 CR4: 00000000001606e0
>Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:10 archlinux kernel: FS:  00007fce00ea1700(0000) GS:ffff9d5f9=
f1c0000(0000) knlGS:0000000000000000
>Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:10 archlinux kernel: FS:  00007fcdffe9f700(0000) GS:ffff9d5f9=
f100000(0000) knlGS:0000000000000000
>Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
002 CR4: 00000000001606e0
>Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
006 CR4: 00000000001606e0
>Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418df0=
004 CR4: 00000000001606e0
>Nov 16 23:42:12 archlinux kernel: QDBusConnection: Corrupted page table at=
 address 7fd643e01bf8
>Nov 16 23:42:12 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e406=
7 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
>Nov 16 23:42:12 archlinux kernel: Bad pagetable: 000f [#12] SMP PTI
>Nov 16 23:42:12 archlinux kernel: CPU: 4 PID: 1627 Comm: QDBusConnection T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:12 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64ccb69fa
>Nov 16 23:42:12 archlinux kernel: Code: 24 08 e8 49 11 f9 ff 8b 54 24 1c 4=
8 8b 74 24 10 41 89 c0 48 8b 7c 24 08 b8 07 00 00 00 0f 05 48 3d 00 f0 ff f=
f 77 2b 44 89 c7 <89> 44 24 08 e8 7d 11 f9 ff 8b 44 24 08 48 83 c4 28 c3 0f=
 1f 40 00
>Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fd643e01bf0 EFLAGS: 00010=
203
>Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000001 RBX: 00007fd64c8d2=
670 RCX: 00007fd64ccb69ef
>Nov 16 23:42:12 archlinux kernel: RDX: 00000000ffffffff RSI: 0000000000000=
005 RDI: 0000000000000000
>Nov 16 23:42:12 archlinux kernel: RBP: 00007fd63c01e040 R08: 0000000000000=
000 R09: 0000000000000001
>Nov 16 23:42:12 archlinux kernel: R10: 00007fd63c0198a0 R11: 0000000000000=
293 R12: 0000000000000005
>Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01c30 R14: 00000000fffff=
fff R15: 00007fd63c000c30
>Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700 GS:  0000000000000=
000
>Nov 16 23:42:12 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:12 archlinux kernel: ---[ end trace 0bfef23d2a61f6e5 ]---
>Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:12 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 89 f=
7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c2 1=
0 48 85 ff 74 1d <48> 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84 c0 75 4d=
 49 8b 56
>Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:12 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:12 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:12 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:12 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d5f9=
f100000(0000) knlGS:0000000000000000
>Nov 16 23:42:12 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e01bf8 CR3: 000000039221c=
005 CR4: 00000000001606e0
>Nov 16 23:42:12 archlinux kernel: QDBusConnection: Corrupted page table at=
 address 7fd643e029e0
>Nov 16 23:42:12 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e406=
7 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
>Nov 16 23:42:12 archlinux kernel: Bad pagetable: 0009 [#13] SMP PTI
>Nov 16 23:42:12 archlinux kernel: CPU: 4 PID: 1627 Comm: QDBusConnection T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:12 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:12 archlinux kernel: RIP: 0010:__get_user_8+0x21/0x2b
>Nov 16 23:42:12 archlinux kernel: Code: 1f 00 c3 66 0f 1f 44 00 00 48 83 c=
0 07 72 28 65 48 8b 14 25 40 5d 01 00 48 3b 82 58 1a 00 00 73 16 48 19 d2 4=
8 21 d0 0f 1f 00 <48> 8b 50 f9 31 c0 0f 1f 00 c3 0f 1f 00 31 d2 48 c7 c0 f2=
 ff ff ff
>Nov 16 23:42:12 archlinux kernel: RSP: 0000:ffffb2ff81e0fe70 EFLAGS: 00010=
206
>Nov 16 23:42:12 archlinux kernel: RAX: 00007fd643e029e7 RBX: ffff9d5f33089=
c00 RCX: 00000000000002d0
>Nov 16 23:42:12 archlinux kernel: RDX: ffffffffffffffff RSI: 00007fd643e02=
9e0 RDI: ffff9d5f12093c00
>Nov 16 23:42:12 archlinux kernel: RBP: ffffb2ff81e0fec0 R08: 0000000000000=
001 R09: 0000000000000000
>Nov 16 23:42:12 archlinux kernel: R10: 0000000000000002 R11: 0000000000000=
001 R12: ffff9d5f12093c00
>Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01b00 R14: ffff9d5f12093=
c00 R15: ffff9d5f12093c00
>Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d5f9=
f100000(0000) knlGS:0000000000000000
>Nov 16 23:42:12 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e029e0 CR3: 000000039221c=
005 CR4: 00000000001606e0
>Nov 16 23:42:12 archlinux kernel: Call Trace:
>Nov 16 23:42:12 archlinux kernel:  ? exit_robust_list+0x35/0x120
>Nov 16 23:42:12 archlinux kernel:  mm_release+0xf8/0x140
>Nov 16 23:42:12 archlinux kernel:  do_exit+0x164/0x730
>Nov 16 23:42:12 archlinux kernel:  ? do_page_fault+0x31/0x10e
>Nov 16 23:42:12 archlinux kernel:  rewind_stack_do_exit+0x17/0x20
>Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64ccb69fa
>Nov 16 23:42:12 archlinux kernel: Code: 24 08 e8 49 11 f9 ff 8b 54 24 1c 4=
8 8b 74 24 10 41 89 c0 48 8b 7c 24 08 b8 07 00 00 00 0f 05 48 3d 00 f0 ff f=
f 77 2b 44 89 c7 <89> 44 24 08 e8 7d 11 f9 ff 8b 44 24 08 48 83 c4 28 c3 0f=
 1f 40 00
>Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fd643e01bf0 EFLAGS: 00010=
203
>Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000001 RBX: 00007fd64c8d2=
670 RCX: 00007fd64ccb69ef
>Nov 16 23:42:12 archlinux kernel: RDX: 00000000ffffffff RSI: 0000000000000=
005 RDI: 0000000000000000
>Nov 16 23:42:12 archlinux kernel: RBP: 00007fd63c01e040 R08: 0000000000000=
000 R09: 0000000000000001
>Nov 16 23:42:12 archlinux kernel: R10: 00007fd63c0198a0 R11: 0000000000000=
293 R12: 0000000000000005
>Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01c30 R14: 00000000fffff=
fff R15: 00007fd63c000c30
>Nov 16 23:42:12 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:12 archlinux kernel: ---[ end trace 0bfef23d2a61f6e6 ]---
>Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:12 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 89 f=
7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c2 1=
0 48 85 ff 74 1d <48> 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84 c0 75 4d=
 49 8b 56
>Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:12 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:12 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:12 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:12 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d5f9=
f100000(0000) knlGS:0000000000000000
>Nov 16 23:42:12 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e029e0 CR3: 000000039221c=
005 CR4: 00000000001606e0
>Nov 16 23:42:12 archlinux kernel: Fixing recursive fault but reboot is nee=
ded!
>Nov 16 23:42:24 archlinux kernel: ThreadPoolForeg: Corrupted page table at=
 address 7f3b9cad9450
>Nov 16 23:42:24 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f606=
7 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
>Nov 16 23:42:25 archlinux kernel: Bad pagetable: 000d [#14] SMP PTI
>Nov 16 23:42:25 archlinux kernel: CPU: 2 PID: 1819 Comm: ThreadPoolForeg T=
ainted: G      D           5.3.11-2-clear #1
>Nov 16 23:42:25 archlinux kernel: Hardware name: CLEVO                    =
         P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
>Nov 16 23:42:25 archlinux kernel: RIP: 0033:0x7f3ba7014207
>Nov 16 23:42:25 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 49 8=
b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 00 0=
f 87 22 01 00 00 <4c> 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00 00 4c 0f=
 42 e2 4c
>Nov 16 23:42:25 archlinux kernel: RSP: 002b:00007f3b9779a450 EFLAGS: 00010=
297
>Nov 16 23:42:25 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000000=
00a RCX: 0000000000000000
>Nov 16 23:42:25 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000000=
000 RDI: 000000000000000a
>Nov 16 23:42:25 archlinux kernel: RBP: 0000000000000000 R08: 0000000000000=
009 R09: 0000000000000010
>Nov 16 23:42:25 archlinux kernel: R10: 00000000000001f9 R11: 0000000000000=
094 R12: 0000000000000001
>Nov 16 23:42:25 archlinux kernel: R13: 0000000000000000 R14: 0000000000000=
006 R15: 00007f3b9c1ca560
>Nov 16 23:42:25 archlinux kernel: FS:  00007f3b9779b700 GS:  0000000000000=
000
>Nov 16 23:42:25 archlinux kernel: Modules linked in: veth xt_nat xt_conntr=
ack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptable_n=
at nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay ath9k=
 ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc vid=
eobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_common v=
ideodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg802=
11 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwdep =
rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill lpc_=
ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps2 s=
erio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gpu_s=
ched
>Nov 16 23:42:25 archlinux kernel: ---[ end trace 0bfef23d2a61f6e7 ]---
>Nov 16 23:42:25 archlinux kernel: RIP: 0033:0x7fd64d347128
>Nov 16 23:42:25 archlinux kernel: Code: Bad RIP value.
>Nov 16 23:42:25 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00010=
202
>Nov 16 23:42:25 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000=
000 RCX: 0000000000000000
>Nov 16 23:42:25 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000000=
001 RDI: 00007fd643ec8080
>Nov 16 23:42:25 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd64994b=
6d0 R09: 00007fd64994b6d0
>Nov 16 23:42:25 archlinux kernel: R10: 0000556223f42090 R11: 0000000000000=
000 R12: 00007fd644005cc0
>Nov 16 23:42:25 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223e56=
cd0 R15: 0000556223dff780
>Nov 16 23:42:25 archlinux kernel: FS:  00007f3b9779b700(0000) GS:ffff9d5f9=
f080000(0000) knlGS:0000000000000000
>Nov 16 23:42:25 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>Nov 16 23:42:25 archlinux kernel: CR2: 00007fd64d3470fe CR3: 000000039215c=
005 CR4: 00000000001606e0
>Nov 16 23:43:22 archlinux audit[1884]: ANOM_ABEND auid=3D1000 uid=3D1000 g=
id=3D1000 ses=3D2 pid=3D1884 comm=3D"vulkandriverque" exe=3D"/home/saad/.lo=
cal/share/Steam/ubuntu12_64/vulkandriverquery" sig=3D6 res=3D1
>Nov 16 23:43:22 archlinux kernel: audit: type=3D1701 audit(1573965802.347:=
180): auid=3D1000 uid=3D1000 gid=3D1000 ses=3D2 pid=3D1884 comm=3D"vulkandr=
iverque" exe=3D"/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery=
" sig=3D6 res=3D1
>Nov 16 23:43:22 archlinux systemd[1]: Created slice system-systemd\x2dcore=
dump.slice.
>Nov 16 23:43:22 archlinux systemd[1]: Started Process Core Dump (PID 2361/=
UID 0).
>Nov 16 23:43:22 archlinux audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=3D4=
294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-coredump@0-2361-0 comm=3D"=
systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D=
? res=3Dsuccess'
>Nov 16 23:43:22 archlinux kernel: audit: type=3D1130 audit(1573965802.358:=
181): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsyst=
emd-coredump@0-2361-0 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'
>Nov 16 23:43:22 archlinux kernel: BUG: Bad rss-counter state mm:0000000097=
021009 idx:0 val:304
>Nov 16 23:43:27 archlinux systemd-coredump[2362]: Process 1884 (vulkandriv=
erque) of user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
>                                                  Stack trace of thread 18=
84:
>                                                  #0  0x00007f0bcab12f25 r=
aise (libc.so.6)
>                                                  #1  0x00007f0bcaafc897 a=
bort (libc.so.6)
>                                                  #2  0x00007f0bcaafc767 _=
_assert_fail_base.cold (libc.so.6)
>                                                  #3  0x00007f0bcab0b526 _=
_assert_fail (libc.so.6)
>                                                  #4  0x000055793a013d17 n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>                                                  #5  0x000055793a011c7a n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>                                                  #6  0x000055793a007fdb n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>                                                  #7  0x000055793a009600 n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>                                                  #8  0x000055793a0062a3 n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>                                                  #9  0x00007f0bcaafe153 _=
_libc_start_main (libc.so.6)
>                                                  #10 0x000055793a0060ea n=
/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
>Nov 16 23:43:27 archlinux systemd[1]: systemd-coredump@0-2361-0.service: S=
ucceeded.
>Nov 16 23:43:27 archlinux audit[1]: SERVICE_STOP pid=3D1 uid=3D0 auid=3D42=
94967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-coredump@0-2361-0 comm=3D"s=
ystemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?=
 res=3Dsuccess'
>Nov 16 23:43:27 archlinux kernel: audit: type=3D1131 audit(1573965807.785:=
182): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsyst=
emd-coredump@0-2361-0 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739725680.71a00.7282
Date: Sun, 17 Nov 2019 06:36:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304#c9">Commen=
t # 9</a>
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
980" name=3D"attach_145980" title=3D"journalctl-logs-after-hardware-reboot"=
>attachment 145980</a> <a href=3D"attachment.cgi?id=3D145980&amp;action=3De=
dit" title=3D"journalctl-logs-after-hardware-reboot">[details]</a></span>
journalctl-logs-after-hardware-reboot

<span class=3D"quote">&gt;-- Logs begin at Sun 2019-06-30 23:10:01 EDT, end=
 at Sat 2019-11-16 23:43:27 EST. --
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r: Actions to perform:=20
&gt;                                                                   Prim=
ary Output: false
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r:         Change Screen Size: false
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r:         Disable outputs: false
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r:         Change outputs: false
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r:         Enable outputs: false
&gt;Nov 16 23:41:09 archlinux kscreen_backend_launcher[1450]: kscreen.xrand=
r: XRandR::setConfig done!
&gt;Nov 16 23:41:39 archlinux kernel: lxqt-powermanag: Corrupted page table=
 at address 7fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e=
4067 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
&gt;Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#1] SMP PTI
&gt;Nov 16 23:41:39 archlinux kernel: CPU: 2 PID: 1623 Comm: lxqt-powermana=
g Not tainted 5.3.11-2-clear #1
&gt;Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 8=
9 f7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c=
2 10 48 85 ff 74 1d &lt;48&gt; 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84=
 c0 75 4d 49 8b 56
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fd64994ad80 GS:  0000000000=
000000
&gt;Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6da ]---
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 8=
9 f7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c=
2 10 48 85 ff 74 1d &lt;48&gt; 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84=
 c0 75 4d 49 8b 56
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fd64994ad80(0000) GS:ffff9d=
5f9f080000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:39 archlinux kernel: CR2: 00007fd643ec8080 CR3: 0000000392=
21c004 CR4: 00000000001606e0
&gt;Nov 16 23:41:39 archlinux kernel: Chrome_ChildIOT: Corrupted page table=
 at address 1689e6ba5e10
&gt;Nov 16 23:41:39 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000f [#2] SMP PTI
&gt;Nov 16 23:41:39 archlinux kernel: CPU: 3 PID: 1843 Comm: Chrome_ChildIO=
T Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fce0d69770c
&gt;Nov 16 23:41:39 archlinux kernel: Code: 00 00 0f 83 43 01 00 00 b9 03 0=
0 00 00 b8 07 00 00 00 01 f0 48 d3 e8 48 8d 0d 18 85 5b 00 0f b6 04 08 48 6=
3 94 81 fc 02 00 00 &lt;49&gt; 29 94 24 10 0c 00 00 0f 88 2b 01 00 00 48 89=
 c3 48 c1 e3 05 4d
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fce0069f580 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 000000000000002d RBX: 00007fce0d=
7f2748 RCX: 00007fce0dc4fc18
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000000000002800 RSI: 0000000000=
002738 RDI: 0000000000000008
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 00007fce0069f610 R08: 0000000000=
000000 R09: 00007fce0069f7d8
&gt;Nov 16 23:41:39 archlinux kernel: R10: 00007fce0069f7d0 R11: 0000000000=
000000 R12: 00001689e6ba5200
&gt;Nov 16 23:41:39 archlinux kernel: R13: 0000000000000008 R14: 00007fce00=
69f668 R15: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fce006a0700 GS:  0000000000=
000000
&gt;Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6db ]---
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fce006a0700(0000) GS:ffff9d=
5f9f0c0000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0004 CR4: 00000000001606e0
&gt;Nov 16 23:41:39 archlinux kernel: https-jsse-nio-: Corrupted page table=
 at address 7fd978001310
&gt;Nov 16 23:41:39 archlinux kernel: PGD 800000041a726067 P4D 800000041a72=
6067 PUD 39dc52067 PMD 39216a067 PTE ffffffffffffffff
&gt;Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000f [#3] SMP PTI
&gt;Nov 16 23:41:39 archlinux kernel: CPU: 4 PID: 1676 Comm: https-jsse-nio=
- Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fda692a4ba0
&gt;Nov 16 23:41:39 archlinux kernel: Code: 48 8b 45 f8 49 ba 00 00 00 00 0=
0 00 00 00 4d 89 97 c0 01 00 00 49 ba 00 00 00 00 00 00 00 00 4d 89 97 c8 0=
1 00 00 49 8b 4f 38 &lt;c7&gt; 81 00 01 00 00 00 00 00 00 c9 49 81 7f 08 00=
 00 00 00 0f 85 01
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fd9a8eeb670 EFLAGS: 00=
010246
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 00007fd978001210
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000000000002000 RSI: 00007fda78=
e63000 RDI: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 00007fd9a8eeb6b0 R08: 0000000000=
000000 R09: 00007fd9a8eeb5d8
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000000 R12: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fd9a8eeb960 R14: 0000000000=
000000 R15: 00007fda78605800
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fd9a8eec700 GS:  0000000000=
000000
&gt;Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6dc ]---
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007fd9a8eec700(0000) GS:ffff9d=
5f9f100000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000409=
5b0005 CR4: 00000000001606e0
&gt;Nov 16 23:41:39 archlinux kernel: Chrome_IOThread: Corrupted page table=
 at address 7f3b9cad9450
&gt;Nov 16 23:41:39 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f=
6067 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
&gt;Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#4] SMP PTI
&gt;Nov 16 23:41:39 archlinux kernel: CPU: 2 PID: 1820 Comm: Chrome_IOThrea=
d Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7f3ba7014207
&gt;Nov 16 23:41:39 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 4=
9 8b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 0=
0 0f 87 22 01 00 00 &lt;4c&gt; 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00=
 00 4c 0f 42 e2 4c
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007f3b96f98880 EFLAGS: 00=
010297
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000=
00000a RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000=
000000 RDI: 000000000000000a
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000000000000000 R08: 0000000000=
000009 R09: 0000000000000010
&gt;Nov 16 23:41:39 archlinux kernel: R10: 00000000000001f9 R11: 0000000000=
000206 R12: 0000000000000001
&gt;Nov 16 23:41:39 archlinux kernel: R13: 0000000000000000 R14: 0000000000=
000006 R15: 00007f3b9c1ca560
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007f3b96f9a700 GS:  0000000000=
000000
&gt;Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6dd ]---
&gt;Nov 16 23:41:39 archlinux kernel: ThreadPoolSingl: Corrupted page table=
 at address 7f3b9cad9450
&gt;Nov 16 23:41:39 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f=
6067 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
&gt;Nov 16 23:41:39 archlinux kernel: Bad pagetable: 000d [#5] SMP PTI
&gt;Nov 16 23:41:39 archlinux kernel: CPU: 3 PID: 1828 Comm: ThreadPoolSing=
l Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:41:39 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7f3ba7014207
&gt;Nov 16 23:41:39 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 4=
9 8b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 0=
0 0f 87 22 01 00 00 &lt;4c&gt; 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00=
 00 4c 0f 42 e2 4c
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007f3b92daccf0 EFLAGS: 00=
010297
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000=
00000a RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000=
000000 RDI: 000000000000000a
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000000000000000 R08: 0000000000=
000009 R09: 0000000000000010
&gt;Nov 16 23:41:39 archlinux kernel: R10: 00000000000001f9 R11: 0000000000=
000206 R12: 0000000000000001
&gt;Nov 16 23:41:39 archlinux kernel: R13: 0000000000000000 R14: 0000000000=
000006 R15: 00007f3b9c1ca560
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007f3b92dae700 GS:  0000000000=
000000
&gt;Nov 16 23:41:39 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:39 archlinux kernel: ---[ end trace 0bfef23d2a61f6de ]---
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:41:39 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007f3b92dae700(0000) GS:ffff9d=
5f9f0c0000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000392=
15c004 CR4: 00000000001606e0
&gt;Nov 16 23:41:39 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:39 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:39 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:39 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:39 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:39 archlinux kernel: FS:  00007f3b96f9a700(0000) GS:ffff9d=
5f9f080000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:39 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:39 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000392=
15c001 CR4: 00000000001606e0
&gt;Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* ring sdma0 timeout, signaled seq=3D112, emitted seq=3D114
&gt;Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR* Process information: process  pid 0 thread  pid 0
&gt;Nov 16 23:41:49 archlinux kernel: [drm] GPU recovery disabled.
&gt;Nov 16 23:41:52 archlinux kernel: steamwebhelper: Corrupted page table =
at address 1689e6ba2cc8
&gt;Nov 16 23:41:52 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:41:52 archlinux kernel: Bad pagetable: 000d [#6] SMP PTI
&gt;Nov 16 23:41:52 archlinux kernel: CPU: 7 PID: 1840 Comm: steamwebhelper=
 Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:41:52 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:41:52 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:41:52 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:41:52 archlinux kernel: RSP: 002b:00007ffed3ebeef0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:52 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000c7d
&gt;Nov 16 23:41:52 archlinux kernel: RDX: 00001689e6c7dd00 RSI: 00001689e6=
c7dd00 RDI: 00001689e6c7dd00
&gt;Nov 16 23:41:52 archlinux kernel: RBP: 00007ffed3ebef20 R08: 0000000000=
000000 R09: 00007ffed3ebef18
&gt;Nov 16 23:41:52 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba2cc0
&gt;Nov 16 23:41:52 archlinux kernel: R13: 00001689e6ba2c80 R14: 00001689e6=
c7ab70 R15: 0000000000000002
&gt;Nov 16 23:41:52 archlinux kernel: FS:  00007fce03035680 GS:  0000000000=
000000
&gt;Nov 16 23:41:52 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:41:52 archlinux kernel: ---[ end trace 0bfef23d2a61f6df ]---
&gt;Nov 16 23:41:52 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:41:52 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:41:52 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:41:52 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:41:52 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:41:52 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:41:52 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:41:52 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:41:52 archlinux kernel: FS:  00007fce03035680(0000) GS:ffff9d=
5f9f1c0000(0000) knlGS:0000000000000000
&gt;Nov 16 23:41:52 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:41:52 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0004 CR4: 00000000001606e0
&gt;Nov 16 23:42:08 archlinux assert_20191116234208_28.dmp[1973]: Uploading=
 dump (out-of-process)
&gt;                                                              /tmp/dump=
s/assert_20191116234208_28.dmp
&gt;Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: Finished =
uploading minidump (out-of-process): success =3D yes
&gt;Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: response:=
 CrashID=3Dbp-41559f84-c03a-4cef-9b4d-0f6c82191116
&gt;Nov 16 23:42:09 archlinux assert_20191116234208_28.dmp[1973]: file ''/t=
mp/dumps/assert_20191116234208_28.dmp'', upload yes: ''CrashID=3Dbp-41559f8=
4-c03a-4cef-9b4d-0f6c82191116''
&gt;Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 1689e6ba90c8
&gt;Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#7] SMP PTI
&gt;Nov 16 23:42:10 archlinux kernel: CPU: 5 PID: 1848 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdfde9a730 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000c93
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c93380 RSI: 00001689e6=
c93380 RDI: 00001689e6c93380
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdfde9a760 R08: 0000000000=
000000 R09: 00007fcdfde9a758
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba90c0
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba9080 R14: 00001689e6=
d00b90 R15: 0000000000000002
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfde9b700 GS:  0000000000=
000000
&gt;Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e0 ]---
&gt;Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 1689e6ba6b48
&gt;Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#8] SMP PTI
&gt;Nov 16 23:42:10 archlinux kernel: CPU: 2 PID: 1845 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdff69d730 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000c93
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c93480 RSI: 00001689e6=
c93480 RDI: 00001689e6c93480
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdff69d760 R08: 0000000000=
000000 R09: 00007fcdff69d758
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba6b40
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba6b00 R14: 00001689e6=
d00f50 R15: 0000000000000002
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdff69e700 GS:  0000000000=
000000
&gt;Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e1 ]---
&gt;Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 1689e6ba8448
&gt;Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#9] SMP PTI
&gt;Nov 16 23:42:10 archlinux kernel: CPU: 1 PID: 1847 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdfe69b730 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000d14
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6d14fc0 RSI: 00001689e6=
d14fc0 RDI: 00001689e6d14fc0
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdfe69b760 R08: 0000000000=
000000 R09: 00007fcdfe69b758
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba8440
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba8400 R14: 00001689e6=
d00d70 R15: 0000000000000002
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfe69c700 GS:  0000000000=
000000
&gt;Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e2 ]---
&gt;Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 1689e6ba45c8
&gt;Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#10] SMP PTI
&gt;Nov 16 23:42:10 archlinux kernel: CPU: 7 PID: 1842 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fce00ea0730 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000d14
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6d14f00 RSI: 00001689e6=
d14f00 RDI: 00001689e6d14f00
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 00007fce00ea0760 R08: 0000000000=
000000 R09: 00007fce00ea0758
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba45c0
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba4580 R14: 00001689e6=
c9acd0 R15: 0000000000000002
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fce00ea1700 GS:  0000000000=
000000
&gt;Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e3 ]---
&gt;Nov 16 23:42:10 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 1689e6ba5ec8
&gt;Nov 16 23:42:10 archlinux kernel: PGD 8000000418dca067 P4D 8000000418dc=
a067 PUD 40c0c9067 PMD 419432067 PTE ffffffffffffffff
&gt;Nov 16 23:42:10 archlinux kernel: Bad pagetable: 000d [#11] SMP PTI
&gt;Nov 16 23:42:10 archlinux kernel: CPU: 6 PID: 1844 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:10 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fce0d6944e8
&gt;Nov 16 23:42:10 archlinux kernel: Code: ff ff 48 8d 1d 71 87 5d 00 4c 8=
b 3c cb 49 31 c7 49 83 ff 7f 77 75 4d 85 ed 0f 84 0f 01 00 00 44 89 fb 48 c=
1 e3 05 4e 8d 24 2b &lt;45&gt; 8b 74 1d 08 41 83 c6 01 4c 89 e7 48 89 d6 e8=
 24 e0 9a f9 45 89
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fcdffe9e730 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 00000001689e6000 RBX: 0000000000=
000040 RCX: 0000000000000c93
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 00001689e6c930c0 RSI: 00001689e6=
c930c0 RDI: 00001689e6c930c0
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 00007fcdffe9e760 R08: 0000000000=
000000 R09: 00007fcdffe9e758
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000000000000000 R11: 0000000000=
000286 R12: 00001689e6ba5ec0
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00001689e6ba5e80 R14: 00001689e6=
cfa410 R15: 0000000000000002
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdffe9f700 GS:  0000000000=
000000
&gt;Nov 16 23:42:10 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:10 archlinux kernel: ---[ end trace 0bfef23d2a61f6e4 ]---
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfde9b700(0000) GS:ffff9d=
5f9f140000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdff69e700(0000) GS:ffff9d=
5f9f080000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:10 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0003 CR4: 00000000001606e0
&gt;Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdfe69c700(0000) GS:ffff9d=
5f9f040000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:10 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0002 CR4: 00000000001606e0
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:10 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:10 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:10 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:10 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fce00ea1700(0000) GS:ffff9d=
5f9f1c0000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:10 archlinux kernel: FS:  00007fcdffe9f700(0000) GS:ffff9d=
5f9f100000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0002 CR4: 00000000001606e0
&gt;Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0006 CR4: 00000000001606e0
&gt;Nov 16 23:42:10 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:10 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000418=
df0004 CR4: 00000000001606e0
&gt;Nov 16 23:42:12 archlinux kernel: QDBusConnection: Corrupted page table=
 at address 7fd643e01bf8
&gt;Nov 16 23:42:12 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e=
4067 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
&gt;Nov 16 23:42:12 archlinux kernel: Bad pagetable: 000f [#12] SMP PTI
&gt;Nov 16 23:42:12 archlinux kernel: CPU: 4 PID: 1627 Comm: QDBusConnectio=
n Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:12 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64ccb69fa
&gt;Nov 16 23:42:12 archlinux kernel: Code: 24 08 e8 49 11 f9 ff 8b 54 24 1=
c 48 8b 74 24 10 41 89 c0 48 8b 7c 24 08 b8 07 00 00 00 0f 05 48 3d 00 f0 f=
f ff 77 2b 44 89 c7 &lt;89&gt; 44 24 08 e8 7d 11 f9 ff 8b 44 24 08 48 83 c4=
 28 c3 0f 1f 40 00
&gt;Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fd643e01bf0 EFLAGS: 00=
010203
&gt;Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000001 RBX: 00007fd64c=
8d2670 RCX: 00007fd64ccb69ef
&gt;Nov 16 23:42:12 archlinux kernel: RDX: 00000000ffffffff RSI: 0000000000=
000005 RDI: 0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: RBP: 00007fd63c01e040 R08: 0000000000=
000000 R09: 0000000000000001
&gt;Nov 16 23:42:12 archlinux kernel: R10: 00007fd63c0198a0 R11: 0000000000=
000293 R12: 0000000000000005
&gt;Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01c30 R14: 00000000ff=
ffffff R15: 00007fd63c000c30
&gt;Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700 GS:  0000000000=
000000
&gt;Nov 16 23:42:12 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:12 archlinux kernel: ---[ end trace 0bfef23d2a61f6e5 ]---
&gt;Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:12 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 8=
9 f7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c=
2 10 48 85 ff 74 1d &lt;48&gt; 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84=
 c0 75 4d 49 8b 56
&gt;Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:12 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:12 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:12 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d=
5f9f100000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e01bf8 CR3: 0000000392=
21c005 CR4: 00000000001606e0
&gt;Nov 16 23:42:12 archlinux kernel: QDBusConnection: Corrupted page table=
 at address 7fd643e029e0
&gt;Nov 16 23:42:12 archlinux kernel: PGD 80000003921e4067 P4D 80000003921e=
4067 PUD 392157067 PMD 392168067 PTE ffffffffffffffff
&gt;Nov 16 23:42:12 archlinux kernel: Bad pagetable: 0009 [#13] SMP PTI
&gt;Nov 16 23:42:12 archlinux kernel: CPU: 4 PID: 1627 Comm: QDBusConnectio=
n Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:12 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:12 archlinux kernel: RIP: 0010:__get_user_8+0x21/0x2b
&gt;Nov 16 23:42:12 archlinux kernel: Code: 1f 00 c3 66 0f 1f 44 00 00 48 8=
3 c0 07 72 28 65 48 8b 14 25 40 5d 01 00 48 3b 82 58 1a 00 00 73 16 48 19 d=
2 48 21 d0 0f 1f 00 &lt;48&gt; 8b 50 f9 31 c0 0f 1f 00 c3 0f 1f 00 31 d2 48=
 c7 c0 f2 ff ff ff
&gt;Nov 16 23:42:12 archlinux kernel: RSP: 0000:ffffb2ff81e0fe70 EFLAGS: 00=
010206
&gt;Nov 16 23:42:12 archlinux kernel: RAX: 00007fd643e029e7 RBX: ffff9d5f33=
089c00 RCX: 00000000000002d0
&gt;Nov 16 23:42:12 archlinux kernel: RDX: ffffffffffffffff RSI: 00007fd643=
e029e0 RDI: ffff9d5f12093c00
&gt;Nov 16 23:42:12 archlinux kernel: RBP: ffffb2ff81e0fec0 R08: 0000000000=
000001 R09: 0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: R10: 0000000000000002 R11: 0000000000=
000001 R12: ffff9d5f12093c00
&gt;Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01b00 R14: ffff9d5f12=
093c00 R15: ffff9d5f12093c00
&gt;Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d=
5f9f100000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e029e0 CR3: 0000000392=
21c005 CR4: 00000000001606e0
&gt;Nov 16 23:42:12 archlinux kernel: Call Trace:
&gt;Nov 16 23:42:12 archlinux kernel:  ? exit_robust_list+0x35/0x120
&gt;Nov 16 23:42:12 archlinux kernel:  mm_release+0xf8/0x140
&gt;Nov 16 23:42:12 archlinux kernel:  do_exit+0x164/0x730
&gt;Nov 16 23:42:12 archlinux kernel:  ? do_page_fault+0x31/0x10e
&gt;Nov 16 23:42:12 archlinux kernel:  rewind_stack_do_exit+0x17/0x20
&gt;Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64ccb69fa
&gt;Nov 16 23:42:12 archlinux kernel: Code: 24 08 e8 49 11 f9 ff 8b 54 24 1=
c 48 8b 74 24 10 41 89 c0 48 8b 7c 24 08 b8 07 00 00 00 0f 05 48 3d 00 f0 f=
f ff 77 2b 44 89 c7 &lt;89&gt; 44 24 08 e8 7d 11 f9 ff 8b 44 24 08 48 83 c4=
 28 c3 0f 1f 40 00
&gt;Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fd643e01bf0 EFLAGS: 00=
010203
&gt;Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000001 RBX: 00007fd64c=
8d2670 RCX: 00007fd64ccb69ef
&gt;Nov 16 23:42:12 archlinux kernel: RDX: 00000000ffffffff RSI: 0000000000=
000005 RDI: 0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: RBP: 00007fd63c01e040 R08: 0000000000=
000000 R09: 0000000000000001
&gt;Nov 16 23:42:12 archlinux kernel: R10: 00007fd63c0198a0 R11: 0000000000=
000293 R12: 0000000000000005
&gt;Nov 16 23:42:12 archlinux kernel: R13: 00007fd643e01c30 R14: 00000000ff=
ffffff R15: 00007fd63c000c30
&gt;Nov 16 23:42:12 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:12 archlinux kernel: ---[ end trace 0bfef23d2a61f6e6 ]---
&gt;Nov 16 23:42:12 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:12 archlinux kernel: Code: 8b 47 08 8d 78 01 41 89 7f 08 8=
9 f7 29 cf 85 ff 7e 48 31 db 66 0f 1f 44 00 00 48 63 c1 48 01 d8 48 8b 7c c=
2 10 48 85 ff 74 1d &lt;48&gt; 8b 07 4c 89 e9 4c 89 e2 48 89 ee ff 50 10 84=
 c0 75 4d 49 8b 56
&gt;Nov 16 23:42:12 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:12 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:12 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:12 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:12 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:12 archlinux kernel: FS:  00007fd643e02700(0000) GS:ffff9d=
5f9f100000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:12 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:12 archlinux kernel: CR2: 00007fd643e029e0 CR3: 0000000392=
21c005 CR4: 00000000001606e0
&gt;Nov 16 23:42:12 archlinux kernel: Fixing recursive fault but reboot is =
needed!
&gt;Nov 16 23:42:24 archlinux kernel: ThreadPoolForeg: Corrupted page table=
 at address 7f3b9cad9450
&gt;Nov 16 23:42:24 archlinux kernel: PGD 800000040c0f6067 P4D 800000040c0f=
6067 PUD 419b53067 PMD 419430067 PTE ffffffffffffffff
&gt;Nov 16 23:42:25 archlinux kernel: Bad pagetable: 000d [#14] SMP PTI
&gt;Nov 16 23:42:25 archlinux kernel: CPU: 2 PID: 1819 Comm: ThreadPoolFore=
g Tainted: G      D           5.3.11-2-clear #1
&gt;Nov 16 23:42:25 archlinux kernel: Hardware name: CLEVO                 =
            P150EM/P150EM, BIOS 1.02.17PM v2 07/01/2013
&gt;Nov 16 23:42:25 archlinux kernel: RIP: 0033:0x7f3ba7014207
&gt;Nov 16 23:42:25 archlinux kernel: Code: 00 66 90 48 89 da 48 c1 e2 04 4=
9 8b 44 17 18 48 85 c0 0f 84 a5 00 00 00 49 8b 54 17 10 48 3b 15 6f 8d 01 0=
0 0f 87 22 01 00 00 &lt;4c&gt; 8b 80 50 04 00 00 49 39 d4 48 8b b0 48 04 00=
 00 4c 0f 42 e2 4c
&gt;Nov 16 23:42:25 archlinux kernel: RSP: 002b:00007f3b9779a450 EFLAGS: 00=
010297
&gt;Nov 16 23:42:25 archlinux kernel: RAX: 00007f3b9cad9000 RBX: 0000000000=
00000a RCX: 0000000000000000
&gt;Nov 16 23:42:25 archlinux kernel: RDX: 0000000000000001 RSI: 0000000000=
000000 RDI: 000000000000000a
&gt;Nov 16 23:42:25 archlinux kernel: RBP: 0000000000000000 R08: 0000000000=
000009 R09: 0000000000000010
&gt;Nov 16 23:42:25 archlinux kernel: R10: 00000000000001f9 R11: 0000000000=
000094 R12: 0000000000000001
&gt;Nov 16 23:42:25 archlinux kernel: R13: 0000000000000000 R14: 0000000000=
000006 R15: 00007f3b9c1ca560
&gt;Nov 16 23:42:25 archlinux kernel: FS:  00007f3b9779b700 GS:  0000000000=
000000
&gt;Nov 16 23:42:25 archlinux kernel: Modules linked in: veth xt_nat xt_con=
ntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype iptable_filter iptabl=
e_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter overlay at=
h9k ath9k_common ath9k_hw mac80211 uvcvideo ath mei_hdcp videobuf2_vmalloc =
videobuf2_memops snd_hda_codec_hdmi videobuf2_v4l2 wmi_bmof videobuf2_commo=
n videodev snd_hda_codec_realtek mc snd_hda_codec_generic ledtrig_audio cfg=
80211 snd_hda_intel joydev snd_hda_codec snd_hda_core psmouse r8169 snd_hwd=
ep rtsx_pci_ms i2c_i801 mei_me snd_pcm realtek memstick mei libphy rfkill l=
pc_ich snd_timer snd wmi thermal soundcore battery ac ip_tables atkbd libps=
2 serio_raw i8042 hid_logitech_hidpp amdgpu amd_iommu_v2 hid_logitech_dj gp=
u_sched
&gt;Nov 16 23:42:25 archlinux kernel: ---[ end trace 0bfef23d2a61f6e7 ]---
&gt;Nov 16 23:42:25 archlinux kernel: RIP: 0033:0x7fd64d347128
&gt;Nov 16 23:42:25 archlinux kernel: Code: Bad RIP value.
&gt;Nov 16 23:42:25 archlinux kernel: RSP: 002b:00007fffc622cfa0 EFLAGS: 00=
010202
&gt;Nov 16 23:42:25 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000=
000000 RCX: 0000000000000000
&gt;Nov 16 23:42:25 archlinux kernel: RDX: 0000556223eec720 RSI: 0000000000=
000001 RDI: 00007fd643ec8080
&gt;Nov 16 23:42:25 archlinux kernel: RBP: 0000556223e115e0 R08: 00007fd649=
94b6d0 R09: 00007fd64994b6d0
&gt;Nov 16 23:42:25 archlinux kernel: R10: 0000556223f42090 R11: 0000000000=
000000 R12: 00007fd644005cc0
&gt;Nov 16 23:42:25 archlinux kernel: R13: 00007fffc622cfe8 R14: 0000556223=
e56cd0 R15: 0000556223dff780
&gt;Nov 16 23:42:25 archlinux kernel: FS:  00007f3b9779b700(0000) GS:ffff9d=
5f9f080000(0000) knlGS:0000000000000000
&gt;Nov 16 23:42:25 archlinux kernel: CS:  0033 DS: 0000 ES: 0000 CR0: 0000=
000080050033
&gt;Nov 16 23:42:25 archlinux kernel: CR2: 00007fd64d3470fe CR3: 0000000392=
15c005 CR4: 00000000001606e0
&gt;Nov 16 23:43:22 archlinux audit[1884]: ANOM_ABEND auid=3D1000 uid=3D100=
0 gid=3D1000 ses=3D2 pid=3D1884 comm=3D&quot;vulkandriverque&quot; exe=3D&q=
uot;/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery&quot; sig=
=3D6 res=3D1
&gt;Nov 16 23:43:22 archlinux kernel: audit: type=3D1701 audit(1573965802.3=
47:180): auid=3D1000 uid=3D1000 gid=3D1000 ses=3D2 pid=3D1884 comm=3D&quot;=
vulkandriverque&quot; exe=3D&quot;/home/saad/.local/share/Steam/ubuntu12_64=
/vulkandriverquery&quot; sig=3D6 res=3D1
&gt;Nov 16 23:43:22 archlinux systemd[1]: Created slice system-systemd\x2dc=
oredump.slice.
&gt;Nov 16 23:43:22 archlinux systemd[1]: Started Process Core Dump (PID 23=
61/UID 0).
&gt;Nov 16 23:43:22 archlinux audit[1]: SERVICE_START pid=3D1 uid=3D0 auid=
=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-coredump&#64;0-2361-0 =
comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; hostn=
ame=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;Nov 16 23:43:22 archlinux kernel: audit: type=3D1130 audit(1573965802.3=
58:181): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Ds=
ystemd-coredump&#64;0-2361-0 comm=3D&quot;systemd&quot; exe=3D&quot;/usr/li=
b/systemd/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;Nov 16 23:43:22 archlinux kernel: BUG: Bad rss-counter state mm:0000000=
097021009 idx:0 val:304
&gt;Nov 16 23:43:27 archlinux systemd-coredump[2362]: Process 1884 (vulkand=
riverque) of user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
&gt;                                                  Stack trace of thread=
 1884:
&gt;                                                  #0  0x00007f0bcab12f2=
5 raise (libc.so.6)
&gt;                                                  #1  0x00007f0bcaafc89=
7 abort (libc.so.6)
&gt;                                                  #2  0x00007f0bcaafc76=
7 __assert_fail_base.cold (libc.so.6)
&gt;                                                  #3  0x00007f0bcab0b52=
6 __assert_fail (libc.so.6)
&gt;                                                  #4  0x000055793a013d1=
7 n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;                                                  #5  0x000055793a011c7=
a n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;                                                  #6  0x000055793a007fd=
b n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;                                                  #7  0x000055793a00960=
0 n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;                                                  #8  0x000055793a0062a=
3 n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;                                                  #9  0x00007f0bcaafe15=
3 __libc_start_main (libc.so.6)
&gt;                                                  #10 0x000055793a0060e=
a n/a (/home/saad/.local/share/Steam/ubuntu12_64/vulkandriverquery)
&gt;Nov 16 23:43:27 archlinux systemd[1]: <a href=3D"mailto:systemd-coredum=
p&#64;0-2361-0.service">systemd-coredump&#64;0-2361-0.service</a>: Succeede=
d.
&gt;Nov 16 23:43:27 archlinux audit[1]: SERVICE_STOP pid=3D1 uid=3D0 auid=
=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-coredump&#64;0-2361-0 =
comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; hostn=
ame=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;Nov 16 23:43:27 archlinux kernel: audit: type=3D1131 audit(1573965807.7=
85:182): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Ds=
ystemd-coredump&#64;0-2361-0 comm=3D&quot;systemd&quot; exe=3D&quot;/usr/li=
b/systemd/systemd&quot; hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'</=
span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739725680.71a00.7282--

--===============1127156878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1127156878==--
