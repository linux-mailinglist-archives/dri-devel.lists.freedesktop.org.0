Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6E7DC172
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 21:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA7210E0FF;
	Mon, 30 Oct 2023 20:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10810E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 20:58:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UKJgQ4004489; Mon, 30 Oct 2023 20:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UmvAc9EpzPV1PDkcvwa9u2O5lzyZJLx0RvON/OO1Y98=;
 b=WcQmYzUczuRtz1vptlkDl+ci7QWEvFfEOOhnl52TYa6AT1DrGZFm4WbAeuEDezugAm93
 7dc3g4E6S/YOlqvM3hLjK18nDkQ2h6StjjujNYbXaVd3qCHll6ty9gfQIqO797tPRDOC
 uBbW2s8MwdvgNAeSSvdfcyGxj75m5BOw/T3Z/YxK5dkhAx6BPu5uLV8FEolUklxZxUPf
 YgBxCFGuMcueqZSLhuMV4pp4udwrbF2e4hnKXJSEcKvp1P4RT/Sn0eyfwXg0tv/rLKfJ
 xshNaZRHpXnaSsIFysO/QmTGBUOz6WnAz0Gpch/n9I1cFEsVrylBcXmem4KJy5KEeShh RQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7vxnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 20:58:34 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UKwXIN004356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 20:58:33 GMT
Received: from [10.134.69.165] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 13:58:33 -0700
Message-ID: <631454b9-9f50-4cad-a58e-b9ea9dead421@quicinc.com>
Date: Mon, 30 Oct 2023 13:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel-edp: Add timings for BOE NV133WUM-N63
Content-Language: en-US
To: Clayton Craft <clayton@craftyguy.net>, <dri-devel@lists.freedesktop.org>
References: <20231028021910.24031-1-clayton@craftyguy.net>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231028021910.24031-1-clayton@craftyguy.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Rq5kUMmYc7bFoA-hHsCIMDnxPomXjnr2
X-Proofpoint-GUID: Rq5kUMmYc7bFoA-hHsCIMDnxPomXjnr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300165
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/27/2023 7:19 PM, Clayton Craft wrote:
> This panel is found on laptops e.g., variants of the Thinkpad X13s.
> Configuration was collected from the panel's EDID.

Hi Clayton,

Thanks for the patch -- it looks good to me aside from one minor comment 
below.

> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 95c8472d878a..5db283f014f3 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
>   	},
>   };
>   
> +static const struct drm_display_mode boe_nv133wum_n63_modes = {

Will other modes be added to this struct in the future? If so, I think 
we can probably turn this into an array to make it easier to extend.

Otherwise, can you change the name to "*_mode"? Seems to me that almost 
all other panels with a single mode have the name as "*_mode" with the 
only exception being a carry-over from older panel-simple.c code.

Thanks,

Jessica Zhang

> +	.clock = 157760,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 3,
> +	.vsync_end = 1200 + 3 + 6,
> +	.vtotal = 1200 + 3 + 6 + 31,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc boe_nv133wum_n63 = {
> +	.modes = &boe_nv133wum_n63_modes,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 286,
> +		.height = 179,
> +	},
> +};
> +
>   static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
>   	{
>   		.clock = 148500,
> @@ -1723,6 +1746,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,nv133fhm-n62",
>   		.data = &boe_nv133fhm_n61,
> +	}, {
> +		.compatible = "boe,nv133wum-n63",
> +		.data = &boe_nv133wum_n63,
>   	}, {
>   		.compatible = "boe,nv140fhmn49",
>   		.data = &boe_nv140fhmn49,
> @@ -1852,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>   
> -- 
> 2.40.1
> 
