Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F61B27AFF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 10:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249110E366;
	Fri, 15 Aug 2025 08:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCqflBFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688910E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:30:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F8PQ3j020726
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QebLpSI7tQ9noZzURxHg67s2/5ukonRzYWMzSKVz+Xg=; b=pCqflBFJI4IqiQ7J
 HAF4OUAeQSJMbu6j2QR79uhzh75gp1YDNzUce44AdQJCNtPBF7Txa+f1OWhxnQ7Q
 Ir/aEfuVoO8h7MiA/x5gsQduEhmU1e07d0jDDFtpliAfcgXiUv3NAcDCKsYIPWPX
 w4N8t1F/FnXCzZ1ZZsJ60cEloUIVEyu6CmoncWyhw3rd6LYAu7neAGPF6EkOFxFA
 OjvGRXuztpmbshrF+82QwLztQApw5+mprN0HS9eok6kTnVWbyag7qNuOcAfuEe4D
 XcP+U7gZHlrpSYqGVoe08yHXbd+IP6pygO00Col633buA6d6UoAbzOyrgwoliyk7
 mFfQUQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t2qxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:30:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-323267b4a23so626328a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755246617; x=1755851417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QebLpSI7tQ9noZzURxHg67s2/5ukonRzYWMzSKVz+Xg=;
 b=Wc3cBzu2w9x1S8Mwvnb8jLXI004SSFymwRLRNnT29LAAnBPqsgufCDCDXpBrKGndK4
 lU4yAF144gORc3y5SVuPhZIlXux+f32Rz+tw+usSCE7rmmWJvxtr2/1WPH3F54cz2j+6
 2d9EaS+lVwFQVuJXTmTCqv8sba6iJXQYPiD4Uscr2J+w+LGz0cJaNlj5zZLCs0MJCF61
 7dT8NkgFoGy7wfnynzB6fPO6B7qSYwM3wZ3GBbHIbnj0UjyeUb2uiJbIR/sfwatGxl32
 Rr9/+kF3/Y2b33Jp3YCLDwiQC+Uug/wp9KTGwoh/JWsIS4LSYkSNvKd4IlXoDl0K9NQt
 Gl3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfRghLsJG1wcQYeoLtDEfhZu9j2LXZFJAJtWyYnKGJ1V/7mvnzWyNhmZmPLKp19ipJV/nWkDnaNOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjFYOOegDTz3vkfU9GvPlMXdSHbbOcZqnNJ5sMU2mnGDlJecVP
 CLvRYsJ2N1N5SHq4+tR3rNtvuWFzGZKKwfMXd25CJoGxrCmiTiI9xKEgCCNhDz3YbVO0fnxzdlY
 ggXc6SCwdzhadn14/ohygKNdInsfvd/kup39NvYTngFa697C1dsin0lfm9zWdoZI/ZRgUDFk=
X-Gm-Gg: ASbGncsUUU0T83LPZLmaUv+OuSVmKX3pQSUJDbnhRop8CoNJfPSC2gy10YKUkj/WFoZ
 kyEC+42F7dbhHS6smyIGMumIUCOxpnUMQaunTPsrtcyFissNPoKTg9g23aifQyg2Qf1LXWXKwea
 sfwfugVIw2VoFSZKkSxm2cNyTBdehvMT+qOFrX0yMMSDwHrG3BJg1oYF7362gcgq6ZufnrAEuxv
 EAFgf8+7rMYe96kfP8AfOwHahojbXrhz0utJrLUWEOQHwqXZ1I4XMl/oDRZlU6ZkOu6t9TYkWbF
 cyQIxaPkUgSBClZMUwq/2LpVJOeHaCd6u7WW9Vt9AVp+FqKxmbukteyAy+uYs/JmywISX7Qs6LB
 YOen8slXJ0G+L8dJFGIYTt/fNl0Sf
