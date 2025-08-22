Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A8B30C29
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 05:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122A10EA4A;
	Fri, 22 Aug 2025 03:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIUevZtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83DA10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9pIU012420
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pxpzoua12tLHfrXr6eKWYcgK4UktGakrNy1rHaxMHtU=; b=oIUevZtkPPeTB/UH
 YpJ80T7C80wc+AKIoXrr3blYkurTWLt+PF5mmTnnCJpBZmIO0e4gbKW1haIe2AoE
 YUD/GasEdqcoTsVf2f5bikKExuslSe7NSEDq/+G1UDM0eH/lxRcCEaiwH0xILAud
 eYDLxIqxWvBQE07yTzddOrtblZJ5tjmMaqF4a96by5QoqWtPZqcZqmCRIFJ+0tHu
 ZchrKhfBf5k0q6SMeZHD+RPdw1R3TqgKjrcN24r9h0r/HxxgBg5EuNp4wRo2SbhG
 vxB0H6AxmkbnNZeJdXtONen9a3akJjtGMIOR9TMmaSI20x4aGfom80A/pEmmXOEb
 d357OQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528yjmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:07:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e591846so1595763b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755832026; x=1756436826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pxpzoua12tLHfrXr6eKWYcgK4UktGakrNy1rHaxMHtU=;
 b=sw+jqyu9Q6ainDxtP0KAyD9sehBcIomEEarqt2Z/nBKze2vLATe+mSvgCRUOMQcwmQ
 ZhbjlOXcQv9hVtDDwahPGiSyG1TPMIXxw3qE5oH+WDlnMLnIWnN/S1aFwrWejlohTOHe
 GEw0SfguYAN2SXvJafGe1ttOnrC4j8NZ9yJpFmvfzOfXL/WZ3w8cXfLyw9g2gfTNUOKy
 Ki0BmFQFYePy4mA/HbMr+LpTh04mkIIdBDGRQR8T9Lcj5Q186tDuX9JPBJ8vC6zLUPBE
 udNOd6wzI2K93XtK72/GnWIGXLndcDljGKn+WjydLJ02kW1LM0IJY449ImwjO71JtdEP
 9WcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfWlwgzqAMW+pu7dZh664G7tcP9d3PSZAuVIB+f59KvKZjhbPhIDye/RExTidTpHAdqXRdhcTl1rA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSyiZb3j4T0CGwKz34RgDIU743B78DZbOIRLFeHW32hNLg4wMc
 9VrKh1Pdpmsla540GxWtnzVNcfhAUG5PJIQlYTYLMQNtKDNass4nDViD4DQEODEnTU4wK/2PRr3
 TtQ0VsATAVPuhczh3boqVwG8ecw6d+SOf9cRy7HixaoNBk/fsv2j01Pow3B//T3JZZXk4yIU=
X-Gm-Gg: ASbGnctrRN4ybgp6Mw8E2jUcg3vuMN0GwdDWMeqms/QlLAvhJ2+6PCtNg84aJY4ZyMS
 knhXTAPxGPJnziP4JPQWlKoD+/5UjUZXxqa/UzonaXVkpIyn7mw+SyfgMiNY49tjCTWGvgoUSmj
 MYwiU6aObLGUmuGOCsjfdhjbGLF7bLEMJNg0e6ibyLoISKCetEwX6Zy16rTYFWh/342eLAzKcwL
 S4ezwyH1UnyNodhjIe6HX+7toouLEfdMTlQqa8K9W3i7dOsWO4QQV1VaY6djMybk/T6dAqCLHgE
 vvk2IHuydg8S5clc7zqBu6xAA9/W2AhGMHZvNRhwvGMtCoxUFWZByWZzNydNYS5BSg1fYydv2Bg
 P2I6Tg56j+qmCMKNhKJCHnTITkqykjWo=
X-Received: by 2002:a05:6a00:1250:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-770305502d9mr1704506b3a.7.1755832026276; 
 Thu, 21 Aug 2025 20:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1JA2VCDcV2+V8VJTmn9OkNnFsSh8CLqRYnXkRkboKjGmu9lPcU6GL20crR8lgOhhfna8V2w==
X-Received: by 2002:a05:6a00:1250:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-770305502d9mr1704457b3a.7.1755832025754; 
 Thu, 21 Aug 2025 20:07:05 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d54e0cfsm9319484b3a.109.2025.08.21.20.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 20:07:05 -0700 (PDT)
Message-ID: <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:06:58 +0800
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a7dedb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fJEs4nZSSkEPFCngLhoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6Ft5zLiqmMJ39lUClMLUTSIqBJFygmrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7nm86HvKe8xX
 l03U9cbFVcerZ9UiDwZYcH4+jA3gt3O5aYf5Wi5nPQsy3qrM4VYPymY5M0k7ViZtvMbmkDXLNVh
 zE7wc7VTLxgQw8Altvt+e/26I/+bQRY7aNAoyRc9kEh5Rl4zeqRilweGLC+lj3kynjdkfMEz/7R
 FeSJA6XfddZk+TuXQO7GOf8e9eXo0Vz6TbDyKDYEHIx1fZZ4UlnM23AbNEhPvBFPISsyRIF71Bv
 gIrBJIZmRVBMwIvBdLpnEh9/sXhgHClLJ5p/vFe8CfUwvpYKC2ipJMAE6P1iCubYLKWGDcfBfyd
 mrzJz3l+rIp/Rss5p97V2E0IgNCh4NqvAKG0LYZjpFP9Nu+RCDuW84n+/9WWlMYs5iEQASI2ypx
 FjzDgguPmBdWNXIliju0ydSwrftVXQ==
X-Proofpoint-ORIG-GUID: 6Ft5zLiqmMJ39lUClMLUTSIqBJFygmrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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



On 2025/8/21 18:28, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. It requires new compatible string
>> because QCS8300 controller supports 4 MST streams. And 4 MST streams
>> support will be enabled as part of MST feature support. Currently, using
>> SM8650 data structure to enable SST on QCS8300 in the driver.
> 
> Bindings describe the hardware. There is no point in discussing the
> driver here.
> 
Thanks for point it.. "The Qualcomm QCS8300 platform comes with one 
DisplayPort controller that supports 4 MST streams", do you think this 
description will more appropriate?, only discusses the DP controller, 
not referencing the driver or SM8650..
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
>> @@ -179,6 +180,7 @@ allOf:
>>             compatible:
>>               contains:
>>                 enum:
>> +                - qcom,qcs8300-dp
>>                   - qcom,sa8775p-dp
>>                   - qcom,x1e80100-dp
>>         then:
>> @@ -217,8 +219,9 @@ allOf:
>>             compatible:
>>               contains:
>>                 enum:
>> -                # some of SA8775P DP controllers support 4 streams MST,
>> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>>                   # others just 2 streams MST
> 
> QCS8300 has only one DP. As such, it doesn't belong to this clause.
> 
Emm,thanks, i got this point. So here need add another clause only work 
for QCS8300(one DP controller with 4 streams), and i put codes before
"# Default to 2 streams MST", is this the correct place?

-          # Default to 2 streams MST
-          properties:
-            clocks:
-              minItems: 6
-              maxItems: 6
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    # QCS8300 only have one DP controllers support 4 
streams
+                    # MST, no second DP controller.
+                    -qcom,qcs8300-dp
+          then:
+            properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          else:
+            # Default to 2 streams MST
+            properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
>> +                - qcom,qcs8300-dp
>>                   - qcom,sa8775p-dp
>>         then:
>>           properties:
>>
>> -- 
>> 2.34.1
>>
> 

