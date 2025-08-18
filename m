Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA19B2B2DE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 22:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F7C10E4CA;
	Mon, 18 Aug 2025 20:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpF5nS7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6810E093
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:50:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFAKXs022741
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=XXvNjO9kv8BPFIdG36AKFnHrEyADXWsmlTB14aNVGcA=; b=kp
 F5nS7EWsf6m7g2O0iO59mrkUdc0dJkXqIQDwm8A9NRM1FqPOYngjJtCushXCvXj7
 GweOlJVqT5QKmooa4KF2pXGIP3NMc69qw7zMQCMPBg9gPuo7zQ5Y0r42S17bvxZc
 cpMNVx9JsOn0/tg37cr8ZgMA8aGS3v1Dfv9w4No/0+eEPWJna1++nN6NVNhcWKLF
 3PN8a0o359swpyCDp1VUBIi7CKo3P/KxgyHcD4FZo8BdJo1P1D83IwRQaW8tf9RY
 BteKniNDNqiHpZLcsJAl3pouLv3vMw33O84S6b6IUdN4XiYHljs+5Ak/uYvVexeo
 7t1Ntp9VV0Nfu9qhXISA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtecns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:50:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-74381fe311dso9824600a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 13:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755550205; x=1756155005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XXvNjO9kv8BPFIdG36AKFnHrEyADXWsmlTB14aNVGcA=;
 b=Dxv5/+5luJiWeMlhJ/et+FugeVlQ0CVUD45L3J9YfVLG3Tct/zr1nnlYchiKo8SKfX
 DTWPQ04e0KXIE31LeM3cJmRjz9ShHuW5kZK/UCKoy3YiYnDro0jpoqxCg9fIlak7dAJa
 PBaFRIPCQWaIGbsunIq+Nz4ujEo79YLbFMdD+/SUEa+J4YsfjJBtMdyXy6f56RNmtG2p
 n6JbWUIOCieo53pzlIUNFP6N7P9j4uEOOcgA4MvIVpjALf5zFwMHTVXm0vZOZSJjdb2m
 MidYVIfiJ19gAQTkNYOpww4RInQdh0utF05EhFBARJq7TO+/O3/+thIlIxhywCL/NdgP
 MoPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpIezcUhSqPr2BkTNQfX81yZe17edaEybAirAa2wwsIXKt/PKRSZgxidTM9n33+7iMy/QC7Rw73jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhxID614UxfXtSfWVWhD7fL49YzBHKaK8iKmo9DRPOug8m+ADS
 3Eq6ZoHHx9s3nM7nF9p8x7nStzGBZDMrVYdFeBPgDFdwtfFrq51uOS8f8kyJoKTo2xVDWG3LM00
 JOozwO1Q5Sj0OfYmH+PNJeARpCw8W4lElxRSmIO+hPeiyPBT3Xs1CGTomswnaWlqO5eeha1v+8I
 1b8QuLa36SqccmIsimWN6trBKVIGHbGPYizMlZr71TvlVeBA==
X-Gm-Gg: ASbGncvKpG4gXjC6yQaR+9yCwzXJsZez9EddowoN4M6J5MnpuuRVqCHUtlld5hDknQG
 +zAneRbn4IOvHfJJdyWwcEENkVal4cYIuEHzsIf6Gigo013DUynCGi0esW8KYjAs0p0ASQvSoba
 nFEp7Wbo/qKn8N3lBl5/cFAVlxGkhvFJ/3gPB9lTcz8zDWhf0PTauk
X-Received: by 2002:a05:6808:2213:b0:433:eccb:9ecf with SMTP id
 5614622812f47-436da4e0cffmr108247b6e.35.1755550204542; 
 Mon, 18 Aug 2025 13:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3uNktOLGOJC1Vt+3WQjUTkCMkkl2DdspVXiPtzRprZH3b+BBd1BbKEkQwIcGpW4CQtyJ7CyG6GpZY+W123bk=
X-Received: by 2002:a05:6808:2213:b0:433:eccb:9ecf with SMTP id
 5614622812f47-436da4e0cffmr108226b6e.35.1755550204007; Mon, 18 Aug 2025
 13:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:49:53 -0700
