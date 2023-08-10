Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA0777E31
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BB410E5B7;
	Thu, 10 Aug 2023 16:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394710E5B7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 16:26:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AEvsff029813; Thu, 10 Aug 2023 16:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0+35MA21bVu00ibSUShQYv0IP8ZPdsQrA+dj/s8/9m4=;
 b=i1Lcjwdjan+7oJ2IDc3wVeyuM1GiemSqlqYWb5JD90L6QxakaPrsZ5If0SZoJF3GBgul
 AKPwDEgJUmrLr1cfeqCWn3vQumJRFrYYDIbIQ240YetwEGZtsF9agERSnavdzfY1MT2+
 FIQyxsCoolcT6QT6pMMRWkfwhlAn2SuGDrMWKBhwT93BUsK70IzAO3mJAJ+2EYMSKH2o
 0qK/cCMtB6aelNVySDpv7+q9ZsFOFUMKnCUHFNVpEoaxSZbZy6gjRx3utJTxZIlnyvhl
 vZkcRDPSfsd5QXsmgrjO/BEVHKETukf1F6hFg6Gz8f2y9cN4yKqSoU1gR6E8DL7gyWEc 9Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd243r8q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 16:26:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AGQik5022012
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 16:26:44 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 09:26:43 -0700
Message-ID: <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
Date: Thu, 10 Aug 2023 09:26:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YbsKcXu3G1VScMO5ZHJkOsaYMmKkjLxD
X-Proofpoint-GUID: YbsKcXu3G1VScMO5ZHJkOsaYMmKkjLxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_14,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100141
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
Cc: quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil

On 8/3/2023 10:19 AM, Jessica Zhang wrote:
> 
> 
> On 7/31/2023 6:00 AM, Neil Armstrong wrote:
>> Hi,
>>
>> On 26/07/2023 00:56, Jessica Zhang wrote:
>>> Due to a recent introduction of the pre_enable_prev_first bridge flag 
>>> [1],
>>> the panel driver will be probed before the DSI is enabled, causing the
>>> DCS commands to fail to send.
>>>
>>> Ensure that DSI is enabled before panel probe by setting the
>>> prepare_prev_first flag for the panel.
>>
>> Well this is specific to MSM DSI driver, it's not related at all to 
>> the panel.
> 

I dont fully agree this is a MSM DSI driver specific thing.

If the panel can send its commands in its enable() callback, then this 
flag need not be set.

When a panel sends its DCS commands in its pre_enable() callback, any 
DSI controller will need to be ON before that otherwise DCS commands 
cannot be sent.

With this in mind, may I know why is this a MSM change and not a panel 
change?

As per my discussion with Dmitry during the last sync up, we were 
aligned on this expectation.

Thanks

Abhinav

> Hi Neil,
> 
> I think there might be some confusion caused by the commit message -- 
> instead of "enabled before panel probe", it should be "enabled before 
> panel pre_enable()" as the panel on commands are sent during prepare(), 
> which is matched to bridge pre_enable().
> 
> IIRC the general rule is that the panel driver should set the 
> prepare_prev_first flag if the on commands are sent during pre_enable(), 
> so I'll keep the code change but correct the commit message if that's ok 
> with you.
> 
> Thanks,
> 

> Jessica Zhang
> 
>>
>> Neil
>>
>>>
>>> [1] commit 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first 
>>> to alter bridge init order")
>>>
>>> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel 
>>> driver")
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> index bb0dfd86ea67..e1363e128e7e 100644
>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct 
>>> mipi_dsi_device *dsi)
>>>       dsi->format = MIPI_DSI_FMT_RGB888;
>>>       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>>                 MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>> +    ctx->panel.prepare_prev_first = true;
>>>       drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>>                  DRM_MODE_CONNECTOR_DSI);
>>>
>>> ---
>>> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
>>> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
>>>
>>> Best regards,
>>
