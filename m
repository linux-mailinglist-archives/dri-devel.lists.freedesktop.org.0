Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBCB0F209
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 14:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003BB10E142;
	Wed, 23 Jul 2025 12:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGl1tZdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C55C10E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:15:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9fJ09024458
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ktRoF5Kfb5cPS6qeC6LMCiTAb0WRcSIgGMsrYXoDOhs=; b=PG
 l1tZdbV8MVqulIE6u6qV1K75QvmND5uvQ7j+pGzdSxgwfTBpimtl4IHlLk9MGXZ/
 9ZKZwpx8jfq+gjGiF5kI1Ajm10mLZw6VEE1uT7weesW1KekQ9RJqs2t4OLFMP0JP
 +3AELmWW19xwevCsCp/Q68ND40klEQ0G2bQsZbimOaZpGG4RV69nzFuzNSPeqXv9
 rqEbYG0FaNacR00SuGg0ITBlOXKgS6muTBYwLs5I0dSaFYyraO/P70d0Ah1+zIzr
 n3FDEuH1G4GwTu5bVL7Wp8wPgMAnUgafKsE/UPXEErlE3qRU5RzL7IAx+vgm8Iwt
 VvPWwUytqnDLvpgsZg9g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6q90v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:15:53 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-40cc702f2edso6742015b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 05:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753272952; x=1753877752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ktRoF5Kfb5cPS6qeC6LMCiTAb0WRcSIgGMsrYXoDOhs=;
 b=uwn55csLoC9FMNLr/YBynGi/pGdQRxDUk7rQO1LOYIIt27tvZ5OLum6GunPynDfvJF
 fB3++7sRc3oZ0M476Le6vx0DPXXDJ2gxhOXk8WwJ/1xolctC+4j8GYGf1ASm2T1SEqbL
 3RbXmglmdE4Vh1Nj49XMmaggtewitJkoTy0aQbbb2w0UaNPPAY+5zP2ADieyS4i8cRmx
 f/a953HvZDyXR3JeJhxzF8/xkLQ9waJHGn796Z241JNpImXJaUGnbL/KDEZSENTqfF5B
 7o7OntEagwFQN4WDuj8LfAudl+gOk94/o2Ha6b3THx1j7RNGxQJR8BG+qTT8BTR8G1eI
 FrOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSqJNqvrmbDgGR2TiXhIdVuKyb14HMR03q7bIZbxNpoea2AvzVzvmhkwtk6Vwa8G1Sw0z+sENyQ5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydwvYxMZDR4jUpMQmboll4YWlUFPZFSAVgWYoW4KpH+5leuchL
 d31aTO3FJvfU8TdLwvbP+D9QLNal/ep95h5xE4p9IEG9ncUO1RLdBugSJPTd3VD9RsggvanBnxu
 GZ494t+7sEhByWYSVDXYwjDCSLcOndCPtWbMS9sIosxJxNYLJR6ObnmNVsbi+WNPS1EktULBGlV
 RMCk2ogDWO1rA6c21bjiuMFDrBUlg/D+0gWR/ORmDn9UvMug==
X-Gm-Gg: ASbGncvCElaA8qm+1RrPqvOZV9Cczo55XSP3+vdQ52g79JJnTvsj8rwRuz9HDD/kCIw
 ZCFYPASqS1gA7tDOqIvzuyitwrLODQ2Ie7I+r09NnXdhaQK2HOhB0IM+x1JbaoAcl/dH8JKGIEp
 HNBlRiF6atl8OqOOIGsl7wr+4Np7v/p+MwqZGMSjbej+5X7hObCMrC
X-Received: by 2002:a05:6820:2981:b0:611:ffa0:3863 with SMTP id
 006d021491bc7-6187d88903dmr2053775eaf.3.1753272952284; 
 Wed, 23 Jul 2025 05:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeb2Xwhvp+2DKFatcw4dSTUfUVWmQm3U2bXlTN1qoo5uB13l7WiQFxbIahvNdDFYo6nkhPPzon4nKaKEBWyz8=
X-Received: by 2002:a05:6820:2981:b0:611:ffa0:3863 with SMTP id
 006d021491bc7-6187d88903dmr2053745eaf.3.1753272951969; Wed, 23 Jul 2025
 05:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
 <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
In-Reply-To: <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 05:15:41 -0700
X-Gm-Features: Ac12FXwc8FFwXUKsmQ1l4f_2KQZK5PKdoGUYbUEsnP7UlhQh-lQcLU2tfqdZY8E
Message-ID: <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880d279 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=AnF7TAvy4Dos9zI8ue0A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: L5jMCUt_erBH9xxzVl9Zk7uwny_0T_EZ
X-Proofpoint-GUID: L5jMCUt_erBH9xxzVl9Zk7uwny_0T_EZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwNCBTYWx0ZWRfXyF7DcfSa4eaO
 rEOVeZ06d++dUa5kIrYb8UqX6w5SHKV+CP+/mcJmuicAUjMQpsFTlwPZSkVB5j2zGVs9hbBi4nm
 t2NOGfJJel1NKbYnpAuc97HgQiE5fVnnkWuCjvUvwxpKhFOANIcAb85XzEvPaNcsUyq/2fVJ9wq
 MgiYC6jGaCOXYqnPYiw5bmPk19cauuvNh0IOqcaQEeeuuABw9lL22auNljzlmNu4ZAFNTsuFU6i
 S3VqTXMCAUlyGSsLSVEl1qqI54LD1C00+qr9aEem5k3y/IAvTLvzlhwWeWc05RfQudWC4Nla70c
 8UWvnSZqe2vx4/jXscayejC0Rhb/36CyuWN/KqFu5i/p+Ow/9ceKnw3tnFiHVKZmftyDCeFqojB
 Lsj/DMF0r4K6qm6pl7VghWjgfySiKv4zoFN4xRZjsaENnFSfVhm4I9Xvcvcc/hbmPFvIjqxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230104
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

On Wed, Jul 23, 2025 at 3:19=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> > CP_ALWAYS_ON counter falls under GX domain which is collapsed during
> > IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
> > not impacted by IFPC. Both counters are clocked by same xo clock source=
.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++-----------=
---
> >  1 file changed, 16 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3=
c92e590f14999d10d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -16,6 +16,19 @@
> >
> >  #define GPU_PAS_ID 13
> >
> > +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     u64 count_hi, count_lo, temp;
> > +
> > +     do {
> > +             count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_H);
> > +             count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_L);
> > +             temp =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_=
COUNTER_H);
> > +     } while (count_hi !=3D temp);
>
> The original logic is as follows:
>
> static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
> {
>         struct kgsl_device *device =3D KGSL_DEVICE(adreno_dev);
>         u32 lo =3D 0, hi =3D 0, tmp =3D 0;
>
>         /* Always use the GMU AO counter when doing a AHB read */
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);
>
>         /* Check for overflow */
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);
>
>         if (hi !=3D tmp) {
>                 gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
>                                 &lo);
>                 hi =3D tmp;
>         }
>
>         return (((u64) hi) << 32) | lo;
> }
>
> Doing this in a while-loop almost looks like you want a lot of time to
> pass - REG_WIDTH(u32?)/19.2 MHz

would:

   } while (unlikely(count_hi !=3D temp));

make it more clear?

> Konrad
