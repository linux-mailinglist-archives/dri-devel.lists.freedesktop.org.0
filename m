Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E9AB05A4
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 23:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6C310E21E;
	Thu,  8 May 2025 21:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gHJsfWaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4605C10E21B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 21:58:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DANSQ009407;
 Thu, 8 May 2025 21:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H/c5wCC4PrD7yepboyL8e/nVX96kBpmeUZLIKejenvw=; b=gHJsfWazSTBVC9So
 XXTN/CX9hKe3AJTFywel/GQf2r/nnmGoNTfOb1zDmvUzO4VmaLA38qUJOYhXEtrf
 xeTaIRzToWkDVwsteOKH51vnUpokd6J1CwWu7UrU7HWvYOxptr7SUpPJ2qAmwyNu
 uZidNX/DVdQdD8Z4uqOZW6FVTgGsK+XBIYFJ74L9P6XrD+eIglll0ZCXs0JyGavP
 zIHsK+uYHnl5QSVusCeeRf/nRjMMjnobK4En4dHskJKFAxbdSnM2HdMn7/50NzCp
 TO9liEJw71aXfn2zvphZIZFpXcuXTj5ev2oM+ivOP1rw4k0PyNuGUjee6S3362Nz
 q+8dHA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpetkm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 21:57:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548LvgYE018928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 21:57:42 GMT
Received: from [10.71.109.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 14:57:41 -0700
Message-ID: <0e87c261-08f9-4a4a-9916-0487a6dbc737@quicinc.com>
Date: Thu, 8 May 2025 14:57:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: visionox-rm69299: support the variant
 found in the SHIFT6mq
To: <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Casey Connolly <casey.connolly@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>
References: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
 <20250507-topic-misc-shift6-panel-v1-2-64e8e98ff285@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250507-topic-misc-shift6-panel-v1-2-64e8e98ff285@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE5OSBTYWx0ZWRfX1qo6NbDvhgTe
 plEFjl75U5frDWFk6ByLNwBExKfM2WpsSRdjnBQQAHxDfYDk5prvrL3LPyRxmUcKkIYn9o4eJyz
 XL4Umd3GxU+0cZA/6PCi3oRMi8Nc0O4HEN7ygINM/8h9CetH7XIede+ttUPM5gBwJoJJvJhngnE
 7uJpdGW/5qr+dmTevotfiFMzWTmEfs35aLO7RNswBS6ocMHk1LWfJuA3k8XU/EymDYuGgULJsgn
 eZJVmHlXXbOf4RmXEQuCH13MsD2Hj0RJ2qluVJSzbbp6j+wwvVFv2DegDWngKAxUvsQuHCP19yj
 nQTM6sGCG+R89UTntYAgoqunzWPHnyIfOd1eCG0Xc3Ay5mxIdZOYTGqqgFhMiJyer6MngAUZHRQ
 QZOIX7Rag1c/91U83U+cQWhpaWQkL10kZkDtLtBKnszAz+sGbenCAgwTGe/BIAPuamYOhu+L
X-Proofpoint-ORIG-GUID: MJI1OBZinirfW_UzLPA5iWJ6iG03nh2Z
X-Proofpoint-GUID: MJI1OBZinirfW_UzLPA5iWJ6iG03nh2Z
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681d28d7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kuvCIlgCnUscDMFZ:21 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=NsWeV797_Utf8EiLlUcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_07,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080199
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



On 5/7/2025 2:43 AM, neil.armstrong@linaro.org wrote:
> From: Caleb Connolly <caleb@connolly.tech>
> 
> Add support for another variant of the rm69299 panel. This panel is
> 1080x2160 and is found in the shift-axolotl (SHIFT6mq).
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> [narmstrong: removed cosmetic changes, fixed to apply, use enums to select mode]
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 221 ++++++++++++++++++++++---
>   1 file changed, 195 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index be3a9797fbced5222b313cf83f8078b919e2c219..26a79ab517723f23b7dc333235b81de264b5f30a 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/module.h>
> +#include <linux/property.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/regulator/consumer.h>
> @@ -15,11 +16,17 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> +enum visionox_rm69299_modes {
> +	VISIONOX_RM69299_MODE_1080X2248_60HZ = 0,
> +	VISIONOX_RM69299_MODE_1080X2160_60HZ
> +};
> +
>   struct visionox_rm69299 {
>   	struct drm_panel panel;
>   	struct regulator_bulk_data supplies[2];
>   	struct gpio_desc *reset_gpio;
>   	struct mipi_dsi_device *dsi;
> +	enum visionox_rm69299_modes mode;
>   };
>   
>   static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> @@ -81,10 +88,123 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   	return ret;
>   }
>   
> +#define VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN 432
> +
> +static const u8 visionox_rm69299_1080x2248_60hz_init_seq[VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN][2] = {

Hi Neil,

I see this being used for the 1080x2160 mode, but the name here seems to 
imply that this is the init sequence for 1080x2248. Was that intended?

> +	{ 0xFE, 0x40 }, { 0x05, 0x04 }, { 0x06, 0x08 }, { 0x08, 0x04 },
> +	{ 0x09, 0x08 }, { 0x0A, 0x07 }, { 0x0B, 0xCC }, { 0x0C, 0x07 },
> +	{ 0x0D, 0x90 }, { 0x0F, 0x87 }, { 0x20, 0x8D }, { 0x21, 0x8D },
> +	{ 0x24, 0x05 }, { 0x26, 0x05 }, { 0x28, 0x05 }, { 0x2A, 0x05 },
> +	{ 0x2D, 0x28 }, { 0x2F, 0x28 }, { 0x30, 0x32 }, { 0x31, 0x32 },
> +	{ 0x37, 0x80 }, { 0x38, 0x30 }, { 0x39, 0xA8 }, { 0x46, 0x48 },
> +	{ 0x47, 0x48 }, { 0x6B, 0x10 }, { 0x6F, 0x02 }, { 0x74, 0x2B },
> +	{ 0x80, 0x1A }, { 0xFE, 0x40 }, { 0x93, 0x10 }, { 0x16, 0x00 },
> +	{ 0x85, 0x07 }, { 0x84, 0x01 }, { 0x86, 0x0F }, { 0x87, 0x05 },
> +	{ 0x8C, 0x00 }, { 0x88, 0x2E }, { 0x89, 0x2E }, { 0x8B, 0x09 },
> +	{ 0x95, 0x00 }, { 0x91, 0x00 }, { 0x90, 0x00 }, { 0x8D, 0xD0 },
> +	{ 0x8A, 0x03 }, { 0xFE, 0xA0 }, { 0x13, 0x00 }, { 0x33, 0x00 },
> +	{ 0x0B, 0x33 }, { 0x36, 0x1E }, { 0x31, 0x88 }, { 0x32, 0x88 },
> +	{ 0x37, 0xF1 }, { 0xFE, 0x50 }, { 0x00, 0x00 }, { 0x01, 0x00 },
> +	{ 0x02, 0x00 }, { 0x03, 0xE9 }, { 0x04, 0x00 }, { 0x05, 0xF6 },
> +	{ 0x06, 0x01 }, { 0x07, 0x2C }, { 0x08, 0x01 }, { 0x09, 0x62 },
> +	{ 0x0A, 0x01 }, { 0x0B, 0x98 }, { 0x0C, 0x01 }, { 0x0D, 0xBF },
> +	{ 0x0E, 0x01 }, { 0x0F, 0xF6 }, { 0x10, 0x02 }, { 0x11, 0x24 },
> +	{ 0x12, 0x02 }, { 0x13, 0x4E }, { 0x14, 0x02 }, { 0x15, 0x70 },
> +	{ 0x16, 0x02 }, { 0x17, 0xAF }, { 0x18, 0x02 }, { 0x19, 0xE2 },
> +	{ 0x1A, 0x03 }, { 0x1B, 0x1F }, { 0x1C, 0x03 }, { 0x1D, 0x52 },
> +	{ 0x1E, 0x03 }, { 0x1F, 0x82 }, { 0x20, 0x03 }, { 0x21, 0xB6 },
> +	{ 0x22, 0x03 }, { 0x23, 0xF0 }, { 0x24, 0x04 }, { 0x25, 0x1F },
> +	{ 0x26, 0x04 }, { 0x27, 0x37 }, { 0x28, 0x04 }, { 0x29, 0x59 },
> +	{ 0x2A, 0x04 }, { 0x2B, 0x68 }, { 0x30, 0x04 }, { 0x31, 0x85 },
> +	{ 0x32, 0x04 }, { 0x33, 0xA2 }, { 0x34, 0x04 }, { 0x35, 0xBC },
> +	{ 0x36, 0x04 }, { 0x37, 0xD8 }, { 0x38, 0x04 }, { 0x39, 0xF4 },
> +	{ 0x3A, 0x05 }, { 0x3B, 0x0E }, { 0x40, 0x05 }, { 0x41, 0x13 },
> +	{ 0x42, 0x05 }, { 0x43, 0x1F }, { 0x44, 0x05 }, { 0x45, 0x1F },
> +	{ 0x46, 0x00 }, { 0x47, 0x00 }, { 0x48, 0x01 }, { 0x49, 0x43 },
> +	{ 0x4A, 0x01 }, { 0x4B, 0x4C }, { 0x4C, 0x01 }, { 0x4D, 0x6F },
> +	{ 0x4E, 0x01 }, { 0x4F, 0x92 }, { 0x50, 0x01 }, { 0x51, 0xB5 },
> +	{ 0x52, 0x01 }, { 0x53, 0xD4 }, { 0x58, 0x02 }, { 0x59, 0x06 },
> +	{ 0x5A, 0x02 }, { 0x5B, 0x33 }, { 0x5C, 0x02 }, { 0x5D, 0x59 },
> +	{ 0x5E, 0x02 }, { 0x5F, 0x7D }, { 0x60, 0x02 }, { 0x61, 0xBD },
> +	{ 0x62, 0x02 }, { 0x63, 0xF7 }, { 0x64, 0x03 }, { 0x65, 0x31 },
> +	{ 0x66, 0x03 }, { 0x67, 0x63 }, { 0x68, 0x03 }, { 0x69, 0x9D },
> +	{ 0x6A, 0x03 }, { 0x6B, 0xD2 }, { 0x6C, 0x04 }, { 0x6D, 0x05 },
> +	{ 0x6E, 0x04 }, { 0x6F, 0x38 }, { 0x70, 0x04 }, { 0x71, 0x51 },
> +	{ 0x72, 0x04 }, { 0x73, 0x70 }, { 0x74, 0x04 }, { 0x75, 0x85 },
> +	{ 0x76, 0x04 }, { 0x77, 0xA1 }, { 0x78, 0x04 }, { 0x79, 0xC0 },
> +	{ 0x7A, 0x04 }, { 0x7B, 0xD8 }, { 0x7C, 0x04 }, { 0x7D, 0xF2 },
> +	{ 0x7E, 0x05 }, { 0x7F, 0x10 }, { 0x80, 0x05 }, { 0x81, 0x21 },
> +	{ 0x82, 0x05 }, { 0x83, 0x2E }, { 0x84, 0x05 }, { 0x85, 0x3A },
> +	{ 0x86, 0x05 }, { 0x87, 0x3E }, { 0x88, 0x00 }, { 0x89, 0x00 },
> +	{ 0x8A, 0x01 }, { 0x8B, 0x86 }, { 0x8C, 0x01 }, { 0x8D, 0x8F },
> +	{ 0x8E, 0x01 }, { 0x8F, 0xB3 }, { 0x90, 0x01 }, { 0x91, 0xD7 },
> +	{ 0x92, 0x01 }, { 0x93, 0xFB }, { 0x94, 0x02 }, { 0x95, 0x18 },
> +	{ 0x96, 0x02 }, { 0x97, 0x4F }, { 0x98, 0x02 }, { 0x99, 0x7E },
> +	{ 0x9A, 0x02 }, { 0x9B, 0xA6 }, { 0x9C, 0x02 }, { 0x9D, 0xCF },
> +	{ 0x9E, 0x03 }, { 0x9F, 0x14 }, { 0xA4, 0x03 }, { 0xA5, 0x52 },
> +	{ 0xA6, 0x03 }, { 0xA7, 0x93 }, { 0xAC, 0x03 }, { 0xAD, 0xCF },
> +	{ 0xAE, 0x04 }, { 0xAF, 0x08 }, { 0xB0, 0x04 }, { 0xB1, 0x42 },
> +	{ 0xB2, 0x04 }, { 0xB3, 0x7F }, { 0xB4, 0x04 }, { 0xB5, 0xB4 },
> +	{ 0xB6, 0x04 }, { 0xB7, 0xCC }, { 0xB8, 0x04 }, { 0xB9, 0xF2 },
> +	{ 0xBA, 0x05 }, { 0xBB, 0x0C }, { 0xBC, 0x05 }, { 0xBD, 0x26 },
> +	{ 0xBE, 0x05 }, { 0xBF, 0x4B }, { 0xC0, 0x05 }, { 0xC1, 0x64 },
> +	{ 0xC2, 0x05 }, { 0xC3, 0x83 }, { 0xC4, 0x05 }, { 0xC5, 0xA1 },
> +	{ 0xC6, 0x05 }, { 0xC7, 0xBA }, { 0xC8, 0x05 }, { 0xC9, 0xC4 },
> +	{ 0xCA, 0x05 }, { 0xCB, 0xD5 }, { 0xCC, 0x05 }, { 0xCD, 0xD5 },
> +	{ 0xCE, 0x00 }, { 0xCF, 0xCE }, { 0xD0, 0x00 }, { 0xD1, 0xDB },
> +	{ 0xD2, 0x01 }, { 0xD3, 0x32 }, { 0xD4, 0x01 }, { 0xD5, 0x3B },
> +	{ 0xD6, 0x01 }, { 0xD7, 0x74 }, { 0xD8, 0x01 }, { 0xD9, 0x7D },
> +	{ 0xFE, 0x60 }, { 0x00, 0xCC }, { 0x01, 0x0F }, { 0x02, 0xFF },
> +	{ 0x03, 0x01 }, { 0x04, 0x00 }, { 0x05, 0x02 }, { 0x06, 0x00 },
> +	{ 0x07, 0x00 }, { 0x09, 0xC4 }, { 0x0A, 0x00 }, { 0x0B, 0x04 },
> +	{ 0x0C, 0x01 }, { 0x0D, 0x00 }, { 0x0E, 0x04 }, { 0x0F, 0x00 },
> +	{ 0x10, 0x71 }, { 0x12, 0xC4 }, { 0x13, 0x00 }, { 0x14, 0x04 },
> +	{ 0x15, 0x01 }, { 0x16, 0x00 }, { 0x17, 0x06 }, { 0x18, 0x00 },
> +	{ 0x19, 0x71 }, { 0x1B, 0xC4 }, { 0x1C, 0x00 }, { 0x1D, 0x02 },
> +	{ 0x1E, 0x00 }, { 0x1F, 0x00 }, { 0x20, 0x08 }, { 0x21, 0x66 },
> +	{ 0x22, 0xB4 }, { 0x24, 0xC4 }, { 0x25, 0x00 }, { 0x26, 0x02 },
> +	{ 0x27, 0x00 }, { 0x28, 0x00 }, { 0x29, 0x07 }, { 0x2A, 0x66 },
> +	{ 0x2B, 0xB4 }, { 0x2F, 0xC4 }, { 0x30, 0x00 }, { 0x31, 0x04 },
> +	{ 0x32, 0x01 }, { 0x33, 0x00 }, { 0x34, 0x03 }, { 0x35, 0x00 },
> +	{ 0x36, 0x71 }, { 0x38, 0xC4 }, { 0x39, 0x00 }, { 0x3A, 0x04 },
> +	{ 0x3B, 0x01 }, { 0x3D, 0x00 }, { 0x3F, 0x05 }, { 0x40, 0x00 },
> +	{ 0x41, 0x71 }, { 0x83, 0xCE }, { 0x84, 0x02 }, { 0x85, 0x20 },
> +	{ 0x86, 0xDC }, { 0x87, 0x00 }, { 0x88, 0x04 }, { 0x89, 0x00 },
> +	{ 0x8A, 0xBB }, { 0x8B, 0x80 }, { 0xC7, 0x0E }, { 0xC8, 0x05 },
> +	{ 0xC9, 0x1F }, { 0xCA, 0x06 }, { 0xCB, 0x00 }, { 0xCC, 0x03 },
> +	{ 0xCD, 0x04 }, { 0xCE, 0x1F }, { 0xCF, 0x1F }, { 0xD0, 0x1F },
> +	{ 0xD1, 0x1F }, { 0xD2, 0x1F }, { 0xD3, 0x1F }, { 0xD4, 0x1F },
> +	{ 0xD5, 0x1F }, { 0xD6, 0x1F }, { 0xD7, 0x17 }, { 0xD8, 0x1F },
> +	{ 0xD9, 0x16 }, { 0xDA, 0x1F }, { 0xDB, 0x0E }, { 0xDC, 0x01 },
> +	{ 0xDD, 0x1F }, { 0xDE, 0x02 }, { 0xDF, 0x00 }, { 0xE0, 0x03 },
> +	{ 0xE1, 0x04 }, { 0xE2, 0x1F }, { 0xE3, 0x1F }, { 0xE4, 0x1F },
> +	{ 0xE5, 0x1F }, { 0xE6, 0x1F }, { 0xE7, 0x1F }, { 0xE8, 0x1F },
> +	{ 0xE9, 0x1F }, { 0xEA, 0x1F }, { 0xEB, 0x17 }, { 0xEC, 0x1F },
> +	{ 0xED, 0x16 }, { 0xEE, 0x1F }, { 0xEF, 0x03 }, { 0xFE, 0x70 },
> +	{ 0x5A, 0x0B }, { 0x5B, 0x0B }, { 0x5C, 0x55 }, { 0x5D, 0x24 },
> +	{ 0xFE, 0x90 }, { 0x12, 0x24 }, { 0x13, 0x49 }, { 0x14, 0x92 },
> +	{ 0x15, 0x86 }, { 0x16, 0x61 }, { 0x17, 0x18 }, { 0x18, 0x24 },
> +	{ 0x19, 0x49 }, { 0x1A, 0x92 }, { 0x1B, 0x86 }, { 0x1C, 0x61 },
> +	{ 0x1D, 0x18 }, { 0x1E, 0x24 }, { 0x1F, 0x49 }, { 0x20, 0x92 },
> +	{ 0x21, 0x86 }, { 0x22, 0x61 }, { 0x23, 0x18 }, { 0xFE, 0x40 },
> +	{ 0x0E, 0x10 }, { 0xFE, 0xA0 }, { 0x04, 0x80 }, { 0x16, 0x00 },
> +	{ 0x26, 0x10 }, { 0x2F, 0x37 }, { 0xFE, 0xD0 }, { 0x06, 0x0F },
> +	{ 0x4B, 0x00 }, { 0x56, 0x4A }, { 0xFE, 0x00 }, { 0xC2, 0x09 },
> +	{ 0x35, 0x00 }, { 0xFE, 0x70 }, { 0x7D, 0x61 }, { 0x7F, 0x00 },
> +	{ 0x7E, 0x4E }, { 0x52, 0x2C }, { 0x49, 0x00 }, { 0x4A, 0x00 },
> +	{ 0x4B, 0x00 }, { 0x4C, 0x00 }, { 0x4D, 0xE8 }, { 0x4E, 0x25 },
> +	{ 0x4F, 0x6E }, { 0x50, 0xAE }, { 0x51, 0x2F }, { 0xAD, 0xF4 },
> +	{ 0xAE, 0x8F }, { 0xAF, 0x00 }, { 0xB0, 0x54 }, { 0xB1, 0x3A },
> +	{ 0xB2, 0x00 }, { 0xB3, 0x00 }, { 0xB4, 0x00 }, { 0xB5, 0x00 },
> +	{ 0xB6, 0x18 }, { 0xB7, 0x30 }, { 0xB8, 0x4A }, { 0xB9, 0x98 },
> +	{ 0xBA, 0x30 }, { 0xBB, 0x60 }, { 0xBC, 0x50 }, { 0xBD, 0x00 },
> +	{ 0xBE, 0x00 }, { 0xBF, 0x39 }, { 0xFE, 0x00 }, { 0x51, 0x66 },
> +};
> +
>   static int visionox_rm69299_prepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -	int ret;
> +	int ret, i;
>   
>   	ret = visionox_rm69299_power_on(ctx);
>   	if (ret < 0)
> @@ -92,28 +212,48 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
>   
>   	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret = %d\n", ret);
> -		goto power_off;
> -	}
> -
> -	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
> -	if (ret < 0) {
> -		dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret = %d\n", ret);
> -		goto power_off;
> +	if (ctx->mode == VISIONOX_RM69299_MODE_1080X2160_60HZ) {
> +		for (i = 0; i < VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN; i++) {
> +			ret = mipi_dsi_dcs_write_buffer(ctx->dsi,

Any reason for not using mipi_dsi_dcs_write_buffer_multi() here?

Thanks,

Jessica Zhang

> +				visionox_rm69299_1080x2248_60hz_init_seq[i], 2);
> +			if (ret < 0) {
> +				dev_err(ctx->panel.dev,
> +					"cmd set tx 0 failed, ret = %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 },
> +						2);
> +		if (ret < 0) {
> +			dev_err(ctx->panel.dev,
> +				"cmd set tx 0 failed, ret = %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 },
> +						2);
> +		if (ret < 0) {
> +			dev_err(ctx->panel.dev,
> +				"cmd set tx 1 failed, ret = %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 },
> +						2);
> +		if (ret < 0) {
> +			dev_err(ctx->panel.dev,
> +				"cmd set tx 2 failed, ret = %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff },
> +						2);
> +		if (ret < 0) {
> +			dev_err(ctx->panel.dev,
> +				"cmd set tx 3 failed, ret = %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> @@ -154,14 +294,38 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>   	.flags = 0,
>   };
>   
> +static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> +	.clock = 158695,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 26,
> +	.hsync_end = 1080 + 26 + 2,
> +	.htotal = 1080 + 26 + 2 + 36,
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 8,
> +	.vsync_end = 2160 + 8 + 4,
> +	.vtotal = 2160 + 8 + 4 + 4,
> +	.flags = 0,
> +};
> +
>   static int visionox_rm69299_get_modes(struct drm_panel *panel,
>   				      struct drm_connector *connector)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	const struct drm_display_mode *panel_mode;
>   	struct drm_display_mode *mode;
>   
> -	mode = drm_mode_duplicate(connector->dev,
> -				  &visionox_rm69299_1080x2248_60hz);
> +	switch (ctx->mode) {
> +	case VISIONOX_RM69299_MODE_1080X2248_60HZ:
> +		panel_mode = &visionox_rm69299_1080x2248_60hz;
> +		break;
> +	case VISIONOX_RM69299_MODE_1080X2160_60HZ:
> +		panel_mode = &visionox_rm69299_1080x2160_60hz;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mode = drm_mode_duplicate(connector->dev, panel_mode);
>   	if (!mode) {
>   		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
>   		return 0;
> @@ -191,6 +355,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   	if (!ctx)
>   		return -ENOMEM;
>   
> +	ctx->mode = (enum visionox_rm69299_modes)device_get_match_data(dev);
> +
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
>   	ctx->dsi = dsi;
> @@ -240,7 +406,10 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id visionox_rm69299_of_match[] = {
> -	{ .compatible = "visionox,rm69299-1080p-display", },
> +	{ .compatible = "visionox,rm69299-1080p-display",
> +	  .data = (void *)VISIONOX_RM69299_MODE_1080X2248_60HZ },
> +	{ .compatible = "visionox,rm69299-shift",
> +	  .data = (void *)VISIONOX_RM69299_MODE_1080X2160_60HZ },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> 

