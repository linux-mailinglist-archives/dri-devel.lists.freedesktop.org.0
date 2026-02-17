Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ozuLOfwPlGnC/gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:51:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1C14910A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EFF10E44B;
	Tue, 17 Feb 2026 06:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Damfh5c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B2810E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 06:51:34 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-79430ef54c3so32008307b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1771311092;
 x=1771915892; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ro/Ix/D78k58OR+QaCM+MTSlbKVvnnix/BGFR38rHlo=;
 b=Damfh5c7K6/AHX+14+O0B5+Uyt8ALNAgG3zqrUvqYn9tPn/ZYgnCuURt+tTwXq3l+A
 HVkDBX1fdSOCqUb52NB22JDLHTI7Rh73sIsnmgUtzE5sTzTbQ48mAGgmnCIncjgN9aYp
 q893wSWamD3Ywhe8eRpHqZ8Ut6+VT5dBaCtBY2VJCsrMGYKVIsEehSLLbXkl+SA5CLuS
 TRU0Ccr24g4wljMJ7Xj1eFwt/XBzrqImgX3JZ/4cBedWJlzJR3yDUCs7JvtyFvmz0r/e
 zvh1OGsEykWMKWxyMhRIbhUseyNo3UzYvsydt2fV+uf9YpCoRCvHDFkt0kb2Hbxtm5Ly
 3MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771311092; x=1771915892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ro/Ix/D78k58OR+QaCM+MTSlbKVvnnix/BGFR38rHlo=;
 b=Us11lF6S4vWeCjPnAs0IHKmvjVMswcHQe5EvI9v764DaG5yBcjfYwhT1E9HmJRXU/S
 ZO8W51tYUJENbjoY2L3caPRESiUEWgCqLPIOZwdFnU6fBdlxht4YSx3UM3kvxDz5zimN
 s3phIFI1Ko9R8o9Xkhy/8k0ap7QPtKnBdDFz/8hRfAJ3xuquur89pa+UT5veFETRL2d6
 tftihyQX/Ytc1QycNBfLTI2Hnooo5KzdENvwBGYwzZVxNp4HZMOJ5nGTAjCQ8IEDf24x
 jpDGlCWSFQr1FNhbE3Es3jrDibjsi3t5sfKrMW3GEmdnjOoglnrGH4ehC+/yFn671As2
 2gZw==
X-Gm-Message-State: AOJu0Yz3g1iV3tk9VUILRLBOrnw4kk5t+WX0MyHbCHcC0pzlac1xhXbe
 GJGIopppmZt95PLgnyiFKOjUPudo1uo/JeECYwMGKDQIBWnyLPFQr5rOC8sd4foHNCyou/QTdhe
 PkWVYO8Y=
X-Gm-Gg: AZuq6aIZMHr7mldz88kUdnKX4Zj/51+jaMtcZK02KoAI2yLFRlzxs6M0TnlrUY/4Pta
 i9MbKEzn50xM/5sB6m7nbQcBu106B8qxV4OM1k1vtYv01pJnq6+7LjzHEbkewq+6h4K2oqmxMlC
 gdXAV9Mahtg3NVNpSUCtA5WOd7+rJz57BHrtIlrAj23xG/9ROdTrOfRxklcI8bF5Y/GflvWisI4
 6vVEt90PBmpWA4OhlBTn1dmgClEuyRIM3dH+6vN1KV2ZnNscB5FCNUPSl9jJ+dGBJ+1jo7RTeW7
 Z1hlPDHO0L1Hy8pw9basSw/lfiZ7STCy4PV3SGUOLN/RXOsWCR3JRdTBVddcwG5VdNOXsI44U9l
 aEpE7d4r11cPaMCxXHRpAOJPjofwTUlO5mfaFqzihiWJA+zlr++6lqpMIYbWgk3uTXaER4Mcmq9
 shVUx9wZQZgKs9dyEh2/XMeNAlMp6ZBuAcxXYCqmuY2qXhmB8B1jQcAvuoc0Jy/w==
