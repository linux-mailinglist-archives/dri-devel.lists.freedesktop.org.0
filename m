Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45CB0E292
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 19:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC0D10E314;
	Tue, 22 Jul 2025 17:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsofTea7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9410E314
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 17:27:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFDfYT031374
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 17:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=YrjoZd7QCC3rgO1NgwMgFJMp5C62tulHsO96Xx3lRDo=; b=Cs
 ofTea7bG1QFvcknnfaPBsuxWjCB0UwTjj5Zxci9asGpuq3hMstWoQjWAYWaQDz6B
 SKzUwUS2+OFrMyBfT67QLCCUXA8ajpRXPRsbKJYuCbS1NF/tV2sAGDF3o0x8iBLe
 fx1o+KOJyRfQSaPRPXzgZTqFM0cyKn8FJmuAtn+/+bSoL8bYkJQ+MpfwEnAjsNPu
 RD15BGgWVFRAu4Lx6rdPekOfXW+j2+oamlWVWByfQ6cb+s15qRWrFmL8VCPOPk3z
 PkIj7pRqYREenC2JWlrfUZjc5xmGvWImFdfYSdSRTdusmESyXLdbaUEt4xMrkmRY
 c2r7LhemJkovIgAzdbyA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hrdr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 17:27:10 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4033c872b60so4458642b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 10:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753205229; x=1753810029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YrjoZd7QCC3rgO1NgwMgFJMp5C62tulHsO96Xx3lRDo=;
 b=t5d7BJx4XmeB2Uib1pS8fyUEGFdeudgzv+selebDrDyrRNK2Ddpwkn0rE5mdSYn0ZY
 bWbew1n9u1ujgiO4RWe5qWn0QCkVr4DnRUIbc9pFQGvLQFI57gczT5qBtgFzaufGwoaJ
 dn9ca2G+4Xg1zqp7/V3Us+khTIFRHd8JCcNVGzhO6Dc6h1fjhMCc1GackAa6pviUBF2h
 k9z5K+7cy1YwG1ed3eTqVKZdN0Ll9r/+iG+fJ1Yko4zPwtGALEitMl/LxyiFS2UO3YcX
 +YVxRH4Cc6iS1cLqXSMgrvpVykQRUL/BYBsVoGz7GvuVYETxYBBHJRpayOvMFdQq1rDs
 7OgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVysZkFlTnPfPuIzzgPCwEIT9PeJeynVo1Y773/ERAgKaR28DKYqew93tSZLJtfcp+kc2aLo4wagqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxInrPQnkyuegHPFIPN9w6Bqgn5rMQX57TX1wsD5pg+IbXgsvIE
 oSuhvHIOPhx3x9whI/A4xsJqJh0+oJkWhTqqrcHylHzFRs+4cH6pGLqfPa2m1zoDYkIXiNb+Uk7
 RYr61j8RwEfl2+EyZkJ2h7JtbjPj+/9hUElXX3i2mxFOEM14C+IxVgMfT+Qzy+JLJEw6VHivCRN
 OHzILv3kscx106/fP5zWNRDBfa4laEaQJ7DBwV5Mdz1Yfq7w==
X-Gm-Gg: ASbGncsHq5q2yYzFo74vPpIoiDCaVpSddLZZmS8Be/2umujIfQiTLXs1KG3D+ZTKvbr
 nUzIuW6/seXNv/xToJI4qD3UR9yYhF1QTzNk+xQWBCB6CRhR4dAuvfejS5Lop88CxXjn9QanWuL
 Ou8E/1feAGqp4tqY2VGgL8tpT/3izMBInXP+z2J1SwZ05C4Hs4YJvh
X-Received: by 2002:a05:6808:1b2c:b0:41c:1727:8b4d with SMTP id
 5614622812f47-426c4bdfe8amr134370b6e.11.1753205229223; 
 Tue, 22 Jul 2025 10:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt351bm791NHr11RGdS2kzc1apQfD8udpp73fwAAszYsw6GEV5yDdNjEt0nwD6ENSLExfzwwg6Dsyx6tcyQ74=
X-Received: by 2002:a05:6808:1b2c:b0:41c:1727:8b4d with SMTP id
 5614622812f47-426c4bdfe8amr134333b6e.11.1753205228734; Tue, 22 Jul 2025
 10:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
