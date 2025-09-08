Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD274B48ADA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C586510E4BE;
	Mon,  8 Sep 2025 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owp8rU9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA52810E4BD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 11:00:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5883lUxu013569
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 11:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SYd+/4tBi4uRuiBSAgW74S/nrmFmbZ9KidZtEig3lzk=; b=Owp8rU9Fn8ikQEhI
 71aF6aQZEr8vQ0H/3EVViSDOwCFQYIVGwlEn9vyKBKE72WlMg6uRNkO66TtczNVq
 312EV6MBrCSyqCNXnbTp6HLH7jSnQlp6ahrQCYqqGWegrVDr/nFRL6two33iEhur
 h6pzoqvwD/FduGTWCkNKjrs/X0/79cQ5GsTw+Ns1FaTbd04ixEUPDkdHjmZ+yb1H
 jkz+3R2oWOJwPtjLbmBa3/9mnIJfVSpYpXOG94WpNoNRwCxspTxFv7sT/x+hZyvs
 2m0bYgGWEjPi18sqQIgTEHrUjp1PdOJVLpknu9V94k/xdZSuToIljZOayMlmcouX
 geVGMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhds5jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 11:00:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581953b8so47982225ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 04:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757329217; x=1757934017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYd+/4tBi4uRuiBSAgW74S/nrmFmbZ9KidZtEig3lzk=;
 b=EpCS48CX8aVdyC4jUZZQCYiY8xyGq1GUqx9mHyqhTmB0W/1nd1pVsusM6hcPM2BMlU
 4MqpXmOzUylXeRKHTATEU2p55gGaaHky+/K5SaqRYPEFFNE6pzjRFEI31bqRFjiJ49iu
 5I5+bmxj1OiQcxEj/EmDNMCW4c3qt9/Ppv63rjFEIuBPtOnwkgjWMUtzQgLw3UxPrLmw
 Uj0es0pL5G9E0evjYWCF851j9fntew1jVAWdZ3hmWtAMzyJx0SeBlA9HevNoUU2T3mRC
 V5r17kGxp2Z8pRpizv/sGBowVHYY9rV/fVIjxJHgRWWzQJH3vIWkVVoLSsDaSR75UJ9m
 +u3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQyMY5gJia59oVa+6SXvFpugNGHWr8mo7iOI8UsUSGY0ZQ7OtZz2EFBpIXEd7Qs3RsKrWPIP10DKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXMF9R6jGg61v8QKDnMhv7plz5ThUwcWE/zU75sUgdExblFpKj
 bEOLdTfUzfgvURwXF/wVzFS06aQdLgapqmbd70UbLylmzkcFHuUXazbZ3/WVSKX1WRrFWriZvBi
 Qx+0SeQ9T6VYOvxh/THvJyW/eJ4bMPZBNUYI1m9yTxhpn6Pxh6hPvHU3RjXeWWoDLGeSeRlKC4b
 B7FZs=
X-Gm-Gg: ASbGncuv+0/cDf1cMIvRpgHT6gEKIRviOMmYE3086pPge249M18VWcke1nCno+BlCUe
 XlfW04D/timhRSRtk4e7iRWtDlR36MPSBISgCJQyVnFJk/+5r7TS4eqahIsMxVV6Gs1dHRoap/e
 Ak/PCz1KDg8OFL9vfvm6atM5KAJvJIjqCplLLTfWdtpVwn3PTW2Snk5wKRrKh/j+y3XXiBBCVrc
 G/zHw0N6wHdzJHDYNvbTKuuii5JfLeKZqge4sHfeN8LMm/aS66b3cduH3zkzT0B65DOVqjTry0g
 FNeDC0dY11ctJJvMsZnL7Xlf9eEXg3O1OzRfOQV87A4MJzg+RJoBy8zV8LOcJxJuU0O6vILOF6f
 DrYvnej+xuTTr3OgAFLCxiCfXqB0/qc4=
X-Received: by 2002:a17:90b:3fc4:b0:32b:60b2:5fc6 with SMTP id
 98e67ed59e1d1-32d43f9568bmr9615679a91.18.1757329215719; 
 Mon, 08 Sep 2025 04:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7lI3U3SPCn+R/cTeBjZmrLv2/beqgvDHxI/eyb2oUf8c78PZXedihCbA+yCj1T6jDeNNjYw==
X-Received: by 2002:a17:90b:3fc4:b0:32b:60b2:5fc6 with SMTP id
 98e67ed59e1d1-32d43f9568bmr9615630a91.18.1757329215136; 
 Mon, 08 Sep 2025 04:00:15 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32d89f32ebfsm2430310a91.0.2025.09.08.04.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 04:00:14 -0700 (PDT)
Message-ID: <c30b4f6c-3871-48c6-8836-a087b5fa80ce@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 19:00:05 +0800
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
 <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
 <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C_nurbrjwQ1szHAn0Q2rrwZDPDKtSYBW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX8l8Tn5bKiWie
 qApwUZWCFU31yHV61PNHize6fOJrjpuU7rlB2glBEqa8s0A649detSb+Y0gwe8pgcZeh/MPpqy5
 GIP5OUcZqrShsw3Z/uVNamvLnKNfuAfpYb1gIMll6n92cNlSvGPhirFsAjgR//kQx4LF06tRyyO
 9OamMsNJq3KWMEaEgbbDYDdpM+TzUl9PkosRBC/raT5elx4s0DTCdcRvxLPWpRoAlNS43ivpr2w
 Rzl53tPIvzdWdsDJPcri0BqVtZ8W1L5sl5Hsdwn0CVszrEQqiK45PYxFSK09f3JidtdH89JbH+V
 nk353yuuOaOx+FwhoJcSs2EjvUb5YLUw35oXUi/s05Xo4CSXupjrJ9PqyHp8en8sor4VlJwD48o
 uSWFDcLl
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68beb742 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gsM-oFm3a_Sh21p_ijEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: C_nurbrjwQ1szHAn0Q2rrwZDPDKtSYBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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



On 9/8/2025 6:04 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 05:46:30PM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>>>> Add compatible string for the DisplayPort controller found on the
>>>>>> Qualcomm QCS8300 SoC.
>>>>>>
>>>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>>>> that supports 4 MST streams.
>>>>>>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>>>     1 file changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> @@ -18,6 +18,7 @@ properties:
>>>>>>       compatible:
>>>>>>         oneOf:
>>>>>>           - enum:
>>>>>> +          - qcom,qcs8300-dp
>>>>>
>>>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>>>> new one?
>>>>>
>>>> I think we can not use fallback to sa8775p, since we don't have DP1
>>>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>>>> really used). So in the hardware, i think it is different with SA8775P and
>>>> we need a new one.>>             - qcom,sa8775p-dp
>>>
>>> The DP controller is the same as the one present on SA8775P.
>>>
>> Yes, it is same.. I just want to confirm again—even if we only need DP0 for
>> QCS8300, we can also use sa8775p as fallback, right?
> 
> What makes you think that we can't? Let me repharse the question: which
> part of DP controller (single one) on QCS8300 is incompatible with the
> DP controller on SA8775P?
> 
Sure.. got this point.. will update next version.. for the single one , 
they are same...

Thanks.>>
>> static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>      { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported
>> = true },
>>      { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported
>> = true },
>>      { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported
>> = true },
>>      { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported
>> = true },
>>      {}
>> };
>> .mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.
>>
>> Previously, my understanding here was that we might need a new compatible
>> for QCS8300.
>>
>> Thanks~~>>>>              - qcom,sc7180-dp
>>>>>>               - qcom,sc7280-dp
>>>
>>
> 

