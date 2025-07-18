Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A2B0A89A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8BE10EA0A;
	Fri, 18 Jul 2025 16:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkaTDaC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDE810EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:39:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFG87L030459
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=; b=HkaTDaC6s/J/40P7
 90dDaK0citrZ2sFZ8Dh0gUceH91jRj3u85aOcQW8/9fKKsQaJtJC5LpKt4p+GjwN
 CfNshQ5eVawT7etZrQMv5r4NSqy4I6yR5YJMz7fxppoSXQmgoUoILqeHyLIlLOqC
 wr8plijnScugHjHSisURYR8D3cey3Fb15zgURWipnhdmuQiTG6txC4mJ86E/X72e
 XQXibIQFHJpXhQbg0zzwlydumlKFVg3GGnjrjEX9Bx9Zi+FJtJFOCSAjxZ7qGed2
 ELPeGtIZG0iLMhnunHLkUCUFKomYtlg243qNdheSxo61fs87Q/ywYb9NyXoaLKAK
 h/d30g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s4kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:38:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2c00e965d0so1536772a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856738; x=1753461538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaUEOpwnu6NxdO/qUIkj5n83QZNRBaNn9dV7MFSL2zs=;
 b=gSiGJl7xrytwyxENcwp+pxn8JOc8l/mz6QHZOkNanAWstIFZoyjOAqzkYr6xwH9MSV
 JKyxNn4nyLfeNYsg7Va7euC3gPDxjUqOTjx40vQEaOnvDr0R3rUjqdNesC7qZtSrUwVA
 0W0C8D1MqpcwxiaDhf2ZNjED0un2F9EUQ53FdnAkDQyCI/4Vk0AXRNQe1EjBzXeOXCPs
 gp6gCua6kJod/JvQshC8X3VvmGx8/7MQOjzXYHZ1U6zKw1GRUHR29k7Mg2FghRyLltI7
 pPSLbQzFo3theSskiv38+Ql+kkldZHUBom2M4z6G/pwahlECYSalrZvArttsFDPjUVqM
 8DAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsKutL3PEYIrNJWvqLQNgDo1BoKg03FKo44SCYzxtbloyDEad/UAB5+0EAM2+OY3HfEPVm1q4hsOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtRjayyYCaAxiUY0eNNEhQyBAxFhRHD0mdTQjgrM7QK519oAGU
 /zSOmAYwflcxp08ppdU7V/dMC2gwJstlaJXJDKX17H4MRyCKNZDwIlJDWfKqWhQWxkMtDgKN8N0
 TIOlJLokMN9XkuqrzcthQAcP8eYIggxSH+M2IDHGSlevMZRKkIMji5tCvgns+N/kVnxVYYIE=
X-Gm-Gg: ASbGncsUcgv9YM7HcDQT0jiOSSLTzMmTsGVFLbZrbtK1d2cXf6tTMbDHvETuyTiLs4S
 W4tefgyHLhnqnXJX0uBy+7qtJVXwigLQ5KiF3U9/NvevG/xTxD4Im25RK8NATNxMaQrSVIdWLGj
 TdlXsqQ/n79I98wEnzhK1tOSJLUZ4p++YAKQfUcGwoTJv+6wAyWqJlh+1O3NFCXM5QcJ+UIVQn/
 uAFN1p4TYCljLzQ4YrSFRnH6BrzkzQQgbDEpTUkdV8h0nK27dcRfU6ugs6c6+6TkGl0eF4iuzw9
 VwHIVE9DaLJkJM9BojAw2Bre5VGnbzYDarVtC3bAtxO6qhFu3vx0tLKoVoqZM1vGjCmS4WDlv2F
 7ROQVhlYgsn9wbCOx6vU1IA==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31c9e6f7349mr16793142a91.11.1752856738036; 
 Fri, 18 Jul 2025 09:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/f3rHzk4HPCgwLaXFm4dfM3m4MOQeIgsDbrovnS/sFrTTPhvP8QSgCYuhbvY+4m4y3AewIw==
X-Received: by 2002:a17:90b:3c09:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31c9e6f7349mr16793103a91.11.1752856737571; 
 Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3f46ffdsm1573045a91.40.2025.07.18.09.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:38:57 -0700 (PDT)
Message-ID: <5bc7cf1e-edb6-4bf4-803c-f84d51fb1534@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:38:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <b8d6edef-6809-4166-b936-fd000513df90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOSBTYWx0ZWRfXxLl0umzKLPFW
 JYyW8u/Eqn1SSZf8/N+oUgwH17qVYCXhgHVBuyVAhSfODXM/sB6dIC+NkutV8U5LUr/h/7+U6wc
 S0jz/xul1Vytgx7Pl8altcG5bYsWfRx2UM/O36oaSkqLqrGLG6vt+Ik6KlJ2eLnjf4f2n8pZaKy
 6k8EZvt8RJOCKNyZsd04R443a9LGoH5mOeOZM7+EefUp9NnmTNH4EFpZ0NmnMGh/bHdHTsMEoHx
 w4loxptflNDcR+NA8kBdQ43iN7sjWrc7dEsq5DWtfNoiozxh2HE4g48zLll8BJYmvHatUYNr/re
 IKztP4N5AVnKXxW1Q+pKAsQorREjHHaO7F0x0WE4OZegOszCGSy6wH5wa1K5F4UexxGwoDN+fLT
 +d5moic8ABOvc+i6yMdWJtZS3rDnccSldIRqrxw7qkhDdrFY/4DCL26mSqCugurCopTCguyc
X-Proofpoint-GUID: u31T5B4PBLl9o7zPObxXx9gObgYmpErO
X-Proofpoint-ORIG-GUID: u31T5B4PBLl9o7zPObxXx9gObgYmpErO
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a78a3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=bF9fvQb-GeUcl4pYUR4A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=833 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180129
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



On 7/17/2025 11:16 PM, Krzysztof Kozlowski wrote:
> On 18/07/2025 01:28, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add x1e80100 to the dp-controller bindings, fix the
>> displayport-controller reg bindings, and drop
>> assigned-clock-parents/assigned-clocks
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> 
> 
> That's not a correct tag really - drop the quotes. If this was added by
> b4, I think you might be using an older version.

Hi Krzysztof,

Thanks for the catch -- I'll upgrade b4.

BR,

Jessica Zhang

> 
> 
> Best regards,
> Krzysztof

