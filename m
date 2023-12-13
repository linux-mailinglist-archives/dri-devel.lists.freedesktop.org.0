Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F123811AA2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309210E094;
	Wed, 13 Dec 2023 17:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C479A10E094
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:15:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDCTsuw005911; Wed, 13 Dec 2023 17:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=NIBLCVfFvHfFIyI60aybAIDsfELoJjQkDVRyojcp9j4=; b=Il
 wFU9voJiT4HWRsmx+xjSCKrSESLRyvpkkdghAmdkhpKZIqfGtC6vr83JJCAbWG+t
 fC1dydKsBD87mOxuHrn29B5E+ly3PDv1zdVl3BV00BBG8LeqU2KPAKqG2gZqxDlw
 JAGisY2laPBVkXhgZ5fNoSqf+kKOM1d7jJ+PuKvbMu4uBEvmsAOVDgkH3y7B9vBg
 HThB3PBCqsTCzbLl5OdLH6i7cEq4rBmiKmS5Dtv7Hq/79K2mQYciL3nFRQmuA5xx
 BIU9IXTEfvi8ZMZr3JZljAJzYVhBXTgdu25Yq4i1P41BnUpcTfRS0uegb20+WMl8
 V57eH2AMvVArQzLQTjvQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy32na3eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 17:15:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDHFS8w019171
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 17:15:28 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 09:15:26 -0800
Message-ID: <7083b139-b6f7-44ed-b294-5c69fceed604@quicinc.com>
Date: Wed, 13 Dec 2023 09:15:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w
Content-Language: en-US
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 <quentin.schulz@theobroma-systems.com>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
References: <20231213145045.41020-1-farouk.bouabid@theobroma-systems.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231213145045.41020-1-farouk.bouabid@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aQ3cJAdifeL0BJZ_OHKPlyq3_l5ROH5-
X-Proofpoint-GUID: aQ3cJAdifeL0BJZ_OHKPlyq3_l5ROH5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312130123
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
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2023 6:50 AM, Farouk Bouabid wrote:
> The ltk050h3148w variant expects the horizontal component lane byte clock
> cycle(lbcc) to be calculated using lane_mbps (burst mode) instead of the
> pixel clock.
> Using the pixel clock rate by default for this calculation was introduced
> in commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
> rate to calculate lbcc") and starting from commit 93e82bb4de01
> ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
> only panels that support burst mode can keep using the lane_mbps. So add
> MIPI_DSI_MODE_VIDEO_BURST as part of the mode_flags for the dsi host.
> 
> Fixes: 93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 6e3670508e3a..30919c872ac8 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -326,7 +326,7 @@ static const struct drm_display_mode ltk050h3148w_mode = {
>   static const struct ltk050h3146w_desc ltk050h3148w_data = {
>   	.mode = &ltk050h3148w_mode,
>   	.init = ltk050h3148w_init_sequence,
> -	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO_BURST,
>   };
>   
>   static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
> -- 
> 2.34.1
> 
