Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD4671BA3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2210E722;
	Wed, 18 Jan 2023 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD6410E1E8;
 Wed, 18 Jan 2023 08:42:28 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-142b72a728fso34727527fac.9; 
 Wed, 18 Jan 2023 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sui+3Tn8QL+wYly/3IIPo/fowqY89EqiaKkNW/dATHM=;
 b=lVPrRcxDtq7TvNulgEnPr2FKMGEnTErX5W4fULAA5v1jkhT4dPnJrCAJSGtd80tS3J
 aF1Jyv22DCLARogax4+iCb04YvIW1/wndYvzMiqRTOQmJirdAD7BxaMtc+cU5NuoJMJu
 MwMhPCNziuFY9++5T2uf5l3u1B2gt7t28i/i2f4ZseIquUujRROr5YQ2/n7TPSYCjI/r
 JEZIbp0tGf5f/3uMqkHB+6RbYH6K8cPDm1Ny23viBHFRCvOptRhcZRXPlEyTC7bGCqUY
 5GC7FOam8p6tQu/DdGlGDDvFvih0yvukVOrJDMAivOl4FMCxyLyEjXRwTg//9muy595m
 V8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sui+3Tn8QL+wYly/3IIPo/fowqY89EqiaKkNW/dATHM=;
 b=TcHC7Dw96RujfcGYBauEI/2soS+Wj8ycoQc12TOn15/zQ8Gopyw7Uoql+dR0Wi9VoB
 UplRj8mFbsnEoFD13wHDVEFcv10W717OXjkFNXKQaiivylPfA643jCpy14v1eeY06y7j
 AXtTR9Q6kPjyF4wZN7WKcdSVyyoeNLqYzcJU0gC+AhWO+yvosAeUzV731yVWPqrJ28HO
 rLXC8oqRlyONNpR9oXhda8MGgRAuTZ7A2TdVM8Yb/TFmY+jJn93WsFhHrvKSNkto9WLV
 vcyzJ46hjrNWh8bNu6qdmmReowRSkxjexGs1khbUDfgFK0kaT/sxQq09jqlYBlRzt0px
 JCHQ==
X-Gm-Message-State: AFqh2kq69aiI4nU38qGp/WDZfjUlxo49Fi4H1MVLNdLkBEa0GTuuki/P
 Jhl89ps6yWGLRaa6ux8HU9gMUTFRFZBX/FeBlH7zpGs/l3YMDA==
X-Google-Smtp-Source: AMrXdXtkqqA6buwWWh+uQyE2W6QnplVFxGzq6N8OoAs+UoRmdqKTiJW2o9Yw/38zKdkOgfpAYBRTbaBHe/sHcwwhbwk=
X-Received: by 2002:a05:6870:1f07:b0:15e:d99b:80b6 with SMTP id
 pd7-20020a0568701f0700b0015ed99b80b6mr511386oab.126.1674031347222; Wed, 18
 Jan 2023 00:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop>
 <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
In-Reply-To: <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Wed, 18 Jan 2023 09:42:15 +0100
Message-ID: <CABr+WTnOyC-jpRiafuwPCXMY6+2JiOXnJuKuTCBZfEbOKfmo-A@mail.gmail.com>
Subject: Re: [Nouveau] [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Ben Skeggs <skeggsb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 18 Jan 2023 12:12:42 +0000
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
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 bskeggs@redhat.com, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mer. 18 janv. 2023 =C3=A0 02:29, Ben Skeggs <skeggsb@gmail.com> a =C3=A9=
crit :
>
> On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wr=
ote:
> >
> > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > On Thu, Dec 29, 2022 at 12:58 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa=
.pt> wrote:
> > > As a quick check can you try changing
> > >
> > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> >
> > Hello!
> >
> > Applying this change breaks probing in a different way, with a
> > bad PC=3D0x0. From a quick look at nvkm_falcon_load_dmem it looks like =
this
> > could happen due to the .load_dmem() callback not being properly
> > initialized. This is the kernel log I got:
> In addition to Dave's change, can you try changing the
> nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
>
> nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> sizeof(args), 0, false);

Here is the new stack trace:

