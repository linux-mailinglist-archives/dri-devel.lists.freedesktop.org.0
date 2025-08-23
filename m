Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2AAB32595
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 02:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF7A10E012;
	Sat, 23 Aug 2025 00:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJmKgGTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9378E10E012
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:14:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUhHS005170
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=5q/OdSmF/cMGGczwyYiaDZdGQXvSJ/FPohyvehhsUvQ=; b=WJ
 mKgGTl0DyGDzKUz5B5rtc+cKqAltAtR7Z9CZMSv3Ac6c0utmSULuY1LnCePoCBv2
 8D9lBJlZNrwpvXyuczo2Xfft8gfahQ4bCq0YcGivFGcpH24raqH2xUovjEqQR7uG
 MCT8UPoOYBmbv5h/RgUveI62wkB3AfNgb9eIf1IHdDqBk7zvsDLhYlC5EHAMo4W7
 gZzCS8X0vXtcps/eP3olKjbOWb/i/XIxN4Yn8HWB+O2iXb1s7aWans/LrZH1hHdb
 KsiU7OoJrs2gt9otCm6VX5w2t12PFSKwSjBjHH4n7uX5sfDbpVVa+YAJpcAHTnaL
 fDqWLPNmXmfi/9bYXdDw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw100tvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:14:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-435de71b1adso1556428b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755908054; x=1756512854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5q/OdSmF/cMGGczwyYiaDZdGQXvSJ/FPohyvehhsUvQ=;
 b=HAnJ/f9eU6jAT/yF5dkqi6BJI919Cb7V7gZOtHtP6ZNd74N0a4KuXiPkTB+sA+tVqZ
 cGzl0qp/cieGaIcgD5jHLTTlP4w7Wl3UxPk+Za6CoXBJEC/ZbZBmaC+yGbATHSqR11Vh
 6Mc0ZDcmpG1j8qypULQrYu04Q6LPvKf+Np0R798htV75dZXTBmOb72bT4/VvarwYS4IC
 KO4QZZ6GQu098D9FLZlGt346BDqlcDqfr+pWj3GSe36BPN/arsCUGM1ZYbjFWWf9VD5J
 uQQKQho9t5uQ5JV+xPCucWo0MNy44enpbknXyl9grHsfMrctRe4xJDXh8sFjOJ3q8+/k
 ibEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxnSLs3lXlD04Z9hvNeYHFsv7xt4dW7R6HWoX1JQyEjO0IL72FC4+h0E9CdQwxeX8t7Mc7rguwk9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgGn1fjQlLKBocW2nm6nDmrVj1+15a5jbmWSd95oO1LYFf69Dw
 ss3ekpEjUvrg0LUABW9p08uvSeypcbp64DKvT3Lnqk1aqNC/HEN8bAQ7p8V7S308gqKi1bM30cw
 mTH+nchu6jOr74er0CjB91XioKlmnzLbmkNzomXItEytx4+sDX5Mft4TNwfPyqHZgaWfT85Ql8D
 MpSjXSZ/8Bk6aPvZ+4l94MMCZofM7zJIoHFbq/qZeGBDe0aQ==
X-Gm-Gg: ASbGncvcpdgiedNgEvvr7HrEMQwz0VPpmCRg5UQ7yMg51gAXhVCjDaB7ktiZRxycIbi
 kVKEfA1rHqoQAMiopTk8aii714VrZVmu1E89EhJdE0NwWWQGVg5alwR16KI5KUljJ9V64A8eu20
 9pWH8T/679hspSq6gBdHrxkbtOoC2w/Mo22UpAAqyoh7tUV8AXYryo
X-Received: by 2002:a05:6808:508b:b0:435:7445:9b54 with SMTP id
 5614622812f47-43785272d3fmr1994392b6e.7.1755908053587; 
 Fri, 22 Aug 2025 17:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4t+fq/ZGjil0DXAYYaSwcVpbr7d7MsOBcm0bO6kgAjPfM2vJH/vRb8WNpsTKBsxfQRwH/66jLfygmardG6Mw=
X-Received: by 2002:a05:6808:508b:b0:435:7445:9b54 with SMTP id
 5614622812f47-43785272d3fmr1994379b6e.7.1755908053191; Fri, 22 Aug 2025
 17:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 17:14:02 -0700
X-Gm-Features: Ac12FXyYHTzWHjyweR5vLi67evbQhmIDPXKLXYX2aATF5P7xijHggxde4nM5TrA
Message-ID: <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXyRq9ZeHXjuf2
 fVZvhRAkDaSpRMJyu8NX/GARyWenwlOgmbrnMKGOH4JWObe7jKqczTtwv2XqCUyl58Jj2j0nM4I
 dT1MO1af7AEPfUU6becybjBtHnu8oinPa7u9kPS/lHfACQh5jAnQSukkGrrWQ4G8mW40I/IeXMH
 ShO9OQpnMI0OBZXcoADRCKFL1h42cswGVa8CDtx8f9XSjX7IuzP7WZ5RENN5c3u9+UoQkbJD+tj
 CwkHEXG9QuMcuFOATGgezD6RKoT5kc+BRM49B7HLGFHlAifQMA9Kzv/si1Gp3JZN9f1RPs8G7Fl
 J0VVFQMeM0z9hlxYgGSHH9EZGM9x8OdLYuHs5HLUU2kgEHY8ZjVz2QkCP+UVM13oKz628v6JzXH
 Rhb7AM9a
X-Proofpoint-GUID: cFGnugRV7yj0M5rhuJmOX0qvqc1PxzUZ
X-Authority-Analysis: v=2.4 cv=bsRMBFai c=1 sm=1 tr=0 ts=68a907d7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=lOIBcmm3ity2mgyilJcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: cFGnugRV7yj0M5rhuJmOX0qvqc1PxzUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Fri, Aug 22, 2025 at 5:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
>
> Move op_mode initialization after finalizing all addresses and right
> before the drm_gpuva_init_from_op() call.
>
> Reported-by: Danct12 <danct12@disroot.org>
> Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 3f440bc1f7106f3b0091f037611d0b433e5e2c18..6df6b7c0984da57fe64de41fa=
54f7dea0a324c74 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -368,12 +368,6 @@ struct drm_gpuva *
>  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>                 u64 offset, u64 range_start, u64 range_end)
>  {
> -       struct drm_gpuva_op_map op_map =3D {
> -               .va.addr =3D range_start,
> -               .va.range =3D range_end - range_start,
> -               .gem.obj =3D obj,
> -               .gem.offset =3D offset,
> -       };
>         struct msm_gem_vm *vm =3D to_msm_vm(gpuvm);
>         struct drm_gpuvm_bo *vm_bo;
>         struct msm_gem_vma *vma;
> @@ -402,6 +396,13 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_=
gem_object *obj,
>         if (obj)
>                 GEM_WARN_ON((range_end - range_start) > obj->size);
>
> +       struct drm_gpuva_op_map op_map =3D {
> +               .va.addr =3D range_start,
> +               .va.range =3D range_end - range_start,
> +               .gem.obj =3D obj,
> +               .gem.offset =3D offset,
> +       };

Thanks,

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> +
>         drm_gpuva_init_from_op(&vma->base, &op_map);
>         vma->mapped =3D false;
>
>
> ---
> base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> change-id: 20250823-msm-fix-gpuvm-init-520d87ebcf26
>
> Best regards,
> --
> With best wishes
> Dmitry
>
