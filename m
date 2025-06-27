Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFADAEB86A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2CF10EA1D;
	Fri, 27 Jun 2025 13:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYCxvv9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C8510EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:05:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC12jL014218
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Mj2LcX/wfNnzEoznRxiF/Vekbx0t7G9NztY2MpuYpkg=; b=OY
 Cxvv9eu2hCpM9YnTikkajsDO+FaI9akcFuAfXIvxWEFJDNzCR4Ul/mSfhTWiYwxV
 LqXRR+cbclMuxspdmsjN5rCT4kQgnE/Nl67X8xrBLC5fGAeeYprUvXbtV9/fnsg6
 fMmteFZmwrOxJVFP8AOMbdx/kZ7l3M9uwKcFeYEthR1aebbXIh9RNqHvpvtHWtrR
 qJ8GIsS0FdcCdYXXDqFcgT/Zfu1DUKW/5Z5kCILsudHk6lmRmx9/IuMKGlJ3uF33
 n/ckbR2o5Or/CgNz86mOyqsVmXrvP1sd5eVctTpRV69tLxaPDHAXxX9IddsVIC/T
 sYfeib+RNsYh2M3S4x6Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn0pkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:05:12 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-61143269a8cso1863364eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 06:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751029511; x=1751634311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mj2LcX/wfNnzEoznRxiF/Vekbx0t7G9NztY2MpuYpkg=;
 b=TE/cv+ZYJmIj9jP17PpNPZQ8xusNg1sR5GKp+NoBdsinTVbsUpn1JPIHYrRwOiMCI1
 jWg7+aU/8Dy3PNItUEQktTXa1KKHaKn9tif6uD1a+zPlXZl144XX5ihsYm8pQZWbM1a4
 77JRBKBj2J2Xg8TthLDqTdN3cTc4m+9jPlx+PoxgmWt7zgtC8SUd8ofEGou5n4fy8HnH
 CHV2m3pzpdJhkQ9hQBM5KUXw+B4lONTC7uDMzaxMQ+5j4jguOfVGXWGWGB4XwoAkqnZz
 7OxvANDK5tegslWXQpY/xsUiqi+YWVe7wmLm0Ke4cqix4fceIcHJRCe2tk7hwW7CYoXD
 mXNQ==
X-Gm-Message-State: AOJu0YxZx9p2Bru/bJL/y92iEU6yDPzPx/d6Pn8kUAdEchyCh6zICOjr
 KgH1jkc7/4dqvcYtOuiHnyLhBs9ggTYeSoWwk/o58gSXJAhV+gpHIUVdBLyeHM47wjZ4DpOi8jN
 /9IMxp3xfvekztvMqcVU46HZN8ze+WzO6spyWXvURclqZn6laNooHMaluZEcJI6FQ/CFFtRdgLr
 xkDR9wyUawBg2WKWnGEVTOooy3Z0Aex4pr11baUwrMIiAfzw==
X-Gm-Gg: ASbGncsThy1RqGxAwivY8CHAOfHigZ1ZFvimQws02/QFphEWpptgoBU2kw8oyG1rqzp
 5sI0yTNGl0g9kTCijPuOcM5N+V8hyINc5cJLV8lB9OyA7oYEO3h1KoTk7DlmzeHLEzjzI6SY5ei
 CHRj3s7eMM6QOFkQPIqHoUqn4TrFYjYjja3oo=
X-Received: by 2002:a05:6870:178e:b0:2c2:3e24:9b54 with SMTP id
 586e51a60fabf-2efed4b16bbmr1775192fac.11.1751029510788; 
 Fri, 27 Jun 2025 06:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESX69QJe1uekZFWjeHdkSgJnjoP36VXXoHS+Nz/76pjCAnZNKmYaHKOmH3q6HBqH9fqrkTn18b791wGsOGMf8=
X-Received: by 2002:a05:6870:178e:b0:2c2:3e24:9b54 with SMTP id
 586e51a60fabf-2efed4b16bbmr1775160fac.11.1751029510306; Fri, 27 Jun 2025
 06:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
 <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 06:04:58 -0700
X-Gm-Features: Ac12FXz4HuRCQCqIgAwuSyAn2p3FTUW3xCVysI5avKQdPvQayJzO9voPeQsIo4E
Message-ID: <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Wh8tasL1qVaFK3cZqBZWZPQG4uURC1Kq
X-Proofpoint-ORIG-GUID: Wh8tasL1qVaFK3cZqBZWZPQG4uURC1Kq
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685e9708 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MIFqPDLa7Y6Tg69WKSUA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX+21hC24rX9jB
 N5ExFDtvd6INDBc7b+vs+ff4C7b2ZTFBhTOXZCwNUJevsRWdNJyR6S8WSiV6AeF+9nqjeqD2vwj
 pIAmS3XYJbujmRQl6sZPDhYV1hassFshXPhvltb9MupMGI8VmLZa70OkCYgj10rSohyTlSccD0B
 M/jLqzcSnY1bv65KUO4bTf5b+fKATY27pN5lrpKw5N17j2ZaDVm8WVI1SsvtKBckr2qUkCNewDD
 3zN9zyG755Llo+XlFwxCuHY2q4MOGUo8e7aJLvoGmeO2+Nm23SLTXE7+gXGMVLsJt8+kIPjzatU
 f98fyjMnxyGW7pUOGD28p49zf51F9FpsJvv8l7zifIfgq1UeYBz97G7lejbBWQsRz8KePK59iZi
 /Usw7stHTSatnK5zH5uwFhFzEoeslLEVNCOaFu6sxORi8JCUxFaP88EYJmjsl8Us9RbK2NdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270108
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

