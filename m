Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1F6F5D50
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345D10E32B;
	Wed,  3 May 2023 17:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9EC10E32B;
 Wed,  3 May 2023 17:52:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343EdIY7018729; Wed, 3 May 2023 17:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7XSpeuGQyPG8mqbzx7ScViHW766udxu9uXTfxj5yISo=;
 b=R5bp73hhc4yyBYxWo/DqAosS0GBU0vv6Xdp4NLTCGMA6JJ2ZqF9MMTipXsArFX9yplHI
 d755TEkcXwMZfeTxijgFw+/6ayHbNFp6DJ2WJvL0D6VIKGaAgLR1AISrlcqJoBmQV9Vm
 6M33Cmv8PnJwbd9LlAby5U1lRYhVhyx4H3B90SrMP9tnH3Pebqu7KbVfMr8iAxzdwvtL
 alK54bIkngyJequcsXcjTKxnbAtu4S6v4FozAWQVfELY5RSdbaIDpY6eKQ84YNW59HXJ
 25CRxDJdOly8IWWd/jy6PY6cWTVguDzcCj9UdGZKWkda5+9LpKpTDJ1AIr0YMYOuymSa 2A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbn0a92md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 17:52:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343HqC8V025135
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 17:52:12 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 10:51:48 -0700
Message-ID: <9e357eff-a649-90cb-0fc2-7ab6a8eb6f19@quicinc.com>
Date: Wed, 3 May 2023 10:51:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/7] drm/msm/dpu: add PINGPONG_NONE to disconnect DSC
 from PINGPONG
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
 <csyytksa77vbi2hwwv25voocdf3khsbp2kxtd4jcucoobcpjdv@6xkqzk33dn5u>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <csyytksa77vbi2hwwv25voocdf3khsbp2kxtd4jcucoobcpjdv@6xkqzk33dn5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qL1jMA-pgKqqX7BRycRayBOLeI2kaTZd
X-Proofpoint-ORIG-GUID: qL1jMA-pgKqqX7BRycRayBOLeI2kaTZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_12,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030153
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/3/2023 1:03 AM, Marijn Suijten wrote:
> On 2023-05-02 14:02:59, Kuogee Hsieh wrote:
>> During DSC setup, the crossbar mux need to be programmed to engage
>> DSC to specified PINGPONG. Hence during tear down, the crossbar mux
>> need to be reset to disengage DSC from PINGPONG. This patch add
>> PINGPONG_NONE to serve as disable to reset crossbar mux.
> This patch doesn't *just add* PINGPONG_NONE to reset the crossbar; that
> functionality was already available thanks to a `bool enable` function
> parameter.  Instead it should explain why you think PINGPONG_NONE is
> more convenient than passing a bool that warrants this replacement.
> (Hint: I think because you don't have a hw_pp->idx available in the
>   teardown path, and/or its value is not relevant for the disable case
>   anyway.)
>
> In addition I don't see this series use PINGPONG_NONE anywhere yet: will
> that be added in the DSC 1.2 series for DP (to support hotplug)?

PINGPONG_NONE will be used to tear down DSC data path later at DP DSC 
patch series.

Current it is not used because DSI does not do tear down.

>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 7 +++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 3 ++-
>>   4 files changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1dc5dbe..d9ad334 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1839,7 +1839,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>>   		hw_pp->ops.setup_dsc(hw_pp);
>>   
>>   	if (hw_dsc->ops.dsc_bind_pingpong_blk)
>> -		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
>> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, hw_pp->idx);
>>   
>>   	if (hw_pp->ops.enable_dsc)
>>   		hw_pp->ops.enable_dsc(hw_pp);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> index 4a6bbcc..3e68d47 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>> @@ -157,7 +157,6 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
>>   
>>   static void dpu_hw_dsc_bind_pingpong_blk(
>>   		struct dpu_hw_dsc *hw_dsc,
>> -		bool enable,
>>   		const enum dpu_pingpong pp)
>>   {
>>   	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
>> @@ -166,13 +165,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>>   
>>   	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
>>   
>> -	if (enable)
>> +	if (pp)
>>   		mux_cfg = (pp - PINGPONG_0) & 0x7;
>>   
>>   	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
>> -			enable ? "Binding" : "Unbinding",
>> +			pp ? "Binding" : "Unbinding",
>>   			hw_dsc->idx - DSC_0,
>> -			enable ? "to" : "from",
>> +			pp ? "to" : "from",
>>   			pp - PINGPONG_0);
> PINGPONG_NONE - PINGPONG_0 = -1, so this whole debug log likely needs to
> be rewritten for the disable case as we don't know what PINGPONG it is
> being unbound from.  How about:
>
> 	if (pp)
> 		DRM_DEBUG_KMS("Binding dsc:%d to pp:%d\n",
> 				hw_dsc->idx - DSC_0,
> 				pp - PINGPONG_0);
> 	else
> 		DRM_DEBUG_KMS("Unbinding dsc:%d from any pp\n",
> 				hw_dsc->idx - DSC_0);
>
> - Marijn
>
>>   
>>   	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>> index 287ec5f..138080a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>> @@ -44,7 +44,6 @@ struct dpu_hw_dsc_ops {
>>   				  struct drm_dsc_config *dsc);
>>   
>>   	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
>> -				  bool enable,
>>   				  enum dpu_pingpong pp);
>>   };
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index 2d9192a..56826a9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -191,7 +191,8 @@ enum dpu_dsc {
>>   };
>>   
>>   enum dpu_pingpong {
>> -	PINGPONG_0 = 1,
>> +	PINGPONG_NONE,
>> +	PINGPONG_0,
>>   	PINGPONG_1,
>>   	PINGPONG_2,
>>   	PINGPONG_3,
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
