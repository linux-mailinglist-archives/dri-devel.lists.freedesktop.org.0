Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF1BAC0B8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 10:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C5310E524;
	Tue, 30 Sep 2025 08:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKXn4H+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AEA10E523
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:27:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOjI032518
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=te/ZoQVF9PRW/Vcak1agQLB+rzLOMt6hZjDiPBIvFPo=; b=GK
 Xn4H+96BGGnzBwd5vTeveqmwm2+ROJlE+usawWAKSsuwebQBlbNMkoDT5ysh/2l4
 j4KztS+NSFkvSI/GoyRcLqKba4lJme06Y1FICjT5MBx7/+CrgdoW3XwpYr7YSidn
 I1nUCog2rCBgFD1rZhjDpcPxcQD2IxHtkg2mzlCbWP9bOWLCXVCAOuXyWTqmjZaX
 DPprIu4mKijgTo3ND894o5PR3Tyf4tq0Vecl3JsrqWd4G76MwlswbzRViTdcWOJ1
 WTG4IvyGi6P7WZE25Hoxm8TqpJsgvKYuw9hR69Nv47O0kBo1PxgimsBuP7cCARq7
 nqi4JQnq21omtIlpzbEQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr3rby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:27:58 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-43f79c74a2aso693817b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 01:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220877; x=1759825677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=te/ZoQVF9PRW/Vcak1agQLB+rzLOMt6hZjDiPBIvFPo=;
 b=EXXdeGpnmewXAnuGnfOMt+q/5bQHoEkQHygQBu4ZH4W+iFsITOZqgHQTh9polyoq/Y
 nTaF0M91PYNs6O3DUBR1bY590KNy4Xl6yo47qhuATVBo3jgHcTdG53bRi0qb3CuOpU3L
 3TnHOGLVe5xuNtXbdy6KhLF8PqLl1Js0nylVzeIo2k0kCRTNGk9IWKR3WZzUaLnA7dAn
 6sfTFg3u6dBJ5yO94KPXeCogs64og7qahfifyhj5T+V/D8gnTrJsERa/tB4L8/6vvmp/
 RooTznDzQAXwlIYmwpMll25y7ULvwwkv1WybFpK79slgO7aXvD86+RkQhy6IzrI5NMaK
 9p4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEiL6QuO3HrkaSfT6EJp58E1vfpPPaKjnqVzQ5AfaaPkqh4WkbYs4PWcKBF68sv57+tkZ3bs8nFHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0lf3eU1F1AankehMS7QrnDUkXHVvrgt+wBa0ATegloZxR7xlf
 8WdwnDK5KmZq4rMzQ715jvKp/NEXOMbDtCH+Xa9ALj62gUuLYkWd4J8rIrTF9mzJgX311pO+WQa
 C+M8YjjYYks44W+L99PXXgD/X+6m5FPQLY6ivSrtBgsLKOdlIrIn1Z7/O6WZepbwjnm2djtfO3H
 YxshQIOkXOwaGGlIk2M9v1qk5MaaoyCgTqjU1ws1gkBhWh+Q==
X-Gm-Gg: ASbGnctlborF6CFufKCLUlZASJcolLk4eRE8aNsCKzUE1BpYaKJpb9ufUG4r43O6ewK
 ileAmCdzrEqGfMK+YYKgSjHzEogXrBah8MWe1Y5vZWTYOzQzfN0Rj+jQbiSFWcjMZlk/gtoqXlY
 9ndVlJHw4E0eLYjuph7B6Te2dwTQAEN56tWrLA6n5CBy9KaclerGd/yMY=
X-Received: by 2002:a05:6808:4fde:b0:43d:25a2:e28c with SMTP id
 5614622812f47-43f4cf464f3mr7573999b6e.49.1759220877262; 
 Tue, 30 Sep 2025 01:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH814E7mWrVlAtwKKyT7opGmi1FUZDDSJRR4sEXqt85rC60tExf6mnWRjS+3W0gCgMI5Vtl3QqcYmH2Ktkkf/U=
