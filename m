Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1B756F8C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441D10E2BA;
	Mon, 17 Jul 2023 22:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15F10E2BA;
 Mon, 17 Jul 2023 22:00:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HLRWLw028567; Mon, 17 Jul 2023 22:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=nTRJgDitLqJo6fJJz3EhDUVWoXoC5TrDffMeYgPqTbc=;
 b=O05URolXtpEVwtneaoKWyAmO0f5wN1cJFOu5Mbrmu/67ddyadBdRMyLt8YU5k7I4LG4g
 qk3KLsAUFt9+L6GxwBla/SS+9QtOwgWlxive7h+YTfz7xmRDPqo3+kHDFO3oYyioOjpw
 lf1xP/DhN8hjAeDiv6jBQIFfaxOVgwJKTL+F05Tz87thWf5wm8GOezSR+WGd+gIjBvEq
 BdBIurjzo2fS3yVKzrmk/op2y+LYWtbaYCxWN4AecKiw91qnc/XvluZ6us0vKTwIxVAX
 X3LHsKyMht2uALC3ZdLk1zoFmtmlXDwvroAnh2hYmLs/kYDZKat9fJZtH373M1yFijSZ 4g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run1evkmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 22:00:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HM0lGh016948
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 22:00:47 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 15:00:45 -0700
Date: Tue, 18 Jul 2023 03:30:42 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
Message-ID: <hrkp4b7urqpiuuteeagaayiekemk6omvgndvt3jx2lxhmmcokc@7vzvjuw4gw4v>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
 <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
 <CAF6AEGt73GpN=7tdHnsytZM4=WqKXMU2WSHpdkTOxVqi+wH1zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt73GpN=7tdHnsytZM4=WqKXMU2WSHpdkTOxVqi+wH1zA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4HyzvvcW-6ww6Dt66mPy-ey8BcOA67NH
X-Proofpoint-ORIG-GUID: 4HyzvvcW-6ww6Dt66mPy-ey8BcOA67NH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307170199
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 03:25:33PM -0700, Rob Clark wrote:
> 
> On Thu, Jul 13, 2023 at 1:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Thu, Jul 06, 2023 at 02:10:38PM -0700, Rob Clark wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > It is better to explicitly list it.  With the move to opaque chip-id's
> > > for future devices, we should avoid trying to infer things like
> > > generation from the numerical value.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> > >  2 files changed, 17 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index f469f951a907..3c531da417b9 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_512K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >               .init = a6xx_gpu_init,
> > >       }, {
> > >               .rev = ADRENO_REV(6, 1, 9, ANY_ID),
> > > @@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_512K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a615_zap.mdt",
> > >               .hwcg = a615_hwcg,
> > > @@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_1M,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a630_zap.mdt",
> > >               .hwcg = a630_hwcg,
> > > @@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_1M,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a640_zap.mdt",
> > >               .hwcg = a640_hwcg,
> > > @@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_1M + SZ_128K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > -             .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a650_zap.mdt",
> > >               .hwcg = a650_hwcg,
> > > @@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_1M + SZ_512K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > -             .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a660_zap.mdt",
> > >               .hwcg = a660_hwcg,
> > > @@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_512K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > -             .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> > >               .init = a6xx_gpu_init,
> > >               .hwcg = a660_hwcg,
> > >               .address_space_size = SZ_16G,
> > > @@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_2M,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a640_zap.mdt",
> > >               .hwcg = a640_hwcg,
> > > @@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] = {
> > >               },
> > >               .gmem = SZ_4M,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > > -             .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> > > +             .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "a690_zap.mdt",
> > >               .hwcg = a690_hwcg,
> > > @@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     if (config.rev.core >= 6)
> > > -             if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> > > -                     priv->has_cached_coherent = true;
> > > +     priv->has_cached_coherent =
> > > +             !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > > +             !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > >
> > >       return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index a7c4a2c536e3..e08d41337169 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -33,6 +33,7 @@ enum {
> > >  #define ADRENO_QUIRK_FAULT_DETECT_MASK               BIT(1)
> > >  #define ADRENO_QUIRK_LMLOADKILL_DISABLE              BIT(2)
> > >  #define ADRENO_QUIRK_HAS_HW_APRIV            BIT(3)
> > > +#define ADRENO_QUIRK_HAS_CACHED_COHERENT     BIT(4)
> > a shorter ADRENO_IS_IOCOHERENT?
> 
> I prefer "HAS" to "IS".. maybe it is just me but "IS" sounds to me
> like all dma is coherent, while in fact gpu mappings can be either
> coherent or not.

Okay. Sounds good. 

-Akhil.
> 
> I suppose it could be "HAS_IOCOHERENT" but we do use "CACHED_COHERENT"
> elsewhere.
> 
> BR,
> -R
> 
> >
> > -Akhil
> >
> > >
> > >  struct adreno_rev {
> > >       uint8_t  core;
> > > --
> > > 2.41.0
> > >
