Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F8AB2783
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 11:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1384310E04B;
	Sun, 11 May 2025 09:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="elvRyCML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384AD10E042;
 Sun, 11 May 2025 09:52:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54B5DBRF022791;
 Sun, 11 May 2025 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q2BsqUJ5qs8sClJC0RBmiR2OPzrS2wHqFWx0KothqIg=; b=elvRyCML7Yv1MhEA
 2WaJOPLHdMD1PTT20TF1SQE+ZQiuswtcTDERA10Xrq5p+8BUB6Bkbk3Cipues0G/
 4eetcXb2K6NkE/0hJC58BkBvXAeHO+Ouoes1f7jsjOg4kyKOdf3RCdOPkP+5YHDn
 hHZvs7blT5HYCJ+9llCV87g1vV24ldYc2Pqiachq3buETJCsQ5TzLJerMenyGXwS
 N1/uzgNXeN5h9Kazg0+5VM3PnqoBpdfRWM/YF5uNW2vOg+Kqc1PaZ0woafOVhjof
 V84/TZsLZxY4tZzppb4s9mM8QF3tRprH1GWrORhLFeiMIXXjiXIadNBSGpPONx8J
 v9k/ag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjhrb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 May 2025 09:52:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54B9q65k028030
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 May 2025 09:52:06 GMT
Received: from [10.216.59.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 02:52:01 -0700
Message-ID: <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Date: Sun, 11 May 2025 15:21:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <neil.armstrong@linaro.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDA5OSBTYWx0ZWRfXy0iWnmVfZ948
 W8G3FTxfcJhMR1S4OQgzgXn02ZhoFwpZnM6bzzSyQZKzaj2D/xjfaof8jxY20M37m/dna7vF53D
 QVhIYrD+cF4cwCFlhO/ag9hb7iKbEuCr11re/g6MGXYUG2yLxhCM9pVSoRS3AE6zQTUn74/08ae
 JdV5244rcnHWef0OTdQcQhOVxfzLYithB0I6FEu0CYA64bqlMlyXERuIJo3sWdeL/0uxmkxxXtw
 bBscXeLtZBcBQW5MfwrlX9/LWpPdIaassjkWWoOJ9/WArOtTJQ9WHj1nr95bJfSXYikRVty23PJ
 6ywHLBBdE4Y+ivmSG3u2DEBUIxpndEZFab09DNlSYMAB7b2C7fEK4UXo6OWHknGDHwO1qUQrBu1
 aLwcYyqK/nMC//U4PUJLYDzXeI0RbJ4egFJK++PqQ4cHBjhu7N18fXQm/anVm7wuAX8J7KpG
X-Proofpoint-GUID: Pxr5qnV33ichnL7CgcdknTCUznFW9JTU
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68207347 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=90UGo0xaWWtCiJOOztUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Pxr5qnV33ichnL7CgcdknTCUznFW9JTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=833 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505110099
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

On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> 
> [...]
> 
>>> This behaves exactly as I said, so please fix it.
> 
> Eh, I was so sure I tested things correctly..
> 
>>
>> Konrad,
>>
>> iirc, we discussed this in one of the earlier revision. There is a
>> circular dependency between the driver change for SKU support and the dt
>> change that adds supported_hw bitmask in opp-table. Only scenario it
>> works is when you add these to the initial patches series of a new GPU.
>>
>> It will be very useful if we can break this circular dependency.
> 
> Right. Let's start with getting that in order

Another complication with the socinfo is that the value is unique for a
chipset, not for a GPU. So, it won't work if we keep this data in GPU
list in the driver.

Downstream solved this problem by keeping the PCODE/FCODE mappings in
the devicetree.

-Akhil.

> 
> Konrad

