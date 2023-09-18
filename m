Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D27A5436
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 22:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DCF10E336;
	Mon, 18 Sep 2023 20:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC77110E336
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 20:35:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38IKX9aB017857; Mon, 18 Sep 2023 20:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AMAj4eg6ZXVDVrwm1/8YM+9P2KdJ08AVrDIfJvMjTbs=;
 b=Dla4adhjzxdJQuGUQtHOXdVZqaJhwNXYPzn4HK6447K3lcL1wCMdb6HChJEYq1XfpwLr
 VfTudyVTGjbiTW70cKN96W+LfLhK/niGE9NSRG1rnWMytq648SbE87848oIG2bQh13PY
 53Ehfu+0+6ZvLuDv453aF1fD4UA0gBz+SsnxnVQiMBz956TKKyOPXzgQ2xJEk3gTfZ7Q
 daVQ7qVzTK68lFjTm+gEAXHW8grd+jeGqCVK37r7SW/3nGceAIHmH9ZfrcDlLGPIBMrv
 krfDzyHD6cnycofvqhQ5IcTxV3GEYmPJQwUAu0VSKWiPL0bvjfhwwacZ7JUuJdkdLI0Q QQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6qf6gy06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:35:08 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IKZ7qB022978
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:35:07 GMT
Received: from [10.110.125.66] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 13:35:07 -0700
Message-ID: <f080c5f2-7331-ae19-bcf0-48da4975235b@quicinc.com>
Date: Mon, 18 Sep 2023 13:35:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 6/9] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
Content-Language: en-US
To: John Watts <contact@jookia.org>, <dri-devel@lists.freedesktop.org>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-7-contact@jookia.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230918125853.2249187-7-contact@jookia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lNAbGeftP9ZdE2wr3RWiEEh04LK0ATHu
X-Proofpoint-ORIG-GUID: lNAbGeftP9ZdE2wr3RWiEEh04LK0ATHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_09,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309180180
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/18/2023 5:58 AM, John Watts wrote:
> This display is extremely similar to the LTK035C5444T, but still has
> some minor variations in panel initialization.
> 
> Signed-off-by: John Watts <contact@jookia.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 223 ++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 2b24c684a8ac..a42c38d93f52 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -238,6 +238,201 @@ static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
>   	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
>   };
>   
> +static const struct nv3052c_reg fs035vg158_panel_regs[] = {
> +	// EXTC Command set enable, select page 1
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
> +	// Mostly unknown registers
> +	{ 0xe3, 0x00 },
> +	{ 0x40, 0x00 },
> +	{ 0x03, 0x40 },
> +	{ 0x04, 0x00 },
> +	{ 0x05, 0x03 },
> +	{ 0x08, 0x00 },
> +	{ 0x09, 0x07 },
> +	{ 0x0a, 0x01 },
> +	{ 0x0b, 0x32 },
> +	{ 0x0c, 0x32 },
> +	{ 0x0d, 0x0b },
> +	{ 0x0e, 0x00 },
> +	{ 0x23, 0x20 }, // RGB interface control: DE MODE PCLK-N
> +	{ 0x24, 0x0c },
> +	{ 0x25, 0x06 },
> +	{ 0x26, 0x14 },
> +	{ 0x27, 0x14 },
> +	{ 0x38, 0x9c }, //VCOM_ADJ1, different to ltk035c5444t
> +	{ 0x39, 0xa7 }, //VCOM_ADJ2, different to ltk035c5444t
> +	{ 0x3a, 0x50 }, //VCOM_ADJ3, different to ltk035c5444t
> +	{ 0x28, 0x40 },
> +	{ 0x29, 0x01 },
> +	{ 0x2a, 0xdf },
> +	{ 0x49, 0x3c },
> +	{ 0x91, 0x57 }, //EXTPW_CTRL2, different to ltk035c5444t
> +	{ 0x92, 0x57 }, //EXTPW_CTRL3, different to ltk035c5444t
> +	{ 0xa0, 0x55 },
> +	{ 0xa1, 0x50 },
> +	{ 0xa4, 0x9c },
> +	{ 0xa7, 0x02 },
> +	{ 0xa8, 0x01 },
> +	{ 0xa9, 0x01 },
> +	{ 0xaa, 0xfc },
> +	{ 0xab, 0x28 },
> +	{ 0xac, 0x06 },
> +	{ 0xad, 0x06 },
> +	{ 0xae, 0x06 },
> +	{ 0xaf, 0x03 },
> +	{ 0xb0, 0x08 },
> +	{ 0xb1, 0x26 },
> +	{ 0xb2, 0x28 },
> +	{ 0xb3, 0x28 },
> +	{ 0xb4, 0x03 }, // Unknown, different to ltk035c5444
> +	{ 0xb5, 0x08 },
> +	{ 0xb6, 0x26 },
> +	{ 0xb7, 0x08 },
> +	{ 0xb8, 0x26 },
> +	{ 0xf0, 0x00 },
> +	{ 0xf6, 0xc0 },
> +	// EXTC Command set enable, select page 0
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> +	// Set gray scale voltage to adjust gamma
> +	{ 0xb0, 0x0b }, // PGAMVR0
> +	{ 0xb1, 0x16 }, // PGAMVR1
> +	{ 0xb2, 0x17 }, // PGAMVR2
> +	{ 0xb3, 0x2c }, // PGAMVR3
> +	{ 0xb4, 0x32 }, // PGAMVR4
> +	{ 0xb5, 0x3b }, // PGAMVR5
> +	{ 0xb6, 0x29 }, // PGAMPR0
> +	{ 0xb7, 0x40 }, // PGAMPR1
> +	{ 0xb8, 0x0d }, // PGAMPK0
> +	{ 0xb9, 0x05 }, // PGAMPK1
> +	{ 0xba, 0x12 }, // PGAMPK2
> +	{ 0xbb, 0x10 }, // PGAMPK3
> +	{ 0xbc, 0x12 }, // PGAMPK4
> +	{ 0xbd, 0x15 }, // PGAMPK5
> +	{ 0xbe, 0x19 }, // PGAMPK6
> +	{ 0xbf, 0x0e }, // PGAMPK7
> +	{ 0xc0, 0x16 }, // PGAMPK8
> +	{ 0xc1, 0x0a }, // PGAMPK9
> +	// Set gray scale voltage to adjust gamma
> +	{ 0xd0, 0x0c }, // NGAMVR0
> +	{ 0xd1, 0x17 }, // NGAMVR0
> +	{ 0xd2, 0x14 }, // NGAMVR1
> +	{ 0xd3, 0x2e }, // NGAMVR2
> +	{ 0xd4, 0x32 }, // NGAMVR3
> +	{ 0xd5, 0x3c }, // NGAMVR4
> +	{ 0xd6, 0x22 }, // NGAMPR0
> +	{ 0xd7, 0x3d }, // NGAMPR1
> +	{ 0xd8, 0x0d }, // NGAMPK0
> +	{ 0xd9, 0x07 }, // NGAMPK1
> +	{ 0xda, 0x13 }, // NGAMPK2
> +	{ 0xdb, 0x13 }, // NGAMPK3
> +	{ 0xdc, 0x11 }, // NGAMPK4
> +	{ 0xdd, 0x15 }, // NGAMPK5
> +	{ 0xde, 0x19 }, // NGAMPK6
> +	{ 0xdf, 0x10 }, // NGAMPK7
> +	{ 0xe0, 0x17 }, // NGAMPK8
> +	{ 0xe1, 0x0a }, // NGAMPK9
> +	// EXTC Command set enable, select page 3
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
> +	// Set various timing settings
> +	{ 0x00, 0x2a }, // GIP_VST_1
> +	{ 0x01, 0x2a }, // GIP_VST_2
> +	{ 0x02, 0x2a }, // GIP_VST_3
> +	{ 0x03, 0x2a }, // GIP_VST_4
> +	{ 0x04, 0x61 }, // GIP_VST_5
> +	{ 0x05, 0x80 }, // GIP_VST_6
> +	{ 0x06, 0xc7 }, // GIP_VST_7
> +	{ 0x07, 0x01 }, // GIP_VST_8
> +	{ 0x08, 0x03 }, // GIP_VST_9
> +	{ 0x09, 0x04 }, // GIP_VST_10
> +	{ 0x70, 0x22 }, // GIP_ECLK1
> +	{ 0x71, 0x80 }, // GIP_ECLK2
> +	{ 0x30, 0x2a }, // GIP_CLK_1
> +	{ 0x31, 0x2a }, // GIP_CLK_2
> +	{ 0x32, 0x2a }, // GIP_CLK_3
> +	{ 0x33, 0x2a }, // GIP_CLK_4
> +	{ 0x34, 0x61 }, // GIP_CLK_5
> +	{ 0x35, 0xc5 }, // GIP_CLK_6
> +	{ 0x36, 0x80 }, // GIP_CLK_7
> +	{ 0x37, 0x23 }, // GIP_CLK_8
> +	{ 0x40, 0x03 }, // GIP_CLKA_1
> +	{ 0x41, 0x04 }, // GIP_CLKA_2
> +	{ 0x42, 0x05 }, // GIP_CLKA_3
> +	{ 0x43, 0x06 }, // GIP_CLKA_4
> +	{ 0x44, 0x11 }, // GIP_CLKA_5
> +	{ 0x45, 0xe8 }, // GIP_CLKA_6
> +	{ 0x46, 0xe9 }, // GIP_CLKA_7
> +	{ 0x47, 0x11 }, // GIP_CLKA_8
> +	{ 0x48, 0xea }, // GIP_CLKA_9
> +	{ 0x49, 0xeb }, // GIP_CLKA_10
> +	{ 0x50, 0x07 }, // GIP_CLKB_1
> +	{ 0x51, 0x08 }, // GIP_CLKB_2
> +	{ 0x52, 0x09 }, // GIP_CLKB_3
> +	{ 0x53, 0x0a }, // GIP_CLKB_4
> +	{ 0x54, 0x11 }, // GIP_CLKB_5
> +	{ 0x55, 0xec }, // GIP_CLKB_6
> +	{ 0x56, 0xed }, // GIP_CLKB_7
> +	{ 0x57, 0x11 }, // GIP_CLKB_8
> +	{ 0x58, 0xef }, // GIP_CLKB_9
> +	{ 0x59, 0xf0 }, // GIP_CLKB_10
> +	// Map internal GOA signals to GOA output pad
> +	{ 0xb1, 0x01 }, // PANELD2U2
> +	{ 0xb4, 0x15 }, // PANELD2U5
> +	{ 0xb5, 0x16 }, // PANELD2U6
> +	{ 0xb6, 0x09 }, // PANELD2U7
> +	{ 0xb7, 0x0f }, // PANELD2U8
> +	{ 0xb8, 0x0d }, // PANELD2U9
> +	{ 0xb9, 0x0b }, // PANELD2U10
> +	{ 0xba, 0x00 }, // PANELD2U11
> +	{ 0xc7, 0x02 }, // PANELD2U24
> +	{ 0xca, 0x17 }, // PANELD2U27
> +	{ 0xcb, 0x18 }, // PANELD2U28
> +	{ 0xcc, 0x0a }, // PANELD2U29
> +	{ 0xcd, 0x10 }, // PANELD2U30
> +	{ 0xce, 0x0e }, // PANELD2U31
> +	{ 0xcf, 0x0c }, // PANELD2U32
> +	{ 0xd0, 0x00 }, // PANELD2U33
> +	// Map internal GOA signals to GOA output pad
> +	{ 0x81, 0x00 }, // PANELU2D2
> +	{ 0x84, 0x15 }, // PANELU2D5
> +	{ 0x85, 0x16 }, // PANELU2D6
> +	{ 0x86, 0x10 }, // PANELU2D7
> +	{ 0x87, 0x0a }, // PANELU2D8
> +	{ 0x88, 0x0c }, // PANELU2D9
> +	{ 0x89, 0x0e }, // PANELU2D10
> +	{ 0x8a, 0x02 }, // PANELU2D11
> +	{ 0x97, 0x00 }, // PANELU2D24
> +	{ 0x9a, 0x17 }, // PANELU2D27
> +	{ 0x9b, 0x18 }, // PANELU2D28
> +	{ 0x9c, 0x0f }, // PANELU2D29
> +	{ 0x9d, 0x09 }, // PANELU2D30
> +	{ 0x9e, 0x0b }, // PANELU2D31
> +	{ 0x9f, 0x0d }, // PANELU2D32
> +	{ 0xa0, 0x01 }, // PANELU2D33
> +	// EXTC Command set enable, select page 2
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> +	// Unknown registers
> +	{ 0x01, 0x01 },
> +	{ 0x02, 0xda },
> +	{ 0x03, 0xba },
> +	{ 0x04, 0xa8 },
> +	{ 0x05, 0x9a },
> +	{ 0x06, 0x70 },
> +	{ 0x07, 0xff },
> +	{ 0x08, 0x91 },
> +	{ 0x09, 0x90 },
> +	{ 0x0a, 0xff },
> +	{ 0x0b, 0x8f },
> +	{ 0x0c, 0x60 },
> +	{ 0x0d, 0x58 },
> +	{ 0x0e, 0x48 },
> +	{ 0x0f, 0x38 },
> +	{ 0x10, 0x2b },
> +	// EXTC Command set enable, select page 0
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
> +	// Display Access Control
> +	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
> +};
> +
>   static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct nv3052c, panel);
> @@ -463,6 +658,21 @@ static const struct drm_display_mode ltk035c5444t_modes[] = {
>   	},
>   };
>   
> +static const struct drm_display_mode fs035vg158_modes[] = {
> +	{ /* 60 Hz */
> +		.clock = 21000,
> +		.hdisplay = 640,
> +		.hsync_start = 640 + 34,
> +		.hsync_end = 640 + 34 + 4,
> +		.htotal = 640 + 34 + 4 + 20,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 12,
> +		.vsync_end = 480 + 12 + 4,
> +		.vtotal = 480 + 12 + 4 + 6,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
>   static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
>   	.display_modes = ltk035c5444t_modes,
>   	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
> @@ -474,14 +684,27 @@ static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
>   	.panel_regs_len = ARRAY_SIZE(ltk035c5444t_panel_regs),
>   };
>   
> +static const struct nv3052c_panel_info fs035vg158_panel_info = {
> +	.display_modes = fs035vg158_modes,
> +	.num_modes = ARRAY_SIZE(fs035vg158_modes),
> +	.width_mm = 70,
> +	.height_mm = 53,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.panel_regs = fs035vg158_panel_regs,
> +	.panel_regs_len = ARRAY_SIZE(fs035vg158_panel_regs),
> +};
> +
>   static const struct spi_device_id nv3052c_ids[] = {
>   	{ "ltk035c5444t", },
> +	{ "fs035vg158", },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, nv3052c_ids);
>   
>   static const struct of_device_id nv3052c_of_match[] = {
>   	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
> +	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, nv3052c_of_match);
> -- 
> 2.42.0
> 