On Fri, Jun 20, 2025 at 8:45=E2=80=AFAM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.
>
> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.
>
> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
> v3: Expand comments to show expected usage, and explain how the usage
>     is safe in the case of overlapping driver VM_BIND ops.

Danilo, did you have any remaining comments on this?

BR,
-R

> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 126 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |   8 +++
>  2 files changed, 134 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..a811471b888e 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,132 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void =
*priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
>
> +static int
> +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> +{
> +       struct drm_exec *exec =3D priv;
> +
> +       switch (op->op) {
> +       case DRM_GPUVA_OP_REMAP:
> +               if (op->remap.unmap->va->gem.obj)
> +                       return drm_exec_lock_obj(exec, op->remap.unmap->v=
a->gem.obj);
> +               return 0;
> +       case DRM_GPUVA_OP_UNMAP:
> +               if (op->unmap.va->gem.obj)
> +                       return drm_exec_lock_obj(exec, op->unmap.va->gem.=
obj);
> +               return 0;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct drm_gpuvm_ops lock_ops =3D {
> +       .sm_step_map =3D drm_gpuva_sm_step_lock,
> +       .sm_step_remap =3D drm_gpuva_sm_step_lock,
> +       .sm_step_unmap =3D drm_gpuva_sm_step_lock,
> +};
> +
> +/**
> + * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpu=
vm_sm_map()
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @num_fences: for newly mapped objects, the # of fences to reserve
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
> + * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> + * will be newly mapped.
> + *
> + * The expected usage is:
> + *
> + *    vm_bind {
> + *        struct drm_exec exec;
> + *
> + *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recomm=
ended:
> + *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0=
);
> + *
> + *        drm_exec_until_all_locked (&exec) {
> + *            for_each_vm_bind_operation {
> + *                switch (op->op) {
> + *                case DRIVER_OP_UNMAP:
> + *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec,=
 op->addr, op->range);
> + *                    break;
> + *                case DRIVER_OP_MAP:
> + *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, n=
um_fences,
> + *                                                     op->addr, op->ran=
ge,
> + *                                                     obj, op->obj_offs=
et);
> + *                    break;
> + *                }
> + *
> + *                drm_exec_retry_on_contention(&exec);
> + *                if (ret)
> + *                    return ret;
> + *            }
> + *        }
> + *    }
> + *
> + * This enables all locking to be performed before the driver begins mod=
ifying
> + * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND=
_OPs,
> + * where an earlier op can alter the sequence of steps generated for a l=
ater
> + * op, because the later altered step will involve the same GEM object(s=
)
> + * already seen in the earlier locking step.  For example:
> + *
> + * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
> + *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
> + *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
> + *
> + * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UN=
MAP
> + *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
> + *    required without the earlier DRIVER_OP_MAP.  This is safe because =
we've
> + *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
> + *
> + * Returns: 0 on success or a negative error codec
> + */
> +int
> +drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
> +                          struct drm_exec *exec, unsigned int num_fences=
,
> +                          u64 req_addr, u64 req_range,
> +                          struct drm_gem_object *req_obj, u64 req_offset=
)
> +{
> +       if (req_obj) {
> +               int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fence=
s);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> +                                 req_addr, req_range,
> +                                 req_obj, req_offset);
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> +
> +/**
> + * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpu=
vm_sm_unmap()
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
> + * remapped by drm_gpuvm_sm_unmap().
> + *
> + * See drm_gpuvm_sm_map_exec_lock() for expected usage.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *e=
xec,
> +                            u64 req_addr, u64 req_range)
> +{
> +       return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
> +                                   req_addr, req_range);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
> +
>  static struct drm_gpuva_op *
>  gpuva_op_alloc(struct drm_gpuvm *gpuvm)
>  {
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..274532facfd6 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void=
 *priv,
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>                        u64 addr, u64 range);
>
> +int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
> +                         struct drm_exec *exec, unsigned int num_fences,
> +                         u64 req_addr, u64 req_range,
> +                         struct drm_gem_object *obj, u64 offset);
> +
> +int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exe=
c *exec,
> +                                u64 req_addr, u64 req_range);
> +
>  void drm_gpuva_map(struct drm_gpuvm *gpuvm,
>                    struct drm_gpuva *va,
>                    struct drm_gpuva_op_map *op);
> --
> 2.49.0
>
