Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7219597542
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 19:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A315A0304;
	Wed, 17 Aug 2022 17:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7A2113545;
 Wed, 17 Aug 2022 17:44:29 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id mn10so5844491qvb.10;
 Wed, 17 Aug 2022 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=J1wG7I7d+b+Gm+VyG0MNfyyylwWfpwl2Cy4EdEXZgmE=;
 b=awr/Mg1rzWk0nIOZ5LAdsmlvB9rpqeEsKI47+5GLDUuyql/qiF1f5W7HZYKEtY8VJ0
 y6Hh8hgYrykTPfvBfrehe8urf5MwKprP36ovdrWeff3LtKo8kqyk6w2gZBieOf3tTNWD
 SUq0FgVkDBQwtmZV9YzwLUxNv8q1P6iQ/tkIye6Bz7B+oHWbZGpR8mIMOkE0Lug3i+gb
 m/hZb5w223H30yJU642O/yh5ZRfYmxFgZIDIpj+oPIH1Kmcky1eQl31S+Qmthq4TFYd9
 A02A7GK6C/lUN/2f2d9oAOQXdo3Ogm4vRZyuWz/fm8/HS6Py6umuT91YcTdMLHO0C8Np
 HH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=J1wG7I7d+b+Gm+VyG0MNfyyylwWfpwl2Cy4EdEXZgmE=;
 b=mk+NU80GTLa6bOHoJRey5kSsCYuLV6AR55GDXG3+HwA3bJVuaa/Kx3wbLcOPDRGPvn
 So8zLPIBqNxVnwsiNXlp/H0m/wkrCsqe/BsY/SL6PSJ1Jbi6G+z/qqkLzauIzEiGChUb
 gIeIIIllD4WwMqOapIOl0XbbpE4uWtSAdCRwBpeWrrUa6235WhzGuMbgsNEbAsJBid2J
 2J07+EBGQiBmZjf06JwYAmKIM2y2yaP6KcaZHimmwSiydMCZX7RzN5qZcyBDj0c3scRD
 COFGoSCASLf7CIy+SRPfp93L+wC4HmeyXRCl1FBBnVfBeYrycACujWvRp1i5wJiRLYK5
 Y+UQ==
X-Gm-Message-State: ACgBeo3kmhTnOXbK2pH9TVuRrQGNIl07lWbHffROiTy1SAeFY9UN/DKE
 l5GJT57Uf4/42L5TQkju7vRr7ZrNOP7OTuZpi6HRtDyyEavQgaN+sdU=
X-Google-Smtp-Source: AA6agR5ouYu6T0TO4FpczS1ogVTlBsnrYrz1mco+wpVp+sdwOgGzu10g6mEv2uT5j38gZ0K4fHcm3P5KlpqF2XpIDsQ=
X-Received: by 2002:a0c:a9ca:0:b0:492:61ca:7fcc with SMTP id
 c10-20020a0ca9ca000000b0049261ca7fccmr13472552qvb.29.1660758268084; Wed, 17
 Aug 2022 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
 <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
 <20220817160751.moqhebkiuiydraka@mail.igalia.com>
In-Reply-To: <20220817160751.moqhebkiuiydraka@mail.igalia.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 17 Aug 2022 22:44:17 +0500
Message-ID: <CABXGCsOM9An-+EeaGWm0OA1FN2p94=BF210Lhy0tiO6ye9onWQ@mail.gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
To: Melissa Wen <mwen@igalia.com>
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
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 9:08 PM Melissa Wen <mwen@igalia.com> wrote:
>
> Hi Mikhail,
>
> IIUC, you got this second user-after-free by applying the first version
> of Ma=C3=ADra's patch, right? So, that version was adding another unbalan=
ced
> unlock to the cs ioctl flow, but it was solved in the latest version,
> that you can find here: https://patchwork.freedesktop.org/patch/497680/
> If this is the situation, can you check this last version?
>
> Thanks,
>
> Melissa

With the last version warning "bad unlock balance detected!" was gone,
but the user-after-free issue remains.
And again "Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched]".

