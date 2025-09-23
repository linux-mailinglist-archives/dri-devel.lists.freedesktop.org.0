Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED345B94265
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575CD10E54D;
	Tue, 23 Sep 2025 03:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mR0xTMk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80D10E54B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N3Ptbv008034
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2tzkEhv21yTBLeb655r/JRLn+hEu6MSXtvaBf3prN/k=; b=mR0xTMk7SYm1YjCV
 WkPMqhpmOqIXsElhJzbZ7XVz/ATIzxT1wf+Mp2nHpYBOQtv5GqqYlZEZnNjyMMDg
 aoErKwfUe+1uuEYXWKMXU5vH2/HJuXe7Yeyr4C54NJ9UakD8DwoSl1SUyH3m3Ish
 gZ9xpv87yBI+jo4DGggh54wuhBTnyEbdM4vymCLSz6KDnDaJSgonExwBYMSAP+iY
 3ihwjPNdcv2haCwKexoWhhKFor12Bgv+JpnpatS9XkP+tGyoB95DWNj4lholDFl1
 LfwU/5/n559eoA9pMByq0sjByOob47xx94qh1roNBcvVROJMH45FqkJ3IqVx5jRb
 7Q2Piw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeqa3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26970768df5so12041235ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758599319; x=1759204119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2tzkEhv21yTBLeb655r/JRLn+hEu6MSXtvaBf3prN/k=;
 b=QpLqghhEkjoHXaW35voL0JZMLClaD6gsyw8FcD+iQ2Px7hgj+sh7HpASTLtGOpURR8
 EZ7MlZWnlctCQH71F+hEeuGPzNdmFYA0QQm4hN+JItJMLgJulsooyJJVsRZWaSPKTY6T
 PMr4QcH+fMl/f+wJB250xqEqwQBvKJBOHYzRAXxMk3Zp9AjghUn6lWVgZOXON7dKIoRO
 tjBZwBMf0IO15+aXFMcdpBNMvVObyF2uBsuvVN7vvgq46slecXYFFbfSdm8Y4X8a8OKH
 Heqva9ow/+8LnFwM4/WX8U/aKWb/f5U08TOran/XdWyBit+uCp9FTXl1+yFG6K8H5Rtu
 dc5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxOCqX12GFHLCUUwL/wdoDlu+UCyjkpXqPIjZtfPOmxZ5BAvP132FHKTdx9/ybICCYzWfw4g18EXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9bx8e8WRudduAQ/gsE17XYpsXzOcEax3HeEaJXgimTQpLnOhf
 IsTVBWM6hBS8HlWH2DpIdwz2VGgCXbRRTU8p2G+MPPH6ujyASrwhwzb9HPFRQOOsmpPYsCRmfem
 tzD5KKpuJjYoosvYsDeRuD7ZABhm2pe0fkZSdJUJSxgsE4ANc1PemiNiLtaZlmWHCZZOgY/I=
X-Gm-Gg: ASbGncsJiGWrensJOwLO+VkfyhTK7yzYIohinMYnBPDOex0zrKMMe3bP3YYz55B/wvG
 1lJ17E0ED8Xs564LIJzSet8kgD3l0zzVEw+bTqW0Vw9fCOqF3uOvwr4R5fsto36hfogULTumB09
 GzErIIrgNI//V7w+2nBP5MmsWNEQIeuqRW3ycerolQg+K5PZDV69s44iK9oOIiFbLdTHot6cW+U
 ++k2ov/KUJF9TTO88R6mntTp46+NDAsg+ERdsM9ecCgmv64Hrkmo0Z3jlqeeEeEefRm6P2G30r/
 w0EwxSRd3R1RIjW4LDJM6OJ4iT92npa/KrByFGMP5ozoJ/juY6dRLcXPducOCUG6BiKePB1uRsF
 YVT3vfOsZFe8cGWNOVDVg4LhK5uw6dQ5X9Nw=
X-Received: by 2002:a17:902:cecd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27cc3ef18c4mr7163285ad.5.1758599319033; 
 Mon, 22 Sep 2025 20:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuGCVKMlhrcuNyLUyo+F4+9Dcxv31AiSgDCtjDNN8GbHcs7dWnyk69V9F4hUnIXmzLqt7jMw==
