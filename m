Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3C521ECD
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 17:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7410E15B;
	Tue, 10 May 2022 15:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161510E15B;
 Tue, 10 May 2022 15:31:36 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so18698992fac.7; 
 Tue, 10 May 2022 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A3C2Y5JnBnbYNhD+5UVTyjVuDk7iGLJEb4DhyztVkt8=;
 b=Pz1mBlFBCcu0WcRSg4+psd9pn7Xyf58AdJDaYFm5NNz6AjRMG60yRGxErVIdKcLI+n
 bZSxryxpcmbwLRfTRjEwNOAKimyaLERrSCBw2I3cQW6CDkKRPmebJZt46WTL35DKJURF
 mOOrt7EMktFs473uAySR8o4QzsbcTOyhaTyXSO7u5DKm7+fFMw7kyFCXEResPrrLuGie
 r7G+9pNTQbNUDmb5QJoM9QlSiOCQ3LsxSnYKoj9VxXbhZ5WBFwTkq6isd2IDEJ26k3xu
 G6Xf8X4MivBYB323v2iSZU7WusvIgLkTrPQ3byR7XrF4I1PEC+aBFZ6JjKVhedRqUXP3
 Cbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A3C2Y5JnBnbYNhD+5UVTyjVuDk7iGLJEb4DhyztVkt8=;
 b=a8pxLKBHRpW9dA82ybf0waWDzDeJo9fWqiq4yVcXrlm6m7CUkZA2n3s6f9cEmmkFgZ
 xKn5dY4DWgFLT2s5X98hs8HvPDNceNHYdvEZEn5eCr94JTkGwoRegDwlk2YxuAJsP024
 WUGXfAZTawGyw27NmHJiUnSXumGRnklR6qyWnWeUVEYDxTDy53v2yRaIL9xffhk4BQ52
 cNBPSWuDahTRQJPb7A5aQlPhXOo/9QlDnUqLJqVrptYJtlImoGynhsHQf8X86d5IIol7
 ilh6MnA1IjbsB0F5DZUel4I7/JWrj2Bh8d9ihtl14hqxVj78mgbkjhqnrDmchyVVDdkl
 u61A==
X-Gm-Message-State: AOAM530gV6vw/HkXlovCcO+xklmlHnYUxh9dWFrj90n5GzM4jNGfSADf
 D2dw9dGYMdo63J/6U91CA9eQ5Yt+b5MK6Guj1u4=
X-Google-Smtp-Source: ABdhPJznI0Y4Evv1DPJe4fnOMpS+e+MVx31IvsR7XPyEWshyVNYic6thdcCHP3nUWS5ZuRNguMEFp4U2Qz9wr0cfzoQ=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr350285oap.253.1652196695239; Tue, 10 May
 2022 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
In-Reply-To: <YnpIjdTT3esZ72Bf@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 May 2022 11:31:24 -0400
Message-ID: <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 7:12 AM J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrot=
e:
>
> Gentle ping. This is a 5.18 regression and I also see it with
> 5.18-rc6. Please let me know if you need anything else to debug.
>

Are you doing anything special when it happens?  I.e., does it happen
when the monitor is coming out of DPMS or something like that?

Alex

