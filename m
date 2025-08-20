Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9058B2E2AC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 18:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014E310E790;
	Wed, 20 Aug 2025 16:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH36SZzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40810E790
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:53:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9tZR8019728
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=W2M4ija0Zs+9Z7Ixo0hKEv3EtGgf+girVjx6a0XQmH4=; b=UH
 36SZzNTOVZDlO7IYUsUD8NOXrNyfCVb7fKBFkzSYPm+Vce5UPWKkrGhZtNnXtbwf
 1s8F0Wt4iyk6H25ch77EID3L96GeMbu82g9q7KNi8Tbkznfz3t3HKcS36pPQJoh7
 AEK7fJJVSLaZXAG5TTs/Fr4aMQ/Hcrra7z8jo/alzmicJQbhNKCk4mFI3p9LxesR
 LGrc7BqZMepH19uNJbcbTc9msxAcrfTpnOtgHVmw3GxAA+xYtuQZmBTFvwQT6em5
 qy4UkPZ9kFgCKcKwFMUlvzCiumXiz62zu5FdONSc3AetAx4Wj/BfKj957Gw/Fj8p
 HIFmih7MSKNqLC2/Fvpw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5292frp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:53:21 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-61bd4f4cdebso38836eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755708800; x=1756313600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W2M4ija0Zs+9Z7Ixo0hKEv3EtGgf+girVjx6a0XQmH4=;
 b=dGksoQruoghqsEiBcknUEzq0Vhlgjd0LOLXOw3qMZtNQmGK+ZEdVFK3HE4K19bH4wO
 EEOevYcAMMDe2g9BnkqX8G68JVlTM74xHRcC+t+MIoLyZRQcHFZcmUeJaqlBqlZrJz80
 H4mrETLMRcX1/g+HV8nfbsfQNKqjGBPGhvYwul449pb6B9iqqjE2GQ503tj2OfRbNRsf
 B74NNhk6HqjN7RwrY6gdU620Ryf6kfT/XxEstjZlZdH8UdJ6eZNadtoeLp+Jm3N+7/RV
 OjWnhlY9AtEpfVsD1p200CGrtwbXrt4PPi9rR3X5YcE66NjsLgtSdJ0vVSCjmEOBb7CJ
 7Amg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAkgdy/MQOVopaSAGC5Xyy9Iuvt4t1nNAw0+3oRfMSN93NagECAfLf4k6gij1OUIDlx8QQAUtqWR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxV4BVzy1zz/Fnpsb9wf1wTecIOwVcLQkoKI8UBEmTEHPZ90L4
 Fmfl8FUNkiekqGpefdnO+wLOJqWHvHlJPqO1m66vHS7jP+MML/sqvEbqBoZL5XADtpb5vkT0EBp
 BpmffyS45QcuOjguZn/6PhngXSvAI8uJhHruraGOU07WjKobbP4SggjwEPVhIxj3mJd0tbGFk11
 qCuYL1XOiQlVQePT3DPX7q8xVLLxTJ3Sj7tJLhDNXaN6HixA==
X-Gm-Gg: ASbGncvPG+deGVyMtXh8lsZOdMiCmciu4bGXiFnPpI5DoAuwCyD5inJKD3MyePU/bBY
 6SKyDy9EbbNCZv5vkPb2YUobk7c/vGLYij9YKUb93Orliqj7EgecbqsFg4aM9Bt3yV1G/fuY8gN
 qGztyhvFlrGoqcLLfk5G9Osk9bc1nTEwe5v+wQXpOqFITfNXiflo/T
X-Received: by 2002:a05:6808:19a4:b0:437:75ea:6c7f with SMTP id
 5614622812f47-43775ea718emr817856b6e.42.1755708799995; 
 Wed, 20 Aug 2025 09:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJok6uoAZTnyAi59OvfMiJ9y1pKgSB6gTooN3Q/Az//PhtfqU7dvzRmANYpbPYe6OSOBiyjJatvbZb3MpB94E=
X-Received: by 2002:a05:6808:19a4:b0:437:75ea:6c7f with SMTP id
 5614622812f47-43775ea718emr817843b6e.42.1755708799455; Wed, 20 Aug 2025
 09:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 09:53:08 -0700
