Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731FCA2FE0
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057EC10E8E4;
	Thu,  4 Dec 2025 09:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETC6BYax";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4h9vfMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAE010E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:29:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468mTj599209
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 09:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=; b=ETC6BYaxzg5F3HR8
 UiNhSQUFxDv9gBs4HiRRhPOtnbNxORAAfBaQa0dxYFCrrtv9gVTIc7VMH5H7+MKy
 O4OG2tB8AiYpn8YQu7BwplB+22Skx1faisvQtCP9mmdoW/ZbWB2sQsk8RVVM97/F
 sux6WgakNdhMHjVrCoFM4XLTbh9fmK83znckLlLAxxFvULHLkb2lYAZysXUmwGtR
 6fHrHAPWhtBxM0cUXsyn9rGnDnouPvdpP39AlRcvWZZP1Wy6zIHZs0rvuzh9kQ6S
 q2gkXLh0ndxkUJ79UifqnBpokgMmjX86YviFqH8UFXSVaL64AlI47rbpM3SuRbNF
 XrmvoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f0150c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:29:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so1296241cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764840578; x=1765445378;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
 b=j4h9vfMCDCO0YVe3uyyMXfYxvVjsSngI38AcWhrmOUjpbD+PiUPXaT5BURLO6PGLXe
 JMGQ/0L9IRaqUz8rBxTSC8RFWrzOK0seK1RqLtrI+yhZwe8uUbgrbFYFv7eyxPccpBcF
 rAcVpNIexrA0AZBNKQ5tpcEcCGRCjTePyLrigMMW9WVSwqR8jIyUtuU8fBZyPlCDSJjc
 grYhLBlqcl/+MMMQ45RfkD4cKXTVyTQqS//EtT6cY+iT5qfJmh40eeESlpT5AeurkbUT
 Bvym0+XiSFyQX+JpoASpRQwJl8f+dV7DVKkNJs5gcHeU/Kj8XEAUvJeMDAw781TQlxZ4
 isbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840578; x=1765445378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unIHf2bLbiUgKgdZ9j/dH/WmTNgmy72TLalZZX9Pogw=;
 b=gJR9KSn4PpAAA4rLPwVlsHzYEzI/DvVF3oqrosDoehBSi7eN1zVOOtBBm6S+49vKwT
 BKJVTleU8DncOKSdgwuHupE9cMLy3G1/Ox4UttXjbShu96CjrE7hwwBwUpXAjcsk3tGH
 QoPWEdo7KwAPpJTs28kGlmDw8JSAc1qMUK6hKG7agKnzgbRj85ahw1IQ++NNsb95903v
 CQdt8SEVDAgHLkLStHQm6bKM1/tkk3+7CjeTARZ8K4Bo2dMe2A4Lt2ON2Kanf/Zj5eT7
 CnMtdq56jYNda8gnUt63bdENxvnsBcz62sDYSVEIeqqny0Dl+Lfus8aU+xyI40yYiUjq
 KsAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb7TxWFryNYwZhkkLU8IHHtoQXi3Z+XS5cEPSqmmHnLOMkYNHCPu8CDOZZaZX3U+LZlFY5Zq15K3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXyGM+O/yD11PxDDSsh8pi/g6Hpi2OHPYx1HYhfJjHC3f0mPm5
 UMd6ffqd7sOqj8RH8tNJk4hfeLDcQUwEOqRyYhfIwkc/zrl4hfwplsFAq0f8Vw6p8mMpE553hQv
 ATJNiGkEIoeAnT2VffGdcNyCYD+TI6L9xWWO9Un3y7KnfpY1ObJ8LWBK+Tye3TJ9hva4xQYw=
X-Gm-Gg: ASbGncvUYvH4zWKgqE/fQZcIY1rfPrDD+8D5iZIIKhIsJ2Q63n1N2NH7X5Q4IFJhUwu
 lZXZL3gPcA9bOgYXaFJ4XRvO6+l/Qk50DFwLhk0bK7oqwogsMmu6ZZw7lqZeO+7Xo9ArgCeY5B9
 NlIcWGZqONZv6nC1GgX0jlLRyiRNIdYNWGvjY0Er+9TX1PZ/tXzrtBFg5Cez6FBW6uSfTInVnQQ
 8+d45KVg+9nJzo8R6jgtEvrg3YRoN7YfV+6gXPTN2uDcXy4ZhoulHj40s5GX4AktcjjL8q2+YAU
 SRc2jK6CE5t2oUT0Q2nOiWTCTD3EuBFinMNVBW95IsZ9/NgVP1WNEUhi8UeAA/8mROBzZ2KXX2L
 Xwe4Kfv4FnmtTyqnavuL+ZJEElxLaVnFHZf5nIYiL3CrO8eKMXRcbQSDNT8cec9RPaQ==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f01b0b0959mr46305831cf.1.1764840578504; 
 Thu, 04 Dec 2025 01:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFmWJJcCfG7Cy5tFaCOZPMPZvEVSgfUyJYtupxfO2ZUtQKd8azbDaBAGnvDPz39Cxu2XF9rA==
X-Received: by 2002:ac8:5793:0:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4f01b0b0959mr46305491cf.1.1764840577963; 
 Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c88sm78004266b.35.2025.12.04.01.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:29:37 -0800 (PST)
Message-ID: <71366611-980f-4991-b7e4-f3713b70be6c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AB--5eE5EPNHdet5NINp2UDA5tWoipMR
X-Proofpoint-ORIG-GUID: AB--5eE5EPNHdet5NINp2UDA5tWoipMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NiBTYWx0ZWRfX4SM7rESdqNvB
 9o1xc7Wma8LytmeE7zmIJa0yzWUpMxExdb0IQcmq+Icm6k/KPdaikZJwR+S5nOX+MLONdrgGakM
 hedJSyIa5DiGCKXtso/tT5iXmz5cssZR0xL8Zge079B/azAoI6ewybGA3CQVDsiyXugUZxXRf1U
 +WJuD6PSXqhoHPlXG8R4gxDlKk8BPir2tJ1cKS2dPtu4yI729xCKnqpxEODRS66f/I3J07HyY5q
 zR1GN6p4tIV5fZLI6A0++mDb87W0HGyS1bQ5Mx0O4hvj2WsMcPc4uQFFRLBgpHyBZqnNIyvpax6
 GR83Xh6ayN/+NMvAng93CSdk0pwIJ2vjxcZEXyYBhvzcaVo0cjZwNXtt7RK2vDbROq11B/fwzHp
 ofBnxWKOfwcxhnEuVblUAqP3w0sKMg==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69315483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rm2exvCS1sBdD0tWXWIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040076
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

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Couple of nits

[...]

> +	vreg_12p0: regulator-vreg-12p0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

These properties usually go at the end of the node (e.g. x1-crd.dtsi)

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";

A \n before 'status' is customary

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi2dp_bridge_in: endpoint {

Also before the last property and each following subnode

[...]

>  &remoteproc_adsp {
>  	firmware-name = "qcom/qcs8300/adsp.mbn";
>  	status = "okay";
> @@ -419,6 +574,21 @@ dp_hot_plug_det: dp-hot-plug-det-state {
>  		function = "edp0_hot";
>  		bias-disable;
>  	};
> +
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This conflicts with the ACTIVE_LOW definition, plus it's generally
handled by the code via GPIO APIs => please drop output-high

Please also keep the entries sorted by the GPIO pin index

Konrad
