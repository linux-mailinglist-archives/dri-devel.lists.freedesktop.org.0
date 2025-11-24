Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59BC80445
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E75610E226;
	Mon, 24 Nov 2025 11:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKKZhE3l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkhRgbH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E3710E226
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:50:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOB5rTY4003314
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=; b=XKKZhE3llSXa1Gm/
 7Yp+REN2mq2CqgZkBnv4Y0EfAj0fvh0/KoypqlhZG8GHERKOF63CKIZDf8Tc8lOc
 BuLKy1X4zDCJYjbfzaOZ2QrLXCH1jjIvwVXe1VzxSwzKKhT065oik5yc8lYvCodI
 2spf4bTKj26mKf2PZ//KY1T1iD/YNpgsIQbz6qBmh10cxYRGoL08bRLh1PnRUKJO
 +ilDVrWx524xztAVJvob441DfizBRbx81+syFoTF7AIqE55c40K+/8XeLnKRut9E
 LbkLMLgBK3uJ5/QQV90Vsd6bCnFOPpeCqS3toeJPhDOZT48nJE8hxn46k4dwC3A9
 MQKzRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h03jb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:50:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so15630821cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763985020; x=1764589820;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=;
 b=dkhRgbH//ZQkG3+o34D1EkzMWNGblaW9MQ/oINH6fizmycboyO4ZCRwgogatYK/6wY
 qre6K4fvR0bJfcvPyJiS3qSzkEu2Sl9/qrdvFnai0hM1dQ+jeOdkrvb1gQr4vswSxqOS
 PMFzHe+NfoOeEwgQg+abRrIZDcTO05sAjrjMBQm0T5QGa/uoO+zPcG/gQFGLRUMO/lVo
 noPe7hvfIqhQDZ9ZckdYtV4u7xIw1ZFm2QoVk9hnTSPyzQ0FA/SGG0CHz/5ZDZ/Ep2VJ
 oGUC0Wf5fUdtJ9veC+e56U+6oganDg/Vr0icMKc6pP+Vvkx7Qc5diG1Kg0Ywz4cXzraU
 7SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763985020; x=1764589820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=;
 b=pDMj3eZPzE3Dut+OJhWABkbqAxfI0Bmr27HY7WigDdoxgmi3jt3rt6IJnf1y8xUL4O
 7NnOlfvt4PtM2E1yWP6xOFIAmzKCrK8dyWCCywRF8Nu1CHGkpbBgsALPJuSJoAWV+4UF
 61fPDpSmxNR4ZRYKEo8g8sx7DpuCwixRg8D+F+UXQWTeo3N6uH50YXQBDTHgWFfsByb6
 igmfFqqaBR7UEg18k6eGpTG8hPk8EHFndOVc0gs1x+wolulUgY9vxHwwBV+WJZ1neyN4
 2juUb/KPKc8AKkt6a+Gep4tUuLjmWkxikF+rMtQgrhnL6RF7+YOT3lG3ZuuK+U2yQsum
 4cfg==
X-Gm-Message-State: AOJu0YwNEqfb3kCW5ZKPtPQ3kk8E5WSm7O0dzhCA9mtyLbySRaZAuOns
 luK1bWzWFHOP0T8CT25vrny0izQC+kK8I9cjOr2E5sLrygguV+P4i9uX9u7OpKCMaAHbY1326yD
 GZuxl3ZflAhLPHnlFAQKYTCS1jPvdF4b08pPDzngts0UNA536CpEiFPVsLYWcz0KkQ21rvR4=
X-Gm-Gg: ASbGncvQxmxrBVQCb52YcJYSC7muRw06lnQv7qCmw+cx0eo8QVVy6Gs2H//0wfXnMar
 3BOYl5KMionxd741Y1VrHSHE8aJvwlEbPjiyyHxGThtWLkkxNn5RaMr4fsoA5JC1qadr/NVchFc
 bmxKkbtoRNREaPyIgNsjTdjFmNA49kEFV3GK62aakK9Uqze0XHU3mTIiKX7KzYve6dvghlMlqU3
 CmpqaMD9cbmorxJmPPCgS6yobONWyAM+jlMpezBVtUtZF0ouyc0iXT3IS5CjFYEFF46PXRuMG4Q
 A6pW/VJAGumWqxVSfiKEFJx+qiFMT0v+5yIMcENYy7dFkuqWROXbREhEJq6vNoy7r9F/pR7ersT
 UNaI++XrJKnFvGaxRnrcoq2pirWMA8D4Q8UMM44O8G0BpmFuLWSGboOGH1E+6mgiLJ+4=
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id
 d75a77b69052e-4ee5883b027mr117948541cf.1.1763985019914; 
 Mon, 24 Nov 2025 03:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE3hRkWmJEOyRnNOZZEZAnqlcqwW4OAL2/F0nzRAv2dxmHvVXnDv1yESoMj2ty1Q56BsWPlg==
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id
 d75a77b69052e-4ee5883b027mr117948311cf.1.1763985019541; 
 Mon, 24 Nov 2025 03:50:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d54cf2sm1265048966b.18.2025.11.24.03.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:50:19 -0800 (PST)
Message-ID: <6be43c27-dea5-4607-ab22-431e3d99492c@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI
 port
To: maud_spierings@hotmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-4-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-4-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwNCBTYWx0ZWRfXzdvdT8w6LF86
 xtpb8S0VKxMGMKXD7resMhmS0ICWEh3mePxqzoGXCH4EXa1/6/UBkDRlbBFKZdrd2xsExYBOxYG
 wZOx5EMcs1Z5DiIpW15l7GqqHp1YDDZIhuBwbAn3AUSxlMqNDiGThvWNs9MyYgXfj/K/STnYNcE
 +vtOtFv9mw96V59Bm5lYHnBwW5v9pjT0gTLd3NObUyAsBTjqHDvNAAV4gDfmED68mhDkhSvo+Yn
 W/yDzJs2E0zLnKSgXM1p3AQ3Ar+rXzMppLH3Joe3XYLwV0i7DzNWqwYkoXhx8RMX/C/QOZYi5GI
 5yzhabg8DdB4Ayd1apRtKe0eQCUwqRONwv4/mCzyco8ndtja+JkvM5sLGgkJfWsE0d2+ploIjwQ
 TjrVWMNVa2o72cAUuf5j+qzZ0FpF4g==
X-Proofpoint-GUID: GlrK7wbbgJRBAik3oaBpRJgFKsEaEByv
X-Proofpoint-ORIG-GUID: GlrK7wbbgJRBAik3oaBpRJgFKsEaEByv
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=6924467c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=ucDlCoAaIB5v6D95Jc0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240104
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

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable the HDMI port on left side of the laptop.
> 
> The display signal is routed through a simple Displayport to HDMI
> bridge.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
