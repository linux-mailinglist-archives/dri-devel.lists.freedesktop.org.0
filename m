Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D457F81CDA0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33210E831;
	Fri, 22 Dec 2023 17:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C36210E76D;
 Fri, 22 Dec 2023 08:59:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BM6MlFc028055; Fri, 22 Dec 2023 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OL2XzN7EDGy5bMY0OFne4LQrBx0wrnoKoEQ7MaxQsXQ=; b=Dj
 5wJ+5uD6XqCemRRD726eiD+AjrvVMPe78wH2oRHtccab1hfsymipxD0S7olIP/G6
 rCtqNzwnmsFXGSeRgeWDTx3XP9p50EHFqkYyv/6DEjV/Ac3EvQPI12+5uThjhrYD
 2VFyxZwou2coHvvtJ2uTDmr7sbDr+Bb6pDvwbKNjunrz/i1wA22RDpnolGKR+vh+
 1LxJfHFL1Kv7/MovZQqLd3ifqhvJrSRYQYjVsNE2pWoisCEnWP82b4oRVCNCjC67
 LhcS/atzN9MsWLeR6bUZvN9bvwebCsye1pIm4IyW2NyK9Jl+nkLiSOfmFx1p2KAb
 KL6UlE8sAXNdZZ1YuUVA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v4xpq944q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 08:58:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BM8wuAh021049
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 08:58:56 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 22 Dec
 2023 00:58:50 -0800
Message-ID: <27f8bc0a-0262-48dc-a879-552c3c5ec9e2@quicinc.com>
Date: Fri, 22 Dec 2023 16:58:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
 <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
 <170319289437.96441.9965499072649831420.robh@kernel.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
In-Reply-To: <170319289437.96441.9965499072649831420.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ck5j7imLKK1HMHeZYYRirQhcvywRSUYs
X-Proofpoint-ORIG-GUID: Ck5j7imLKK1HMHeZYYRirQhcvywRSUYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220063
X-Mailman-Approved-At: Fri, 22 Dec 2023 17:32:28 +0000
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>, Krishna
 Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/22/2023 5:08 AM, Rob Herring wrote:
> 
> On Thu, 21 Dec 2023 12:25:06 +0200, Dmitry Baryshkov wrote:
>> Rename the Qualcomm MSM Display schemas to follow the main compatible
>> string instead of just using the block type. This follows the
>> established practice for YAML file names.
>>
>> Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
>>   .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
>>   .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
>>   .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
>>   .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>   rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
>>   rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
>>   rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
>>   rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
>>   rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Nice to see names get more unified!

-- 
Thx and BRs,
Aiqun(Maria) Yu