X-Gm-Features: Ac12FXzlNHLLWlSvOKEwLeDy-IblFWzz21G7CpbPHcLDevDb_l8jANYcnW82B-E
Message-ID: <CACSVV02BoCN+yVf5ttzeUm6oM-=Onh-Ao9+6vJVRi6EEG3q9hA@mail.gmail.com>
Subject: Re: [PATCH v7 01/24] drm/gpuvm: Pass map arguments through a struct
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DRhgW-rjeZ67m8WbQlu0N55xR0qSb0Zr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+gOK+mGThtpM
 fXqGZ+9myTdlWqVeUkAf7EDfkUucaXOmQZ7F8vDZTRWYiopZJKWIaovIdwA6WeyPc6BmQbL0p3I
 RJY8L3oatpV7elBiHG+GteW+weIr4JmtAzDVcfYIwmD5OxJdDjh7iVT6TguuGTa186iMHDxX6ly
 LK7hFFiRw9Cb7xmi9FMTP7+MfdnToV8SZsss6edUwRmkR7mqJbzO69tfPf5GdweTH149fFVV9IM
 2fO4bMZKnfqJyz3XVjhNELbuYpQU+W2m4ccR2PZoY/Q2gpQunbyiJFmZ8e/zI0knocaxM4siefJ
 w3E53NV0c6AGxEOTfrvp1y+6s/mQafDiBSSJ0JA9/3SGs1lk7m5pcZ/I9d4X8BerLCK2zQegAK9
 Ha4UOE2Q
X-Proofpoint-GUID: DRhgW-rjeZ67m8WbQlu0N55xR0qSb0Zr
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a39205 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=S1NB-8CWqwDkTRG09mgA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Thu, Aug 14, 2025 at 3:32=E2=80=AFAM Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
>
> v5
>  - Use drm_gpuva_op_map=E2=80=94same as drm_gpuvm_map_req
>  - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>  - Fix kernel-docs
>
> v6
>  - Use drm_gpuvm_map_req (Danilo/Matt)
>
> v7
>  - change member name to map instead of op_map
>  - use local variable to minize the code changes in _sm_map
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org> #v4
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 74 +++++++++++---------------
>  drivers/gpu/drm/imagination/pvr_vm.c   | 15 ++++--
>  drivers/gpu/drm/msm/msm_gem_vma.c      | 25 +++++++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 11 ++--
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 13 +++--
>  drivers/gpu/drm/xe/xe_vm.c             | 13 +++--
>  include/drm/drm_gpuvm.h                | 20 ++++---
>  7 files changed, 102 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..6c18cec70f11 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -486,13 +486,18 @@
>   *                               u64 addr, u64 range,
>   *                               struct drm_gem_object *obj, u64 offset)
>   *     {
> + *             struct drm_gpuvm_map_req map_req =3D {
> + *                     .map.va.addr =3D addr,
> + *                     .map.va.range =3D range,
> + *                     .map.gem.obj =3D obj,
> + *                     .map.gem.offset =3D offset,
> + *                };
>   *             struct drm_gpuva_ops *ops;
>   *             struct drm_gpuva_op *op
>   *             struct drm_gpuvm_bo *vm_bo;
>   *
>   *             driver_lock_va_space();
> - *             ops =3D drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> - *                                               obj, offset);
> + *             ops =3D drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
>   *             if (IS_ERR(ops))
>   *                     return PTR_ERR(ops);
>   *
> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -         u64 addr, u64 range,
> -         struct drm_gem_object *obj, u64 offset)
> +         const struct drm_gpuvm_map_req *req)
>  {
>         struct drm_gpuva_op op =3D {};
>
>         op.op =3D DRM_GPUVA_OP_MAP;
> -       op.map.va.addr =3D addr;
> -       op.map.va.range =3D range;
> -       op.map.gem.obj =3D obj;
> -       op.map.gem.offset =3D offset;
> +       op.map.va.addr =3D req->map.va.addr;
> +       op.map.va.range =3D req->map.va.range;
> +       op.map.gem.obj =3D req->map.gem.obj;
> +       op.map.gem.offset =3D req->map.gem.offset;
>
>         return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,10 +2106,14 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void =
*priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>                    const struct drm_gpuvm_ops *ops, void *priv,
> -                  u64 req_addr, u64 req_range,
> -                  struct drm_gem_object *req_obj, u64 req_offset)
> +                  const struct drm_gpuvm_map_req *req)
>  {
> +       struct drm_gem_object *req_obj =3D req->map.gem.obj;
>         struct drm_gpuva *va, *next;
> +
> +       u64 req_offset =3D req->map.gem.offset;
> +       u64 req_range =3D req->map.va.range;
> +       u64 req_addr =3D req->map.va.addr;
>         u64 req_end =3D req_addr + req_range;
>         int ret;
>
> @@ -2236,9 +2244,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>                 }
>         }
>
> -       return op_map_cb(ops, priv,
> -                        req_addr, req_range,
> -                        req_obj, req_offset);
> +       return op_map_cb(ops, priv, req);
>  }
>
>  static int
> @@ -2303,10 +2309,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to struct drm_gpuvm_map_req
>   *
>   * This function iterates the given range of the GPU VA space. It utiliz=
es the
>   * &drm_gpuvm_ops to call back into the driver providing the split and m=
erge
> @@ -2333,8 +2336,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   */
>  int
>  drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -                u64 req_addr, u64 req_range,
> -                struct drm_gem_object *req_obj, u64 req_offset)
> +                const struct drm_gpuvm_map_req *req)
>  {
>         const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
>
> @@ -2343,9 +2345,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *pri=
v,
>                        ops->sm_step_unmap)))
>                 return -EINVAL;
>
> -       return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -                                 req_addr, req_range,
> -                                 req_obj, req_offset);
> +       return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>
> @@ -2421,10 +2421,7 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @exec: the &drm_exec locking context
>   * @num_fences: for newly mapped objects, the # of fences to reserve
> - * @req_addr: the start address of the range to unmap
> - * @req_range: the range of the mappings to unmap
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuvm_map_req struct
>   *
>   * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
>   * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> @@ -2445,9 +2442,7 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec,=
 op->addr, op->range);
