Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3AC0001B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653C10E8F1;
	Thu, 23 Oct 2025 08:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZVvmyj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B6A10E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:50:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6takq019818
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OMKnxUqr9ND8NblLPWP0eOPZ9cYwdnsAwoYbevDZ5+4=; b=EZVvmyj4uFp0R2fV
 JeJ9KNrnXx/83rEAEnhbduhhXJ99Kz9VB4IwkB44smUXQJ61Ej3uHLYIhjIfg+Ka
 o20JMyUGs7c0tnD/nCdncT1JC0H+FFnLrKXrVoSrAMx3CDt9ZOaUX9HNlkKRy1iO
 BULRdNblK2EJ+nquSe8IbbkIivsTwtz+mWS+MP28n3A7Ep6uKFWOMSuwNLk5TAU7
 k6g1juL89YU+pgWjffzdYbirvq7TA6Lv2le6RLIPepwMfPHEdyiOSU80GcNxDfAQ
 wVL1P9MRhAmwWeSakT9qRIXYNQwbijIVCTFHgNyu9pRAkQzp5Kd0veskwt1eVe2o
 DTFQYg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsda7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:50:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a272da5676so209318b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761209417; x=1761814217;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OMKnxUqr9ND8NblLPWP0eOPZ9cYwdnsAwoYbevDZ5+4=;
 b=BAaOan2+Un4A+7/FhD+i/FGKbEmRsL1YFyAl0zzG9RpBUA3j41rKy+v4/AQO6gd9jY
 xCeWuM8Fr/zO6qwRRXRISDFVQAUWyNHANjUc2D636UgPuqY1fbUmd+TTo2htqWCYKerl
 4bE5bwgPZLdt6gJVgcKkUYTJH7gpvekv0CFwYgDUqO1wQDkGSOPd1erq/EStnNFH3uSj
 OswCeUqEw5HNo2SslXJfpiMTqkGkoeNOm6EPNBE8QXpFn4RGaBN6rJBOriv7DHbdQVqd
 ky5DrmuzuZLHbrnhUVcG2rpTbrmX8hZfaG1t+Jl1sDOMuk8PGF294zOqfOi9swmppQ89
 /Ing==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTMmVu6J8adpL+ScGTtGF48rL4KH88p/Ld63PMO25AhE7D7MNnZMRX4OdtCGWsTFxsEBOlpNpOpZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy25fClIHQIiTt1xByN64QPhqbEzHdwXX/2i/aG2hrM6Zf8yWvx
 skcsXhEB2Ka99npNg7qhdjHBLe+4B108DYKaxqp2K6uD3X9SBHhEX+yqtpCYrO0t/NU2tohIzY1
 b7iRscMe6z1h0oRNP+w5eclyDSFmax2HxjnGWwx0jeS/WUVNEgERV3KTSPXD2FTj15DdAO+w=
X-Gm-Gg: ASbGncs7idy+OTHneEAQSon/91FxbYW+1DlCRihH7bctKB6IAvbWncA5vZAiTn6pyYz
 koTxiFhBygdERP55qLtUI/hW45shs8m1dUNuw/74ppxCH6QEzcw/spuC3UjdXI6FhZzH+lgl6s1
 uGbuiUXSvqJDpBlpV9Kqk8vb2LLhbP9Qd5rrgQ2KqKaGDLdL/fJH1hyat9mSp1ArbG1y6gHT4+U
 6qqVjff8x3sknWa69ImIzWLyAhZ+w/ivcWB7tX9eORJh7P63Nvcql0NeEdMSIuoheHwroGc1As6
 I7/Z+6gK3EL30zyldOVljUwSDe9WyNiyOWSEu3AVwhS8B1Qs1Xql79tbYjbBB0Hj/M52vAH6xIW
 asuNP/GBrFCqkvoJr0xcqAfyPouKQeGHFSaaoCSpp/AzPl/FRCuvvCY31JlvbxEYO5yvrrg==
