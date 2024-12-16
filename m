Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201649F2B5E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8B310E3F6;
	Mon, 16 Dec 2024 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WePX7sRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11110E3F5;
 Mon, 16 Dec 2024 08:02:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG26Hxq010102;
 Mon, 16 Dec 2024 08:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O85h79tpvZ71FNj2qEOI06WHnYJLI2YhJlHOL8gZ+4E=; b=WePX7sRcQAMhUdXR
 Aj51f7coBgIzpk//0JUW2n0xH3K7mhYLeeImulEeaO03cxEN630EPjBZTT2m3NF5
 g2GjsBGf95sVPd/N71qJPxukn9JYf9yuSj3tC7ynvcufV9el4ozoJpPyd5/oBK34
 wJakNM8tb/beQXPobO6NnLVRy3tGgYZU6ah7EOrd6zfHG6UOQsFkgRrtPhPMcDFt
 cuCToou530KX+eu9u/rkttG+DpjwZ4zjLjSoUqzSnqpwjmENrmVAps7HW4vFHqwU
 vX346qWuhzVSC/Tbf1/iuOC7Wzx1SSLgNo6SUakYA1pX2gS3HPRG3fpiO2vx03Gn
 7UHc7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jb49gvgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 08:02:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG82b7L031851
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 08:02:37 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 00:02:30 -0800
Message-ID: <f6754fdf-56e5-4c32-8949-4070f8135159@quicinc.com>
Date: Mon, 16 Dec 2024 16:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add display support for QCS615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "Liu Li" <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <173426667308.2196979.11322859869026651489.b4-ty@linaro.org>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <173426667308.2196979.11322859869026651489.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hLqVv4zo-PX3VfPhP0AVMM4p6Sh_mZHI
X-Proofpoint-GUID: hLqVv4zo-PX3VfPhP0AVMM4p6Sh_mZHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=972 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160065
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



On 2024/12/15 21:10, Dmitry Baryshkov wrote:
> 
> On Tue, 10 Dec 2024 14:53:51 +0800, Fange Zhang wrote:
>> This series aims to enable display on the QCS615 platform
>>
>> 1.Add MDSS & DPU support for QCS615
>> 2.Add DSI support for QCS615
>>
>> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
>>
>> [...]
> 
> Applied, thanks!
ok, got it,thank you!
will only include DTS changes and remove following patches in the next 
update
> 
> [1/9] dt-bindings: display/msm: Add SM6150 DSI phy
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/5902cd2212eb
> [2/9] dt-bindings: display/msm: dsi-controller-main: Document SM6150
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/e9280f124b3c
> [3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/701da2861cbc
> [4/9] drm/msm: mdss: Add SM6150 support
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/b8871563eb96
> [5/9] drm/msm/dpu: Add SM6150 support
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/cb2f9144693b
> [6/9] drm/msm/dsi: Add dsi phy support for SM6150
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/fbf937a89ad2
> [7/9] drm/msm/dsi: Add support for SM6150
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/8a570c93fb67
> 
> Best regards,

