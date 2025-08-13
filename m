Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5CB23F17
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 05:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790910E19F;
	Wed, 13 Aug 2025 03:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1CrhF2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99010E19F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:39:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3d6J0030602
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kPk2QHiPe8RX6UEDtLds9t18fcrz/o5b6wJ1xFIzlzU=; b=b1CrhF2/X9+nRAGy
 jxH3iSNiY82vvBMXrCIZwU5tQKZUIWVDE4vvEpzR6f56/ESdSKueLgUHOZARE436
 gSXra5kfjgyPwP547q/TavfYCAG3nrjznbntndN9wzLKBctTNWhkjZkegaBWyFUl
 SwSPcPSDPoK3KbCpXuzrbJeG+PlROXLpsLjwSsGiK6TC+6uoKkjoM8Q/lQhLLQ06
 4MKt/x+cohTvfivExPkWyy4rJFEjyeFhnNuaNAOGjKREzKDGEBmivvupzL9WNTIA
 s751HkCVMyfbHS08CQz5rkF7Oome+KgBh6wISISYnVkMaos3JvY7E6xQSJl1eLED
 A+9M/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4e9h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:39:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4274f5e065so5311124a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755056341; x=1755661141;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPk2QHiPe8RX6UEDtLds9t18fcrz/o5b6wJ1xFIzlzU=;
 b=Tto71Rtt6+wA1g0oWZn4RqCAi2bvLko9I1zLeKWZb23cj6e6VbFZ9DhKsmNSVC7kjv
 BCSVvuTZHr7Cf/ue/b3TF/ELmRP2u50YligJDGpelWjsJRdugTIi5k05Ppp+A2+CJZhT
 2blLK7A0JcSLaPPVQqM5vGiY7UWmtKGlGxH9WwM8HT5VmZDRbbD5Z8k/sc8UWPvzc24m
 uTbZ4ZFW8YcJGk2wi/i6b4eiprCsB2HoVqojZ14fDROV7xZjByUkBIiXRpOaJXZ+iXwL
 zF39NxF+NiCvfANJfSuwmkw0gPhpWPF+DFQSKgsGsaiHPZ2xjrM/ugBRCquM6KFZeY2I
 A+nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV86Nd0Ju2Py8xreMgkCth++742ENM5cliaw9HP0BctJM69Dmg4fOavQUArmhS1DCVmc5pbfH85Auc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1r2K0y+d30zi2QDZcaOIbUPYFfQjlx5ET3bUgj1/Uv7CZNNpu
 dNdYSUriAMxKum+2qQ4hwAcfMrCOwQ8jDuzqbmw+c3SBWcrhCrXTVYNnS2cxrLyqQ7OwYTOEj28
 ObBtdoFy9Lavvpu2UQJvC5IiWepZYAtpTsT+c3XBgzezGT1BmvOKNIlq9rrPYxAQkpzIypBg=
X-Gm-Gg: ASbGnct6ZvkZh9E3OQnsWJv6qRyKlha/Ox0CdCXd8wlgmq6K8L6DF7F2M/5xS/uWLex
 WOyjEWsYpRWOrvpv90PDaZwAiGFOPQ3y1qkgnMrmUZei96W36vIpDAvez+xv1yY7dMS9Pfl5Isl
 vO4wAfOKpd9fF2+3UidtNyIX3GYcRXYIakQ2Qvzvd90dwgU6amSaORNtuLL+hUmjoL0wsjvQFZw
 o8ER71375fQpIpT51MuBpFZCys9YkzYjKh6ZFroevEgvylbJEygzqDjKOhB3vDWRfNFVmxmBAde
 6lmOaCx6+9MojM/ufMWNf9L/Eu86PSfE7OtgyG4/DESUPU5+eskHKbTtIvGW8BHy3XSms+8=
X-Received: by 2002:a05:6a20:3d84:b0:240:50d:4285 with SMTP id
 adf61e73a8af0-240a8b9cfa5mr2979707637.38.1755056341269; 
 Tue, 12 Aug 2025 20:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Dd5mSG7zW09Ug10gS3SwTUD5Aiujc5HgrqnSUnyzFaDo3SkczONNSwK3UtDk1yxa8/vXZQ==
X-Received: by 2002:a05:6a20:3d84:b0:240:50d:4285 with SMTP id
 adf61e73a8af0-240a8b9cfa5mr2979665637.38.1755056340853; 
 Tue, 12 Aug 2025 20:39:00 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b428e6244a5sm12413901a12.23.2025.08.12.20.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 20:39:00 -0700 (PDT)
Message-ID: <a0420827-cdd3-4442-83aa-d7f5072a28d4@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 09:08:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: lemans: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
 <20250813030638.1075-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250813030638.1075-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dXOhULfH_nSGNw4VynRmOqaw_01rPrm-
X-Proofpoint-ORIG-GUID: dXOhULfH_nSGNw4VynRmOqaw_01rPrm-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6Li5+BGXTEO0
 qT6ZGa7cTFoPky7ooqq2XmxoR4UlS9ns/Qo3CiOaoqH1hXgB18ZbYDf4Cql1PNgOsT/bRunFei1
 NLF8ycxiMGUUIBHLOuS9wqCX8vtDcdV/GDLx27vJoZ2HtjHby46UdUStAiDpuXmpfb58iaI9L8H
 fJzHLpSlIWZqbhUfRp/T3/AM7bJ1W59376tdsaXdRj/9tL6IAwhjDm050TEqpWItMUshEueXZVN
 xPffBY6Mx0tzs5YWRqDGWIXAFSfj6RPTMDbtH/4nvZQM61vo95JNRYCYCuLcMt0yPlPW4M8mhO6
 gR45j8BnBrmSSMeKkXpab/L6afFy2mHovvm5O6ww2yIroJLGETWquhQo46m4IHO+SsHD8H2cQ1N
 jROZUjEU
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c08da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Ucg9gNHWiGhv-ArepgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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



On 8/13/2025 8:36 AM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for lemans SoC.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 58 ++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 322abd0294be..a4c79194cee9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6092,6 +6092,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp0";
>  				qcom,remote-pid = <17>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp0";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38a1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38a2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38a3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -6135,6 +6164,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp1";
>  				qcom,remote-pid = <18>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp1";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38c1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38c2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38c3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

>  

