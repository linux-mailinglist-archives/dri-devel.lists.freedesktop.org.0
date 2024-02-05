Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC618495CF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 10:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946EF11244F;
	Mon,  5 Feb 2024 09:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EUQFD3rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43111244F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707123804;
 bh=Zzq0/A0jr9NimOuF2Eo/imvq6yaUdPJeA7v4+MvQ5Xw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EUQFD3rhFRAU1wHJbfePF2zkpf7n9rGXFAunTkjBO1DNupZEKhpx+Cf+HayyxKQUN
 Q3DDFWx9erk0XdYKmnbUFKlRhE2HTnvkS/OXu/LfWNKzTHFMxbWi1loZMqW5ZMyIMB
 h6KT48H9aBl0TiKqQxlt0FNB2jyXtNm1IkPh6X3UivCplUYnC35v6wVQIeT5ZcbA39
 De/WVo+z0PXzAeUGwp7RrMndQ8n4trXNZC26jnJo+Z1f66uE8UNfHgXKEoGfoMFJnu
 90SYTqvBr8JPe13RklGl/SoZAtSguUNKoairrnSwRVpHDoX/11OTdnB9jG2biwr4qU
 7pEm6F50fenQg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 11B263780029;
 Mon,  5 Feb 2024 09:03:23 +0000 (UTC)
Date: Mon, 5 Feb 2024 10:03:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Andy Yan" <andyshrk@163.com>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, "Tatsuyuki Ishi"
 <ishitatsuyuki@gmail.com>, "Nicolas Boichat" <drinkcat@chromium.org>,
 kernel@collabora.com, "Daniel Stone" <daniels@collabora.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Ketil Johnsen"
 <ketil.johnsen@arm.com>, "Liviu Dudau" <Liviu.Dudau@arm.com>, "Steven
 Price" <steven.price@arm.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chris Diamand"
 <chris.diamand@foss.arm.com>, "Marty E . Plummer" <hanetzer@startmail.com>,
 "Robin Murphy" <robin.murphy@arm.com>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240205100321.0321a208@collabora.com>
In-Reply-To: <1554e55.29c.18d71ae9b6c.Coremail.andyshrk@163.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
 <20240129114147.43e5b865@collabora.com>
 <1554e55.29c.18d71ae9b6c.Coremail.andyshrk@163.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Danilo for the panthor gpuvm-needs update.

On Sun, 4 Feb 2024 09:14:44 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi Boris=EF=BC=9A
> I saw this warning sometimes=EF=BC=88Run on a armbain based bookworm=EF=
=BC=89=EF=BC=8Cnot sure is a know issue or something else=E3=80=82
> [15368.293031] systemd-journald[715]: Received client request to relinqui=
sh /var/log/journal/1bc4a340506142af9bd31a6a3d2170ba access.
> [37743.040737] ------------[ cut here ]------------
> [37743.040764] panthor fb000000.gpu: drm_WARN_ON(shmem->pages_use_count)
> [37743.040890] WARNING: CPU: 2 PID: 5702 at drivers/gpu/drm/drm_gem_shmem=
_helper.c:158 drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> [37743.040929] Modules linked in: joydev rfkill sunrpc lz4hc lz4 zram bin=
fmt_misc hantro_vpu crct10dif_ce v4l2_vp9 v4l2_h264 snd_soc_simple_amplifie=
r v4l2_mem2mem videobuf2_dma_contig snd_soc_es8328_i2c videobuf2_memops rk_=
crypto2 snd_soc_es8328 videobuf2_v4l2 sm3_generic videodev crypto_engine sm=
3 rockchip_rng videobuf2_common nvmem_rockchip_otp snd_soc_rockchip_i2s_tdm=
 snd_soc_hdmi_codec snd_soc_simple_card mc snd_soc_simple_card_utils snd_so=
