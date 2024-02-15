Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B77856998
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E24310E9C6;
	Thu, 15 Feb 2024 16:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Awe7U2hz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BD10E9C6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:30:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41FG4xOX016707; Thu, 15 Feb 2024 16:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=1+fPlBMNGxGtSyJRuRNoVCHqvex/12vd4Nel4vBMG/s=; b=Aw
 e7U2hzwaxHEVta2DSISmeBhn6aJSrD6TST+TrLQ7J6nfktMLZOeKaNy96ei6s5MX
 8s+w76UTmt8zVhxUP8leAP9fQZ7JmEV/SKc1wgDjWzDuh1YtsvrNRtkNiYaIVeRE
 gX3eHvgSD1F6d/PwXhfDf9GO+HoVEgfxVB8PNzNXs/Zc5g7u93ZmPymp5uv69bOp
 Cz5ctDd+XgCVEOdokzPhv6a34CJy6sSl1uQFF65Hk4aC7LTzJukhYA37Hzv3nk1y
 DfcBmNZ4YPEm+h3jGZ1qS4HJuP2MVKb+3Z4w23jwsYySEEM+ekUailotegzg5N0s
 sNgnlNC14I9t2DFErnDg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9342jguw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 16:30:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41FGUd0I005146
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 16:30:40 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 15 Feb
 2024 08:30:39 -0800
Message-ID: <aa76bbac-2f92-4c92-b78a-440a48ebfd4f@quicinc.com>
Date: Thu, 15 Feb 2024 08:30:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: ltk500hd1829: add panel type for
 ltk101b4029w
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, <neil.armstrong@linaro.org>
CC: <sam@ravnborg.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240215090515.3513817-1-heiko@sntech.de>
 <20240215090515.3513817-4-heiko@sntech.de>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240215090515.3513817-4-heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1Rp6xcP08FMw69iGhsqisVqKcRu-EGhZ
X-Proofpoint-GUID: 1Rp6xcP08FMw69iGhsqisVqKcRu-EGhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_15,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150132
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



On 2/15/2024 1:05 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The ltk101b4029w ist a 10.1 inch DSI panel and shares the same supplies
> and startup timings with the existing ltk500hd1829.
> 
> So simply add it as a variant with its own init sequence and display-mode.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Hi Heiko,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   .../drm/panel/panel-leadtek-ltk500hd1829.c    | 196 ++++++++++++++++++
>   1 file changed, 196 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> index 42f4e2584af18..7bc538b7c6b7c 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> @@ -43,6 +43,198 @@ struct ltk500hd1829 {
>   	bool prepared;
>   };
>   
> +static const struct ltk500hd1829_cmd ltk101b4029w_init[] = {
> +	/* Page0 */
> +	{ 0xE0, 0x00 },
> +	/* PASSWORD */
> +	{ 0xE1, 0x93 },
> +	{ 0xE2, 0x65 },
> +	{ 0xE3, 0xF8 },
> +	{ 0x80, 0x03 }, /* 0X03:4-LANE; 0X02:3-LANE; 0X01:2-LANE */
> +	/* Page1 */
> +	{ 0xE0, 0x01 },
> +	/* Set VCOM */
> +	{ 0x00, 0x00 },
> +	{ 0x01, 0x6F },
> +	/* Set Gamma Power, VGMP,VGMN,VGSP,VGSN */
> +	{ 0x17, 0x00 },
> +	{ 0x18, 0xAF }, /* 4.3V */
> +	{ 0x19, 0x01 }, /* 0.3V */
> +	{ 0x1A, 0x00 },
> +	{ 0x1B, 0xAF }, /* 4.3V */
> +	{ 0x1C, 0x01 }, /* 0.3V */
> +	/* Set Gate Power */
> +	{ 0x1F, 0x3E }, /* VGH_R  = 15V */
> +	{ 0x20, 0x28 }, /* VGL_R  = -12V */
> +	{ 0x21, 0x28 }, /* VGL_R2 = -12V */
> +	{ 0x22, 0x7E },
> +	/* SETPANEL */
> +	{ 0x35, 0x26 },
> +	{ 0x37, 0x09 },
> +	/* SET RGBCYC */
> +	{ 0x38, 0x04 },
> +	{ 0x39, 0x00 },
> +	{ 0x3A, 0x01 },
> +	{ 0x3C, 0x7C },
> +	{ 0x3D, 0xFF },
> +	{ 0x3E, 0xFF },
> +	{ 0x3F, 0x7F },
> +	/* Set TCON */
> +	{ 0x40, 0x06 }, /* RSO = 800 RGB */
> +	{ 0x41, 0xA0 }, /* LN = 640->1280 line */
> +	{ 0x42, 0x81 },
> +	{ 0x43, 0x08 }, /* VFP = 8 */
> +	{ 0x44, 0x0B }, /* VBP = 12 */
> +	{ 0x45, 0x28 }, /* HBP = 40 */
> +	/* power voltage */
> +	{ 0x55, 0x0F }, /* DCDCM = 0001, JD PWR_IC */
> +	{ 0x57, 0x69 },
> +	{ 0x59, 0x0A }, /* VCL = -2.9V */
> +	{ 0x5A, 0x28 }, /* VGH = 15V */
> +	{ 0x5B, 0x14 }, /* VGL = -11V */
> +	/* Gamma */
> +	{ 0x5D, 0x7C },
> +	{ 0x5E, 0x65 },
> +	{ 0x5F, 0x55 },
> +	{ 0x60, 0x47 },
> +	{ 0x61, 0x43 },
> +	{ 0x62, 0x32 },
> +	{ 0x63, 0x34 },
> +	{ 0x64, 0x1C },
> +	{ 0x65, 0x33 },
> +	{ 0x66, 0x31 },
> +	{ 0x67, 0x30 },
> +	{ 0x68, 0x4E },
> +	{ 0x69, 0x3C },
> +	{ 0x6A, 0x44 },
> +	{ 0x6B, 0x35 },
> +	{ 0x6C, 0x31 },
> +	{ 0x6D, 0x23 },
> +	{ 0x6E, 0x11 },
> +	{ 0x6F, 0x00 },
> +	{ 0x70, 0x7C },
> +	{ 0x71, 0x65 },
> +	{ 0x72, 0x55 },
> +	{ 0x73, 0x47 },
> +	{ 0x74, 0x43 },
> +	{ 0x75, 0x32 },
> +	{ 0x76, 0x34 },
> +	{ 0x77, 0x1C },
> +	{ 0x78, 0x33 },
> +	{ 0x79, 0x31 },
> +	{ 0x7A, 0x30 },
> +	{ 0x7B, 0x4E },
> +	{ 0x7C, 0x3C },
> +	{ 0x7D, 0x44 },
> +	{ 0x7E, 0x35 },
> +	{ 0x7F, 0x31 },
> +	{ 0x80, 0x23 },
> +	{ 0x81, 0x11 },
> +	{ 0x82, 0x00 },
> +	 /* Page2, for GIP */
> +	{ 0xE0, 0x02 },
> +	/* GIP_L Pin mapping */
> +	{ 0x00, 0x1E },
> +	{ 0x01, 0x1E },
> +	{ 0x02, 0x41 },
> +	{ 0x03, 0x41 },
> +	{ 0x04, 0x43 },
> +	{ 0x05, 0x43 },
> +	{ 0x06, 0x1F },
> +	{ 0x07, 0x1F },
> +	{ 0x08, 0x35 },
> +	{ 0x09, 0x1F },
> +	{ 0x0A, 0x15 },
> +	{ 0x0B, 0x15 },
> +	{ 0x0C, 0x1F },
> +	{ 0x0D, 0x47 },
> +	{ 0x0E, 0x47 },
> +	{ 0x0F, 0x45 },
> +	{ 0x10, 0x45 },
> +	{ 0x11, 0x4B },
> +	{ 0x12, 0x4B },
> +	{ 0x13, 0x49 },
> +	{ 0x14, 0x49 },
> +	{ 0x15, 0x1F },
> +	/* GIP_R Pin mapping */
> +	{ 0x16, 0x1E },
> +	{ 0x17, 0x1E },
> +	{ 0x18, 0x40 },
> +	{ 0x19, 0x40 },
> +	{ 0x1A, 0x42 },
> +	{ 0x1B, 0x42 },
> +	{ 0x1C, 0x1F },
> +	{ 0x1D, 0x1F },
> +	{ 0x1E, 0x35 },
> +	{ 0x1F, 0x1F },
> +	{ 0x20, 0x15 },
> +	{ 0x21, 0x15 },
> +	{ 0x22, 0x1f },
> +	{ 0x23, 0x46 },
> +	{ 0x24, 0x46 },
> +	{ 0x25, 0x44 },
> +	{ 0x26, 0x44 },
> +	{ 0x27, 0x4A },
> +	{ 0x28, 0x4A },
> +	{ 0x29, 0x48 },
> +	{ 0x2A, 0x48 },
> +	{ 0x2B, 0x1F },
> +	/* GIP Timing */
> +	{ 0x58, 0x40 },
> +	{ 0x5B, 0x30 },
> +	{ 0x5C, 0x03 },
> +	{ 0x5D, 0x30 },
> +	{ 0x5E, 0x01 },
> +	{ 0x5F, 0x02 },
> +	{ 0x63, 0x14 },
> +	{ 0x64, 0x6A },
> +	{ 0x67, 0x73 },
> +	{ 0x68, 0x05 },
> +	{ 0x69, 0x14 },
> +	{ 0x6A, 0x6A },
> +	{ 0x6B, 0x08 },
> +	{ 0x6C, 0x00 },
> +	{ 0x6D, 0x00 },
> +	{ 0x6E, 0x00 },
> +	{ 0x6F, 0x88 },
> +	{ 0x77, 0xDD },
> +	{ 0x79, 0x0E },
> +	{ 0x7A, 0x03 },
> +	{ 0x7D, 0x14 },
> +	{ 0x7E, 0x6A },
> +	/* Page4 */
> +	{ 0xE0, 0x04 },
> +	{ 0x09, 0x11 },
> +	{ 0x0E, 0x48 },
> +	{ 0x2B, 0x2B },
> +	{ 0x2D, 0x03 },
> +	{ 0x2E, 0x44 },
> +	/* Page0 */
> +	{ 0xE0, 0x00 },
> +	{ 0xE6, 0x02 },
> +	{ 0xE7, 0x0C },
> +};
> +
> +static const struct drm_display_mode ltk101b4029w_mode = {
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 18,
> +	.hsync_end	= 800 + 18 + 18,
> +	.htotal		= 800 + 18 + 18 + 18,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 24,
> +	.vsync_end	= 1280 + 24 + 4,
> +	.vtotal		= 1280 + 24 + 4 + 8,
> +	.clock		= 67330,
> +	.width_mm	= 136,
> +	.height_mm	= 218,
> +};
> +
> +static const struct ltk500hd1829_desc ltk101b4029w_data = {
> +	.mode = &ltk101b4029w_mode,
> +	.init = ltk101b4029w_init,
> +	.num_init = ARRAY_SIZE(ltk101b4029w_init),
> +};
> +
>   /*
>    * There is no description in the Reference Manual about these commands.
>    * We received them from the vendor, so just use them as is.
> @@ -510,6 +702,10 @@ static void ltk500hd1829_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id ltk500hd1829_of_match[] = {
> +	{
> +		.compatible = "leadtek,ltk101b4029w",
> +		.data = &ltk101b4029w_data,
> +	},
>   	{
>   		.compatible = "leadtek,ltk500hd1829",
>   		.data = &ltk500hd1829_data,
> -- 
> 2.39.2
> 
