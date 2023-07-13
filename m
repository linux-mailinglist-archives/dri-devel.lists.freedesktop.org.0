Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721C752CC3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 00:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFC810E784;
	Thu, 13 Jul 2023 22:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5793B10E02A;
 Thu, 13 Jul 2023 22:15:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DLbIE0022706; Thu, 13 Jul 2023 22:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=s6NeORLYtWMLvBaqATJYDIbZpmEMnz33t0EV+2lkDeo=;
 b=pVYgbgYVxV53JGotd3erPwGykIDNmQXHgVdlDQJnONhT5zS6LC0Y2c5tX5XnB2WWnQWc
 UUUrJEtBSWY6sKBEcJg8ZCTfhmlwxtfRk/f5UuiY4BsaxXhT2YYGXbxcUxv5arNd7GOA
 98yk6iHrWQdGo6qol2XwXuGtbXWdFHz/VAfGpznBnKj5LfPjJS0RYTN/ilEXo0KS3klM
 4n/+Sht7MwV1Iboi2B6j7GpiQfjzSqGJin6VShjWTGb9CvxPA8OND1+jFbSLXsUjtFK+
 07goQadC0H9L4noh9ZsXrE9dtw+ksd+d2BvZKT1NeYQeJ8CK1nm97uLuL8BD6XDoQgZ0 3w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptr0auf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 22:15:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DMFB6H023785
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 22:15:11 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 15:15:09 -0700
Date: Fri, 14 Jul 2023 03:45:06 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
Message-ID: <myqlqezbympj6axqhyqjywjmdoolmip2rdevuhgtb3l335oidy@5szzv3abtwcl>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <8ee1601d-eb39-2d51-ae52-9bb897a96c07@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8ee1601d-eb39-2d51-ae52-9bb897a96c07@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eQ_w68Mf-GpZRRa2R3B3NB-klG4lvtUg
X-Proofpoint-GUID: eQ_w68Mf-GpZRRa2R3B3NB-klG4lvtUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307130197
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 02:40:47AM +0200, Konrad Dybcio wrote:
> 
> On 6.07.2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > There are cases where there are differences due to SoC integration.
> > Such as cache-coherency support, and (in the next patch) e-fuse to
> > speedbin mappings.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> of_machine_is_compatible is rather used in extremely desperate
> situations :/ I'm not sure this is the correct way to do this..
> 
> Especially since there's a direct correlation between GMU presence
> and ability to do cached coherent.
> 
> The GMU mandates presence of RPMh (as most of what the GMU does is
> talk to AOSS through its RSC).
> 
> To achieve I/O coherency, there must be some memory that both the
> CPU and GPU (and possibly others) can access through some sort of
> a negotiator/manager.
> 
> In our case, I believe that's LLC. And guess what that implies.
> MEMNOC instead of BIMC. And guess what that implies. RPMh!
> 
> Now, we know GMU => RPMh, but does it work the other way around?

I don't think we should tie gpu io-coherency with rpmh or llc. These
features are more dependent on SoC architecture than GPU arch.

-Akhil

> 
> Yes. GMU wrapper was a hack because probably nobody in the Adreno team
> would have imagined that somebody would be crazy enough to fork
> multiple year old designs multiple times and release them as new
> SoCs with updated arm cores and 5G..
> 
> (Except for A612 which has a "Reduced GMU" but that zombie still talks
> to RPMh. And A612 is IO-coherent. So I guess it works anyway.)
> 
> Konrad
> 
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >  2 files changed, 31 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 3c531da417b9..e62bc895a31f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
> >  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >  		.init = a6xx_gpu_init,
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
> >  	}, {
> >  		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> >  		.revn = 619,
> > @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
> >  	/* identify gpu: */
> >  	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
> >  		const struct adreno_info *info = &gpulist[i];
> > +		if (info->machine && !of_machine_is_compatible(info->machine))
> > +			continue;
> >  		if (adreno_cmp_rev(info->rev, rev))
> >  			return info;
> >  	}
> > @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >  		config.rev.minor, config.rev.patchid);
> >  
> >  	priv->is_a2xx = config.rev.core == 2;
> > +	priv->has_cached_coherent =
> > +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
> >  
> >  	gpu = info->init(drm);
> >  	if (IS_ERR(gpu)) {
> > @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >  	if (ret)
> >  		return ret;
> >  
> > -	priv->has_cached_coherent =
> > -		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > -		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > -
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index e08d41337169..d5335b99c64c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
> >  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
> >  
> >  struct adreno_info {
> > +	const char *machine;
> >  	struct adreno_rev rev;
> >  	uint32_t revn;
> >  	const char *fw[ADRENO_FW_MAX];