c_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundc=
ore dm_mod ip_tables x_tables autofs4 dw_hdmi_qp_i2s_audio dw_hdmi_qp_cec r=
k808_regulator rockchipdrm dw_mipi_dsi dw_hdmi_qp dw_hdmi analogix_dp drm_d=
ma_helper fusb302 display_connector rk8xx_spi drm_display_helper phy_rockch=
ip_snps_pcie3 phy_rockchip_samsung_hdptx_hdmi panthor tcpm rk8xx_core cec d=
rm_gpuvm gpu_sched drm_kms_helper drm_shmem_helper drm_exec r8169 drm pwm_b=
l adc_keys
> [37743.041108] CPU: 2 PID: 5702 Comm: kworker/u16:8 Not tainted 6.8.0-rc1=
-edge-rockchip-rk3588 #2
> [37743.041115] Hardware name: Rockchip RK3588 EVB1 V10 Board (DT)
> [37743.041120] Workqueue: panthor-cleanup panthor_vm_bind_job_cleanup_op_=
ctx_work [panthor]
> [37743.041151] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [37743.041157] pc : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> [37743.041169] lr : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> [37743.041181] sp : ffff80008d37bcc0
> [37743.041184] x29: ffff80008d37bcc0 x28: ffff800081d379c0 x27: ffff80008=
1d37000
> [37743.041196] x26: ffff00019909a280 x25: ffff00019909a2c0 x24: ffff00010=
17a4c05
> [37743.041206] x23: dead000000000100 x22: dead000000000122 x21: ffff00016=
27ac1a0
> [37743.041217] x20: 0000000000000000 x19: ffff0001627ac000 x18: 000000000=
0000000
> [37743.041227] x17: 000000040044ffff x16: 005000f2b5503510 x15: fffffffff=
ff91b77
> [37743.041238] x14: 0000000000000001 x13: 00000000000003c5 x12: 00000000f=
fffffea
> [37743.041248] x11: 00000000ffffdfff x10: 00000000ffffdfff x9 : ffff80008=
1e0e818
> [37743.041259] x8 : 000000000002ffe8 x7 : c0000000ffffdfff x6 : 000000000=
00affa8
> [37743.041269] x5 : 0000000000001fff x4 : 0000000000000000 x3 : ffff80008=
19a6008
> [37743.041279] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00018=
465e900
> [37743.041290] Call trace:
> [37743.041293]  drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> [37743.041306]  panthor_gem_free_object+0x24/0xa0 [panthor]
> [37743.041321]  drm_gem_object_free+0x1c/0x30 [drm]
> [37743.041452]  panthor_vm_bo_put+0xc4/0x12c [panthor]
> [37743.041475]  panthor_vm_cleanup_op_ctx.constprop.0+0xb0/0x104 [panthor]
> [37743.041491]  panthor_vm_bind_job_cleanup_op_ctx_work+0x28/0xd0 [pantho=
r]

Ok, I think I found the culprit: there's a race between
the drm_gpuvm_bo_put() call in panthor_vm_bo_put() and the list
iteration done by drm_gpuvm_prepare_objects(). Because we're not
setting DRM_GPUVM_RESV_PROTECTED, the code goes through the 'lockless'
iteration loop, and takes/release a vm_bo ref at each iteration. This
means our 'were we the last vm_bo user?' test in panthor_vm_bo_put()
might return false even if we were actually the last user, and when
for_each_vm_bo_in_list() releases the ref it acquired, it not only leaks
the pin reference, thus leaving GEM pages pinned (which explains this
WARN_ON() splat), but it also calls drm_gpuvm_bo_destroy() in a path
where we don't hold the GPUVA list lock, which is bad.

Long story short, I'll have to use DRM_GPUVM_RESV_PROTECTED, which is
fine because I'm deferring vm_bo removal to a work where taking the VM
resv lock is allowed. Since I was the one asking for this lockless
iterator in the first place, I wonder if we should kill that and make
DRM_GPUVM_RESV_PROTECTED the default (this would greatly simplify
the code). AFAICT, The PowerVR driver shouldn't be impacted because it's
using drm_gpuvm in synchronous mode only, and Xe already uses the
resv-protected mode. That leaves Nouveau, but IIRC, it's also doing VM
updates in the ioctl path.

Danilo, any opinions?

Andy, I pushed a new version to the panthor-next [1] and
panthor-next+rk3588 [2] branches. The fix I'm talking about is [3], but
you probably want to consider taking all the fixups in your branch.

Regards,

Boris

[1]https://gitlab.freedesktop.org/panfrost/linux/-/commits/panthor-next
[2]https://gitlab.freedesktop.org/panfrost/linux/-/commits/panthor-next+rk3=
588
[3]https://gitlab.freedesktop.org/panfrost/linux/-/commit/df48c09662a403275=
e76e679ee004085badea7c1
