Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4048B8551B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF6C10E0C1;
	Thu, 18 Sep 2025 14:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkgUK6/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4F10E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:46:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I8f3Ws003286
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=gnbUOrf63pBtXte2EyaiZArr5NkIZvu1PUrrJk66+oQ=; b=Nk
 gUK6/gwac3CiDzymqIH/uQBQwQU/LbvdnUc62tB0sFcfvG6E2KEs4PCcS83tUvn2
 tDHarbPHnzYBPbDb83Ftn12tnNTeE+Hm6NuidAYnc8nYUwltRusOqH0mwM4kBWaN
 mEeHXgbFQuY6pCnm6dzTvwzQSW24CDZHr4YmVUgA5QKyJpIrlgSlWyMxu0HADOGQ
 PztNWKjd0++sYdPt9H9dUwSO/7nyg8xBkpEWmkT1P3/7y6e6uERsVc1O9grZLVSo
 tIGzebZjJW3i7mAv7lDB5RY+qflcpe+J8g/LlO0LuHboU3VOj04B/SFLEYZii5tz
 2/CizDHYyzvaVTvkXivA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgvb5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:46:45 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-61e790c631cso762638eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 07:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758206804; x=1758811604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gnbUOrf63pBtXte2EyaiZArr5NkIZvu1PUrrJk66+oQ=;
 b=CPxIk16n0JJ+r1yGrDJEMzjcrvJlkSimsrpL6S0YghCaz/b+G514btSUhriK1F6kDm
 C5o6snztQNLbltYKgfg4HdG2bf4ewLjl9D4WisEhVb5JitrIZwOU32UMW3Qipyix9rZD
 EJZMINA6jXGOOFsjxrcyrDZnTBHZGiTkOiZNrmR5Z4YyUNpO4SER9bqHlPcwAHLoIH0r
 /Qez14iEy2lkWF0JaQN3ODmr1BDyxiwD0+xiA5cidp1zDXG5NaGYAqtB58Ak7j7Qh5jO
 vSNiRuuspSPJVu6hDg+KakmJRMlX36TvZma+Wt4XkL14KWaeOSTJDtEIteNCeI15y9VF
 Cqqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWCHrBa60yvYMuUGXi97xRogLMUqqMdw3xdxuzTNrHxeyroaSeajK3QT0gnoTbrsePpgl1olYbjY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7J+HubRAnXs3hAe/ML9zYa/FK6BoOTyFQuV2ZPENLbQnqDRWG
 993BsAGt4AbmRrdCcarC2fnFZySo9nAIJNN/9HLTjH3Pp28kilQOO3EkV0iPbsmo2EazD/QDJ0q
 TyGJr6b3Qhtsb/+2UZ/MMgfC/XV5Iev5Zr5gYWra9XE2M4PbwmXxJXUBvpPjV5h/ZHrdqyrQRG+
 zLrwC7wmgVfdoZWNh29VoHfO0ah6Tmq1qd6TOEu9dQckgglg==
X-Gm-Gg: ASbGncuYfzaSU3/BTNblBvc2Gh4sjoO3NjLsOAFxIBzFo8XGF/Y9vfl4aTHXK60f0p2
 IQ/8gImeeI+9vvnl4poDaAqPZOIxwl3+dz1JbQunVrU53tB2Df7mag8egSiQADiMky0tJis9Gof
 p8SyiZTuhDfa8blUWRf7NBqIX4cmDhpER3aLq/Zw/MYoi2hCaGgGJS
X-Received: by 2002:a05:6871:60c3:b0:319:602d:d60e with SMTP id
 586e51a60fabf-335beedc5c7mr3345671fac.30.1758206803980; 
 Thu, 18 Sep 2025 07:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+dimfh8PQO07fjVaMpNrhVtlZwz2RBLy/WEa2oOHpPa1q3yhkCM/5eIl830Fz8or9XI7Pgcy21KiPbEwLLC4=
X-Received: by 2002:a05:6871:60c3:b0:319:602d:d60e with SMTP id
 586e51a60fabf-335beedc5c7mr3345639fac.30.1758206803498; Thu, 18 Sep 2025
 07:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
 <20250918-msm-gpu-split-v5-2-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-2-44486f44d27d@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 07:46:32 -0700
X-Gm-Features: AS18NWAGJ3HI8YxKOdr0e82FJrS98OD4wgECUuKsEu4TLlBFafzU4c8bTPVYhCw
Message-ID: <CACSVV036k+VwtLEvX4ATG7h7fTpXAzUuOZr9AY4WzwJWFvw0zQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] drm/msm: split VM_BIND from the rest of GEM VMA
 code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gKiUIgbV1YyeE6sfx9-jWoS6frGxIXp_
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cc1b55 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CW3DRyB6gakd8nvQtp8A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: gKiUIgbV1YyeE6sfx9-jWoS6frGxIXp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXxgFd3CZxUxdw
 UVx5TioLPXroiLX+L+gF9av3HEjPPGgfgo2R+HZ5H1Dp7TA3BnM/dL7e/e497jQl5MqQddPYQTH
 5Hs0Hi2iNdmfHj/bXLiR/9vB2Ar6Zd16c7pQ9VQ7ELAbuh8TC/1YSqzXKdqZ1XECIdnrKBUSkIg
 Z2wPXKdKnVofMMmUYoc8UumN4RUCvChO7m73Qot56qzbDddNJQnix7JGlXL5rL8I8pvm+Mmyl2R
 C5xS9UUkTWWK47j8/VAEAachALNjjXajsDWqARVoE+6oheOgIiAa+6lMpiraIZHB/WAVK0oa1DT
 Jugsh1kZpkRc3Yktpdisq5U1K6rGjgribQL7+6wg0LryrwJ672Fz3ObpW+llV+yeR7GiyW4W82n
 bhtc6cbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 17, 2025 at 8:51=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> In preparation to disabling GPU functionality split VM_BIND-related
