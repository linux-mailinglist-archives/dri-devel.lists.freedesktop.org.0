Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1B067195F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDBD10E709;
	Wed, 18 Jan 2023 10:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621B310E186;
 Tue, 17 Jan 2023 15:55:53 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v17so4911697oie.5;
 Tue, 17 Jan 2023 07:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKKRr/5dq4/cNOeXQSjfB3XD5W4e8+EVDAk6qFiUpyM=;
 b=VQTNamlq9Ug2dvVJGwnloZ/otXiOT4JtsBiItS8PYtpSZSGs2F8lP7OcJ5AZd6DIX1
 PyELk7VUyKZukGR6nNXQtgNtVY1H18YSx5HbRaRBKlA096TKUlZOtQt1kS7ECGHsjdcI
 FVT2olgPUO4XL8US6EpA9YTIYWnMK1A0UdUpJdtHkIprC3uof9zjio6cFjoklL/ca5kn
 rjv8Qs6zBC5dsMTovG+4wIL6+oQYYQ/QTYigCw23V/CLfsfbLhfFjcGDPaQXaOMhiu0k
 QsqGTkyTBnWnnMvPfE95mWejLx/gqAztF3SZzVUl+DXknbZWtL6TzYGNvvZJ5b8mPgq7
 HT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKKRr/5dq4/cNOeXQSjfB3XD5W4e8+EVDAk6qFiUpyM=;
 b=y2my6a/kEx1KDvd9ypi+3l0qJB4+iyAc7nbM0v3Kpw8TcSN8FBn8gx0wwk9zos1ebs
 VcoZuC+ZUuuPoJqOgDzJsntm5MwBZ8eErYIcGIkS3zAOv1qSEEsIX+eRgKLDZL9BrUS+
 nkxBvdFQJKvch/WyXemKCaGW0FHhiX3ZGQKrp+ouMdeoUoiz4QBKsXxgj0idTFPT8Tys
 fIjEmpgAMacxfkk1hmf1IrAuGC+5XMkIyDCsCLbumlZecW87MiJS6c8V88ouYESZBlfP
 o26ZU2eBIFGNVyuHSYpcORmzgtjyPxSlkL+p8KtVPRtgzxjxU3j/epaUgOYLt+XsSc8W
 QjrQ==
X-Gm-Message-State: AFqh2kqDdmf/VL+niWfTvZ2cytRVQeYyquDl1HwUGceq40lxD6gcigkb
 nFqfL0UUgdSqogG4Rmpw3wyCVMTeLosqNVzlOcU=
X-Google-Smtp-Source: AMrXdXtTmRqcsOiw6k8wLeu8TjF+XPBfaCsfDKj299cEtP7vjYnZDiF3Var81T3A0tpIqT9BcBvrjGpJFypCJnr662c=
X-Received: by 2002:aca:1012:0:b0:35e:8a81:d17a with SMTP id
 18-20020aca1012000000b0035e8a81d17amr150180oiq.54.1673970952440; Tue, 17 Jan
 2023 07:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