X-Gm-Features: Ac12FXz1B1jSUuX-_USrBjQxMkCGISW9zGWK2ybLEP-pi0bWVOB8By05V4HaDpw
Message-ID: <CACSVV002zDO1ZFJ7cMwFOSyt2AJMST48Q7DGh1Tb+TCCgX1nVA@mail.gmail.com>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iVJwXoyw92s_leTFaEYxdvRvg_O7xaG5
X-Proofpoint-ORIG-GUID: iVJwXoyw92s_leTFaEYxdvRvg_O7xaG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0GV+J4MDDfBF
 /gNCkkNMPdXCPoArOvWUWQvepCHrt83AHjHYfgqcfTSqCk5zBEwIg2oJzskzsbnQ39efXE/Tzzz
 osW39wbIGMw+7sHL6Uczoi3/WbxpLBgwklT3ZZH+YbTm7z/lOS2xNwbwjO0I+EC1Af/EEuRWkxh
 miP5rqJAstHz+z00UViKEH+kIQWlmIucEbKRWGT9SbRk4R3vepkcNbgfpcL9n2QeM2eQo53lPfv
 FQsgWuEocyOi3ZRaA8EOyCjpeN5p6tcrDZBE+w3TG1ELiBC55NyDes7icUUB5l7yWh7f0G6hee9
 bw+oaMEsD2Cv1D9k6Bt0r2n0kygtfz/oRFqBt7KPkjSwVzOucWn1EaH1ELW/Ze8geJm29GozJlO
 ORPnP1JpT/ziEdRJWRO7PCybdkt5Tg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5fd81 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=J8LrQrxOmdwx_pnbJQkA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 7:56=E2=80=AFAM Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> Renamed 'map' to 'op' in drm_gpuvm_map_req for clarity and added