X-Received: by 2002:a05:690c:f8f:b0:796:37bb:9eb2 with SMTP id
 00721157ae682-797ac4ddaabmr80487537b3.5.1771311092311; 
 Mon, 16 Feb 2026 22:51:32 -0800 (PST)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com.
 [74.125.224.48]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7966c16eb07sm112926807b3.7.2026.02.16.22.51.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 22:51:31 -0800 (PST)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so1720358d50.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 22:51:31 -0800 (PST)
X-Received: by 2002:a05:690e:4146:b0:64a:f927:b39e with SMTP id
 956f58d0204a3-64c21a44340mr7846444d50.20.1771311091307; Mon, 16 Feb 2026
 22:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20260216183819.99991-1-ross@r-sc.ca>
In-Reply-To: <20260216183819.99991-1-ross@r-sc.ca>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 17 Feb 2026 07:51:20 +0100
X-Gmail-Original-Message-ID: <CAAObsKAuFb70xf5CbxBFvenGRhf1pqzXCZQjRjSrpfoF1xvEKQ@mail.gmail.com>
X-Gm-Features: AZwV_QiO35vNjJS_Q8RKOOCmwf2TPRNSVkZSuIscp_mbWHoXDSeM-mluOkxsZKc
Message-ID: <CAAObsKAuFb70xf5CbxBFvenGRhf1pqzXCZQjRjSrpfoF1xvEKQ@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: Add per-task flags and interrupt mask for
 flexible job handling
