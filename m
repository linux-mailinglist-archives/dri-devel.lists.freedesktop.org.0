Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6D97F167
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A60510E48C;
	Mon, 23 Sep 2024 19:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dQm3tQem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049410E484;
 Mon, 23 Sep 2024 19:55:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NJIUfW014333;
 Mon, 23 Sep 2024 19:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kwAUF/PD9Q/ci3FoStvE6JcT+M5E0drBu2ukXSBXlNI=; b=dQm3tQembtyuuuLn
 e6nfdWXtnodcQjvO9MXUzQp6EpSIx8PY4vtvQbfjBzacunD3T3TD/Fu+ANW2ih/+
 n9vZdjcN9NC7HoPMJN1lXoCePEcj0MVVVYejNWpy2yo7289IBD6emqAsiJiwHnOu
 gzDhku6+oUw++lwGsS+hxdArHq0Do657qGdkQ9e3CRKmZzoCyvyb+kd7Fdv7U+W2
 jM47tgT60Y1HlyKttS88YyaFdwLR4ArlL4i4V1NEPuQEtCZZx6i/JOJLc8skiS2P
 AUnWd1i4QVVJIDzz8auIYPF+OKZsMKpECG/BOxHJklFTPwYUp3HdXS/Gsghb/2y5
 zFMMxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgn6gka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 19:55:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NJtXTp004162
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 19:55:33 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 12:55:26 -0700
Date: Tue, 24 Sep 2024 01:25:23 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Puranam V G
 Tejaswi" <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add support for A663
Message-ID: <20240923195523.bxzpnzzg5q4vz4ix@hu-akhilpo-hyd.qualcomm.com>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
 <CACu1E7FGMX8KTbhS1HAEumD9Dx7K334bnJecg14-mSQBaZ4V5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FGMX8KTbhS1HAEumD9Dx7K334bnJecg14-mSQBaZ4V5g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: J9F0GC9k21c7f7xANDXZ3s84_Jx5X5mT
X-Proofpoint-GUID: J9F0GC9k21c7f7xANDXZ3s84_Jx5X5mT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230144
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

On Wed, Sep 18, 2024 at 06:51:50PM +0100, Connor Abbott wrote:
> On Tue, Sep 17, 2024 at 9:39 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >
> > Add support for Adreno 663 found on sa8775p based platforms.
> >
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  8 +++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 33 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
> >  4 files changed, 64 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > index 0312b6ee0356..8d8d0d7630f0 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -972,6 +972,25 @@ static const struct adreno_info a6xx_gpus[] = {
> >                         .prim_fifo_threshold = 0x00300200,
> >                 },
> >                 .address_space_size = SZ_16G,
> > +       }, {
> > +               .chip_ids = ADRENO_CHIP_IDS(0x06060300),
> > +               .family = ADRENO_6XX_GEN4,
> > +               .fw = {
> > +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
> > +                       [ADRENO_FW_GMU] = "a663_gmu.bin",
> > +               },
> > +               .gmem = SZ_1M + SZ_512K,
> > +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > +               .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV,
> > +               .init = a6xx_gpu_init,
> > +               .a6xx = &(const struct a6xx_info) {
> > +                       .hwcg = a690_hwcg,
> > +                       .protect = &a660_protect,
> > +                       .gmu_cgc_mode = 0x00020200,
> > +                       .prim_fifo_threshold = 0x00300200,
> > +               },
> > +               .address_space_size = SZ_16G,
> >         }, {
> >                 .chip_ids = ADRENO_CHIP_IDS(0x06030500),
> >                 .family = ADRENO_6XX_GEN4,
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 06cab2c6fd66..e317780caeae 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -541,6 +541,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >                 gpu->ubwc_config.macrotile_mode = 1;
> >         }
> >
> > +       if (adreno_is_a663(gpu)) {
> > +               gpu->ubwc_config.highest_bank_bit = 13;
> > +               gpu->ubwc_config.ubwc_swizzle = 0x4;
> 
> It's already been mentioned in the Mesa MR, but since this is the
> first GPU with level2_swizzling_dis set, the relevant vulkan CTS tests
> need to be tested with
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
> rebased on your Mesa enablement patch.

Will check this. But I prefer to not block DRM side patches on this.

-Akhil.

> 
> > +               gpu->ubwc_config.macrotile_mode = 1;
> > +       }
> > +
> >         if (adreno_is_7c3(gpu)) {
> >                 gpu->ubwc_config.highest_bank_bit = 14;
> >                 gpu->ubwc_config.amsbc = 1;
> > @@ -1062,7 +1068,7 @@ static int hw_init(struct msm_gpu *gpu)
> >         if (adreno_is_a690(adreno_gpu))
> >                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
> >         /* Set dualQ + disable afull for A660 GPU */
> > -       else if (adreno_is_a660(adreno_gpu))
> > +       else if (adreno_is_a660(adreno_gpu) || adreno_is_a663(adreno_gpu))
> >                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
> >         else if (adreno_is_a7xx(adreno_gpu))
> >                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > index cdb3f6e74d3e..f1196d66055c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > @@ -478,6 +478,37 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >         msg->cnoc_cmds_data[1][0] =  0x60000001;
> >  }
> >
> > +static void a663_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> > +{
> > +       /*
> > +        * Send a single "off" entry just to get things running
> > +        * TODO: bus scaling
> > +        */
> > +       msg->bw_level_num = 1;
> > +
> > +       msg->ddr_cmds_num = 3;
> > +       msg->ddr_wait_bitmask = 0x07;
> > +
> > +       msg->ddr_cmds_addrs[0] = 0x50004;
> > +       msg->ddr_cmds_addrs[1] = 0x50000;
> > +       msg->ddr_cmds_addrs[2] = 0x500b4;
> > +
> > +       msg->ddr_cmds_data[0][0] =  0x40000000;
> > +       msg->ddr_cmds_data[0][1] =  0x40000000;
> > +       msg->ddr_cmds_data[0][2] =  0x40000000;
> > +
> > +       /*
> > +        * These are the CX (CNOC) votes - these are used by the GMU but the
> > +        * votes are known and fixed for the target
> > +        */
> > +       msg->cnoc_cmds_num = 1;
> > +       msg->cnoc_wait_bitmask = 0x01;
> > +
> > +       msg->cnoc_cmds_addrs[0] = 0x50058;
> > +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> > +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> > +}
> > +
> >  static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >  {
> >         /*
> > @@ -646,6 +677,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >                 adreno_7c3_build_bw_table(&msg);
> >         else if (adreno_is_a660(adreno_gpu))
> >                 a660_build_bw_table(&msg);
> > +       else if (adreno_is_a663(adreno_gpu))
> > +               a663_build_bw_table(&msg);
> >         else if (adreno_is_a690(adreno_gpu))
> >                 a690_build_bw_table(&msg);
> >         else if (adreno_is_a730(adreno_gpu))
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index 58d7e7915c57..10f8f25d8826 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -455,6 +455,11 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
> >         return adreno_is_revn(gpu, 680);
> >  }
> >
> > +static inline int adreno_is_a663(const struct adreno_gpu *gpu)
> > +{
> > +       return gpu->info->chip_ids[0] == 0x06060300;
> > +}
> > +
> >  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
> >  {
> >         return gpu->info->chip_ids[0] == 0x06090000;
> >
> > --
> > 2.45.2
> >
