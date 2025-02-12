Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A302EA32932
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CCC10E8D9;
	Wed, 12 Feb 2025 14:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ib0A6TlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A676410E8D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:54:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9v2UE015814
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Zq/tfp5H3EdFiMQlHf/WblqjUgkRebGGbZEAJvFLCY=; b=Ib0A6TlMIAKfnw08
 WTdQtxbBGG2KYXMUpJVIyuwmWKHJ7SCX8XzZdqgsQKnBTeRhCSfuhxdL2W4XzfwS
 s5qe8ghzsagjji8kSbfQBkO4LLK4LN1lV/kT65svaqSzVV/eXnTe9F+GTjiVahkK
 vhTXox9S36EoOlYMxmXAa0wkL3y/NwPBnOn5Ye2+Q+wMOcOeJEjNF6sFqpIkpAg+
 96NEe1wC9Mo7yJw1gfS8VZMURurUMaauefcKkGafU06tOLK3VnDwGA1DwedhpIGh
 XzJpzCPanDVgQA52Im6VpF0XaCDEjCw2zqbuAVS5LTGwtDxu4fA0OKIOKfVCCy49
 lWCqTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgj5h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:54:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-471a9b91e90so994251cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 06:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739372060; x=1739976860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Zq/tfp5H3EdFiMQlHf/WblqjUgkRebGGbZEAJvFLCY=;
 b=A2upkKeMrve0Ai4AS7W4tBP851fwfluM1t/JA+n4eDaG21E8reopKM2mMfZApLXwzO
 4wNtNSlXHROyP89tr+8gziMAaDHYa/rUc2xQRKisl5Bi71cK7RQZZ9VHcqX6FzpKlWAf
 1n/57/rQPag3NSeWyVDmCB3U8gbA9jw4+Oxu++bvAJ2+oTqwDcw5PmU8sUJ1XYsVj9Mz
 zh4eVICYMbygLqa1pO13C9UVrBzHKNhe4yCm4JBIp9Y9Py6l9AWuRBjJWhxOUonIciV+
 A6ZOiJDDG9DIUuRIaDT2bTLT2gRb3JaBON02VmFYXKaweaGOchEG07yljnzCuVlTiwAL
 fZig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTDG+iDWgW48dVxFwShHT97u/QyDOKk5lDJJy5sHJk0wm0oTcQyZXdyklCSq9xxSVS15BhadjbNzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPwa/Svk6hIUhSCqZuMzSOzN+vsExHk/p/3pjnJuZw3TWZjMS3
 /DnIY7xs18/HzoF+lJOdD/OHAv97EQawu9So2ONi3rHRJGQe+uiDcZNsEsWdaaH4yhPj3gUFuE3
 CITMiCHVRtx8V6XJ/89CkAq0qJGA6PqzB9Sy9tPIk2dsGgCJNqASc8f16ESak3JdsQs0=
X-Gm-Gg: ASbGncuMMDpLRcySEIWPckpvSn8YaTJjJBYodH/gIohF3K7oH6pJfOSnnrYQfSdYPTH
 YKKAELZBIpByvB7iywoCRqPH2iK6hf6aknhUZJgyqrox7s/u7J6H7+xFPTNzeyy9DYP+Rp4CDuD
 v7PjcW+cLigjHIdcBUHtGswgieHK81GgF2aHyK8nsg+8wMaQu22+1KVr0IhX6rKrzna4soTEpnG
 iQ1+SELzLbTNzlrfefZ60DzRKbXP22DRDo6ZCm34VTl5zz5oJq3SJVG0l3diqguzJ9l4Xtv4jKq
 zpMzLzNKP4NtCbWGIRANqGhAC20QnjU4JsZT+G1aEwIw7e/BVSc0KjPaU1c=
X-Received: by 2002:ac8:7d47:0:b0:46d:e2b9:c4c with SMTP id
 d75a77b69052e-471afdfba94mr21144031cf.3.1739372059704; 
 Wed, 12 Feb 2025 06:54:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI/emx5bCvpWu1atWPHKO94hlUzByGbh7NcHanN9a4vJkMSji//USCVkpBLMIpNqLoFtWHSw==
X-Received: by 2002:ac8:7d47:0:b0:46d:e2b9:c4c with SMTP id
 d75a77b69052e-471afdfba94mr21143761cf.3.1739372059335; 
 Wed, 12 Feb 2025 06:54:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7bb57b2a1sm686247666b.105.2025.02.12.06.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 06:54:18 -0800 (PST)
Message-ID: <f3c3dc92-77b5-4091-9f0d-3b70ce8852e4@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 15:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
To: Rob Herring <robh@kernel.org>, Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212143538.GA3554863-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212143538.GA3554863-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oB6VG0XV7gxp-7IR5VITjFz3o3dvZLzX
X-Proofpoint-GUID: oB6VG0XV7gxp-7IR5VITjFz3o3dvZLzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120113
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

On 12.02.2025 3:35 PM, Rob Herring wrote:
> On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
>> This series of patches introduces how to enable MST functionality on
>> the qcs8300 platform. The qcs8300 platform uses dpu_8_4 hardware, which
>> is the same as the sa8775p, but it only has one DPU. So it only has one
>> DP0 controller, supporting 4-stream MST. This patch only enables 
>> 2-stream MST, using intf0 and intf3. The first and second patches are
>> modifications to the correspond dt-bindings, third patch is the dp 
>> controller driver after not reuse sm8650, fourth patch is the qcs8300
>> dts modification which add the clk support for stream 1.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This patch depends on following series:
>> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
>> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
>> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
>> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
>>
>> ---
>> Yongxing Mou (4):
>>       dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>>       dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>>       drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>>       arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
>>
>>  .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>>  drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>>  4 files changed, 25 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
> 
> Your series doesn't apply because this commit doesn't exist in any repo 
> I have.

Please refrain from merging this revision, we found some issues

Konrad
