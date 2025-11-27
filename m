Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B9C8DEEF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D34610E678;
	Thu, 27 Nov 2025 11:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yp6uDTue";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALfXEIc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA80310E723
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:17:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AR9UR4W687527
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=; b=Yp6uDTueOa/0AY1Q
 LjECEL8Jio10tBDtJhhKn1Mol7IDjJwyvIve3SYLLiNCbO1lSwrq5xLAeSJ9wNkK
 tBPhKsdzPXDyMKzVNHKzwznERPPYNsratU4V4ZrDwKHDneNTXHHIuTBu9HJ7jV+J
 bhu8DSs2HhLM1j3bn6YzHK+oQUDHVubsvGkOY8Uv+eqZC1eNjXUnozVoia1qi3ld
 6Mo791QDbVdgh3bteyHVBTtKWMx/q6qTcI97k3jW9CnPvN+Ty0E0gepxcLyXqbTt
 6Epm01YBKqlMJe/NU33Xmcjx6t0ABSBL0h3N37h8UHfh2ybz3FYkzWiKKAXLGMgW
 nZrEGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rr9w1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:17:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso1625391cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 03:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764242252; x=1764847052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=;
 b=ALfXEIc+79qFQqVMkkK8C+eEHLmUOw+3vuRG3E6mFvMnk6cVre3mRlW2+7uJ8Kgx6B
 WhRTZAWCe0JwjY5i6HU4pEzyTkjjUJjX2q+VX+G9gYA9IC462zIqZKi9QhfQb4OKiPTI
 DIUwP1wZmyVMlhgyLZAjvckJ/Sau2yBcABvvips9BQS79uRSDEJRJG76IqzZj+TAEaXD
 0cvd6Q2KhMq+JIQBzBQ3B6zo/Ie8ZnUgHGCwsHcIcTRKrG9sDq0R43xBLiSnkWx7XRFM
 fTaUxKqLvQ8WhvWPjE3h9ucarItPY51Kbp5BYgi3KsDV691zeJJ7QFof2ihtwUn/l5fc
 FqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764242252; x=1764847052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=;
 b=GajGRKNQOOBOIQCEfg16sw3V9BPF+cd/K2V8sO9czMU1AoQILOjK5SgmjA3JaQzFED
 jCSqZaT0Vf+sCZTKF+Opan1CWqzI5awVHM20i413OtyYAPVqQGC9VU0kt0ZcixUJUmG/
 m8CvlG+TqmoItCeK7mwYnNUFxExf1SpspcLqgbU9xUlacQ4ESLzDL9hfxxxm5Ga7celS
 2XPAdZjHU2KHPVXYEVYjjKeRTkBcFBgdgjqQDXANOBbgg3MBcL88aCbUtZqmIxHoy2+X
 l7rfAvJV77ntHDzL0/TIFAoGyUGOO+LVERCDEo4IKMq8ueDyIdZQD48uwT80GHiSTzxp
 OBTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLd/wcXz7IROZe3aoeVX64sAyfa0I0lf74llNmf7LtQ0+8E9c+F0J3RSND/8ulAGnXY9EKLLSL56U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrLhe9Ibms/fzekML2Apg80r+pW/pzmL34z1mFUNJcuq6fh4n0
 anNmIyJ/gYNAw8cp+3BIasR5NnFvWfqC77BPHqvr5HvSEddHmolK5bUIP1sfbklq0GlxmQqKKe9
 lrpx4vqsEv0ZxtlwJe3pWbxbs/wtVbgSZM3X6xR6JmyCfnleoZF/YkXH2wWYqWA2e8//UcvU=
