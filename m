Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D90BABF48
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 10:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2D110E145;
	Tue, 30 Sep 2025 08:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1qdBNuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED0810E145
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:08:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HpX9021203
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=tdPcpcAJ/7XDpmuDRfRlI/S+hgyHhmTmislpSVH8GwM=; b=N1
 qdBNufwiDVzEOm1n14Khll9R8w/v904q5xwWnUdHY+iMFph+zQgCzAqee7hpuQ9m
 kiAirEE2mhIbz7I9UbpuRVqzFdUB8o424nexa9uiWbLOM7ctuggeoBtR5tTXAxnn
 /PsUEJn8PaOLYs3yDHh1rY5UgW3KiGdTxFTp/dASNbhRKy+9sN/iX9Cz+5FydWC2
 5QScWuKxWt4HNqNBZUX4Sk3Mr4Gidp551w+dc4bnGpHaDMNG/9neFCcJ0a2dw7uj
 Dc21uMnkc2gvyYLtkzX6BNxB47aM4ldyUSXszsuvlNLH4IMV+n/9zD8vWQ6WF44w
 T5/cqXdOFetyW8XPG0fg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5r7gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:08:24 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-647706d442aso1233770eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759219703; x=1759824503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tdPcpcAJ/7XDpmuDRfRlI/S+hgyHhmTmislpSVH8GwM=;
 b=Q72m/cSGsuC+RRdKAZ8iaLo3SZPPYLyjmMWdUGdKYdx41omtDzYoCSiFCpBQW1S3cq
 ++T0IqsgmukfKg88vVctUDXAP+NqbuL8/k9KnbMwMVbD0dLi9vPmTe8H/XTcqvJEPomi
 VwsWOvH1ato89ittctzAOWmVO0DwUF4PfQSZnJ27ywngFH417fqXtfu6OYcMZy2pMkXP
 9EZAgnNsQVMh4D76uUXwMyX9w8rk5tCgCCbSEXwZl9NJwDZuuW9vCBGNtEPwUe9HsRJN
 qwOZlVweQwW/FBzbstzyGSxnuPAEQpyp9N8JnrSDkW5/X9hnzio1nuN+AXKdFKnvliq/
 ln5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxJ3UOopufzIRoKAL7s1L1SZDSMVQde9vjIYQOkWqaeZUQfsl0KrzGG1pOORopvPuKhjztYSTsYzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhStL8KL3Lc2Z4YzILfWj2ulvxsY1UtBjBfPIrifUEcN6Zdr/A
 GMVbFODyySTZ+aFXkuKW9SPwHM4PaLLNWdedcnYkGVGIfwZMOJeKJJQ4prHqLVZ7JsC5htcmYuD
 HtY0zWhljATDherSEezlLwAngRStZGS6qE42h6jG4P4eLnC4WCNtk66tqnNdm9J0QFkXtLakb0H
 bjYXJraxPQ7cpFH1oW+ccA8viUb3rChJ+cMk8g+hgmTgo+Ug==
X-Gm-Gg: ASbGncuUmmgeJWrE9pY0Cf1UrD/bmB4NlipgxEwbQYdFU3nRF6Qi5OohkHSCnzxy7+h
 CJBLkv+RMtWLeG7ZDpZAamUCZympiBIL71XkXDuaQFKNRu4cDwZpoaBVd/IzSGF+lZbBBfDkID6
 AZtW1Y+J3hzqrRolxJJ+NQ2HXPDlmWap+DmNkY2zbBkIHLYUHr3DUXsRU=
X-Received: by 2002:a05:6808:1a28:b0:43b:5101:4f11 with SMTP id
 5614622812f47-43f93fc1e78mr1860092b6e.9.1759219702843; 
 Tue, 30 Sep 2025 01:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcoEmRdWRcD570gTS4wPgVGpk7oyq939HgjsA8bixWbXV7rwUu71ZOf7cJVGAnkOtdD9wcOHxun3thoKqbhnc=
X-Received: by 2002:a05:6808:1a28:b0:43b:5101:4f11 with SMTP id
 5614622812f47-43f93fc1e78mr1860036b6e.9.1759219702086; Tue, 30 Sep 2025
 01:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
