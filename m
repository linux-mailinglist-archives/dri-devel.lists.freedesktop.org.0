Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE54A9DA06
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 12:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411010E243;
	Sat, 26 Apr 2025 10:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZmpxzfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F410E347
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4dn39016099
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=; b=oZmpxzfcIwuDHd6x
 YFTkk4Bbz78gW2TDDdYmnCLQAXNjQluvpVi88EGFOaZJtKbauWpCBv4lVsGJQeBb
 /2AVCFWkEdU2z3NICrE0PRYq29GgqcJEORtQ+DwSwU0iLAknMFoh+Vmw0oyGNmVe
 DokPCAmSJIqruHu40xRrwDUF6jTDUlHu2oBhgXG1MFG+8lc2g538vAx1TT8BjDH5
 5bXYZGJ/TdWVJsC+di3D6tHkgRFXNc+nBTfMJpCgtxWnOI2IbIccMdQ3txiN2Gkm
 zNAL0CVYo7XomXG59rwbiuz+X5uMRL0OB9kvfgwqx3bZGkgmxfoZbxWPcTKUSgV2
 /R1+ZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmrpqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47aeab7b918so7360691cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745662369; x=1746267169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=;
 b=cds4/51otssC54syTm7AOvgTTUcOTQdwm1jVjtQi8lpB4OHvQpcoMt8gpHTbvQSoSv
 NqCEjSa0q3a6IquP+inPR5/BSYtkSq1HmJADa/UR0bKaRff9Lg+Mbpm6fJZxDiBQ2FDB
 WdyN7DYZDkGNZ7HUyoYAXg7jKopkkBICsrx5WcddMzpkQZ2TSVprN+ipZjR6/kSL2qMI
 uMdRPfpAg9pKOb+vnxc2ZkB1SsEHNoj7VxlLSV1aEwKKp18/0U7hCqOkf4kd6605Wav7
 +0Nk1iYEIcAGtH+2KX9Ke+/e4fyfCsmAIhMVyrq8wzJDM7XDUS5P8gQvg4DvWseV93VY
 kL8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2CeSqRBEdEMPTwbg+k1wsjf8LTLBapozs60mg5q8Key7NhQ0h7Xm7x5GmUreQeDWseeiiFE95hDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuuC4xlCqkLIDESUI07t3zNYeGpjg7JdysPeYo59Fwzb9Ex4qW
 krsGktHs29lfsMiqHDBS702cXeLYx9xFxSwsbs3oIEirlPhAXTuxQX/cg29Y96Wd45oonMWAl4M
 EmwhhffaILMov3EvZFPaXOR/3AO++wEPEIauXFC7lQmV3jx7FdmsiQItNYiP8PYzdhE4=
X-Gm-Gg: ASbGncsHi1IckXtmpSMXu0M526xbl1DsTybbA3a/p/bCI6acSRQAL2/M2djU4S9+C/m
 cmHS1B6WUgnUxSqPc/x4rB45PXUr2M3Oe3ulRU0BdgkNTca1jnPZK/1mFC2CFLcTSejNwrfk/eQ
 kJy0MQfjfYKTeg9Iqif5B9nWgN1qdkiXdxJnj8OtIJrK5HAHO+nyeHBTts0Stg/aD7WoJbqFY4l
 46D0PnEBCc0DCmI28kJsqAfllGaFTeaCt3c9SIQ523WYRhOFU9bo17awdtS/+l3b4xdApAXWttv
 i2Qm+rbAvqnN8dmmScjVRo9cRL9LmgVxQHobU6uGN3REy2cTjo/igBqf4HKwtcQa8CM=
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id
 d75a77b69052e-4801c2c33bfmr32875341cf.2.1745662369453; 
 Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8y2/2zXerVowv3WgwNFdVM4P6Z1IVdhvxEp0YRKkj25bC74sKgwxuOCG/XTskyzaDy0UV2g==
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id
 d75a77b69052e-4801c2c33bfmr32875051cf.2.1745662369029; 
 Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edafbf0sm264090566b.168.2025.04.26.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 03:12:48 -0700 (PDT)
Message-ID: <11e76323-db6b-428b-816f-e96fc9523fe5@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
 <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uCnL_MKxrXsI_X2JmF33z0LRuTct-IWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2OCBTYWx0ZWRfX/1NfTOkI62fG
 +PVLlTtnHAMOrk0r1RStSFaCgfVarmOCO77gkg3kLA/8XSGxE9hgm7wJ2rgcRhuAl/r2bESYPMw
 +gwabioxfU3zBzVtSTJhYwab6ciuqjVyFhTwvnVgvuVisEhXx6ULF9sHGmew8LuAS00S2D7jy1B
 C+4mEXgNCnME/512vnowko3u36DRiVSaKFRhxm3FSyN33xg8BjnkSZe0UfnSPmXoPdKZ/l06K1P
 7AtqSF+WRN5F8o5CYiFrmBtQeoKnoXJSHeF9ZSKb/nkOsHeC2JWHM77ZvtPUgnE6og0ek+vIrUl
 H3OuApv0tYYfsB3syxT7eHdcy3EQ7Ztu1p6CEfwFNG/aOpuld820xlTqeUQAiCO41EUNcnzjCT9
 qfMQS0Yf7u54UcfvoKYVxbCLt1gbF42A8T9t1b7y8K6Rz4HYG0jqM+3hAsUXRj4HSBPBWr9l
X-Proofpoint-GUID: uCnL_MKxrXsI_X2JmF33z0LRuTct-IWf
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680cb1a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GLHRRWOWZVtnXAxWSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260068
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

On 4/24/25 8:24 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 181 +++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..b8851faec271 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";

Please provide a reference voltage for this one

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
