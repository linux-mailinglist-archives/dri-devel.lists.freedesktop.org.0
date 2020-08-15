Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA0245D45
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BAC89D49;
	Mon, 17 Aug 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at gabe;
 Sat, 15 Aug 2020 16:30:12 UTC
Received: from a2i720.smtp2go.com (a2i720.smtp2go.com [103.47.206.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50A06E3BC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpservice.net; s=m6sda0.a1-4.dyn; x=1597509912; h=Feedback-ID:
 X-Smtpcorp-Track:Date:Message-ID:Subject:From:To:Reply-To:Sender:
 List-Unsubscribe; bh=sorf0+AlvN1Gt9wpvhYO5tH4pBasACXMsLpxQa18XII=; b=Oa90K+HK
 zTbLawkUjmx07IgDX4Asu9WoBP7vIyOY19RD1kR9Dna7qXMMxzJabTKxTONomP43+n/Mn5LZzrZCo
 eAc9zBXdkWN6BxPCuKxyI7t1KDE2e9ibUM4fb3tgGOCkAXdDjg4cmfbz8w/anInYSojxKpKMlOpyF
 0xnBkGYDVLlzlHGOyUVkL9MDPl1BTV6QBB6h4br2ZrMnn0ihF8pKUDBgduhoNg6KGI8mTGKfJTRWA
 caHcDrB19chtvyF61GHHMH27sivySNnQ1kx6rbVoRjHFPhHfWwhA/054EWlDQs5ZYRCSQBGf52R6O
 qhVFbr7dTWiQIAl3obaf769w5g==;
Received: from [10.45.79.71] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1k6yyB-ED4zTQ-KS
 for dri-devel@lists.freedesktop.org; Sat, 15 Aug 2020 16:23:47 +0000
Received: from [10.162.83.196] (helo=mail.blazebox.homeip.net)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1k6yyA-DuugnU-Hh
 for dri-devel@lists.freedesktop.org; Sat, 15 Aug 2020 16:23:46 +0000
Received: from blazebox.homeip.net (localhost [127.0.0.1])
 by mail.blazebox.homeip.net (Postfix) with ESMTP id 4AB7B64423A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 12:23:44 -0400 (EDT)
X-Virus-Scanned: amavisd-new at blazebox.homeip.net
Received: from mail.blazebox.homeip.net ([127.0.0.1])
 by blazebox.homeip.net (mail.blazebox.homeip.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with LMTP id yf5OgbbTskvM for <dri-devel@lists.freedesktop.org>;
 Sat, 15 Aug 2020 12:23:40 -0400 (EDT)
Received: from [IPv6:2001:470:1f07:a3a::24] (blaze.blazebox.homeip.net
 [IPv6:2001:470:1f07:a3a::24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.blazebox.homeip.net (Postfix) with ESMTPSA id 56CFF644238
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 12:23:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blazebox.homeip.net;
 s=mail; t=1597508620;
 bh=sorf0+AlvN1Gt9wpvhYO5tH4pBasACXMsLpxQa18XII=;
 h=To:From:Subject:Date;
 b=xtacr5FMX5vueAt2Uw9ik4TYdwMsxuF+aa8LXbg/YagK6MYLxSgsHTdvF4VU5r/bP
 cz6bB8FSH5XaZ0jIlXuGYfin5oioyIY0T526KLS+dooimCC+LCLYi6P/sCKQBOMYVQ
 DVPZNdD3rZnglGAuzsBDBlbi8MB8IG5GzM3iKR10UD6vZENpIun+v9x3uvlXUbda+p
 kOoYrbVvKR4GWeUKMMU6medlLyUwoJA02mYJcnXxlphGzPJV8ssP0O//KouWjI639L
 hyLyteKlPszJdvKFokBvzctE8lpUhFTKyNCNHhIItSMvS85uAS3+aikyxJF9D1G63g
 nnfyttmAijjCg==
To: dri-devel@lists.freedesktop.org
From: Paul Blazejowski <paulb@blazebox.homeip.net>
Subject: drm modeset bugs
Autocrypt: addr=paulb@blazebox.homeip.net; prefer-encrypt=mutual; keydata=
 mQGiBEHIcSARBACppxS/Z8rEhKfsuYzIiwiiwH9q45OYqBTYQ1ODkTsGDk4UxD5yZysFTIuW
 2S3Sn+e1EckzI7Ks3hcw5Li2I2ujImovtFRXWRQlbndptKXllmxoCBHTwDX+wdvefR4d51N4
 KCxEAJCc84udtbEW7MorND/7hRUr1DlChV0sdGrDAwCgoqohbRpJSPT72H/DX/LUkrz27pUD
 /R8S2eUoaVhM3xEPVw+mZmjvrQpC1Ks6nyehIrQ3JmrTPD4X8TXWxEd6ZvxADkSFFrIaQh1H
 nEJSw1ZN31peicsi9WKSclsiY1qkGDvYrg1fEMJawpMqarcuYpBKEUXmHOMuAjGJyYImnhQc
 xzpDQcq0/HfBZTIDpETaWwyCKu+QBACSt/DCOLDB1/rfYQsezQU9PpF7nS+24D2ZMsB9RBXB
 xaEPQS/YzH8+ZFmlyNQ16VGWUOBkVC0+ZEkiDg3lOFTwpWzI82ZMuAYDl6VH6GKxfKYUW0K8
 JsMDYdkFzR77sVYulPbNnTofKvuDLYjQaS0a0QeBjrz6X+ynNDCtBtxomLQ1UGF1bCBCbGF6
 ZWpvd3NraSAoRGlmZmllKSA8cGF1bGJAYmxhemVib3guaG9tZWlwLm5ldD6IfgQTEQIAPgIb
 AwYLCQgHAwIDFQIDAxYCAQIeAQIXgAIZARYhBKazQONwZ4ALgSvlbMLuTZodz7IjBQJeZ/vq
 BQke1i1jAAoJEMLuTZodz7IjYAMAn2bD1TpGHT1FEfBKTcaaNr4njsjtAJ4rlAfjOhof09iS
 QaBQRi8chFEUt7kCDQRByHEjEAgAoR2oPZkLHDuYieLWce7+x2EN5q/LfOphxEkYDimz4apf
 hjEFZLQVG3jSA0kuYHWvdhn5JnIvpD131XDQ2rL+jXca2ilVoqmlSQbcVCf1jjFSvGR5pfik
 EljQqS7QGwJ75otZYHxOdcStdbY0lmd3qQx3ONd8hiJ43+/vlmCD9icLj39fYr7GpE1Kx6wa
 Gud8ViSC4aCoO361fjLvF6y7ikKPOeiIqcEMcalmZo6QH5PXEFx/lt3tbmpPZ7BOq0PqJxlt
 96uVs9SiWtOMlwtxyz3RuDOUwQyIW6g7zMgcaS3f+4olgQXAhs9goMWvwBvVar/KYfd/Hp/+
 rQtyUCaEgwADBgf9HX3aE5OU4iWU9a8T4ArJ9AmxgU1v7wH34AxJ7oLJcEAhN+3gbCehp9Bd
 B1gyDAVjkhQCAD3YrmMYDqQ1L/sVUYt2Efzbxp9JPgeswK0oPkxheFjumZ2ySdaP5+6Uid3p
 Em344ldGWDK8EUxptY71ABP0/5YmEQWQIH3e8rnyoo281KayJG4qg3G/iFdq59EeKAL4IaQt
 F0+ZDXXEmTnY5YntdD1QQ1X1Uv5QbJ7k1jCd7OFeA7MB+1MYB19uFgtGid2mGJgf0vDs226T
 45Mtahn1s4u300Y5bGy0nVd3KGoYk+baCXQTP4zfSId0dJYCiTOcFht+vRiUfOAt1/YT04hm
 BBgRAgAmAhsMFiEEprNA43BngAuBK+Vswu5Nmh3PsiMFAl5n/EAFCR7WLWEACgkQwu5Nmh3P
 siP3DACfZWB2q1msgya9L+DrIKWWs1vIifUAoJTW5hMOIIlGKcaK/Fa+5nF1pusO
Message-ID: <02eba60e-9b9a-e6d1-55bf-8e211bb56757@blazebox.homeip.net>
Date: Sat, 15 Aug 2020 12:24:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Smtpcorp-Track: 1k6yyjDIIgnlHh.OEwT__iyf
Feedback-ID: 316702m:316702a3jAEqy:316702s1ij_mg8Ts
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I would like to report some stack traces, while running kernel 5.8.x
I have observed these in my log (kernel 5.7.x is unaffected).

[    4.996442] [drm] amdgpu kernel modesetting enabled.
[    5.000833] CRAT table not found
[    5.001889] Virtual CRAT table created for CPU
[    5.003018] amdgpu: Topology: Add CPU node
[    5.008825] kvm: Nested Virtualization enabled
[    5.009899] SVM: kvm: Nested Paging enabled
[    5.013884] checking generic (c0000000 7f0000) vs hw (c0000000 10000000)
[    5.014823] fb0: switching to amdgpudrmfb from EFI VGA
[    5.016731] videodev: Linux video capture interface: v2.00
[    5.022065] Console: switching to colour dummy device 80x25
[    5.022112] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
[    5.022234] [drm] initializing kernel modesetting (VERDE
0x1002:0x683F 0x1682:0x7251 0x00).
[    5.022240] amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature not supported
[    5.022255] [drm] register mmio base: 0xFEA00000
[    5.022258] [drm] register mmio size: 262144
[    5.022262] [drm] PCIE atomic ops is not supported
[    5.022268] [drm] add ip block number 0 <si_common>
[    5.022271] [drm] add ip block number 1 <gmc_v6_0>
[    5.022273] [drm] add ip block number 2 <si_ih>
[    5.022276] [drm] add ip block number 3 <gfx_v6_0>
[    5.022278] [drm] add ip block number 4 <si_dma>
[    5.022281] [drm] add ip block number 5 <si_dpm>
[    5.022283] [drm] add ip block number 6 <dce_v6_0>
[    5.022288] kfd kfd: VERDE  not supported in kfd
[    5.050108] [drm] BIOS signature incorrect 0 0
[    5.050126] amdgpu 0000:01:00.0: No more image in the PCI ROM
[    5.050205] amdgpu: ATOM BIOS: 113-250EZNP10-W8
[    5.050701] [drm] vm size is 64 GB, 2 levels, block size is 10-bit,
fragment size is 9-bit
[    5.053518] amdgpu 0000:01:00.0: amdgpu: VRAM: 1024M
0x000000F400000000 - 0x000000F43FFFFFFF (1024M used)
[    5.053526] amdgpu 0000:01:00.0: amdgpu: GART: 1024M
0x000000FF00000000 - 0x000000FF3FFFFFFF
[    5.053540] [drm] Detected VRAM RAM=1024M, BAR=256M
[    5.053543] [drm] RAM width 128bits GDDR5
[    5.053607] [TTM] Zone  kernel: Available graphics memory: 8181002 KiB
[    5.053611] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    5.053614] [TTM] Initializing pool allocator
[    5.053647] [TTM] Initializing DMA pool allocator
[    5.053688] [drm] amdgpu: 1024M of VRAM memory ready
[    5.053694] [drm] amdgpu: 3072M of GTT memory ready.
[    5.053700] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    5.054767] amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled
(table at 0x000000F4007E9000).
[    5.054872] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.061180] [drm] Internal thermal controller with fan control
[    5.061195] [drm] amdgpu: dpm initialized
[    5.061243] [drm] AMDGPU Display Connectors
[    5.061246] [drm] Connector 0:
[    5.061249] [drm]   DP-1
[    5.061251] [drm]   HPD4
[    5.061254] [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952
0x1953 0x1953
[    5.061257] [drm]   Encoders:
[    5.061260] [drm]     DFP1: INTERNAL_UNIPHY2
[    5.061262] [drm] Connector 1:
[    5.061264] [drm]   HDMI-A-1
[    5.061266] [drm]   HPD1
[    5.061269] [drm]   DDC: 0x195c 0x195c 0x195d 0x195d 0x195e 0x195e
0x195f 0x195f
[    5.061272] [drm]   Encoders:
[    5.061274] [drm]     DFP2: INTERNAL_UNIPHY2
[    5.061277] [drm] Connector 2:
[    5.061279] [drm]   DVI-I-1
[    5.061281] [drm]   HPD2
[    5.061283] [drm]   DDC: 0x1958 0x1958 0x1959 0x1959 0x195a 0x195a
0x195b 0x195b
[    5.061287] [drm]   Encoders:
[    5.061289] [drm]     DFP3: INTERNAL_UNIPHY
[    5.061291] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    5.061824] usb 1-2: Warning! Unlikely big volume range (=3072),
cval->res is probably wrong.
[    5.061834] usb 1-2: [5] FU [Mic Capture Volume] ch = 1, val =
4608/7680/1
[    5.062076] [drm] PCIE gen 2 link speeds already enabled
[    5.062405] usbcore: registered new interface driver snd-usb-audio
[    5.062433] uvcvideo: Found UVC 1.00 device <unnamed> (046d:0990)
[    5.108277] uvcvideo 1-2:1.0: Entity type for entity Extension 4 was
not initialized!
[    5.108287] uvcvideo 1-2:1.0: Entity type for entity Extension 10 was
not initialized!
[    5.108292] uvcvideo 1-2:1.0: Entity type for entity Extension 12 was
not initialized!
[    5.108297] uvcvideo 1-2:1.0: Entity type for entity Extension 8 was
not initialized!
[    5.108302] uvcvideo 1-2:1.0: Entity type for entity Extension 11 was
not initialized!
[    5.108307] uvcvideo 1-2:1.0: Entity type for entity Extension 9 was
not initialized!
[    5.108311] uvcvideo 1-2:1.0: Entity type for entity Processing 2 was
not initialized!
[    5.108317] uvcvideo 1-2:1.0: Entity type for entity Extension 13 was
not initialized!
[    5.108323] uvcvideo 1-2:1.0: Entity type for entity Camera 1 was not
initialized!
[    5.108393] input: UVC Camera (046d:0990) as
/devices/pci0000:00/0000:00:12.2/usb1/1-2/1-2:1.0/input/input21
[    5.108485] usbcore: registered new interface driver uvcvideo
[    5.108488] USB Video Class driver (1.1.1)
[    5.266726] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 2, CU per SH
5, active_cu_number 8
[    5.364548] [drm] fb mappable at 0xC09EC000
[    5.364552] [drm] vram apper at 0xC0000000
[    5.364554] [drm] size 8294400
[    5.364555] [drm] fb depth is 24
[    5.364557] [drm]    pitch is 7680
[    5.364699] fbcon: amdgpudrmfb (fb0) is primary device
[    5.465079] Console: switching to colour frame buffer device 240x67
[    5.468916] amdgpu 0000:01:00.0: fb0: amdgpudrmfb frame buffer device
[    5.810276] [drm] Initialized amdgpu 3.38.0 20150101 for 0000:01:00.0
on minor 0
[    6.044585] Key type encrypted registered
[    6.118947] Adding 2043900k swap on /dev/mapper/swap.  Priority:-2
extents:1 across:2043900k SSFS
[    6.908717] xfs filesystem being remounted at / supports timestamps
until 2038 (0x7fffffff)
[    7.017606] XFS (dm-2): Mounting V5 Filesystem
[    7.230623] XFS (dm-2): Ending clean mount
[    8.008108] xfs filesystem being mounted at /mnt/storage supports
timestamps until 2038 (0x7fffffff)
[    8.181095] NET: Registered protocol family 10
[    8.188926] Segment Routing with IPv6
[    8.739839] usb 1-2: reset high-speed USB device number 2 using ehci-pci
[    9.087343] RTL8211E Gigabit Ethernet r8169-a00:00: attached PHY
driver [RTL8211E Gigabit Ethernet] (mii_bus:phy_addr=r8169-a00:00,
irq=IGNORE)
[    9.260936] r8169 0000:0a:00.0 eth0: Link is Down
[    9.326097] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    9.328889] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.408396] r8169 0000:0a:00.0 eth0: Link is Up - 1Gbps/Full - flow
control rx/tx
[   11.408410] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   50.044839] vboxdrv: loading out-of-tree module taints kernel.
[   50.064725] vboxdrv: Found 4 processor cores
[   50.081177] vboxdrv: TSC mode is Invariant, tentative frequency
4615560930 Hz
[   50.081180] vboxdrv: Successfully loaded version 6.1.13 (interface
0x002e0000)
[   50.291729] VBoxNetFlt: Successfully started.
[   50.296754] VBoxNetAdp: Successfully started.
[   56.787061] ------------[ cut here ]------------
[   56.787075] WARNING: CPU: 3 PID: 5500 at
drivers/gpu/drm/drm_modeset_lock.c:185
drm_warn_on_modeset_not_all_locked.part.0+0x72/0x80 [drm]
[   56.787075] Modules linked in: vboxnetadp(O) vboxnetflt(O) vboxdrv(O)
cfg80211 ipv6 nf_defrag_ipv6 nls_iso8859_1 nls_cp437 vfat fat dm_crypt
encrypted_keys trusted tpm mxm_wmi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio kvm_amd
snd_usbmidi_lib snd_rawmidi videodev kvm snd_seq_device mc evdev
irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel fam15h_power
k10temp amdgpu r8169 realtek iommu_v2 gpu_sched hwmon ttm
snd_hda_codec_realtek drm_kms_helper snd_hda_codec_generic
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg drm i2c_piix4
snd_hda_codec snd_hda_core snd_hwdep snd_pcm agpgart i2c_algo_bit
snd_timer snd soundcore wmi button acpi_cpufreq loop xfs hid_microsoft
ff_memless hid_generic i2c_hid i2c_core usbhid hid uhci_hcd ohci_pci
ohci_hcd xhci_pci xhci_hcd ehci_pci ehci_hcd uas usb_storage
[   56.787098] CPU: 3 PID: 5500 Comm: Xorg Tainted: G           O
5.8.1 #1
[   56.787099] Hardware name: To be filled by O.E.M. To be filled by
O.E.M./M5A99FX PRO R2.0, BIOS 2501 04/07/2014
[   56.787106] RIP:
0010:drm_warn_on_modeset_not_all_locked.part.0+0x72/0x80 [drm]
[   56.787109] Code: de e9 84 c0 74 1a 49 8d bc 24 98 01 00 00 e8 85 92
de e9 84 c0 74 13 5b 5d 41 5c c3 0f 0b eb c8 0f 0b 66 0f 1f 44 00 00 eb
dc <0f> 0b 5b 5d 41 5c c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 8b 05 d5
[   56.787109] RSP: 0018:ffffc90000a8fa40 EFLAGS: 00010246
[   56.787110] RAX: 0000000000000000 RBX: ffff88842ae72af8 RCX:
0000000000000000
[   56.787111] RDX: 0000000000000000 RSI: ffff88842a5b08a0 RDI:
ffff88842ae72998
[   56.787112] RBP: ffff88842ae72b08 R08: ffff888429d3ad48 R09:
ffff88842ae72ad8
[   56.787113] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff88842ae72800
[   56.787113] R13: ffff88842ae72800 R14: ffff88842ae72800 R15:
ffff88842a5b08a0
[   56.787114] FS:  00007f16ae8a5900(0000) GS:ffff88842ed80000(0000)
knlGS:0000000000000000
[   56.787115] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.787116] CR2: 00000000004eb3d0 CR3: 0000000405fc6000 CR4:
00000000000406e0
[   56.787116] Call Trace:
[   56.787124]  drm_crtc_helper_set_mode+0x81/0x4e0 [drm_kms_helper]
[   56.787129]  ? __blk_mq_delay_run_hw_queue+0x1b9/0x200
[   56.787130]  ? blk_mq_run_hw_queue+0x85/0xe0
[   56.787132]  ? blk_mq_sched_insert_requests+0x97/0x130
[   56.787134]  ? update_load_avg+0x66/0x640
[   56.787135]  ? newidle_balance+0xe7/0x3f0
[   56.787138]  ? _raw_spin_unlock_irq+0x19/0x40
[   56.787140]  ? finish_task_switch+0x8b/0x270
[   56.787142]  ? __switch_to+0x166/0x3c0
[   56.787144]  ? __switch_to_asm+0x36/0x70
[   56.787145]  ? __schedule+0x2cf/0x7b0
[   56.787146]  ? blk_finish_plug+0x21/0x30
[   56.787215]  amdgpu_connector_set_property+0x3a7/0x4d0 [amdgpu]
[   56.787223]  drm_connector_set_obj_prop+0x4e/0xa0 [drm]
[   56.787231]  drm_mode_obj_set_property_ioctl+0x27e/0x300 [drm]
[   56.787239]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787246]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[   56.787251]  drm_ioctl_kernel+0xcc/0x110 [drm]
[   56.787257]  drm_ioctl+0x202/0x390 [drm]
[   56.787264]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787296]  amdgpu_drm_ioctl+0x5d/0xa0 [amdgpu]
[   56.787298]  ksys_ioctl+0xa4/0xd0
[   56.787300]  ? __prepare_exit_to_usermode+0x70/0x180
[   56.787301]  __x64_sys_ioctl+0x16/0x20
[   56.787303]  do_syscall_64+0x44/0xb0
[   56.787304]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   56.787306] RIP: 0033:0x7f16ae2c44b7
[   56.787307] Code: 00 00 90 48 8b 05 d9 29 0d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
[   56.787308] RSP: 002b:00007ffd4c10aad8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   56.787309] RAX: ffffffffffffffda RBX: 00007ffd4c10ab10 RCX:
00007f16ae2c44b7
[   56.787309] RDX: 00007ffd4c10ab10 RSI: 00000000c01064ab RDI:
000000000000000e
[   56.787310] RBP: 00000000c01064ab R08: 000000000000ffff R09:
000000000000000f
[   56.787311] R10: 00007f16ae30eb50 R11: 0000000000000246 R12:
0000000002978c40
[   56.787311] R13: 000000000000000e R14: 0000000002981470 R15:
0000000002981470
[   56.787313] ---[ end trace 39514a9c89c3003a ]---
[   56.787326] ------------[ cut here ]------------
[   56.787329] WARNING: CPU: 3 PID: 5500 at
drivers/gpu/drm/drm_crtc_helper.c:148 drm_helper_crtc_in_use+0x93/0xa0
[drm_kms_helper]
[   56.787330] Modules linked in: vboxnetadp(O) vboxnetflt(O) vboxdrv(O)
cfg80211 ipv6 nf_defrag_ipv6 nls_iso8859_1 nls_cp437 vfat fat dm_crypt
encrypted_keys trusted tpm mxm_wmi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio kvm_amd
snd_usbmidi_lib snd_rawmidi videodev kvm snd_seq_device mc evdev
irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel fam15h_power
k10temp amdgpu r8169 realtek iommu_v2 gpu_sched hwmon ttm
snd_hda_codec_realtek drm_kms_helper snd_hda_codec_generic
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg drm i2c_piix4
snd_hda_codec snd_hda_core snd_hwdep snd_pcm agpgart i2c_algo_bit
snd_timer snd soundcore wmi button acpi_cpufreq loop xfs hid_microsoft
ff_memless hid_generic i2c_hid i2c_core usbhid hid uhci_hcd ohci_pci
ohci_hcd xhci_pci xhci_hcd ehci_pci ehci_hcd uas usb_storage
[   56.787345] CPU: 3 PID: 5500 Comm: Xorg Tainted: G        W  O
5.8.1 #1
[   56.787345] Hardware name: To be filled by O.E.M. To be filled by
O.E.M./M5A99FX PRO R2.0, BIOS 2501 04/07/2014
[   56.787348] RIP: 0010:drm_helper_crtc_in_use+0x93/0xa0 [drm_kms_helper]
[   56.787349] Code: 75 ed 48 89 df e8 ad fe ff ff 84 c0 74 e1 5b 5d 41
5c c3 5b 31 c0 5d 41 5c c3 48 8d bd 98 01 00 00 e8 f1 62 e3 e9 84 c0 75
ac <0f> 0b eb a8 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 41 bc
[   56.787350] RSP: 0018:ffffc90000a8fa40 EFLAGS: 00010246
[   56.787351] RAX: 0000000000000000 RBX: ffff88842b014200 RCX:
0000000000000000
[   56.787351] RDX: 0000000000000000 RSI: ffff88842a5b08a0 RDI:
ffff88842ae72998
[   56.787352] RBP: ffff88842ae72800 R08: ffff888429d3ad48 R09:
ffff88842ae72ad8
[   56.787353] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff88842a5b0800
[   56.787353] R13: ffff88842ae72800 R14: ffff88842ae72800 R15:
ffff88842a5b08a0
[   56.787354] FS:  00007f16ae8a5900(0000) GS:ffff88842ed80000(0000)
knlGS:0000000000000000
[   56.787355] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.787356] CR2: 00000000004eb3d0 CR3: 0000000405fc6000 CR4:
00000000000406e0
[   56.787356] Call Trace:
[   56.787360]  drm_crtc_helper_set_mode+0x96/0x4e0 [drm_kms_helper]
[   56.787362]  ? __blk_mq_delay_run_hw_queue+0x1b9/0x200
[   56.787363]  ? blk_mq_run_hw_queue+0x85/0xe0
[   56.787365]  ? blk_mq_sched_insert_requests+0x97/0x130
[   56.787367]  ? update_load_avg+0x66/0x640
[   56.787368]  ? newidle_balance+0xe7/0x3f0
[   56.787369]  ? _raw_spin_unlock_irq+0x19/0x40
[   56.787371]  ? finish_task_switch+0x8b/0x270
[   56.787372]  ? __switch_to+0x166/0x3c0
[   56.787373]  ? __switch_to_asm+0x36/0x70
[   56.787375]  ? __schedule+0x2cf/0x7b0
[   56.787376]  ? blk_finish_plug+0x21/0x30
[   56.787408]  amdgpu_connector_set_property+0x3a7/0x4d0 [amdgpu]
[   56.787416]  drm_connector_set_obj_prop+0x4e/0xa0 [drm]
[   56.787423]  drm_mode_obj_set_property_ioctl+0x27e/0x300 [drm]
[   56.787431]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787438]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[   56.787443]  drm_ioctl_kernel+0xcc/0x110 [drm]
[   56.787448]  drm_ioctl+0x202/0x390 [drm]
[   56.787456]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787489]  amdgpu_drm_ioctl+0x5d/0xa0 [amdgpu]
[   56.787492]  ksys_ioctl+0xa4/0xd0
[   56.787494]  ? __prepare_exit_to_usermode+0x70/0x180
[   56.787495]  __x64_sys_ioctl+0x16/0x20
[   56.787497]  do_syscall_64+0x44/0xb0
[   56.787499]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   56.787500] RIP: 0033:0x7f16ae2c44b7
[   56.787502] Code: 00 00 90 48 8b 05 d9 29 0d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
[   56.787503] RSP: 002b:00007ffd4c10aad8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   56.787506] RAX: ffffffffffffffda RBX: 00007ffd4c10ab10 RCX:
00007f16ae2c44b7
[   56.787507] RDX: 00007ffd4c10ab10 RSI: 00000000c01064ab RDI:
000000000000000e
[   56.787508] RBP: 00000000c01064ab R08: 000000000000ffff R09:
000000000000000f
[   56.787509] R10: 00007f16ae30eb50 R11: 0000000000000246 R12:
0000000002978c40
[   56.787510] R13: 000000000000000e R14: 0000000002981470 R15:
0000000002981470
[   56.787512] ---[ end trace 39514a9c89c3003b ]---
[   56.787524] ------------[ cut here ]------------
[   56.787529] WARNING: CPU: 3 PID: 5500 at
drivers/gpu/drm/drm_crtc_helper.c:108
drm_helper_encoder_in_use+0xc8/0xe0 [drm_kms_helper]
[   56.787529] Modules linked in: vboxnetadp(O) vboxnetflt(O) vboxdrv(O)
cfg80211 ipv6 nf_defrag_ipv6 nls_iso8859_1 nls_cp437 vfat fat dm_crypt
encrypted_keys trusted tpm mxm_wmi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio kvm_amd
snd_usbmidi_lib snd_rawmidi videodev kvm snd_seq_device mc evdev
irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel fam15h_power
k10temp amdgpu r8169 realtek iommu_v2 gpu_sched hwmon ttm
snd_hda_codec_realtek drm_kms_helper snd_hda_codec_generic
snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg drm i2c_piix4
snd_hda_codec snd_hda_core snd_hwdep snd_pcm agpgart i2c_algo_bit
snd_timer snd soundcore wmi button acpi_cpufreq loop xfs hid_microsoft
ff_memless hid_generic i2c_hid i2c_core usbhid hid uhci_hcd ohci_pci
ohci_hcd xhci_pci xhci_hcd ehci_pci ehci_hcd uas usb_storage
[   56.787553] CPU: 3 PID: 5500 Comm: Xorg Tainted: G        W  O
5.8.1 #1
[   56.787553] Hardware name: To be filled by O.E.M. To be filled by
O.E.M./M5A99FX PRO R2.0, BIOS 2501 04/07/2014
[   56.787557] RIP: 0010:drm_helper_encoder_in_use+0xc8/0xe0
[drm_kms_helper]
[   56.787558] Code: 01 00 00 00 eb da 48 8d bd 98 01 00 00 e8 b0 63 e3
e9 84 c0 74 14 48 8d bd b8 01 00 00 e8 a0 63 e3 e9 84 c0 75 8d 0f 0b eb
89 <0f> 0b 66 0f 1f 44 00 00 eb e2 e8 a9 70 5f ea 66 0f 1f 84 00 00 00
[   56.787559] RSP: 0018:ffffc90000a8fa10 EFLAGS: 00010246
[   56.787560] RAX: 0000000000000000 RBX: ffff88842bd53e00 RCX:
0000000000000000
[   56.787560] RDX: 0000000000000000 RSI: ffff88842a5b08a0 RDI:
ffff88842ae72998
[   56.787561] RBP: ffff88842ae72800 R08: ffff888429d3ad48 R09:
ffff88842ae72ad8
[   56.787561] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff88842a5b0800
[   56.787562] R13: ffff88842ae72800 R14: ffff88842ae72800 R15:
ffff88842a5b08a0
[   56.787563] FS:  00007f16ae8a5900(0000) GS:ffff88842ed80000(0000)
knlGS:0000000000000000
[   56.787564] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.787564] CR2: 00000000004eb3d0 CR3: 0000000405fc6000 CR4:
00000000000406e0
[   56.787565] Call Trace:
[   56.787568]  ? drm_helper_crtc_in_use+0x95/0xa0 [drm_kms_helper]
[   56.787571]  drm_helper_crtc_in_use+0x73/0xa0 [drm_kms_helper]
[   56.787574]  drm_crtc_helper_set_mode+0x96/0x4e0 [drm_kms_helper]
[   56.787577]  ? __blk_mq_delay_run_hw_queue+0x1b9/0x200
[   56.787578]  ? blk_mq_run_hw_queue+0x85/0xe0
[   56.787579]  ? blk_mq_sched_insert_requests+0x97/0x130
[   56.787581]  ? update_load_avg+0x66/0x640
[   56.787582]  ? newidle_balance+0xe7/0x3f0
[   56.787584]  ? _raw_spin_unlock_irq+0x19/0x40
[   56.787585]  ? finish_task_switch+0x8b/0x270
[   56.787587]  ? __switch_to+0x166/0x3c0
[   56.787588]  ? __switch_to_asm+0x36/0x70
[   56.787589]  ? __schedule+0x2cf/0x7b0
[   56.787590]  ? blk_finish_plug+0x21/0x30
[   56.787622]  amdgpu_connector_set_property+0x3a7/0x4d0 [amdgpu]
[   56.787630]  drm_connector_set_obj_prop+0x4e/0xa0 [drm]
[   56.787637]  drm_mode_obj_set_property_ioctl+0x27e/0x300 [drm]
[   56.787644]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787651]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[   56.787657]  drm_ioctl_kernel+0xcc/0x110 [drm]
[   56.787662]  drm_ioctl+0x202/0x390 [drm]
[   56.787669]  ? drm_connector_set_obj_prop+0xa0/0xa0 [drm]
[   56.787702]  amdgpu_drm_ioctl+0x5d/0xa0 [amdgpu]
[   56.787703]  ksys_ioctl+0xa4/0xd0
[   56.787704]  ? __prepare_exit_to_usermode+0x70/0x180
[   56.787706]  __x64_sys_ioctl+0x16/0x20
[   56.787707]  do_syscall_64+0x44/0xb0
[   56.787708]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   56.787709] RIP: 0033:0x7f16ae2c44b7
[   56.787710] Code: 00 00 90 48 8b 05 d9 29 0d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
[   56.787711] RSP: 002b:00007ffd4c10aad8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   56.787712] RAX: ffffffffffffffda RBX: 00007ffd4c10ab10 RCX:
00007f16ae2c44b7
[   56.787712] RDX: 00007ffd4c10ab10 RSI: 00000000c01064ab RDI:
000000000000000e
[   56.787713] RBP: 00000000c01064ab R08: 000000000000ffff R09:
000000000000000f
[   56.787714] R10: 00007f16ae30eb50 R11: 0000000000000246 R12:
0000000002978c40
[   56.787714] R13: 000000000000000e R14: 0000000002981470 R15:
0000000002981470
[   56.787716] ---[ end trace 39514a9c89c3003c ]---


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
