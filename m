Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1728096FDD7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 00:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31F410EB13;
	Fri,  6 Sep 2024 22:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="K5DZTXxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358E010EB13
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 22:12:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486LdiMK008673;
 Fri, 6 Sep 2024 22:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KOR8o0n9e4gxD4Rvt6rzu6yTyt3+YeI4Io/PTBQX3ZY=; b=K5DZTXxgi1WyQYyX
 Mah/yNYzwnX20SQpSRNE/LXffs9WHZAQWnoWs/ANcl1WjnYsWLHzG7rVvOwh6LIF
 QpHvO5q3S/8bGvcAoPAqlVZ5Y8Q7meGlb6tm5svyKS3c6FNnbSr/gReI7QI9//9C
 qAk+A+K3gvSN8LVuInxgG5ciuFQSlQshFPRGsjBuQTFjUWV4SoZWpFCGIOGWtDBO
 y0pzkr4bjCvGMqU6NmY5coLWSPgPI3VJUKm4fxaD5ia+XHquPAmdZd/9Tk+PBBvl
 7znA/8xoqFqVi+2nBmiAKGYIwZiOx/6iAnYaJi9d2l3FOZb2/afDKNSZ43tgBmLT
 yiaKgA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx23kkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 22:12:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486MCNFK002667
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 22:12:23 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 15:12:22 -0700
Message-ID: <6b195a9e-cbc0-4dd0-86ba-da6536d0688d@quicinc.com>
Date: Fri, 6 Sep 2024 15:12:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: nt35510: Make new commands optional
To: Linus Walleij <linus.walleij@linaro.org>, Stefan Hansson
 <newbyte@postmarketos.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
CC: <dri-devel@lists.freedesktop.org>
References: <20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZF-pwgxATkEwpLDIH0V0NEvI3M3p5EG8
X-Proofpoint-GUID: ZF-pwgxATkEwpLDIH0V0NEvI3M3p5EG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060165
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



On 9/6/2024 2:54 PM, Linus Walleij wrote:
> The commit introducing the Frida display started to write the
> SETVCL, BT3CTR and SETVCMOFF registers unconditionally, and some
> (not all!) Hydis display seem to be affected by ghosting after
> the commit.
> 
> Make them all optional and only send these commands on the
> Frida display for now.
> 
> Reported-by: Stefan Hansson <newbyte@postmarketos.org>
> Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> Stefan: if this patch works and you have time you can try adding
> the three flags one at a time to your device and we can see which
> command is problematic.
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c | 45 +++++++++++++++++----------
>   1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index d3bfdfc9cff6..e07409dcbd1d 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -38,6 +38,9 @@
>   
>   #define NT35510_CMD_CORRECT_GAMMA BIT(0)
>   #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
> +#define NT35510_CMD_SETVCL BIT(2)
> +#define NT35510_CMD_BT3CTR BIT(3)
> +#define NT35510_CMD_SETVCMOFF BIT(4)
>   
>   #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
>   #define MCS_CMD_READ_ID1	0xDA
> @@ -675,16 +678,23 @@ static int nt35510_setup_power(struct nt35510 *nt)
>   				nt->conf->bt2ctr);
>   	if (ret)
>   		return ret;
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
> -				NT35510_P1_VCL_LEN,
> -				nt->conf->vcl);
> -	if (ret)
> -		return ret;
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
> -				NT35510_P1_BT3CTR_LEN,
> -				nt->conf->bt3ctr);
> -	if (ret)
> -		return ret;
> +
> +	if (nt->conf->cmds & NT35510_CMD_SETVCL) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
> +					NT35510_P1_VCL_LEN,
> +					nt->conf->vcl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (nt->conf->cmds & NT35510_CMD_BT3CTR) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
> +					NT35510_P1_BT3CTR_LEN,
> +					nt->conf->bt3ctr);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
>   				NT35510_P1_VGH_LEN,
>   				nt->conf->vgh);
> @@ -721,11 +731,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
>   	if (ret)
>   		return ret;
>   
> -	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> -				NT35510_P1_VCMOFF_LEN,
> -				nt->conf->vcmoff);
> -	if (ret)
> -		return ret;
> +	if (nt->conf->cmds & NT35510_CMD_SETVCMOFF) {
> +		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
> +					NT35510_P1_VCMOFF_LEN,
> +					nt->conf->vcmoff);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	/* Typically 10 ms */
>   	usleep_range(10000, 20000);
> @@ -1319,7 +1331,8 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
>   	},
>   	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   			MIPI_DSI_MODE_LPM,
> -	.cmds = NT35510_CMD_CONTROL_DISPLAY,
> +	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCL |
> +			NT35510_CMD_BT3CTR | NT35510_CMD_SETVCMOFF,
>   	/* 0x03: AVDD = 6.2V */
>   	.avdd = { 0x03, 0x03, 0x03 },
>   	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */
> 
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240906-fix-nt35510-a8ec6e47e036
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 
