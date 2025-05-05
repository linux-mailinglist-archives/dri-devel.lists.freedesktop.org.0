Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB809AA9533
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162C10E2E6;
	Mon,  5 May 2025 14:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND390zxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69810E2AC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:14:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CKq1D009210
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 14:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=; b=ND390zxjLditdSh9
 kiFSZFnTqnxOxxGjuzKTkdXrBLm7fTfzneNq/E3ltm5M6SYwWueTLPTMBKFhtATE
 dKwrB0vksp4iEuvR7wG+pQ1Z+hT5ZFw/bAsy36tAIad2JLVUPSaj52ElDhKq88G8
 8JvwImFXBm+Ex2hGLjcyNvStD5SFg0qzBYn9X8i3V/id0XYcH+LBgFIE/ebVsPI8
 d7JL5hVjMt+Gg/7gxfV/v3CLfnnhJCo2+pQWobOYtDAwMxqw4OzTWN4MTine0DcA
 nBEVRWI9fOldTEbcyPEYwDlm3rQOvNiISPfvdXviaT/id2xQgdwFaD10wOOSkGiZ
 L9du1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfm5mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 14:14:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c92425a8b1so802914885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746454491; x=1747059291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=;
 b=osYfRYqnknb7YYswv5DaC0wfFoqqCN0cNTHOV2XQ7nBOfoxoR3EC7Tzc5IHEb5ukiH
 3yqsrb/Gb6tcDqfvd7VAnlC9j1M9eia/zPRub7jfMIjGYVpvGBu0SNYv3ufYX2ppKNsB
 HPAEjhlUkzzHNYT30rfa4hNBBRFCT0I2dWPr8mToxdZT89LjvcqTMQeGp+erEUYX54ZM
 y4Ws4KfHynsWWyaAAvHRrGEGJmV6kuWv7k3hvTOSYkgVdyqOMCT/QIFR1LwjoigksOTU
 Ia2hNuW1opWl2SR9EPtPMGhca1YyMd9nvL6l6oSf4Jr/U5q40BCfLQhyiCFeXcsUHIoQ
 OCMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIDxzUnJJUgpAtKaQOvzn85NmwBx5fLxT+QDmxs/maq3BqD0EtbtbXQ32pNOgsAobu8B3UlaSgFiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4l+ZD4OQVh+elQ/xvoRBzhtKa9Tti5eKwojPaqTSpGli0UckD
 ah2edAhFjbhhoNZBxrIPot1rkSXAQKaIhek7AgbEKlYuhlTk1745MwN/xvvYEnOUh7QqvQzoEDD
 WEidPHBUFG+x0Xn78IfD6dgdta2X5cvSoiouhj++EX9pDvVmKy0o6oZxihmws006i7JA=
X-Gm-Gg: ASbGncuPAQJCoOR9k4H4Xal56/EyqR6Iz3o22IkKeHhUvSFXR0eGxjM+cUCBqzhtHSW
 H2AQdx46W7a6ZaqArz+5K9A9GDmfcMQOR6UL6e4/m2G2d63TQ/r5BV6FP2HE3K50A7jkjtJ98nL
 L/ypRwZDwgUXTwXQQs1ToyT4MoYByl6541Ruz0+f/4IQbaYE/f4Ri+HwVxkjKPQBrXdguC61eQi
 KeHZzZnugGznJAcpQdOZDTLo5w9zq8HZ8kcBKit2COroUHCrgOo7aKQw8gNISL9db1raqBjfsJc
 S3MtJzkcP6yFaYSIG7Xwda70i9XFZdlglAQinsrWjGtRni+ZACHLIYmpGHp5J9c7aVCJRk+Y1kX
 OJGbKZsLYals3dSYVW93twgHIGS6F5J7gxiavrwGqIvBsdvglHGdw5+JumlNmTA5Sz2f5
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id
 af79cd13be357-7cacea24688mr2331709985a.21.1746454491524; 
 Mon, 05 May 2025 07:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/vBvLz2xsMDmp49gK5gm96O/Tw7T3JFctVTVSeo6t9VZN8IC+KDCL2/JJC8O+HXJyk28oEw==
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id
 af79cd13be357-7cacea24688mr2331704185a.21.1746454491141; 
 Mon, 05 May 2025 07:14:51 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688?
 (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi.
 [2001:14bb:671:42db:147e:6740:cd7c:7688])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f6613sm1721233e87.217.2025.05.05.07.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 07:14:50 -0700 (PDT)
Message-ID: <f56c19a0-18d7-438d-8d05-98ae7a842959@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:14:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v5WC8Y2hAAjeJ1P6uIim0nWc4_LJgqSF
X-Proofpoint-GUID: v5WC8Y2hAAjeJ1P6uIim0nWc4_LJgqSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX/CP3nuJ0GthI
 NBuEMlKaEI9EnByKn1qWp+oqff6vdNQMI8fJ5bJAlfhaJxNY3o1mZ4Z9H6N46XC04NI3fItBMJ8
 fUgE9BD5USMjZEVcCjsdXPqjS+dEQ/CIbFS+LWmTv7pYHgQbi57VWi4kUht8aSTwu0wKnpqfp3T
 Gu19OhaOH/ObyhSAKWsYXEDYIbWrXzjtD1yZT4NmdUw3KXle4kdukvYNhXvP8NRyAMyS3niIayw
 +oPuB3C3y73CUa/L84tzEb6JzuBsHgaTfJhQUAJJh8dn2Ah8/KALMfLBQV+6jofLWWgyy0Osu6J
 UbPpiodoXfFl6qgs5JOsv2Ne3jlD9Izy3dK2gzVlqtnfoyQ5WuRW8T3waCGSXvn9cBVfsW+ruc1
 pxiBCm664dBQbO7k+LDDIQ6MTB3tM0lO3/ovC/boI+szrqgNSiYBxhrrtW/J+kTPrJtcRJPM
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818c7dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=F9VSnBJ7OdIsbtMwzSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050137
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

On 05/05/2025 09:17, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
>>> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
>>> masks and shifts and make the code a bit more readable.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> 1. New patch
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>>>   drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>>   	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>
>> This (and several following functions) should be triggering a warning
>> regarding empty line after variable declaration block.
> 
> You mean --strict or what? It is common to have the &= immediately after
> assignment, so that's why I chosen that syntax. It is just more
> readable, but I understand your comment that you want --strict
> compliancen even if it hurts readability, so I'll change it.

I'd probably prefer to split variable declaration and readl invocation. 
Then the code will be logical with &= comining on the line adjacent to 
readl().

> 
> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
