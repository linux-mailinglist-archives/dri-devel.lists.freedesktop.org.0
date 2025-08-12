Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F24B2248E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 12:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4910E039;
	Tue, 12 Aug 2025 10:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+p1DqYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AC510E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5gvf4018312
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=; b=C+p1DqYmbrJU/Coh
 bokhX1Hwqe+djWwDbWYX16FTHV52bz+TPAG1ISJJx9RagMCEfE6NwyQ4whxAvhbM
 p1wwopY6ag5xi8uvABmqHSLWe/eRltRVQnOKvrrjwyt8uaExrI4PPLzCLckYv2M0
 WU3fAZ38r9xeDgp6WhiCTML9ypUd7a5oXxDRy3C+cMGM30kyrgR2fl3PKtEojDrq
 kqdFOYrt/cKIex/DgTFQMGnUMCGTlIlQmt6NGAeC/fhmYwRicYRQJD5H03IOHW0b
 ubCflHD5qMRRSG2HVgJjBvlhy7TAH29DKKZ72BVkQwHBkRpzYMuLVUtlAFPp06E3
 wNQnog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g7q81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0938f0dabso14840471cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754994438; x=1755599238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=;
 b=DeVf1wxbNVOhZdv/I6Kd4mLo+UVgqW85SYeG8iB1c8f3fPq+2Xb2afNC9zj7HrHgMy
 jqEVeUkU9nDaai1rHXmXIkrNaZfLHXA5P4pU+vHaVSY62dOgLh0QTq5wPxah8I0nC8Ux
 jaEsXC5SplGf3iwAYPJTiC+VkI/w36Wx/69FpbipHFzVviIf3VJvk7Wojf8V66klqZIs
 88BolktZQVIhMh55xm28wxvq0TjJ5jm+68ffT2XXhY3r7u196qjm2iwBn1pUeRnKUyF/
 Q3VD/BFKQDTHaP5//WNnZEVWeOV0ElsmQwRDdcgycH7VH/D2VBjG13bbqToniY87GZPw
 NP9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkH4bgn2fb2u/FuufHmkR8AWI91nE0OW2+iEUE8xTbwVhvzavgddsrzOI8QTvH9HfWC58yWvmCXeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8kE4aiRYQCdAdTWN+ehRgPQt64tcwBb0/Pie7qHV2RSGvj9/Q
 M5BIxw0IldABXhcS719g/WZCq8JSflzsaxC+Q3OW9bX74IzCZHrnqdMnhyfkTGZOLm+AJKgAPTz
 opH/aSA9drs9N68JihQaFpFefSgkB2B191Dl7iepHWOm4bm3hoNrx9xJ+iaICHzhE/vYHLIg=
X-Gm-Gg: ASbGncvXg0e66PrSMbcQkDLJnyrIuN1wOvO9obPl9ofY9C13Oy/Mpnk0WMdg+HhsdxW
 vyGcgW73fwQ+9MUOZpJUZIdZE6za5dL//5DiUVv3TCWKsF91ahtbsrE3E+V80mCpLDrN46e21Ar
 drSyKHgbfZZWJf+uDker1X0HT5/oaXXQu/An5a8Zi9rHPZdFtX6AD/y9PkUXkKOK0wZi2dxyyTa
 ieD0iiarLymOGBmK9Cr0AkraEhUApwXOkBWVEe6RWMFtb+HQZHlIZWbHeGZk/pDHiujktjZFKZ2
 jKBAGqGhBaastNz9yApn3/Y7P+MkSEWxH8jeh74NJYBNjg7SAjBxSsrFcsE5hZxttPFacc6imu7
 Lu+syeQT3yB/6sxQdmA==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id
 d75a77b69052e-4b0f6267d03mr2668931cf.13.1754994437720; 
 Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcHGbLJllfiL6T0pXR0Qe7084myDh4JmZG4tqCEOLzDDsKtMH0MRvtexCeFrKzOU71x8TNjA==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id
 d75a77b69052e-4b0f6267d03mr2668781cf.13.1754994437236; 
 Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9f4796e23sm444380766b.26.2025.08.12.03.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 03:27:16 -0700 (PDT)
Message-ID: <0bda8e0e-4f86-458f-b55e-c5b0d6cd5c30@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689b1707 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vZF-wXTcH1iwIe0ERPwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXyXut6pPAO91K
 M9/PJfxunqShUCbLDmg0eHfRsZoisCLuA/gEorrE9fyEvAQmfY4IflkDom92zbWbD++yRb9ssCm
 e7A21vX3AP9zCyho7HcUnLixjK04aIQd94T/HFWHEy9OSGnDtySzK/DkDB1UNiTfo3XNXXr8hBk
 nBjctGsPCU5LD7Bvcf3eOfVJ8PvywYc+BdpEhl+K1lga8ryeGW4ntuZDrQzwQXDzrmvd36hzzfy
 1Q02MxNn+jmrJ+gH8C59e6L7/PUpky/4WmGq9z0JkdQkx9LLa4plqr5FbAjheosZ0qK7wUhmZsU
 BPwmaVpzdobmlxvL7GbS4Tnb25yeyxmdBA80rGSXxCsKoSTTQU3WgHUB7i3LIjrSUKuy4qKObYM
 sxdjazSp
X-Proofpoint-GUID: zTt13T1sJcehPWAlohVY5Ac1F0APrFyK
X-Proofpoint-ORIG-GUID: zTt13T1sJcehPWAlohVY5Ac1F0APrFyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On 8/9/25 10:36 AM, Dmitry Baryshkov wrote:
> None of MDP5 platforms have a LUT clock on the display-controller, it

8974 and friends seem to bind it to the GDSC

although on msm-3.4:

arch/arm/mach-msm/clock-8974.c
4197:static struct branch_clk mdss_mdp_lut_clk = {
4203:           .dbg_name = "mdss_mdp_lut_clk",
4205:           CLK_INIT(mdss_mdp_lut_clk.c),
4609:   {&mdss_mdp_lut_clk.c,                   MMSS_BASE, 0x0015},
5118:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "mdp.0"),
5387:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "fd8c2304.qcom,gdsc"

Konrad

> was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> MSM8956 platforms. Technically it's an ABI break, but no other platforms
> are affected.
> 
> Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -60,7 +60,6 @@ properties:
>            - const: bus
>            - const: core
>            - const: vsync
> -          - const: lut
>            - const: tbu
>            - const: tbu_rt
>          # MSM8996 has additional iommu clock
> 
> ---
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> change-id: 20250809-msm8976-no-lut-4b5100bcfb35
> 
> Best regards,