[  297.834779] ------------[ cut here ]------------
[  297.834818] refcount_t: underflow; use-after-free.
[  297.834831] WARNING: CPU: 30 PID: 2377 at lib/refcount.c:28
refcount_warn_saturate+0xba/0x110
[  297.834838] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep sunrpc binfmt_misc snd_seq_midi snd_seq_midi_event mt76x2u
mt76x2_common mt76x02_usb mt76_usb mt76x02_lib snd_hda_codec_realtek
iwlmvm intel_rapl_msr snd_hda_codec_generic snd_hda_codec_hdmi mt76
vfat fat snd_hda_intel intel_rapl_common mac80211 snd_intel_dspcfg
snd_intel_sdw_acpi snd_usb_audio snd_hda_codec snd_usbmidi_lib btusb
edac_mce_amd iwlwifi libarc4 uvcvideo snd_hda_core btrtl snd_rawmidi
snd_hwdep videobuf2_vmalloc btbcm kvm_amd videobuf2_memops snd_seq
iwlmei btintel videobuf2_v4l2 eeepc_wmi snd_seq_device
videobuf2_common btmtk kvm xpad videodev joydev irqbypass snd_pcm
asus_wmi hid_logitech_hidpp ff_memless cfg80211 bluetooth rapl mc
[  297.834932]  ledtrig_audio snd_timer sparse_keymap platform_profile
wmi_bmof snd video pcspkr k10temp i2c_piix4 rfkill soundcore mei
asus_ec_sensors acpi_cpufreq zram amdgpu drm_ttm_helper ttm
crct10dif_pclmul crc32_pclmul crc32c_intel iommu_v2 ucsi_ccg gpu_sched
typec_ucsi drm_buddy ghash_clmulni_intel drm_display_helper ccp igb
typec sp5100_tco nvme cec nvme_core dca wmi ip6_tables ip_tables fuse
[  297.834978] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 fjes():1
[  297.835055]  pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
pcc_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
[  297.835071] CPU: 30 PID: 2377 Comm: kworker/30:6 Tainted: G
W    L    -------  ---
6.0.0-0.rc1.20220817git3cc40a443a04.14.fc38.x86_64 #1
[  297.835075] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
[  297.835078] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched=
]
[  297.835085] RIP: 0010:refcount_warn_saturate+0xba/0x110
[  297.835088] Code: 01 01 e8 59 59 6f 00 0f 0b e9 22 46 a5 00 80 3d
be 7d be 01 00 75 85 48 c7 c7 c0 99 8e aa c6 05 ae 7d be 01 01 e8 36
59 6f 00 <0f> 0b e9 ff 45 a5 00 80 3d 99 7d be 01 00 0f 85 5e ff ff ff
48 c7
[  297.835091] RSP: 0018:ffffbd3506df7e60 EFLAGS: 00010286
[  297.835095] RAX: 0000000000000026 RBX: ffff961b250cbc28 RCX: 00000000000=
00000
[  297.835097] RDX: 0000000000000001 RSI: ffffffffaa8d07a4 RDI: 00000000fff=
fffff
[  297.835100] RBP: ffff96276a3f5600 R08: 0000000000000000 R09: ffffbd3506d=
f7d10
[  297.835102] R10: 0000000000000003 R11: ffff9627ae2fffe8 R12: ffff96276a3=
fc800
[  297.835105] R13: ffff9618c03e6600 R14: ffff96276a3fc805 R15: ffff961b250=
cbc30
[  297.835108] FS:  0000000000000000(0000) GS:ffff96276a200000(0000)
knlGS:0000000000000000
[  297.835110] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  297.835113] CR2: 0000621001e4a000 CR3: 000000018d958000 CR4: 00000000003=
50ee0
[  297.835116] Call Trace:
[  297.835118]  <TASK>
[  297.835121]  process_one_work+0x2a0/0x600
[  297.835133]  worker_thread+0x4f/0x3a0
[  297.835139]  ? process_one_work+0x600/0x600
[  297.835142]  kthread+0xf5/0x120
[  297.835145]  ? kthread_complete_and_exit+0x20/0x20
[  297.835151]  ret_from_fork+0x22/0x30
[  297.835166]  </TASK>
[  297.835168] irq event stamp: 198245
[  297.835171] hardirqs last  enabled at (198253):
[<ffffffffa918ce7e>] __up_console_sem+0x5e/0x70
[  297.835175] hardirqs last disabled at (198260):
[<ffffffffa918ce63>] __up_console_sem+0x43/0x70
[  297.835177] softirqs last  enabled at (196454):
[<ffffffffa9de3a4e>] addrconf_verify_rtnl+0x23e/0x920
[  297.835182] softirqs last disabled at (196448):
[<ffffffffa9de3835>] addrconf_verify_rtnl+0x25/0x920
[  297.835185] ---[ end trace 0000000000000000 ]---


Fill kernel log: https://pastebin.com/zbbY2zDU

--=20
Best Regards,
Mike Gavrilov.
