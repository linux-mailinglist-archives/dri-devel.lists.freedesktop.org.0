Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F68497D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 11:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506611124B0;
	Mon,  5 Feb 2024 10:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kaL1qTfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49A1124AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707129105;
 bh=XQexuZEM0XZt/R4uE5QEQACMzT69Shwrvo/4oWqHkP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kaL1qTfsCenDXPTAEuRIxgT5cWpSS30CG99+C0OWe3wBY/d3VbCK9ls2Y8G/8e2lm
 A+1YSuryIUEGZj/2fyfBLr4ufmxlF0px2yZx2D+/cFjTHllQzA9rVN1SMYj1fhh15v
 LXmB5XAzG66tPB+/9J0bfo9p6fxqN9dpJklLrjuY/Fx3aq3vV8y5JJhRTTQ66SzG39
 UG4e1T2Njqqi/H7+9fCuZtEexSk2bG3ymbBMWclgTbaSso+U9vfpkadY2MjtzBf0tF
 DQAU2bdbYPPvvL/4oC1TS0/RgAKg9lCmXYlfnW+3pbIKGL77JjZytPNAW1HKMq33+M
 n6iIbDReQRGuA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 720CE3781FEF;
 Mon,  5 Feb 2024 10:31:44 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:31:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, Tatsuyuki
 Ishi <ishitatsuyuki@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>,
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Ketil Johnsen <ketil.johnsen@arm.com>, Liviu
 Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240205113143.0a8808d8@collabora.com>
In-Reply-To: <82b39cc1-ac66-487d-ac78-1fe596cdfd98@redhat.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
 <20240129114147.43e5b865@collabora.com>
 <1554e55.29c.18d71ae9b6c.Coremail.andyshrk@163.com>
 <20240205100321.0321a208@collabora.com>
 <82b39cc1-ac66-487d-ac78-1fe596cdfd98@redhat.com>
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

On Mon, 5 Feb 2024 10:54:05 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> On 2/5/24 10:03, Boris Brezillon wrote:
> > +Danilo for the panthor gpuvm-needs update.
> >=20
> > On Sun, 4 Feb 2024 09:14:44 +0800 (CST)
> > "Andy Yan" <andyshrk@163.com> wrote:
> >  =20
> >> Hi Boris=EF=BC=9A
> >> I saw this warning sometimes=EF=BC=88Run on a armbain based bookworm=
=EF=BC=89=EF=BC=8Cnot sure is a know issue or something else=E3=80=82
> >> [15368.293031] systemd-journald[715]: Received client request to relin=
quish /var/log/journal/1bc4a340506142af9bd31a6a3d2170ba access.
> >> [37743.040737] ------------[ cut here ]------------
> >> [37743.040764] panthor fb000000.gpu: drm_WARN_ON(shmem->pages_use_coun=
t)
> >> [37743.040890] WARNING: CPU: 2 PID: 5702 at drivers/gpu/drm/drm_gem_sh=
mem_helper.c:158 drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> >> [37743.040929] Modules linked in: joydev rfkill sunrpc lz4hc lz4 zram =
binfmt_misc hantro_vpu crct10dif_ce v4l2_vp9 v4l2_h264 snd_soc_simple_ampli=
fier v4l2_mem2mem videobuf2_dma_contig snd_soc_es8328_i2c videobuf2_memops =
rk_crypto2 snd_soc_es8328 videobuf2_v4l2 sm3_generic videodev crypto_engine=
 sm3 rockchip_rng videobuf2_common nvmem_rockchip_otp snd_soc_rockchip_i2s_=