In-Reply-To: <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 01:08:10 -0700
X-Gm-Features: AS18NWCsh4S2MZXUcSJHYdZHGSXjKtcQjqoeMmepSAf77ciOOrg3D6uWf3QbvqE
Message-ID: <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
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
X-Proofpoint-GUID: zsF-2uBkr_Hr0CCYTryz2iVd2IplR-LV
X-Proofpoint-ORIG-GUID: zsF-2uBkr_Hr0CCYTryz2iVd2IplR-LV
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db8ff8 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=5vtyHJrLNaRNZaWRzd4A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXw/zQ2CHr8CSL
 CGISHpYu3Gw+nBZOICw3w7BQ4fxEdbeAgBLcmKV/uCNZJdJQBxrP3DcIe06FykUh5KrEqXAFXma
 dU6UmbTepwEPIf/SoEFKOrfilGMvx3g7VS1VQvSg2WaQomp5sRHLb/vHSe+LiX+hBBjP9fumnYc
 eYEO5xwCxx1xMISZXlM13FzH6+jZj8VJpI/SnMtsXMXTTeW8mUpFVp+6UchTffsLSoSPmID5dw2
 eKNOKsvMEb260xgPGVH3ncSaI3WCDibieq4VMbWXOxsLlcZPriCCpffAIyxOiagdTabMQLumE0+
 fr/bjWaI6kVh/r6orU1FyWc9m840IqV626FBQIjTIdoDVZ7Zo8CuOBZQ3WSudhiAL/Ll3vM83mK
 XNJLVIs+Tf8O97EFr69WMd6gXzDPyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

On Tue, Sep 30, 2025 at 12:43=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
> > A8x is the next generation of Adreno GPUs, featuring a significant
> > hardware design change. A major update to the design is the introductio=
n
> > of Slice architecture. Slices are sort of mini-GPUs within the GPU whic=
h
> > are more independent in processing Graphics and compute workloads. Also=
,
> > in addition to the BV and BR pipe we saw in A7x, CP has more concurrenc=
y
> > with additional pipes.
> >
> > From a software interface perspective, these changes have a significant
> > impact on the KMD side. First, the GPU register space has been extensiv=
ely
> > reorganized. Second, to avoid  a register space explosion caused by the
> > new slice architecture and additional pipes, many registers are now
> > virtualized, instead of duplicated as in A7x. KMD must configure an
> > aperture register with the appropriate slice and pipe ID before accessi=
ng
> > these virtualized registers.
> >
> > This patch adds only a skeleton support for the A8x family. An A8x GPU
> > support will be added in an upcoming patch.
>
> Consider this lands in a commit message. What would it mean in the Git
> history?
>
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                      |    1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  103 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   21 +
> >  drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 1238 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |    7 +
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |    1 -
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |    1 +
> >  7 files changed, 1344 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefil=
e
> > index 7acf2cc13cd047eb7f5b3f14e1a42a1cc145e087..8aa7d07303fb0cd66869767=
cb6298b38a621b366 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -24,6 +24,7 @@ adreno-y :=3D \
> >       adreno/a6xx_gmu.o \
> >       adreno/a6xx_hfi.o \
> >       adreno/a6xx_preempt.o \
> > +     adreno/a8xx_gpu.o \
> >
> >  adreno-$(CONFIG_DEBUG_FS) +=3D adreno/a5xx_debugfs.o \
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index bd4f98b5457356c5454d0316e59d7e8253401712..4aeeaceb1fb30a9d68ac636=
c14249e3853ef73ac 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -239,14 +239,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a=
6xx_gpu,
> >       }
> >
> >       if (!sysprof) {
> > -             if (!adreno_is_a7xx(adreno_gpu)) {
> > +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno=
_gpu))) {
>
> Here and in several other similar places:
>
>                 if (!adreno_is_a7xx(adreno_gpu) &&
>                     !adreno_is_a8xx(adreno_gpu))) {
>
> >                       /* Turn off protected mode to write to special re=
gisters */
> >                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> >                       OUT_RING(ring, 0);
> >               }
> >
> > -             OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
> > -             OUT_RING(ring, 1);
> > +             if (adreno_is_a8xx(adreno_gpu)) {
> > +                     OUT_PKT4(ring, REG_A8XX_RBBM_PERFCTR_SRAM_INIT_CM=
D, 1);
> > +                     OUT_RING(ring, 1);
> > +                     OUT_PKT4(ring, REG_A8XX_RBBM_SLICE_PERFCTR_SRAM_I=
NIT_CMD, 1);
> > +                     OUT_RING(ring, 1);
> > +             } else {
> > +                     OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CM=
D, 1);
> > +                     OUT_RING(ring, 1);
> > +             }
> >       }
> >
> >       /* Execute the table update */
> > @@ -275,7 +282,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6x=
x_gpu,
> >        * to make sure BV doesn't race ahead while BR is still switching
> >        * pagetables.
> >        */
> > -     if (adreno_is_a7xx(&a6xx_gpu->base)) {
> > +     if (adreno_is_a7xx(&a6xx_gpu->base) && adreno_is_a8xx(&a6xx_gpu->=
base)) {
> >               OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> >               OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_=
THREAD_BR);
> >       }
> > @@ -289,20 +296,22 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a=
6xx_gpu,
> >       OUT_RING(ring, CACHE_INVALIDATE);
> >
> >       if (!sysprof) {
> > +             u32 reg_status =3D adreno_is_a8xx(adreno_gpu) ?
> > +                     REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS :
> > +                     REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS;
> >               /*
> >                * Wait for SRAM clear after the pgtable update, so the
> >                * two can happen in parallel:
> >                */
> >               OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
> >               OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> > -             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(
> > -                             REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> > +             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(reg_status));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_HI(0));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
> >               OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> >
> > -             if (!adreno_is_a7xx(adreno_gpu)) {
> > +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno=
_gpu))) {
> >                       /* Re-enable protected mode: */
> >                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> >                       OUT_RING(ring, 1);
> > @@ -441,6 +450,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct=
 msm_gem_submit *submit)
