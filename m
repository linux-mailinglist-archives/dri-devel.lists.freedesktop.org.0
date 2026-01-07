Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9ACFEDB6
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 17:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F37710E63F;
	Wed,  7 Jan 2026 16:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="esLRBjqq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emjKKWOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8853310E640
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 16:26:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607CsScH2239477
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 16:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=; b=esLRBjqqLnzL1eWg
 btTcXwq6QWcEVWyXOuxTHoX6LNhhS5pZeIM/n3RKsSCnnmE6syAb9UNvN1EiKz5W
 5GAb29vWcPaGoMJ3xOAjFh3aVITPxIRlrEdjeix3HgIb754PGnY4+3/2KiTi5XR7
 +y+QG9EHAWI6xlPUWQ04Nyob7yE5Irt608LxWsSJFwKfdrsprL49m7sQgp6R5hQo
 /RpgVL4Ci2GEgzU7vVDC3owtCvqT+1ssM4wO+85VqWnudolMfWl0aj5MPw6LC+DS
 qQeI7K93AJSQ+5uYdqm3ns4WURb/f9OYq483Hlr5IoWNgrHFPiTB26cvh1RlnUvB
 cyAb0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg0pfg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 16:26:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a0c495fc7aso26424745ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767803209; x=1768408009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
 b=emjKKWOMO+btGTjTC6FManxJpMnarvEhM/FAzvXPEZ0JS7rFHl3SgJoy+Aq8Te+vJD
 Q436otKU40xAjvjk6fVxr+9ob+Y/l/NQTt8eyfrCpFqyiTEVBzJDHzQbfkMtTlQ6dJQ7
 tbZ9y11+I4H6VYd/JW5OGeN7TK3rMuIXM8y4lCX2RMmeQGRyiD9Nhxla6+ZnCFicW7oz
 CUiuJfdNHdei0MkdsCbiG4VXMcptKy6k1cEVDP0fcBH88WVn13GzajZ+W2CWR9p5faaL
 S8aek6483eimjh+2GsNxqf9BDnh/EDSvFpVa7rxqbYe7NNGGdyFIe7WXLkjfPt7rCqFU
 qCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767803209; x=1768408009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5wxY3w6nk1EMOzJrQAcU/6BJWx1PGSRo+JS7Wyl/dA=;
 b=nlcoS3Ar0mjvBvQzXpp8vWXTglUKYaUJlYAaudPOo4udmGLQMhwRPzwkC1Lpjlhg8o
 YVhQvYPy22nSHdq878iP7QNRlNG2VaT/ZRUBVSMYbiCpWJvGdfoCQQCciFRlSpklvq2D
 vdb3hShCOtHkxPcDm8TIShaj5pqgrpZQ/v5nQBRVilvSXrTub/pF9QToXeUVCRBRM+rA
 8C/fx9lFSFyYQw08sI3wHTA0BSsRi1khYoXwNfzsJVa+b40SMdxutcZ5Q+UrLDRrRii/
 Xgy1kLcPz9BipVXGuGakz342g5YcjzNN1BPiu3OP7TzOPQP1C/+OZ/qUrATYqFiYVNwD
 9dSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu6i1FksyphnWqguHNZkAL+vE4i2qtbncdXplxUi+29LHTjmJbPoKLEn8GCRoy6JHqgA3IxQuA86M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSXmGvd83kz/Wp9R3+ImvB1mDTv8xbG7vII5NS6vyNsVvsd2/m
 JSa/TlW3U7plZUamiI8ikC2ac6kN1itLoQFbUBO1BgWaA9foFlKTrkQNtPnYEMnT+Uryg3u97Xw
 bSPoyaHCPpqXhSFspwDL6CYpup8Wojglhe1YLrkaElzEVczail/rAHeIb7CZEuaPOzje5PEw=
