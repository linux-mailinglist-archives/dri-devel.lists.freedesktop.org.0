Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F59B90571
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4415B10E426;
	Mon, 22 Sep 2025 11:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgGg0dC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9572110E426
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:24:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pqgh007069
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=; b=QgGg0dC6cMzJyY5V
 U4MIXE3SNPYSAo/GeX3s0AWO2iV/lZaMuwLV0Wp+fKBapBNp4ektQDDYmqerkttY
 if8+54j9ruF+bdo6p1HGdUhq+2gUwpJx0/pf2/F2OIQso1V9BQf7rKJUjjZK8TBM
 0VX71Cj4f2xbJSX9E1+Mli5BelOeuNLKtODYfkpmcoFGxuqHxnFkylKLSljR3CBN
 dz42Io3C3ivdvjik6hVWpJIKVCKDzbz8K5HX6Ek3d+0jZByGjxTvk/o3/oin5EtJ
 47qDlqVQ+pXDxj+FxFRrXJ29B3NrIF5dSBDPyxPem+71jcwg3T9suQ1knjYycfCA
 eSa8zA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e10q0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:24:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2698ede62c2so13782075ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758540295; x=1759145095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=;
 b=C7ei6JhTCcM9rNqrIu2L12AqiHG58GjzKDt1aJcTCs7AW5rzYtV0Q5XnUeNMZfjT8W
 4UyryyJjjvg0y9wJ3LkaI46ItM5RKKobtX37ljtVixHheyx0Ah3SqckgY6n1TaUNd6ab
 fd6MS028NIzuzNwv+qtItdJ7sLrNjPfaOVxYSUL0HwO4CLqaS4Dd7o6mcleqUIiesSnB
 rLqGdj/uoE6w4BgGS6EO/B4wDb7BJvLst9sL5Km3mu5I4RudMCZtBJn9s6uUBIzjdyTJ
 nfiCqCPRJKT0MW0Lf6trSWtXE2zDzlWM9KFapPwXoQIbNeujogUgdRnvIKZztZU7uv5x
 FWSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyMuLVtgJTxhcagSk6M8vvr8YNjfVm1+vMQLhx5neTMo05s/RM7S1pqji0qc182dVwMbsw47EmMV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMDnLFoMbrzwpRYUNUKJw7zmHUn3HhuVyOvImIiTY3qy0cyNVB
 MECXUJHOPTeE4tnE8IN5IY7gfvN0Fi7ojfh2fPa1Nq+KVQuYqhCsk/x4grQuajJZapryWRrX6ZJ
 WB1n9Livdq0cRdo4xY1MePscmHmk+U4uXoNv56UXtG4Veuq6cdXOHqNqmPBmzFqnJ68tA47g=
X-Gm-Gg: ASbGncs1N37XYRmUQD3IPH+7wRGgRBDSLKs8Qod3CIwQ7kiMWcn+W4BJn5HQsHiUGjI
 7laic5Osp8zCC11xy47PCUvvWVSuFbQW+pKXyatysGdbj6lAcDHSpQTMtKakzLrAVEA9/l6pHXB
 F92IjWDkCzjh/Ddy5wdPofg9H+y1mrfEH0e/j5bYAf30dS+vRusXYo9B0ZTAUzKNoWU2XuRasQB
 6KHTjoqmshwa+FOSAfCGWWnyJ0gUacIz7Jqyt2h8/pktiP1OV0hOIxXppT/E56g924RJhzzgRTT
 GfgFu38/Z0xuPbNXF7selcHA0pzEEsDqDwdMvn1JA/61AeKLlroydK9CqeurjbDoHg==
X-Received: by 2002:a17:902:d4c5:b0:267:c4fa:e269 with SMTP id
 d9443c01a7336-269ba40a079mr100698015ad.1.1758540294874; 
 Mon, 22 Sep 2025 04:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+c5b351K4AXCSVsRHuVDsbJ0ksLZK6y2QQ3N9fyfPYi1xv4nAje1JQyBpRpK9QX3Bk658FQ==
X-Received: by 2002:a17:902:d4c5:b0:267:c4fa:e269 with SMTP id
 d9443c01a7336-269ba40a079mr100697835ad.1.1758540294349; 
 Mon, 22 Sep 2025 04:24:54 -0700 (PDT)
Received: from [10.64.16.135] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269803416a2sm127178725ad.134.2025.09.22.04.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:24:53 -0700 (PDT)
Message-ID: <f4a5ffad-ca5e-4a54-a39b-4ed69ab3a729@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:24:45 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX8TIYXAG9FhBQ
 t9K70JXudn708pCZ7LY3czoqCN/wx72WtQFzFeWUIN3gx0mBHsc7vaE2lWBTKvRWsisi9f+xyV9
 WM8YbhRjrkFbJEdwprMLngsrc3wrjKM2SOm3MvlSlA9PU5JcrFtA7emvOdP3MiV9D6Y4ic5NYGP
 kOBf+RVNR+0S7Octk7MJg7XxTymrM8jUXrKnADbDFXHpMpl/KYKAhaW759kPcP/IHc9ECTZf2Cb
 pCiBAPq3AGIp42e2/6Viyc1su/b0robtnlodp+wIMitlgA3ftpj+ejqTCy8xwamtsHlNpSPJIPT
 4GhBBT/PQxF2j90OmUZeOOis1WjY7d8lt/NxRwcewfQPn6ta6+Fxd7K6WG/EluP9dqJwmNEEkgB
 RjcdViJu
X-Proofpoint-ORIG-GUID: mr1lnATV0FKlyLQ5r5R7ud2nvLxWc6NR
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d13207 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XVeZa78dugChcG7OFuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: mr1lnATV0FKlyLQ5r5R7ud2nvLxWc6NR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076
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


On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
>> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
>>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>>>> routines, voltage swing tables, and platform data. Add compatible
>>>> "qcs615-qmp-usb3-dp-phy".
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>>>>  1 file changed, 395 insertions(+)
>>>>
>>>> +
>>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
>>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
>>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
>>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
>>> Are you sure that these don't need to be adjusted based on
>>> qmp->orientation or selected lanes count?
>>>
>>> In fact... I don't see orientation handling for DP at all. Don't we need
>>> it?
>>
>> Thanks for the review.
>>
>> I agree with your reasoning and compared talos 14nm HPG with hana/kona
>> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
>> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
>> registers you pointed to are programmed with constant values regardless
>> of orientation or lane count. This has been confirmed from both the HPG
>> and the downstream reference driver.
> Thanks for the confirmation.
>
>> For orientation, from reference the only difference is DP_PHY_MODE, which
>> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
>> SW_PORTSELECT-related register, but due to talos lane mapping from the
>> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
>> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
>> orientation platform (not DP-over-TypeC), so there is no validated hardware
>> path for orientation flip on this platform.
> Wait... I thought that the the non-standard lane order is handled by the
> DP driver, then we should be able to handle the orientation inside PHY
> driver as usual.


Yes, I have confirmed this with our verification team.

For the non-standard lane order, handling flip requires swapping mapped 
lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
This is a hardware limitation, and with the current PHY driver we cannot
propagate orientation status to dp_ctrl for processing.


> Anyway, please add a FIXME comment into the source file and a note to
> the commit message that SW_PORTSELECT should be handled, but it's not a
> part of this patch for the stated reasons.


OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
related commit message.


>>
>>>> +
>>>> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>>> +
>>>> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
>>>> +			       status,
>>>> +			       ((status & BIT(1)) > 0),
>>>> +			       500,
>>>> +			       10000)){
>>>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>>>> +		return -ETIMEDOUT;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
