Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB696613F94
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 22:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67C910E17B;
	Mon, 31 Oct 2022 21:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA81410E0F3;
 Mon, 31 Oct 2022 21:11:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29VL81J6007811; Mon, 31 Oct 2022 21:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZAkqwLRZ1j8jO6LLr5eFL4hvEKpdF5SbJ3eHSOfdEyQ=;
 b=EYc6gAvXR0WeEB6DU8BKlcKWSBQtg8jhgCXc8duZjU8aNgPFZRXD3EnnDaQDKSwmmEfN
 8zNfulSRNSZGzg/Ic3PnvPIi/N2VwbAkKtYxnKJscOWHVVVBuoBQgzWPWgAr0z6d/EXh
 UnfcKWdB8BCZNd7l/K/VJF7JD5GDOzs2/hqw3rk9aRj2WcfvniD1RtxZv65ruKCRgJjb
 1Gs1et0dVRPZ2nlTgd8LUdIhkVStpJlS85rMA3zWD5QBMZBEV9ABCXFIX00OPTDmrwTY
 kPGlHIsXCDooSPQTH3ZfzdUIKOm/e65DDxs/RanE3lKFjNiRaeN/FrIzAZhDfEdjMgnV 5w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kjnh2r13y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 21:11:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29VLBnBo025697
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 21:11:49 GMT
Received: from [10.110.63.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 14:11:47 -0700
Message-ID: <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
Date: Mon, 31 Oct 2022 14:11:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ncKcc3Nx-eKDKW4967MDvSq-ns-XbuSb
X-Proofpoint-GUID: ncKcc3Nx-eKDKW4967MDvSq-ns-XbuSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_21,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=824
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310131
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,


Link rate is advertised by sink, but adjusted (reduced the link rate)  
by host during link training.

Therefore should be fine if host did not support HBR3 rate.

It will reduce to lower link rate during link training procedures.

kuogee

On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> On 31/10/2022 20:27, Kuogee Hsieh wrote:
>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
>> had been implemented already, it is not necessary to limit link
>> rate at HBR2 (5.4G). This patch remove this limitation to support
>> HBR3 (8.1G) link rate.
>
> The DP driver supports several platforms including sdm845 and can 
> support, if I'm not mistaken, platforms up to msm8998/sdm630/660. 
> Could you please confirm that all these SoCs have support for HBR3?
>
> With that fact being confirmed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 5149ceb..3344f5a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel 
>> *dp_panel)
>>       if (link_info->num_lanes > dp_panel->max_dp_lanes)
>>           link_info->num_lanes = dp_panel->max_dp_lanes;
>>   -    /* Limit support upto HBR2 until HBR3 support is added */
>> -    if (link_info->rate >= 
>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>> -
>>       drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>>       drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>>       drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", 
>> link_info->num_lanes);
>