To: Ross Cawston <ross@r-sc.ca>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 ogabbay@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 jeff.hugo@oss.qualcomm.com, jani.nikula@intel.com, me@brighamcampbell.com, 
 heiko@sntech.de
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[tomeuvizoso-net.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[tomeuvizoso.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross@r-sc.ca,m:linux-kernel@vger.kernel.org,m:ogabbay@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:jeff.hugo@oss.qualcomm.com,m:jani.nikula@intel.com,m:me@brighamcampbell.com,m:heiko@sntech.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,intel.com,brighamcampbell.com,sntech.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tomeu@tomeuvizoso.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[tomeuvizoso-net.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tomeu@tomeuvizoso.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,r-sc.ca:email]
X-Rspamd-Queue-Id: 17A1C14910A
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 7:38=E2=80=AFPM Ross Cawston <ross@r-sc.ca> wrote:
>
> The Rocket NPU supports multiple task types:
> - Convolutional workloads that use CNA, Core, and DPU blocks
> - Standalone post-processing (PPU) tasks such as pooling and element-wise=
 operations
> - Pipelined DPU=E2=86=92PPU workloads
>
> The current driver has several limitations that prevent correct execution=
 of
> non-convolutional workloads and multi-core operation:
>
> - CNA and Core S_POINTER registers are always initialized, re-arming them
>   with stale state from previous jobs and corrupting standalone DPU/PPU t=
asks.
> - Completion is hard-coded to wait only for DPU interrupts, causing PPU-o=
nly
>   or DPU=E2=86=92PPU pipeline jobs to time out.
> - Ping-pong mode is unconditionally enabled, which is unnecessary for
>   single-task jobs.
> - Non-zero cores hang because the vendor-specific "extra bit" (bit 28 =C3=
=97 core
>   index) in S_POINTER is not set; the BSP sets this via MMIO because user=
space
>   cannot know which core the scheduler will select.
> - Timeout and IRQ debugging information is minimal.
>
> This patch introduces two new per-task fields to struct rocket_task:
>
> - u32 int_mask: specifies which block completion interrupts signal task d=
one
>   (DPU_0|DPU_1 for convolutional/standalone DPU, PPU_0|PPU_1 for PPU task=
s).
>   Zero defaults to DPU_0|DPU_1 for backward compatibility.
> - u32 flags: currently used for ROCKET_TASK_NO_CNA_CORE to indicate stand=
alone
>   DPU/PPU tasks that must not touch CNA/Core state.
>
> Additional changes:
> - Only initialize CNA and Core S_POINTER (with the required per-core extr=
a bit)
>   when ROCKET_TASK_NO_CNA_CORE is not set.
> - Set the per-core extra bit via MMIO to fix hangs on non-zero cores.
> - Enable ping-pong mode only when the job contains multiple tasks.
> - Mask and clear interrupts according to the task's int_mask.
> - Accept both DPU and PPU completion interrupts in the IRQ handler.
> - Minor error-path fix in GEM object creation (check error after unlockin=
g
>   mm_lock).
>
> These changes, derived from vendor BSP behavior, enable correct execution
> of PPU-only tasks, pipelined workloads, and reliable multi-core operation
> while preserving backward compatibility.

Hi Ross,

Thanks a lot for the patch, it brings lots of good stuff.

Before I look into it in detail, would you be able to split it in
individual patches? Basically, so each patch does just one thing and
you don't need to mention that it does something else in addition. I
recommend using b4 for managing your series:
https://b4.docs.kernel.org/en/latest/

Crucially important is to separate fixes and cleanups from new features.

As we are changing the UABI, we need to have corresponding patches for
Mesa. Ideally, a MR in https://gitlab.freedesktop.org/mesa/mesa/ will
have been opened for simultaneous review with the kernel patches.

Thanks,

Tomeu


> ---
>  drivers/accel/rocket/rocket_gem.c |  2 +
>  drivers/accel/rocket/rocket_job.c | 99 +++++++++++++++++++++++++------
>  drivers/accel/rocket/rocket_job.h |  2 +
>  include/uapi/drm/rocket_accel.h   | 30 ++++++++++
>  4 files changed, 115 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/roc=
ket_gem.c
> index 624c4ecf5a34..db1ff3544af2 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -95,6 +95,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void=
 *data, struct drm_file *
>                                          rkt_obj->size, PAGE_SIZE,
>                                          0, 0);
>         mutex_unlock(&rocket_priv->mm_lock);
> +       if (ret)
> +               goto err;
>
>         ret =3D iommu_map_sgtable(rocket_priv->domain->domain,
>                                 rkt_obj->mm.start,
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index acd606160dc9..dd69b195d0e6 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -96,6 +96,13 @@ rocket_copy_tasks(struct drm_device *dev,
>
>                 rjob->tasks[i].regcmd =3D task.regcmd;
>                 rjob->tasks[i].regcmd_count =3D task.regcmd_count;
> +               rjob->tasks[i].int_mask =3D task.int_mask;
> +               rjob->tasks[i].flags =3D task.flags;
> +
> +               /* Default to DPU completion if no mask specified */
> +               if (!rjob->tasks[i].int_mask)
> +                       rjob->tasks[i].int_mask =3D PC_INTERRUPT_MASK_DPU=
_0 |
> +                                                  PC_INTERRUPT_MASK_DPU_=
1;
>         }
>
>         return 0;
> @@ -108,7 +115,6 @@ rocket_copy_tasks(struct drm_device *dev,
>  static void rocket_job_hw_submit(struct rocket_core *core, struct rocket=
_job *job)
>  {
>         struct rocket_task *task;
> -       unsigned int extra_bit;
>
>         /* Don't queue the job if a reset is in progress */
>         if (atomic_read(&core->reset.pending))
> @@ -121,29 +127,61 @@ static void rocket_job_hw_submit(struct rocket_core=
 *core, struct rocket_job *jo
>
>         rocket_pc_writel(core, BASE_ADDRESS, 0x1);
>
> -        /* From rknpu, in the TRM this bit is marked as reserved */
> -       extra_bit =3D 0x10000000 * core->index;
> -       rocket_cna_writel(core, S_POINTER, CNA_S_POINTER_POINTER_PP_EN(1)=
 |
> -                                          CNA_S_POINTER_EXECUTER_PP_EN(1=
) |
> -                                          CNA_S_POINTER_POINTER_PP_MODE(=
1) |
> -                                          extra_bit);
> -
> -       rocket_core_writel(core, S_POINTER, CORE_S_POINTER_POINTER_PP_EN(=
1) |
> -                                           CORE_S_POINTER_EXECUTER_PP_EN=
(1) |
> -                                           CORE_S_POINTER_POINTER_PP_MOD=
E(1) |
> -                                           extra_bit);
> +       /*
> +        * Initialize CNA and Core S_POINTER for ping-pong mode via MMIO.
> +        *
> +        * Each core needs a per-core extra_bit (bit 28 * core_index) whi=
ch
> +        * the TRM marks as reserved but the BSP rknpu driver sets. Witho=
ut
> +        * it, non-zero cores hang. This MUST be done via MMIO (not regcm=
d)
> +        * because userspace doesn't know which core the scheduler picks.
> +        *
> +        * DPU/DPU_RDMA and PPU/PPU_RDMA S_POINTERs are set by the regcmd
> +        * itself =E2=80=94 they don't need the per-core extra_bit.
> +        *
> +        * For standalone DPU/PPU tasks (element-wise ops, pooling), CNA
> +        * and Core have no work. Writing their S_POINTERs would re-arm
> +        * them with stale state from the previous conv task, corrupting
> +        * the DPU/PPU output. Userspace signals this via the
> +        * ROCKET_TASK_NO_CNA_CORE flag.
> +        */
> +       if (!(task->flags & ROCKET_TASK_NO_CNA_CORE)) {
> +               unsigned int extra_bit =3D 0x10000000 * core->index;
> +               rocket_cna_writel(core, S_POINTER,
> +                                 CNA_S_POINTER_POINTER_PP_EN(1) |
> +                                 CNA_S_POINTER_EXECUTER_PP_EN(1) |
> +                                 CNA_S_POINTER_POINTER_PP_MODE(1) |
> +                                 extra_bit);
> +
> +               rocket_core_writel(core, S_POINTER,
> +                                  CORE_S_POINTER_POINTER_PP_EN(1) |
> +                                  CORE_S_POINTER_EXECUTER_PP_EN(1) |
> +                                  CORE_S_POINTER_POINTER_PP_MODE(1) |
> +                                  extra_bit);
> +       }
>
>         rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
>         rocket_pc_writel(core, REGISTER_AMOUNTS,
>                          PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd=
_count + 1) / 2 - 1));
>
> -       rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | =
PC_INTERRUPT_MASK_DPU_1);
> -       rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 =
| PC_INTERRUPT_CLEAR_DPU_1);
> +       /*
> +        * Enable interrupts for the last block in this task's pipeline.
> +        *
> +        * The int_mask field from userspace specifies which block comple=
tion
> +        * signals that this task is done:
> +        *   - Conv/DPU tasks: DPU_0 | DPU_1
> +        *   - PPU tasks (DPU=E2=86=92PPU pipeline): PPU_0 | PPU_1
> +        *
> +        * Only enabling the terminal block's interrupt prevents the kern=
el
> +        * from stopping the pipeline early (e.g. DPU fires before PPU ha=
s
> +        * finished writing its output).
> +        */
> +       rocket_pc_writel(core, INTERRUPT_MASK, task->int_mask);
> +       rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
>
>         rocket_pc_writel(core, TASK_CON, PC_TASK_CON_RESERVED_0(1) |
>                                          PC_TASK_CON_TASK_COUNT_CLEAR(1) =
|
>                                          PC_TASK_CON_TASK_NUMBER(1) |
> -                                        PC_TASK_CON_TASK_PP_EN(1));
> +                                        PC_TASK_CON_TASK_PP_EN(job->task=
_count > 1 ? 1 : 0));
>
>         rocket_pc_writel(core, TASK_DMA_BASE_ADDR, PC_TASK_DMA_BASE_ADDR_=
DMA_BASE_ADDR(0x0));
>
> @@ -385,7 +423,23 @@ static enum drm_gpu_sched_stat rocket_job_timedout(s=
truct drm_sched_job *sched_j
>         struct rocket_device *rdev =3D job->rdev;
>         struct rocket_core *core =3D sched_to_core(rdev, sched_job->sched=
);
>
> -       dev_err(core->dev, "NPU job timed out");
> +       {
> +               u32 raw =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
> +               u32 status =3D rocket_pc_readl(core, INTERRUPT_STATUS);
> +               u32 mask =3D rocket_pc_readl(core, INTERRUPT_MASK);
> +               u32 op_en =3D rocket_pc_readl(core, OPERATION_ENABLE);
> +               u32 task_status =3D rocket_pc_readl(core, TASK_STATUS);
> +               u32 cna_s_status =3D rocket_cna_readl(core, S_STATUS);
> +               u32 core_s_status =3D rocket_core_readl(core, S_STATUS);
> +               u32 core_misc =3D readl(core->core_iomem + 0x10);  /* MIS=
C_CFG */
> +               u32 core_op_en =3D readl(core->core_iomem + 0x08);  /* OP=
ERATION_ENABLE */
> +
> +               dev_err(core->dev,
> +                       "NPU job timed out: raw=3D0x%08x mask=3D0x%08x op=
_en=3D0x%x task_status=3D0x%x cna_s=3D0x%x core_s=3D0x%x core_misc=3D0x%x c=
ore_op_en=3D0x%x task=3D%u/%u",
> +                       raw, mask, op_en, task_status,
> +                       cna_s_status, core_s_status, core_misc, core_op_e=
n,
> +                       job->next_task_idx, job->task_count);
> +       }
>
>         atomic_set(&core->reset.pending, 1);
>         rocket_reset(core, sched_job);
> @@ -424,8 +478,17 @@ static irqreturn_t rocket_job_irq_handler(int irq, v=
oid *data)
>         WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
>         WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
>
> -       if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
> -             raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
> +       /*
> +        * Check for any job completion interrupt: DPU or PPU.
> +        *
> +        * Conv and standalone DPU jobs signal via DPU_0/DPU_1.
> +        * PPU pooling jobs signal via PPU_0/PPU_1.
> +        * We must recognize both to avoid PPU job timeouts.
> +        */
> +       if (!(raw_status & (PC_INTERRUPT_RAW_STATUS_DPU_0 |
> +                           PC_INTERRUPT_RAW_STATUS_DPU_1 |
> +                           PC_INTERRUPT_RAW_STATUS_PPU_0 |
> +                           PC_INTERRUPT_RAW_STATUS_PPU_1)))
>                 return IRQ_NONE;
>
>         rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/roc=
ket_job.h
> index 4ae00feec3b9..6931dfed8615 100644
> --- a/drivers/accel/rocket/rocket_job.h
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -13,6 +13,8 @@
>  struct rocket_task {
>         u64 regcmd;
>         u32 regcmd_count;
> +       u32 int_mask;
> +       u32 flags;
>  };
>
>  struct rocket_job {
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_ac=
cel.h
> index 14b2e12b7c49..b041bcb05e27 100644
> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -73,6 +73,11 @@ struct drm_rocket_fini_bo {
>         __u32 reserved;
>  };
>
> +/**
> + * Flags for drm_rocket_task.flags
> + */
> +#define ROCKET_TASK_NO_CNA_CORE                0x1
> +
>  /**
>   * struct drm_rocket_task - A task to be run on the NPU
>   *
> @@ -84,6 +89,31 @@ struct drm_rocket_task {
>
>         /** Input: Number of commands in the register command buffer */
>         __u32 regcmd_count;
> +
> +       /**
> +        * Input: Interrupt mask specifying which block completion signal=
s
> +        * that this task is done. Uses PC_INTERRUPT_MASK_* bits.
> +        *
> +        * For conv/DPU tasks: DPU_0 | DPU_1 (0x0300)
> +        * For PPU tasks:      PPU_0 | PPU_1 (0x0C00)
> +        *
> +        * If zero, defaults to DPU_0 | DPU_1 for backwards compatibility=
.
> +        */
> +       __u32 int_mask;
> +
> +       /**
> +        * Input: Task flags.
> +        *
> +        * ROCKET_TASK_NO_CNA_CORE: Skip CNA and Core S_POINTER MMIO
> +        * writes for this task. Used for standalone DPU element-wise
> +        * and PPU pooling tasks that don't use CNA/Core. Without this
> +        * flag, CNA/Core get re-armed with stale state from the
> +        * previous conv task, corrupting the DPU/PPU output.
> +        *
> +        * Zero means write CNA/Core S_POINTER (default for conv tasks,
> +        * backwards compatible with old userspace).
> +        */
> +       __u32 flags;
>  };
>
>  /**
> --
> 2.52.0
>
