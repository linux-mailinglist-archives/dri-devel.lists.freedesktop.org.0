Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C9B477F9
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6EF10E3ED;
	Sat,  6 Sep 2025 22:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yo/uxGES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049510E13E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 22:19:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586MGDZF010326
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 22:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5iTNyga9h1nIGbJ+xAREn3+C/daXiXE9zIswfnn0wYA=; b=Yo/uxGESeImF94iQ
 MJ0AaS80UC9ARIVRahj8xzTFIhT3VM9tEJNchCLkcxe8dzKzoQ4IzCmBGdF/15h1
 Yh983JtSf8S6TUn2oInNvX2Pm4u/UEQkqXNNzk3PFLRxlBLjmMJydAqtk58rCT3P
 O48CVPzkTwOJ4/Zb2T9xfRKhisC8ELPw8ksWJgA92GayzbqBpzTUMVANksAm2Sef
 ECF2cpQc35JUD87kiEZVL9Tny/D98FO19S3zKesCj4YYxon21vuF9lb40rdL5asW
 1oi+jx1BA0iVf5y+XlvoorWDrfhrdmtJEjaNfz5/lNyq9P9vFX+G5fI9p+9RxDQr
 qpYxGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8986j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 22:19:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7ffb4a65951so1230783785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 15:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757197169; x=1757801969;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5iTNyga9h1nIGbJ+xAREn3+C/daXiXE9zIswfnn0wYA=;
 b=MURETgJQIAl6Zzs3Ev+AX6MCCDa/6CUC/ovHN4MmHEBClUkxghASIvkWrjwmy8X+VB
 Hsddm1VlevKzt4mFZFkawLhwzCaMiIg0ROFuuUYJecxWXydmPLpqUq4JMCQMijCLB7yq
 DXbFrPtzNMyN8VMjpxXtaR5Zhl2qagItBF/EYIc7SSI4cb5sMd2P7i8qa0g4+BI+Yf1q
 LEDbJfOC/0RAwpuKXE/qwjwNuIZmsUrpRRq6NF5HwvlHtFdWQ9rbreqCg5BUn6QzWlFB
 lm13qNBQLfFuuZfKQluf1tOpjM5CwKrynPFooLnog+HUStqRHNiLbIz8J1A8zOid5vWf
 SRXg==
X-Gm-Message-State: AOJu0YxNceNNAT4GusNs2v/zUNza/SVoQ7+gwPCvRErU6hbHWXj+JWRV
 H/l0Vzwd2QWVXrRFmEPJJqmiW6jpKCQqf898Ts9uAFGX6bDaraONt2zKvhe3fhMMx50u+dtBw+D
 m7p3lEL98yqkSPDwfIdLUSo6fklMEe60TfvCw3UMhcO/M7dYGjaliOLYAaoI9Om/0pXuHvTA=
X-Gm-Gg: ASbGnctYE4XeijEcjnPmypocyVdJ8vkTPxkioQVUvCwj9SW7xDQPmFMtwna2Zp88tY/
 Bce95EaHfQjY9LcG1J1YcJgvfDWA3mMuZv8oJKX+C+coSZYqRAAPGmQdyknqWOUxyggCwbm+FrE
 EjLKLwwosx8fWrjFw0TfFC3DZHbZJw3TVXgk3nyXCKGg4TjkQtAD7rmz3pdr9fZzeFitk1xewXl
 FEoni2E7SF9YBwJ3JNugTjkopR3GXNRPnOuA7/8c5gzu9qC+nSaX4A3XCPDOeriTCVxl8BuV3r2
 m5ZH845Jew87dRfW+KWH0AGGkALsLvsMYvYYwUPbSaoD06agzfgXUR86GcpTAM/uANQscyMX9Gn
 u57g7PvMrhiSl6vbOrupNNv0t7l/exSSenqBTebLvlpb1TK0n9nSZ
X-Received: by 2002:a05:620a:6988:b0:807:c011:4d94 with SMTP id
 af79cd13be357-813be24a04fmr343691385a.15.1757197169540; 
 Sat, 06 Sep 2025 15:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtIPAPZzeSP+iBvuIpURlnL4Cr1e3bYG5mSfoFLuROPx9ErQs+pxUZIjoMp2JZ7T334zdmQg==