tdm snd_soc_hdmi_codec snd_soc_simple_card mc snd_soc_simple_card_utils snd=
_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd sou=
ndcore dm_mod ip_tables x_tables autofs4 dw_hdmi_qp_i2s_audio dw_hdmi_qp_ce=
c rk808_regulator rockchipdrm dw_mipi_dsi dw_hdmi_qp dw_hdmi analogix_dp dr=
m_dma_helper fusb302 display_connector rk8xx_spi drm_display_helper phy_roc=
kchip_snps_pcie3 phy_rockchip_samsung_hdptx_hdmi panthor tcpm rk8xx_core ce=
c drm_gpuvm gpu_sched drm_kms_helper drm_shmem_helper drm_exec r8169 drm pw=
m_bl adc_keys
> >> [37743.041108] CPU: 2 PID: 5702 Comm: kworker/u16:8 Not tainted 6.8.0-=
rc1-edge-rockchip-rk3588 #2
> >> [37743.041115] Hardware name: Rockchip RK3588 EVB1 V10 Board (DT)
> >> [37743.041120] Workqueue: panthor-cleanup panthor_vm_bind_job_cleanup_=
op_ctx_work [panthor]
> >> [37743.041151] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS B=
TYPE=3D--)
> >> [37743.041157] pc : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> >> [37743.041169] lr : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> >> [37743.041181] sp : ffff80008d37bcc0
> >> [37743.041184] x29: ffff80008d37bcc0 x28: ffff800081d379c0 x27: ffff80=
0081d37000
> >> [37743.041196] x26: ffff00019909a280 x25: ffff00019909a2c0 x24: ffff00=
01017a4c05
> >> [37743.041206] x23: dead000000000100 x22: dead000000000122 x21: ffff00=
01627ac1a0
> >> [37743.041217] x20: 0000000000000000 x19: ffff0001627ac000 x18: 000000=
0000000000
> >> [37743.041227] x17: 000000040044ffff x16: 005000f2b5503510 x15: ffffff=
fffff91b77
> >> [37743.041238] x14: 0000000000000001 x13: 00000000000003c5 x12: 000000=
00ffffffea
> >> [37743.041248] x11: 00000000ffffdfff x10: 00000000ffffdfff x9 : ffff80=
0081e0e818
> >> [37743.041259] x8 : 000000000002ffe8 x7 : c0000000ffffdfff x6 : 000000=
00000affa8
> >> [37743.041269] x5 : 0000000000001fff x4 : 0000000000000000 x3 : ffff80=
00819a6008
> >> [37743.041279] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00=
018465e900
> >> [37743.041290] Call trace:
> >> [37743.041293]  drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
> >> [37743.041306]  panthor_gem_free_object+0x24/0xa0 [panthor]
> >> [37743.041321]  drm_gem_object_free+0x1c/0x30 [drm]
> >> [37743.041452]  panthor_vm_bo_put+0xc4/0x12c [panthor]
> >> [37743.041475]  panthor_vm_cleanup_op_ctx.constprop.0+0xb0/0x104 [pant=
hor]
> >> [37743.041491]  panthor_vm_bind_job_cleanup_op_ctx_work+0x28/0xd0 [pan=
thor] =20
> >=20
> > Ok, I think I found the culprit: there's a race between
> > the drm_gpuvm_bo_put() call in panthor_vm_bo_put() and the list
> > iteration done by drm_gpuvm_prepare_objects(). Because we're not
> > setting DRM_GPUVM_RESV_PROTECTED, the code goes through the 'lockless'
> > iteration loop, and takes/release a vm_bo ref at each iteration. This
> > means our 'were we the last vm_bo user?' test in panthor_vm_bo_put()
> > might return false even if we were actually the last user, and when
> > for_each_vm_bo_in_list() releases the ref it acquired, it not only leaks
> > the pin reference, thus leaving GEM pages pinned (which explains this
> > WARN_ON() splat), but it also calls drm_gpuvm_bo_destroy() in a path
> > where we don't hold the GPUVA list lock, which is bad. =20
>=20
> IIUC, GPUVM generally behaves correctly. It's just that the return value
> of drm_gpuvm_bo_put() needs to be treated with care.
>=20
> Maybe we should extend c50a291d621a ("drm/gpuvm: Let drm_gpuvm_bo_put()
> report when the vm_bo object is destroyed") by a note explaining this
> unexpected case,

I can do that.

> or, if not required anymore, simply revert the patch.

Having drm_gpuvm_bo_put() reflect when it released the last ref is
definitely needed in panthor, it's just that it can't be trusted if
there's no lock protecting against concurrent gpuvm lockless list
iterations, because of the get/put dance that happens here.

>=20
> >=20
> > Long story short, I'll have to use DRM_GPUVM_RESV_PROTECTED, which is
> > fine because I'm deferring vm_bo removal to a work where taking the VM
> > resv lock is allowed. Since I was the one asking for this lockless
> > iterator in the first place, I wonder if we should kill that and make
> > DRM_GPUVM_RESV_PROTECTED the default (this would greatly simplify
> > the code). AFAICT, The PowerVR driver shouldn't be impacted because it's
> > using drm_gpuvm in synchronous mode only, and Xe already uses the
> > resv-protected mode. That leaves Nouveau, but IIRC, it's also doing VM
> > updates in the ioctl path.
> >=20
> > Danilo, any opinions? =20
>=20
> I agree that we should remove it once we got enough evidence that updating
> the VA space in the asynchronous path isn't going to be a thing. I'm not
> entirely sure, whether we'll attempt to re-work Nouveau, but I'd like to =
try
> this approach with Nova. Hence, I'd still like to leave it in for a while.

Oh, that' has nothing to do with updating the VM RB tree in the async
path. I keep doing it this way in panthor if that's what you're worried
about. The only thing I defer to a workqueue is the gpuvm_bo_put() call,
because this one needs to do all sort of locking that are not allowed
in the dma-signalling path.

>=20
> OOC, knowing that you went a little back and forth with one or the other
> approach, last I heard was that using DRM_GPUVM_RESV_PROTECTED didn't work
> out well with shmem buffers. How did you fix it?

The problem I had with the shmem GEM implementation was not related to
DRM_GPUVM_RESV_PROTECTED, it was related to the fact I wasn't able to
take an extra pages ref for the prev/next remap blocks in the async VM
operation path, because drm_gem_shmem_{get,pin}_pages take the BO resv
lock. The idea to solve that was to use atomic refcounts and avoid
taking the lock when refcnt > 1, which we did, but for a different
reason (not merged yet, but it's part of [1] which should land soon).

In the meantime, I realized the vm_bo concept could solve my problem.
If, instead of having each drm_gpuva own a pages ref, I make the
drm_gpuvm_bo owns this ref, I no longer need to call
drm_gem_shmem_{get,pin}_pages() in the async update path.
All I need to do is acquire the pages ref in the ioctl path, when
obtaining a vm_bo that didn't exist previously
(drm_gpuvm_bo_obtain_prealloc() allows us to figure out when this is a
new vm_bo vs when this is an pre-existing one). This is the very reason
I need to know when a vm_bo is destroyed, because when that happens, I
also need to release the pages ref owned by this vm_bo.

Regarding DRM_GPUVM_RESV_PROTECTED, I honestly don't remember where all
the churn around lockless list iteration came from, but I checked, and
DRM_GPUVM_RESV_PROTECTED only matters for:

- objects resv preparation, which we do with the VM resv lock held in
  the ioctl path anyway
- VM BO destruction (drm_gpuvm_bo_put() calls leading to a
  drm_gpuvm_bo_destroy()), which we now defer to a workqueue, where we
  can take the VM resv lock and the GPUVA list lock
- BO validation, which we don't use yet because we don't have
  mem-reclaim hooked up, but once we have it, it will happen in the
  ioctl path too

So, from panthor's perspective, we should be good without the
vm-resv-lockless stuff.

[1]https://lore.kernel.org/lkml/20240105184624.508603-1-dmitry.osipenko@col=
labora.com/T/
