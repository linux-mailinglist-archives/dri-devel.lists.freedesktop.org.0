Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC56071BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D8410E212;
	Fri, 21 Oct 2022 08:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92B10E642;
 Fri, 21 Oct 2022 08:08:42 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 78so1869104pgb.13;
 Fri, 21 Oct 2022 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SlNzBRr71KbRRC/meb2KSsTKDW9Z4AtXjBafpUgGsnU=;
 b=pLUuShaFX3eXC1Bi1qWcW7A8CwWV/I1ia+XiRTC3oqzAGjoF9QVh8CQeRo5T5ghzyA
 QuySVqGJ7JAWas1fV8rS31ryj3HzD4Qp4lix+s+kH6EuwBu+pW9fvijz1JEn8WJNJ0w+
 VEV5vwbIVg9/EQcj2C6KDUR7KSoA/ZxI+I0WQSCh/7ePjxJsVH6w1Tqhkv64JdR9fY/H
 S/cR/cdJ0FBdD9HfkzWQqBFy4emk6yAsnp6HXG2vPRFwvt9WyvwEPR+gzHtNqa+kGE4D
 zkJBIIWDADx2BKjynn2n1AXXzlrKwEENyWXgfjwrWapu3i3BCrQQ+Qnm09BjtuSKLgye
 6HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SlNzBRr71KbRRC/meb2KSsTKDW9Z4AtXjBafpUgGsnU=;
 b=yNx2lYlTaW7/LLisAUqTsKJ1gImOkd0ncYzc1qyRAqytP7hh2cOWZ5l1zuxdRHxT8w
 49C0KRDr0K6VQ+HJGrDC2u7pCR7GgNnojcNQttA6/Qrc9tPt4JtQ0sOPtPqgy9Z39pyl
 q7YXyp/11FrHTufzULeSq/duHqR4Vm5h9MR5Sv2dsSZdHAUhc7Zk2Zh7MnwAJBcEaZHu
 MFUahmgGaRXuBrXqi6DsegVlE+vhb39cFxDFjucJl58q06Z85MUHlc9JehXal3/FYqI7
 uiwUiKujcSdLnO+9K9XfJGq222ifQ9ELubxM4SajPGFrwV7PxB87nfnU363Rpak2pJrR
 /z9w==
X-Gm-Message-State: ACrzQf37LLBk4sJ73yvaaCGyttRLCU6ccZsGnHB9KqG44NhF/ylg3xfz
 3XV1fmMrt4aLqa3YzdsN3bK+g55lxRKzCPWVRUXaLvVPqGapS+nu
X-Google-Smtp-Source: AMsMyM4z2OLcswJOs1OtWJ7zGV2n+kHV7vYtr68GqJ/4HdN7VOfP2L76EOdRDAFi2Ppn2/nrarkM0IBvLa7eFY2htV8=
X-Received: by 2002:a05:6a00:13a1:b0:563:4c5:c3dd with SMTP id
 t33-20020a056a0013a100b0056304c5c3ddmr18385526pfg.5.1666339721865; Fri, 21
 Oct 2022 01:08:41 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 21 Oct 2022 13:08:30 +0500
Message-ID: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
Subject: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6
 some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!
I found that some games (Cyberpunk 2077, Forza Horizon 4/5) hang at
start after commit dd80d9c8eecac8c516da5b240d01a35660ba6cb6.

dd80d9c8eecac8c516da5b240d01a35660ba6cb6 is the first bad commit
commit dd80d9c8eecac8c516da5b240d01a35660ba6cb6
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Jul 14 10:23:38 2022 +0200

    drm/amdgpu: revert "partial revert "remove ctx->lock" v2"

    This reverts commit 94f4c4965e5513ba624488f4b601d6b385635aec.

    We found that the bo_list is missing a protection for its list entries.
    Since that is fixed now this workaround can be removed again.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
 3 files changed, 6 insertions(+), 18 deletions(-)


And when it happening in kernel log appears a such backtrace:
[  231.331210] ------------[ cut here ]------------
[  231.331262] WARNING: CPU: 11 PID: 6555 at
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:675
amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
[  231.331424] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep intel_rapl_msr intel_rapl_common snd_sof_amd_renoir
snd_sof_amd_acp snd_sof_pci snd_hda_codec_realtek snd_sof
snd_hda_codec_generic snd_hda_codec_hdmi snd_sof_utils mt7921e
snd_hda_intel sunrpc snd_intel_dspcfg mt7921_common binfmt_misc
snd_intel_sdw_acpi snd_hda_codec mt76_connac_lib edac_mce_amd btusb
snd_soc_core mt76 snd_hda_core btrtl snd_hwdep snd_compress kvm_amd
ac97_bus snd_seq btbcm snd_pcm_dmaengine btintel snd_rpl_pci_acp6x
mac80211 btmtk snd_pci_acp6x kvm snd_seq_device snd_pcm snd_pci_acp5x
libarc4 irqbypass bluetooth snd_rn_pci_acp3x snd_timer pcspkr
asus_nb_wmi rapl joydev wmi_bmof snd_acp_config cfg80211 snd_soc_acpi
vfat snd
[  231.331490]  snd_pci_acp3x i2c_piix4 soundcore fat k10temp amd_pmc
asus_wireless zram amdgpu drm_ttm_helper ttm hid_asus asus_wmi
iommu_v2 crct10dif_pclmul crc32_pclmul gpu_sched crc32c_intel
ledtrig_audio sparse_keymap polyval_clmulni platform_profile drm_buddy
polyval_generic hid_multitouch drm_display_helper rfkill nvme
ucsi_acpi ghash_clmulni_intel nvme_core video typec_ucsi serio_raw ccp
sha512_ssse3 sp5100_tco r8169 cec nvme_common typec wmi i2c_hid_acpi
i2c_hid ip6_tables ip_tables fuse
[  231.331532] CPU: 11 PID: 6555 Comm: GameThread Tainted: G        W
  L    -------  ---
