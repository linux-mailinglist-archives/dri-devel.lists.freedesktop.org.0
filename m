Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EA8107AF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 02:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D862910E22B;
	Wed, 13 Dec 2023 01:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4114F10E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 01:33:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BD1FhEv010319; Wed, 13 Dec 2023 01:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=miMBAdaz8cO3oIR265yWqPR51wW8iYYznS3TBeCH6Xs=; b=MW
 H+tKOUkQ2+4Qof2jJlsNSrdvx6iOnnDd03olPuZf65my13d9AzYh4baB95EyIJvW
 6lW7VXz1JdG3hfGL0gI9mLVdPdlOG3PJD4xtV3MYt8y5zm6wISs4fuNwJNt/AUlq
 tqueNVFaGUfo9bBdntfIcibjEmWVtwjkOTCidItDQUKbPxxa2vZMzkAGH3cZLV9X
 suBJJfwTCfIx39tFrWal3VKJhaohhZyfqYhiug3rEPaiLhjw6zTXZ5aq2aKfVW7D
 VcWXoFkc3xn82NnslfslJ4CcpghK1jcdNQNlS8R/YpJvinmjpxAdRaEVKTv+YpQj
 yfTlaKsxNU64hFP/7OJw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxnf71x4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 01:33:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD1XfbM015396
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 01:33:41 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 17:33:40 -0800
Message-ID: <a27e18e1-3a40-4a6c-a779-eb49cd829bc0@quicinc.com>
Date: Tue, 12 Dec 2023 17:33:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: panel-simple-dsi: move LG 5" HD TFT LCD
 panel into DSI yaml
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Brian Masney
 <masneyb@onstation.org>
References: <20231212200934.99262-1-david@ixit.cz>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231212200934.99262-1-david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d7W2CSZQh8rz8gvKKP3QWeLW-RV7pceu
X-Proofpoint-GUID: d7W2CSZQh8rz8gvKKP3QWeLW-RV7pceu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1011 adultscore=0 mlxlogscore=585
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130008
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/12/2023 12:09 PM, David Heidelberg wrote:
> Originally was in the panel-simple, but belongs to panel-simple-dsi.
> 
> See arch/arm/boot/dts/nvidia/tegra114-roth.dts for more details.
> 
> Resolves the following warning:
> ```
> arch/arm/boot/dts/tegra114-roth.dt.yaml: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>          From schema: Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> ```
> 
> Fixes: 310abcea76e9 ("dt-bindings: display: convert simple lg panels to DT Schema")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> v2: added Fixes tag (thx to Jessica)
> 
>   .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>   .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 73674baea75d..f9160d7bac3c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -42,6 +42,8 @@ properties:
>         - lg,acx467akm-7
>           # LG Corporation 7" WXGA TFT LCD panel
>         - lg,ld070wx3-sl01
> +        # LG Corporation 5" HD TFT LCD panel
> +      - lg,lh500wx1-sd03
>           # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
>         - osddisplays,osd101t2587-53ts
>           # Panasonic 10" WUXGA TFT LCD panel
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 2021aa82871a..634a10c6f2dd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -212,8 +212,6 @@ properties:
>         - lemaker,bl035-rgb-002
>           # LG 7" (800x480 pixels) TFT LCD panel
>         - lg,lb070wv8
> -        # LG Corporation 5" HD TFT LCD panel
> -      - lg,lh500wx1-sd03
>           # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
>         - lg,lp079qx1-sp0v
>           # LG 9.7" (2048x1536 pixels) TFT LCD panel
> -- 
> 2.43.0
> 
