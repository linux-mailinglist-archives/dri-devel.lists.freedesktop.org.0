Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72749AD990F
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 02:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072A10E6D4;
	Sat, 14 Jun 2025 00:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIK8kLZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5023710E911
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:31:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DNhVCX027842
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=wSPCFDRXGi7WkL+9QNyzhOvPsUrsKkwicVeYLWyQRS4=; b=jI
 K8kLZmoS1HjK6JMTHbvIzRnBGIiydYyEISyBwMp8/H0fgi2oNR0UXk7KgJqskfxi
 jl6oozU16owaAVnszFVJgjF1/bJPTCCdvm83sIHk4wS+xkUpy8aJV9BOcpV72Ypi
 7yM0zV36Le/h9iaLQ20cOZEGPItuJALtkue6six+t2bCtVNbpZsDKGzjai05V0JY
 WsDVkRy4ejqmKGaZNlDB6cjbgFyFF8jNUnuSUMJGEgo2p1TMZMpN5Fi/WxYSJPx7
 ZH//s9b7oOANi/NeMjL/9fy7+/qHc3VMViAUvk2V1B+Y5E/nF/mck1nv6gAK/emD
 q+Fhzx/2K2osPRLDBtGg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478nyv0xj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:31:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-2e95bf2f61dso2062114fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749861090; x=1750465890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSPCFDRXGi7WkL+9QNyzhOvPsUrsKkwicVeYLWyQRS4=;
 b=pqMiHFFVe18vKWY8RdcI7xfsoTirAmBQl2iP1eufnbpgDp6pnvZHtK7VrcXfcC/39d
 jkdp9mqevwWN+t2k7npmqy5aRNLIMi2+IZPnfS6RXOa1g6uC42ou3BMFOlkvij67llpK
 gV7ZRpIqoqcBDwBJDj9X4vycY5wPLk+QBTR7d48qqmB29UWw2zsDZAVhQDY8Vp3pVIWl
 rHSEA53li2lfKRF1dvU8jSee5KuPkSYVaLZB+OidOxKDQRymdbq2mbHcY15r6To3Yheh
 9mu/KyJhwz2wv0RRQRBUOAEOmkIyaPZ9lnMVd8yXLUhZyHk/+2eRvt2KvWpTzgptgjfl
 vsUg==
X-Gm-Message-State: AOJu0YxpNNNy6WxNr0tBAk99J0D2vpMNKPF9ijLDii1N3OIbLLA4BUqn
 eoOwOf6pDpBpKwXM6/39dmTAU0LRVV+m5tJXNki1tmkJLIPvgJpOnrcugyvVMsjBbFz3gE4b7xo
 8Of0m4bA9co/pD/bJBzqU+DM3JD20JSqCEu2qgKY1dQNubOg1Caj0BX9WKrB2Y2gumLL+Hs8vcA
 FjSGkj4R/qayS/hVnEaHKFlJ/CZx6vydc/C9D43uK/LE/7FsQXCuDjj019
X-Gm-Gg: ASbGnctLu7QxOA1oalKcLF/Ivzjjzd2MmhtCCz4vONpe2zsb0e589OW1zyMqX83CVuT
 ReAxEcVA95lP8/nt9eRfH3cTBUtahN6hFg60aV1BbzfxlEVm9pJxPbyKxvc273wcQ8rSmqXbVqa
 pgZNLOeG3MrsVZ6+1Ts8TKvq9XpnMEE6kTBO8=
X-Received: by 2002:a05:6870:92c5:b0:2d5:714b:f07c with SMTP id
 586e51a60fabf-2eae9e4ecbamr1600040fac.5.1749861090211; 
 Fri, 13 Jun 2025 17:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2JEE77EPR4nk6/GCDG9k6zae0f76B624nV6HrnnzykOxwoIanLdN9IYY+qVAEv8oxGyaZHOiD9vg3kef6+cE=