In-Reply-To: <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 10:26:58 -0700
X-Gm-Features: Ac12FXz7GgAd4CQ5r6mtT-fkFUIs76swU0cXdPQmfmKvXuiUlkOuIL_tdrwpuow
Message-ID: <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=687fc9ee cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5FltqUUlFAtdD00mdp8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0NiBTYWx0ZWRfX7bWq3hN6El57
 /9fEDCRFy+m3mF1PKl7tKHXVBf0H2JvEkKaiTAx5EJu06bqRHL89aRzscvPd8wrNsVzuFFS5lwu
 VXg6cPliMG8BuYF/lSSsXtmaaXT5lPKhELv+J9uCJdsvRJeak8eu/prcRVU9M3fPtgEYxv5MVTV
 mS8yJZh7EJr/pS8apCDBas2rb6dWPm5G/+2g/m1uPZE25lGBckvAMQ2SMVXN3g9AvaS78eAJB4m
 ZzoU2gHR+RoKgt/lSqQ+guM+Ig7aRdmN704Vvuq1XlQjxZYs576meeuUWIKNE1X08/K2nq8ItDv
 iy/vXVwwb5sMl0/hr10TS/sk/pr5pJVQmii52vTLJAPFhPbcCh6Cuk+cRxDpD16TvbLNWvzcRA4
 lmNUlcFt3ZkJ7ljXzazCfs89kGHkT0m2TPjJ2iA7a87Ir455U6tRVMTp3OJqGXYIKrB/NHDg
X-Proofpoint-GUID: x8czVg6ZJffRQeL_y5nrkH7ezKl5bOeg
X-Proofpoint-ORIG-GUID: x8czVg6ZJffRQeL_y5nrkH7ezKl5bOeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220146
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

On Tue, Jul 22, 2025 at 6:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
> > Since the PDC resides out of the GPU subsystem and cannot be reset in
> > case it enters bad state, utmost care must be taken to trigger the PDC
> > wake/sleep routines in the correct order.
> >
> > The PDC wake sequence can be exercised only after a PDC sleep sequence.
> > Additionally, GMU firmware should initialize a few registers before the
> > KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>
> s/KMD/the driver/

IMHO for gpu things "KMD" makes sense, to differentiate between kernel
and user mode (UMD).. this is perhaps different from other areas where
there isn't a userspace component to the driver stack

BR,
-R

> > GMU firmware has not initialized. Track these dependencies using a new
> > status variable and trigger PDC sleep/wake sequences appropriately.
>
> Again, it looks like there should be a Fixes tag here.
>
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++--------=
---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
> >  2 files changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68=
d64f24bda844e5e16 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
> >       if (ret)
> >               DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization time=
d out\n");
> >
> > +     set_bit(GMU_STATUS_FW_START, &gmu->status);
> > +
> >       return ret;
> >  }
> >
> > @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >       int ret;
> >       u32 val;
> >
> > +     if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
> > +             return 0;
> > +
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> >
> >       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> > @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >       int ret;
> >       u32 val;
> >
> > +     if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> > +             return;
> > +
> > +     /* TODO: should we skip if IFPC is not enabled */
>
> Is this a question or a statement?
>
> > +
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
> >
> >       ret =3D gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_=
DRV0,
> > @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >               DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\=
n");
> >
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
> > +
> > +     set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
> >  }
> >
> >  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
> > @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu=
)
> >       /* ensure no writes happen before the uCode is fully written */
> >       wmb();
> >
> > -     a6xx_rpmh_stop(gmu);
> > -
> >  err:
> >       if (!IS_ERR_OR_NULL(pdcptr))
> >               iounmap(pdcptr);
> > @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu=
, unsigned int state)
> >       else
> >               gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> >
> > -     if (state =3D=3D GMU_WARM_BOOT) {
> > -             ret =3D a6xx_rpmh_start(gmu);
> > -             if (ret)
> > -                     return ret;
> > -     } else {
> > +     ret =3D a6xx_rpmh_start(gmu);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (state =3D=3D GMU_COLD_BOOT) {
> >               if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
> >                       "GMU firmware is not loaded\n"))
> >                       return -ENOENT;
> >
> > -             ret =3D a6xx_rpmh_start(gmu);
> > -             if (ret)
> > -                     return ret;
> > -
> >               ret =3D a6xx_gmu_fw_load(gmu);
> >               if (ret)
> >                       return ret;
> > @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *g=
mu)
> >
> >       /* Reset GPU core blocks */
> >       a6xx_gpu_sw_reset(gpu, true);
> > +
> > +     a6xx_rpmh_stop(gmu);
> >  }
> >
> >  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx=
_gmu *gmu)
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.h
> > index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe=
6d06d64e5ace3b6e7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > @@ -117,6 +117,12 @@ struct a6xx_gmu {
> >
> >       struct qmp *qmp;
> >       struct a6xx_hfi_msg_bw_table *bw_table;
> > +
> > +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_s=
top() */
> > +#define GMU_STATUS_FW_START  0
> > +/* To track if PDC sleep seq was done */
> > +#define GMU_STATUS_PDC_SLEEP 1
> > +     unsigned long status;
> >  };
> >
> >  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry
