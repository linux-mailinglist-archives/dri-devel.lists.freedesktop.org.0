Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B8D6896
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410210E305;
	Fri, 31 May 2024 17:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Epwj4ibJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CC110E305
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:56:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9ponh003178;
 Fri, 31 May 2024 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rKex3Az0C/erIIBFXu3wei9OYFVCFWIIXHqdSTyRNTU=; b=Epwj4ibJV1NUprY9
 LUo+6xOBLtTnvo6wYc2gLFHqG/iSIcoMUftd4LbFMKfIj3PAAuxBfLgv1c2kcLJu
 ML7Y45h4T0mAzZaJbdD/KOrJGUOcSn9UyUjCd1Q4x5+rqCOcvHmbT4Rl/2ek2WH5
 EMNrz/FR+Sb9wXhzjhwRIpktStloLlT/sfu3aYDGMBQmXYsyJnGX363j/QWos1Xm
 qSpqW5GV4nqccNh2EQLCIQoy8GZj/thTOJY+M21HrREnzaZ9RDXTjMZ+c77voadN
 50hGUhgTYG/KVQRZSoWj4OuOV5zheaHYYZuyQ+lQdZVDPn6VMCaWRzmTnMCz05xo
 isPcHg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfc9nhb5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:56:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHuHFQ011945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:56:17 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:56:16 -0700
Message-ID: <789b127a-c53a-4e1b-a83c-6cc666d34bc1@quicinc.com>
Date: Fri, 31 May 2024 10:56:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: panel: nv3052c: Add WL-355608-A8 panel
Content-Language: en-US
To: Ryan Walklin <ryan@testtoast.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Andre Przywara
 <andre.przywara@arm.com>, John Watts <contact@jookia.org>
References: <20240530082318.40516-1-ryan@testtoast.com>
 <20240530082318.40516-5-ryan@testtoast.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240530082318.40516-5-ryan@testtoast.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aHRk2a3bkiEHbbBCxqoSzLW7D0yopmLr
X-Proofpoint-GUID: aHRk2a3bkiEHbbBCxqoSzLW7D0yopmLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310136
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



On 5/30/2024 1:22 AM, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM used in a number of handheld gaming devices made by Anbernic.
> Limited information is available online however the panel timing values
> (below) have been obtained from the vendor BSP. The panel appears to
> integrate a NV3052C LCD driver (or clone). Available devices address it
> in SPI/RGB mode, with the timing signals generated from the device
> SoC (Allwinner H700) and passed through.
> 
> Add a panel definition and display mode to the existing NV3502C driver.
> 
> It was assumed during bringup that the initialisation sequence was the
> same as the existing Fascontek FS035VG158 panel, proved working during
> experimentation, however subsequent dumping of the init sequence with a
> logic analyser confirms one small change to VCOM_ADJ3 from 0x4a to 0x44,
> therefore a separate set of registers is also added.
> 
> Timings:
>             | Active |  FP  | Sync |  BP  | Total
> -----------|--------|------|------|------|-------
> Horizontal |   640  |  64  |  20  |  46  |  770
>    Vertical |   480  |  21  |   4  |  15  |  520
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Co-developed-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> Reviewed-by: John Watts <contact@jookia.org>

Hi Ryan,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> ---
> 
> Changelog v1..v2:
> - Update .compatible string to match dt-binding
> - Add co-developer sign-off and review tags
> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 225 ++++++++++++++++++
>   1 file changed, 225 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 1aab0c9ae52fa..ee0ce271205e3 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -433,6 +433,202 @@ static const struct nv3052c_reg fs035vg158_panel_regs[] = {
>   	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
>   };
>   
> +
> +static const struct nv3052c_reg wl_355608_a8_panel_regs[] = {
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
> +	{ 0x23, 0xa0 },
> +	{ 0x24, 0x0c },
> +	{ 0x25, 0x06 },
> +	{ 0x26, 0x14 },
> +	{ 0x27, 0x14 },
> +	{ 0x38, 0xcc }, // VCOM_ADJ1
> +	{ 0x39, 0xd7 }, // VCOM_ADJ2
> +	{ 0x3a, 0x44 }, // VCOM_ADJ3
> +	{ 0x28, 0x40 },
> +	{ 0x29, 0x01 },
> +	{ 0x2a, 0xdf },
> +	{ 0x49, 0x3c },
> +	{ 0x91, 0x77 }, // EXTPW_CTRL2
> +	{ 0x92, 0x77 }, // EXTPW_CTRL3
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
> +	{ 0xb4, 0x33 },
> +	{ 0xb5, 0x08 },
> +	{ 0xb6, 0x26 },
> +	{ 0xb7, 0x08 },
> +	{ 0xb8, 0x26 },
> +	{ 0xf0, 0x00 },
> +	{ 0xf6, 0xc0 },
> +	// EXTC Command set enable, select page 2
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
> @@ -670,6 +866,21 @@ static const struct drm_display_mode fs035vg158_modes[] = {
>   	},
>   };
>   
> +static const struct drm_display_mode wl_355608_a8_mode[] = {
> +	{
> +		.clock = 24000,
> +		.hdisplay = 640,
> +		.hsync_start = 640 + 64,
> +		.hsync_end = 640 + 64 + 20,
> +		.htotal = 640 + 64 + 20 + 46,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 21,
> +		.vsync_end = 480 + 21 + 4,
> +		.vtotal = 480 + 21 + 4 + 15,
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +};
> +
>   static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
>   	.display_modes = ltk035c5444t_modes,
>   	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
> @@ -692,9 +903,21 @@ static const struct nv3052c_panel_info fs035vg158_panel_info = {
>   	.panel_regs_len = ARRAY_SIZE(fs035vg158_panel_regs),
>   };
>   
> +static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
> +	.display_modes = wl_355608_a8_mode,
> +	.num_modes = ARRAY_SIZE(wl_355608_a8_mode),
> +	.width_mm = 150,
> +	.height_mm = 94,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.panel_regs = wl_355608_a8_panel_regs,
> +	.panel_regs_len = ARRAY_SIZE(wl_355608_a8_panel_regs),
> +};
> +
>   static const struct spi_device_id nv3052c_ids[] = {
>   	{ "ltk035c5444t", },
>   	{ "fs035vg158", },
> +	{ "wl-355608-a8", },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, nv3052c_ids);
> @@ -702,6 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
>   static const struct of_device_id nv3052c_of_match[] = {
>   	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
>   	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
> +	{ .compatible = "wl-355608-a8", .data = &wl_355608_a8_panel_info },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, nv3052c_of_match);
> @@ -719,4 +943,5 @@ module_spi_driver(nv3052c_driver);
>   
>   MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
>   MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
> +MODULE_AUTHOR("Ryan Walklin <ryan@testtoast.com");
>   MODULE_LICENSE("GPL v2");
> -- 
> 2.45.1
> 
