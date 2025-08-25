Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11156B3345D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 04:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283610E159;
	Mon, 25 Aug 2025 02:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAclPqQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D243310E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ON018c022786
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=; b=MAclPqQOoaCcJrB0
 MOKE/I3Wu2WONO49XLCWibfXhyT4kk7HWz4BDdUXwcZGmJd43vDuIDOhmKOgSMsf
 rTPWw0qJOXmMHpwd8DlFzLdNo0r5HWxU3dafDTZVQWovELV04R1qTw4zGmFCQFTF
 09j0AAB7jUXLCrpoZiXX0KI4Rene+i4EgyvRqmhH6Q7JpYmUw1UntETvexbx9tBn
 gHtYTzrb+Gm9mnUp7IC2WalxkNXkMo82Rezpsiikz0g/1IfMzWMUCxpD0jE1kpEN
 C612To1uFvuNQxkFV/3tbYbV4lgbRFeRgN6BX5E+FdfNikbbyEdUvHUA+B7Ex7l6
 bZLmhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unkefk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-770562b1ed3so1598240b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756090743; x=1756695543;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=;
 b=v3o+UAk2EV7YZ3WEBM0JOzgP6etQCfkkaZpYP6C5UKXG8106l1EYdFbB1PJ8FOeV2I
 RPdAZSNyXzGk1bXzIqSk6jAFNZ4N2deKVCfhD7Fbrl7cYIHKbs8pcb+wCUvBppEfSWxR
 SUiVNak5SeLg3ruuWNsVKbAtXeX/EgD5omrxKRqg2Mf87T1mAHb990CzlrDwVu24lRR/
 ai7Ho+VoibGJjB3SpkOK1aJc6+wPcskjsFsSkhaiz/81pQgBoLUmlMsbPN/5AJiyfO6j
 S8vx8y7XapAtHr3Zg7dsxxTkrbreRFSM1d6CttpJgi/dyLevsQJiG5Vd/mnhIB38AYnR
 0C6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsBOs00HoUIx7MroLQIPI9TVhtiiA93bhkxtHsW/Tq1IQakeFATFOTQ/Zx/uNz5d6hQxs9jRSb2bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybord2fC2dzxny5ln0f7YHP4Ct57aESw+3s+rzrc40xUMq7mMb
 ewfSOnt0OoE5pji+/1eoZB+5LysRAwYu/5b1mxkHof6gCNH+ZqFn7JNv8EVmJDbwNX/EJlexno6
 br8HErcQoJP98w0iWAMX+jXoPixgMVoZxDpyNFTtkeqbaU5Wg98lDqOLwgRCZZ7N/huvZ4rs=
X-Gm-Gg: ASbGncswDVdFN+GX6183MuerCDO15G2d+AOnzM3osbSUkt6H1Fal2kUa2A8LvNlEeqg
 jLpqjlciJhEE68H/8pkhdqpbdXMlR1tW2Y3cXGwBoAbuzFcnG8bJ0W6u7DV3fvqiPDBKaTaCI/6
 n3QSE99fmJ62qY0qPHVJTHvqJEzWJjoz7XVc4UbELQ6OXgSaR7rUmO0QXQh1dOULKp1Oq04o6yf
 uzbCCsvu6zA+A5aJMyP3vdsg9pGdE7jiaxZk8yD+2VQaGo56Q4W/j66trkGIQsTkI2VUPERUkXO
 UlnFwf9sv3k3W4ByC5QYDAARucS+gosbMjreM9f+9PjBcToek6RnBesvtNmx36NRKYdnlfXYOuY
 YpmjowaobUUTtpV8NVxnrA7BanpvHQSY=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr14178787b3a.9.1756090743370; 
 Sun, 24 Aug 2025 19:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCpI9lwwPj/ghs95Ybuszk8ZhygB0e+mYXnTFXl3eSB1K0RxyvY+gmOa2bAJx/E+5Zx4Bxtw==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr14178751b3a.9.1756090742854; 
 Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7704000edeasm5911077b3a.45.2025.08.24.19.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Message-ID: <65dfd4c2-37bb-4d99-8753-ce17e17097d2@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 10:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
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
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
 <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
 <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3scCCxAUZ1LckYHqW21fK7ord85lMj5u
