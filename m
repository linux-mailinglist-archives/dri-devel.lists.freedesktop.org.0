Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1964B5173A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372E210E91C;
	Wed, 10 Sep 2025 12:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb/iU509";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5324C10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgbjc013924
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=; b=eb/iU509PSQTrGCB
 gdxgseS4bxmqf6d5tCf6/BZIv7GJhIiXcJ7IDFYc1VPr0rVPsBaZoFxQckC6ChUO
 8xrxv+71kRnFabbee08/GiUHWb5FIYLLyzEJsb0MFYUZmL/r4FXK0l5oRoiQk4UG
 H1gn7e0SKV37BmH6ssECSBzyWkgnA4Z2UBH6GHV6gQ+Ikfx31PEOlQHbWPxlEQMw
 8XveI8/zo+/rblh0B+Fc5HRAwfRRs2qobZBldpVhJIoLzlq4BUlPzNWVRmsoeSs3
 tbCgv858lHWRhFV3vDyJF1UbWr6b3LbJHfM05+5NMoeddvMGdQbXLrqTX8qBRUak
 4apKKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8abs2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:48:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b613a54072so9908621cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 05:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757508526; x=1758113326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=;
 b=fOlWNs3m4MH+/UNgKUA3Ecfz4oz7npBHtwRkUy5dfalN/IhmtMSK08fjLiWonHJEiU
 +RFeIZlM5xKbgxaedd1BsN80wm+HKAAa54Nvl7/QB15KhBUcYNUzU1cOpXUCG8QE0Oq7
 coRQmXaj4SBGNeGMgDZAg5Ufq2gHAwclIBN4p3XDrkWE6F2OQHZMtfNTpuLehzDQL0gn
 thUatX3KS7i3e9YFHG+VkLXKuWjnvLbZT59vsJiPv8WhlB/TM2ifUkV6dqE8NRVB1IY6
 3kTKFco2i7egiKMY7Qy0cQJ4EVu1lCM2Sl8+RzWgDnBNfCsxaci8K1+NNDSVtMuG1m4W
 jUbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfitYQc8HW0Nw4CTi/GM33xvh98TjdhNxruNtiweWGxcsteLcdzz9U8pIqfCJFCJ4D8fB26IHeEAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv930iRULbWFaCJAB8WijsH9UsTOtUuZ3KOeSNRk88SyP/ywcX
 9wbEaU2cfAcN+VLzl46kJQNidtF7GRl60rUAOI9STif4Z1DNQ6WSRkWyNbosomSHraXMGiXoOsp
 FpxZRN8DBvqAFtRcqTyGvTM1wymXg9up/JERqPptJtrfpH0bdYiBJjT2AfnyGyX8/lVOm8Ik=
X-Gm-Gg: ASbGncuSNTTMxW5E0EZJ057qa6r3yoZXKl8Q9OCBJpopyQstoBD8LrnZpTO6k3lkAAe
 A9vw3/t+4//MAJ/txAVITenkIIZ/Xg7VF+2DnXs02CP2+VgjHRxjJMVMa6W05FjtIBNEEwl+Vuq
 BMsO/sid4RK0zO8UlogAFEG8tUXgflZbVICA147618zed7Su6LWmv6A2uvtA39eXeiV/HyBy+UP
 BJqA9Q2Hyhar6nZKCtpDZ+yNElDFpWlj7rEqsK19EJTF5ETeh5anI70GUjim3hU/yNnLA87NPrF
 Dl51Dh63iEfKx6DcNQdJ05CFyHrxGObD9CEw1Le12hN3bck0ShpnweY7e20BF/Fr49K/MM+2lIj
 eRiwiEz4G7RE4HMfymswL3Q==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr106840651cf.0.1757508525862; 
 Wed, 10 Sep 2025 05:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJJlCuiyW/pcIWNAfk0Cxu+p3Dd7IMOZXLW6sjV+Sj7pqR7+0vV4WzKU91XkLNccK+WxwgQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr106840241cf.0.1757508524991; 
 Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783049ecbsm163687966b.8.2025.09.10.05.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Message-ID: <9463ba5b-f305-47f4-854e-2ba0dd41bb32@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c173af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=EGTmXSwiq2C_3XJcCkUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qPlSa72Le5vn3ZKzxyfu69lFd305PD6T
X-Proofpoint-ORIG-GUID: qPlSa72Le5vn3ZKzxyfu69lFd305PD6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/8zISpaGb40J
 YxoKXQGkn84ffiHyj46gDJzdsG1/5NRUo9nlRkF6kHGkNNT3J5rJzRwWAWJcDXZIbflb0zdCSmn
 +GyTWQRO98wjIn0lJAy1DJD4x/Z23v3ZcO0LrO6RUTDsSqUTvGIHtecJcS+2rsG5b7XFevdpma1
 lAgC/51fV88VqLt/rTtETTkYZuTpcAtcVSWUlhIsWcKDe0MBxZiKiVxtuWcZvWowceIlhNLNq/i
 egJ/mjRN7BQ2DzTVBKXT/n7gWTDS2gJevxdpq/Sf3TkagZAfbzmB8Xhc6vkTpPER8zu+Ua3VxcQ
 SgdNVSwcXBZ7XMIdkDgqNTXE/3CtChP/Ziayc0kb5FRkU1d2DxLsxokZ7DQvXXQzNz6JuibiXqJ
 a5nj324B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On 9/10/25 1:25 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Akhil mentioned offline that having this clock under the GMU node
is a hw team recommendation that's rather platform-specific

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
