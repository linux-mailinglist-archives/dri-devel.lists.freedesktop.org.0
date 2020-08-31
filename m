Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13A257AD7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E70E8926D;
	Mon, 31 Aug 2020 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAE98926D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:51:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so5470996wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzcuoJEBLSuAbTWH2cuEIGBvVYMyarqdTQkY3sJNbmI=;
 b=q+iGGx20gdlLsCW7L0+YsjUXY+pBT8KGxp71rs0hy90whrodUxlQeaO8RncKZjaxz6
 dOrmfYu4D2maYjrvj+CENJ13iZSpsErI3DjKNZ8Px6VYZsawi8fGQIOx4lSlPjk9v/kX
 NnTma3oiJattIILsOsleOoLfD2HXJwjM8NY/Q82E29v1u0AXrChrfQv1PMw+5CJOYwY2
 dTqSOer5kL5LbKipVyrH5p9sMseMbQgMgKppC7oX2J623eviMQnTjd32lWgvuNHpRlGo
 jwWzSmxlwIHoDTr0MaW6PKtroV4X1Oy4uUMDE5qWpzVVCTHdsLA1UuQdMOOlDUe3InrP
 3/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzcuoJEBLSuAbTWH2cuEIGBvVYMyarqdTQkY3sJNbmI=;
 b=dlcJ3UdGkdzJSddJ0v9roX/Suz63JLY6b0JVFXh7D8Rk7vxF+7fl2X497sQkrG57Au
 QFPNgQC7kvUxeAOye0xgurfB/mdeMFOevPCL+WAYtaMIaajQbW3Zpa9ZB7kb+EkNbuyT
 91R7Y2F9QpNGQIM2cyxJK/nxMgObo+vHgFjmd9692FQRJ4G+kbrSeixat/1XU5kc1g/c
 ft9KSLu3vXgCkhOxAWxYyFf/2MHRfoN+wl6q1NfWAwCuyEKymBvVdiAiycATN3TaRzOG
 2o24eVyN2NH73pGPKJprobR5TgIPnGmPP/ciJ8sOMEDGf3svIgzEl1cMAqG8XWwLEwjr
 NFYA==
X-Gm-Message-State: AOAM530XxBoTdBprJ6TW85UawgDc+CgYdJZbLqizC/Y7PoRHeTRGmWnD
 DvqWH8gAxDCzNFEL8ksxNTZpF2RmT6PaElMaaMU=
X-Google-Smtp-Source: ABdhPJxRmRIxG1rte3wqDeWND6kgMsP/PFAaOkB22xNDZekBQKi6Zu5Gy0T6dmmUJHul2PLl4beWUOeN88cJ0/7Qi/o=
X-Received: by 2002:a1c:a953:: with SMTP id s80mr1467690wme.70.1598881870206; 
 Mon, 31 Aug 2020 06:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <b8c5d0ef-5511-2473-ee46-93c74112d135@jaftan.com.au>
 <6c21c5c3-cb9f-7f20-96c5-35e48ad808da@jaftan.com.au>
In-Reply-To: <6c21c5c3-cb9f-7f20-96c5-35e48ad808da@jaftan.com.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Aug 2020 09:50:59 -0400
Message-ID: <CADnq5_NzX1hPkiKhNQs4b=VeQRgxowBQVKy4ok2wKccFFL+4dw@mail.gmail.com>
Subject: Re: Call traces triggered by starting X on 5.8.x kernels - Radeon
 RX580
To: Adam <adam@jaftan.com.au>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 5:21 AM Adam <adam@jaftan.com.au> wrote:
>
>
> Hi All,
>
> I hope this is useful. Let me know if you would like me to test anything.
>
> Cheers,
>
> Adam
>
>
> [2.] Full description of the problem/report:
>
> X works but, 6 warnings triggered, in;
> drivers/gpu/drm/drm_modeset_lock.c:185
> drivers/gpu/drm/drm_crtc_helper.c:148
> drivers/gpu/drm/drm_crtc_helper.c:108
>
> First one here, refer to dmesg-out.txt in tarball for the rest;

Fixed with this patch:
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=77ef38574beb3e0b414db48e9c0f04633df68ba6
On it's way to stable as well.

Alex

>
> [   28.223717] ------------[ cut here ]------------
> [   28.223722] WARNING: CPU: 15 PID: 844 at
> drivers/gpu/drm/drm_modeset_lock.c:185
> drm_warn_on_modeset_not_all_locked.part.0+0x67/0x70
> [   28.223723] Modules linked in: igb uvcvideo snd_usb_audio
> videobuf2_vmalloc videobuf2_memops snd_usbmidi_lib videobuf2_v4l2
> snd_rawmidi videobuf2_common snd_seq_device snd_hda_codec_realtek
> kvm_amd snd_hda_codec_generic kvm irqbypass snd_hda_codec_hdmi
> aesni_intel glue_helper crypto_simd snd_hda_intel cryptd
> snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer
> pinctrl_amd sch_fq_codel efivarfs
> [   28.223734] CPU: 15 PID: 844 Comm: X Tainted: G T 5.8.4-gentoo #1
> [   28.223735] Hardware name: Micro-Star International Co., Ltd.
> MS-7C37/X570-A PRO (MS-7C37), BIOS H.70 01/09/2020
> [   28.223736] RIP: 0010:drm_warn_on_modeset_not_all_locked.part.0+0x67/0x70
> [   28.223737] Code: 01 00 00 e8 0b c5 9d ff 84 c0 74 1a 49 8d bc 24 98
> 01 00 00 e8 fa c4 9d ff 84 c0 74 0d 5b 5d 41 5c c3 0f 0b eb c8 0f 0b eb
> e2 <0f> 0b 5b 5d 41 5c c3 66 90 8b 05 f2 c2 ad 01 85 c0 75 02 eb 84 c3
> [   28.223738] RSP: 0018:ffffae22c1217a50 EFLAGS: 00010246
> [   28.223739] RAX: 0000000000000000 RBX: ffff92f1f2370af8 RCX:
> 0000000000000000
> [   28.223739] RDX: 0000000000000000 RSI: ffff92f1f1dce8a0 RDI:
> ffff92f1f2370998
> [   28.223740] RBP: ffff92f1f2370b08 R08: ffff92f1f16c9d48 R09:
> ffff92f1f1f85848
> [   28.223740] R10: 0000000000000000 R11: 0000000000000000 R12:
> ffff92f1f2370800
> [   28.223741] R13: 0000000000000002 R14: ffff92f1f2370800 R15:
> ffff92f1f1dce800
> [   28.223742] FS:  000077e6a3f76dc0(0000) GS:ffff92f1febc0000(0000)
> knlGS:0000000000000000
> [   28.223742] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   28.223743] CR2: 0000644699c64018 CR3: 00000007dcb9e000 CR4:
> 0000000000340ee0
> [   28.223743] Call Trace:
> [   28.223745]  drm_crtc_helper_set_mode+0x73/0x4b0
> [   28.223748]  ? __blk_mq_try_issue_directly+0xfd/0x250
> [   28.223750]  ? update_load_avg+0x71/0x5a0
> [   28.223751]  ? newidle_balance.constprop.0+0x1eb/0x340
> [   28.223752]  ? psi_group_change+0x3a/0x1d0
> [   28.223754]  ? kernel_init_free_pages+0x40/0x50
> [   28.223754]  ? prep_new_page+0xa3/0xb0
> [   28.223755]  ? get_page_from_freelist+0x1125/0x1a60
> [   28.223757]  amdgpu_connector_set_property+0x2a8/0x630
> [   28.223758]  drm_connector_set_obj_prop+0x39/0x80
> [   28.223759]  drm_mode_obj_set_property_ioctl+0x291/0x320
> [   28.223760]  ? drm_connector_set_obj_prop+0x80/0x80
> [   28.223761]  drm_connector_property_set_ioctl+0x34/0x50
> [   28.223763]  drm_ioctl_kernel+0xa3/0xf0
> [   28.223764]  drm_ioctl+0x1f9/0x36f
> [   28.223764]  ? drm_connector_set_obj_prop+0x80/0x80
> [   28.223766]  ? handle_mm_fault+0xd65/0x1680
> [   28.223767]  amdgpu_drm_ioctl+0x41/0x70
> [   28.223769]  ksys_ioctl+0x88/0xc0
> [   28.223769]  __x64_sys_ioctl+0x11/0x20
> [   28.223771]  do_syscall_64+0x3e/0x70
> [   28.223772]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   28.223773] RIP: 0033:0x77e6a446d747
> [   28.223774] Code: 1f 40 00 48 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72
> b1 e8 0c ff ff ff 85 c0 78 b6 5b 4c 89 e0 5d 41 5c c3 b8 10 00 00 00 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e9 76 0c 00 f7 d8 64 89 01 48
> [   28.223775] RSP: 002b:00007ffe15738858 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [   28.223776] RAX: ffffffffffffffda RBX: 00007ffe15738890 RCX:
> 000077e6a446d747
> [   28.223776] RDX: 00007ffe15738890 RSI: 00000000c01064ab RDI:
> 000000000000000b
> [   28.223777] RBP: 00000000c01064ab R08: 0000644699c61e90 R09:
> 0000000000000001
> [   28.223777] R10: 000077e6a4535a60 R11: 0000000000000246 R12:
> 00006446996915b0
> [   28.223778] R13: 000000000000000b R14: 0000644699c63c10 R15:
> 0000000000000002
> [   28.223778] ---[ end trace b571c596e5f7bd31 ]---
>
>
> [3.] Keywords (i.e., modules, networking, kernel):
> [4.] Kernel information
> [4.1.] Kernel version (from /proc/version):
>
> Linux version 5.8.4-gentoo (root@zen) (gcc (Gentoo 10.2.0-r1 p2) 10.2.0,
> GNU ld (Gentoo 2.34 p6) 2.34.0) #1 SMP Thu Aug 27 11:20:43 AEST 2020
>
> Pretty sure it started in 5.8.0.
>
>
> [4.2.] Kernel .config file:
>
> In tarball
>
> [5.] Most recent kernel version which did not have the bug:
>
> Likely 5.7.x, however, it is possible that I missed it in other versions
> since X still runs.
>
> [6.] Output of Oops.. message (if applicable) with symbolic information
>       resolved (see Documentation/admin-guide/bug-hunting.rst)
>
> full dmesg included in tarball
>
> [7.] A small shell script or example program which triggers the
>
> startx triggers it
>
> [8.] Environment
> [8.1.] Software (add the output of the ver_linux script here)
>
> Linux zen 5.8.4-gentoo #1 SMP Thu Aug 27 11:20:43 AEST 2020 x86_64 AMD
> Ryzen 9 3900X 12-Core Processor AuthenticAMD GNU/Linux
>
> GNU C                   10.2.0
> GNU Make                4.3
> Binutils                2.34
> Util-linux              2.36
> Mount                   2.36
> Module-init-tools       27
> E2fsprogs               1.45.6
> Xfsprogs                5.7.0
> PPP                     2.4.8
> Nfs-utils               2.5.1
> Bison                   3.7.1
> Flex                    2.6.4
> Linux C++ Library       6.0.28
> Linux C Library         2.32
> Dynamic linker (ldd)    2.32
> Procps                  3.3.16
> Net-tools               2.10
> Kbd                     2.3.0
> Console-tools           2.3.0
> Sh-utils                8.32
> Udev                    246
> Modules Loaded          aesni_intel cfg80211 cryptd crypto_simd efivarfs
> glue_helper igb irqbypass kvm kvm_amd pinctrl_amd rfkill sch_fq_codel
> snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi
> snd_hda_codec_realtek snd_hda_core snd_hda_intel snd_hwdep
> snd_intel_dspcfg snd_pcm snd_rawmidi snd_seq_device snd_timer
> snd_usb_audio snd_usbmidi_lib uvcvideo videobuf2_common videobuf2_memops
> videobuf2_v4l2 videobuf2_vmalloc
>
>
> [8.2.] Processor information (from /proc/cpuinfo):
>
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 23
> model           : 113
> model name      : AMD Ryzen 9 3900X 12-Core Processor
> stepping        : 0
> microcode       : 0x8701013
> cpu MHz         : 2201.417
> cache size      : 512 KB
> physical id     : 0
> siblings        : 24
> core id         : 0
> cpu cores       : 12
> apicid          : 0
> initial apicid  : 0
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 16
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
> fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid
> extd_apicid aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1
> sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm
> extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit
> wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb
> cat_l3 cdp_l3 hw_pstate sme ssbd mba sev ibpb stibp vmmcall fsgsbase
> bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni
> xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total
> cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd arat npt lbrv
> svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists
> pausefilter pfthreshold avic v_vmsave_vmload vgif umip rdpid
> overflow_recov succor smca
> bugs            : sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass
> bogomips        : 7599.73
> TLB size        : 3072 4K pages
> clflush size    : 64
> cache_alignment : 64
> address sizes   : 43 bits physical, 48 bits virtual
> power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]
>
>
> [8.3.] Module information (from /proc/modules):
>
> cfg80211 753664 0 - Live 0xffffffffc0523000
> rfkill 24576 4 cfg80211, Live 0xffffffffc02f2000
> igb 204800 0 - Live 0xffffffffc0439000
> uvcvideo 106496 0 - Live 0xffffffffc041e000
> snd_usb_audio 249856 1 - Live 0xffffffffc061d000
> videobuf2_vmalloc 16384 1 uvcvideo, Live 0xffffffffc03f9000
> videobuf2_memops 16384 1 videobuf2_vmalloc, Live 0xffffffffc03f4000
> snd_usbmidi_lib 28672 1 snd_usb_audio, Live 0xffffffffc037b000
> videobuf2_v4l2 24576 1 uvcvideo, Live 0xffffffffc0314000
> snd_rawmidi 32768 1 snd_usbmidi_lib, Live 0xffffffffc0306000
> videobuf2_common 49152 2 uvcvideo,videobuf2_v4l2, Live 0xffffffffc03e7000
> snd_seq_device 16384 1 snd_rawmidi, Live 0xffffffffc02d3000
> snd_hda_codec_realtek 110592 1 - Live 0xffffffffc0b89000
> kvm_amd 94208 0 - Live 0xffffffffc0adf000
> snd_hda_codec_generic 81920 1 snd_hda_codec_realtek, Live 0xffffffffc0366000
> kvm 708608 1 kvm_amd, Live 0xffffffffc0475000
> irqbypass 16384 1 kvm, Live 0xffffffffc0301000
> snd_hda_codec_hdmi 57344 1 - Live 0xffffffffc0b0f000
> aesni_intel 372736 0 - Live 0xffffffffc038b000
> glue_helper 16384 1 aesni_intel, Live 0xffffffffc0386000
> crypto_simd 16384 1 aesni_intel, Live 0xffffffffc0470000
> snd_hda_intel 40960 3 - Live 0xffffffffc03ff000
> cryptd 20480 1 crypto_simd, Live 0xffffffffc031b000
> snd_intel_dspcfg 16384 1 snd_hda_intel, Live 0xffffffffc030f000
> snd_hda_codec 114688 4
> snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,
> Live 0xffffffffc0349000
> snd_hwdep 16384 2 snd_usb_audio,snd_hda_codec, Live 0xffffffffc0340000
> snd_hda_core 73728 5
> snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,
> Live 0xffffffffc0322000
> snd_pcm 102400 5
> snd_usb_audio,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core,
> Live 0xffffffffc02d8000
> snd_timer 32768 1 snd_pcm, Live 0xffffffffc02ca000
> pinctrl_amd 24576 0 - Live 0xffffffffc02c3000
> sch_fq_codel 20480 17 - Live 0xffffffffc02bd000
> efivarfs 16384 1 - Live 0xffffffffc02b8000
>
> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
>
> In tarball
>
> [8.5.] PCI information ('lspci -vvv' as root)
>
> In tarball
>
> [8.6.] SCSI information (from /proc/scsi/scsi)
> [8.7.] Other information that might be relevant to the problem
>         (please look in /proc and include all information that you
>         think to be relevant):
> [X.] Other notes, patches, fixes, workarounds:
>
> I included the xorg log but it doesnt appear interesting. Same issue
> with both 1.20.8 and 1.20.9
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
