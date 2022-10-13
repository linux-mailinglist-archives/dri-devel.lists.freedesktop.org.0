Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453A5FDAFF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF310E243;
	Thu, 13 Oct 2022 13:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4C10E242;
 Thu, 13 Oct 2022 13:36:57 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id gf8so1988314pjb.5;
 Thu, 13 Oct 2022 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1XayT+sq8+iKRQmWk4pyWKE0avCZeFE1DpXn4dpKlOc=;
 b=Cw2IKfepjcIqXZXvGKj3GPyt/2dcYWbKIGyu39phR+2d7dMCw7GT3ro90/6TLLFStN
 fsc/sDbXhSzp3Aru6eRrvrJidPDQcYIKvca3MAHHZWDrF35Hpu/06JFvJdF5yZoJvszJ
 6/yevU4lns10QxlCEdJEKPR5YzSt89V2KjMiw6QnHYQ5UlfoikuLo72+L7G5ZGGOQByR
 KKzHMitJbeY6Duf9pEtGj23wDKHDYsRxHqwCojg70peaBFb7ftpOW2sk000ZOC+TXj1k
 ptt40ddPYDiLQvq2l5wYLpBnW1kxyb1smfdKoaFqdvdrKwbO/BIj21ct9boi59frszyo
 cG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1XayT+sq8+iKRQmWk4pyWKE0avCZeFE1DpXn4dpKlOc=;
 b=ENIvafCyHO4LH4NWkkIvF8Kh7aFGNWohQLEoBnFmtyPPuKPTyCPBxXBs+/wjKIuLF/
 KrMAjmQfPqVP6V81m8u7Y6Mgoh8m09FlKfIGsdTq44btcyTu4uimVJwpdBxh2k6YJRoV
 SheLM7v+S+7WURC87R74218nFYi+yH5KQeRFdMukaFMqi0TaKN4Ir0XmCzSKnMuf9QiE
 bE6+EQhvu7VNcXF3byWxkgXDx+war7FHyrjlNU+uyIo5NYDjId81jSflz6uxLj28mqC7
 C1aNQtuhe9Ip5irH/bXOIBjo++Eqwfdi1t6SrBTpoRtNH3AMOnd1OsiHCM5P4hpLi8u2
 2yRg==
X-Gm-Message-State: ACrzQf0rUCUsA4W9leC7ZibJmOwe5c8Fd5pR3AlTRb+VDVlKAYIbTmHL
 HOridI0mt5r9WmUHeZxI9z/ev/gFG2jOQPe1lsoqQYfkLnNO6EIO
X-Google-Smtp-Source: AMsMyM4UW+b+WSNAeJww3SWRV2d3d0pJhdsLgrWke/LzNI9jZBqk7ZR1Aaq/WkayIlb5WYIjmRQGsC8pariesJrJapo=
X-Received: by 2002:a17:902:ccc2:b0:178:29e1:899e with SMTP id
 z2-20020a170902ccc200b0017829e1899emr29422ple.114.1665668216341; Thu, 13 Oct
 2022 06:36:56 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 13 Oct 2022 18:36:44 +0500
Message-ID: <CABXGCsNFRQ9A1Vx6_qsP7NqedhG7QScOG4-Eupvz3etgykJt=Q@mail.gmail.com>
Subject: [regression][6.0] After commit
 b261509952bc19d1012cf732f853659be6ebc61e
 I see WARNING message at drivers/gpu/drm/drm_modeset_lock.c:276
 drm_modeset_drop_locks+0x63/0x70
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, sunpeng.li@amd.com, 
 Bhawanpreet.Lakha@amd.com, wayne.lin@amd.com, daniel.wheeler@amd.com, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi!
I bisected an issue of the 6.0 kernel which started happening after
6.0-rc7 on all my machines.

Backtrace of this issue looks like as:

[ 2807.339439] ------------[ cut here ]------------
[ 2807.339445] WARNING: CPU: 11 PID: 2061 at
drivers/gpu/drm/drm_modeset_lock.c:276
drm_modeset_drop_locks+0x63/0x70
[ 2807.339453] Modules linked in: tls uinput rfcomm snd_seq_dummy
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep intel_rapl_msr intel_rapl_common snd_sof_amd_renoir
snd_sof_amd_acp snd_sof_pci snd_hda_codec_realtek sunrpc snd_sof
snd_hda_codec_hdmi snd_hda_codec_generic snd_sof_utils snd_hda_intel
snd_intel_dspcfg mt7921e snd_intel_sdw_acpi binfmt_misc snd_soc_core
mt7921_common snd_hda_codec snd_compress vfat ac97_bus edac_mce_amd
mt76_connac_lib snd_pcm_dmaengine fat snd_hda_core snd_rpl_pci_acp6x
snd_pci_acp6x mt76 btusb snd_hwdep kvm_amd btrtl snd_seq btbcm
mac80211 snd_seq_device kvm btintel btmtk libarc4 snd_pcm
snd_pci_acp5x bluetooth snd_timer snd_rn_pci_acp3x irqbypass
snd_acp_config snd_soc_acpi cfg80211 rapl snd joydev pcspkr
asus_nb_wmi wmi_bmof
[ 2807.339519]  snd_pci_acp3x soundcore i2c_piix4 k10temp amd_pmc
asus_wireless zram amdgpu drm_ttm_helper ttm hid_asus asus_wmi
crct10dif_pclmul iommu_v2 crc32_pclmul ledtrig_audio crc32c_intel
gpu_sched sparse_keymap platform_profile hid_multitouch
polyval_clmulni nvme ucsi_acpi drm_buddy polyval_generic
drm_display_helper ghash_clmulni_intel serio_raw nvme_core ccp
typec_ucsi rfkill sp5100_tco r8169 cec nvme_common typec wmi video
i2c_hid_acpi i2c_hid ip6_tables ip_tables fuse
[ 2807.339540] Unloaded tainted modules: acpi_cpufreq():1
acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
amd64_edac():1 acpi_cpufreq():1 acpi_cpufreq():1 amd64_edac():1
amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1
amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
fjes():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 fjes():1
amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
fjes():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 fjes():1 acpi_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
fjes():1 pcc_cpufreq():1 amd64_edac():1 acpi_cpufreq():1
acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 fjes():1
acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1
pcc_cpufreq():1 fjes():1
[ 2807.339579]  acpi_cpufreq():1 fjes():1 pcc_cpufreq():1
acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1
acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1
acpi_cpufreq():1 fjes():1 acpi_cpufreq():1 fjes():1 fjes():1 fjes():1
fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
fjes():1 fjes():1 fjes():1 fjes():1
[ 2807.339596] CPU: 11 PID: 2061 Comm: gnome-shell Tainted: G        W
   L     6.0.0-rc4-07-cb0eca01ad9756e853efec3301203c2b5b45aa9f+ #16
