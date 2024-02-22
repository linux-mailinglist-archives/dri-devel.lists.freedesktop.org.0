Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BA85FEF6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37FE10E0BF;
	Thu, 22 Feb 2024 17:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZATx9QUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB3210E0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:14:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M6mhJB019461; Thu, 22 Feb 2024 17:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=41ijdyh6f8n7C660F21th4GQ953AMCJ7CZREOVJwJS0=; b=ZA
 Tx9QUuIY8VQLegHQgGMdq5JfMCswoFCUxGsm2U+s0zx2YR9DnEmSa2I5yLQzl2N5
 YPo8yipuLg4TdlMd2xAteSKoyRSo+DaPIvQnaaGyvRGDjL2NAVyZp95owapdi718
 yde10SaY1NQZfPfMNwVw+DYKfdSvOEAR72m+nuRAgQ0IefzblHQvyb/gGC5olJT7
 TVjBP/X3v2sPsgtnK1fM0KKf0DzLar1fpVrxDVAwOjwI5Ehf2ykbihpyt0vjyQVg
 RihjJeuhna6PEDdsOO/WQTJYX4IVf5yer0DrhnObwtgRLKscV0b7GuayKNTi8gLS
 QMyLoaJbIhR4Uyq70REg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we1b0hp20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 17:14:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MHEQlg018442
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 17:14:26 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 09:14:26 -0800
Message-ID: <f9446923-acd3-41cf-92d4-676b946280c4@quicinc.com>
Date: Thu, 22 Feb 2024 09:14:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
To: Adam Green <greena88@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
 <20240222164332.3864716-2-greena88@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240222164332.3864716-2-greena88@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: c96G9I9C2Z3p0VD_rZ4yHUrDP4wr5jn7
X-Proofpoint-GUID: c96G9I9C2Z3p0VD_rZ4yHUrDP4wr5jn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_13,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220135
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