> corresponding documentation. No functional changes introduced.
>
> Fixes: baf1638c0956 ("drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create")
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Acked-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 36 +++++++++++++-------------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  8 +++---
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 16 ++++++------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  8 +++---
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +++---
>  drivers/gpu/drm/xe/xe_vm.c             |  8 +++---
>  include/drm/drm_gpuvm.h                |  4 +--
>  7 files changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 39f934a91a7b..e9aaf9b287e7 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -552,11 +552,11 @@
>   *                               struct drm_gem_object *obj, u64 offset)
>   *     {
>   *             struct drm_gpuvm_map_req map_req =3D {
> - *                     .map.va.addr =3D addr,
> - *                     .map.va.range =3D range,
> - *                     .map.gem.obj =3D obj,
> - *                     .map.gem.offset =3D offset,
> - *                };
> + *                     .op.va.addr =3D addr,
> + *                     .op.va.range =3D range,
> + *                     .op.gem.obj =3D obj,
> + *                     .op.gem.offset =3D offset,
> + *             };
>   *             struct drm_gpuva_ops *ops;
>   *             struct drm_gpuva_op *op
>   *             struct drm_gpuvm_bo *vm_bo;
> @@ -2132,10 +2132,10 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *p=
riv,
>                 return 0;
>
>         op.op =3D DRM_GPUVA_OP_MAP;
> -       op.map.va.addr =3D req->map.va.addr;
> -       op.map.va.range =3D req->map.va.range;
> -       op.map.gem.obj =3D req->map.gem.obj;
> -       op.map.gem.offset =3D req->map.gem.offset;
> +       op.map.va.addr =3D req->op.va.addr;
> +       op.map.va.range =3D req->op.va.range;
> +       op.map.gem.obj =3D req->op.gem.obj;
> +       op.map.gem.offset =3D req->op.gem.offset;
>
>         return fn->sm_step_map(&op, priv);
>  }
> @@ -2180,12 +2180,12 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>                    const struct drm_gpuvm_map_req *req,
>                    bool madvise)
>  {
> -       struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +       struct drm_gem_object *req_obj =3D req->op.gem.obj;
>         const struct drm_gpuvm_map_req *op_map =3D madvise ? NULL : req;
>         struct drm_gpuva *va, *next;
> -       u64 req_offset =3D req->map.gem.offset;
> -       u64 req_range =3D req->map.va.range;
> -       u64 req_addr =3D req->map.va.addr;
> +       u64 req_offset =3D req->op.gem.offset;
> +       u64 req_range =3D req->op.va.range;
> +       u64 req_addr =3D req->op.va.addr;
>         u64 req_end =3D req_addr + req_range;
>         int ret;
>
> @@ -2272,8 +2272,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>
>                                 if (madvise) {
>                                         struct drm_gpuvm_map_req map_req =
=3D {
> -                                               .map.va.addr =3D  req_add=
r,
> -                                               .map.va.range =3D end - r=
eq_addr,
> +                                               .op.va.addr =3D  req_addr=
,
> +                                               .op.va.range =3D end - re=
q_addr,
>                                         };
>
>                                         ret =3D op_map_cb(ops, priv, &map=
_req);
> @@ -2340,8 +2340,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>
>                                 if (madvise) {
>                                         struct drm_gpuvm_map_req map_req =
=3D {
> -                                               .map.va.addr =3D  addr,
> -                                               .map.va.range =3D req_end=
 - addr,
> +                                               .op.va.addr =3D  addr,
> +                                               .op.va.range =3D req_end =
- addr,
>                                         };
>
>                                         return op_map_cb(ops, priv, &map_=
req);
> @@ -2583,7 +2583,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>                            struct drm_exec *exec, unsigned int num_fences=
,
>                            struct drm_gpuvm_map_req *req)
>  {
> -       struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +       struct drm_gem_object *req_obj =3D req->op.gem.obj;
>
>         if (req_obj) {
>                 int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fence=
s);
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
> index 3d97990170bf..983165eb3e6a 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -187,10 +187,10 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_o=
p *bind_op)
>         switch (bind_op->type) {
>         case PVR_VM_BIND_TYPE_MAP: {
>                 const struct drm_gpuvm_map_req map_req =3D {
> -                       .map.va.addr =3D bind_op->device_addr,
> -                       .map.va.range =3D bind_op->size,
> -                       .map.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_ob=
j),
> -                       .map.gem.offset =3D bind_op->offset,
> +                       .op.va.addr =3D bind_op->device_addr,
> +                       .op.va.range =3D bind_op->size,
> +                       .op.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_obj=
),
> +                       .op.gem.offset =3D bind_op->offset,
>                 };
>
>                 return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 210604181c05..9b5d003bc5a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1179,10 +1179,10 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *=
job, struct drm_exec *exec)
>                         case MSM_VM_BIND_OP_MAP:
>                         case MSM_VM_BIND_OP_MAP_NULL: {
>                                 struct drm_gpuvm_map_req map_req =3D {
> -                                       .map.va.addr =3D op->iova,
> -                                       .map.va.range =3D op->range,
> -                                       .map.gem.obj =3D op->obj,
> -                                       .map.gem.offset =3D op->obj_offse=
t,
> +                                       .op.va.addr =3D op->iova,
> +                                       .op.va.range =3D op->range,
> +                                       .op.gem.obj =3D op->obj,
> +                                       .op.gem.offset =3D op->obj_offset=
,
>                                 };
>
>                                 ret =3D drm_gpuvm_sm_map_exec_lock(job->v=
m, exec, 1, &map_req);
> @@ -1296,10 +1296,10 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>                         fallthrough;
>                 case MSM_VM_BIND_OP_MAP_NULL: {
>                         struct drm_gpuvm_map_req map_req =3D {
> -                               .map.va.addr =3D op->iova,
> -                               .map.va.range =3D op->range,
> -                               .map.gem.obj =3D op->obj,
> -                               .map.gem.offset =3D op->obj_offset,
> +                               .op.va.addr =3D op->iova,
> +                               .op.va.range =3D op->range,
> +                               .op.gem.obj =3D op->obj,
> +                               .op.gem.offset =3D op->obj_offset,
>                         };
>
>                         ret =3D drm_gpuvm_sm_map(job->vm, &arg, &map_req)=
;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nou=
veau/nouveau_uvmm.c
> index d94a85509176..314121a857e7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1277,10 +1277,10 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *=
job,
>                 case OP_MAP: {
>                         struct nouveau_uvma_region *reg;
>                         struct drm_gpuvm_map_req map_req =3D {
> -                               .map.va.addr =3D op->va.addr,
> -                               .map.va.range =3D op->va.range,
> -                               .map.gem.obj =3D op->gem.obj,
> -                               .map.gem.offset =3D op->gem.offset,
> +                               .op.va.addr =3D op->va.addr,
> +                               .op.va.range =3D op->va.range,
> +                               .op.gem.obj =3D op->gem.obj,
> +                               .op.gem.offset =3D op->gem.offset,
>                         };
>
>                         reg =3D nouveau_uvma_region_find_first(uvmm,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 2003b91a8409..3799e2c6ea59 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2204,10 +2204,10 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct =
panthor_vm_op_ctx *op,
>         switch (op_type) {
>         case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
>                 const struct drm_gpuvm_map_req map_req =3D {
> -                       .map.va.addr =3D op->va.addr,
> -                       .map.va.range =3D op->va.range,
> -                       .map.gem.obj =3D op->map.vm_bo->obj,
> -                       .map.gem.offset =3D op->map.bo_offset,
> +                       .op.va.addr =3D op->va.addr,
> +                       .op.va.range =3D op->va.range,
> +                       .op.gem.obj =3D op->map.vm_bo->obj,
> +                       .op.gem.offset =3D op->map.bo_offset,
>                 };
>
>                 if (vm->unusable) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f35d69c0b4c6..66b54b152446 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2339,10 +2339,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct=
 xe_vma_ops *vops,
>         case DRM_XE_VM_BIND_OP_MAP:
>         case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>                 struct drm_gpuvm_map_req map_req =3D {
> -                       .map.va.addr =3D addr,
> -                       .map.va.range =3D range,
> -                       .map.gem.obj =3D obj,
> -                       .map.gem.offset =3D bo_offset_or_userptr,
> +                       .op.va.addr =3D addr,
> +                       .op.va.range =3D range,
> +                       .op.gem.obj =3D obj,
> +                       .op.gem.offset =3D bo_offset_or_userptr,
>                 };
>
>                 ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req)=
;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 4a22b9d848f7..751c96a817ed 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1054,9 +1054,9 @@ struct drm_gpuva_ops {
>   */
>  struct drm_gpuvm_map_req {
>         /**
> -        * @op_map: struct drm_gpuva_op_map
> +        * @op: struct drm_gpuva_op_map
>          */
> -       struct drm_gpuva_op_map map;
> +       struct drm_gpuva_op_map op;
>  };
>
>  struct drm_gpuva_ops *
> --
> 2.34.1
>
