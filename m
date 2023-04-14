Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68506E272A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3507F10E1BA;
	Fri, 14 Apr 2023 15:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710FD10E1BA;
 Fri, 14 Apr 2023 15:41:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EFffeY006347; Fri, 14 Apr 2023 15:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NK/P0Cz1MxmLV1BoZL/v3IENNRORMkZFXgt0sEvVQyI=;
 b=F3pL9Ovv8k0AqFx4bpYsFYuwNHy5C+J+T4PRGq/a/pEnU4gCxbDSvL20LtGMd44zLdbg
 j43V2GgxMR6pwgJgxBR8EtQ78O7syYaKMoD3lrOXwlIVG4jaFTfIHtlZuyZZXgNfuUDy
 5PYl4TaG1hpD4ypwRDWKeNOzydhT1fffNis4r0Lpm9Fl4g9wFogGYXPYZBSlGDuDc1+v
 Bi7D6d65lzX+YFuZKREgEtHmndhrcRvsjPc6uYwh04OsCkjedZzBo7wF2vBaF1KmC/GE
 L31JVvVz3ADRyIpamRB20HyviUMSGNvdOAqYbyjlkJXPcaWO0FGV47tzi8kTqxdn70BD lQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3py20e11ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 15:41:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EFfdsZ006120
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 15:41:39 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 14 Apr
 2023 08:41:38 -0700
Message-ID: <aac210da-dec1-aab8-3f48-c33d9e7687d6@quicinc.com>
Date: Fri, 14 Apr 2023 08:41:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
 <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xnbsfrOMy6PlHWXsXlNi3qaZM2ZHUpO0
X-Proofpoint-ORIG-GUID: xnbsfrOMy6PlHWXsXlNi3qaZM2ZHUpO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_08,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=663
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140138
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
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2023 12:48 AM, Marijn Suijten wrote:
> Capitalize DSC in the title, as discussed in v1.
> 
> On 2023-04-13 08:56:41, Kuogee Hsieh wrote:
>> In current code, the DSC active bits are written only if cfg->dsc is set.
>> However, for displays which are hot-pluggable, there can be a use-case
>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>
>> For those cases we need to clear DSC active bits during tear down.
>>
>> Changes in V2:
>> 1) correct commit text as suggested
>> 2) correct Fixes commit id
>> 3) add FIXME comment
>>
>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> By default git send-email should pick this up in the CC line...  but I
> had to download this patch from lore once again.
> 

Yes, I think what happened here is, he didnt git am the prev rev and 
make changes on top of that so git send-email didnt pick up. We should 
fix that process.

>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index bbdc95c..1651cd7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -541,10 +541,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>   	if (cfg->merge_3d)
>>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>> -	if (cfg->dsc) {
>> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> -	}
>> +
>> +	/* FIXME: fix reset_intf_cfg to handle teardown of dsc */
> 
> There's more wrong than just moving (not "fix"ing) this bit of code into
> reset_intf_cfg.  And this will have to be re-wrapped in `if (cfg->dsc)`
> again by reverting this patch.  Perhaps that can be explained, or link
> to Abhinav's explanation to make it clear to readers what this FIXME
> actually means?  Let's wait for Abhinav and Dmitry to confirm the
> desired communication here.
> 
> https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
> 

Yes, I am fine with linking this explanation in the commit text and 
mentioning that till thats fixed, we need to go with this solution. The 
FIXME itself is fine, I will work on it and I remember this context well.

> - Marijn
> 
>> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>   }
>>   
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