> >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> >       struct msm_ringbuffer *ring =3D submit->ring;
> >       unsigned int i, ibs =3D 0;
> > +     u32 rbbm_perfctr_cp0, cp_always_on_counter;
> >
> >       adreno_check_and_reenable_stall(adreno_gpu);
> >
> > @@ -460,10 +470,16 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >       if (gpu->nr_rings > 1)
> >               a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
> >
> > -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > -             rbmemptr_stats(ring, index, cpcycles_start));
> > -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> > -             rbmemptr_stats(ring, index, alwayson_start));
> > +     if (adreno_is_a8xx(adreno_gpu)) {
> > +             rbbm_perfctr_cp0 =3D REG_A8XX_RBBM_PERFCTR_CP(0);
> > +             cp_always_on_counter =3D REG_A8XX_CP_ALWAYS_ON_COUNTER;
> > +     } else {
> > +             rbbm_perfctr_cp0 =3D REG_A7XX_RBBM_PERFCTR_CP(0);
> > +             cp_always_on_counter =3D REG_A6XX_CP_ALWAYS_ON_COUNTER;
> > +     }
> > +
> > +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, in=
dex, cpcycles_start));
> > +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring=
, index, alwayson_start));
> >
> >       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> >       OUT_RING(ring, CP_SET_THREAD_BOTH);
> > @@ -510,10 +526,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >               OUT_RING(ring, 0x00e); /* IB1LIST end */
> >       }
> >
> > -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > -             rbmemptr_stats(ring, index, cpcycles_end));
> > -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> > -             rbmemptr_stats(ring, index, alwayson_end));
> > +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, in=
dex, cpcycles_end));
> > +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring=
, index, alwayson_end));
> >
> >       /* Write the fence to the scratch register */
> >       OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
> > @@ -706,8 +720,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >       /* Copy the data into the internal struct to drop the const quali=
fier (temporarily) */
> >       *cfg =3D *common_cfg;
> >
> > -     cfg->ubwc_swizzle =3D 0x6;
> > -     cfg->highest_bank_bit =3D 15;
> > +     /* Use common config as is for A8x */
> > +     if (!adreno_is_a8xx(gpu)) {
> > +             cfg->ubwc_swizzle =3D 0x6;
> > +             cfg->highest_bank_bit =3D 15;
> > +     }
> >
> >       if (adreno_is_a610(gpu)) {
> >               cfg->highest_bank_bit =3D 13;
> > @@ -818,7 +835,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
> >                 cfg->macrotile_mode);
> >  }
> >
> > -static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> > +void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> >  {
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > @@ -868,7 +885,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu=
 *gpu)
