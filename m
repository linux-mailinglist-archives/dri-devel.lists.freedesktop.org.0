Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA9D7392C6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 01:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDBA10E36A;
	Wed, 21 Jun 2023 23:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086F10E143;
 Wed, 21 Jun 2023 23:01:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35LMWKca019433; Wed, 21 Jun 2023 23:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=11SQZq0q8ZhUlhbiEakp5ZFyeDKfnXRO6152ZnUIBTs=;
 b=K5PQIs7SnEyfiMJx1Q4AzhWK0EceuPLHCqo8sw/L/ontaz6ElGGPFcvfOCFCZlg0e52z
 X+zBjoAYzvjPs3OXaQo8oGQr//CFDCudUxHY0jkfdhL66Bkp9LD2/2TpVXkWt3PSz1ks
 TTiqO2I7pkEyBm4ax32eGHUdn56JroxpOLth45AYbk62zukXAWDpp9yqWPepFTCW96ii
 5kSXezWYjXj5mHEqkr0CTaYhQHggPDzUeLa0YZdf86+3rthMRTNcUFqYyCJA7ymdchkw
 76ez5bSYU2gQimXgegp5N5+R224MDDjYx+P8abl3pfGGvy6Aog0QEHFm5USzyldKGl+A Jw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc2rch2br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 23:01:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35LN1aan016579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jun 2023 23:01:36 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 21 Jun
 2023 16:01:36 -0700
Message-ID: <7d5256cd-c0bd-36e3-9b59-63ad8595f0ce@quicinc.com>
Date: Wed, 21 Jun 2023 16:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
 <26tvhvqpxtxz5tqc6jbjixadpae34k7uc7fyec2u5o2ccj4tdq@tjvguzlolc3g>
 <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3BXVtCPQrfpJZUABLfzzkCucAewGnqT6
X-Proofpoint-GUID: 3BXVtCPQrfpJZUABLfzzkCucAewGnqT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210193
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2023 9:36 AM, Dmitry Baryshkov wrote:
> On 21/06/2023 18:17, Marijn Suijten wrote:
>> On 2023-06-20 14:38:34, Jessica Zhang wrote:
>> <snip>
>>>>>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
>>>>>>>> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
>>>>>>>
>>>>>>> No. Please provide a single function which takes necessary
>>>>>>> configuration, including compression and wide_bus_enable.
>>>>>>>
>>>>>>
>>>>>> There are two ways to look at this. Your point is coming from the
>>>>>> perspective that its programming the same register but just a 
>>>>>> different
>>>>>> bit. But that will also make it a bit confusing.
>>>>
>>>> My point is to have a high-level function that configures the INTF for
>>>> the CMD mode. This way it can take a structure with necessary
>>>> configuration bits.
>>>
>>> Hi Dmitry,
>>>
>>> After discussing this approach with Abhinav, we still have a few
>>> questions about it:
>>>
>>> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used (the
>>> rest are reserved with no plans of being programmed in the future). Does
>>> this still justify the use of a struct to pass in the necessary
>>> configuration?
>>
>> No.  The point Dmitry is making is **not** about this concidentally
>> using the same register, but about adding a common codepath to enable
>> compression on this hw_intf (regardless of the registers it needs to
>> touch).
> 
> Actually to setup INTF for CMD stream (which is equal to setting up 
> compression at this point).
> 

Yes it should be setup intf for cmd and not enable compression.

Widebus and compression are different features and we should be able to 
control them independently.

We just enable them together for DSI. So a separation is necessary.

But I am still not totally convinced we even need to go down the path 
for having an op called setup_intf_cmd() which takes in a struct like

struct dpu_cmd_intf_cfg {
	bool data_compress;
	bool widebus_en;
};

As we have agreed that we will not touch the video mode timing engine 
path, it leaves us with only two bits.

And like I said, its not that these two bits always go together. We want 
to be able to control them independently which means that its not 
necessary both bits program the same register one by one. We might just 
end up programming one of them if we just use widebus.

Thats why I am still leaning on keeping this approach.

>>  Similar to how dpu_hw_intf_setup_timing_engine() programs the
>> hw_intf - including widebus! - for video-mode.
>>
>> Or even more generically, have a struct similar to intf_timing_params
>> that says how the intf needs to be configured - without the caller
>> knowing about INTF_CONFIG2.
>>
>> struct dpu_hw_intf_cfg is a very good example of how we can use a single
>> struct and a single callback to configure multiple registers at once
>> based on some input parameters.
>>
>>> In addition, it seems that video mode does all its INTF_CONFIG2
>>> configuration separately in dpu_hw_intf_setup_timing_engine(). If we
>>> have a generic set_intf_config2() op, it might be good to have it as
>>> part of a larger cleanup where we have both video and command mode use
>>> the generic op. What are your thoughts on this?
>>
>> Not in that way, but if there is a generic enable_compression() or
>> configure_compression() callback (or even more generic, similar to
>> setup_intf_cfg in dpu_hw_ctl) that would work for both video-mode and
>> command-mode, maybe that is beneficial.
> 
> I'd rather not do this. Let's just 'setup timing enging' vs 'setup CMD'. 
> For example, it might also include setting up other INTF parameters for 
> CMD mode (if anything is required later on).
> 

Agreed on setup CMD but I dont know whether we need a setup CMD at all.
Seems like an overkill.

>>
>> - Marijn
> 
