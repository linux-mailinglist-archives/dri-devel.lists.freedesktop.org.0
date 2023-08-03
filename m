Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC6576F07D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 19:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C28410E637;
	Thu,  3 Aug 2023 17:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A82C10E637
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 17:19:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 373DlxuW002847; Thu, 3 Aug 2023 17:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QEZvBRN1XyEsnpHaGGxlfwRavP7wNOBkAxVCMZ+3ar8=;
 b=D9s93xL1QsCTTlWWYT7fNEiPIkz/NBU49ESnwWEYA9+VoUAPhgmGisjVLiDiDEKw/I9n
 A3lg6Dcn0U965uxTB9QH6n2pwPkyb2oZBBhN3uTc3I8PHs2LiW5DoRrbnuGF58TG63nk
 abVkKqiCsbLBtWbRFKrwE4bpzLLHDMOntAnzm3Ep69v12u6Cu5aCFPWHw9Y3tAFYiJtX
 jWtYdCQc4O7hATHyIWeog9+DfEu8xelEeWLcdxA62W4nZoE0NGEtWEm5uQ9rP6E5N2ff
 c+tuxUkO14XxM71PxR3B6UQwy4ilxBrpM25jolePcxk4hlJ5Hha4b3nrKnyvaZmaSlR9 Gw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s863a9mya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Aug 2023 17:19:21 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 373HJKnB001066
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Aug 2023 17:19:20 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 10:19:19 -0700
Message-ID: <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
Date: Thu, 3 Aug 2023 10:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: w-mz3_XC9XVPkwtQe6UWiFT5QXyVIk73
X-Proofpoint-GUID: w-mz3_XC9XVPkwtQe6UWiFT5QXyVIk73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_17,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030155
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
Cc: quic_parellan@quicinc.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/31/2023 6:00 AM, Neil Armstrong wrote:
> Hi,
> 
> On 26/07/2023 00:56, Jessica Zhang wrote:
>> Due to a recent introduction of the pre_enable_prev_first bridge flag 
>> [1],
>> the panel driver will be probed before the DSI is enabled, causing the
>> DCS commands to fail to send.
>>
>> Ensure that DSI is enabled before panel probe by setting the
>> prepare_prev_first flag for the panel.
> 
> Well this is specific to MSM DSI driver, it's not related at all to the 
> panel.

Hi Neil,

I think there might be some confusion caused by the commit message -- 
instead of "enabled before panel probe", it should be "enabled before 
panel pre_enable()" as the panel on commands are sent during prepare(), 
which is matched to bridge pre_enable().

IIRC the general rule is that the panel driver should set the 
prepare_prev_first flag if the on commands are sent during pre_enable(), 
so I'll keep the code change but correct the commit message if that's ok 
with you.

Thanks,

Jessica Zhang

> 
> Neil
> 
>>
>> [1] commit 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first 
>> to alter bridge init order")
>>
>> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel driver")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> index bb0dfd86ea67..e1363e128e7e 100644
>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct 
>> mipi_dsi_device *dsi)
>>       dsi->format = MIPI_DSI_FMT_RGB888;
>>       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>                 MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +    ctx->panel.prepare_prev_first = true;
>>       drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>                  DRM_MODE_CONNECTOR_DSI);
>>
>> ---
>> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
>> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
>>
>> Best regards,
> 
