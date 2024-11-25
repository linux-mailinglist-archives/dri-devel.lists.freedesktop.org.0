Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFFE9D855A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 13:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370210E229;
	Mon, 25 Nov 2024 12:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtGERbQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2A10E229
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:21:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP8glYi014343
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gDBzRlkGCEyYFmZ5YmtwhBflQYtmhi09NNPtB9yI/i0=; b=HtGERbQFnQFOzFv4
 Uz7ujJTSAXT7EXMgN3uKT3vyXeickcjmAyfD859wdZZAkCUOfG4fV0J3rgMMj4P0
 QsBvxJ29cTZ3hWFR2a1bajVLKJy9rrSGOgCljd+jsG1Gtz78QgokY0zpgyv8xMps
 hXQa2iCeTh77aNDIZAcvX+7q0LSw4IHrwKDbMVk2PvaLOthdAFvx40NhVPRnH7Rd
 r9VMBZQ6gtPmm9dNZ1fT1ztZundGV4EBbblKA7N7igeUw469O5t8/8ACOZG4Cve8
 bc660XCK9qxbONvjxyFTfDrYSKioLzV2NmR+M/FMfDSQ5aw/LllDnMpGOPXpnm2k
 Hr3iPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg0p88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:21:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4668f02aeebso2772041cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 04:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732537266; x=1733142066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gDBzRlkGCEyYFmZ5YmtwhBflQYtmhi09NNPtB9yI/i0=;
 b=eRIhQccpwqjhYTgRCNkjflOqHdsjMxsEeXNIyhxbCg4TUM1eLZheaFNNiIlVUY2jII
 Jt5uLarq0/h7n9GRK47mDI1YVwyacO3+sBU9Yz+yDTbJ0Qbwmq0JN0xD+/BecOf9qwZT
 9H6G38DxZP27t7+WkDPYtvT1D4bvL4WvIKQvGe/WkUvijArdqqFD1t8Gr2CvzifDgRLz
 sJmOvae8JA30VE57uP3hU2xNWzMv/alehQV+AT8rousM7DSQCeTnTEpQoEPhoFQPsxWS
 5XNnzo848B2yP0jM6TxHlT8U9qON6Yt/O9nnHB1afOvzEsZiMrPT5SUXtPEExTsZwxMI
 c6dw==
X-Gm-Message-State: AOJu0Yw1p/eU4DzycoimUIV5k/KV3yBnYNHkAlcmP3kNO4ZnS0R9NsT8
 PtOpZc53WdX1i049haf3WBDWJ47W2SQxLpukvkF8U7Mzwv2cK3m3J3oxYWTsYeY/ZZgrj06CpuB
 tfSKzdCc9TMLZ0+zB0RIC4S93O7hXlYrAVVOVoB2En1+t+yzNqdWuGKJu2mq37ldkWyA=
X-Gm-Gg: ASbGncvJdeHdD0jIqBpzlmS0dXwqz9/F/ck3PVrf9YPh8S3Xw2W3zoH0G1g6rE3FnOF
 +ype1Ij2X9H6Iyi0gh11J5fBHUspjpbGczKGk2JaSYoaSgOEDL/RbiyKXuk4WQoYKHCy9DlqKMS
 lu8bpdfVONAx3eFvmTGSWHSeYJkiVzv4JEAljaXS7jUhzAofuYMMm+y7uFOjazNrTUOtGcbuF8P
 ym3c/dXNKl/ezQ9HQEayTZmnseeq49+ejCggI8bPjFDMOY+P3TqXijQHP6Sk6KlMTqAut385hYM
 gVOuzS8H01uLbfW53O59mfAwhxsWLLo=
X-Received: by 2002:a05:622a:2994:b0:466:8c48:7222 with SMTP id
 d75a77b69052e-4668c488b82mr26078321cf.3.1732537265764; 
 Mon, 25 Nov 2024 04:21:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG897EHQwM/DGNzZZKU4h1dAJu36wkURTvQ3FH3Ph9u3QiO5bPEdDagAHgNEDb2GbIGXUHf9g==
X-Received: by 2002:a05:622a:2994:b0:466:8c48:7222 with SMTP id
 d75a77b69052e-4668c488b82mr26078101cf.3.1732537265315; 
 Mon, 25 Nov 2024 04:21:05 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01f9c2dd2sm3976328a12.18.2024.11.25.04.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:21:04 -0800 (PST)
Message-ID: <af6f4b48-7e9b-4561-818d-150fe954d821@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 13:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241124-asus_qcom_display-v3-2-002b723b1920@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_5xCHsB_ZZ3xzzlBztm9AcwSUERipfN
X-Proofpoint-ORIG-GUID: d_5xCHsB_ZZ3xzzlBztm9AcwSUERipfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250106
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

On 24.11.2024 11:00 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 uses the ATNA56AC03 panel.
> This panel is controlled by the atna33xc20 driver instead of the generic
> edp-panel driver
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index f25991b887de3fca0092c5f81c881c5d8bd71aac..dbc85aff50a95bfc2ac11528d1901979ec7b1501 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -407,9 +407,13 @@ &mdss_dp3 {
>  
>  	aux-bus {
>  		panel {
> -			compatible = "edp-panel";
> +			compatible = "samsung,atna56ac03", "samsung,atna33xc20";
> +			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>  			power-supply = <&vreg_edp_3p3>;
>  
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
> +
>  			port {
>  				edp_panel_in: endpoint {
>  					remote-endpoint = <&mdss_dp3_out>;
> @@ -475,6 +479,16 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;

This is <1> on other boards.. I'm guessing you verified this against
at-boot values?

Konrad
