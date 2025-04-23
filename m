Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0DA97CC5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56810E3EA;
	Wed, 23 Apr 2025 02:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gcEsVa04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4AE10E3E8;
 Wed, 23 Apr 2025 02:24:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iOFC024199;
 Wed, 23 Apr 2025 02:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A3p0shn+EadAgS37YRBKT47mpjkqtQBb46wYknXcv7A=; b=gcEsVa04yMM/LiEo
 biMv9NF5VP2uzwEC5vulbuTJT7OwSiWpOVkYa1HKbnFnDrUTH2RSFtEzgF6cSbpA
 o2CaeQFj3HrrV2RH7EYbpUJuouZ0V91V6023chl4/8e7qdP2NOh9bFGe6RibjLuC
 XIwC8/3aUhsEl8pmXMwg3GY1f1yJRohs+Y5UvESX8SiUgwHFPVBd9/g+V5E22lnB
 YahZRH3UW5j75zasBQHTENqVk8InRbFeSP06+qNfe48QDFaZ8o9X5s5A5Kgb9COO
 D7o1PAyr9eYtg53/t6Aaj1SQQgnyHGen7rGUasFhbgwc0yDReOVv4GC9kVSaeHlt
 f6/liA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh38k15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:23:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N2NqTm011450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:23:52 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 19:23:51 -0700
Message-ID: <079bdb90-2dae-4feb-a32e-7a7ce8a3a972@quicinc.com>
Date: Tue, 22 Apr 2025 19:23:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display: msm: dp-controller: document
 pixel clock stream
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-1-9a9a43b0624a@quicinc.com>
 <e8f2e17c-13c1-4485-8e9a-d67705e461d6@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e8f2e17c-13c1-4485-8e9a-d67705e461d6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XNhPFzHgSVf8tZ7uxJJbchvi4jvQGUkl
X-Proofpoint-GUID: XNhPFzHgSVf8tZ7uxJJbchvi4jvQGUkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxMiBTYWx0ZWRfX9hDdm3ug2qfK
 HoTCYPSVU+rvUSU/PtDeRevJkQz9ko8+1GI51wFXfuH+JhA8oBMO4ivYbIwb2S1NdFubtuFOuN6
 bmVWIX4Pzoq3Nq0YGlFZs2W3cn2W6Bdi2lWvyt2h2tJTlnHOh5SWEfyCu5ec5sn9CeaSPFyZIe7
 B43rNIM1FhEUnF8RIqRr05n5FbaNT/QTfEenZmaupjziBu1ZK8FffCQqLh+c30n5oOZBe52OSaC
 /hx43O6bOwwC7UsQRYobfTbALhOoXG6yQaqqGflzmsKOi7zpu3E0PsZyUn2F5AkWNAH9fUyqSeu
 Ka6f1Oz+/os/fCTbyBJ0OWb6CFkFzwYx3yirpaQ5m7P+KqeUImRS3Y6KGr+gFdqj1/94Ei6rWdb
 QsvOV6HxtCk/b6Q2+4rCdD0Bt4smUgqELJ6n1WeDSsB9QXGL/pxuMD2y+Z+ttuySdpkb/rt7
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68084f39 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=wkMkCz1etwRys_XeWVAA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=964 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230012
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

Hi Krzysztof

Sorry for the delayed response.

On 12/3/2024 12:01 AM, Krzysztof Kozlowski wrote:
> On 03/12/2024 04:31, Abhinav Kumar wrote:
>> Display port controller on some MSM chipsets are capable of supporting
>> multiple streams. In order to distinguish the streams better, describe
>> the current pixel clock better to emphasize that it drives the stream 0.
>>
> This should be squashed with patch adding stream 1.
> 

Sure, I can squash this with patch 3.

> Best regards,
> Krzysztof

