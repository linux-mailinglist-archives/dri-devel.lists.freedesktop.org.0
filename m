Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9156BFF2B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D2D10E362;
	Thu, 23 Oct 2025 04:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIcSRWEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8832D10E362
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MJ1YGQ011783
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=; b=nIcSRWEFb7aEhO+D
 q6Z+7bd6h3rxMt5LxnPxQbTmDBCYHOqF0a2m5IO2Vml819e6lWWsUDbj769GE+t7
 CF08aLfjQ7L7kOMh1odWpJKIfP9yMfnGanczhZ12rJ94HMu+5XiAS14Qgg3Oy52L
 d6BwRafCPlqhx8CM/S2fl7yUpxcENWIX8JGV0qhyKzdsdPq0ySH9aL3qau+/RKbI
 6fzTJGkcyjKkqlH39vRh/MMKnzcuIVNTkdgfhf683FlPFdyWYxDoTBZIgBZWOI9U
 CNcY4Gg57FZgQX2DK973udaTKSnCHW5h/C+hyxt+3FEjskbSCQ7/WUKZX7cARB+2
 JaPl1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y52497ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2728a359f2aso1467275ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 21:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761195009; x=1761799809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=;
 b=J5XObM9CQ8kNfznqWz63/O2r/HfjPjJ+YqHmxZZlmAYze+bdLQRvUcRvEGpntDZ87X
 NJ55nSlL6H5lFdugG2L+WAPkuTsWZd6TKNxTVIEGA2cDU+89huiYBPn0GrAM/rjw+fj+
 4TahAu/10W9HLP5Zlpb3UmFoSuWHalYj/R9KJIhoKQo2uWPo8/GXknGEd+w7cX0NLAns
 3x2Ki06eKHaNoZD2ZgbKXe6pb3AnCHQtWg//H33JvNzjGjyjaVgIKzsApTRcR12wy1y/
 FlMrUw5LIIQgIbfOut3MjLmPzkgL3z78KfG3H0S6+PRRutOnWZ6PM7NP13kEtMVoqZqU
 K40w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeYTR1NUy2LHbp7cuXKm8oK7guOgWY44XSfyugHJ9ln5zdg+H752UiYF6N+3rTHU29wNi7NFAIpl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs9NYO7bpMmsHgHWNTqzH1v4344hj+o6eOOrtnQbg2zOzuV0vc
 09qavsU5+7uE6aC44rVQQ/5OO1DFW1kC/m3TeftN2M5SzPD3gAeJ9CWREtNKmnsWpqMk+2ASqU8
 O3r0SJzRtTj6/ESbq6vN1sa/SfpyF3SYWmc6cIQq4c+mUwgA4wdSNgYhRenAXwrbnzyZE/fg=
X-Gm-Gg: ASbGnctS9EHHpnpmfcFufASfVdZIykXa10/VV4RheiQIgFdPmXPkyCODFfQ3FaGm/yi
 PnYIXnBGz2jxXu5AKRN/KidD9lw9SYNUpyNLEyzKB6n57SCQhdOo/NV4N2X1qABQAV3/2PGXR44
 njR49/FdmSXX5e8F03ud9YkWj1tIFeCj6Yu2XztqMXwWcbIXLnOrKUa6mVI0nP8hZC9kbiISRax
 tNldeSboHtmQzzQvBy26nI+dTObxS9Tqouz9PuU8gGhsHzlg7/CTHa/rm4mtF+Df/Wwr9dO/MzT
 mbjkPGiitoMRI47spngqVh0c5gCZ19nulkUxUN58WipznK/MFTqDBzNTlviARkgfni2UAUsyRby
 fGaAtXilau+eEvLgeaF/11plVuCxZph2ZtI7Wvbi1OocOJ+jmtvFkH7iBirBDulv3TT2Kuw==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id
 d9443c01a7336-292d3fd9a38mr72508985ad.10.1761195008592; 
 Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJqjQ5VJXt3VI85Iu5u10F0hg2Fj8UlcAw7hs/Onz/30KSLJIC0RZtQJ73mpgOW8HVaN7wLA==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id
 d9443c01a7336-292d3fd9a38mr72508645ad.10.1761195008139; 
 Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946f681eabsm7873065ad.15.2025.10.22.21.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 21:50:07 -0700 (PDT)
Message-ID: <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:50:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX8kNrebUWjHHm
 JIjzDiCuT/4H1i33to+Kcm6QmYFPqLiwyTroRdgu3JgzGJumNfVNCNjW0h2GVpkjra5wKxYttvQ
 JESoEc58LuViaJZIp+2mEXKHrHdF3nbWpSZzL4mWBLF+HPpsNF/2BplB+RD9uqImoQUpyxv+4FJ
 sRSUqwqffUJqzVvtPN4xfhrKjGvWxTI+7UEyQ9cv4WsxO4DBPf3aPbAVBzyoFVNqKs+a5RDJkMD
 zY3NMPfZRUfjEY00e1YMcxhwII/7WAnCNI5df3M/47cgbZTOj+70DjV3Z1QEjkshuLxeAQwQ1FF
 LNU2fk0Wq+09DhTp9YkKVfL7Uyw5gyUUxoqjisYzmV3JZ7LSDL/95suCtSHfmrz3f44R3dgC66E
 pS6b0BAGNdnpa4RnCG6TXYyc6pzHdQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9b404 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WzllQ2DKJnOsbc1lEq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: O10lg70mqYC93Uml6Yo_gDgBzC-g7qFD
X-Proofpoint-ORIG-GUID: O10lg70mqYC93Uml6Yo_gDgBzC-g7qFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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


On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -51,6 +51,16 @@ patternProperties:
>>        compatible:
>>          const: qcom,sm6150-dpu
>>  
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sm6150-dp
>> +          - const: qcom,sm8150-dp
>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>> @@ -132,13 +142,14 @@ examples:
>>                  port@0 {
>>                    reg = <0>;
>>                    dpu_intf0_out: endpoint {
>> +                    remote-endpoint = <&mdss_dp0_in>;
> Why?


Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
It seems the two-space indentation under port@X and opp-x is the actual issue.

However, that part was not introduced in this patch.
I will split a separate patch to fix the indentation there.


>>                    };
>>                  };
>>  
>>                  port@1 {
>>                    reg = <1>;
>>                    dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> +                    remote-endpoint = <&mdss_dsi0_in>;
> Why?


Ack.


>>                    };
>>                  };
>>              };
>>
>> -- 
>> 2.34.1
>>
>>