X-Gm-Gg: ASbGncsHfOdaUdQr465e/IhymHrhyyqO4OolD07u7oZxuMRdnBQyyczXxLLnxLgGNOd
 gHriisAJloOs1UnNQsMIQQYz64tye7UMpM+k5TNNarI29C4wafkW7HPiCA9FNjU0sBdXPtyJZez
 i5lHnfbSvCqfT2amGiToQoAgwNBt1DpYK40KPF9GRx1bRsBNDLQ1fUA0ogh9jkKZ+2VsVHMHESc
 pl4wC7/6FTLrI9IdUc2usg3XSgxLytW5k71DS7zlOfXo4al/QKe8L6UeOaB+AT0Ekpap/7HHbZi
 tinAMtoJvwgedK+K6C5QSMb8OipSw3OlD2M4k69OUxHm/82jvcrcrMt6NQIIWif2Lj6D7Udt3jX
 r9Eb62ifEmCgjiZkx7dKgUvXyK1BXWi1n9mOXHZk1bSItM+R6NtxwTF54bpLLIqZok5A=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4ee5883a43cmr226703671cf.1.1764242252173; 
 Thu, 27 Nov 2025 03:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWrKzvgUfp7pp0dFFrDH8KDul8sGDdmqACAOw/2L3t7uZiKm7I3Nq5DZgJOiLy/6fXAl6I3Q==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4ee5883a43cmr226703291cf.1.1764242251587; 
 Thu, 27 Nov 2025 03:17:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162bb6sm140900866b.12.2025.11.27.03.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 03:17:30 -0800 (PST)
Message-ID: <61e9791e-5222-46f4-a13c-6358a06a3912@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MyBTYWx0ZWRfX5NZSS14hWu8j
 VNpoBHXZeFeuG1aQ/QS9cuF43fe6IkrDt/WgmqGgUygn0e1fMf0OE83xC/dMMzGUbE0P8GFo7bS
 B8XAsKBmB0Acj6QfN6V2xOrbhknC1CSL4rFZ31bFMSMZjwpzW8j949DTfVCd5cCElwIug1Xnv8B
 YqgUGRW8UrrI3J9p3EfeghGYrCbaX4JOVZJ7F6Knsv/MXWrkzfSXpFpmOj/ELeIHu8TlOGuu0jr
 YML/NWxaJu37/l3yixztWxVZOrLCsGWTQx8p6uCOrW/TLP/zzB6OGSDlVm54Hcj5WPuezZ7avff
 tTtG9acz8c79bFHFh8toJqFKujFDhMiFmU+ZQ23fq4wGLVXaTU00bI9pi5faZh895Rp3UH7t1ih
 8h3G3jtRbjRx/UEnz1PWABUC/BKOyA==
X-Proofpoint-ORIG-GUID: g2WZ6WvpG6w9WGaHVBwy67S5ycm1WyLC
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=6928334d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAqZcY3_g_uuhliy_rEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: g2WZ6WvpG6w9WGaHVBwy67S5ycm1WyLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270083
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

On 11/25/25 4:25 PM, Prahlad Valluru wrote:
> Required vco rate is set by programming decimal and fraction
> from 64 bit calculation. This programmed rate is not exactly
> matching the requested rate and corresponding recalc_rate is
> having rounding error due to this delta.

Feel free to wrap your emails at 72 characters

> When setting byte_clk and byte_intf_clk from this pll,
> set_rate on byte_intf_clk resulting in dividers getting
> reprogrammed, which are already set from byte_clk.
> Convert this recalc_rate to KHz and back to Hz to round up
> this delta in calculation.

This feels odd. What if we wanted to set the non-1000-aligned rate?
I think the solution here would be to properly implement .determine_rate,
so that when we request e.g. 1 GHz, the clock framework will be aware
of 1.0001 (example numbers) that will actually be programmed

Konrad

> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..00f20c5a7c73 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	pll_freq += div_u64(tmp64, multiplier);
>  
>  	vco_rate = pll_freq;
> +	/*
> +	 * Recalculating the rate from dec and frac doesn't end up the rate
> +	 * we originally set. Convert the freq to KHz, round it up and
> +	 * convert it back to Hz.
> +	 */
> +	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
>  	pll_7nm->vco_current_rate = vco_rate;
>  
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> 
> ---
> base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
> change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
> 
> Best regards,
