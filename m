Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1557787F1EE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 22:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40611227C;
	Mon, 18 Mar 2024 21:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bvhR7yZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5811227C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 21:21:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42IJt2GS009316; Mon, 18 Mar 2024 21:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=oFYfnk2O3YStsV4mePQQV328nUghUPgKz5O4fwliaZI=; b=bv
 hR7yZki+rdmcH1i0csdYxqW6YCkO1QYneIn+DYy8N9tZ6cmd0eYjO1Bdh+LhDwFb
 vo0aUzAysOEVKXeYL/P5HsauVoe+49K67kdPUszMhCIXTAigMA5qc+UOE7pm14dI
 1J59V+jYfYkCaq86yF/U25RnFFFaLcYV2KCAup7COqb0yB8kEA3jhZGz7z2yU9qt
 7aIMOvXz8U6m8rsxg6F1E7N4fofI+bKZ/qJLf8Y8IHL8lhyAG8oH9gnBdurL9S+E
 0Z42qS+Q2IPjB4q680s6dsQ3PuMm0qkgrgymbN5oTQte88SzrDbmVVO18Ul9lCGr
 utxES1eGpkBBWVLAnzuA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxjt4shng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2024 21:21:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42ILLPNF003847
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2024 21:21:25 GMT
Received: from [10.110.31.51] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 14:21:24 -0700
Message-ID: <4a69382c-5fb2-4703-8176-f1833eeffcc1@quicinc.com>
Date: Mon, 18 Mar 2024 14:21:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: simple: Add POWERTIP PH128800T006-ZHC01
 panel entry
To: Nathan Morrisson <nmorrisson@phytec.com>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>
CC: <w.egorov@phytec.de>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <upstream@lists.phytec.de>
References: <20240318161708.1415484-1-nmorrisson@phytec.com>
 <20240318161708.1415484-3-nmorrisson@phytec.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240318161708.1415484-3-nmorrisson@phytec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tFW9EyK9fLbzGgYliH7Z-zohIbyfg0cz
X-Proofpoint-ORIG-GUID: tFW9EyK9fLbzGgYliH7Z-zohIbyfg0cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180161
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



On 3/18/2024 9:17 AM, Nathan Morrisson wrote:
> Add support for the POWERTIP PH128800T006-ZHC01 10.1" (1280x800)
> LCD-TFT panel.
> 
> Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>

Hi Nathan,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 20e3df1c59d4..02d238123753 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3465,6 +3465,32 @@ static const struct panel_desc pda_91_00156_a0  = {
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   };
>   
> +static const struct drm_display_mode powertip_ph128800t006_zhc01_mode = {
> +	.clock = 66500,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 12,
> +	.hsync_end = 1280 + 12 + 20,
> +	.htotal = 1280 + 12 + 20 + 56,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 1,
> +	.vsync_end = 800 + 1 + 3,
> +	.vtotal = 800 + 1 + 3 + 20,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc powertip_ph128800t006_zhc01 = {
> +	.modes = &powertip_ph128800t006_zhc01_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 216,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
>   	.clock = 24750,
>   	.hdisplay = 800,
> @@ -4639,6 +4665,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "pda,91-00156-a0",
>   		.data = &pda_91_00156_a0,
> +	}, {
> +		.compatible = "powertip,ph128800t006-zhc01",
> +		.data = &powertip_ph128800t006_zhc01,
>   	}, {
>   		.compatible = "powertip,ph800480t013-idf02",
>   		.data = &powertip_ph800480t013_idf02,
> -- 
> 2.25.1
> 