[ 2807.339598] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
G513QY_G513QY/G513QY, BIOS G513QY.318 03/29/2022
[ 2807.339600] RIP: 0010:drm_modeset_drop_locks+0x63/0x70
[ 2807.339602] Code: 42 08 48 89 10 48 89 1b 48 8d bb 50 ff ff ff 48
89 5b 08 e8 3f 41 55 00 48 8b 45 78 49 39 c4 75 c6 5b 5d 41 5c c3 cc
cc cc cc <0f> 0b eb ac 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 55
41 54
[ 2807.339604] RSP: 0018:ffffb6ad46e07b80 EFLAGS: 00010282
[ 2807.339606] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000002
[ 2807.339607] RDX: 0000000000000001 RSI: ffffffffa6a118b1 RDI: ffffb6ad46e07c00
[ 2807.339608] RBP: ffffb6ad46e07c00 R08: 0000000000000000 R09: 0000000000000000
[ 2807.339609] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
[ 2807.339610] R13: ffff9801ca24bb00 R14: ffff9801ca24bb00 R15: 0000000000000000
[ 2807.339611] FS:  00007f57445b0600(0000) GS:ffff981198e00000(0000)
knlGS:0000000000000000
[ 2807.339613] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2807.339614] CR2: 00007f574367f000 CR3: 00000001236ae000 CR4: 0000000000750ee0
[ 2807.339615] PKRU: 55555554
[ 2807.339616] Call Trace:
[ 2807.339618]  <TASK>
[ 2807.339621]  drm_mode_atomic_ioctl+0x3b9/0xac0
[ 2807.339627]  ? drm_atomic_set_property+0xb60/0xb60
[ 2807.339629]  drm_ioctl_kernel+0xac/0x160
[ 2807.339633]  drm_ioctl+0x22d/0x410
[ 2807.339635]  ? drm_atomic_set_property+0xb60/0xb60
[ 2807.339639]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[ 2807.339834]  __x64_sys_ioctl+0x90/0xd0
[ 2807.339838]  do_syscall_64+0x5b/0x80
[ 2807.339843]  ? rcu_read_lock_sched_held+0x10/0x80
[ 2807.339846]  ? trace_hardirqs_on_prepare+0x55/0xe0
[ 2807.339849]  ? do_syscall_64+0x67/0x80
[ 2807.339851]  ? rcu_read_lock_sched_held+0x10/0x80
[ 2807.339853]  ? trace_hardirqs_on_prepare+0x55/0xe0
[ 2807.339855]  ? do_syscall_64+0x67/0x80
[ 2807.339857]  ? do_syscall_64+0x67/0x80
[ 2807.339859]  ? rcu_read_lock_sched_held+0x10/0x80
[ 2807.339861]  ? trace_hardirqs_on_prepare+0x55/0xe0
[ 2807.339863]  ? do_syscall_64+0x67/0x80
[ 2807.339864]  ? do_syscall_64+0x67/0x80
[ 2807.339867]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 2807.339870] RIP: 0033:0x7f5749e8d04f
[ 2807.339873] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
00 00
[ 2807.339875] RSP: 002b:00007ffecf4c6460 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 2807.339877] RAX: ffffffffffffffda RBX: 000055c222fb32f0 RCX: 00007f5749e8d04f
[ 2807.339878] RDX: 00007ffecf4c6500 RSI: 00000000c03864bc RDI: 000000000000000e
[ 2807.339880] RBP: 00007ffecf4c6500 R08: 0000000000000000 R09: 0000000000000000
[ 2807.339881] R10: 000055c21e4b9010 R11: 0000000000000246 R12: 00000000c03864bc
[ 2807.339882] R13: 000000000000000e R14: 000055c222e317e0 R15: 000055c21f0a4080
[ 2807.339887]  </TASK>
[ 2807.339889] irq event stamp: 171599
[ 2807.339890] hardirqs last  enabled at (171599):
[<ffffffffa7000b62>] asm_exc_page_fault+0x22/0x30
[ 2807.339893] hardirqs last disabled at (171598):
[<ffffffffa6f3bd81>] exc_page_fault+0x121/0x2b0
[ 2807.339896] softirqs last  enabled at (171482):
[<ffffffffa60ffe4d>] __irq_exit_rcu+0xed/0x160
[ 2807.339900] softirqs last disabled at (171371):
[<ffffffffa60ffe4d>] __irq_exit_rcu+0xed/0x160
[ 2807.339903] ---[ end trace 0000000000000000 ]---

bisect points to this commit: b261509952bc19d1012cf732f853659be6ebc61e.

b261509952bc19d1012cf732f853659be6ebc61e is the first bad commit
commit b261509952bc19d1012cf732f853659be6ebc61e
Author: Leo Li <sunpeng.li@amd.com>
Date:   Tue Aug 30 16:38:16 2022 -0400

    drm/amd/display: Fix double cursor on non-video RGB MPO

    [Why]

    DC makes use of layer_index (zpos) when picking the HW plane to enable
    HW cursor on. However, some compositors will not attach zpos information
    to each DRM plane. Consequently, in amdgpu, we default layer_index to 0
    and do not update it.

    This causes said DC logic to enable HW cursor on all planes of the same
    layer_index, which manifests as a double cursor issue if one of the
    planes is scaled (and hence scaling the cursor as well).

    [How]

    Use DRM core helpers to calculate a normalized_zpos value for each
    drm_plane_state under each crtc, within the atomic state.

    This helper will first consider existing zpos values, and if
    identical/unset, fallback to plane ID ordering.

    The normalized_zpos is then passed to dc_plane_info during atomic check
    for later use by the cursor logic.

    Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
    Acked-by: Wayne Lin <wayne.lin@amd.com>
    Signed-off-by: Leo Li <sunpeng.li@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

After reverting this commit the WARNING messages described here disappeared.

Thanks.

-- 
Best Regards,
Mike Gavrilov.
