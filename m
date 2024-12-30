Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9E9FE247
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 04:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF37310E360;
	Mon, 30 Dec 2024 03:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eY9Wy6/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A7410E360;
 Mon, 30 Dec 2024 03:32:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTNxdTa002885;
 Mon, 30 Dec 2024 03:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JDMeTX4VHUuzUjH0TDsesXYCUdVso4afO9XNi4BhHb0=; b=eY9Wy6/aRqH9ya1m
 uXyRU8cYTMebz6Mm9rPm/0lpiBIp+Z2M8qNbBlUN6lQ+S10MUGFkMm8BGPag1QNQ
 dfuHt+FlYOevL9uOyBfzrM6j57o1Am6neSw66m/pdnw3Q3Wc8SD+DJ+FSGve/Urv
 SYeBwOQtUfizshJlCIe6vYj1hDDIWKCyz0vlk1SB2Ey46t1tSsBJwQN8eyKze9hK
 5u8diKiXbSxQmYDk+ZeBMBFTyLiKpx8xh/d4SEmSpKWnucVj/YQakq1FxAtSLqd5
 +WcbvuA1DOYNOgaC77qwAYxPjjoeJMvRz9t5Z0xFmg0aOdHC7iLKJZ6Te8qEaGdH
 knwNHQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43t71e2c06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 03:32:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU3WkAk007345
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 03:32:46 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 19:32:39 -0800
Message-ID: <11443d91-6341-456a-ac31-c02122f1e4c7@quicinc.com>
Date: Mon, 30 Dec 2024 11:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liu Li
 <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
 <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
 <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
 <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>
 <bwnsxcimgl7oqnzhrxurn3gs2ea3r6n4o5fulyhpooqnzbjllb@t7nljbwf3t3n>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <bwnsxcimgl7oqnzhrxurn3gs2ea3r6n4o5fulyhpooqnzbjllb@t7nljbwf3t3n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YGBXAi8ozgiBrlagMYxak2wF2zeg-YHS
X-Proofpoint-GUID: YGBXAi8ozgiBrlagMYxak2wF2zeg-YHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=687 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300027
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



On 2024/12/18 19:44, Dmitry Baryshkov wrote:
> On Wed, Dec 18, 2024 at 11:18:01AM +0800, fange zhang wrote:
>>
>>
>> On 2024/12/13 18:19, Dmitry Baryshkov wrote:
>>> On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2024/12/10 19:02, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
> 
>>>>>
>>>>>> +            i2c@0 {
>>>>>> +                    reg = <0>;
>>>>>> +                    #address-cells = <1>;
>>>>>> +                    #size-cells = <0>;
>>>>>> +
>>>>>> +                    anx7625@58 {
>>>>>> +                            compatible = "analogix,anx7625";
>>>>>> +                            reg = <0x58>;
>>>>>> +                            interrupt-parent = <&ioexp>;
>>>>>> +                            interrupts = <0 0>;
>>>> will change it to interrupts-extended in next patch
>>>> -               interrupt-parent = <&ioexp>;
>>>> -               interrupts = <0 0>;
>>>> +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;
>>>
>>> Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?
>> We extensively tested FALLING and BOTH type, and they all work. However, I
>> believe it’s better to use the default type, which is the same as the
>> downstream approach. This way, it will be more stable.
> 
> Following downstream is a lame reason. Downstream kernels are frequently
> wrong in many ways. So please check the actual documentation for ANX7625
> and specify correct interrupt type.
after checked ANX7625 and semtech,sx1509q documentation,
will do these change:
1.change NONE to FALLING for ioexp
- interrupts-extended = <&tlmm 58 IRQ_TYPE_NONE>;
+ interrupts-extended = <&tlmm 58 IRQ_TYPE_EDGE_FALLING>;
2.remove interrupts-extended from anx7625@58


> 