> >       lock->dynamic_list_len =3D 0;
> >  }
> >
> > -static int a7xx_preempt_start(struct msm_gpu *gpu)
> > +int a7xx_preempt_start(struct msm_gpu *gpu)
> >  {
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > @@ -925,7 +942,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
> >       return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> >  }
> >
> > -static int a7xx_cp_init(struct msm_gpu *gpu)
> > +int a7xx_cp_init(struct msm_gpu *gpu)
> >  {
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > @@ -993,7 +1010,7 @@ static bool a6xx_ucode_check_version(struct a6xx_g=
pu *a6xx_gpu,
> >               return false;
> >
> >       /* A7xx is safe! */
> > -     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
> > +     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu) || a=
dreno_is_a8xx(adreno_gpu))
> >               return true;
> >
> >       /*
> > @@ -2161,7 +2178,7 @@ void a6xx_bus_clear_pending_transactions(struct a=
dreno_gpu *adreno_gpu, bool gx_
> >  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
> >  {
> >       /* 11nm chips (e.g. ones with A610) have hw issues with the reset=
 line! */
> > -     if (adreno_is_a610(to_adreno_gpu(gpu)))
> > +     if (adreno_is_a610(to_adreno_gpu(gpu)) || adreno_is_a8xx(to_adren=
o_gpu(gpu)))
> >               return;
> >
> >       gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
> > @@ -2192,7 +2209,12 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gp=
u)
> >
> >       msm_devfreq_resume(gpu);
> >
> > -     adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx_l=
lc_activate(a6xx_gpu);
> > +     if (adreno_is_a8xx(adreno_gpu))
> > +             a8xx_llc_activate(a6xx_gpu);
> > +     else if (adreno_is_a7xx(adreno_gpu))
> > +             a7xx_llc_activate(a6xx_gpu);
> > +     else
> > +             a6xx_llc_activate(a6xx_gpu);
> >
> >       return ret;
> >  }
> > @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_=
device *dev)
> >       adreno_gpu->base.hw_apriv =3D
> >               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> >
> > -     /* gpu->info only gets assigned in adreno_gpu_init() */
> > -     is_a7xx =3D config->info->family =3D=3D ADRENO_7XX_GEN1 ||
> > -               config->info->family =3D=3D ADRENO_7XX_GEN2 ||
> > -               config->info->family =3D=3D ADRENO_7XX_GEN3;
> > +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is incl=
uded intentionally */
> > +     is_a7xx =3D config->info->family >=3D ADRENO_7XX_GEN1;
>
> Is A8xx also a part of is_a7xx? What about the A9XX which will come at
> some point in future?
>
> >
> >       a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
> >
> > +
> > +int a8xx_gpu_feature_probe(struct msm_gpu *gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +     u32 fuse_val;
> > +     int ret;
> > +
> > +     /*
> > +      * Assume that if qcom scm isn't available, that whatever
> > +      * replacement allows writing the fuse register ourselves.
> > +      * Users of alternative firmware need to make sure this
> > +      * register is writeable or indicate that it's not somehow.
> > +      * Print a warning because if you mess this up you're about to
> > +      * crash horribly.
> > +      */
> > +     if (!qcom_scm_is_available()) {
>
> How can it be not available here?
>
> > +             dev_warn_once(gpu->dev->dev,
> > +                     "SCM is not available, poking fuse register\n");
> > +             a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> > +                     A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                     A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > +             adreno_gpu->has_ray_tracing =3D true;
> > +             return 0;
> > +     }
> > +
> > +     ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> > +                                  QCOM_SCM_GPU_TSENSE_EN_REQ);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * On a750 raytracing may be disabled by the firmware, find out
>
> It's a8xx-related code, why do you have a750 in the comment?

This is actually related to >=3D a750..  from a brief look it seems like
the whole fuse thing can be split into a helper and shared btwn
a7xx/a8xx?

BR,
-R

