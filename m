Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7371AD8E8F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054B410E9DB;
	Fri, 13 Jun 2025 14:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DihtPqmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F5010E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAnMUh031454
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=; b=DihtPqmIpiFvuGhA
 StkWJqw1wzFY7E9AxU9jY/rNqYKAa/Q710ybRmEMn0gOAE2A0DfLnM480/j6KwYs
 kR4prcYBOTBKM7Py2RvPZFszqlcxpnHUS55o4pvSsW3zJttlPB1OseSN/e8tGLCd
 7Q85dAKVtqzsWgDsW3dzjKTH6pK0ZijRB5/75VcKnu8tunbXXK+HDg3tY/NJbwcH
 lVuzpMUm+4zo6/vljkgAgWKlaPk0N1g/Og+AO3xsohl9DWNjg34loiE0jjl5VtI1
 623rG3pHXJXqsxYFkWUPhP6lQwT92Szg6SW1lY9iV6bSvwntZrbOuMSUdUbZ1mKG
 LQjtsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdww6fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f3b8b1a1so371155685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823516; x=1750428316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=;
 b=Tu41pJKAd0JYJUhiRAOkFE9E3Y7Lg22vXt21S/MZFe5RyJKq1JmShF4s29gD5As0LV
 z62Cesp/TuM8dIkw/EWzINDmE1rj8X1YTqmtU20ZHK89hNkRw5yBlhwPKJ7O9pueE/Wg
 5+jO7KwncJfcuHSDMXfsGkD/FckG9azFMMkBgoS0VpQiS+jZ2fCsZuuLennGIxGpgmo4
 AGYdYTG44Gak+JzVoFmuqXO8Rd1tOom7zxn2WMjDYOF+Exjh44Nx/FXz09CVfZp+EuU1
 ppX9tkMY3HO8JSqoMy+uL9QY/KpDk32De2i+EptQXpHztXpM0GokdNxxm7gPuGxyYObC
 VNmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrtC8fr7A433UZGoLOfB2MJ4vVAVHwOujdWVPU7FS0cHQz2089uZmTDc4c/bWmWX6xXhWKH20ECkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWLRfi9jEp67MX/imaKtg7smuXUu4HJ13dre6Cr3Ev4o+k9SeN
 VDc60nyFJD3sb0XYwNZIb91Ilf70QtxR15WK9vIJeM4N4f1k3hiHF/9GJ7hmfG7NsJaCiysfMcq
 IaLKDDTumFC6ujQa0t8A3FFfs1v6CHfqSregn7i1rD/TuK0ZG2BYk2iWYiMbQNwxgi85yaO4ymv
 PIqww=
X-Gm-Gg: ASbGncsmhBIxnGs2iBW9oWs3l8QINpjzX1KhT4cyeQeDsTogPmelNwKcLVHa161LHBb
 yCIWKw9WnxMEWIkIGPpTxPspfRe8pF49Mr/G0XU5mxy2dveejIkJaK0ZV5WqZ4s9tePDDx9z6O9
 MPqqb4iRzUImUtbtxJ8onCAnmmBfOg3StA1on7yJGhmqKCrOYVzF82u0ctFVaTZLtZZP1gNhyLT
 VCFZA1lhkMZTmsp2n5Ojtol+6PHlZrYRKaF/AOkvS1raXGQnOmTNtV96oJ6KT4e+O0cFu7maHZH
 vukrRPgErz2FiY957fL+jMntJJMWHvGstxWn4To6Gom7Vpxvu/NCUrj3YhO3RdQwPwWIHYM=
X-Received: by 2002:a05:6102:3e03:b0:4e5:c51b:ace4 with SMTP id
 ada2fe7eead31-4e7e39dcd64mr2329137137.20.1749823504180; 
 Fri, 13 Jun 2025 07:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAabxiuRoQe/YqtbK2biWXOJsRJMOrPMmyOlfhlU9BuJsNPdIIiFtgHaougk+e0AABz+4dYg==
X-Received: by 2002:a05:6102:3ed4:b0:4e7:b8ca:e3bc with SMTP id
 ada2fe7eead31-4e7e39d8cbamr2083763137.17.1749823491378; 
 Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
Received: from [10.161.140.61] (87-95-85-22.bb.dnainternet.fi. [87.95.85.22])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac120167sm456434e87.20.2025.06.13.07.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:04:50 -0700 (PDT)
Message-ID: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
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
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfXxnA3o9BvghEC
 NijZ6qyvBjIFW/9Lpr0J279QH5g4R2OfrJ3zmo7mFuojPzMnTs7ohVvzYgU2o5+bFakiR986DIc
 zbWHfC1tiPYZcjwSouB+m42WXMf1p8YpwTb048HjhRbw/NseAYoSNlITM4pT9TkfJYMHulWKpH2
 5cEUn2kRuOyjmY97hbrcmNOtk43nqwQWw11RNZE7UcnyQCQlOL8qZFCOsPWJjMRxqlsG9rnk1Bq
 K8x79k8xnQYTJrmqa3Visf989kXbO5B9P97XUyiJnZkzs7Ethkx/gINqxPnrGbgMW3h8UeNM+RG
 aGXNk7u14FbNe4nLq+6d4i6ufWv6fFLKTWk3YtsoBKeXYdyTEQseQNicZBO7luukQsDXnDK/V4N
 kwDC0HLsKP/sgnFvHhBoK7a4jrl3DM9kjUfSsOBTgqdQTEKyh2AmHIpvRM2NyTKlls0ERx+X
X-Proofpoint-ORIG-GUID: MDq-VItl4w-aBd820yhXg4nltsIOCUko
X-Proofpoint-GUID: MDq-VItl4w-aBd820yhXg4nltsIOCUko
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684c301d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=E+pfOR1jn8a0x6QusqFK4Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0NLLj492lcDJW-k-HvMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=744 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103
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

On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>   
>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>> +	unsigned long flags;
>>>   	u32 data;
>>>   
>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> +	--pll->pll_enable_cnt;
>>> +	if (pll->pll_enable_cnt < 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>> +					  "bug: imbalance in disabling PLL bias\n");
>>> +		return;
>>> +	} else if (pll->pll_enable_cnt > 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		return;
>>> +	} /* else: == 0 */
>>> +
>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>   	ndelay(250);
>>
>> What is this ndelay protecting? Is is to let the hardware to wind down
>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>> without any delay between them.
>>
> 
> Great question, but why do you ask me? The code was there already and
> MSM DRM drivers are not something I know and could provide context about.

Because it's you who are changing the code as you've faced the issue 
with recalc_rate.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
