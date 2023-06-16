Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E24733B72
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 23:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11410E691;
	Fri, 16 Jun 2023 21:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D74F10E68F;
 Fri, 16 Jun 2023 21:19:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GKa95m009114; Fri, 16 Jun 2023 21:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DJfWL3L3H75nta3a0ulYRH17udjCYSJNbPLox+tAnrs=;
 b=bljn20FjlFoZLTsQqqnjfDEcslRMbdynkAYHt8OTfgBe+9q7SFEarAPFPnrLjuvApGU4
 mDIf4/pM3ckj4AeCOgFhbim+3eslgIBrZ2a+NOv+NIUXBABxq4lTovb60MlLFg8smPZ+
 k1N4bak7CVxup75dBmqKhms9aPiuX+Xj10kcsHcedaEXQHuJAoX+ct+8CiuvslAmCcT4
 CZxhjGH1i1jxfb611upFHxIJubb6LjEAArPN6BdTXDDfGtIVAnUrLnzvpGRYhPZOizsr
 flVimN+jaN0zJKqICS2fsKAd2HC+f5Ra34z+AXhr7r2aWy4j8jZgJonRlAfdVFs0JEvg qQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r887xjtrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 21:19:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35GLJ7lE032316
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 21:19:07 GMT
Received: from [10.110.47.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 16 Jun
 2023 14:18:40 -0700
Message-ID: <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
Date: Fri, 16 Jun 2023 14:18:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2iVJ-v10_Juh4txGKOkUWstxCSPb2sqr
X-Proofpoint-GUID: 2iVJ-v10_Juh4txGKOkUWstxCSPb2sqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_14,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=883 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160193
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2023 12:56 AM, Dmitry Baryshkov wrote:
> On 14/06/2023 04:57, Jessica Zhang wrote:
>> Add a DPU INTF op to set the DATABUS_WIDEN register to enable the
>> databus-widen mode datapath.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index b856c6286c85..124ba96bebda 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -70,6 +70,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>       if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
>>           phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>> +
>> +    if (phys_enc->hw_intf->ops.enable_widebus)
>> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
> 
> No. Please provide a single function which takes necessary 
> configuration, including compression and wide_bus_enable.
> 

There are two ways to look at this. Your point is coming from the 
perspective that its programming the same register but just a different 
bit. But that will also make it a bit confusing.

So lets say the function is called intf_cfg2_xxx(..., bool widebus, bool 
data_compress)

Now for the caller who wants to just enable widebus this will be

intf_cfg2_xxx(....., true, false)

if we want to do both

intf_cfg2_xxx(...., true, true)

the last one where we want to do just data_compress(highly unlikely and 
not recommended)

intf_cfg2_xxx(...., false, true)

Now someone looking at the code will have to go and find out what each 
bool is.

Whereas with separate ops, its kind of implicit.

For that reason, I dont think this patch is bad at all.