> > +      * whether that's the case. The scm call above sets the fuse
> > +      * register.
> > +      */
> > +     fuse_val =3D a6xx_llc_read(a6xx_gpu,
> > +                              REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> > +     adreno_gpu->has_ray_tracing =3D
> > +             !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> > +
> > +     return 0;
> > +}
> > +
> > +
> > +#define GBIF_CLIENT_HALT_MASK                BIT(0)
> > +#define GBIF_ARB_HALT_MASK           BIT(1)
> > +#define VBIF_XIN_HALT_CTRL0_MASK     GENMASK(3, 0)
> > +#define VBIF_RESET_ACK_MASK          0xF0
> > +#define GPR0_GBIF_HALT_REQUEST               0x1E0
> > +
> > +void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu=
, bool gx_off)
> > +{
> > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +
> > +     if (gx_off) {
> > +             /* Halt the gx side of GBIF */
> > +             gpu_write(gpu, REG_A8XX_RBBM_GBIF_HALT, 1);
> > +             spin_until(gpu_read(gpu, REG_A8XX_RBBM_GBIF_HALT_ACK) & 1=
);
> > +     }
> > +
> > +     /* Halt new client requests on GBIF */
> > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> > +     spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> > +                     (GBIF_CLIENT_HALT_MASK)) =3D=3D GBIF_CLIENT_HALT_=
MASK);
> > +
> > +     /* Halt all AXI requests on GBIF */
> > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> > +     spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> > +                     (GBIF_ARB_HALT_MASK)) =3D=3D GBIF_ARB_HALT_MASK);
> > +
> > +     /* The GBIF halt needs to be explicitly cleared */
> > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> > +}
> > +
> > +int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +
> > +     mutex_lock(&a6xx_gpu->gmu.lock);
> > +
> > +     /* Force the GPU power on so we can read this register */
> > +     a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> > +
> > +     *value =3D gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
> > +
> > +     a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> > +
> > +     mutex_unlock(&a6xx_gpu->gmu.lock);
> > +
> > +     return 0;
> > +}
> > +
> > +u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> > +{
> > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > +     u64 busy_cycles;
> > +
> > +     /* 19.2MHz */
> > +     *out_sample_rate =3D 19200000;
> > +
> > +     busy_cycles =3D gmu_read64(&a6xx_gpu->gmu,
> > +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
> > +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
> > +
> > +     return busy_cycles;
> > +}
> > +
> > +bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> > +{
> > +     return true;
> > +}
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 9831401c3bc865b803c2f9759d5e2ffcd79d19f8..6a2157f31122ba0c2f2a700=
5c98e3e4f1ada6acc 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -90,6 +90,13 @@ struct adreno_reglist {
> >       u32 value;
> >  };
> >
> > +/* Reglist with pipe information */
> > +struct adreno_reglist_pipe {
> > +     u32 offset;
> > +     u32 value;
> > +     u32 pipe;
> > +};
> > +
> >  struct adreno_speedbin {
> >       uint16_t fuse;
> >       uint16_t speedbin;
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gp=
u/drm/msm/registers/adreno/a6xx.xml
> > index ddde2e03b748f447b5e57571e2b04c68f8f2efc2..c3a202c8dce65d414c89bf7=
6f1cb458b206b4eca 100644
> > --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> > @@ -4876,7 +4876,6 @@ by a particular renderpass/blit.
> >  <domain name=3D"A6XX_CX_MISC" width=3D"32" prefix=3D"variant" varset=
=3D"chip">
> >       <reg32 offset=3D"0x0001" name=3D"SYSTEM_CACHE_CNTL_0"/>
> >       <reg32 offset=3D"0x0002" name=3D"SYSTEM_CACHE_CNTL_1"/>
> > -     <reg32 offset=3D"0x0087" name=3D"SLICE_ENABLE_FINAL" variants=3D"=
A8XX-"/>
>
> Why?
>
> >       <reg32 offset=3D"0x0039" name=3D"CX_MISC_TCM_RET_CNTL" variants=
=3D"A7XX-"/>
> >       <reg32 offset=3D"0x0087" name=3D"CX_MISC_SLICE_ENABLE_FINAL" vari=
ants=3D"A8XX"/>
> >       <reg32 offset=3D"0x0400" name=3D"CX_MISC_SW_FUSE_VALUE" variants=
=3D"A7XX-">
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/driver=
s/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > index 5dce7934056dd6472c368309b4894f0ed4a4d960..c4e00b1263cda65dce89c2f=
16860e5bf6f1c6244 100644
> > --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > @@ -60,6 +60,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.org/=
freedreno/ rules-fd.xsd">
> >       <reg32 offset=3D"0x1f400" name=3D"GMU_ICACHE_CONFIG"/>
> >       <reg32 offset=3D"0x1f401" name=3D"GMU_DCACHE_CONFIG"/>
> >       <reg32 offset=3D"0x1f40f" name=3D"GMU_SYS_BUS_CONFIG"/>
> > +     <reg32 offset=3D"0x1f50b" name=3D"GMU_MRC_GBIF_QOS_CTRL"/>
> >       <reg32 offset=3D"0x1f800" name=3D"GMU_CM3_SYSRESET"/>
> >       <reg32 offset=3D"0x1f801" name=3D"GMU_CM3_BOOT_CONFIG"/>
> >       <reg32 offset=3D"0x1f81a" name=3D"GMU_CM3_FW_BUSY"/>
> >
> > --
> > 2.51.0
> >
>
> --
> With best wishes
> Dmitry