X-Gm-Gg: AY/fxX682QQOWiy+tKP7Ay/PCpke606e9QKYqgz9CUS9UnmwchGkUUXYXpvKyF0uOZ1
 onPx9k4jKMTWgoSgzxBlZROMuHHA7Dnr6b2ACI0+1K9SbahvdgOIVqs8G7oS8EGNCP1doFFgzRZ
 Puq5DQzj+piETgGvrvq0klrDC08usqTdbwERf8Gs0rzHraYJVSdDo52hBfHKOeN9NuGRg02Vwr5
 TYsbOjk0S0yoDNnoX9/KpKJFQdvmliCj51nAK3bhv164fBWajcfMd0YXm8gwmUibR88/2IGe3Hs
 E5McsyNog9dwzx/aZQtqyGQlH2pf4cFMmlqbdJQQpEJDoJgQrPfGTyXH9CEwfCYt02Q3JDMfeyL
 RoKTVXn/B4DArG64/qg2x94iDsQcPFuvs6oLRSQ==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-2a3ee4aaebamr26013495ad.37.1767803208641; 
 Wed, 07 Jan 2026 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhDyZ20m0wTcSTXbF6lfqRcelUkGiEtoEtFdPGDtyUaLrGrVdvkZP+XFYxhXeMEZoWEcVI0Q==
X-Received: by 2002:a17:903:b07:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-2a3ee4aaebamr26013275ad.37.1767803208116; 
 Wed, 07 Jan 2026 08:26:48 -0800 (PST)
Received: from [192.168.0.195] ([49.204.25.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2df6sm55741685ad.61.2026.01.07.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 08:26:47 -0800 (PST)
Message-ID: <fff70f1c-3c5c-4e50-b0b5-c3eb10f67cdd@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 21:56:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: petr.hodina@protonmail.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dWV8r_O7csOVVucS0stG5pZKMmR-Cskn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyOSBTYWx0ZWRfX6UJQYtMSJKy9
 kochteeAbHKjPH9E3OklUgc/VPOsxYTxJlHF33NP2wd0fv6ln2B8EgHB7yCDiWatkQPsinhv2y8
 hgjvE/4PrY9gJO3aWzdeyi70j/tzIMdSbgUMGrOnYO8pEgTV2BhfRQkGb6KVBWkxGCK4BSoHsVN
 1k4IaHjhmlkykncD4n9U67gFMRLi3fkfeDpCFEVigz/lxEadGrnKDrEdQL2uGIWpLyfcYwfmtL7
 uB4MoGHELhbTAz1Ll+VNGE2gsdcd2HcU1zeqRSa1579jFGsYADHRDlodyMfqORr3imXwt7xd/GX
 jbUdpOT5viL85Qv1e4Blmbmwkhp/J6jByEeJ/G1L/IXph3/98lB9CemvWZlHu+HJl6A/RooDXfo
 U54+R7PHVCCCRxZtmq+NM8YYDRfUlI2dB0njCLU2gu5mm8YfH638dvK+6yqIRYVsfcbtZy85NvI
 jGFdnk8azrsg0mDwW9A==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e8949 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=9zcPrCpDFr6Yft4RwatP3w==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=fry8jdqtyFT-MZpSCxoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: dWV8r_O7csOVVucS0stG5pZKMmR-Cskn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070129
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



On 1/7/2026 5:14 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
> 

Are there any changes between next-202511* and next-202512* on the
display PLL side which is causing a side effect on the pixel clock(pclk)?

> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.
> 
> For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
> though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.
> 
> Kind regards,
> Petr
> ---
> Changes in v2:
> - Remove commits from v1 and introduce proper fix.
> - Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 2f9e9665d7e9..78e43f6d7502 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>  		.name = "disp_cc_mdss_pclk0_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> @@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>  		.name = "disp_cc_mdss_pclk1_clk_src",
>  		.parent_data = disp_cc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>  		.ops = &clk_pixel_ops,
>  	},
>  };
> 
> ---
> base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
> change-id: 20251212-stability-discussion-d16f6ac51209
> 
> Best regards,

-- 
Thanks,
Taniya Das

