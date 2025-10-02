Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E00BB235C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75710E750;
	Thu,  2 Oct 2025 01:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvibUwMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9810E751
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:05:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcAdC022686
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 01:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rENwoiSg1tzLoiAPGqkjBCSK
 SjDWlFAHIwunjXnHHZk=; b=LvibUwMoWmMPV8/gulPd7d0dqzFKMrYzfeA3+kpS
 UyMKugvPCYLzj1AuNij2Xe8svkm61T3Nu+uMurHXzcEKuqqsTN+11a/TKpkLew+P
 6pt07NBg2AdyfG5L06+6Gd/0EQWwGpnU9F9JS+usdLdyoh9huUqKNKlqvcdDUV0s
 X6pvSnisQhvuX3vRO3vbpV/vMsWxsAjHkjnhUcICF+SrbWEul4xAfoZecWtAt/81
 uzzhLZSpsCW77T7GZsahnUPXW9hcFZimBFIH571ZJvZSqAjqn2whHU6u+AatH7Xk
 Kw6NFXO9OQoRfekRWMumaIlG0Op9mqvX2seb05sxiW9rLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6pct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:05:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7c547f51b36so11019636d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 18:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759367126; x=1759971926;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rENwoiSg1tzLoiAPGqkjBCSKSjDWlFAHIwunjXnHHZk=;
 b=YYum6FDVmnsNSoZf6Viw9RZCUn10GRCJS0/NFzSGjO/jvoSNx7JDyZ0QRcTw4Eacny
 K249p3IrPignxs+UWoP2y/HWq3zapvG+Iek+Hgqkl4RSD71spwIIv9bETI2QQ8WdhKnv
 tYcQ0Vq2e6TUZi3hgiqEFUNGsp++pv9rzmwlqOOOBh9qMGaq1z11UqpQto3+Rls7mM1Z
 l4OMd1/BkXXTyvzp4i4BljpFmyfUoNC/MZEJY+PNaPCFZo42W0JvJPvM2nIfE/eO/poC
 AGbF8UgYQz4M3DflOngnaTW0a4GRrhbhpXdN1VAU72Cu4TT3ElfSZWqj9PGuOYBozB+d
 aFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfJuLeWUU4kxzxebUpky+LEa/h4kYcNhTzeySRHQQTDLAeuKmkSBMx9BOk22l/LkiFmTZElQzK8uI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtpgm50uHtoFP7EdXxg5UVVQBuVXpv3yCbPGXshfnR6qw1hn6D
 oFcrB9AllzNVZfDmZVIYWgMomRJtnW2Y1BoN5xlMOM2Q3tmMiCA+E9g6o2Jd3S2Rk11TkAhWBxj
 LW+gr30hBsYyrue+maJqYa1RRhK9yE426k86E51dZQ00K9D6uDFbQGLmsAujfQWaVYzSGSlE=
X-Gm-Gg: ASbGncu7ZkkcrfLfEMA7xIrZ3/dGoCZImNrsnl1V/et/3gwsm6h/MibyqQBELnmEUQn
 DwIxE7rDil+eBjmMLUssBh5DcDKx0nRGH/367qBm+JoJfSIuE/8PovCoMpIDct81XVCpW62R9IK
 q3EtAF6puz2myfhh4f3lmHGn8VtHZSj4Mt43ye1VLhhO/RIXkI+K0mRntdMHWEzlcQnpWivUmzb
 3Rji1vFlF+pp6RFLVUse/PSTF4clmjk8h+2xGXnW64O8Ca0EEBGa3xAxW0scuv4qXXnS3Yt7kXi
 9lx9Pm2pHOCraLxTQhtopVI/sbUbYIPhf5tFLZgXKJKzDhUCN/1eWjFEcuTRQypOPHkDvq2Bti4
 RpN8UpVyUp4vYdGxqWUxW09VxTU6SR/wd8pZEeUDUTwQLfb3ZfCZpw8k52Q==
X-Received: by 2002:a05:622a:303:b0:4b6:2ffa:ac4f with SMTP id
 d75a77b69052e-4e41e542b1fmr83682031cf.57.1759367125580; 
 Wed, 01 Oct 2025 18:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeKctloyAQifsz5OI79+M2Awu+QEw5vBOffum/dFuw5MctXvZ7WXCFsn+Kj+KiiKDncHvDRg==
X-Received: by 2002:a05:622a:303:b0:4b6:2ffa:ac4f with SMTP id
 d75a77b69052e-4e41e542b1fmr83681451cf.57.1759367125094; 
 Wed, 01 Oct 2025 18:05:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113f01bsm345930e87.48.2025.10.01.18.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 18:05:23 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:05:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH 11/17] drm/msm/a8xx: Add support for A8x GMU
