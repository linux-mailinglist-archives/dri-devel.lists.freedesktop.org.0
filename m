Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF715B4222A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9BC10E892;
	Wed,  3 Sep 2025 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLYIyPT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE710E892
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:41:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF1Jo002939
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 13:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=; b=JLYIyPT4p0HbU8Sr
 qiWeTOx9Ai4HHR440PdYhdI7ki4MiUXrPY+cf1jdKRlSnNsKT/3lkadOP2krWbSp
 Ne0xpBANyzwKwuvz4ZBDh/6c6BIPBNFIwxT7oK1F3U6u4pBSnc5dQFTYivMKbqI7
 BidKi0qcx7XDFvNH149Sax2Oral+KBDLt8HBBQvozW98X3H1yx+ChZMw9Xctr41o
 QvRqKlGrEF0Dlb9Z652RcoLqa0Bl+0H6V9ZCdn7L5ia9I88M/fF9y1O8OMsaUKgU
 uBttRTbEvWoHQ5cxZHsCoApc/6FmC6O7ZYiF7NZ1S65+jSxwdhwQ8CzGAik5erWK
 +XVPqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03w43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 13:41:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b307e1bef2so17714941cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756906910; x=1757511710;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=;
 b=cs75QduLtB7gEx9YBdEE+OD8qs/FgIsc0UY/J3QFQhKlDY9zAS1kflbg5H9vFFMcyf
 CAd1XDXIRry2AU/20q7Z0LVVOJzvPyfI7I45H1XVyVv+zD7Gg+sEuKG5aXG/AXigQWuI
 iOQcI9ebcm/IwnFObIcKBPlzDVuNvdYoxTE9wFsqqozbnD2AMJhYPCDuG6anTXImXniW
 8mwc+SXj2crI5q5N8zSnMi8PDWnR7stPFnkTrFB0uxrTwRHYAE9hHNoM5fOx/6QrQLd8
 6DyZyz289tSBobtkwvm0iEmg7gxaEVy3YAgMTWQ/2SWvma52jOC1brpLA4ltzkyQDliQ
 rnaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSh6FDs9raI9bCISf6Ts52CCC19S17b5T7WrlUluvADB3rcHYPsUY0ILH6DjUX2Cm9C/WhlJ55Lrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycPdd4H120mQi+KCDQRczbq+sdfV4QHwaDRYwhOZDNGkEQANYc
 jEJugz7yLqXob4P3P04vPIrSNziwaiJji842ts9bL+PRdMCCDN9TfT0zdgH6rNvgBlMxPVuLzFk
 ft24TckWMOBFMcdq6K/+tq16ZMgDoiTyPRl1NCp78bQi2aXIcNm5WbudiULHqiJDDhvtIb8A=
X-Gm-Gg: ASbGncvo+JtrxGFF8MEozHbROSJeBStMJ2waCwAcQBNavIMmbQzlBt/xJt82Z51Iab7
 jtrER6PiuzwkFMlmNu1toHchQFFYuKZeMsRcVEcl0riWE58bMqmwt6P65AYL+GWly7dZshYJ6m5
 YXX965Wpj59LvdKzjdxk7N1nS+eLCQwRaAPIy5nJ+gC40dtYNpUONAdAaogqRRCv14uubvuWB1y
 DJSiiInl3s6hmNT/sBFTdbmnQCKQCtdj7m1f8c0tmebgxsP+mxeI1xpN1vy1If+3I4VJ/d5i2O2
 xS/HFCIDtwI/8HoSLcbWxXwgPtXoX2Kaj6BbT6n/ARaoiE04BFYV3HeGjAiSoTEtcKiQ6rEATzM
 r+ZnYtvutLTs+ybhlLvvsEw==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id
 d75a77b69052e-4b313f90e37mr141154981cf.11.1756906910372; 
 Wed, 03 Sep 2025 06:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPdTWyFNZv0wrE6s7lYHY+t1NrlyBkHlYgUSBucbQO6LODUUme+aa57ScVuOXFRfZKPEXFg==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id
 d75a77b69052e-4b313f90e37mr141154451cf.11.1756906909528; 
 Wed, 03 Sep 2025 06:41:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04110b94cbsm968406466b.93.2025.09.03.06.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 06:41:48 -0700 (PDT)
Message-ID: <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 64B-p34K_1SeqhwAfxfbJpN7Jbj0QqdZ
X-Proofpoint-ORIG-GUID: 64B-p34K_1SeqhwAfxfbJpN7Jbj0QqdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX96iQHjO1ko1m
 cccgNnzyBTvLPi3OcnQId2BWwwgI0v6PyGBpa9pKnsE8WLYKsagcssyO3RAanS3hlAHAXVdqT8Q
 U/fZQtKTHO82WtRbDI6TVgw/TdLyCgpZWaukJ1qbML77XoMaS1tHW/GtfPao9eTsTow4wc+pqAX
 zz4k7THf29Fxyx8i2PYgRYf1Gr7JOzYQhsw5JNs635J39K5waeil8toMqpWHJTSqS4WZzOpZsgg
 u9KuXTEyPit4aSmTar8UTKeM8pOmsfDivJgYfVfuJ2wp5fzt73sucTjQCQqcpya7siUcUe9TmlW
 XUUGAEMNshuKSzjNl66/F/ABKzp/ecjT4K4GxY/Mpqq6pg+6UmYEoLNXSplGFv5wmrPzCAm6kPa
 SRnk7hlR
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b8459f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OhcfVZcqRUJJiLbfGB8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Update Qualcomm DT files in order to declare extra stream pixel clocks
> and extra register resources used on these platforms to support
> DisplayPort MST.
> 
> The driver will continue to work with the old DTS files as even after
> adding MST support the driver will have to support old DTS files which
> didn't have MST clocks.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

Something's not right here

Konrad