X-Received: by 2002:a05:620a:6988:b0:807:c011:4d94 with SMTP id
 af79cd13be357-813be24a04fmr343688685a.15.1757197169036; 
 Sat, 06 Sep 2025 15:19:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032d73sm27537421fa.44.2025.09.06.15.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 15:19:26 -0700 (PDT)
Date: Sun, 7 Sep 2025 01:19:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync GPU registers from mesa
Message-ID: <dnnkrq64cwkoazl3e7om22u4ein4mvn52otm2kyd6hcfuk4keu@rga7l6rbvvsq>
References: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
 <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
 <CACSVV035P-xBFd7=MjCSKoyfp79_ztEoBEEaDc9HYPtZgVQAbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV035P-xBFd7=MjCSKoyfp79_ztEoBEEaDc9HYPtZgVQAbw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX0JK5pYX7qzYL
 I6j1mn69re6/PRByt1bFQF3g8hoP/eaB6rUbsuYSHmaIXOqY85fi0EZY/lG1WLCWqAMAveLyAzw
 nq5QLmhr1DwdkGu2nWsXWjZZ3jjpTeFo4GWFjDtC8ucdboCsqRf3V7/b0JcUSkpGv6HLwjQXyCb
 1QrkVw9W4hwpy8/rnX97VBLfXohHmWYCdEQpwe8zZ9jRdLaOmq1YaRH9tTPKht20BD0DFePyBMv
 jHQnwuCMTRA2umfLspIKP8v2tAprsZADpz6VaC8xdtTh3xnlvhqbC7ngQyo3jKM3qkrc4sa7cit
 6tYZk0uI4r2o3Vvh6CvH2ToyaKhVlAFw61sXmqg1IBxoH/PuMnhuogReVJq8GnhqK8SEsLQgShV
 xEbdOaW3
X-Proofpoint-ORIG-GUID: XqGkwFK3meneoy5Rlc_InugLZpxVlmyO
X-Proofpoint-GUID: XqGkwFK3meneoy5Rlc_InugLZpxVlmyO
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bcb372 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=V2sgnzSHAAAA:8 a=5cO3dDSpYDoClHOC_owA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Sat, Sep 06, 2025 at 03:05:25PM -0700, Rob Clark wrote:
> On Sat, Sep 6, 2025 at 11:55 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Sep 06, 2025 at 10:05:40AM -0700, Rob Clark wrote:
> > > In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> > > fix a7xx GPU snapshot.
> > >
> > > Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_DBGC")
> > >
> > > Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
> > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
> > >  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
> > >  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
> > >  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
> > >  7 files changed, 524 insertions(+), 497 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index 2e2090f52e26..3f5c4bcf32cc 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > >        * Needed for preemption
> > >        */
> > >       OUT_PKT7(ring, CP_MEM_WRITE, 5);
> > > -     OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> > > -     OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> > > +     OUT_RING(ring, lower_32_bits(memptr));
> > > +     OUT_RING(ring, upper_32_bits(memptr));
> >
> > Could you please comment, why are we droping all these accessors?
> 
> We redefined these addresses as reg64 so there is no longer HI/LO
> regs.. which works better for the c++ builders in userspace but means
> these accessors no longer are generated.

This should probably go to the commit message.

> 
> I suppose we could perhaps make gen_header.py generate legacy hi/lo
> regs from the reg64 for the "legacy" C builders..

> 
> BR,
> -R
> 
> >
> > >       OUT_RING(ring, lower_32_bits(ttbr));
> > >       OUT_RING(ring, upper_32_bits(ttbr));
> > >       OUT_RING(ring, ctx->seqno);
> > > @@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > >                */
> > >               OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> > > -             OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> > > -                             REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> > > -             OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
> > > +             OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> > > +             OUT_RING(ring, 0);
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> > > @@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
> > >
> > >       /* Set weights for bicubic filtering */
> > >       if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> > > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> > > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> > > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
> > > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > >                       0x3fe05ff4);
> > > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> > > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > >                       0x3fa0ebee);
> > > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> > > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > >                       0x3f5193ed);
> > > -             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> > > +             gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > >                       0x3f0243f0);
> > >       }
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
