Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979CFB392BD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 06:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1141210E93A;
	Thu, 28 Aug 2025 04:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4bGtHj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE9D10E193
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RNR3p7005840
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=; b=k4bGtHj/gKo8gjmQ
 A9eJvxG33infZlCbybUvdrkUHfTeucuGnhBKjiQxy7fRgFtO9KCY7utD1yQ+JdQ2
 a0Qi0JIaofhGapQPGrmZfhuRFSKuIh3cJKwOLgqpYhQaHU9VUpvmDaIkIMTLyVdW
 9RD28ON52PiubJqyM+RayTbLb9sbEdjHsBQspPQ0dTA18tI9tS2C6j4TV/LY9h/6
 heFCPQTDy6mWNg+udOCIy9Ft/5X/MIECfp3m64Eh6NOVStMiK5AYBLGuusENe/2p
 kQA7JXDo2AWC8YWA0x8nNKMUnqRVGShTJhyNHZ+MKYUDYnDvdP8tPmwpnorpubZc
 gwzNNw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpggp92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b473d2f1847so122058a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 21:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756356674; x=1756961474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=;
 b=AAnxnsMG7pB9WiiNx70XjlZFD3SbUGIjtExeR85qA0NvlrmW/JoURG7ARTyPaIHGnl
 UKvaoNthoPQrfi+Drz5TiQnny85OSMYtl+9GH7PjSJJslw8nPHBicYZ8VcrCkiol7tKq
 XmX0oIzMXYTOOzY3InLM1X7C7MJGA6rFs4tKMJGcxOyhlOG9LGZHfiw8H74JyGHEtbsV
 SmiUS6pGRAXEB0gpvjhQFfUGgmFqveVscV9qaGB8GJ5A05lmkn+jxREe4yjJN/d1kv9m
 E2R5onlCBIEGntIPzF2VCeHPYopptP5uuATTNs0dfPbQkm3ocrvkub4V674HCbQhNzRJ
 MsuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM3Owj2vNj9kGEyQJ9wNpSv4HBCj0/e1HuGbpCiudcEXVTpzU3qMIGXuSA71ZgZawht1f5Ut/Z82o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZCBWtKZAqf/laPm1HLWqGxHPMfQOo1dMXtbvG6POaYVv3lQYt
 YT1U3g/ymwhnY4Ea8fgSrgZ2QmdsnKkX1mzbP7m12vqRJoqlceiLmaWsCJa/Y3nCz82rvUdimbj
 Dcv0m38HYgIzYXk8A+Z4EjvyDq/8S1W1Tk0Sqv2HSbmpb/MQNDBukBTqrCTxRFE4bYg64akU=
X-Gm-Gg: ASbGncsbRbucbl/Zhh+BpjXrTjp94um+cD+YdA3CVAgjEiXSnCDiKpkNlqOhOOfCkiH
 9/Qa6ckFDGmyrqpqELqHjLzk1RrzDjZ1cyAZv2SlJ+I195GSeeK3jTrvd1Yz2jsskxXk6chyz5J
 VtMUKVpE/B2p6+H+asnGaR0wfdyFuGnIwjhxEf5dcyNtC9UvYdGJXKt9+dj8SAjllnh1tsBh5es
 Ik56Mv2x2bfoIdrb5VD8tMIzS4JnaQ/rwV6/lrzadpbqGBlATeW9U32ffEGS/z6xbz3vj98lg2O
 NfstBg2Ek5Iy7qn8UhdGH3AJ8L3uKdjwHmudxTd3UUGFWfnE+9jogyvzQ6DUWvtc9/0vpThIenG
 brlz49JzRfrvNLhbMQnsYXzmWL7gcDA==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id
 d9443c01a7336-248dfe02faamr4014065ad.8.1756356674492; 
 Wed, 27 Aug 2025 21:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmRbZMzQhw30/ipLkmYDVQtFMWzPa3KvkwGn6LZpn9/xGeveJfUognFXSqr0kP7nvEeevGgA==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id
 d9443c01a7336-248dfe02faamr4013685ad.8.1756356673983; 
 Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248e3e0b73csm2558005ad.132.2025.08.27.21.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Message-ID: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 12:51:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vsdyyDne0FbxNRDyoMrMpydqd2bV2eL1
X-Proofpoint-ORIG-GUID: vsdyyDne0FbxNRDyoMrMpydqd2bV2eL1
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68afe043 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RRKZIDRkA7xEvhLoEfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX+kHk1zwh7Tkn
 KTj4VpHPxHYXAd1SI/xsh6Rv51LZ0e8rjzCWeRvDegKiZv6d5tsFwbW03nFf1Bcf3muyWYSNP4a
 ag8VVFOwMnyEUtWT3f3hYNSH2Kv+4JOoWdlhIzp59uhmfwocwZbg2cki4gmcLAGlDNIUJgGy44m
 90RQHej3oD40PfvReD1VKq3kedMQUkRsjVXaUtTnQLuhzyEvxp5LdgxZEAC23XWBUtgjPDlkOPV
 Aw4hvmr62sRSw02+yHPk0Le9KsiGSUAH51bREU8vq3E2NhHTNjelRlO3DsSlNr2OuQZFWdDj9dF
 d74wha3wxSlraGMFlQRv33PoYrVJ3HFuZXiqK80o6KhhCBkWDAIkxKGnLI/ZzevsmXbbAx2ioCU
 czD6I/Gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
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


On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
> I assume, it has no MST support. Am I right?


From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources, 

the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>
