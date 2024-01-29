Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B08417EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 01:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A98B10EA9F;
	Tue, 30 Jan 2024 00:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD6610E1DC;
 Tue, 30 Jan 2024 00:56:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40TMbNAB025183; Mon, 29 Jan 2024 23:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=mZgk+b7tnMqyn4WnXpTu0pB6YvL/GJbrANNWmEG/oqM=; b=nB
 P36ZbCwLtHO0a9Y0qhxSWksbPBayJn4MrCwXMowCBxUrIaNVtdVea3b5vUM0NCOo
 byeW/YwpyTxLGZ0w7X785E6tEICCx8caUiFUL9WqTS4ODAGGTaUjEkh7XbotHjON
 vMBwQpx4EPmA0k9kYE0eRjmZ+NNXbGZhWf4c5ZNX7AL2FMHngEWbdZD5Mcy4xiZ5
 vgFvkoZQ9kIrLyMO37V556H5RbdRkGuezO4Ji2t+ooohu9ZydZm2TDkdBloQKjka
 MPYoQEAg+n4a7xizbxJeil0kg1cfFZuPkgsFyNBlfFbUid6DND2TAImKXfTycRu/
 ZaS2I925dkIk8q0O9KTg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx23kapxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 23:51:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TNpspF005855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 23:51:54 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 15:51:53 -0800
Message-ID: <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
Date: Mon, 29 Jan 2024 15:51:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paloma Arellano
 <quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
 <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ibWHFjrkyIrLLbHwac-caZtiXa7KvUTJ
X-Proofpoint-GUID: ibWHFjrkyIrLLbHwac-caZtiXa7KvUTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_14,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=619
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290176
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
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>>
>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
>>>> YUV420. Therefore, program the INTF to send 1 ppc.
>>>
>>> I think this is handled in the DP driver, where we disallow wide bus
>>> for YUV 4:2:0 modes.
>> Yes we do disallow wide bus for YUV420 modes, but we still need to
>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
>> this check.
> 
> As I wrote in my second email, I'd prefer to have one if which guards
> HCTL_EN and another one for WIDEN
> 
Its hard to separate out the conditions just for HCTL_EN . Its more 
about handling the various pixel per clock combinations.

But, here is how I can best summarize it.

Lets consider DSI and DP separately:

1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).

This is same the same condition as widebus today in 
msm_dsi_host_is_wide_bus_enabled().

Hence no changes needed for DSI.

2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
as they are independent cases. We dont support YUV420 + DSC case.

There are other cases which fall outside of this bucket but they are 
optional ones. We only follow the "required" ones.

With this summary in mind, I am fine with what we have except perhaps 
better documentation above this block.

When DSC over DP gets added, I am expecting no changes to this block as 
it will fall under the widebus_en case.

With this information, how else would you like the check?

>>>
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> @@ -168,7 +168,9 @@ static void
>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>>>         * video timing. It is recommended to enable it for all cases,
>>>> except
>>>>         * if compression is enabled in 1 pixel per clock mode
>>>>         */
>>>> -    if (p->wide_bus_en)
>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>>>> +    else if (p->wide_bus_en)
>>>>            intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>>>          data_width = p->width;
>>>
> 
> 
> 
