Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EFB939C2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 01:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765A10E00E;
	Mon, 22 Sep 2025 23:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyxQCKkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7510E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:39:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG4iQv015502
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=; b=RyxQCKkW5kWPhVUt
 3GGAY8PcspEk4oILlwudowluIi8Z+6u5eKYlLEEOiSyDdqlvsabyObnFBMoYp+jL
 BJ8AAQT8WKgG9Uzm96aqnEXEYTYa3u239R27+K8kwxscKc9zu3RgSH4HoFLDqax3
 Q/LQ9lp3tVXTQBlra5ArxzWujzbmK/+JTQ3DjamvAon3Mjc0NNTGD4GwAC4wZmHP
 0SNNkIA+al9Ygp4mObCquxSfIE8E09jYVPbnW1BDiV88K/+B02ArWbkPp7C5CnlG
 /ClpR6MGV2fyjJTKtxZgtiaxubK3uzdgkuYQUdF+XVMFdHRJKXKiyl3HZOToD23s
 1HfR6Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fee6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:38:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-78e30eaca8eso41118006d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758584338; x=1759189138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=;
 b=uodcsdxejyPQisyvHUwh2AQtPIOK16gwLGCBsKY4x2wqutBRbHWL1AclXzd6ae3lk7
 dHMuKHMwQBHo05DBvJLpt1KMyYnaOJf19wEEsbVogvRp91KJWPERcdzzKBz4rJ27DHKH
 lgn9DK0c2zSQPLG6oWBZacgX2QHGaFNr5dHO+URb2UkyF+uRfIKHW95UUdkgrDY4gtT5
 wb4DSlpH0PNvGObD1nRC6/3p1PWVnWRZUnvYcqAWL1au/5Wq0iZ5/IvAIyxt+hLxcqu7
 Yqn9Kuwo29XTv7zpEvl8MOVnmfa3o+KVp8uNBHhbNTWz+Vb34vQ8/JS2/8gCBd70hU43
 qbsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrmsIVJqdqkLfCq9QKGAiOtxgu4TVQDqDglum0/JsthQureIu5HpXGvQ9qGYJEzr3UHvvh1OG2ZTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFkGR0O4q7Phy0JZoQYtH2VRCJNWlvRcOPIrbodMrRNw/9K/UU
 KiWxRpQvPyycHI9y76TA41XVhG/ILl0hSUfNmvgT8jqjbEj/hbKrTX5GpUz4NfVYfLQ0k2eDPrP
 TjLHU2GmOg30yk5xMYtxKrE2N/qocUzbiKptoNUejxSuBR1cwnvqRCuZPZr642SpH/9UNYWw=
X-Gm-Gg: ASbGncu2C43P9IBrIDNfoQO1mrbP70f+XS6ZqTaLjiE18QjMewFxgqsO1bAKOnTZNXE
 ZhI3xJvJ6PvsGe5XG338o6SYe6NEs09uIR4XVDA2UXOZdbRtP76G9Ntn9Bf2oBpOAaeXqhnVH9R
 xC9ZqjM7OoNC7Fw9SjF7/iuwlSmoHiHq3RIZsfnER6eY7LhiPETZCFhCoqgcTTWalKyzkCAGhCb
 OveZmOD0pfe31IbDoei7aS1xrY2XdY4G/gCFzv8er0mRE5qIFSGkWLcC/I91N1iwu4L7htISwv9
 XzAwlPOhSfE7q4R52BrJAZu9sEhML+EE/m878VrdQWxiOqFSAbMk9BLnRZJmHBH4ZVlULSgaJMz
 CGL0+NwJ5dpj7IN5jXzf2GAWXmggOz0cFKS+s6qcfE06F1Vtx5f0z
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id
 6a1803df08f44-7e70381f0aemr8294956d6.21.1758584338157; 
 Mon, 22 Sep 2025 16:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUSFjg5iWYzh+WxjwkEqcZf3xV54AJeAPRjTMWZAiNEPSIO65hMhienoOLDZE1fB+/IhMYg==
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id
 6a1803df08f44-7e70381f0aemr8294756d6.21.1758584337686; 
 Mon, 22 Sep 2025 16:38:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b7e33b78bsm2117111e87.45.2025.09.22.16.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:38:56 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:38:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
 <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4Ntzczifn2Y3LGYA82JapJKbGXa4EFj7
X-Proofpoint-GUID: 4Ntzczifn2Y3LGYA82JapJKbGXa4EFj7
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1de13 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W0oVTkMUdJ9i6-1frqUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX4LwaWAai9HRf
 dPATRc0ulxAM13F93Em9o1ApL205+bx1iO266AhRH6yjmmCSesvKM0siroKAa9vl08LDfpCCDJT
 tzQI7Xlmx7OTvYGanrfkzoWFFD7MFxTw9FDgj680FSONnlIWvDkPvZqBeWig7SKvQoJ1dQ+aqJ+
 saPxXPdqLqRNmLISVQuANQNfmDTO4zTJvIDBDUKyvgSDaguMG/2553JUREQIzUYiQalLnmf8ark
 2B7gDKCUCc7NY7Nh9QAbx1gW3ZCHpKmMM0J4GYG8iNfavfCZ0QiBMJ/tFxNHk96irEf31hoo43q
 6e+syO0ZSNU/rM7kTihN2evQiiZT6rA2/AMaGKritay/5CT5tWAozS1cLyRFiy86Jzm6k48DT5g
 ovzjQjIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Mon, Sep 22, 2025 at 07:28:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> >> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >>>> routines, voltage swing tables, and platform data. Add compatible
> >>>> "qcs615-qmp-usb3-dp-phy".
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>>>  1 file changed, 395 insertions(+)
> >>>>
> >>>> +
> >>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> >>> Are you sure that these don't need to be adjusted based on
> >>> qmp->orientation or selected lanes count?
> >>>
> >>> In fact... I don't see orientation handling for DP at all. Don't we need
> >>> it?
> >>
> >> Thanks for the review.
> >>
> >> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> >> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> >> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> >> registers you pointed to are programmed with constant values regardless
> >> of orientation or lane count. This has been confirmed from both the HPG
> >> and the downstream reference driver.
> > Thanks for the confirmation.
> >
> >> For orientation, from reference the only difference is DP_PHY_MODE, which
> >> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> >> SW_PORTSELECT-related register, but due to talos lane mapping from the
> >> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> >> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> >> orientation platform (not DP-over-TypeC), so there is no validated hardware
> >> path for orientation flip on this platform.
> > Wait... I thought that the the non-standard lane order is handled by the
> > DP driver, then we should be able to handle the orientation inside PHY
> > driver as usual.
> 
> 
> Yes, I have confirmed this with our verification team.
> 
> For the non-standard lane order, handling flip requires swapping mapped 
> lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
> This is a hardware limitation, and with the current PHY driver we cannot
> propagate orientation status to dp_ctrl for processing.

This might mean that we might need to make DP host receive mux
messages...

> 
> 
> > Anyway, please add a FIXME comment into the source file and a note to
> > the commit message that SW_PORTSELECT should be handled, but it's not a
> > part of this patch for the stated reasons.
> 
> 
> OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
> related commit message.

Thanks!

-- 
With best wishes
Dmitry
