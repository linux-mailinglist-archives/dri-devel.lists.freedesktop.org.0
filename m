Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E4B905A9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D05210E429;
	Mon, 22 Sep 2025 11:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1nb9aYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5864C10E429
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vRre005777
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=; b=n1nb9aYOq3EyHaOj
 c4UBjNTgHUM9vgFrThXaqHS1hfPu1iMbOUHCh6iKl/L1F1Zcaea+R2gwTtejObuc
 SOY3KNd1R+57NuGeHMOfpZ9wsghm0SlG05acoIW55/VOhHnL/SLGyOa4VOTv2/ac
 7HBMVoFFCaO7kvHLd2mLRdLYF2AJbRlpUA5L9VYsKJD9Zk5dbm1ORIDPBah/zBZq
 Dx6AJ3pO1SPme64NP9ZSHL9314yOKJW5pBmmiZuthVX6xzJRcTIorD9Z6uGcvH/t
 zu9TTWsxcV33O4NULgx1A9R5fFDtfujo1aS6CsNhVnOYA5uo/Uyy9uMmRtM4pUxI
 fM7q5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7cjfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:28:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2680b3acdf0so8625385ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758540507; x=1759145307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vhPS2DpVO5rMmjT/67K3Kgtn22q0loN6kh/+0Y18da0=;
 b=egLHZCiOxUJdOMTiGiWrTRzWmdG3LCIe11092x/S75AWpNDIGIKUa+gLgv7axIWXLQ
 8dgGjKqkTgDDobsMpf6iYA1obtYqnqIob29BvLtKkqmzBBvTxY2yVgP0xTWdoLexEiqx
 kC180KcI8PdVW/q5Q4TvtXbfQFFI274KKc4K+wPQtesrLcGk6RdJ/bBRFbvScvu0GeES
 8ce/g5CagDedLzj72sxiBJC3Te6nIrPXDFg91pEG1yWSd5UA6ViH8HigIgQ5hZFyI7qr
 176+R6F17mTw+NQN7WNwWid7LZPK7wBIqCg7Nnl5dKsIrFHdbU740bC6YEK6vTqKFupC
 XrGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiEL/kWVvv8y0oBvfPIWnDrJk0Woj4+uYu9dT8EoMDrnzyXSCTqJZh9tvifgLDNQfD/efrcchGS+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE+A0tozG46o0eFs2w/8v4qB0QrSIawXWNfOJ3uXmNmvsAXe1Q
 rojqnczOVidRQaPTzo8Hi/WwyILkZxID5dfkmYXfe1Ds+izQ8jl2mR+GQGzjootltW8+OF/5kUR
 QEbmxTpTApSKTpCyeV0Pmuyz64Iikgs1emit5pWwZiV2TmwslTjGk1LsWoHcEMp/i0OtCjyM=
X-Gm-Gg: ASbGncvzeH+ZtOnosR+SRuP6x4olQJ0TjQ5nY5EHnGBy8bq1eLK34e40gAop+xy6TEm
 a7pLtkJtA2R3rkrHPUhDo61V8ZiAW8MT8+izwBAY6IQ6gy2m3vS8Iw/jGhVSW7i9vNj0wPcRyck
 +6Eq1+KQUvcMyYoa7TmlW5jSs9+5eUB3HkaNFmzubetj99cDy3YMBXGU8EUny+B/qBlNVMvGR+x
 hGWr+yRQ7cvMyvO1xl6Qj/JUsVlI5IS3iKEv1ghA9MdDvZbC50BQ5dYbmZ0+lh4oIaphOOmFDH7
 G4K/4ZrEb31TvOqZ9n8aMpcZnSpJuhUKGrFBhtrPUdj123kWrhKRHPFbulAVhtzuvcmfznY/+Pn
 /x2BpK8kHxaQmGzA6BCxi9pjzHMLIkUxHmWo=
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-27a186f5486mr11582355ad.9.1758540506935; 
 Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbTTlEoreUEOX6AkaJ7bnWs6eRBLiaiABm7kGf/pBZ+bhPDPXyhXj4EX3Eva+nVibdWRmp5A==
X-Received: by 2002:a17:902:e751:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-27a186f5486mr11582105ad.9.1758540506290; 
 Mon, 22 Sep 2025 04:28:26 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306061925esm13230568a91.2.2025.09.22.04.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:28:25 -0700 (PDT)
Message-ID: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:28:17 +0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfXzqbWKK7uaU3L
 IQoaFbGwwDlkBogTGydZiXZJXEuS4T6A9h6PEEAHgcWVRVEiwIHOf9/S2dGlOmY4SxFitRrUb7R
 dDPoOPwht2XtUmFUQZelQDXz2k76z6rvfPPAj8erznDGnrzF4lZveEDG/W0/pkDQSV0qRGnnmrX
 giFm8BnHufgjBa1RYb+Z+toqKTPFAYzaVVlmntqRmmQJ4vA93b+lBJy5StbRs6cR8wl+vRaRr/x
 /TFLWS4uhOF2OlC61JN+nhlXJJrxlHDCE0sPJ77Db62jtmdajTSfZNMpqqNT5o5E7iwM68VSPCK
 ybMgWBCcNjbXUM7FLzQz8wv9YM5d2ls50L5I8jmtVulp8eTQZ0FcNwggekrJ7lh3No4/Da+5/1O
 g5g6eE4J
X-Proofpoint-GUID: WqYKtkW5U88rAn8FixvYS08qylGtNS7e
X-Proofpoint-ORIG-GUID: WqYKtkW5U88rAn8FixvYS08qylGtNS7e
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d132dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XVeZa78dugChcG7OFuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
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