Message-ID: <sgdbegsvzwg2hc5omrcmtifhp5543rey6jax3zhaqrdqot4l3e@wp635oyywxlw>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
 <mbx2yihv4z3y5w6fptumw47rc3l33pbdduqnu66bgv2re64cjy@wgd2qq3uv64h>
 <20fb9f76-558b-48c8-92b0-9820407bb82f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20fb9f76-558b-48c8-92b0-9820407bb82f@oss.qualcomm.com>
X-Proofpoint-GUID: n897EsvK4O6Ppi9wouvhMsqH9GO42grg
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68ddcfd6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FDlLM7KsKmT8az22HMIA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: n897EsvK4O6Ppi9wouvhMsqH9GO42grg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX68VpRG8IZ3IE
 vD1oFIzWWYw3ePfQUi7rHzudTE49jIfEedA+/NjcFw+pfk/30LmcsErK7wROfq2kecLkxeRy6bD
 ICjt+uYMAGShM2SePCN4KTgIba2w1liS1d8kaoBCveCGjEe1uhlSzY0k6zOCJ+Co6LKximAnub4
 F0VfFXHo0aIp/3LirnHQMWaUyBR5X05UXhw3Gxrz8Y0Wc0UEkZvYfrFVrcfUqIkBhml0VMc/Lba
 ey8qtgd+hFWpmpKl3iwEeyA1bDDRta0aEvrJ0MwPap57sOFfn4oKYZtL89nEP6zMo27F8GOM3ks
 2ihi4f3/5TBdNT/tDGLA/ZFJCIXca1/hkNVGs4PgAs+pI4rm0Nfd2W9ekflTvjyB47AYmJM5ANg
 rvWpfDgYKtDmorQcdZKIeZjq4ud0Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 02, 2025 at 03:00:03AM +0530, Akhil P Oommen wrote:
> 
> 
> On 9/30/2025 1:05 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:16AM +0530, Akhil P Oommen wrote:
> > > A8x GMU configuration are very similar to A7x. Unfortunately, there are
> > > minor shuffling in the register offsets in the GMU CX register region.
> > > Apart from that, there is a new HFI message support to pass table like
> > > data. This patch adds support for  perf table using this new HFI
> > > message.
> > > 
> > > Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> > > to simplify handling of MxG to MxA fallback along with the additional
> > > calculations for the new dependency vote.
> > 
> > I'm sorry, I've sent it too early. This looks like a description
> > of a not-that-related change which should be split to a separate commit.
> > 
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > > @@ -555,6 +557,11 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
> > >   	       adreno_is_a740_family(gpu);
> > >   }
> > > +static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
> > > +{
> > > +	return gpu->info->family >= ADRENO_8XX_GEN1;
> > > +}
> > 
> > This and the register mask updates can go to a separate commit.
> 
> Which mask update exactly?

I'm sorry. Changes in register XML files, adding A8XX into the picture.

> 
> I can split out the hfi table addition and arc table updates into 2 separate
> patches.

That one too.

> 
> -Akhil.
> 
> > 
> > > +
> > >   /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
> > >   #define ADRENO_VM_START 0x100000000ULL
> > >   u64 adreno_private_vm_size(struct msm_gpu *gpu);
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > index 09b8a0b9c0de7615f7e7e6364c198405a498121a..5dce7934056dd6472c368309b4894f0ed4a4d960 100644
> > > --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > @@ -66,10 +66,15 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> > >   	<reg32 offset="0x1f81c" name="GMU_CM3_FW_INIT_RESULT"/>
> > >   	<reg32 offset="0x1f82d" name="GMU_CM3_CFG"/>
> > >   	<reg32 offset="0x1f840" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
> > > +	<reg32 offset="0x1fc10" name="GMU_CX_GMU_POWER_COUNTER_ENABLE" variants="A8XX"/>
> > >   	<reg32 offset="0x1f841" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
> > >   	<reg32 offset="0x1f842" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
> > > +	<reg32 offset="0x1fc40" name="GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_0" variants="A8XX-"/>
> > > +	<reg32 offset="0x1fc41" name="GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_1" variants="A8XX-"/>
> > >   	<reg32 offset="0x1f844" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L"/>
> > > +	<reg32 offset="0x1fca0" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L" variants="A8XX-"/>
> > >   	<reg32 offset="0x1f845" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H"/>
> > > +	<reg32 offset="0x1fca1" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H" variants="A8XX-"/>
> > >   	<reg32 offset="0x1f846" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L"/>
> > >   	<reg32 offset="0x1f847" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H"/>
> > >   	<reg32 offset="0x1f848" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L"/>

-- 
With best wishes
Dmitry
