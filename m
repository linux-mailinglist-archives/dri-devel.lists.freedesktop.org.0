Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943F9E8FBC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE41010E6B7;
	Mon,  9 Dec 2024 10:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=toralf.foerster@gmx.de header.b="Los3TLxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03410E6B7;
 Mon,  9 Dec 2024 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1733738908; x=1734343708; i=toralf.foerster@gmx.de;
 bh=++GSIVtMPvhelwP5xwNl0IfmdO/ctiFEal2GziBdmUc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Los3TLxqctonPt/IjJifsiy4ra63zkNqLlqov+AuWN9qcEizGpKraQXVIWk5ZVeC
 oUPYk79Rml85n4quPmjeKuYGVON1UdBhcjof20HaxOgabjga3OX5iilQ33oQtJSP/
 YKYsKQc6R4f8J3eWSKJt1a64orYPm/zPGhAeRfXH9COBWsp1YVAl+8Jd1s1LeV9lV
 tp8LM3CxhmR1U3rG7Th/a+Y+eeAEUlXjX4b98VEsb24rAtCsjw3GsO4ISAggxaIV/
 woSALVUMmLJvBDng58RVZNwkbifrMrveCD+Ttwyv8wrqaIpt5CT276ktJwW727bBy
 fZ7L0CNkJIisVgvc0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.33] ([77.8.121.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1tzlKb3RIA-00bRw2; Mon, 09
 Dec 2024 11:08:27 +0100
Message-ID: <b77c293a-8418-437c-b879-7d292d96f2cc@gmx.de>
Date: Mon, 9 Dec 2024 11:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.6.57 has a new WARNING:
 amdgpu/../display/dc/dcn30/dcn30_dpp.c:501 dpp3_deferred_update+0x106/0x330
 [amdgpu
From: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel
 <dri-devel@lists.freedesktop.org>, airlied@gmail.com
References: <b110ad59-f503-492d-9758-1634c1277b5d@gmx.de>
Content-Language: en-US
Autocrypt: addr=toralf.foerster@gmx.de; keydata=
 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
In-Reply-To: <b110ad59-f503-492d-9758-1634c1277b5d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qPBSZ9kU9yi3FNk66Rpoj3F10Z9DR9Pu6clIiJcJeZwFB+W5C5r
 67whLsoMOpzFT972xA6UchezNDCqXYVHlHphd6fb8NfDx0BQaytVywgbNaWx+mXASNsnc+6
 FnIwFT/WPd8S6MqpNXPDXtRd8WOJzcJIWKMZjuc8J1VEf0vcfGcHLvcMecJS2ftaxSkeotb
 XRJcV9LGWw+7z57gDjCHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wOIRnsUMyUc=;eCbegi37DDA93hhqwbZlbiHFgU8
 YxOvRGZmp0kXqzBNAQXx42AIk+7rwtEdMAmQMA/gbTU1iJpvUhxOV1dsLR7BHZGUQ9/Q2nkmz
 vPCdCVO9Nbitv7AMhdnoJQSrZxPiHMRxjdS3DAuAffYrZ+BlW1TaPxhruPaQiEgxCSdpNGkjp
 7yiwDqD9kYNlajcI8F/MwC2q17AEYeDUNak5CGAey6xX78xauAtfvW2MMdOKLUaghT/vhaXTG
 0UL+ZK5AKWff7eVb878v5BaCjhfzJnhRG2AIgZdygY9Vpx83degifmX8nv/eUXKA2ZzKsOC5J
 huCFvjNCRB+IreAoiMVM/w43uor0GWLqqNVUc+KQDo7nnDZ5a6Ld/yQf8EN4aRlC6qQAQ/eYh
 g+rsqGfvTT6EtCJmkAARRmDGIuavavwL77LQqN1/7KIB8jeH0hDhrBn+6jISJ1DAC3d1dfH8S
 m5n4xy3Hch6wHymsINj5cxRtqdGqPr/9sLWwFY5QEh/H4p5mdyPqLD1Vii3bby+rXw1nu+W+8
 l6YOD/yiVxH5IPtqSwAxWodLKFQ+x/kuwzb/kheQUEX4tAGx9Lpay7qQYnQ/gy58fzEep6VMu
 A3Qql9vQ8jTow5nrtX+84jU4dps5twdnkdnl/pmWJjQtreRvyU1TyKjLPgis0iFEL77Drsafm
 MfaTv8KxzU7hLAEO9vQh7Lz8SVuxxJ83YITH34Psn5ctYgaGP5MfSeEs3wXz7Oglzu5iRfQWF
 iCj7nGarlxNKG+grS+VpufFKExEIXM7oq9ehM6MJRK++mS3XvC2jStyFOR64whiT9T1IU7PdJ
 OOx90QAPtmf4GRKjAsjbmxjjSwjjllaZtql8uhD+2fGHDBhraW2QQii+wTgGw/wNyiduKf5NY
 dtXB7cqlS0sGelwTCVNJKyYFBBHtxUI8a3kAi1kYQ6CZXksyfpuWSH2Gvbxfu/4vaBuvkq7YL
 lCfVwPSdf6HeO0pGfnYx7yX/iOFG7dw6vP2dHvi4tk/howZR7cXtCXm8ikw9z6tS6CCMoKNW0
 ahU8ojSV4dCc+wwuJ7eJVkFkrHLodptYy9NOW+RBU+yUPN7o6s2Tt65Vz8ffLM3Onw6YihlHb
 xXBx4oNE9gnuGrskL+KJI4dwz7E+mF
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

Since 6.6.57 there'se a new warning here which is still in 6.6.64.

Is this a known issue?


On 10/17/24 17:05, Toralf F=C3=B6rster wrote:
> [=C2=A0=C2=A0 22.120385] ------------[ cut here ]------------
> [=C2=A0=C2=A0 22.120389] WARNING: CPU: 13 PID: 11 at drivers/gpu/drm/amd=
/
> amdgpu/../display/dc/dcn30/dcn30_dpp.c:501
> dpp3_deferred_update+0x106/0x330 [amdgpu]
> [=C2=A0=C2=A0 22.120484] Modules linked in: fuse michael_mic hid_jabra
> ip6table_filter ip6_tables xt_LOG nf_log_syslog xt_recent xt_multiport
> xt_limit xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> iptable_filter xt_comment ip_tables 8021q r8153_ecm cdc_ether usbnet
> r8152 mii hid_logitech_hidpp snd_usb_audio snd_usbmidi_lib snd_rawmidi
> bnep hid_logitech_dj btusb qrtr_mhi btrtl btintel btbcm btmtk bluetooth
> ecdh_generic dm_crypt trusted asn1_encoder uvcvideo videobuf2_vmalloc
> videobuf2_memops uvc videobuf2_v4l2 videodev videobuf2_common mc qrtr
> ath11k_pci mhi snd_ctl_led ath11k amdgpu snd_hda_codec_realtek
> qmi_helpers snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel
> i2c_algo_bit snd_intel_dspcfg drm_ttm_helper ttm hid_multitouch
> snd_hda_codec agpgart drm_exec intel_rapl_msr hid_generic
> drm_suballoc_helper snd_hwdep amdxcp think_lmi mac80211 wmi_bmof
> firmware_attributes_class drm_buddy snd_hda_core libarc4 thinkpad_acpi
> snd_pcm gpu_sched snd_pci_acp5x ledtrig_audio drm_display_helper
> snd_timer platform_profile
> [=C2=A0=C2=A0 22.120565]=C2=A0 snd_rn_pci_acp3x cfg80211 intel_rapl_comm=
on
> snd_acp_config drm_kms_helper snd xhci_pci edac_mce_amd sp5100_tco video
> snd_soc_acpi xhci_pci_renesas kvm_amd kvm irqbypass crct10dif_pclmul
> crc32_pclmul crc32c_intel ghash_clmulni_intel rapl serio_raw ucsi_acpi
> cec rfkill r8169 i2c_piix4 xhci_hcd ccp soundcore k10temp typec_ucsi
> i2c_hid_acpi snd_pci_acp3x i2c_hid roles typec drm wmi amd_pmc acpi_tad
> [=C2=A0=C2=A0 22.120606] CPU: 13 PID: 11 Comm: kworker/u32:0 Tainted: G =
=C2=A0=C2=A0=C2=A0 T
> 6.6.57 #12
> [=C2=A0=C2=A0 22.120609] Hardware name: LENOVO 21J5002FGE/21J5002FGE, BI=
OS
> R23ET60W (1.30 ) 09/14/2022
> [=C2=A0=C2=A0 22.120611] Workqueue: events_unbound commit_work [drm_kms_=
helper]
> [=C2=A0=C2=A0 22.120628] RIP: 0010:dpp3_deferred_update+0x106/0x330 [amd=
gpu]
> [=C2=A0=C2=A0 22.120709] Code: 83 78 e1 00 00 0f b6 90 a7 02 00 00 48 8b=
 83 70 e1
> 00 00 8b b0 78 04 00 00 e8 f6 9e 09 00 8b 74 24 04 85 f6 0f 84 5d 01 00
> 00 <0f> 0b 0f b6 83 48 96 00 00 83 e0 f7 88 83 48 96 00 00 a8 01 0f 84
> [=C2=A0=C2=A0 22.120712] RSP: 0018:ffffc900000f7b88 EFLAGS: 00010202
> [=C2=A0=C2=A0 22.120714] RAX: 0000000000000066 RBX: ffff888113e60000 RCX=
:
> 0000000000000000
> [=C2=A0=C2=A0 22.120716] RDX: 0000000000000000 RSI: 0000000000000002 RDI=
:
> 0000000000000000
> [=C2=A0=C2=A0 22.120717] RBP: 0000000000000000 R08: 0000000000000000 R09=
:
> 0000000000000000
> [=C2=A0=C2=A0 22.120719] R10: 0000000000000000 R11: 0000000000000000 R12=
:
> ffff88813e100000
> [=C2=A0=C2=A0 22.120720] R13: ffff88813e102608 R14: ffff88813e1037e8 R15=
:
> ffff8881050be800
> [=C2=A0=C2=A0 22.120722] FS:=C2=A0 0000000000000000(0000) GS:ffff88881ee=
80000(0000)
> knlGS:0000000000000000
> [=C2=A0=C2=A0 22.120723] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
> [=C2=A0=C2=A0 22.120725] CR2: 000055d896379fe0 CR3: 0000000017216000 CR4=
:
> 0000000000f50ee0
> [=C2=A0=C2=A0 22.120727] PKRU: 55555554
> [=C2=A0=C2=A0 22.120728] Call Trace:
> [=C2=A0=C2=A0 22.120731]=C2=A0 <TASK>
> [=C2=A0=C2=A0 22.120733]=C2=A0 ? __warn+0x6f/0xd0
> [=C2=A0=C2=A0 22.120739]=C2=A0 ? dpp3_deferred_update+0x106/0x330 [amdgp=
u]
> [=C2=A0=C2=A0 22.120820]=C2=A0 ? report_bug+0x148/0x190
> [=C2=A0=C2=A0 22.120825]=C2=A0 ? handle_bug+0x40/0x80
> [=C2=A0=C2=A0 22.120828]=C2=A0 ? exc_invalid_op+0x17/0x80
> [=C2=A0=C2=A0 22.120830]=C2=A0 ? asm_exc_invalid_op+0x1a/0x20
> [=C2=A0=C2=A0 22.120835]=C2=A0 ? dpp3_deferred_update+0x106/0x330 [amdgp=
u]
> [=C2=A0=C2=A0 22.120907]=C2=A0 ? dpp3_deferred_update+0xfa/0x330 [amdgpu=
]
> [=C2=A0=C2=A0 22.120988]=C2=A0 dc_post_update_surfaces_to_stream+0x196/0=
x1e0 [amdgpu]
> [=C2=A0=C2=A0 22.121070]=C2=A0 amdgpu_dm_atomic_commit_tail+0x2a25/0x395=
0 [amdgpu]
> [=C2=A0=C2=A0 22.121166]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
> [=C2=A0=C2=A0 22.121169]=C2=A0 ? newidle_balance+0x335/0x3f0
> [=C2=A0=C2=A0 22.121173]=C2=A0 ? finish_task_switch.isra.0+0x30/0x280
> [=C2=A0=C2=A0 22.121179]=C2=A0 commit_tail+0x8f/0x130 [drm_kms_helper]
> [=C2=A0=C2=A0 22.121189]=C2=A0 process_one_work+0x17c/0x2a0
> [=C2=A0=C2=A0 22.121192]=C2=A0 worker_thread+0x318/0x460
> [=C2=A0=C2=A0 22.121195]=C2=A0 ? rescuer_thread+0x5f0/0x5f0
> [=C2=A0=C2=A0 22.121196]=C2=A0 kthread+0xcb/0xf0
> [=C2=A0=C2=A0 22.121200]=C2=A0 ? kthread_complete_and_exit+0x20/0x20
> [=C2=A0=C2=A0 22.121202]=C2=A0 ret_from_fork+0x2f/0x50
> [=C2=A0=C2=A0 22.121206]=C2=A0 ? kthread_complete_and_exit+0x20/0x20
> [=C2=A0=C2=A0 22.121208]=C2=A0 ret_from_fork_asm+0x11/0x20
> [=C2=A0=C2=A0 22.121212]=C2=A0 </TASK>
> [=C2=A0=C2=A0 22.121215] ---[ end trace 0000000000000000 ]---
>
>


=2D-
Toralf