6.1.0-0.rc1.20221019gitaae703b02f92.17.fc38.x86_64 #1
[  231.331534] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
G513QY_G513QY/G513QY, BIOS G513QY.318 03/29/2022
[  231.331537] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
[  231.331654] Code: a8 d0 e9 32 ff ff ff 4c 89 e9 89 ea 48 c7 c6 40
82 f3 c0 48 c7 c7 10 60 14 c1 e8 2f a0 f4 d0 eb 8e 66 90 bd f2 ff ff
ff eb 8d <0f> 0b eb f5 bd fd ff ff ff eb 82 bd f2 ff ff ff e9 62 ff ff
ff 48
[  231.331656] RSP: 0018:ffffaad4c705bae8 EFLAGS: 00010286
[  231.331659] RAX: ffff8e9cbdbe3200 RBX: ffff8e997e3f2440 RCX: 00000000000=
00000
[  231.331661] RDX: 0000000000000000 RSI: ffff8e9cbdbe3200 RDI: ffff8e9c312=
08000
[  231.331663] RBP: 0000000000000001 R08: 0000000000000dc0 R09: 00000000fff=
fffff
[  231.331665] R10: 0000000000000001 R11: 0000000000000000 R12: ffffaad4c70=
5bb90
[  231.331666] R13: 0000000076510000 R14: ffff8e9c89f334e0 R15: ffff8e991fd=
a8000
[  231.331668] FS:  000000007c2af6c0(0000) GS:ffff8ea7d8e00000(0000)
knlGS:000000007b2c0000
[  231.331671] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  231.331673] CR2: 00007ff65ffd8000 CR3: 00000004f90f0000 CR4: 00000000007=
50ee0
[  231.331674] PKRU: 55555554
[  231.331676] Call Trace:
[  231.331678]  <TASK>
[  231.331682]  amdgpu_cs_ioctl+0x87e/0x1fc0 [amdgpu]
[  231.331824]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[  231.331981]  drm_ioctl_kernel+0xac/0x160
[  231.331990]  drm_ioctl+0x1e7/0x450
[  231.331994]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[  231.332118]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[  231.332233]  __x64_sys_ioctl+0x90/0xd0
[  231.332238]  do_syscall_64+0x5b/0x80
[  231.332243]  ? asm_exc_page_fault+0x22/0x30
[  231.332247]  ? lockdep_hardirqs_on+0x7d/0x100
[  231.332250]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  231.332253] RIP: 0033:0x7ff677c5704f
[  231.332256] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
00 00
[  231.332258] RSP: 002b:000000007c2ad470 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  231.332261] RAX: ffffffffffffffda RBX: 000000007c2ad718 RCX: 00007ff677c=
5704f
[  231.332263] RDX: 000000007c2ad540 RSI: 00000000c0186444 RDI: 00000000000=
000a7
[  231.332265] RBP: 000000007c2ad540 R08: 00007ff590048590 R09: 000000007c2=
ad510
[  231.332266] R10: 000000007e864ec0 R11: 0000000000000246 R12: 00000000c01=
86444
[  231.332268] R13: 00000000000000a7 R14: 000000007c2ad6f0 R15: 00000000000=
00005
[  231.332277]  </TASK>
[  231.332279] irq event stamp: 18035
[  231.332281] hardirqs last  enabled at (18043): [<ffffffff9118e8de>]
__up_console_sem+0x5e/0x70
[  231.332284] hardirqs last disabled at (18050): [<ffffffff9118e8c3>]
__up_console_sem+0x43/0x70
[  231.332287] softirqs last  enabled at (17864): [<ffffffff911012ed>]
__irq_exit_rcu+0xed/0x160
[  231.332289] softirqs last disabled at (17857): [<ffffffff911012ed>]
__irq_exit_rcu+0xed/0x160
[  231.332291] ---[ end trace 0000000000000000 ]---
[  231.332299] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
process the buffer list -14!

[  231.332423] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
[  231.332424] WARNING: lock held when returning to user space!
[  231.332425] 6.1.0-0.rc1.20221019gitaae703b02f92.17.fc38.x86_64 #1
Tainted: G        W    L    -------  ---
[  231.332426] ------------------------------------------------
[  231.332427] GameThread/6555 is leaving the kernel with locks still held!
[  231.332428] 1 lock held by GameThread/6555:
[  231.332429]  #0: ffff8e9cfbac64a8
(&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0x786/0x1fc0
[amdgpu]
[  389.428155] amdgpu 0000:03:00.0: amdgpu: free PSP TMR buffer

Christian, any ideas?
Thanks.

Full kernel log: https://pastebin.com/6SEaDay8
My hardware:
GPU: 6900XT, 6800M
CPU: 3950X, 5900HX

--=20
Best Regards,
Mike Gavrilov.
