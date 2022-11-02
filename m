Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836C66163FB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BA910E4A0;
	Wed,  2 Nov 2022 13:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68810E49B;
 Wed,  2 Nov 2022 13:43:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d26so45341180eje.10;
 Wed, 02 Nov 2022 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ThfjF0rfnaV1zz1f2rGbDC6RHNiTW9njS84QRhxrL8=;
 b=BQ4Bsm2HcSIDx7GntMi7PgMB1sf6DvQUPvKxLEIs0/ljGwKMqbXu/FNQ8SlfFZSsSx
 bv9AkOB24qiN0tBy20HoR+CxavuNDJg9pnbT5egG5gSB0AplKedo6Kg5qupJfK7Tw2a5
 gkjjKoll1W+IQ7QMkEZAbWX8GDyr10yN9La8Bkd8nW+XItGiVkx0UJi8x1K/HwRnTqW0
 xA5MZ8Ra1CeGP+Hs7MWVCcBqv3wcktTO3ulEnuQDKVGEQJ2uzp4AMtzHUVKbAjW6jjbb
 GGAn3i9a3Vu9DDCwRBw2KRJM5eta9TfGiUS+glk/gCe1JeQXugjajNJLbWCJX4f/yUQo
 hwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ThfjF0rfnaV1zz1f2rGbDC6RHNiTW9njS84QRhxrL8=;
 b=zGinMFt4OL/VoVaxaWU4RgUlOY5UiJwd0nW5PMsi+pYbxaOg1m+9h9IM1Nwx5Ofzd/
 vI31ZC6beYZ3l7FoFYRddwkTzp67BH/Npr1fVAqELfAAVcnt54CHghfZFBhvK6O0erig
 hwQbZnCKGEQQG5AJ+/TRNz/8kh72fqIqxk0yXteGiFx9fkqRs2RuDTg+rYKD6kQLZSi9
 cD/aRMdbXtpYoEWbWb33w6zCImmzHdvN0XWQakUNm5N+MFdvxwgfR06Cy/RpjAdoANBh
 FhKzw6n0ZubTcmTCrdFrrWRpeGFbW7iv6GjptHdsinkXErkJrO/m7J9cSRYV40INwpbP
 C3BA==
X-Gm-Message-State: ACrzQf05bgfa7ONOsTxhw5o9RkT9lYg96N6fMBtICY/Z6+0cIphL7VTj
 9+E+z1wIPATEfOBIN9YIq6I=
X-Google-Smtp-Source: AMsMyM7aaZAd77C9Daqfbf820vWoSy5/cW2CWk7Ubcg4YS5Nury28xJMoqm01PZFA89clJ/OpAeVZw==
X-Received: by 2002:a17:907:9618:b0:78d:fa75:e2b8 with SMTP id
 gb24-20020a170907961800b0078dfa75e2b8mr24439156ejc.65.1667396604957; 
 Wed, 02 Nov 2022 06:43:24 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:576c:b102:647e:9ffd?
 ([2a02:908:1256:79a0:576c:b102:647e:9ffd])
 by smtp.gmail.com with ESMTPSA id
 n12-20020aa7c44c000000b004588ef795easm5869046edr.34.2022.11.02.06.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:43:24 -0700 (PDT)
Message-ID: <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
Date: Wed, 2 Nov 2022 14:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
 <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
 <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.22 um 14:36 schrieb Mikhail Gavrilov:
