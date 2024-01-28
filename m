Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB7483F3FC
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07B10E692;
	Sun, 28 Jan 2024 05:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318810E692;
 Sun, 28 Jan 2024 05:16:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S5BmOh010569; Sun, 28 Jan 2024 05:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=5PorBcSO2UUCs8UUeFNkHsL5bYWEKnkSS7kWjHLe91Y=; b=fV
 AcKIGhcbvsbmH4PuY57Z1PUrVlwzO1wmAQkMt1XtuMPOD+ZMKalFBk1JEH2FjxjV
 BHeIS2I8cSfSrJmO1pIcuAjB5p0o1V8445yviGVWICdv33fvV0Zp37s9MZqd/gMb
 4CEurnPsAwVoEtFSYZzLYb2wWtmiyNHdFI1Y/AePn4VvcEI98152JP1YCmkKABmi
 JENDX45fM0btYtUn339ZRcEuoWcKVBHiSFoJqMNEpLxOaq8XaLgbwMRCFurec9KQ
 Uw/fZuyQDAfV0Csx+mqd2NzLCyqaBgMTIWcmIFG4g21ljeOHVkYDruP+RCN0cAYl
 D7OcSZ6aRe1Tvl6Cfx/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvs5p1f96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:16:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5G95I004357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:16:09 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:16:08 -0800
Message-ID: <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
Date: Sat, 27 Jan 2024 21:16:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OBew_lW3sh45d77HJtqTngLkSyxLqwRA
X-Proofpoint-ORIG-GUID: OBew_lW3sh45d77HJtqTngLkSyxLqwRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=562 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280036
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
>> YUV420. Therefore, program the INTF to send 1 ppc.
>
> I think this is handled in the DP driver, where we disallow wide bus 
> for YUV 4:2:0 modes.
Yes we do disallow wide bus for YUV420 modes, but we still need to 
program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add 
this check.
>
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 6bba531d6dc41..bfb93f02fe7c1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -168,7 +168,9 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>        * video timing. It is recommended to enable it for all cases, 
>> except
>>        * if compression is enabled in 1 pixel per clock mode
>>        */
>> -    if (p->wide_bus_en)
>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +    else if (p->wide_bus_en)
>>           intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>         data_width = p->width;
>
