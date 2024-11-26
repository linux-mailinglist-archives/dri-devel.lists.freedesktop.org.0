Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD639D99A6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00210E8CD;
	Tue, 26 Nov 2024 14:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lUbRFCy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC9810E40B;
 Tue, 26 Nov 2024 14:32:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ9IGMl002756;
 Tue, 26 Nov 2024 14:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0McT3u2UtBYIGESRseYSXbKWBEqm2xZcNgozQTddrsw=; b=lUbRFCy8kfQr/wAF
 HD/UycUSx5odBQglea4Mc9yqRJv75MJnbGxE2HEwizcnYDt4BdiKN4OPFk8rkoQl
 hyx3NjEXZo2r8+VwYknMwFUF7R+PTQ4L4chH2OHB+tP2fQokbLej1gmtSl6ojp7G
 70SL3P7fiPjQ5bGB6WIyVB4CuDpFj+09X04pHA+8ASuZGAfjEvSOrqxhNUSJVbWw
 AY/Dl8YWPqchFNB4g2r2sHKOHQ97bhy1LMb90injovp3LJp4OstCo+jHV1cUJ4uv
 JkxVLcCep8sMch2ElI1FD8XQQKbwTN04Ftw24e5QhllTANwEtStcFHHGSKARRIf4
 qdp/BA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd8n2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 14:32:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQEWKI8025940
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 14:32:20 GMT
Received: from [10.216.49.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 06:32:13 -0800
Message-ID: <9f25f7bb-9c3e-4c26-ac54-6b467bb1811d@quicinc.com>
Date: Tue, 26 Nov 2024 20:02:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: gpu: Document A612 GPU
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-1-a87782976dad@quicinc.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241126-qcs615-gpu-dt-v1-1-a87782976dad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0t1pvriL9XgHNuWOVPVa1qeq6-ddHv-x
X-Proofpoint-GUID: 0t1pvriL9XgHNuWOVPVa1qeq6-ddHv-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260117
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

On 11/26/2024 7:36 PM, Akhil P Oommen wrote:
> A612 GPU requires an additional smmu_vote clock. Update the bindings to
> reflect this.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 28 ++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 6ddc72fd85b04537ea270754a897b4e7eb269641..201150d3151b55c26c95832d36f4e02f66060a25 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -187,6 +187,7 @@ allOf:
>              enum:
>                - qcom,adreno-610.0
>                - qcom,adreno-619.1
> +              - qcom,adreno-612.0
>      then:
>        properties:
>          clocks:
> @@ -195,18 +196,21 @@ allOf:
>  
>          clock-names:
>            items:
> -            - const: core
> -              description: GPU Core clock
> -            - const: iface
> -              description: GPU Interface clock
> -            - const: mem_iface
> -              description: GPU Memory Interface clock
> -            - const: alt_mem_iface
> -              description: GPU Alternative Memory Interface clock
> -            - const: gmu
> -              description: CX GMU clock
> -            - const: xo
> -              description: GPUCC clocksource clock
> +            anyOf:
> +              - const: core
> +                description: GPU Core clock
> +              - const: iface
> +                description: GPU Interface clock
> +              - const: mem_iface
> +                description: GPU Memory Interface clock
> +              - const: alt_mem_iface
> +                description: GPU Alternative Memory Interface clock
> +              - const: gmu
> +                description: CX GMU clock
> +              - const: xo
> +                description: GPUCC clocksource clock
> +              - const: smmu_vote
> +                description: GPUCC clocksource clock

Forgot to update the description. will fix.

-Akhil

>  
>          reg-names:
>            minItems: 1
> 