In-Reply-To: <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Tue, 17 Jan 2023 16:55:41 +0100
Message-ID: <CABr+WTn+C9g6-mWkA8Lb-oKNGo6jrXSgAxpUeGZNxu1Nq5Y0DQ@mail.gmail.com>
Subject: Re: [Nouveau] [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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
Cc: nouveau@lists.freedesktop.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le dim. 15 janv. 2023 =C3=A0 22:45, David Airlie <airlied@redhat.com> a =C3=
=A9crit :
>
> On Thu, Dec 29, 2022 at 12:58 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>=
 wrote:
> >
> > Hello,
> >
> > Commit 2541626cfb79 breaks GM20B probe with
> > the following kernel log:
> >
> > [    2.153892] ------------[ cut here ]------------
> > [    2.153897] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/nouveau/nvkm/=
subdev/mmu/vmmgf100.c:273 gf100_vmm_valid+0x2c4/0x390
> > [    2.153916] Modules linked in:
> > [    2.153922] CPU: 1 PID: 36 Comm: kworker/u8:1 Not tainted 6.1.0+ #1
> > [    2.153929] Hardware name: Google Pixel C (DT)
> > [    2.153933] Workqueue: events_unbound deferred_probe_work_func
> > [    2.153943] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [    2.153950] pc : gf100_vmm_valid+0x2c4/0x390
> > [    2.153959] lr : gf100_vmm_valid+0xb4/0x390
> > [    2.153966] sp : ffffffc009e134b0
> > [    2.153969] x29: ffffffc009e134b0 x28: 0000000000000000 x27: ffffffc=
008fd44c8
> > [    2.153979] x26: 00000000ffffffea x25: ffffffc0087b98d0 x24: ffffff8=
080f89038
> > [    2.153987] x23: ffffff8081fadc08 x22: 0000000000000000 x21: 0000000=
000000000
> > [    2.153995] x20: ffffff8080f8a000 x19: ffffffc009e13678 x18: 0000000=
000000000
> > [    2.154003] x17: f37a8b93418958e6 x16: ffffffc009f0d000 x15: 0000000=
000000000
> > [    2.154011] x14: 0000000000000002 x13: 000000000003a020 x12: ffffffc=
008000000
> > [    2.154019] x11: 0000000102913000 x10: 0000000000000000 x9 : 0000000=
000000000
> > [    2.154026] x8 : ffffffc009e136d8 x7 : ffffffc008fd44c8 x6 : ffffff8=
0803d0f00
> > [    2.154034] x5 : 0000000000000000 x4 : ffffff8080f88c00 x3 : 0000000=
000000010
> > [    2.154041] x2 : 000000000000000c x1 : 00000000ffffffea x0 : 0000000=
0ffffffea
> > [    2.154050] Call trace:
> > [    2.154053]  gf100_vmm_valid+0x2c4/0x390
> > [    2.154061]  nvkm_vmm_map_valid+0xd4/0x204
> > [    2.154069]  nvkm_vmm_map_locked+0xa4/0x344
> > [    2.154076]  nvkm_vmm_map+0x50/0x84
> > [    2.154083]  nvkm_firmware_mem_map+0x84/0xc4
> > [    2.154094]  nvkm_falcon_fw_oneinit+0xc8/0x320
> > [    2.154101]  nvkm_acr_oneinit+0x428/0x5b0
> > [    2.154109]  nvkm_subdev_oneinit_+0x50/0x104
> > [    2.154114]  nvkm_subdev_init_+0x3c/0x12c
> > [    2.154119]  nvkm_subdev_init+0x60/0xa0
> > [    2.154125]  nvkm_device_init+0x14c/0x2a0
> > [    2.154133]  nvkm_udevice_init+0x60/0x9c
> > [    2.154140]  nvkm_object_init+0x48/0x1b0
> > [    2.154144]  nvkm_ioctl_new+0x168/0x254
> > [    2.154149]  nvkm_ioctl+0xd0/0x220
> > [    2.154153]  nvkm_client_ioctl+0x10/0x1c
> > [    2.154162]  nvif_object_ctor+0xf4/0x22c
> > [    2.154168]  nvif_device_ctor+0x28/0x70
> > [    2.154174]  nouveau_cli_init+0x150/0x590
> > [    2.154180]  nouveau_drm_device_init+0x60/0x2a0
> > [    2.154187]  nouveau_platform_device_create+0x90/0xd0
> > [    2.154193]  nouveau_platform_probe+0x3c/0x9c
> > [    2.154200]  platform_probe+0x68/0xc0
> > [    2.154207]  really_probe+0xbc/0x2dc
> > [    2.154211]  __driver_probe_device+0x78/0xe0
> > [    2.154216]  driver_probe_device+0xd8/0x160
> > [    2.154221]  __device_attach_driver+0xb8/0x134
> > [    2.154226]  bus_for_each_drv+0x78/0xd0
> > [    2.154230]  __device_attach+0x9c/0x1a0
> > [    2.154234]  device_initial_probe+0x14/0x20
> > [    2.154239]  bus_probe_device+0x98/0xa0
> > [    2.154243]  deferred_probe_work_func+0x88/0xc0
> > [    2.154247]  process_one_work+0x204/0x40c
> > [    2.154256]  worker_thread+0x230/0x450
> > [    2.154261]  kthread+0xc8/0xcc
> > [    2.154266]  ret_from_fork+0x10/0x20
> > [    2.154273] ---[ end trace 0000000000000000 ]---
> > [    2.154278] nouveau 57000000.gpu: pmu: map -22
> > [    2.154285] nouveau 57000000.gpu: acr: one-time init failed, -22
> > [    2.154559] nouveau 57000000.gpu: init failed with -22
> > [    2.154564] nouveau: DRM-master:00000000:00000080: init failed with =
-22
> > [    2.154574] nouveau 57000000.gpu: DRM-master: Device allocation fail=
ed: -22
> > [    2.162905] nouveau: probe of 57000000.gpu failed with error -22
> >
> > #regzbot introduced: 2541626cfb79
>
> As a quick check can you try changing
>
> drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
>
> Dave.

I'm also reproducing the error on jetson-tx1 running 6.2-rc4 (rawhide
nodebug kernel) on Fedora 37 userspace.

With this change, the error is different:

nouveau: loading out-of-tree module taints kernel.
nouveau: module verification failed: signature and/or required key
missing - tainting kernel
Failed to set up IOMMU for device 57000000.gpu; retaining platform DMA ops
nouveau 57000000.gpu: NVIDIA GM20B (12b000a1)
nouveau 57000000.gpu: imem: using IOMMU
Unable to handle kernel execution of user memory at virtual address
0000000000000000
Mem abort info:
  ESR =3D 0x0000000086000004
  EC =3D 0x21: IABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000013e136000