X-Received: by 2002:a05:6a20:d80a:b0:2b0:ff55:f838 with SMTP id
 adf61e73a8af0-3393189436bmr6910790637.3.1761209417380; 
 Thu, 23 Oct 2025 01:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMne+EgLkcUdrIkI1VqQAldalOI3LplCWH+quMwYft+tzjn4ldU/yUSpq3PbB/3w7ARbB6QA==
X-Received: by 2002:a05:6a20:d80a:b0:2b0:ff55:f838 with SMTP id
 adf61e73a8af0-3393189436bmr6910774637.3.1761209416844; 
 Thu, 23 Oct 2025 01:50:16 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a5fe26sm1800703b3a.2.2025.10.23.01.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:50:16 -0700 (PDT)
Message-ID: <d048a875-aaa7-4db2-9ef0-daab94bc123d@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:50:07 +0800
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
 <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
 <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX4gt6uIbbQwdl
 n7QNuSE61agMw23tuv4+yLiskAk7Bv9hTTlE3oO75Fwxtqr/R2gb3A7Zgy6H49OMxKs2toHY1gi
 LwdZyTzclXyXX5/6l9mGbhZo4PgpOLcsUjaN7CwWMjJafyPGsTL2NKKRVBA4lSC65Rc3Xw0UbaF
 JC4EN31ge0QuqDbB+UWsKbkw5X8PlSB+eY0xUnAU12mSXHbS2Ot+Fr/wcQJssG4D/ItgRIBeQ4P
 ShYt1UzhsokN9S2LkVWxNHEuY1zh2+lN9ur54e5mRptqIqMNlN9k4XEQ06W2BQyXffNOkr32k6s
 L+CUwLTweO5sNuIVv91Gx2wbnxNsc2xI/5BbbV8kOcsOs7cexTJKRAqQsUTyePxqpTcnqe0GZs5
 NbQgopTvyV3MrzIDxAJtorwRgDBaQw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9ec4b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Yf0QdHFY1VziTJGLG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -_budbAkY_hllHzLfOVm4qlGPRSxUBWv
X-Proofpoint-ORIG-GUID: -_budbAkY_hllHzLfOVm4qlGPRSxUBWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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


On 10/23/2025 1:10 PM, Dmitry Baryshkov wrote:
> On 23/10/2025 07:50, Xiangxu Yin wrote:
>>
>> On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
>>> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>
>>>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>>>> compatible with SM8350. Add the SM6150-specific compatible string and
>>>> update the binding example accordingly.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>   .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> @@ -51,6 +51,16 @@ patternProperties:
>>>>         compatible:
>>>>           const: qcom,sm6150-dpu
>>>>   +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,sm6150-dp
>>>> +          - const: qcom,sm8150-dp
>>>> +          - const: qcom,sm8350-dp
>>>> +
>>>>     "^dsi@[0-9a-f]+$":
>>>>       type: object
>>>>       additionalProperties: true
>>>> @@ -132,13 +142,14 @@ examples:
>>>>                   port@0 {
>>>>                     reg = <0>;
>>>>                     dpu_intf0_out: endpoint {
>>>> +                    remote-endpoint = <&mdss_dp0_in>;
>>> Why?
>>
>>
>> Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
>> It seems the two-space indentation under port@X and opp-x is the actual issue.
>>
>> However, that part was not introduced in this patch.
>> I will split a separate patch to fix the indentation there.
>
> Note, you have two different chunks here. The first one is useless as it adds a graph arc to a node that is not a part of the example. 
>

You’re right, I verified with CHECK_DTBS and it passes without it,
so I’ll drop it in the next version.


>>
>>
>>>>                     };
>>>>                   };
>>>>                     port@1 {
>>>>                     reg = <1>;
>>>>                     dpu_intf1_out: endpoint {
>>>> -                      remote-endpoint = <&mdss_dsi0_in>;
>>>> +                    remote-endpoint = <&mdss_dsi0_in>;
>>> Why?
>>
>>
>> Ack.
>
> Use YAML coding style (two-space indentation). For DTS examples in the schema, preferred is four-space indentation. 
>

Ok, will add a new subpatch to fix DTS example indentation.


