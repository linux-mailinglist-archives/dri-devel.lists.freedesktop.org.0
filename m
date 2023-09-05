Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14074793056
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 22:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B61A10E507;
	Tue,  5 Sep 2023 20:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3210E507
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 20:51:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 385KJGYk018690; Tue, 5 Sep 2023 20:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oip9wJl7xk+nhSkNsTEw/FhZ3lnYHbamCwAxQ6se9yA=;
 b=O6rZ+LEaWRx1tFuLBakLXHmtkLJpJ3HDPzatffGW9sIfN+4CRTixatNL5K1J+aKbVHed
 yIOmomLUs+Pob2DPMKNkPq7g8E/3hpoup4gGucKLr41mj5MTqdJDkTvMuZIWmgkIpr9l
 SmMlNuHX5Nws2fpEN7F1BtH+9Fw0S2ioS9Lw1H2nRUUUKD46ATp7dhkUzcS9K3kGs9cG
 iYPeTHCAA7BhBDTIea33L6/unIXy+e++d4UUTmLDdN/WkujKH4z8ZlZ/+AuMYsKWwmBY
 L0CEBak5Pw8pHKLuOYH9oFdgJMGfauG3B3zcnKSkE+Cct7LwDKhpFBM/vx/shCOLM7Rb Vg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swtevjaye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Sep 2023 20:51:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385Kp64j022144
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 5 Sep 2023 20:51:06 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 13:51:05 -0700
Message-ID: <4281745a-e886-6392-8912-30329eb435a2@quicinc.com>
Date: Tue, 5 Sep 2023 13:50:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add AUO G156HAN04.0 LVDS display support
To: Elmar Albert <eal.git@mailbox.org>
References: <20230828094943.123676-1-eal.git@mailbox.org>
 <20230828094943.123676-2-eal.git@mailbox.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230828094943.123676-2-eal.git@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4AzVZZnoK-nj9Y2XROw5EGq82rewNlGV
X-Proofpoint-ORIG-GUID: 4AzVZZnoK-nj9Y2XROw5EGq82rewNlGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309050181
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Elmar,

Just had a few minor comments:

Looking at past panel-simple changes, I think the prefix here should be 
"drm/panel: simple:"

On 8/28/2023 2:49 AM, Elmar Albert wrote:
> From: Elmar Albert <ealbert@data-modul.com>
> 
> G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
> a TFT LCD panel, a driver circuit, and LED backlight system. The screen
> format is intended to supportthe 16:9 FHD, 1920(H) x 1080(V) screen

nit: "support the"

> and 16.7M colors (RGB 8-bits ) with LED backlight driving circuit.
> All input signals are LVDS interface compatible.
> 
> G156HAN04.0 is designed for a display unit of notebook style
> personal computer and industrial machine.
> 
> Signed-off-by: Elmar Albert <ealbert@data-modul.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 52572fde9705..4fe6dafcabf6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1050,6 +1050,39 @@ static const struct panel_desc auo_g133han01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing auo_g156han04_timings = {
> +	.pixelclock = { 137000000, 141000000, 146000000 },
> +
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 60, 60, 60 },
> +	.hback_porch =  { 90, 92, 111 },
> +	.hsync_len =    { 32, 32, 32 },
> +
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 12, 12, 12 },
> +	.vback_porch =  { 24, 36, 56 },
> +	.vsync_len =    {  8,  8,  8 },
> +};
> +
> +static const struct panel_desc auo_g156han04 = {
> +	.timings = &auo_g156han04_timings,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 344,
> +		.height = 194,
> +	},
> +	.delay = {
> +		.prepare = 50,		/* T2 */
> +		.enable = 200,		/* T3 */
> +		.disable = 110,		/* T10 */
> +		.unprepare = 1000,	/* T13 */

The inclusion of the comments seems unnecessary.

Thanks,

Jessica Zhang

> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode auo_g156xtn01_mode = {
>   	.clock = 76000,
>   	.hdisplay = 1366,
> @@ -4118,6 +4151,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "auo,g133han01",
>   		.data = &auo_g133han01,
> +	}, {
> +		.compatible = "auo,g156han04",
> +		.data = &auo_g156han04,
>   	}, {
>   		.compatible = "auo,g156xtn01",
>   		.data = &auo_g156xtn01,
> -- 
> 2.34.1
> 