[0000000000000000] pgd=3D0000000000000000, p4d=3D0000000000000000
Internal error: Oops: 0000000086000004 [#1] SMP
Modules linked in: nouveau(OE+) drm_ttm_helper ttm snd_seq_dummy
snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables
nfnetlink qrtr sunrpc snd_soc_tegra_audio_graph_card
snd_soc_audio_graph_card snd_soc_simple_card_utils snd_soc_core
snd_compress snd_hda_codec_hdmi ac97_bus snd_hda_tegra
snd_pcm_dmaengine snd_hda_codec max77620_thermal vfat snd_hda_core fat
snd_hwdep snd_seq cpufreq_dt tegra_xudc snd_seq_device usb_conn_gpio
tegra_soctherm snd_pcm udc_core snd_timer snd at24 soundcore zram
r8152 mii panel_simple mmc_block tegra_drm drm_dp_aux_bus rtc_max77686
drm_display_helper lp855x_bl cec crct10dif_ce polyval_ce
polyval_generic xhci_tegra sdhci_tegra ghash_ce sdhci_pltfm
phy_tegra_xusb sdhci host1x ahci_tegra gpio_keys tegra210_emc cqhci
rtc_tegra i2c_tegra ip6_tables
abrt-dump-journal-oops: Found oopses: 1
abrt-dump-journal-oops: Creating problem directories
Can't find a meaningful backtrace for hashing in '.'
Preserving oops '.' because DropNotReportableOopses is 'no'
Reported 1 kernel oopses to Abrt
System encountered a non-fatal error in ??()
 ip_tables fuse
CPU: 3 PID: 15789 Comm: insmod Tainted: G           OE     -------
---  6.2.0-0.rc4.31.fc38.aarch64 #1
Hardware name: nvidia,p2371-2180 NVIDIA P2371-2180/NVIDIA P2371-2180,
BIOS 2022.10 10/01/2022
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : 0x0
lr : nvkm_falcon_load_dmem+0x60/0x80 [nouveau]
sp : ffff8000141034c0
x29: ffff8000141034c0 x28: ffff0000865d2008 x27: ffff0000c87b8638
x26: 00000000000000ff x25: ffff0000865d20a0 x24: 0000000000000000
x23: ffff0000f4ef34f8 x22: 000000000000002c x21: 0000000000005fd4
x20: ffff800014103534 x19: ffff0000f4ef34b8 x18: ffffffffffffffff
x17: 000000040044ffff x16: 00500074b5503510 x15: ffff8000141035d8
x14: ffff0000c87b8506 x13: 0000000000000001 x12: 0000000000000018
x11: 0000000000000001 x10: fffffffffffffec0 x9 : ffff8000091efa90
x8 : ffff800014103560 x7 : 0000000000000000 x6 : 0000000434da8f65
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 000000000000002c
x2 : 0000000000005fd4 x1 : ffff800014103534 x0 : ffff0000f4ef34b8
Call trace:
 0x0
 gm20b_pmu_init+0x70/0x90 [nouveau]
 nvkm_pmu_init+0x28/0x40 [nouveau]
 nvkm_subdev_init_+0x68/0x134 [nouveau]
 nvkm_subdev_init+0x68/0xb0 [nouveau]
 nvkm_device_init+0x154/0x2ac [nouveau]
 nvkm_udevice_init+0x68/0xa0 [nouveau]
 nvkm_object_init+0x50/0x1b4 [nouveau]
 nvkm_ioctl_new+0x154/0x280 [nouveau]
 nvkm_ioctl+0xd8/0x230 [nouveau]
 nvkm_client_ioctl+0x18/0x24 [nouveau]
 nvif_object_ctor+0xec/0x1a0 [nouveau]
 nvif_device_ctor+0x30/0x7c [nouveau]
 nouveau_cli_init+0x144/0x574 [nouveau]
 nouveau_drm_device_init+0x68/0x2b0 [nouveau]
 nouveau_platform_device_create+0x98/0xd0 [nouveau]
 nouveau_platform_probe+0x34/0x90 [nouveau]
 platform_probe+0x70/0xd0
 really_probe+0xc8/0x3e4
 __driver_probe_device+0x84/0x190
 driver_probe_device+0x44/0x11c
 __driver_attach+0xf8/0x200
 bus_for_each_dev+0x6c/0xac
 driver_attach+0x2c/0x40
 bus_add_driver+0x188/0x250
 driver_register+0x80/0x13c
 __platform_driver_register+0x30/0x3c
 nouveau_drm_init+0x9c/0x1000 [nouveau]
 do_one_initcall+0x4c/0x2a0
 do_init_module+0x50/0x200
 load_module+0x9b0/0xb10
 __do_sys_finit_module+0x98/0x100
 __arm64_sys_finit_module+0x28/0x34
 invoke_syscall+0x78/0x100
 el0_svc_common.constprop.0+0x4c/0xf4
 do_el0_svc+0x34/0x4c
 el0_svc+0x34/0x10c
 el0t_64_sync_handler+0x114/0x120
 el0t_64_sync+0x194/0x198
Code: bad PC value
---[ end trace 0000000000000000 ]---
