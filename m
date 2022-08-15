Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76192592B7C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64DC989FA;
	Mon, 15 Aug 2022 10:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7D12AF20;
 Mon, 15 Aug 2022 10:37:43 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id i24so5191735qkg.13;
 Mon, 15 Aug 2022 03:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Lv6oUrQJgvMNPNLhhepsKSTA09owo4lM6SFZE9X9Tf4=;
 b=qbhZHr0+ja4KNNL5U0a1nPqJkVSk4CbwQOEQ6S4+biyGchgue4CauN++CL79+H6V5s
 VkkZ6InKgwQNR30kg7X3aVcb/rf/uM67Zst7/xHbRZHPvh2INn8ize3S6nX7HOq0iZpZ
 vuQEROdCT8sffXfvKzdRiPcdR+3/pYrTdy7K0xP/b4ZGxw6g/LdAnP+Mum8RJsHjp8qi
 ZEh59XTVaTMFrY6Dt2rZWMBqRtTQgh1P1spDykuZYVuRKGq4NHlcPZ6isN4sSQzMwLDC
 Zyw7mfvwmTWf4S3MjO9qPZkz1iqeuTjs7GpHF0eWJKQ+ZG6R6Ru6Blq9UuLPeesMxJUf
 UcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Lv6oUrQJgvMNPNLhhepsKSTA09owo4lM6SFZE9X9Tf4=;
 b=UsSKN9llY4p0h843nzMDzs7Ccm7TeMKwDhsUx5bzzb3t59SUdmqLmeP5o6ufXu5zvl
 AjtKutFW4kMBYKRioj9kgbEEiHrXc4VREuTM/Tazw/Kio67CUIk1mwAdM8XoJaweaU0b
 WyiUlggBy8XU4OtVubXowC9pd10Lyg3rVrUF0ZaFFkZ+9Xf3PH/UyqVivtOERjdBb1Wj
 h/ZRoWGTNuuxu5JgavRY104SdE21Hycrg3gBEAm1gqBpRctXVlzYTEN50rWe6mvpyaIK
 uqeHZ2Uy2BZCHpy1xd1hTqRkbX+zysDTW/fZ0OLF6si4Ybs1b7L4ANNWyhajayUVKYc2
 U8Xw==
X-Gm-Message-State: ACgBeo1aIGvJ1oE4IcScQS0jHrb93iVi9ixj7R/OIUvk0eytoU3H+X+k
 1wkvEffjBFa3rmll/Ub3qJCWvJUn0UgZVy2xego=
X-Google-Smtp-Source: AA6agR6UfLIE0OwQ///KGJAAGQzM+Cm+pHusr7PVAYvSKQRQPQzWmHKCV2w8TmsCQK4gioskGDyjzbM9UUNth2SiZ/4=
X-Received: by 2002:a37:6946:0:b0:6b9:7406:8204 with SMTP id
 e67-20020a376946000000b006b974068204mr10952162qkc.47.1660559862529; Mon, 15
 Aug 2022 03:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
In-Reply-To: <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 15 Aug 2022 15:37:31 +0500
Message-ID: <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 5:20 AM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> Hi Mikhail
>
> Looks like this use-after-free problem was introduced on
> 90af0ca047f3049c4b46e902f432ad6ef1e2ded6. Checking this patch it seems
> like: if amdgpu_cs_vm_handling return r !=3D 0, then it will unlock
> bo_list_mutex inside the function amdgpu_cs_vm_handling and again on
> amdgpu_cs_parser_fini.
>
> Maybe the following patch will help:

Thanks, I tested this patch.
But with this patch use-after-free problem happening in another place:

[  894.012920] ------------[ cut here ]------------
[  894.012939] refcount_t: underflow; use-after-free.
[  894.012968] WARNING: CPU: 14 PID: 205 at lib/refcount.c:28
refcount_warn_saturate+0xba/0x110
[  894.012999] Modules linked in: tls uinput rfcomm snd_seq_dummy
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep sunrpc snd_seq_midi snd_seq_midi_event snd_hda_codec_realtek
mt76x2u mt76x2_common snd_hda_codec_generic snd_hda_codec_hdmi
intel_rapl_msr mt76x02_usb intel_rapl_common snd_hda_intel mt76_usb
snd_intel_dspcfg vfat iwlmvm snd_intel_sdw_acpi mt76x02_lib fat
snd_usb_audio snd_hda_codec mt76 edac_mce_amd snd_usbmidi_lib
snd_hda_core btusb snd_rawmidi snd_hwdep mac80211 mc iwlwifi btrtl
eeepc_wmi asus_wmi btbcm snd_seq kvm_amd libarc4 ledtrig_audio
snd_seq_device btintel iwlmei sparse_keymap btmtk kvm snd_pcm
irqbypass platform_profile snd_timer xpad joydev cfg80211 rapl
hid_logitech_hidpp bluetooth ff_memless wmi_bmof video pcspkr snd
k10temp i2c_piix4
[  894.013086]  soundcore rfkill mei asus_ec_sensors acpi_cpufreq zram
amdgpu drm_ttm_helper ttm iommu_v2 crct10dif_pclmul ucsi_ccg gpu_sched
crc32_pclmul crc32c_intel typec_ucsi drm_buddy typec
drm_display_helper ghash_clmulni_intel igb ccp cec nvme sp5100_tco
nvme_core dca wmi ip6_tables ip_tables fuse
[  894.013322] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
[  894.013455]  pcc_cpufreq():1 pcc_cpufreq():1 fjes():1
pcc_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
[  894.013690] CPU: 14 PID: 205 Comm: kworker/14:1 Tainted: G        W
   L    -------  ---
5.20.0-0.rc0.20220812git7ebfc85e2cd7.11.fc38.x86_64 #1
[  894.013725] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
[  894.013756] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched=
]
[  894.013779] RIP: 0010:refcount_warn_saturate+0xba/0x110
[  894.013796] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d
de 7e be 01 00 75 85 48 c7 c7 f8 98 8e 9c c6 05 ce 7e be 01 01 e8 56
4a 6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff
48 c7
[  894.013842] RSP: 0018:ffffb48681153e60 EFLAGS: 00010286
[  894.013858] RAX: 0000000000000026 RBX: ffff9bad16f1f028 RCX: 00000000000=
00000
[  894.013878] RDX: 0000000000000001 RSI: ffffffff9c8d06dc RDI: 00000000fff=
fffff
[  894.013897] RBP: ffff9bba663f5600 R08: 0000000000000000 R09: ffffb486811=
53d10
[  894.013916] R10: 0000000000000003 R11: ffff9bbaae2fffe8 R12: ffff9bba663=
fc800
[  894.013934] R13: ffff9bab93fcab40 R14: ffff9bba663fc805 R15: ffff9bad16f=
1f030
[  894.013954] FS:  0000000000000000(0000) GS:ffff9bba66200000(0000)
knlGS:0000000000000000
[  894.013975] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  894.013991] CR2: 00001aa46b2ec008 CR3: 0000000101516000 CR4: 00000000003=
50ee0
[  894.014011] Call Trace:
[  894.014022]  <TASK>
[  894.014030]  process_one_work+0x2a0/0x600
[  894.014051]  worker_thread+0x4f/0x3a0
[  894.014065]  ? process_one_work+0x600/0x600
[  894.014079]  kthread+0xf5/0x120
[  894.014092]  ? kthread_complete_and_exit+0x20/0x20
[  894.014109]  ret_from_fork+0x22/0x30
[  894.014129]  </TASK>
[  894.014137] irq event stamp: 5802
[  894.014148] hardirqs last  enabled at (5801): [<ffffffff9bf2a9e4>]
_raw_spin_unlock_irq+0x24/0x50
[  894.014178] hardirqs last disabled at (5802): [<ffffffff9bf21d8c>]
__schedule+0xe2c/0x16d0
[  894.014206] softirqs last  enabled at (4350): [<ffffffff9b7acb88>]
rht_deferred_worker+0x708/0xc00
[  894.014235] softirqs last disabled at (4348): [<ffffffff9b7ac677>]
rht_deferred_worker+0x1f7/0xc00
[  894.014264] ---[ end trace 0000000000000000 ]---

Full kernel log is here:
https://pastebin.com/wwWkXQJZ


--=20
Best Regards,
Mike Gavrilov.
