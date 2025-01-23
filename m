Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5ADA1A056
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91D10E7A0;
	Thu, 23 Jan 2025 09:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="c7mOIVzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87FC10E79C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:07:10 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so371450966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1737623229; x=1738228029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HSlmTn1n1uG4G+haZMwggDDjn2uQ4YQcK0rxL3YhG4=;
 b=c7mOIVzqiyMfvaNy96LbyfJl2dFtxQETdUNwBGfhfPTNbOCF2/KimgUeBV97tsNsEi
 V1aDz7KR5yqDKNB5k66SIXQA8qq1Hd5hDTxRlXWK6UOs5/uB9cFP2vVdm9EGd8n0AAig
 gfz4+poscHiAjtASMBt1bp9Ghr6GkYARBDuR22xtup7REHFQcnemzf4VeoZNxvvc4Sfl
 kVqO/JDTGR/Cs//OxeHUJPwajiWeDd+t7ibC04aFQfoXCY+EaIy2m6P4Gnt7zPMIF9uM
 82LQHR8OT82ZgWrvMDKRkJPVtUxOzZYIecWktz1xMVwbYUfmda2IJetTV5iE6A0bVS/U
 qB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737623229; x=1738228029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HSlmTn1n1uG4G+haZMwggDDjn2uQ4YQcK0rxL3YhG4=;
 b=itMnYPqkvLyQONUNkEdH4Ar4TEcDwX+yQ2m5FkPNczV+xUYKYBPNWbbIfr+VNHxQFQ
 bTl+WWABIcAorN++AhaCn5PzHSavrq7Bh5uile7zab4t27BTKcN09St5JawiVZEXNS+h
 so7esOip+1wYYRX8fluIViT4ztymYhVwB8SJERJqkrGro6E9bTgpD4iDE2GypXMz/A+x
 cqtI2Khkrx6nI1EnpvyQzPO77b2noQXX9uO7jSf7oOjIGnjJF6/KaRDDyVWE8apFinPU
 n/DLm1uK8QagRvOdkXh/aqg+3fdmqu7xKykJPb2JRBS80tSNttXOasAGSJTR6Ivb03SL
 HUXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOyseCDPP8yYp2EMUegy04HL3GDqBoYjrl8TFv+GfGssw4mm0PGyUOn6LKvx0Sm6FDl30VuyoxjPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+ZWzQlT6fqi/re9fqHBdidGHZybyE8NvOiCCxb4NbcnNjQQdR
 LMnM6xhovK3/PggfWgdRgvOSrP2W4KzSwqhqnaNyHzfwhtLEKn7OnEWLI0cn4p06aWkFNC/RV4X
 mU2ZKWUJpNOLO/Kfq/3XtS7yfWK2IVPUCIUAQ0A==
X-Gm-Gg: ASbGncsW7k1qxzsfKpdUZ06z3+KcqfbuvcHMOQ3lpE4DK65woLhEdle9MSalks8bHVa
 fOb7ZSU3ovdeI0TaRUCBl/nhFnETzOFCNAqmfVppqAKOrvC3ys9/gisfM3QJTvkix3zjbXirMI6
 OBuPHx5UFvDH+q28rDYg==
X-Google-Smtp-Source: AGHT+IF/4fvyI6uXsZSV+GcNNO7v3YZULA/J24C4ZVpMCDvfwke4PwVZWzA2T4Ntlrka3PxWu5Pr3iBWSbfcp3Ufqro=
X-Received: by 2002:a17:907:7291:b0:ab3:a515:c41 with SMTP id
 a640c23a62f3a-ab6629c61f6mr199943066b.16.1737623229011; Thu, 23 Jan 2025
 01:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20250123012403.20447-1-mcanal@igalia.com>
 <b60d2a9a374a278256fe290a2a389f59d3062754.camel@igalia.com>
In-Reply-To: <b60d2a9a374a278256fe290a2a389f59d3062754.camel@igalia.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 23 Jan 2025 09:06:57 +0000
X-Gm-Features: AbW1kvYGDAHM3M5b2QiGnQC2QYHyamPOXF5uTlwuSZlFUpcE5zTb2Qb3Dtw66wg
Message-ID: <CAMEGJJ0=0N2m+GDXF5VU5ZcmzHwZY=gWttk=TtFzK51DNO=gCw@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Assign job pointer to NULL before signaling the
 fence
To: Iago Toral <itoral@igalia.com>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this, Ma=C3=ADra.

Tested-by: Phil Elwell <phil@raspberrypi.com>

