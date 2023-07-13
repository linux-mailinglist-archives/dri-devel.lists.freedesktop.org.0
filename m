Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F1752B9E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 22:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3710E025;
	Thu, 13 Jul 2023 20:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30710E025;
 Thu, 13 Jul 2023 20:26:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DKPlXj026863; Thu, 13 Jul 2023 20:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=IzUkU3+QSudYON60F61MD81EiskXA6OaDRhizsJvEOA=;
 b=FEJCMsjq3+1tiwg0PU5XYBtaIqePmT0sF+nZCkHKgvySd23JtEwK9KpRHk6uVCvEu2cm
 r/1nOYsLQesHxktwX0hk0JVDaVCGa2NwQMHE4KhqgRqak+kDBgr72Ac5kCzGKArW/26v
 rLs+Vs+eJ9EUGtbiEAjp4BsYHcWLXL4Aa/GzdaiVfiJM7FYCmYuQ4C1CIJWBRTpKt7wR
 NXebgYd6t2ileFBuwZIYTUwqXqeWGV0LsJMvhPpgFdAE+4HywNv9MoYCHgmdDGJt9w1n
 sMdI8dzu+sbfa6odE/kwNxdhUuENLMPW9GMrYb62Lx3VttA4zLEz+6NyamcXopEe11Lq bA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpts05ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 20:26:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DKQOQu028814
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 20:26:24 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 13:26:22 -0700
Date: Fri, 14 Jul 2023 01:56:17 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
Message-ID: <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lpPqWGnFkpsViFm0cClZb8EUm6J4U0gp
X-Proofpoint-ORIG-GUID: lpPqWGnFkpsViFm0cClZb8EUm6J4U0gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_08,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307130180
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote:
> 
> On 07/07/2023 00:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > There are cases where there are differences due to SoC integration.
> > Such as cache-coherency support, and (in the next patch) e-fuse to
> > speedbin mappings.
> 
> I have the feeling that we are trying to circumvent the way DT works. I'd
> suggest adding explicit SoC-compatible strings to Adreno bindings and then
> using of_device_id::data and then of_device_get_match_data().
> 
Just thinking, then how about a unique compatible string which we match
to identify gpu->info and drop chip-id check completely here?

-Akhil

> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >   2 files changed, 31 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 3c531da417b9..e62bc895a31f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
> >   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >   		.init = a6xx_gpu_init,
> > +	}, {
> > +		.machine = "qcom,sm4350",
> > +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> > +		.revn = 619,
> > +		.fw = {
> > +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> > +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> > +		},
> > +		.gmem = SZ_512K,
> > +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > +		.init = a6xx_gpu_init,
> > +		.zapfw = "a615_zap.mdt",
> > +		.hwcg = a615_hwcg,
> > +	}, {
> > +		.machine = "qcom,sm6375",
> > +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> > +		.revn = 619,
> > +		.fw = {
> > +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> > +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> > +		},
> > +		.gmem = SZ_512K,
> > +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > +		.init = a6xx_gpu_init,
> > +		.zapfw = "a615_zap.mdt",
> > +		.hwcg = a615_hwcg,
> >   	}, {
> >   		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> >   		.revn = 619,
> > @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
> >   	/* identify gpu: */
> >   	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
> >   		const struct adreno_info *info = &gpulist[i];
> > +		if (info->machine && !of_machine_is_compatible(info->machine))
> > +			continue;
> >   		if (adreno_cmp_rev(info->rev, rev))
> >   			return info;
> >   	}
> > @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >   		config.rev.minor, config.rev.patchid);
> >   	priv->is_a2xx = config.rev.core == 2;
> > +	priv->has_cached_coherent =
> > +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> >   	gpu = info->init(drm);
> >   	if (IS_ERR(gpu)) {
> > @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >   	if (ret)
> >   		return ret;
> > -	priv->has_cached_coherent =
> > -		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > -		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > -
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index e08d41337169..d5335b99c64c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
> >   extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
> >   struct adreno_info {
> > +	const char *machine;
> >   	struct adreno_rev rev;
> >   	uint32_t revn;
> >   	const char *fw[ADRENO_FW_MAX];
> 
> -- 
> With best wishes
> Dmitry
> 
