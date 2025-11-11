Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19EC4E74B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 15:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075810E599;
	Tue, 11 Nov 2025 14:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELmNGRaY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfCEMWu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EAE10E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 14:27:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ABBGIWZ2165516
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=; b=ELmNGRaYr3Ek/O6D
 IZP2qD4dyHqpwVTbQTB5Yw3o7cHSgiJmwqmKEAZZuu/Enh+gW8oEjFXL/nEAT3Kr
 BF3WhBOaHZgcNJEUMFuq6hqLxo8WqaeE1epEsVy6qbmYVSYc9PWsbkAIXUpnh+Gn
 FjjokjwRWSwj07XNlHaB94Sun9WFZfj5zsYISJ7hHCGfQunpODwWgXSfrhtoR0g2
 DDJvIWFa4vjpKY04ixCA4UYNl5IsESmhuJhQJbJuUqxwr5P5XR5DfoOHWvKn5tCo
 CfxfwSfKOxzJdYrZs6Z7LeJ3AevlDHLGPuwe0BXz/SyUqlIgLS7uxuvJ1vt6H3fD
 OGAqFg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhhj41-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 14:27:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a43210187cso3984433b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762871233; x=1763476033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
 b=RfCEMWu3yPsP2Zzl3Ki/++yRqm6aqw9KDTj0ts0VioqgMlcS/S+bR8jnJCrpZwtSk7
 A3S1Gm8a5KOQEJG6NdHhdB2s6dbV8kczqlW04TIEBU7uqsdZ54LcAJzk6EUPzcV+HBhX
 Zh/OPW7pMnYf1Ib5GuthPVKC1ZvyPDfUqEI9MBk8YQtIwlZZRdj0sYUYzeYaZsJE1ILP
 gOVU5GChZMXG+PzsyPt7xt1yl8gIncHLKbEgpiR8sAiAbdLXJ7pqw1ubKV5Y0YsznmJx
 r5/pkf5EFkxnDZrXCxyfGIbRFncd1ohx4kfajeWC8DL/ih+qQIbZw4xzV+T5BwznvmFx
 mbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762871233; x=1763476033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
 b=F6BB6xcEo2DE3XY+6t8yY/HlHJ2JNpsA4lfaJKIdErqpOY8kRn5Ckv4c1x/yhbHcTV
 VmRjD1+WB82Q1xFdotW/Ow5ngZriqRzJKeSG2AW03PgrUiOSUglkacuBVFj2eos1OUn2
 x0XwpfadTLS/bHhJUet0ROnWV3/XjipvnabpXaUHk30+91wVFt1wpjx8teG/JBw9+VXi
 Qu3cFcfn6WJ/04rBiK/bhxFCZeJV1/SrJTkk11UC3QYyBzx32clJJgty66Mdbv2qFNd6
 HWguG5qyplGpXj/WnxFybYk0cUhtYpugcoKAUO9Vimc1p8WjIz2BY2/HPP1kI95k5Qic
 uRww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe+UPS3h/qHwuhzJSTO9wrNB1UcyIe8ul8s/EUxzt832mqVLx9PzqVP5f26PTnbP39BteZ/9ZQ/LQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4s0+b1sjCXBLv9dK1wVrDL9ZN3A9SjyYN8DXCbK5FVyPB+Fzv
 WWLd3/DbeipWiUHoKN0m+PXtMZdNdpBQozVmK2rHq1gwYwo3RV+XkPLr8pdO46uGtXo78aL3Tge
 GbNsGJpXKXpbZz+mYMjpdwJjJ5gl0lTbjDVJlQBep+Ch9Ff6iTCQriFpQbcBIuoTG9QcbVx8=
X-Gm-Gg: ASbGnctzpOa8GLIknN/g4mGC2kbvz3fNW3gz4fGv5DmEoM5n9cHCXLC9VI7/fgpzhIc
 SdBDHKg83iUBOhPoso1/54f5x1D3RF4pEJg8h19ZcYCUaFKf0BeFytPni7rYdyoP0J9uOGGVB5F
 R/TP/36q/NVbagRvSyiiCStRVfE9sFh0jXsK7Q5EWU6FrRp1fI0ADyPfD6HZyNwFt1wgDrEQoZ9
 xgXuudl9oFDeF+PLpfnloxJg+xfCO/GgI1OPsv3kHJG6FlPbD2CuiFEJ7/kKEj1Q2EDY9YA37rx
 Zf+uCNnufuWE5TH4m2XsZv4LVg4zxeQnkL4NUOSkY/cKSOpY8j+qiJEU72gDe0S2fVU/YPzZdTu
 eE0VhmJDNZ5sBbyq68N3Dnw==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id
 d2e1a72fcca58-7b2266a8d96mr16270337b3a.15.1762871232993; 
 Tue, 11 Nov 2025 06:27:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGS/7Y+JCV0WL0rDJJwpThYAOraNVEcFIM32zGMLfnISD9Q77+PeHDE8FGvMX6ZgCVDRIoTA==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id
 d2e1a72fcca58-7b2266a8d96mr16270287b3a.15.1762871232438; 
 Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b75bda9f77sm100571b3a.15.2025.11.11.06.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Message-ID: <08f8de55-52a5-4942-9a39-222fafb093a5@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:57:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
 <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=691347c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WzT3ZZK9S2hwGh7ljtQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: hgpvuyhUBBVm3gUN1TpeUXOA0CO_QLU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNiBTYWx0ZWRfX+Yeu0HtzkWt1
 UB2izjDzZ28y2ZT2mvUdM/ZfdKwkV8pEtED4zKaEPgsKZF1KYUVvTh18J1xFBAAjjaWrGVzeEsp
 xj9LpOw3zQQCgAcIw8iL7M7s17etOUwwiP01TYKd243VVYuVDACwwq5Q7vujE8OAb390CjCSE4D
 p23j2bVAnOHc/WjZQ+hrIEyo2bfDFUNPoHMbY7PWVOCFSec6yRjZg5iwJhmz19w1V2UiQ/E8VPk
 AKn63rlEyUWvP3Vh4Q6mfIIwolXfupig6r/qE1xYpkPbwDIusf5yIvIvcsyuQdzOHVXIraVkA4q
 FSESCxMzC9DvMcxH+fPbFLgu2tco7MUTwQgvS9HSCPCKayF6O2JvXZ+4WzYuZUg9J50LuYI1FFh
 cYAXUiWKKHP5lhs3BG9h/mKyRZenZg==
X-Proofpoint-GUID: hgpvuyhUBBVm3gUN1TpeUXOA0CO_QLU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110116
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

On 11/11/2025 1:20 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
>> Update the devicetree bindings to support the gpu smmu present in
>> the Glymur chipset.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> So you ignored entire review? I drop the patcshet from DT patchwork.

Same here. This is a new patch. :)

-Akhil

> 
> Best regards,
> Krzysztof
> 