On Thu, 23 Jan 2025 at 07:12, Iago Toral <itoral@igalia.com> wrote:
>
> Looks good to me:
>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>
> El mi=C3=A9, 22-01-2025 a las 22:24 -0300, Ma=C3=ADra Canal escribi=C3=B3=
:
> > In commit e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL
> > after job completion"), we introduced a change to assign the job
> > pointer
> > to NULL after completing a job, indicating job completion.
> >
> > However, this approach created a race condition between the DRM
> > scheduler workqueue and the IRQ execution thread. As soon as the
> > fence is
> > signaled in the IRQ execution thread, a new job starts to be
> > executed.
> > This results in a race condition where the IRQ execution thread sets
> > the
> > job pointer to NULL simultaneously as the `run_job()` function
> > assigns
> > a new job to the pointer.
> >
> > This race condition can lead to a NULL pointer dereference if the IRQ
> > execution thread sets the job pointer to NULL after `run_job()`
> > assigns
> > it to the new job. When the new job completes and the GPU emits an
> > interrupt, `v3d_irq()` is triggered, potentially causing a crash.
> >
> > [  466.310099] Unable to handle kernel NULL pointer dereference at
> > virtual address 00000000000000c0
> > [  466.318928] Mem abort info:
> > [  466.321723]   ESR =3D 0x0000000096000005
> > [  466.325479]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [  466.330807]   SET =3D 0, FnV =3D 0
> > [  466.333864]   EA =3D 0, S1PTW =3D 0
> > [  466.337010]   FSC =3D 0x05: level 1 translation fault
> > [  466.341900] Data abort info:
> > [  466.344783]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> > [  466.350285]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > [  466.355350]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > [  466.360677] user pgtable: 4k pages, 39-bit VAs,
> > pgdp=3D0000000089772000
> > [  466.367140] [00000000000000c0] pgd=3D0000000000000000,
> > p4d=3D0000000000000000, pud=3D0000000000000000
> > [  466.375875] Internal error: Oops: 0000000096000005 [#1] PREEMPT
> > SMP
> > [  466.382163] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
> > snd_seq snd_seq_device algif_hash algif_skcipher af_alg bnep
> > binfmt_misc vc4 snd_soc_hdmi_codec drm_display_helper cec
> > brcmfmac_wcc spidev rpivid_hevc(C) drm_client_lib brcmfmac hci_uart
> > drm_dma_helper pisp_be btbcm brcmutil snd_soc_core aes_ce_blk
> > v4l2_mem2mem bluetooth aes_ce_cipher snd_compress
> > videobuf2_dma_contig ghash_ce cfg80211 gf128mul snd_pcm_dmaengine
> > videobuf2_memops ecdh_generic sha2_ce ecc videobuf2_v4l2 snd_pcm v3d
> > sha256_arm64 rfkill videodev snd_timer sha1_ce libaes gpu_sched snd
> > videobuf2_common sha1_generic drm_shmem_helper mc rp1_pio
> > drm_kms_helper raspberrypi_hwmon spi_bcm2835 gpio_keys i2c_brcmstb
> > rp1 raspberrypi_gpiomem rp1_mailbox rp1_adc nvmem_rmem
> > uio_pdrv_genirq uio i2c_dev drm ledtrig_pattern
> > drm_panel_orientation_quirks backlight fuse dm_mod ip_tables x_tables
> > ipv6
> > [  466.458429] CPU: 0 UID: 1000 PID: 2008 Comm: chromium Tainted:
> > G         C         6.13.0-v8+ #18
> > [  466.467336] Tainted: [C]=3DCRAP
> > [  466.470306] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> > [  466.476157] pstate: 404000c9 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS
> > BTYPE=3D--)
> > [  466.483143] pc : v3d_irq+0x118/0x2e0 [v3d]
> > [  466.487258] lr : __handle_irq_event_percpu+0x60/0x228
> > [  466.492327] sp : ffffffc080003ea0
> > [  466.495646] x29: ffffffc080003ea0 x28: ffffff80c0c94200 x27:
> > 0000000000000000
> > [  466.502807] x26: ffffffd08dd81d7b x25: ffffff80c0c94200 x24:
> > ffffff8003bdc200
> > [  466.509969] x23: 0000000000000001 x22: 00000000000000a7 x21:
> > 0000000000000000
> > [  466.517130] x20: ffffff8041bb0000 x19: 0000000000000001 x18:
> > 0000000000000000
> > [  466.524291] x17: ffffffafadfb0000 x16: ffffffc080000000 x15:
> > 0000000000000000
> > [  466.531452] x14: 0000000000000000 x13: 0000000000000000 x12:
> > 0000000000000000
> > [  466.538613] x11: 0000000000000000 x10: 0000000000000000 x9 :
> > ffffffd08c527eb0
> > [  466.545777] x8 : 0000000000000000 x7 : 0000000000000000 x6 :
> > 0000000000000000
> > [  466.552941] x5 : ffffffd08c4100d0 x4 : ffffffafadfb0000 x3 :
> > ffffffc080003f70
> > [  466.560102] x2 : ffffffc0829e8058 x1 : 0000000000000001 x0 :
> > 0000000000000000
> > [  466.567263] Call trace:
> > [  466.569711]  v3d_irq+0x118/0x2e0 [v3d] (P)
> > [  466.573826]  __handle_irq_event_percpu+0x60/0x228
> > [  466.578546]  handle_irq_event+0x54/0xb8
> > [  466.582391]  handle_fasteoi_irq+0xac/0x240
> > [  466.586498]  generic_handle_domain_irq+0x34/0x58
> > [  466.591128]  gic_handle_irq+0x48/0xd8
> > [  466.594798]  call_on_irq_stack+0x24/0x58
> > [  466.598730]  do_interrupt_handler+0x88/0x98
> > [  466.602923]  el0_interrupt+0x44/0xc0
> > [  466.606508]  __el0_irq_handler_common+0x18/0x28
> > [  466.611050]  el0t_64_irq_handler+0x10/0x20
> > [  466.615156]  el0t_64_irq+0x198/0x1a0
> > [  466.618740] Code: 52800035 3607faf3 f9442e80 52800021 (f9406018)
> > [  466.624853] ---[ end trace 0000000000000000 ]---
> > [  466.629483] Kernel panic - not syncing: Oops: Fatal exception in
> > interrupt
> > [  466.636384] SMP: stopping secondary CPUs
> > [  466.640320] Kernel Offset: 0x100c400000 from 0xffffffc080000000
> > [  466.646259] PHYS_OFFSET: 0x0
> > [  466.649141] CPU features: 0x100,00000170,00901250,0200720b
> > [  466.654644] Memory Limit: none
> > [  466.657706] ---[ end Kernel panic - not syncing: Oops: Fatal
> > exception in interrupt ]---
> >
> > Fix the crash by assigning the job pointer to NULL before signaling
> > the
> > fence. This ensures that the job pointer is cleared before any new
> > job
> > starts execution, preventing the race condition and the NULL pointer
> > dereference crash.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL
> > after job completion")
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_irq.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> > b/drivers/gpu/drm/v3d/v3d_irq.c
> > index da203045df9b..72b6a119412f 100644
> > --- a/drivers/gpu/drm/v3d/v3d_irq.c
> > +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> > @@ -107,8 +107,10 @@ v3d_irq(int irq, void *arg)
> >
> >               v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
> >               trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
> > -             dma_fence_signal(&fence->base);
> > +
> >               v3d->bin_job =3D NULL;
> > +             dma_fence_signal(&fence->base);
> > +
> >               status =3D IRQ_HANDLED;
> >       }
> >
> > @@ -118,8 +120,10 @@ v3d_irq(int irq, void *arg)
> >
> >               v3d_job_update_stats(&v3d->render_job->base,
> > V3D_RENDER);
> >               trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
> > -             dma_fence_signal(&fence->base);
> > +
> >               v3d->render_job =3D NULL;
> > +             dma_fence_signal(&fence->base);
> > +
> >               status =3D IRQ_HANDLED;
> >       }
> >
> > @@ -129,8 +133,10 @@ v3d_irq(int irq, void *arg)
> >
> >               v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
> >               trace_v3d_csd_irq(&v3d->drm, fence->seqno);
> > -             dma_fence_signal(&fence->base);
> > +
> >               v3d->csd_job =3D NULL;
> > +             dma_fence_signal(&fence->base);
> > +
> >               status =3D IRQ_HANDLED;
> >       }
> >
> > @@ -167,8 +173,10 @@ v3d_hub_irq(int irq, void *arg)
> >
> >               v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
> >               trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
> > -             dma_fence_signal(&fence->base);
> > +
> >               v3d->tfu_job =3D NULL;
> > +             dma_fence_signal(&fence->base);
> > +
> >               status =3D IRQ_HANDLED;
> >       }
> >
>
