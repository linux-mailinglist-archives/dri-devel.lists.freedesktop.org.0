Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6772B488F3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3C510E127;
	Mon,  8 Sep 2025 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBnME6tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A710E4AF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:46:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xgj4014574
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 09:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvPrAA/ICa4QmrY/uCAxXkwkNA9kjX32rCYICA7/VoQ=; b=ZBnME6tbpmgqJS24
 yts36ezMywJZSiJ05Bij+jRhb96QIhswlyExTt8qlTXs2mtCIXWZYn1M2YzjT7K1
 YW/9GqPXV6KD+VScR0SFdsF+FIvMvoMCquE2M70rIECWkOB8AyiESgLBRTqcy2V1
 826qZaLVyqJagMATL4e/0WV4S5AiqIj4QnrGZzIOFhnHvyxu8+YB4wk7NiTy8+g2
 E7MmU7QpC3+3vrqR0jcnc0M3oIdlHdAe66EevQy/qMuYba2hdvK0oxYySS0/PwUQ
 7Mej5KTrg0OqfyagH7+U5cuMGSGxW8tVThOPS2PnWyAW6jIPALGjDkA1Tq3RGjPF
 q2gTZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j47w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:46:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4e63a34f3fso3177327a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 02:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324798; x=1757929598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvPrAA/ICa4QmrY/uCAxXkwkNA9kjX32rCYICA7/VoQ=;
 b=AdiEMThF/a3sgR96ylAmPYJwPcRCsdKejAiGrkzLu7sqT43Qz7u2gVpc5cZCcCQTVz
 FsdbujhYC8oTNn/UK63+vgE/84Nh9FStWT7zwqkjhhr+kx2CtCaNtXiptuwfZPvfi1bw
 mkzPdaDkFC97DqtYxVF/g9+Kb+/JCv8gUy0/gQl+v9YXMWVDx8dCDKuUR67oyfeA7o4d
 WdXqQB06Kcsiey1iOs/OaaBafkUclZNPDzOm+JtQKNm6d8LsHU4+ug6IQWIHqEwOFY7y
 Ncpey+UXLMpJKNXOlX4iRmdjcUuJFCP/mvKjiapDndFatQhSs0Us5dKrT5z79P77Dotw
 Lpmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdM4us3t1cd+zGqkAcCfIvbNY3NF60Uc7NzT/Sh1qmpnJJTN+5z8rPiprz7lhFVHhWZ09VZac9KBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx4MBrNhx/UB0IkRHarb8+uDhlQYmUUomZmrbPL45JMyIa5+vP
 CrKDvmbWreqrg19LgUnwQw0Hlltcyt4Jl3NgzMrc0GNnUZnwq2lsQm1fpP2LNMyRIFTMTSc/vRH
 zqpj4Y/WlMnlAlwWndKKhO03jQ3KXzDafokXIr4DYcowc/Yd91KGGt2ztCGsy20Q3ZcZVGnQ=
X-Gm-Gg: ASbGnctQ7eCTIqIr4HBl6rBwh20oDLzGR/ThDKOQMNOdVHkOFR8IBIn5Zf1o7Pc5sUs
 S7NcK4rz/MkoW0gVlcZ3aDc47KSWUdOBA+AnK8yUe0B0TA9bK2WtcQY4h1PLuul0zsRFimGA0Mt
 qZkUKlw8VozbeKHQ/aL45+M+apAEhJBIzdIF73DIX9HpaE6/EPUm1wF3NerlXMlWeHtE2bUBDqB
 ElEmsgBYRWodlW5WNlC/2zUunA3mhk1ga4c2sbm/Ohrf+GYne7fzPhQMNGG7NTkn68bwrLqnsyT
 YRXuRxmukz41rzDS0P7EGv8fra9TSZB4pN/b1GlZRa4OF5gY4BH7R3pulb54J9rYx+xXUTesp3T
 itmVt1hMsSbE6VGdeL0e1RDUYn+eSyw0=
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id
 98e67ed59e1d1-32d43f65178mr10004398a91.23.1757324798516; 
 Mon, 08 Sep 2025 02:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfRyf4bycr5BBpSLmxS0G+wazAJl52xcP6+Epg8zF89ELjO/ko4stTzfzCABTT6v+46wN1Q==
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id
 98e67ed59e1d1-32d43f65178mr10004361a91.23.1757324798009; 
 Mon, 08 Sep 2025 02:46:38 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4fb7d391casm11944947a12.7.2025.09.08.02.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:46:37 -0700 (PDT)
Message-ID: <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:46:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX8YRRtp5nty16
 Grkg6ZB1O2jK5h9oGwM2/QyywWZxhWY37kwEoRqVJeIQpCAu2MqnMqqO8WIunN+Rp2rTOomMZ7s
 bo0S3Z8TfaVfpiUDoCnhWoN5MyOpVWtSD2m+ajU1iuKwGZTaKkcylCfCUcQpRqXG5BeAtz4eNfu
 taabd+8s765vN9DCPL1/liNkh1+6Z9geanbCasNdA8GesSKxb3lHcUXV/qjgp0S7kdYQAIwNceC
 5mME+9AQcT2aIh5/hQ14DIh8btidzeFPAIRzv9EFv2KcKN/rlPpW+IiZIDWxwjGqWcKjfT0YQy/
 qWmfIDUpt8LjUm4rcti/3WgBqZ2v5z5LGZ5nVTtg4ld2MWpTBrQRfZFjV5njhJzVxEp01lJtcQT
 eLPsdhkO
X-Proofpoint-ORIG-GUID: T5ab922B3LldYJx86fykkxq5IQKWjW_O
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bea5ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dWyAYXQ4UQf5hrxkvz4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: T5ab922B3LldYJx86fykkxq5IQKWjW_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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



On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> that supports 4 MST streams.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>
>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>> new one?
>>>
>> I think we can not use fallback to sa8775p, since we don't have DP1
>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>> really used). So in the hardware, i think it is different with SA8775P and
>> we need a new one.>>             - qcom,sa8775p-dp
> 
> The DP controller is the same as the one present on SA8775P.
> 
Yes, it is same.. I just want to confirm again—even if we only need DP0 
for QCS8300, we can also use sa8775p as fallback, right?

static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
     { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, 
.wide_bus_supported = true },
     { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, 
.wide_bus_supported = true },
     { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, 
.wide_bus_supported = true },
     { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, 
.wide_bus_supported = true },
     {}
};
.mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.

Previously, my understanding here was that we might need a new 
compatible for QCS8300.

Thanks~~>>>>              - qcom,sc7180-dp
>>>>              - qcom,sc7280-dp
> 