> On Tue, Nov 1, 2022 at 10:52 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Let's focus on one problem at a time.
>>
>> The issue here is that somehow userptr handling became racy after we
>> removed the lock, but I don't see why.
>>
>> We need to fix this ASAP since it is probably a much wider problem and
>> the additional lock just hides it somehow.
>>
>> Going to provide you with an updated patch tomorrow.
>>
>> Thanks,
>> Christian.
> Recently sackboy has been updated and now the kernel log contains a
> trace very similar to the one in the first post, even with the patch
> applied.
>
> [  155.948044] ------------[ cut here ]------------
> [  155.948164] WARNING: CPU: 3 PID: 4850 at
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:678
> amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
> [  155.948342] Modules linked in: uinput rfcomm snd_seq_dummy
> snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
> qrtr bnep intel_rapl_msr intel_rapl_common snd_hda_codec_realtek
> snd_sof_amd_renoir snd_sof_amd_acp snd_hda_codec_generic
> snd_hda_codec_hdmi snd_sof_pci sunrpc binfmt_misc snd_sof
> snd_hda_intel snd_sof_utils snd_intel_dspcfg mt7921e
> snd_intel_sdw_acpi snd_hda_codec mt7921_common snd_soc_core
> edac_mce_amd mt76_connac_lib btusb snd_hda_core snd_compress snd_hwdep
> mt76 btrtl ac97_bus kvm_amd snd_pcm_dmaengine btbcm snd_rpl_pci_acp6x
> snd_pci_acp6x btintel mac80211 btmtk snd_seq snd_seq_device kvm
> snd_pcm snd_pci_acp5x libarc4 bluetooth irqbypass vfat snd_timer
> snd_rn_pci_acp3x fat rapl snd_acp_config asus_nb_wmi snd cfg80211
> snd_soc_acpi wmi_bmof k10temp pcspkr
> [  155.948436]  snd_pci_acp3x i2c_piix4 soundcore asus_wireless
> amd_pmc joydev zram amdgpu drm_ttm_helper ttm crct10dif_pclmul
> hid_asus crc32_pclmul asus_wmi crc32c_intel iommu_v2 ledtrig_audio
> polyval_clmulni gpu_sched sparse_keymap polyval_generic
> platform_profile drm_buddy drm_display_helper nvme rfkill
> ghash_clmulni_intel hid_multitouch ucsi_acpi sha512_ssse3 nvme_core
> typec_ucsi serio_raw sp5100_tco r8169 ccp cec nvme_common typec
> i2c_hid_acpi i2c_hid video wmi ip6_tables ip_tables fuse
> [  155.948540] CPU: 3 PID: 4850 Comm: Sackboy-Win64-T Tainted: G
>   W    L    -------  ---
> 6.1.0-0.rc3.20221101git5aaef24b5c6d.29.fc38.x86_64 #1
> [  155.948544] Hardware name: ASUSTeK COMPUTER INC. ROG Strix
> G513QY_G513QY/G513QY, BIOS G513QY.318 03/29/2022
> [  155.948547] RIP: 0010:amdgpu_ttm_tt_get_user_pages+0x14c/0x190 [amdgpu]
> [  155.948748] Code: 9e f1 e9 32 ff ff ff 4c 89 e9 89 ea 48 c7 c6 a8
> a3 fd c0 48 c7 c7 88 81 1e c1 e8 af 97 ea f1 eb 8e 66 90 bd f2 ff ff
> ff eb 8d <0f> 0b eb f5 bd fd ff ff ff eb 82 bd f2 ff ff ff e9 62 ff ff
> ff 48
> [  155.948751] RSP: 0018:ffff960b544d3a50 EFLAGS: 00010282
> [  155.948756] RAX: ffff8a4e40d44e00 RBX: ffff8a4f0e564140 RCX: 0000000000000001
> [  155.948759] RDX: 0000000000000000 RSI: ffff8a4e40d44e00 RDI: ffff8a4f4b52b400
> [  155.948761] RBP: ffff8a4e8c979000 R08: 0000000000000dc0 R09: 00000000ffffffff
> [  155.948764] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8a4e8aaad558
> [  155.948767] R13: 000000003b910000 R14: ffff8a4f0e667180 R15: ffff8a4f4b52b458
> [  155.948770] FS:  00007fa13fe006c0(0000) GS:ffff8a5d16e00000(0000)
> knlGS:0000000036f80000
> [  155.948772] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  155.948775] CR2: 0000000025c9e1d0 CR3: 0000000361990000 CR4: 0000000000750ee0
> [  155.948778] PKRU: 55555554
> [  155.948780] Call Trace:
> [  155.948783]  <TASK>
> [  155.948790]  amdgpu_cs_ioctl+0x9fd/0x2030 [amdgpu]
> [  155.948992]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [  155.949155]  drm_ioctl_kernel+0xac/0x160
> [  155.949165]  drm_ioctl+0x1e7/0x450
> [  155.949172]  ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [  155.949344]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [  155.949528]  __x64_sys_ioctl+0x90/0xd0
> [  155.949537]  do_syscall_64+0x5b/0x80
> [  155.949547]  ? lock_is_held_type+0xe8/0x140
> [  155.949559]  ? do_syscall_64+0x67/0x80
> [  155.949565]  ? lockdep_hardirqs_on+0x7d/0x100
> [  155.949573]  ? do_syscall_64+0x67/0x80
> [  155.949579]  ? do_syscall_64+0x67/0x80
> [  155.949586]  ? do_syscall_64+0x67/0x80
> [  155.949592]  ? lockdep_hardirqs_on+0x7d/0x100
> [  155.949597]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [  155.949603] RIP: 0033:0x7fa1b7fd912f
> [  155.949610] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
> 00 00
> [  155.949615] RSP: 002b:00007fa13fdfe920 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  155.949621] RAX: ffffffffffffffda RBX: 00007fa13fdfebe8 RCX: 00007fa1b7fd912f
> [  155.949625] RDX: 00007fa13fdfea10 RSI: 00000000c0186444 RDI: 0000000000000165
> [  155.949629] RBP: 00007fa13fdfea10 R08: 00007f9ff80018e0 R09: 00007fa13fdfe9c0
> [  155.949633] R10: 000000007eb11590 R11: 0000000000000246 R12: 00000000c0186444
> [  155.949635] R13: 0000000000000165 R14: 00007f9ff8001860 R15: 0000000000000005
> [  155.949647]  </TASK>
> [  155.949650] irq event stamp: 5375
> [  155.949652] hardirqs last  enabled at (5383): [<ffffffffb218e8fe>]
> __up_console_sem+0x5e/0x70
> [  155.949657] hardirqs last disabled at (5390): [<ffffffffb218e8e3>]
> __up_console_sem+0x43/0x70
> [  155.949659] softirqs last  enabled at (3236): [<ffffffffb21012ed>]
> __irq_exit_rcu+0xed/0x160
> [  155.949663] softirqs last disabled at (3231): [<ffffffffb21012ed>]
> __irq_exit_rcu+0xed/0x160
> [  155.949665] ---[ end trace 0000000000000000 ]---
> [  155.949676] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
> process the buffer list -14!
>
> [  155.950689] ================================================
> [  155.950690] WARNING: lock held when returning to user space!
> [  155.950691] 6.1.0-0.rc3.20221101git5aaef24b5c6d.29.fc38.x86_64 #1
> Tainted: G        W    L    -------  ---
> [  155.950694] ------------------------------------------------
> [  155.950695] Sackboy-Win64-T/4850 is leaving the kernel with locks still held!
> [  155.950697] 1 lock held by Sackboy-Win64-T/4850:
> [  155.950698]  #0: ffff8a4e8aaad0a8
> (&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0x903/0x2030
> [amdgpu]
>
> But the most interesting thing is that all previous kernels 6.0, 5.19
> are affected by the problem. It is not enough to revert the
> dd80d9c8eecac8c516da5b240d01a35660ba6cb6 commit.

Yeah, that totally confirms what I expected. The context lock just hides 
the problem because userspace tended to use the same context.

What the application now seems to do is to use multiple contexts for its 
submission and in this case re-adding the lock doesn't even help.

Thanks for that information, gets me a lot closer to a solution.

Regards,
Christian.

>
> Full kernel log 6.1-rc3 + patch above: https://pastebin.com/6ebmReer
> Full kernel log 5.19: https://pastebin.com/5dRCgxNW
>
> Thanks.
>