> functions (which are used only for the GPU) from the rest of the GEM VMA
> implementation.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile          |    1 +
>  drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++=
++++
>  drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------=
------
>  drivers/gpu/drm/msm/msm_gem_vma.h     |  105 +++
>  4 files changed, 1225 insertions(+), 1174 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b193b10946fae20138caf32cf0ed2..d7876c154b0aa2cb0164c4b1f=
b7900b1a42db46b 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -115,6 +115,7 @@ msm-y +=3D \
>         msm_gem_shrinker.o \
>         msm_gem_submit.o \
>         msm_gem_vma.o \
> +       msm_gem_vm_bind.o \
>         msm_gpu.o \
>         msm_gpu_devfreq.o \
>         msm_io_utils.o \

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.h b/drivers/gpu/drm/msm/msm_=
gem_vma.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f702f81529e72b86bffb49604=
08f1912bc65851a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#ifndef _MSM_GEM_VMA_H_
> +#define _MSM_GEM_VMA_H_
> +
> +#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, =
##__VA_ARGS__)
> +
> +/**
> + * struct msm_vm_map_op - create new pgtable mapping
> + */
> +struct msm_vm_map_op {
> +       /** @iova: start address for mapping */
> +       uint64_t iova;
> +       /** @range: size of the region to map */
> +       uint64_t range;
> +       /** @offset: offset into @sgt to map */
> +       uint64_t offset;
> +       /** @sgt: pages to map, or NULL for a PRR mapping */
> +       struct sg_table *sgt;
> +       /** @prot: the mapping protection flags */
> +       int prot;
> +
> +       /**
> +        * @queue_id: The id of the submitqueue the operation is performe=
d
> +        * on, or zero for (in particular) UNMAP ops triggered outside of
> +        * a submitqueue (ie. process cleanup)
> +        */
> +       int queue_id;
> +};
> +
> +/**
> + * struct msm_vm_unmap_op - unmap a range of pages from pgtable
> + */
> +struct msm_vm_unmap_op {
> +       /** @iova: start address for unmap */
> +       uint64_t iova;
> +       /** @range: size of region to unmap */
> +       uint64_t range;
> +
> +       /** @reason: The reason for the unmap */
> +       const char *reason;
> +
> +       /**
> +        * @queue_id: The id of the submitqueue the operation is performe=
d
> +        * on, or zero for (in particular) UNMAP ops triggered outside of
> +        * a submitqueue (ie. process cleanup)
> +        */
> +       int queue_id;
> +};
> +
> +static void
> +vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t ra=
nge, int queue_id)

These would have to be static-inline

But overall I'm not sure how I feel about this.. I guess the goal is
to reduce the size of a kms-only driver?  If so, I think you could do
better with some ugly ifdef (for ex, you could also remove scheduler
and other fields not used by kernel managed VMs from msm_gem_vm).

I'm not sure how much the savings would be, or if it is worth the pain
(ie. extra build configurations to test going forward, etc).  Having
no GPU doesn't seem like a case worth optimizing for, tbh.  You could
still have a single driver which binds to multiple different devices,
ie. if # of GPUs !=3D # of DPUs without this with no change in
footprint.

BR,
-R




> +{
> +       int idx;
> +
> +       if (!vm->managed)
> +               lockdep_assert_held(&vm->mmu_lock);
> +
> +       vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova =
+ range);
> +
> +       if (!vm->log)
> +               return;
> +
> +       idx =3D vm->log_idx;
> +       vm->log[idx].op =3D op;
> +       vm->log[idx].iova =3D iova;
> +       vm->log[idx].range =3D range;
> +       vm->log[idx].queue_id =3D queue_id;
> +       vm->log_idx =3D (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
> +}
> +
> +static void
> +vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
> +{
> +       const char *reason =3D op->reason;
> +
> +       if (!reason)
> +               reason =3D "unmap";
> +
> +       vm_log(vm, reason, op->iova, op->range, op->queue_id);
> +
> +       vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
> +}
> +
> +static int
> +vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
> +{
> +       vm_log(vm, "map", op->iova, op->range, op->queue_id);
> +
> +       return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset=
,
> +                                  op->range, op->prot);
> +}
> +
> +int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg);
> +int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg);
> +int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg);
> +
> +int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm)=
;
> +void msm_gem_vm_sched_fini(struct msm_gem_vm *vm);
> +
> +#endif
>
> --
> 2.47.3
>
