Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F1983DAB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7240B10E4DE;
	Tue, 24 Sep 2024 07:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GADONGLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FFD10E138;
 Tue, 24 Sep 2024 07:16:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NJWFU5021730;
 Tue, 24 Sep 2024 07:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KKyssr1uc6M3Edh6ydcV4gtcPR+09KpLfaDOx33Lq7U=; b=GADONGLGmYWOz0s+
 ztrmq0L23Enkbmai+od+OWRJpvIYbWIm3ljPf8ogzpxwgx5Wjx9jmjUgYyCz47Sm
 foP2DeomiDLzDuTBtYYN1nBwbdXUGDhvPH3WZ8C2O7s9W3m9zTHnjxc/T/TIgcdh
 FF5efEzdi56ExxHjoqOXe8Cvq2W6T+f6dG8WImSUDDnuzqcvhGW4YsI3TFoqwPT5
 bQfV2OvQzmllH8ajg/JjPxGhceol266E26iYZ5uq3HeDAJjyfJRz7IIx+/vEV1nm
 M+/kAlbeFET8Nbsy4j3guueFMZ6T6Hnb0tdXX2TeqhnGvRpppGDFzm379HIR8x6U
 nK5KUg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe97918-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 07:16:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O7Gj2w000900
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 07:16:45 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 00:16:37 -0700
Message-ID: <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
Date: Tue, 24 Sep 2024 12:46:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
 <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
 <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
 <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
 <quic_vpolimer@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KzVsAwP5PUX1tTjVWqWecZqXc7n3LxI8
X-Proofpoint-GUID: KzVsAwP5PUX1tTjVWqWecZqXc7n3LxI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=627 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240049
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


On 9/12/2024 1:26 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
>> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
>>
>> ---
>> This series depends on following series:
>> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> As such, it probably can not be merged before 6.14 (the mentioned series
> will go on 6.13, we usually don't do cross-tree merges into drm). Please
> rework the bindings to drop the dependency (it is possible, use fake
> nodes instead of using dispcc + ID). Then you can specify that only the
> DTS patch depends on the dispcc support, allowing driver changes to go
> in first.


Can we use clocks = <&dummy_dispcc 0>, <&dummy_dispcc 1>,  
<&dummy_dispcc 2>; instead of  clocks =  <&dispcc0 
MDSS_DISP_CC_MDSS_AHB_CLK>, <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>, 
<&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>; in dt bindings?

>
>> ---
>>
>> Mahadevan (5):
>>    dt-bindings: display/msm: Document MDSS on SA8775P
>>    dt-bindings: display/msm: Document the DPU for SA8775P
>>    drm/msm: mdss: Add SA8775P support
>>    drm/msm/dpu: Add SA8775P support
>>    arm64: dts: qcom: sa8775p: add display dt nodes
>>
>>   .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
>>   .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
>>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>>   drivers/gpu/drm/msm/msm_mdss.c                |  10 +
>>   8 files changed, 931 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>>
>> -- 
>> 2.34.1
>>
