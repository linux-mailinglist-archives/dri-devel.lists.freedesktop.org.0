Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BCE71F1EE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 20:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084F110E59D;
	Thu,  1 Jun 2023 18:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03D10E19E;
 Thu,  1 Jun 2023 18:30:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3518aDxC016568; Thu, 1 Jun 2023 18:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=mYnBFvR1lSR9a5GsGP5O3Up5eZr+2vQfdJU4joBtTJA=;
 b=cL6Jmgu5HSM7IMdpSXOG8KsVWhx8bwTonO8Lq0G34MIBxZuGh3tHNdFIAgmZNOmnKkQS
 x+geycSjKwAQ0vEujATcbazWEQsSOB0qtNeQsDk9h0HJxojrkj0jM55ukPeDNU4sd0Wt
 Ib9f6F8WmoztAj2xTE+3Gw0xLmMuRmHPs78mMLJI3BsqFQ4EISzaSao2uwNbUSBtmIVM
 MEyj0zZXBIW4MA7csWXAFbYIiqtYUDtXsFit2z0MDJJuexTbm8D8UPkEbKF899IKnyXV
 d/3b1YhEmg8fjEU6/OPhhIbtqDUFyVXkHczRgYwZi+hO0W5UwadU+ud5h7OFfPLim4Pp XQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxqyd9j6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 18:30:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351IUOwx001397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 18:30:24 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 11:30:20 -0700
Date: Fri, 2 Jun 2023 00:00:17 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/msm/adreno: Add Adreno A690 support
Message-ID: <z6usdzbvqxt6q7siff6qucyywafb6k4yh6qdpignqatowjb4c6@z3az35e3abs3>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
 <20230531030945.4109453-2-quic_bjorande@quicinc.com>
 <57ffc7d9-c767-df36-d91f-8949993b1cdf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57ffc7d9-c767-df36-d91f-8949993b1cdf@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cKOhta0v8MFmzzWGng2PcZc7SU82v8vU
X-Proofpoint-GUID: cKOhta0v8MFmzzWGng2PcZc7SU82v8vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306010160
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 10:30:09PM +0200, Konrad Dybcio wrote:
> 
> 
> 
> On 31.05.2023 05:09, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
> > 
> > Tested-by: Steev Klimaszewski <steev@kali.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> Couple of additional nits that you may or may not incorporate:
> 
> [...]
> 
> > +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> It would be cool if we could stop adding uppercase hex outside preprocessor
> defines..
> 
> 
> [...]
> > +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> > +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
> typo
> 
> 
> 
> -- Questions to Rob that don't really concern this patch --
> 
> > +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> Rob, I'll be looking into reworking these into dynamic tables.. would you
> be okay with two more additions (A730, A740) on top of this before I do that?
> The number of these funcs has risen quite a bit and we're abusing the fact
> that so far there's a 1-1 mapping of SoC-Adreno (at the current state of
> mainline, not in general)..

+1. But please leave a618 and 7c3 as it is.

-Akhil

> 
> > +{
> > +	/*
> > +	 * Send a single "off" entry just to get things running
> > +	 * TODO: bus scaling
> > +	 */
> Also something I'll be looking into in the near future..
> 
> > @@ -531,6 +562,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >  		adreno_7c3_build_bw_table(&msg);
> >  	else if (adreno_is_a660(adreno_gpu))
> >  		a660_build_bw_table(&msg);
> > +	else if (adreno_is_a690(adreno_gpu))
> > +		a690_build_bw_table(&msg);
> >  	else
> >  		a6xx_build_bw_table(&msg);
> I think changing the is_adreno_... to switch statements with a gpu_model
> var would make it easier to read.. Should I also rework that?
> 
> Konrad
> 
> >  
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 8cff86e9d35c..e5a865024e94 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
> >  		.init = a6xx_gpu_init,
> >  		.zapfw = "a640_zap.mdt",
> >  		.hwcg = a640_hwcg,
> > +	}, {
> > +		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
> > +		.revn = 690,
> > +		.name = "A690",
> > +		.fw = {
> > +			[ADRENO_FW_SQE] = "a660_sqe.fw",
> > +			[ADRENO_FW_GMU] = "a690_gmu.bin",
> > +		},
> > +		.gmem = SZ_4M,
> > +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > +		.init = a6xx_gpu_init,
> > +		.zapfw = "a690_zap.mdt",
> > +		.hwcg = a690_hwcg,
> > +		.address_space_size = SZ_16G,
> >  	},
> >  };
> >  
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index f62612a5c70f..ac9c429ca07b 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -55,7 +55,7 @@ struct adreno_reglist {
> >  	u32 value;
> >  };
> >  
> > -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> > +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
> >  
> >  struct adreno_info {
> >  	struct adreno_rev rev;
> > @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
> >  	return gpu->revn == 660;
> >  }
> >  
> > +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> > +{
> > +	return gpu->revn == 690;
> > +};
> > +
> >  /* check for a615, a616, a618, a619 or any derivatives */
> >  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
> >  {
> > @@ -280,13 +285,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
> >  
> >  static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
> >  {
> > -	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
> > +	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
> >  }
> >  
> >  /* check for a650, a660, or any derivatives */
> >  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
> >  {
> > -	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
> > +	return gpu->revn == 650 || gpu->revn == 620  || adreno_is_a660_family(gpu);
> >  }
> >  
> >  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