X-Received: by 2002:a05:6870:92c5:b0:2d5:714b:f07c with SMTP id
 586e51a60fabf-2eae9e4ecbamr1600022fac.5.1749861089833; Fri, 13 Jun 2025
 17:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:31:19 -0700
X-Gm-Features: AX0GCFsMhrKxQL7KPbaS1-LL1p1Y8oLS4b_xGL0P7j_IA9nNoDuuXTK953qW86M
Message-ID: <CACSVV01seVcTwquu3gjEN=edJZG6UiV5WjokE3WL6QBxJbAUcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eDS-EO0zL6o2PqWiyjWwPof5f2M-Tbb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDAwMiBTYWx0ZWRfX3KAellQ784zf
 qiwsm5lxZNT7KN8IwTRR+AkDHTRXleZNgR2nPGaSg7/m2OTBn6UyDmq0YUlDp6Bu2CbJ6+86ch7
 BKQtk8UjoHJX4dOaBQu1MnOvnLqChnhhj4IFvZ3zpLHqdlhYFu8WpmdcZiWtmI6F2rLa6M+v+nR
 2DuiI5yzrxUj18YIqd+/DZKLSNrGjmJf0Ct3pftUIFswicOpQnVv/dGYwbt1unTYoK/DMfZjj2Z
 CQcaNVBA02DS8ghPgE6YB9sUOdJ+X5DdQqg9HjIosy4Yv7w8cbPn7w9yf25E5blyrQnXMKmwq7D
 Gze//CmxljAiYWKPeiweWViR466ZYDU+xsuoL0bW/tlKsmZJpzRqg5B61pWHSLW5lzmrwf0jBJT
 kjPF3MxReQVOvD2t/J8WtxwUOihAh/xSMIGJ93sPmbA+gsmU2jNtUYYJJD8cc1JFfZZvgXMG
X-Proofpoint-ORIG-GUID: eDS-EO0zL6o2PqWiyjWwPof5f2M-Tbb5
X-Authority-Analysis: v=2.4 cv=FoMF/3rq c=1 sm=1 tr=0 ts=684cc2e3 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=vTrAOcUJOkl49bEEHfkA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140002
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

On Fri, Jun 13, 2025 at 4:57=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
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
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

And if it wasn't clear/obvious, the expected usage is something that
looks like: https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer=
/drivers/gpu/drm/msm/msm_gem_vma.c?ref_type=3Dheads#L1150

ie. the caller handles the drm_exec_until_all_locked bit


BR,
-R

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  8 ++++
>  2 files changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..197066dd390b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *=
priv,
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
> + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm=
_map()
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
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +                     struct drm_exec *exec, unsigned int num_fences,
> +                     u64 req_addr, u64 req_range,
> +                     struct drm_gem_object *req_obj, u64 req_offset)
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
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);
> +
> +/**
> + * drm_gpuvm_sm_unmap_lock() - locks the objects touched by drm_gpuvm_sm=
_unmap()
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapp=
ed/
> + * remapped by drm_gpuvm_sm_unmap().
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
> +                       u64 req_addr, u64 req_range)
> +{
> +       return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
> +                                   req_addr, req_range);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_lock);
> +
>  static struct drm_gpuva_op *
>  gpuva_op_alloc(struct drm_gpuvm *gpuvm)
>  {
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0ef837a331d6..a769dccfb3ae 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void=
 *priv,
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>                        u64 req_addr, u64 req_range);
>
> +int drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +                         struct drm_exec *exec, unsigned int num_fences,
> +                         u64 req_addr, u64 req_range,
> +                         struct drm_gem_object *obj, u64 offset);
> +
> +int drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *ex=
ec,
> +                           u64 req_addr, u64 req_range);
> +
>  void drm_gpuva_map(struct drm_gpuvm *gpuvm,
>                    struct drm_gpuva *va,
>                    struct drm_gpuva_op_map *op);
> --
> 2.49.0
>
