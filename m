Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE832848CA8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 11:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AFB112138;
	Sun,  4 Feb 2024 10:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZdYMXtp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AF112138
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707041279;
 bh=IpasPJyX7Wy5L9+LQX1kZ1CJbiGLZc88VvR4zLk/7ZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZdYMXtp6p+3ppw4a1N3DC+27UqhRsey3M45CEP5DWMChA7xbd+hXtIIg+7Hg1oiyS
 mtnM7EwyCoUZrvTESge5Yk24pKXbNAPEGfplQz98Q0HdEuD/QRcokW6ZGFfGMYuZ1X
 +j654I7lwCfMrYxYFtYE/WY24kHShUKIlfXIc4nZQas6kcT6XGb3Sem+il50c0j9+X
 7pg2xo8DgsY/A2y7SDu/wYh1RGdSZgw4B9a0w9UGR7hWpLLnklAXz+UbkREmmAAz6S
 UfVNfiJnihsDKamFSb9ui9APulkjp0L7p6DPYgSDslpJgdB6/Dq48Te2Ju3DaTPFLh
 pHMP+PTsV3bAQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29B5B37809D1;
 Sun,  4 Feb 2024 10:07:58 +0000 (UTC)
Date: Sun, 4 Feb 2024 11:07:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Andy Yan" <andyshrk@163.com>
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
Message-ID: <20240204110756.66ae5145@collabora.com>
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

On Sun, 4 Feb 2024 09:14:44 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi Boris=EF=BC=9A
> I saw this warning sometimes=EF=BC=88Run on a armbain based bookworm=EF=
=BC=89=EF=BC=8Cnot sure is a know issue or something else=E3=80=82

No it's not, and I didn't manage to reproduce locally. Looks like
you're using a 6.8 kernel, but my panthor-v4/next branches are still
based on drm-misc-next from 2 weeks ago, which was based on a 6.7
kernel. Can you share the kernel branch you're using?

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

I checked the _pin/_unpin calls in panthor, and they seem to be
balanced (we take a ref when we allocate a gpuvm_bo and release it
when the gpuvm_bo is gone). I wonder if something else is calling
_pin_pages() or _get_pages() without holding a GEM ref...

While investigating I found a double-cleanup in the code (see below)
which explains why those memset(0) were required in
panthor_vm_cleanup_op_ctx()), but I doubt it fixes your issue.

--->8---
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pantho=
r/panthor_mmu.c
index d3ce29cd0662..5606ab4d6289 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1085,17 +1085,12 @@ static void panthor_vm_cleanup_op_ctx(struct pantho=
r_vm_op_ctx *op_ctx,
        }
=20
        kfree(op_ctx->rsvd_page_tables.pages);
-       memset(&op_ctx->rsvd_page_tables, 0, sizeof(op_ctx->rsvd_page_table=
s));
=20
        if (op_ctx->map.vm_bo)
                panthor_vm_bo_put(op_ctx->map.vm_bo);
=20
-       memset(&op_ctx->map, 0, sizeof(op_ctx->map));
-
-       for (u32 i =3D 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++) {
+       for (u32 i =3D 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++)
                kfree(op_ctx->preallocated_vmas[i]);
-               op_ctx->preallocated_vmas[i] =3D NULL;
-       }
=20
        list_for_each_entry_safe(vma, tmp_vma, &op_ctx->returned_vmas, node=
) {
                list_del(&vma->node);
@@ -2382,7 +2377,6 @@ static void panthor_vm_bind_job_cleanup_op_ctx_work(s=
truct work_struct *work)
        struct panthor_vm_bind_job *job =3D
                container_of(work, struct panthor_vm_bind_job, cleanup_op_c=
tx_work);
=20
-       panthor_vm_cleanup_op_ctx(&job->ctx, job->vm);
        panthor_vm_bind_job_put(&job->base);
 }