X-Received: by 2002:a17:902:e74e:b0:240:4b3b:333c with SMTP id
 d9443c01a7336-2446d91f8cemr8761355ad.9.1755246617102; 
 Fri, 15 Aug 2025 01:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFln2KKznF1Tps3/NqBK7l91lHgqA0O4rpjpbh31rF6OlDm0+al8oFnjA7SdlXStf6njF2Khg==
X-Received: by 2002:a17:902:e74e:b0:240:4b3b:333c with SMTP id
 d9443c01a7336-2446d91f8cemr8760865ad.9.1755246616572; 
 Fri, 15 Aug 2025 01:30:16 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d57e140sm8982125ad.156.2025.08.15.01.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:30:16 -0700 (PDT)
Message-ID: <f330e6a4-ec51-4682-aa35-bef9c6e8ad3a@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 16:30:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support dual TCSR registers
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-3-42b4037171f8@oss.qualcomm.com>
 <2fd202a6-2c92-469c-81c0-8852562d4e35@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <2fd202a6-2c92-469c-81c0-8852562d4e35@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ef01a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6sAUhDfBEk1Dn3Xrvb0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8SK6i_N1Isc-EmhSNc2V-F7AQvEuNqoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX5W2RDHlWRet0
 NsOVB255eCiGbq5us1e6mTD6IXYBX/gTV+bVG9pWzyejhFWz2Rd9ciAYDL+brDiXAgYbiAIHV72
 2OJbMTqT2EC6m4ylTxV0ZO0VBNWarexJaNi0c5D/KYH9Npevztac7QZDzb7gTYkA8UzD/Z4Mrgo
 R4KCtC/WcRXJt27QCW22XNFrvqIbExZKuqthgAos1MHx+ZtPKgUUhYpte0JCZ/xcblhKjR/pYQO
 WQ/C/N4MQ7SORKJnejE6/InHjRyh0NZUjDiirbAj8T93kKoHlUQ1m1LWjGoTX2ND5ef7zmn4F01
 Q55Pnaj8BZcQfWxD7lGcSE1eF3cai8QxtUg+SWFzwSwAN7ak7ebhyew50zXiiRKfxJxy8piDU7I
 oShXcOgi
X-Proofpoint-GUID: 8SK6i_N1Isc-EmhSNc2V-F7AQvEuNqoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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


On 7/22/2025 5:19 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> Add support for specifying two TCSR register addresses in the
>> qcom,tcsr-reg property to enable DP-only mode switching. This change
>> maintains backward compatibility with the original single-register
>> format.
>>
>> Also update #clock-cells and #phy-cells to <1> to support clock and PHY
>> provider interfaces, respectively. This is required for platforms that
>> consume the PHY clock and select PHY mode dynamically.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 28 +++++++++++++++++-----
>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
>> index 1636285fbe535c430fdf792b33a5e9c523de323b..badfc46cda6c3a128688ac63b00d97dc2ba742d6 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
>> @@ -44,13 +44,21 @@ properties:
>>    vdda-pll-supply: true
>>  
>>    "#clock-cells":
>> -    const: 0
>> +    oneOf:
>> +      - description: Set to 0 for legacy platforms without clock provider
>> +        const: 0
>> +      - description: Set to 1 to expose PHY pipe clock.
>> +        const: 1
>>  
>>    clock-output-names:
>>      maxItems: 1
>>  
>>    "#phy-cells":
>> -    const: 0
>> +    oneOf:
>> +      - description: Set to 0 for legacy platforms
>> +        const: 0
>> +      - description: Set to 1 to supports mode selection (e.g. USB/DP)
>> +        const: 1
> I don't understand why EXISTING platforms now get more clocks. What did
> you change in the hardware? This you must explain in the commit msg.
>
>
> Best regards,
> Krzysztof


As discussed in [PATCH v2 02/13], I misunderstood Dmitry's intent regarding backward compatibility in v1. 

This part will be dropped in the next patch to avoid affecting existing platform configurations. Thanks for pointing it out.