X-Received: by 2002:a17:902:cecd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27cc3ef18c4mr7162965ad.5.1758599318561; 
 Mon, 22 Sep 2025 20:48:38 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698016bea0sm148159875ad.40.2025.09.22.20.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 20:48:38 -0700 (PDT)
Message-ID: <83e8c8b6-fd2c-41f5-8732-703d47764d0f@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 11:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
 <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
 <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h6yqWEFvesQajQA03iC5l3nIo1pVeJ20
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d21897 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NbDaqmtucRuFR4rafzwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+XEVYwSLmbzT
 UROPuoKaHquj8ybXq7ivcWglLuWGQQZVyCqVyAW+Z44p8+jKXHjcBmnB3jC+KgtLMoJaTNSXRNC
 jmsJE5cjMykNmfusZkxz/He5FMgB8ETB8sb2iylKBUT14uRS+fG18TWsHR+g3dvSFyqAvDOcwH5
 Q2T8ZjGLR3CQUQK3gX7wkvcpNcY1GYTkiLghZPezM0zmJfpgcUDn9HUogDuVb5co0l6RXr/Dwaf
 UZNqu+VlVxS4+MMh2AsX6VlvqWy1lVqBdz4eH0AGn2JyACqoIrCsgEYCRrXa2aOkbNTipQvKivj
 M+ZMir0ObdD7b62p7dnNCyUWsHrgkWlyU0xxDGMLR0lzX6NtNlubt9arh6LO24Vq5Fsluiq9ext
 bx/38DhP
X-Proofpoint-ORIG-GUID: h6yqWEFvesQajQA03iC5l3nIo1pVeJ20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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


On 9/23/2025 7:38 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 07:28:17PM +0800, Xiangxu Yin wrote:
>> On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
>>>> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>>>>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>>>>>> routines, voltage swing tables, and platform data. Add compatible
>>>>>> "qcs615-qmp-usb3-dp-phy".
>>>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 395 insertions(+)
>>>>>>
>>>>>> +
>>>>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>>>>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
>>>>> Are you sure that these don't need to be adjusted based on
>>>>> qmp->orientation or selected lanes count?
>>>>>
>>>>> In fact... I don't see orientation handling for DP at all. Don't we need
>>>>> it?
>>>> Thanks for the review.
>>>>
>>>> I agree with your reasoning and compared talos 14nm HPG with hana/kona
>>>> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
>>>> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
>>>> registers you pointed to are programmed with constant values regardless
>>>> of orientation or lane count. This has been confirmed from both the HPG
>>>> and the downstream reference driver.
>>> Thanks for the confirmation.
>>>
>>>> For orientation, from reference the only difference is DP_PHY_MODE, which
>>>> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
>>>> SW_PORTSELECT-related register, but due to talos lane mapping from the
>>>> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
>>>> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
>>>> orientation platform (not DP-over-TypeC), so there is no validated hardware
>>>> path for orientation flip on this platform.
>>> Wait... I thought that the the non-standard lane order is handled by the
>>> DP driver, then we should be able to handle the orientation inside PHY
>>> driver as usual.
>>
>> Yes, I have confirmed this with our verification team.
>>
>> For the non-standard lane order, handling flip requires swapping mapped 
>> lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
>> This is a hardware limitation, and with the current PHY driver we cannot
>> propagate orientation status to dp_ctrl for processing.
> This might mean that we might need to make DP host receive mux
> messages...


Yeah, downstream handles this by passing orientation and lane_cnt info via the
DP_PHY_SPARE0 PHY register. But even with that approach, dp_ctrl would still 
need access PHY address area.

Let's see if there’s any follow-up on extending this in the future.


>>
>>> Anyway, please add a FIXME comment into the source file and a note to
>>> the commit message that SW_PORTSELECT should be handled, but it's not a
>>> part of this patch for the stated reasons.
>>
>> OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
>> related commit message.
> Thanks!
>