On 2/22/2024 8:43 AM, Adam Green wrote:
> The Hardkernel ODROID-GO Ultra is a handheld gaming devices, with
> a 5 inch 480x854 display. Add support for the display.
> 
> Signed-off-by: Adam Green <greena88@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 158 +++++++++++++++++-
>   1 file changed, 157 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 421eb4592b61..d08e8f4c39dd 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -423,6 +423,62 @@ static void kd50t048a_gip_sequence(struct st7701 *st7701)
>   		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
>   }
>   
> +static void odroid_go_ultra_gip_sequence(struct st7701 *st7701)
> +{
> +	ST7701_DSI(st7701, 0x01);
> +	msleep(20);
> +	ST7701_DSI(st7701, 0x11);
> +	msleep(120);
> +
> +	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x10);
> +	ST7701_DSI(st7701, 0xC0, 0xE9, 0x03);
> +	ST7701_DSI(st7701, 0xC1, 0x11, 0x02);
> +	ST7701_DSI(st7701, 0xC2, 0x31, 0x08);
> +	ST7701_DSI(st7701, 0xCC, 0x10);
> +	ST7701_DSI(st7701, 0xB0, 0x00, 0x0D, 0x14, 0x0D, 0x10, 0x05, 0x02, 0x08,
> +		   0x08, 0x1E, 0x05, 0x13, 0x11, 0xA3, 0x29, 0x18);
> +	ST7701_DSI(st7701, 0xB1, 0x00, 0x0C, 0x14, 0x0C, 0x10, 0x05, 0x03, 0x08,
> +		   0x07, 0x20, 0x05, 0x13, 0x11, 0xA4, 0x29, 0x18);
> +	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x11);
> +	ST7701_DSI(st7701, 0xB0, 0x6C);
> +	ST7701_DSI(st7701, 0xB1, 0x43);
> +	ST7701_DSI(st7701, 0xB2, 0x07);
> +	ST7701_DSI(st7701, 0xB3, 0x80);
> +	ST7701_DSI(st7701, 0xB5, 0x47);
> +	ST7701_DSI(st7701, 0xB7, 0x85);
> +	ST7701_DSI(st7701, 0xB8, 0x20);
> +	ST7701_DSI(st7701, 0xB9, 0x10);
> +	ST7701_DSI(st7701, 0xC1, 0x78);
> +	ST7701_DSI(st7701, 0xC3, 0x78);
> +	ST7701_DSI(st7701, 0xD0, 0x88);
> +	msleep(120);
> +
> +	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
> +	ST7701_DSI(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x09,
> +		   0x00, 0x00, 0x33, 0x33);
> +	ST7701_DSI(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
> +	ST7701_DSI(st7701, 0xE4, 0x44, 0x44);
> +	ST7701_DSI(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0,
> +		   0xA0, 0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
> +	ST7701_DSI(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
> +	ST7701_DSI(st7701, 0xE7, 0x44, 0x44);
> +	ST7701_DSI(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0,
> +		   0xA0, 0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
> +	ST7701_DSI(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
> +	ST7701_DSI(st7701, 0xEC, 0x02, 0x01);
> +	ST7701_DSI(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF,
> +		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
> +	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0x3A, 0x70);
> +	ST7701_DSI(st7701, 0x53, 0xEC);
> +	ST7701_DSI(st7701, 0x55, 0xB3);
> +	ST7701_DSI(st7701, 0x5E, 0xFF);
> +	ST7701_DSI(st7701, 0x29);
> +	msleep(50);
> +}
> +
>   static void rg_arc_gip_sequence(struct st7701 *st7701)
>   {
>   	st7701_switch_cmd_bkx(st7701, true, 3);
> @@ -470,7 +526,7 @@ static int st7701_prepare(struct drm_panel *panel)
>   				    st7701->supplies);
>   	if (ret < 0)
>   		return ret;
> -	msleep(20);
> +	msleep(120);

Hi Adam,

Just wondering, why the change to 120 here?

Thanks,

Jessica Zhang

>   
>   	gpiod_set_value(st7701->reset, 1);
>   	msleep(150);
> @@ -875,6 +931,105 @@ static const struct st7701_panel_desc kd50t048a_desc = {
>   	.gip_sequence = kd50t048a_gip_sequence,
>   };
>   
> +static const struct drm_display_mode odroid_go_ultra_mode = {
> +	.clock		= 29170,
> +
> +	.hdisplay	= 480,
> +	.hsync_start	= 480 + 12,
> +	.hsync_end	= 480 + 12 + 12,
> +	.htotal		= 480 + 12 + 12 + 38,
> +
> +	.vdisplay	= 854,
> +	.vsync_start	= 854 + 2,
> +	.vsync_end	= 854 + 2 + 19,
> +	.vtotal		= 854 + 2 + 19 + 22,
> +
> +	.width_mm	= 70,
> +	.height_mm	= 140,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct st7701_panel_desc odroid_go_ultra_desc = {
> +	.mode = &odroid_go_ultra_mode,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.panel_sleep_delay = 120,
> +
> +	.pv_gamma = {
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x2),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1e),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x23),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
> +	},
> +	.nv_gamma = {
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xc),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xc),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x3),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x24),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
> +	},
> +	.nlinv = 1,
> +	.vop_uv = 4887500,
> +	.vcom_uv = 937500,
> +	.vgh_mv = 15000,
> +	.vgl_mv = -9510,
> +	.avdd_mv = 6600,
> +	.avcl_mv = -4400,
> +	.gamma_op_bias = OP_BIAS_MIDDLE,
> +	.input_op_bias = OP_BIAS_MIN,
> +	.output_op_bias = OP_BIAS_MIN,
> +	.t2d_ns = 1600,
> +	.t3d_ns = 10400,
> +	.eot_en = true,
> +	.gip_sequence = odroid_go_ultra_gip_sequence,
> +};
> +
>   static const struct drm_display_mode rg_arc_mode = {
>   	.clock          = 25600,
>   
> @@ -1055,6 +1210,7 @@ static const struct of_device_id st7701_of_match[] = {
>   	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
>   	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
>   	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
> +	{ .compatible = "hardkernel,odroid-go-ultra-panel", .data = &odroid_go_ultra_desc },
>   	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
>   	{ }
>   };
> -- 
> 2.43.0
> 
