Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634599A9B6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 19:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F054E10EBB4;
	Fri, 11 Oct 2024 17:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cKvjmkw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458EC10EBB6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 17:18:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BFhQiS024074;
 Fri, 11 Oct 2024 17:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9Er+9IWq6PcBbaWxKcA/fefqTEe9x4G35ud7dwSVM+Y=; b=cKvjmkw1820T33vf
 TbOIBmJ9IKr7wPNgqm/JT5+YFK69rdiFwmUyHos3+HLmWPuKoT9vsSwCmZg/sW0D
 EMy4/ZY8Yjliyv2bpvxMHaHwqEs5snQuXVqG+L+ovQ0XSd+FcFOd0U1TMgA8mr28
 onWc82b4lKR+LtpQElNTWLJkT4sTtLlM0eXN4XnHEgRhhOWCnRkbWTW6aXjQtxBy
 bYVKtoLvrPoIT58TNnBOnNXpFr9WXkp06T+4w8SNZh/aCUIybmgyCAU8YbLSxIln
 rRqIrPQmhOWo7K6/z9WCH0Nn6wBRkKnpD/ZNOtkPzuEh7U28TyG/GeIOPUUJkHnN
 U33xgw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426y3vst81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:17:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BHHwsM022559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:17:58 GMT
Received: from [10.110.78.155] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 10:17:57 -0700
Message-ID: <1e23cfa8-66c6-476b-927c-695172e76143@quicinc.com>
Date: Fri, 11 Oct 2024 10:17:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
To: Jakob Hauser <jahau@rocketmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>
References: <cover.1728582727.git.jahau@rocketmail.com>
 <70ea852342001779956905ed9002a977d1d95293.1728582727.git.jahau@rocketmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <70ea852342001779956905ed9002a977d1d95293.1728582727.git.jahau@rocketmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fUkM-HGwwqDqadETGWFm-B_usaTNU1vd
X-Proofpoint-GUID: fUkM-HGwwqDqadETGWFm-B_usaTNU1vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110120
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



On 10/10/2024 11:31 AM, Jakob Hauser wrote:
> The way of implementing a flip option follows the existing
> panel-samsung-s6e8aa0.c [1][2][3].
> 
> The value to flip the screen is taken from a downstream kernel file of
> a similar but older panel [4]. The mipi clock [5] for the new panel
> samsung-s6e88a0-ams427ap24 matches 461 MHz and a hardware read-out of the
> 0xcb values corresponds to revision R01 of that older panel [6]. Although
> for samsung-s6e88a0-ams427ap24 that's in non-flipped state while in this
> older driver it seems to be the other way around. Further up there is a

Hi Jakob,

I'm a bit confused by the wording here. Do you mean that even though the 
downstream driver comments state the panel is in a non-flipped state by 
default, your observations suggest that it's actually defaulting to a 
flipped state?

Thanks,

Jessica Zhang

> hint [7] basically saying for revision R01 to change the first word of the
> 0xcb command from 0x06 to 0x0e, which is actually setting BIT(3) of that
> word. This causes a horizontal flip.
> 
> [1] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L103
> [2] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L207-L211
> [3] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L954-L974
> [4] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c
> [5] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L2027-L2028
> [6] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L137-L151
> [7] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L66-L74
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
>   .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index 657120d7dd33..4d5c494e03ae 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -32,6 +32,7 @@ struct s6e88a0_ams427ap24 {
>   	struct mipi_dsi_device *dsi;
>   	struct regulator_bulk_data *supplies;
>   	struct gpio_desc *reset_gpio;
> +	bool flip_horizontal;
>   	bool prepared;
>   };
>   
> @@ -539,6 +540,10 @@ static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
> +
> +	if (ctx->flip_horizontal)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x0e);
> +
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
>   
> @@ -673,6 +678,15 @@ static int s6e88a0_ams427ap24_register_backlight(struct s6e88a0_ams427ap24 *ctx)
>   	return ret;
>   }
>   
> +static void s6e88a0_ams427ap24_parse_dt(struct s6e88a0_ams427ap24 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	struct device_node *np = dev->of_node;
> +
> +	ctx->flip_horizontal = of_property_read_bool(np, "flip-horizontal");
> +}
> +
>   static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -707,6 +721,8 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
>   		       DRM_MODE_CONNECTOR_DSI);
>   	ctx->panel.prepare_prev_first = true;
>   
> +	s6e88a0_ams427ap24_parse_dt(ctx);
> +
>   	ret = s6e88a0_ams427ap24_register_backlight(ctx);
>   	if (ret < 0)
>   		return ret;
> -- 
> 2.39.5
> 