[ 1112.488211] nouveau: loading out-of-tree module taints kernel.
[ 1112.494763] nouveau: module verification failed: signature and/or
required key missing - tainting kernel
[ 1112.534035] Failed to set up IOMMU for device 57000000.gpu;
retaining platform DMA ops
[ 1112.537536] nouveau 57000000.gpu: NVIDIA GM20B (12b000a1)
[ 1112.537587] nouveau 57000000.gpu: imem: using IOMMU
[ 1112.616677] ------------[ cut here ]------------
[ 1112.616820] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
[ 1112.616830] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
[ 1112.616688] WARNING: CPU: 0 PID: 388 at
/var/tmp/linux/drivers/gpu/drm/nouveau/nvkm/falcon/base.c:135
nvkm_falcon_pio_rd+0x150/0x2bc [nouveau]
[ 1112.617272] Modules linked in: nouveau(OE+) drm_ttm_helper ttm
snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill
ip_set nf_tables nfnetlink qrtr snd_soc_tegra_audio_graph_card
snd_soc_audio_graph_card snd_soc_simple_card_utils snd_soc_core
snd_hda_codec_hdmi snd_hda_tegra snd_compress snd_hda_codec ac97_bus
snd_hda_core snd_pcm_dmaengine snd_hwdep snd_seq snd_seq_device sunrpc
snd_pcm usb_conn_gpio snd_timer snd max77620_thermal tegra_xudc
tegra_soctherm udc_core soundcore cpufreq_dt at24 vfat fat zram r8152
mii panel_simple mmc_block tegra_drm drm_dp_aux_bus drm_display_helper
rtc_max77686 lp855x_bl crct10dif_ce cec polyval_ce polyval_generic
ghash_ce gpio_keys sdhci_tegra xhci_tegra sdhci_pltfm sdhci
phy_tegra_xusb rtc_tegra cqhci ahci_tegra host1x tegra210_emc
i2c_tegra ip6_tables
[ 1112.617430]  ip_tables fuse
[ 1112.617440] CPU: 0 PID: 388 Comm: kworker/0:4 Tainted: G
OE     -------  ---  6.2.0-0.rc4.31.fc38.aarch64 #1
[ 1112.617446] Hardware name: nvidia,p2371-2180 NVIDIA
P2371-2180/NVIDIA P2371-2180, BIOS 2022.10 10/01/2022
[ 1112.617452] Workqueue: events nvkm_pmu_recv [nouveau]
[ 1112.617934] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[ 1112.617940] pc : nvkm_falcon_pio_rd+0x150/0x2bc [nouveau]
[ 1112.618418] nouveau 57000000.gpu: DRM: MM: using COPY for buffer copies
[ 1112.618525] lr : nvkm_falcon_pio_rd+0x50/0x2bc [nouveau]
[ 1112.619057] sp : ffff80000bf13c40
[ 1112.619060] x29: ffff80000bf13c50 x28: 0000000000000000 x27: 00000000000=
00000
[ 1112.619070] x26: ffff8000553f3d70 x25: ffff0000b04704b8 x24: 00000000000=
00000
[ 1112.619079] x23: ffff8000554800a0 x22: 0000000000000000 x21: ffff80000bf=
13d56
[ 1112.619086] x20: 000000000000002a x19: 0000000000000001 x18: 00000000000=
00000
[ 1112.619093] x17: 000000040044ffff x16: ffff8000091f53b0 x15: 00000000000=
00000
[ 1112.619100] x14: 0000000000000000 x13: 0000000000000030 x12: 01010101010=
10101
[ 1112.619108] x11: 7f7f7f7f7f7f7f7f x10: fefefefefefefeff x9 : ffff8000552=
cc224
[ 1112.619115] x8 : ffff0000b0470420 x7 : 0000000000000000 x6 : 00000000000=
0002a
[ 1112.619123] x5 : 0000000000000000 x4 : ffff80005540b7c8 x3 : ffff0000b04=
70408
[ 1112.619130] x2 : ffff0000b0470420 x1 : ffff0000b0470408 x0 : 00000000000=
00003
[ 1112.619138] Call trace:
[ 1112.619141]  nvkm_falcon_pio_rd+0x150/0x2bc [nouveau]
[ 1112.619756]  nvkm_falcon_msgq_pop+0x90/0x1c0 [nouveau]
[ 1112.620313]  nvkm_falcon_msgq_recv_initmsg+0xd4/0x1f4 [nouveau]
[ 1112.620877]  gm20b_pmu_initmsg+0x3c/0xd4 [nouveau]
[ 1112.621418]  gm20b_pmu_recv+0x30/0x80 [nouveau]
[ 1112.622004]  nvkm_pmu_recv+0x24/0x30 [nouveau]
[ 1112.622547]  process_one_work+0x1e8/0x480
[ 1112.622559]  worker_thread+0x74/0x410
[ 1112.622564]  kthread+0xe8/0xf4
[ 1112.622568]  ret_from_fork+0x10/0x20
[ 1112.622577] ---[ end trace 0000000000000000 ]---
[ 1112.622696] nouveau 57000000.gpu: pmu: unexpected init message size 0 vs=
 42
[ 1112.622708] nouveau 57000000.gpu: pmu: error parsing init message: -22
[ 1112.623365] [drm] Initialized nouveau 1.3.1 20120801 for
57000000.gpu on minor 1
[ 1113.688183] nouveau 57000000.gpu: pmu:hpq: timeout waiting for queue rea=
dy
[ 1113.688246] nouveau 57000000.gpu: gr: init failed, -110
