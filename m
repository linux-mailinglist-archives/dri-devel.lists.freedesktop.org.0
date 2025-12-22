Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDBBCD549F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76410E574;
	Mon, 22 Dec 2025 09:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o54YCYNT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XL1gqkqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38510E193
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:18:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7XfAd4015153
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=; b=o54YCYNTx0UU/kYD
 z5e8DdKACNzzScV1LgaditU+lnOH4Ou5Vg/4ElMR3KCYVUsL1RTSPFqDyt5QK0bd
 jSPqiyENlCD62517Zlnjm5gCBo8+jnELUQ1J4q5q/YNWOr4XM3HLFnpYWkufCVVc
 veJg57goy8kWdVJvIsE5ah7e4x6VtQLnke0IkbOLYI6EIoLR7BRQlS3lNt+wtlvw
 tufaD53RA50bkEb4E2UvZ5YieBtfe2c/w5x51f0fDlkP7jnYL1m++l4/ej47yX/u
 evj8H6/HZ93GdcUFAXqMyO8k6r1KdoK5C0Zxtj2GUh2a0QcNc8EFmzdYE4DqtuMa
 XmIvAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfme75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:18:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b9f3eaae4bso127608485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766395126; x=1766999926;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=;
 b=XL1gqkqdBNXQlTYBJlNvvrfiJzE9064vYv/9rr/icZh9VwA0/R6Ep52UXc7k9Duj3l
 AxAfsvju19JcxQddZ9Fuq5NkwC2bIlR2V2CC+PgaGxlRQ+ZWQ0Crwd66AWlj7lHaYGCB
 Ey3Y3/dSbcBFyiHcdFH3b7208USpkCvgav47fJLvlkbjQ0G0xx0hpdfR8CEkZECh5zQ6
 1oC1ntkEzGS5+zaVN7nzfbcu8chri+051KiwATNXIoDDd6EHXeuC7POymx2ImGaP1X2D
 05sOmsIpXVzysVm6JIZBd5ktS2sYDm0hWuTLsJFkuqcMSUxOytwq8jtrJEMF/bgX0axg
 p9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766395126; x=1766999926;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RAvA3mZeZ2Q0GgdO+s33U41pWzM3V2aBju0glgF8spI=;
 b=wL+YSaAjAKPJFZx0VVetD/mvsPxfLvHpO55yISNNgUasoWJoH090JSXJD4k0b13zUm
 1BvJxl5nT8g2J9HWv7dWCgG3VApcvWrxPtUjTDZB/LWx1isBfrrqUnYYfzuCrnQvxqE8
 AXcSw3G8xT0PFjMEARZkGZGu9AMy/hCzu2w+XmkvCO47BozZKFaem9e34MOapl7fsr9z
 +cHqeRGtWQyCjTjEyK9s47TckX31vx05T2xSCVD1th9/5ynSbTgahsSqJtpGnTa7RnoB
 tm6au63A0RME8XfDzBzY4FdmQu4/Vokylwg8qnbZ/ORhCSZTe3XqddE/YSUYFaUH30m8
 6+vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6Rm8TIWKFKBkkl3PTmsGFMtQ1gAIItBWYoFxyzo81GqWDPreuvWkaIrMWY7/nKQ/PHuK3FC9oeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9a7nUV0+KnnG2W5zmtK6brdB5H/VkXEub/rkJYwbKdCMriKj9
 +cRHKbv6Bbv46oj/uXRo3Ia91o46TVKmfWfbXOh44bpnJ2EaW4tUvydcoJolZjK8fk3thJeAqvL
 Ryt8LLYrPpkQWSivpRfQuqNJTwwX7e/WtiqZmzBgZvf5rRf5DWiy0WOnS2uQ9/nTf9AlnfV4=
X-Gm-Gg: AY/fxX7hLggifsPrsJh+UAcWI6jLzK8N+CNXyxL3HnABUdST5B/KbO33Vnpk9WU0l9s
 PSToUXu2HRLdpjzihsgRfaXWdvcydQsEoR1YykgyY9Mf8YH/AiMl3X8h7Kt3kI/8ua9sSDKdRqs
 +JTIiXWzY/4Zp2YJ6YXIbkUDm4QqBPkkTxqrz+/x7CkQvkO+/QStH0vjwtM1qUw0thKtwiobAU3
 l6r6z8/Dq/gvb3VQiehGKVphWYkNow6QII276lMa4NsWFmUoHgG5sGZSU4/IKFDotyNzAIc2ek/
 734CP6DJClSrzI5stg6nid0SyguE6Om8QCLOCelfz1GRwcyiciEBRntzhosLTFwTlWTkJb0dC22
 i2Xo+BDCIZZlSMmb78wR/aWDDqCYti4jsKzI/uh0CbEY/5Wn0tm8nMXfj+sKqTgNmVg==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id
 d75a77b69052e-4f4abdcbf88mr119858431cf.8.1766395125885; 
 Mon, 22 Dec 2025 01:18:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzz7ND2Qg9PP/UI3m9HQXYVf/0AKYGPMsstozA6wVCxvhjMvxQRErpso0zoeIbFSYwX0JS4w==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id
 d75a77b69052e-4f4abdcbf88mr119858321cf.8.1766395125476; 
 Mon, 22 Dec 2025 01:18:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8056ff4925sm588823466b.31.2025.12.22.01.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:18:45 -0800 (PST)
Message-ID: <42277e53-b159-435a-bc76-5aabfc00eaae@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] arm64: dts: qcom: milos: Add MDSS
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69490cf6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=ejjXnbaoI3aoak-AvoAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ljIwhak2t2zqIuJxExSPwGS9kOOV6H5y
X-Proofpoint-GUID: ljIwhak2t2zqIuJxExSPwGS9kOOV6H5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXzPL7tifKmzVd
 RzyMuRNnAzuWtLdKwA1bRyeousTi3NbcfgnLmuqIjGQ2YP6eKMgcmGPLdFezRxFXvkvwD3TDPgy
 qan3xQyIEQdU+kCf/YdcoTRdmf7QdFGUWK3rwRldMD46kS2RvuryTAz6YAjIPtCiCFvFnZtCAzi
 zVBfhVUh9rQVpYcLIXGZXW57bzEaGe0UKiMeC2WcnjiEG7JNSQAQhOpUp5n+6+PvdDemaspchPW
 3ShZNZT5jNbU7rqowACqZ/Lh3QzdA/2osPj7vGHC8+R/x16b8kvHKAe376lDRdSDR6aweY4AQ+p
 KUGNGg4li7nZRFfaRY+47d9WmFTbSHnqNjTVCgNO7GA3V406keg5HmBx+rSSA6NpIL+MwEo9DvW
 8jg0QMvAbqp7xEUFesH9VyOcRJyGZchZxSH/se5aQzBRyEMl9QLisio+kIy61gBJrBabqu7s0Vh
 a2o1saByCzPAtvTQftA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083
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

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Please include a commit message for the follow-up submission

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,milos-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

len=0x3000

[...]

> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0x0 0x0ae94000 0x0 0x400>;

len=0x1000

[...]

> +			mdss_dsi0_phy: phy@ae95000 {
> +				compatible = "qcom,milos-dsi-phy-4nm";
> +				reg = <0x0 0x0ae95000 0x0 0x200>,
> +				      <0x0 0x0ae95200 0x0 0x280>,

0x300

Other things look good!

Konrad
