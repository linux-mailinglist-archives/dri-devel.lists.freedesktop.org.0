Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8BB31282
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC410EAA5;
	Fri, 22 Aug 2025 09:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGLmcP9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520710EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJAj020865
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=; b=ZGLmcP9nYIXNfPDT
 gU9FtFbEBKZSTsVW8aLigBY5uEQ/hnFdyNcvyHFUZD9fPKNDnHTRCJBlN8/Qt7UC
 vBgrKPcz0yA2adVkAsptuqijCFbVEc8H9ejj31wnFtreBmRb6oCLnNZ3NGVJfbmP
 8GlXXefuEt80YiooSQ0riLJyEJ2oSppWw4XNysM51MQSLPJ6xKkw0JDyZ0cyHUh/
 K1p3uKUyoZCwLheemmfi0z/PcE5UNZynhwHqy+njDzVy+o9yURLG/LQXcMmJ8ouV
 nWcXj/CFMTBlFX8adGal7WHiD83vbzUXo/jA3NBQJOG/2FDu0ZOIZgdWiWBZb9am
 M/mYpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290mh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:05:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d9eb2eb9bso4225536d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755853517; x=1756458317;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=;
 b=q488fnlnKxon5j8dI0sewlVEadqqhK1o5XFQ7qlmA6NkdnG398Fd/j8jZhSQeymv1F
 M89QTuAaer4bKW23M+WiyNmFldUx4/Q2cC1iGVhO3x3NrnAxry0POvvcv5/GB0KGqap8
 27Z1KzCnXtYgd1j7vpphO7TpLpVgOj3gcsiVDpn4Npprj50hS+0PylJ0YVzDmjE8sRNR
 yoBXTyWUHgfldikIFArRY34bEnwZxnnh5e1mvJ1l4A8eQ5cW33RF9ybya6A9mQ6NnMwm
 LbwsCxr/4sUc1GhgJ/0Od9XfFwzjAzyyuZsspvSTpeFSsaAt3No7lsGfafXMvFwTU2k0
 ZY7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFwI1sFlq14XdhpHGAAZuZFApEPFx1klLSx5FJzjBaEeS52d1e6Izgm1/M44VZC7Pu1BmbVcZMAO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+3mRNt7ohlgUCF5kECa4mwy3PSX5t0QO/vlF9eCxfjZwl72Ao
 ugcZVvHTDkjxW6EKlGi1nLzv1Wn410uVXYabjOf5/Z+T60YHzGyqLWcdSlUlgXqTS+Owvf3ezM2
 pMMrHcocA4/VZLlRuywZQ4jNFEdhjbTv6GRrYNbcy5VrKnreAcrLrJaNYP9/IY2ejf3qrq1U=
X-Gm-Gg: ASbGnctfwnJAkQ47TWOQU7lXAbqcyBZDky44/xTyjVMITSNMzp2tlUv/n6TgtHlBrUb
 jy7Mc+Xk3Dy2ttC1IHIKjePT3r6qD56jX7u62nctN8M4JclwC6dUY8Mg044Oz4+GvIT1ji7erpb
 OZVu6rGdOkESrEr7f+MRq3LOJ1vtQBJhVoQCjmIVx51fCG824Hcom0WUGHW1jW/ulUcQd2+jsho
 /PSnvu53JtRwj2I7B5bZqylrRzY1J8HtpKb4lcd4+LmqYFQRQuDf95gKVladeKSs3DilEk80gBV
 oaoOFWA8L5eGMS2KqsZv14jnZLf8c8nV6ergl/4Li08WrNqBAfPLX2lBh4w1YEhpp5d29vFiOIZ
 EczUWbwVbk6Fa89VJtQ==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id
 6a1803df08f44-70d9723e3d8mr27746986d6.62.1755853516774; 
 Fri, 22 Aug 2025 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxMWfBZW68IB/KZovde+NRVxhgZvhNidsma5/daN4tO/i9zHYH0AJAj9sHGZxcIBJB4AMYUw==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id
 6a1803df08f44-70d9723e3d8mr27746106d6.62.1755853515855; 
 Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a48b46bsm32794951fa.36.2025.08.22.02.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Message-ID: <d4e1f836-afbb-4cc7-a5fd-fa961e3203ec@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 12:05:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
 <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
 <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a832cd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=G97a9vFw7kLByEIGoT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: t45-xgXCUbFNEl0wZyS5RcgtSUm-OHoU
X-Proofpoint-ORIG-GUID: t45-xgXCUbFNEl0wZyS5RcgtSUm-OHoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5xRxil8Ouziz
 L3pk6h9CYQRNADVfePO3clYZvgDVIR9QmMBIp0D+of4g1KmYyjg0SqfOjJJ7Hpn389JtGkrbmxs
 6dg+dp9kIfnoYXUo5fPmayPhHQldbX5UGT9516zj+Boxut7w36zYJ2GU5OVHu69KDKYJwKeMYv3
 evKcoHxwSol+DhzeTcGLdrllu+rJkIsc1EWlcE0eEgNOIQ1SieVqabr50CFGXnEoYEKCftUZBou
 W2vAOCZuv6lnJjyTTIrZU+ohPsL7PzYDzgnT7XEsRxUBRRGh9wo9ljhJ32LKJEociA3V8vK62yR
 PZXOR8LRDPpYl154XK2mo1la50RSaQ9gfCXYOJ5p6JaF6JF3s7LEev0Y8JXzA2LHrZ96XR0xVZF
 zuuTaF7tJKDE7sL9RdFBAMrevQqFww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On 22/08/2025 09:59, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:47 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
>>> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
>>> including register offsets, init tables, and callback hooks. Also
>>> update qmp_usbc struct to track DP-related resources and state.
>>> This enables support for USB/DP switchable Type-C PHYs that operate
>>> in either mode.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>>>   1 file changed, 55 insertions(+), 18 deletions(-)
>>>
>>>   
>>> +	struct regmap *tcsr_map;
>>> +	u32 vls_clamp_reg;
>>> +	u32 dp_phy_mode_reg;
>>> +
>>>   	struct mutex phy_mutex;
>>>   
>>> +	struct phy *usb_phy;
>> Should be a part of the previous patch.
> 
> 
> Ok, will move usb_phy rename to patch 'Rename USB-specific ops',
> 
> then shall I need drop the |Reviewed-by| tag in that patch since it will change?

Depends on the amount of changes.

-- 
With best wishes
Dmitry
