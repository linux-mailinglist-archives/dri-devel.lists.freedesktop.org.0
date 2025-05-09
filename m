Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE13AB0B63
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FAF10E9C6;
	Fri,  9 May 2025 07:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WWQ5oGKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9310E9CF;
 Fri,  9 May 2025 07:17:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492GkdU008543;
 Fri, 9 May 2025 07:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lP6YFArRY1BgGGR83r1+KUWUzL4QlWSi/eIRd48gOBw=; b=WWQ5oGKkIzNVSCXd
 Z2XOmJ9SrSXu/lYO7ma6vXDWFA7BcWLt0Ap50HgVJOg6gLOoNWNq8m9QwHcF7NvS
 ehQyiD1ElSBhzA8vw+ziXRS3MdpO2nzM1MAhdeR6rXjgZm2gxLvC5In1OpQV6WZw
 RyEfUT+E2thZzCdkcEXMp/fhu8MXoaFlzRP4Osd7Tr9yGjJ+/YzvNKXbhzJlKPTy
 8ccOcWHOXCIWDel/P+tZYrfSTTA9fBsPXsSj4RW4zZySpaEEIpk0CeRZEetlvV3i
 PbJoUxVhdLtz93IIzICj2uFw4oqeLwY0V4nkJhS4UC5sJywfFAwnS/bVOnLWpMhE
 tcO6YA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bra6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 May 2025 07:17:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497HXmx021592
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 May 2025 07:17:33 GMT
Received: from [10.216.57.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:17:27 -0700
Message-ID: <047e2d5c-89fd-4638-ba8c-6ed2b759fa20@quicinc.com>
Date: Fri, 9 May 2025 12:47:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: display/msm/gmu: Add Adreno 623 GMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
 <20250508-a623-gpu-support-v3-1-3cb31799d44e@quicinc.com>
 <7b36aa5d-8c81-42c6-a69f-38f9b157a361@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <7b36aa5d-8c81-42c6-a69f-38f9b157a361@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681dac0f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ZaX90SiD_hMLhUq7ehMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lT4GjizFhQpQiE_A3fmILspzYCLOS_dO
X-Proofpoint-ORIG-GUID: lT4GjizFhQpQiE_A3fmILspzYCLOS_dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2OSBTYWx0ZWRfX7WaBzHDy21Xp
 3xdKJmvDz1yFWRAoUfSfcKOxJA57/UAprvmzmfx9miFkQMekq0IcmjpZ54xBYb3RJhrEdKGXS1y
 dc3b4d9uySHOlsM8XbjXMxnlhMJMEt0N0TAolEOQs2H20XdN4c59rYG8WAYo/rFMawmWrxwfoF8
 O56NnCoLezguA/5xVKdUzklB4in6Npx1J35hskuwTXmvI/PX1DZVAePm9AqM86NEq3qOgde/wrQ
 m5Gp6YGcMiNmAgbgVfiv0Q9N6NW7DbBa282Xok0oylzOT88vn94Nic/BcA0slk5pp6lxVl/uNV6
 2troP9SDioQO1gqM9drB8foPPSrDH1B6NR0rTpl/pTYm1Wa6xfjwZjxGVvTIQ86BvMWGAiUoCe2
 /qhN/c3VN4aNIVOSwLds8z31f49W4wKmkYmE5iuR9ThXGhLvWiLb4c80Z+cQGdnRyJrwh4jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090069
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

On 5/9/2025 11:12 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 18:19, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Document Adreno 623 GMU in the dt-binding specification.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop. You changed patch significantly, like 90%!

Aah! my bad. This is actually a new patch which I mentioned in the cover
letter: "Update dt-bindings yaml with a new patch#1"

I will update the subject and drop the R-b tag.

> 
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -124,6 +124,40 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,adreno-gmu-623.0
> 
> I don't understand. 623 is already here, you document nothing new. This
> makes no sense, I never, absolutely never reviewed code like this.

The clock list is different for 623. We are removing smmu_clk for 623.

-Akhil

> 
> NAK
> 
> 
> Best regards,
> Krzysztof

