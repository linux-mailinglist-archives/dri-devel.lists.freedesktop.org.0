Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BBCA9B865
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379A510E853;
	Thu, 24 Apr 2025 19:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OufSxmzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3682D10E84D;
 Thu, 24 Apr 2025 19:42:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3CFT013019;
 Thu, 24 Apr 2025 19:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kmrdY01l/P1o7a+YzkNeqbcMF6GdVsxYqz3ZJBSMMoQ=; b=OufSxmzqd39nivK6
 y83oZX6KyORiGGh/dpBIGtoL969ZQkMiuyPTpuN3KMY+eVh05GjSJ8NyQ6H31EfF
 1nJu5o/lPaWoJalsUs6oHuqEHH+r2XIaOtdqP+FHm5QcTxXanaM9XJlaA5zLj57X
 tA1opXxxc6etAIjc78MYFdUAgNp9WZm/Wu0VhbVG55jUXfdw4EvRo2GuW5MBy3Wc
 OUS4ZUc+RHkp/gnLdkvCfLHOMa7xeUSDRoldxozVI/QUB4iHyfO958AXmzf1NXzO
 rogegBFTX7bfsy5hDAJsvbyOKBBAP57bomRR2xKNwGQJbuF13SB/nphhVLEY9rpx
 I7yijw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh06rn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 19:41:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OJfqkG002909
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 19:41:52 GMT
Received: from [10.110.70.248] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 12:41:51 -0700
Message-ID: <b0d81293-af00-4d84-96b4-2a26e1ea8677@quicinc.com>
Date: Thu, 24 Apr 2025 12:41:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
 <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
 <orh3v7knajhmpv4uzmarpgdbfhkhtipjxc7agfmvlqdzggpwzz@yohc5d763ynp>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <orh3v7knajhmpv4uzmarpgdbfhkhtipjxc7agfmvlqdzggpwzz@yohc5d763ynp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEzNyBTYWx0ZWRfX3P9lTmTh1nzA
 GZkD/jsp/3Z6etBOcdqVOaFYzwTlZN9w4KMyZeaSBHWmTfbwGznlPrJVnGNDdanLNgYXawWUgbS
 Y5yhCh8mVaUVzdMF86KExfivM9T3OgoYc/+MsD+R5IUKdO+SCF2p/bJrKxmPW+HG0Da/zLgjfHn
 tlnlYyq4LKjFO2DxBztzRZx2VKoKXjPNjmq+aFMe6xHJ0uZKHTzNQaAl/urZv15MAqnhCtcFrxs
 NaVzOBcIhETv7v+cyk3Ud0cYV66AX3N3MG9SjQjvmZcIaaRg7cn7dlbJ3ndU9u+Mln6l6G5K5Tu
 nsFDziZdirsluywhgsEY7LcTI8CenFPLCCdAW5YHCEri9Hc1oJTU6+FD2VrsJvieAhALpryYduR
 27L5kFPN48/sVlleqz2AtO1HcjaA2GUeEf1XYX+5rMOSF9FLIK1jYp0cJ7GmNOtOkmLTyxVj
X-Proofpoint-GUID: aTsTeaZslzfWCmtMOsf1f2bO3Chcbxq-
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a9401 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=3cKAJhnaDEdsQ5v88lUA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aTsTeaZslzfWCmtMOsf1f2bO3Chcbxq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240137
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



On 4/24/2025 3:22 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 23, 2025 at 03:54:13PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
>>> The LVDS/LCDC controller uses pixel clock coming from the multimedia
>>> controller (mmcc) rather than using the PLL directly. Stop using LVDS
>>> PLL directly and register it as a clock provider. Use lcdc_clk as a
>>> pixel clock for the LCDC.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
>>>    3 files changed, 15 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
>>> index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
>>> @@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
>>>    }
>>>    #endif
>>> -struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
>>> +int mpd4_lvds_pll_init(struct drm_device *dev);
>>>    #endif /* __MDP4_KMS_H__ */
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
>>> index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
>>> @@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
>>>    	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
>>>    	/* TODO: do we need different pll in other cases? */
>>> -	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
>>> +	ret = mpd4_lvds_pll_init(dev);
>>> +	if (ret) {
>>> +		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
>>> +		return ERR_PTR(ret);
>>> +	}
>>> +
>>> +	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
>>>    	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
>>>    		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
>>>    		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
>>
>> Change seems fine to me, one question on the order of changes, DT change has
>> to be merged first otherwise it will fail here?
> 
> It is already semi-broken, as just enabling the PLL is not enough. The
> branch clocks in MMSS are to be toggled / manipulated. As such, it's
> questionable if we need to coordinate or not.
> 

Yes but wouldnt this cause mdp4_lcdc_encoder_init() failure which in 
turn will cause mdp4_kms_init() failure?

So I thought that by merging the DTSI piece first this can be avoided.

>>
>> Will that be managed by co-ordinating with the DT maintainer?
>>
> 

