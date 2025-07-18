Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C4B0A8AE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AAC10EA14;
	Fri, 18 Jul 2025 16:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ylh5KbBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92F710EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8MXsf009880
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=; b=Ylh5KbBs/AhTwKD8
 TbrkOekYjnCBffFWkS1xyRuNgd3RfyLJQRqK4iObww63pTiV4qFZMZw4es7MltOv
 g7LWTunJ6cl9MVutvxCqXrg0tKcrVAe7dKyhKLo8bRwitwrVGRHgBdllSwm9Dk6+
 mx4rNbY/he3TeIme6GtenjG0hdJ9Nfm8H8+spvFVPS17LMz4HBfivSFsLyuH+oVj
 5rI6ZIYATcmEr9QKCMbatIjr/6RFPq03ut4ztcNVD5A/3/eZXoRUK0AOIqcJQ5HY
 u8xMCdpBvoxgi4jJt4jdcXt5ojaIF97VkUEiTITTvxS0Ce8hUoYaPq7XtnSEOUjI
 AdfVMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbcadr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3138e65efe2so2070148a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856996; x=1753461796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=;
 b=axKhxJbp79n1q1fZmAfXzIE1yxfVdpx5+vMRutzqxh/8flPcwoY+dMVtkPcP1OhHm2
 86C26whSr8Z93lA1ANx+XRl32RHwr/UYn1TWPbWmrkQb1Jt638WEJqHHBb4gi9bDUlMp
 YMYBa1LCB4ztBwt7hUiUgwcB6NbiBA0bz59i0WL9mMQD/bT+qjYoY918gDkAliFzgefE
 HaxAeuYssU5ZkpHYiCjOm9dEtfBrafZgqUCgD9D1sCEKf4JrdK+OMtD2xu/lwef2UtUw
 0EfLcVwDwrgpJe0lGNhJd9s/9lTeSQRVL3N9EE5lg+nijtBiB8yXlINBBkS+gYCLYIUU
 aTAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsJBmLYKig0h1MFCr7T4+d1MCLaW/uN8ULBUcQnCXVoYdusOWjzRXGgqEZGgY3Jdub5SsVLDHzg2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1A13wxUX/75hXO0DDhOEDAueih28+X48LA6jl4CDBAURW0ea2
 Upo+2vP1i3Cka+iwt+qLa6NT+DW7HXzmpfU4o9tipRrZ5dVBfHCHsvJe/JcxzuE/wMUQSci+WbI
 5ea8QOH8OReh/f2ZGOW1Nsct3fah10VNxM9M6COuyg0Ggvjw9SiCv17rC01Gpx/O4AWp9Yzw=
X-Gm-Gg: ASbGncuhHx8y4ap7/VN8Eze8Lu6c9CJyTxMkPAePzK6LVaB1B8ixm37Wa8h5jR3O+s/
 ho3tYALDT1BTLgkBXdM9yr/gMkQXIypg5L3isq+QSnRiBrMPAOFPwMn8fulmHErj3h43DmPGSgw
 pbD661LYmi2k4+L9DYnkadAxfcirHgdM3NWczaHCOCIRE69W1g96E4hMgWSmCDb+dIo/aURAFAD
 vQhavjuDyEKME3EPrY6FcMa/UoKltNXMWvjZOzgdBJmOTTsYn5o6n0g9s3f5GOX7bxJ2xcpxihe
 9uSJTm5z2/rsPhkuaPE0DISTFMEdbS1NJ/8hA37Qa2EiM50q8padxWKhno+SSJDB56cpeBiO+gX
 B1THRqaeFUlGLbCK+vDFrWg==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-31cc2515a29mr5615563a91.6.1752856996015; 
 Fri, 18 Jul 2025 09:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+SiK5x4mKGH5S3TmuPOs72xqUJSROCjvf33zej2kjfIp7ot9LWhtsKx+NbT7x7Y+uEruIVA==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-31cc2515a29mr5615498a91.6.1752856995510; 
 Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e61d2sm5340211a91.11.2025.07.18.09.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Message-ID: <f59a6654-e04b-4caf-a570-16016fa4be81@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:43:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AeluFfwrcSuOcl6Eddpcc2hqeGx1M21O
X-Proofpoint-ORIG-GUID: AeluFfwrcSuOcl6Eddpcc2hqeGx1M21O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMCBTYWx0ZWRfX5p63ZYCOxjLI
 fJdjWr+mj4ol5OlbveXQHNSrMOwMMp2bJ4gZmx+n0tdw8w4nK6i+sz2WG0GjwHHDXdMMGxYz9bv
 jddNvnuPIK1US8z8UNyVVVPArkdtgfD0iXtJN1oN/hQSdWSZfRdwNT/m5DctSmVrd9fzuOORsKm
 KL2k839keoNelFwR60MW7MDjZMA7G6/m7ZhRwOF6JPNWLQY1bXG+VaQufUTtVar6kkubdlxXvhx
 NwdBsJvtGopVO3x637HOv3Mz47be/4EFtnkBzwVJtfxRQLsejXd3XFOAjpJySfMmz6gNeGIlBCO
 J4iTJJVw4PpnmBnKsG+cpIkTvs5sWskgSbVT4Dp2bUEntpPFhSKAv4P7pjeKuFae9nD5ZojyJo8
 6FOqMkAHhEfWFDONaD+HCNohOK/s3i0gozqYStv9OUVBxRNsyUNGp3bgzIx47UJqSuhWLQSu
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a79a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1IdYYe72uQdTEr82hC0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180130
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



On 7/18/2025 2:22 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:42PM -0700, Jessica Zhang wrote:
>> On some MSM chipsets, the display port controller is capable of supporting
>> up to 4 streams.
>>
>> To drive these additional streams, the pixel clocks for the corresponding
>> stream needs to be enabled.
>>
>> Fixup the documentation of some of the bindings to clarify exactly which
>> stream they correspond to, then add the new bindings and device tree
>> changes.
>>
>> ---
>> Changes in v3:
>> - Fixed dtschema errors (Rob Herring)
>> - Documented all pixel stream clocks (Dmitry)
>> - Ordered compatibility list alphabetically (Dmitry)
>> - Dropped assigned-clocks too (Dmitry)
>> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
>>
>> Changes in v2:
>> - Rebased on top of next-20250523
>> - Dropped merged maintainer patch
>> - Added a patch to make the corresponding dts change to add pixel 1
>>    stream
>> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
>> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
>> - Updated dp-controller.yaml to include all chipsets that support stream
>>    1 pixel clock (Krzysztof)
>> - Added missing minItems and if statement (Krzysztof)
>> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
>>
>> ---
>> Abhinav Kumar (4):
>>        dt-bindings: Fixup x1e80100 to add DP MST support
>>        dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>>        dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>>        dt-bindings: display/msm: add stream pixel clock bindings for MST
>>
>> Jessica Zhang (1):
>>        arm64: dts: qcom: Add MST pixel streams for displayport
>>
>>   .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>>   .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>>   .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>>   .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>>   .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>>   .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>>   .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>>   arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>>   include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>>   21 files changed, 235 insertions(+), 133 deletions(-)
>> ---
>> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
> 
> Can't resolve this commit either in Linus's or in linux-next.

Ack, I'll rebase on top of the latest linux-next.

Thanks,

Jessica Zhang

> 
>> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 