>   *                    break;
>   *                case DRIVER_OP_MAP:
> - *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, n=
um_fences,
> - *                                                     op->addr, op->ran=
ge,
> - *                                                     obj, op->obj_offs=
et);
> + *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, n=
um_fences, &req);
>   *                    break;
>   *                }
>   *
> @@ -2478,18 +2473,17 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>  int
>  drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>                            struct drm_exec *exec, unsigned int num_fences=
,
> -                          u64 req_addr, u64 req_range,
> -                          struct drm_gem_object *req_obj, u64 req_offset=
)
> +                          struct drm_gpuvm_map_req *req)
>  {
> +       struct drm_gem_object *req_obj =3D req->map.gem.obj;
> +
>         if (req_obj) {
>                 int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fence=
s);
>                 if (ret)
>                         return ret;
>         }
>
> -       return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> -                                 req_addr, req_range,
> -                                 req_obj, req_offset);
> +       return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
>
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> @@ -2611,10 +2605,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops =
=3D {
>  /**
>   * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split a=
nd merge
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: map request arguments
>   *
>   * This function creates a list of operations to perform splitting and m=
erging
>   * of existent mapping(s) with the newly requested one.
> @@ -2642,8 +2633,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops =
=3D {
>   */
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -                           u64 req_addr, u64 req_range,
> -                           struct drm_gem_object *req_obj, u64 req_offse=
t)
> +                           const struct drm_gpuvm_map_req *req)
>  {
>         struct drm_gpuva_ops *ops;
>         struct {
> @@ -2661,9 +2651,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm=
,
>         args.vm =3D gpuvm;
>         args.ops =3D ops;
>
> -       ret =3D __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -                                req_addr, req_range,
> -                                req_obj, req_offset);
> +       ret =3D __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>         if (ret)
>                 goto err_free_ops;
>
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
> index 2896fa7501b1..3d97990170bf 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>  static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>  {
>         switch (bind_op->type) {
> -       case PVR_VM_BIND_TYPE_MAP:
> +       case PVR_VM_BIND_TYPE_MAP: {
> +               const struct drm_gpuvm_map_req map_req =3D {
> +                       .map.va.addr =3D bind_op->device_addr,
> +                       .map.va.range =3D bind_op->size,
> +                       .map.gem.obj =3D gem_from_pvr_gem(bind_op->pvr_ob=
j),
> +                       .map.gem.offset =3D bind_op->offset,
> +               };
> +
>                 return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> -                                       bind_op, bind_op->device_addr,
> -                                       bind_op->size,
> -                                       gem_from_pvr_gem(bind_op->pvr_obj=
),
> -                                       bind_op->offset);
> +                                       bind_op, &map_req);
> +       }
>
>         case PVR_VM_BIND_TYPE_UNMAP:
>                 return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 3cd8562a5109..e106428369ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1172,10 +1172,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *=
job, struct drm_exec *exec)
>                                 break;
>                         case MSM_VM_BIND_OP_MAP:
>                         case MSM_VM_BIND_OP_MAP_NULL:
> -                               ret =3D drm_gpuvm_sm_map_exec_lock(job->v=
m, exec, 1,
> -                                                           op->iova, op-=
>range,
> -                                                           op->obj, op->=
obj_offset);
> +                       {

nit (here and below), I'd prefer the opening brace on the same line as
the case statement (no need to resend for that, you can fixup when you
apply)

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> +                               struct drm_gpuvm_map_req map_req =3D {
> +                                       .map.va.addr =3D op->iova,
> +                                       .map.va.range =3D op->range,
> +                                       .map.gem.obj =3D op->obj,
> +                                       .map.gem.offset =3D op->obj_offse=
t,
> +                               };
> +
> +                               ret =3D drm_gpuvm_sm_map_exec_lock(job->v=
m, exec, 1, &map_req);
>                                 break;
> +                       }
>                         default:
>                                 /*
>                                  * lookup_op() should have already thrown=
 an error for
> @@ -1283,9 +1290,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>                                 arg.flags |=3D MSM_VMA_DUMP;
>                         fallthrough;
>                 case MSM_VM_BIND_OP_MAP_NULL:
> -                       ret =3D drm_gpuvm_sm_map(job->vm, &arg, op->iova,
> -                                              op->range, op->obj, op->ob=
j_offset);
> +               {
> +                       struct drm_gpuvm_map_req map_req =3D {
> +                               .map.va.addr =3D op->iova,
> +                               .map.va.range =3D op->range,
> +                               .map.gem.obj =3D op->obj,
> +                               .map.gem.offset =3D op->obj_offset,
> +                       };
> +
> +                       ret =3D drm_gpuvm_sm_map(job->vm, &arg, &map_req)=
;
>                         break;
> +               }
>                 default:
>                         /*
>                          * lookup_op() should have already thrown an erro=
r for
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nou=
veau/nouveau_uvmm.c
> index ddfc46bc1b3e..d94a85509176 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *j=
ob,
>                         break;
>                 case OP_MAP: {
>                         struct nouveau_uvma_region *reg;
> +                       struct drm_gpuvm_map_req map_req =3D {
> +                               .map.va.addr =3D op->va.addr,
> +                               .map.va.range =3D op->va.range,
> +                               .map.gem.obj =3D op->gem.obj,
> +                               .map.gem.offset =3D op->gem.offset,
> +                       };
>
>                         reg =3D nouveau_uvma_region_find_first(uvmm,
>                                                              op->va.addr,
> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *j=
ob,
>                         }
>
>                         op->ops =3D drm_gpuvm_sm_map_ops_create(&uvmm->ba=
se,
> -                                                             op->va.addr=
,
> -                                                             op->va.rang=
e,
> -                                                             op->gem.obj=
,
> -                                                             op->gem.off=
set);
> +                                                             &map_req);
>                         if (IS_ERR(op->ops)) {
>                                 ret =3D PTR_ERR(op->ops);
>                                 goto unwind_continue;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 4140f697ba5a..e3cdaa73fd38 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct =
panthor_vm_op_ctx *op,
>         mutex_lock(&vm->op_lock);
>         vm->op_ctx =3D op;
>         switch (op_type) {
> -       case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> +       case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> +               const struct drm_gpuvm_map_req map_req =3D {
> +                       .map.va.addr =3D op->va.addr,
> +                       .map.va.range =3D op->va.range,
> +                       .map.gem.obj =3D op->map.vm_bo->obj,
> +                       .map.gem.offset =3D op->map.bo_offset,
> +               };
> +
>                 if (vm->unusable) {
>                         ret =3D -EINVAL;
>                         break;
>                 }
>
> -               ret =3D drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->=
va.range,
> -                                      op->map.vm_bo->obj, op->map.bo_off=
set);
> +               ret =3D drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>                 break;
> +       }
>
>         case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>                 ret =3D drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op=
->va.range);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d40d2d43c041..15359ee738e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2337,10 +2337,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct=
 xe_vma_ops *vops,
>
>         switch (operation) {
>         case DRM_XE_VM_BIND_OP_MAP:
> -       case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> -               ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, ran=
ge,
> -                                                 obj, bo_offset_or_userp=
tr);
> +       case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> +               struct drm_gpuvm_map_req map_req =3D {
> +                       .map.va.addr =3D addr,
> +                       .map.va.range =3D range,
> +                       .map.gem.obj =3D obj,
> +                       .map.gem.offset =3D bo_offset_or_userptr,
> +               };
> +
> +               ops =3D drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req)=
;
>                 break;
> +       }
>         case DRM_XE_VM_BIND_OP_UNMAP:
>                 ops =3D drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, r=
ange);
>                 break;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 274532facfd6..a9fa44148e0c 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>
> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_=
create]()
> + */
> +struct drm_gpuvm_map_req {
> +       /**
> +        * @op_map: struct drm_gpuva_op_map
> +        */
> +       struct drm_gpuva_op_map map;
> +};
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -                           u64 addr, u64 range,
> -                           struct drm_gem_object *obj, u64 offset);
> +                           const struct drm_gpuvm_map_req *req);
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>                               u64 addr, u64 range);
> @@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
>  };
>
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -                    u64 addr, u64 range,
> -                    struct drm_gem_object *obj, u64 offset);
> +                    const struct drm_gpuvm_map_req *req);
>
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>                        u64 addr, u64 range);
>
>  int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>                           struct drm_exec *exec, unsigned int num_fences,
> -                         u64 req_addr, u64 req_range,
> -                         struct drm_gem_object *obj, u64 offset);
> +                         struct drm_gpuvm_map_req *req);
>
>  int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exe=
c *exec,
>                                  u64 req_addr, u64 req_range);
> --
> 2.34.1
>