> Thanks,
>
>         Joerg
>
> On Fri, May 06, 2022 at 09:16:12AM -0400, Alex Deucher wrote:
> > + some display folks
> >
> > On Fri, May 6, 2022 at 6:19 AM J=C3=B6rg R=C3=B6del <jroedel@suse.de> w=
rote:
> > >
> > > Hi,
> > >
> > > since recently I started to experience warnings and NULL-ptr
> > > dereferences in the amdgpu driver with kernel 5.18-rc5+. Earlier
> > > 5.18-based kernels might be affected as well, but I havn't seen this
> > > with 5.17.
> > >
> > > The kernel was built from the iommu-next branch, based on 5.18-rc5.
> > >
> > > The messages start with some PCIe error being reported:
> > >
> > > [20389.984993] pcieport 0000:00:03.1: AER: Multiple Corrected error r=
eceived: 0000:0a:00.0
> > > [20389.985005] amdgpu 0000:0a:00.0: PCIe Bus Error: severity=3DCorrec=
ted, type=3DData Link Layer, (Receiver ID)
> > > [20389.985007] amdgpu 0000:0a:00.0:   device [1002:6995] error status=
/mask=3D000000c0/00002000
> > > [20389.985010] amdgpu 0000:0a:00.0:    [ 6] BadTLP
> > > [20389.985013] amdgpu 0000:0a:00.0:    [ 7] BadDLLP
> > >
> > > Directly followed by a waring:
> > >
> > > [81829.087101] ------------[ cut here ]------------
> > > [81829.087105] WARNING: CPU: 4 PID: 644 at drivers/gpu/drm/amd/amdgpu=
/../display/dc/clk_mgr/dce110/dce110_clk_mgr.c:140 dce110_fill_display_conf=
igs+0x4a/0x150 [amdgpu]
> > > [81829.087461] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd=
_seq(E) rfcomm(E) af_packet(E) ocrdma(E) ib_uverbs(E) ib_core(E) nft_fib_in=
et(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reje=
ct_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_ta=
bles(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E)=
 ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack=
(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) ip=
table_security(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E) ip6t=
able_filter(E) ip6_tables(E) iptable_filter(E) bpfilter(E) cmac(E) algif_ha=
sh(E) algif_skcipher(E) af_alg(E) bnep(E) dmi_sysfs(E) intel_rapl_msr(E) in=
tel_rapl_common(E) snd_hda_codec_realtek(E) eeepc_wmi(E) btusb(E) asus_wmi(=
E) kvm_amd(E) btrtl(E) snd_hda_codec_generic(E) nls_iso8859_1(E) battery(E)=
 uvcvideo(E) sparse_keymap(E) ledtrig_audio(E) btbcm(E) video(E) wmi_bmof(E=
)
> > > [81829.087502]  platform_profile(E) mxm_wmi(E) snd_hda_codec_hdmi(E) =
nls_cp437(E) videobuf2_vmalloc(E) btintel(E) asus_wmi_sensors(E) btmtk(E) v=
fat(E) snd_hda_intel(E) videobuf2_memops(E) videobuf2_v4l2(E) snd_intel_dsp=
cfg(E) bluetooth(E) kvm(E) videobuf2_common(E) fat(E) snd_usb_audio(E) snd_=
virtuoso(E) irqbypass(E) snd_usbmidi_lib(E) snd_hda_codec(E) snd_oxygen_lib=
(E) videodev(E) snd_hwdep(E) snd_mpu401_uart(E) mc(E) snd_hda_core(E) ecdh_=
generic(E) snd_rawmidi(E) snd_pcm(E) snd_seq_device(E) rfkill(E) pcspkr(E) =
i2c_piix4(E) efi_pstore(E) k10temp(E) snd_timer(E) ext4(E) igb(E) snd(E) dc=
a(E) soundcore(E) mbcache(E) be2net(E) jbd2(E) wmi(E) gpio_amdpt(E) gpio_ge=
neric(E) tiny_power_button(E) button(E) acpi_cpufreq(E) fuse(E) configfs(E)=
 ip_tables(E) x_tables(E) xfs(E) libcrc32c(E) dm_crypt(E) essiv(E) authenc(=
E) trusted(E) asn1_encoder(E) tee(E) hid_logitech_hidpp(E) hid_logitech_dj(=
E) hid_generic(E) usbhid(E) sr_mod(E) cdrom(E) uas(E) usb_storage(E) amdgpu=
(E)
> > > [81829.087551]  drm_ttm_helper(E) ttm(E) iommu_v2(E) gpu_sched(E) i2c=
_algo_bit(E) crct10dif_pclmul(E) drm_dp_helper(E) crc32_pclmul(E) crc32c_in=
tel(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_=
fops(E) drm(E) xhci_pci(E) cec(E) ghash_clmulni_intel(E) xhci_pci_renesas(E=
) aesni_intel(E) crypto_simd(E) cryptd(E) sp5100_tco(E) xhci_hcd(E) ccp(E) =
rc_core(E) nvme(E) usbcore(E) nvme_core(E) sg(E) br_netfilter(E) bridge(E) =
stp(E) llc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi=
_dh_alua(E) ledtrig_timer(E) msr(E) efivarfs(E)
> > > [81829.087581] CPU: 4 PID: 644 Comm: kworker/4:1H Tainted: G         =
   E     5.18.0-rc5-iommu-next+ #1 4d1b12f73ec264927e45e8f2e5d1c0c8e280bc7d
> > > [81829.087585] Hardware name: System manufacturer System Product Name=
/PRIME X470-PRO, BIOS 5406 11/13/2019
> > > [81829.087588] Workqueue: events_highpri dm_irq_work_func [amdgpu]
> > > [81829.087928] RIP: 0010:dce110_fill_display_configs+0x4a/0x150 [amdg=
pu]
> > > [81829.088274] Code: 31 ff 4d 8d 98 f0 01 00 00 49 8b 0c f8 4c 89 da =
31 c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 10 08 00 00 83 f8 06 75 =
e8 <0f> 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 00 48 8b 50 08 8b
> > > [81829.088277] RSP: 0018:ffffb891810c3be0 EFLAGS: 00010246
> > > [81829.088280] RAX: 0000000000000006 RBX: ffff9719a6b60000 RCX: ffff9=
71d08e07800
> > > [81829.088282] RDX: ffff9719a6b63250 RSI: ffff9719a6b72980 RDI: 00000=
00000000001
> > > [81829.088284] RBP: ffff971a812f0000 R08: ffff9719a6b60000 R09: 00000=
00000000000
> > > [81829.088286] R10: ffff9719a6b72980 R11: ffff9719a6b601f0 R12: ffff9=
719a6b72980
> > > [81829.088287] R13: ffff9719a6b60000 R14: 0000000000000006 R15: 00000=
00000003258
> > > [81829.088289] FS:  0000000000000000(0000) GS:ffff97285eb00000(0000) =
knlGS:0000000000000000
> > > [81829.088291] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [81829.088293] CR2: 00007fbc4800bb28 CR3: 00000002909c0000 CR4: 00000=
000003506e0
> > > [81829.088295] Call Trace:
> > > [81829.088298]  <TASK>
> > > [81829.088300]  dce11_pplib_apply_display_requirements+0x129/0x200 [a=
mdgpu 1a7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.088646]  dce112_update_clocks+0x8d/0xf0 [amdgpu 1a7cfa9f14a3ef=
2ba289fa21a3c241108d69cd98]
> > > [81829.088992]  dc_commit_updates_for_stream+0x1a91/0x1ef0 [amdgpu 1a=
7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.089330]  ? detect_link_and_local_sink+0x3b4/0xb40 [amdgpu 1a7c=
fa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.089665]  set_all_streams_dpms_off_for_link+0x10e/0x120 [amdgpu=
 1a7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.090002]  dc_link_detect+0x187/0x420 [amdgpu 1a7cfa9f14a3ef2ba2=
89fa21a3c241108d69cd98]
> > > [81829.090336]  handle_hpd_irq_helper+0xe9/0x190 [amdgpu 1a7cfa9f14a3=
ef2ba289fa21a3c241108d69cd98]
> > > [81829.090701]  process_one_work+0x217/0x3e0
> > > [81829.090707]  worker_thread+0x4d/0x3c0
> > > [81829.090712]  ? rescuer_thread+0x380/0x380
> > > [81829.090715]  kthread+0xd9/0x100
> > > [81829.090719]  ? kthread_complete_and_exit+0x20/0x20
> > > [81829.090722]  ret_from_fork+0x22/0x30
> > > [81829.090728]  </TASK>
> > > [81829.090729] ---[ end trace 0000000000000000 ]---
> > >
> > > And this NULL-ptr dereference:
> > >
> > > [81829.090732] BUG: kernel NULL pointer dereference, address: 0000000=
000000008
> > > [81829.090737] #PF: supervisor read access in kernel mode
> > > [81829.090741] #PF: error_code(0x0000) - not-present page
> > > [81829.090744] PGD 0 P4D 0
> > > [81829.090747] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > [81829.090751] CPU: 4 PID: 644 Comm: kworker/4:1H Tainted: G        W=
   E     5.18.0-rc5-iommu-next+ #1 4d1b12f73ec264927e45e8f2e5d1c0c8e280bc7d
> > > [81829.090756] Hardware name: System manufacturer System Product Name=
/PRIME X470-PRO, BIOS 5406 11/13/2019
> > > [81829.090758] Workqueue: events_highpri dm_irq_work_func [amdgpu]
> > > [81829.091111] RIP: 0010:dce110_fill_display_configs+0x5b/0x150 [amdg=
pu]
> > > [81829.091455] Code: c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 =
10 08 00 00 83 f8 06 75 e8 0f 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 =
00 <48> 8b 50 08 8b 9a 44 03 00 00 49 63 d1 41 83 c1 01 48 8d 14 92 49
> > > [81829.091458] RSP: 0018:ffffb891810c3be0 EFLAGS: 00010246
> > > [81829.091461] RAX: 0000000000000000 RBX: ffff9719a6b60000 RCX: ffff9=
71d08e07800
> > > [81829.091463] RDX: ffff9719a6b63250 RSI: ffff9719a6b72980 RDI: 00000=
00000000001
> > > [81829.091465] RBP: ffff971a812f0000 R08: ffff9719a6b60000 R09: 00000=
00000000000
> > > [81829.091467] R10: ffff9719a6b72980 R11: ffff9719a6b601f0 R12: ffff9=
719a6b72980
> > > [81829.091469] R13: ffff9719a6b60000 R14: 0000000000000006 R15: 00000=
00000003258
> > > [81829.091471] FS:  0000000000000000(0000) GS:ffff97285eb00000(0000) =
knlGS:0000000000000000
> > > [81829.091474] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [81829.091476] CR2: 0000000000000008 CR3: 00000002909c0000 CR4: 00000=
000003506e0
> > > [81829.091479] Call Trace:
> > > [81829.091480]  <TASK>
> > > [81829.091482]  dce11_pplib_apply_display_requirements+0x129/0x200 [a=
mdgpu 1a7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.091828]  dce112_update_clocks+0x8d/0xf0 [amdgpu 1a7cfa9f14a3ef=
2ba289fa21a3c241108d69cd98]
> > > [81829.092173]  dc_commit_updates_for_stream+0x1a91/0x1ef0 [amdgpu 1a=
7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.092509]  ? detect_link_and_local_sink+0x3b4/0xb40 [amdgpu 1a7c=
fa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.092844]  set_all_streams_dpms_off_for_link+0x10e/0x120 [amdgpu=
 1a7cfa9f14a3ef2ba289fa21a3c241108d69cd98]
> > > [81829.093180]  dc_link_detect+0x187/0x420 [amdgpu 1a7cfa9f14a3ef2ba2=
89fa21a3c241108d69cd98]
> > > [81829.093514]  handle_hpd_irq_helper+0xe9/0x190 [amdgpu 1a7cfa9f14a3=
ef2ba289fa21a3c241108d69cd98]
> > > [81829.093853]  process_one_work+0x217/0x3e0
> > > [81829.093858]  worker_thread+0x4d/0x3c0
> > > [81829.093861]  ? rescuer_thread+0x380/0x380
> > > [81829.093865]  kthread+0xd9/0x100
> > > [81829.093868]  ? kthread_complete_and_exit+0x20/0x20
> > > [81829.093872]  ret_from_fork+0x22/0x30
> > > [81829.093876]  </TASK>
> > > [81829.093878] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd=
_seq(E) rfcomm(E) af_packet(E) ocrdma(E) ib_uverbs(E) ib_core(E) nft_fib_in=
et(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reje=
ct_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_ta=
bles(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E)=
 ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack=
(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) ip=
table_security(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E) ip6t=
able_filter(E) ip6_tables(E) iptable_filter(E) bpfilter(E) cmac(E) algif_ha=
sh(E) algif_skcipher(E) af_alg(E) bnep(E) dmi_sysfs(E) intel_rapl_msr(E) in=
tel_rapl_common(E) snd_hda_codec_realtek(E) eeepc_wmi(E) btusb(E) asus_wmi(=
E) kvm_amd(E) btrtl(E) snd_hda_codec_generic(E) nls_iso8859_1(E) battery(E)=
 uvcvideo(E) sparse_keymap(E) ledtrig_audio(E) btbcm(E) video(E) wmi_bmof(E=
)
> > > [81829.093913]  platform_profile(E) mxm_wmi(E) snd_hda_codec_hdmi(E) =
nls_cp437(E) videobuf2_vmalloc(E) btintel(E) asus_wmi_sensors(E) btmtk(E) v=
fat(E) snd_hda_intel(E) videobuf2_memops(E) videobuf2_v4l2(E) snd_intel_dsp=
cfg(E) bluetooth(E) kvm(E) videobuf2_common(E) fat(E) snd_usb_audio(E) snd_=
virtuoso(E) irqbypass(E) snd_usbmidi_lib(E) snd_hda_codec(E) snd_oxygen_lib=
(E) videodev(E) snd_hwdep(E) snd_mpu401_uart(E) mc(E) snd_hda_core(E) ecdh_=
generic(E) snd_rawmidi(E) snd_pcm(E) snd_seq_device(E) rfkill(E) pcspkr(E) =
i2c_piix4(E) efi_pstore(E) k10temp(E) snd_timer(E) ext4(E) igb(E) snd(E) dc=
a(E) soundcore(E) mbcache(E) be2net(E) jbd2(E) wmi(E) gpio_amdpt(E) gpio_ge=
neric(E) tiny_power_button(E) button(E) acpi_cpufreq(E) fuse(E) configfs(E)=
 ip_tables(E) x_tables(E) xfs(E) libcrc32c(E) dm_crypt(E) essiv(E) authenc(=
E) trusted(E) asn1_encoder(E) tee(E) hid_logitech_hidpp(E) hid_logitech_dj(=
E) hid_generic(E) usbhid(E) sr_mod(E) cdrom(E) uas(E) usb_storage(E) amdgpu=
(E)
> > > [81829.093952]  drm_ttm_helper(E) ttm(E) iommu_v2(E) gpu_sched(E) i2c=
_algo_bit(E) crct10dif_pclmul(E) drm_dp_helper(E) crc32_pclmul(E) crc32c_in=
tel(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_=
fops(E) drm(E) xhci_pci(E) cec(E) ghash_clmulni_intel(E) xhci_pci_renesas(E=
) aesni_intel(E) crypto_simd(E) cryptd(E) sp5100_tco(E) xhci_hcd(E) ccp(E) =
rc_core(E) nvme(E) usbcore(E) nvme_core(E) sg(E) br_netfilter(E) bridge(E) =
stp(E) llc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi=
_dh_alua(E) ledtrig_timer(E) msr(E) efivarfs(E)
> > > [81829.093978] CR2: 0000000000000008
> > > [81829.093980] ---[ end trace 0000000000000000 ]---
> > > [81829.338958] RIP: 0010:dce110_fill_display_configs+0x5b/0x150 [amdg=
pu]
> > > [81829.339333] Code: c0 48 39 0a 0f 84 e4 00 00 00 83 c0 01 48 81 c2 =
10 08 00 00 83 f8 06 75 e8 0f 0b 31 c0 80 b9 48 03 00 00 00 0f 85 a9 00 00 =
00 <48> 8b 50 08 8b 9a 44 03 00 00 49 63 d1 41 83 c1 01 48 8d 14 92 49
> > > [81829.339336] RSP: 0018:ffffb891810c3be0 EFLAGS: 00010246
> > > [81829.339340] RAX: 0000000000000000 RBX: ffff9719a6b60000 RCX: ffff9=
71d08e07800
> > > [81829.339343] RDX: ffff9719a6b63250 RSI: ffff9719a6b72980 RDI: 00000=
00000000001
> > > [81829.339345] RBP: ffff971a812f0000 R08: ffff9719a6b60000 R09: 00000=
00000000000
> > > [81829.339347] R10: ffff9719a6b72980 R11: ffff9719a6b601f0 R12: ffff9=
719a6b72980
> > > [81829.339349] R13: ffff9719a6b60000 R14: 0000000000000006 R15: 00000=
00000003258
> > > [81829.339352] FS:  0000000000000000(0000) GS:ffff97285eb00000(0000) =
knlGS:0000000000000000
> > > [81829.339355] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [81829.339357] CR2: 0000000000000008 CR3: 00000002909c0000 CR4: 00000=
000003506e0
> > >
> > > Usually one of the displays does not power on anymore after this and =
the
> > > machine locks up pretty soon as well, probably because the worker thr=
ead
> > > is dead.
> > >
> > > My GPU device is:
> > >
> > > 0a:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/=
ATI] Lexa XT [Radeon PRO WX 2100] (prog-if 00 [VGA controller])
> > >         Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device 0b0c
> > >         Flags: bus master, fast devsel, latency 0, IRQ 90, IOMMU grou=
p 15
> > >         Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
> > >         Memory at f0000000 (64-bit, prefetchable) [size=3D2M]
> > >         I/O ports at e000 [size=3D256]
> > >         Memory at fce00000 (32-bit, non-prefetchable) [size=3D256K]
> > >         Expansion ROM at 000c0000 [disabled] [size=3D128K]
> > >         Capabilities: <access denied>
> > >         Kernel driver in use: amdgpu
> > >         Kernel modules: amdgpu
> > >
> > > Please let me know if anything else is needed to debug this. Bisectio=
n
> > > is not really feasible, because the issue happens at random, sometime=
s
> > > after one or two days of uptime.
> > >
> > > Regards,
> > >
> > > --
> > > J=C3=B6rg R=C3=B6del
> > > jroedel@suse.de
> > >
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5
> > > 90409 N=C3=BCrnberg
> > > Germany
> > >
> > > (HRB 36809, AG N=C3=BCrnberg)
> > > Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> > >
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5
> 90409 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
