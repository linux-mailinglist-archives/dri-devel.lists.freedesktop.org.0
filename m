Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2883FCA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 04:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664B910F5A9;
	Mon, 29 Jan 2024 03:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF04610F5A9;
 Mon, 29 Jan 2024 03:17:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T2dE5l019607; Mon, 29 Jan 2024 03:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=MWI4it6o83/TY6rVolmxGfMq0Vm69Q01ikPcHcK2uQg=; b=EB
 Y/KTxQ0nXVvD4+tIdSrW1nTaloitW1d8waiXc7joPE6bhUJe1jcruMRqkLVIB/vg
 omW1Q6X/h2KTS1wl4QEQiV/9pxRoV9JODKas9qkqb+ntAUTmL8w9GMufurUECrdn
 0ZUgOEzlJYR3r096KYRR7PbHJetT26OTTMweuksEIWDDB5sydeOCr3qhk3Ci6UF5
 NEPgzfnrcXE7YLlCziiYouSMaQZjqureYK/BnUZWCRyZOh7USAJDjeR5pL27ms7S
 XZ7bUlX64e1QznA1E/Q8uhJgI2VEmsZPAkR0dlS9dvJ4EPbtkIhlfYyjjKIiy7cr
 N3BV46ZwO8MzKNdz72mg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvt272ncj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 03:17:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T3HCGQ020635
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 03:17:12 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 19:17:11 -0800
Message-ID: <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
Date: Sun, 28 Jan 2024 19:17:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paloma Arellano
 <quic_parellan@quicinc.com>, <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
 <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YLQ72lNxk27zffVsKwg49qe9xIfMlKZ1
X-Proofpoint-ORIG-GUID: YLQ72lNxk27zffVsKwg49qe9xIfMlKZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290022
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
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> All the components of YUV420 over DP are added. Therefore, let's mark the
>> connector property as true for DP connector when the DP type is not eDP
>> and when VSC SDP is supported.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4329435518351..97edd607400b8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct 
>> dp_display_private *dp)
>>       dp_link_process_request(dp->link);
>> -    if (!dp->dp_display.is_edp)
>> +    if (!dp->dp_display.is_edp) {
>> +        if (dp_panel_vsc_sdp_supported(dp->panel))
>> +            dp->dp_display.connector->ycbcr_420_allowed = true;
> 
> Please consider fixing a TODO in drm_bridge_connector_init().
> 

I am not totally clear if that TODO can ever go for DP/HDMI usage of 
drm_bridge_connector.

We do not know if the sink supports VSC SDP till we read the DPCD and 
till we know that sink supports VSC SDP, there is no reason to mark the 
YUV modes as supported. This is the same logic followed across vendors.

drm_bride_connector_init() happens much earlier than the point where we 
read DPCD. The only thing which can be done is perhaps add some callback 
to update_ycbcr_420_allowed once DPCD is read. But I don't think its 
absolutely necessary to have a callback just for this.

>>           drm_dp_set_subconnector_property(dp->dp_display.connector,
>>                            connector_status_connected,
>>                            dp->panel->dpcd,
>>                            dp->panel->downstream_ports);
>> +    }
>>       edid = dp->panel->edid;
> 