X-Proofpoint-ORIG-GUID: 3scCCxAUZ1LckYHqW21fK7ord85lMj5u
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68abd178 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2PmUQm8wz_2Da7m3RkIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX45m+Z3Z45bR5
 bKflQTvEFTravxomWtELQiguewWWgl97D2Hm/nkGeUtg2Ug0wUnm++UHJxmpCdCgzVK1If6wa5q
 WGuBYRQdFZAVa/7detwMuII0fIz6PmBgGGjYP10LHEfwN/1VcDFJMrXvijehoGP24grTIEL0+Qz
 uzvHv9eVEXXJbofGqZGze/dTVhjPiT+ziOWtcUvwlY7Hkc2Rw6suz0hhlZmFNAHBomeDOi2D3sx
 Je7V0H+ZUJEbIwwbVpZjaAvsy7ruFEZYgL3/m9vnAITrtFiFrgUTuQX+lz6TwhKZRi20gBikthN
 lUOWDxei09ID/6B/ZoN3qkO1ytSTCB/N2agQErr3TZqlILsrhgN/Ndy2MUhTtcKTOFxkrBujDIA
 296bG3hZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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



On 2025/8/22 18:34, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 11:06:58AM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/8/21 18:28, Dmitry Baryshkov wrote:
>>> On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> with same base offset as SM8650. It requires new compatible string
>>>> because QCS8300 controller supports 4 MST streams. And 4 MST streams
>>>> support will be enabled as part of MST feature support. Currently, using
>>>> SM8650 data structure to enable SST on QCS8300 in the driver.
>>>
>>> Bindings describe the hardware. There is no point in discussing the
>>> driver here.
>>>
>> Thanks for point it.. "The Qualcomm QCS8300 platform comes with one
>> DisplayPort controller that supports 4 MST streams", do you think this
>> description will more appropriate?, only discusses the DP controller, not
>> referencing the driver or SM8650..
> 
> Yes
> 
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>>              - qcom,sa8775p-dp
>>>>              - qcom,sc7180-dp
>>>>              - qcom,sc7280-dp
>>>> @@ -179,6 +180,7 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>                    - qcom,x1e80100-dp
>>>>          then:
>>>> @@ -217,8 +219,9 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> -                # some of SA8775P DP controllers support 4 streams MST,
>>>> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>>>>                    # others just 2 streams MST
>>>
>>> QCS8300 has only one DP. As such, it doesn't belong to this clause.
>>>
>> Emm,thanks, i got this point. So here need add another clause only work for
>> QCS8300(one DP controller with 4 streams), and i put codes before
>> "# Default to 2 streams MST", is this the correct place?
>>
>> -          # Default to 2 streams MST
>> -          properties:
>> -            clocks:
>> -              minItems: 6
>> -              maxItems: 6
>> +          if:
>> +            properties:
>> +              compatible:
>> +                contains:
>> +                  enum:
>> +                    # QCS8300 only have one DP controllers support 4
> 
> typo, controller.
> 
Got it.
>> streams
>> +                    # MST, no second DP controller.
>> +                    -qcom,qcs8300-dp
> 
> Missing whitespace, drop the "second DP controller" phrase.
> 
Thanks for review and point it , will update next patch.
>> +          then:
>> +            properties:
>> +              clocks:
>> +                minItems: 8
>> +                maxItems: 8
>> +          else:
>> +            # Default to 2 streams MST
>> +            properties:
>> +              clocks:
>> +                minItems: 6
>> +                maxItems: 6
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>          then:
>>>>            properties:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