X-Received: by 2002:a05:6808:4fde:b0:43d:25a2:e28c with SMTP id
 5614622812f47-43f4cf464f3mr7573965b6e.49.1759220876731; Tue, 30 Sep 2025
 01:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 01:27:45 -0700
X-Gm-Features: AS18NWCqmbEpRBm5ANsrhcq-Z8jcjiekBnhyIkewW9_rwgY5GXXogY_b-bdPSxU
Message-ID: <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX4LmPzbJsrMmn
 txqq+Th+Lm4we1TfcWNtzve84JpbCbT0GRlYLPSDXYIZpvIJqp2L/n1Y/iWW8iyx01aSoMPQ6kG
 eF10F+OqK7JoctaaaStqzQrfaytBcD4ra22ZxgtlHiHrMo3hjpbVDXVhWRGLUGiSWSXQXDOKMpU
 R+0CG1HFiWanyblBDQQuOgM5B84+P/zR+kjYP9zdhKRJr9yy/672btPymTKGPA77+B6am7AqG2x
 3/h5ugaQ7gdTpsp+Jd+dqXeY1kTpl6ke5nOGWjJi3a/yxyq+c1e02sbDt2tf1CF5xq6gejBhnAF
 PP4e9qOmsX4P5aDzM6sfpCBCFq58Ru7wtwIgUpnPMWQh+1MtWNf/WNDPxlqg6CZceOghmi4BZqc
 c0Jv8316DeDrk5pYon20R90pg4QAEQ==
X-Proofpoint-ORIG-GUID: SggxwPuple1XVOFmeX4crvxFjL6une3L
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db948e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=fhJ7XYdx2Z3gjWMZPJIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: SggxwPuple1XVOFmeX4crvxFjL6une3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
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

On Mon, Sep 29, 2025 at 10:51=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b=
08851a94187e861 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 }
>         }
>
> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +               a6xx_gpu->aqe_bo =3D adreno_fw_create_bo(gpu,
> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iov=
a);
> +
> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +                       int ret =3D PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
> +                               "Could not allocate AQE ucode: %d\n", ret=
);
> +
> +                       return ret;
> +               }
> +
> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +               if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)=
) {

a6xx_ucode_check_version() doesn't do anything for aqe fw (but also
a6xx_ucode_check_version() should probably bail early for a8xx at this
point?)

OTOH if over time we keep growing the version checks, we might need to
re-think how a6xx_ucode_check_version() works.  But that is not a now
problem.

BR,
-R

> +                       msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +                       drm_gem_object_put(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       return -EPERM;
> +               }
> +       }
> +
>         /*
>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>          * privileged buffer to store the RPTR shadow
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 18300b12bf2a8bcd5601797df0fcc7afa8943863..a6ef8381abe5dd3eb202a645b=
b87a3bc352df047 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>
>         struct drm_gem_object *sqe_bo;
>         uint64_t sqe_iova;
> +       struct drm_gem_object *aqe_bo;
> +       uint64_t aqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
>         struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a8xx_gpu.c
> index 6a64b1f96d730a46301545c52a83d62dddc6c2ff..9a09ce37687aba2f720637ec3=
845a25d72d2fff7 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -599,6 +599,9 @@ static int hw_init(struct msm_gpu *gpu)
>                 goto out;
>
>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +       if (a6xx_gpu->aqe_iova)
> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->=
aqe_iova);
> +
>         /* Set the ringbuffer address */
>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc..3de3a2cda7a1b9e6d4c32075a=
faadc6604e74b15 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -27,6 +27,7 @@ enum {
>         ADRENO_FW_PFP =3D 1,
>         ADRENO_FW_GMU =3D 1, /* a6xx */
>         ADRENO_FW_GPMU =3D 2,
> +       ADRENO_FW_AQE =3D 3,
>         ADRENO_FW_MAX,
>  };
>
>
> --
> 2.51.0
>
