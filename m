Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D587CBD64B1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B44910E51E;
	Mon, 13 Oct 2025 20:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXcIkoB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1410E51D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:55:44 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDaUc012759
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h8b2DwudIexdSRYipqQ13kew
 J4gE/3CuV6C5IduoJwc=; b=IXcIkoB5lrzUNaD+HgdJcATWOkoQEcKeijyYxvoD
 CpeyXaCk6w8+tWGSjAMZkwZPw21qV3u1O1ltWg3VKydAx41BIaj7yET94j763QQv
 8I/Z2cRYqYJmZn5/9eQ44X518qWYT5ZOFYKy3uNI51mU8RGIcH5aJXPaF6WalADn
 CQvvpW+LgmFNa3+Kd6KgxOEkAEfo7BF8PvuLAhkdz7sjsigzp91+nUOOWeZRs5Ur
 hTq6JnBjke4ZYvn2gSX73qtSxdXDOyfUBOxqavidkmAIGZY60iZgEHSDfa3UaFJw
 +67xrf28nPjY7xEv2qBa52P21z2FZ4jz6ZD12F4OiNNcoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5e5k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:55:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8635d475527so3161221085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760388943; x=1760993743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8b2DwudIexdSRYipqQ13kewJ4gE/3CuV6C5IduoJwc=;
 b=pR8SqUoXzkA3nBWxTj6sxa1GFtr0LCnNd2OM+/EFF54Qi/x3Wo9BH1WcuyWhelPVWT
 a8hXqop+9U6gtW8YYk3JDf3Ho+B3HetemI4M/TJYyNmd6ys8Qv76aVFW6FK8/iD0Zvxv
 PBSWdIFPUVGuz2ZVq2bY/hBFrnjsHBSlgnw1AgIGaKuzjKcb192rLaclInMkcdeWV0El
 DF3ViZCjQmlLBI78PnDfTMRKCEPBuJFC2dTFMROkhXKsFarus6bvlQ2RagZaPK4owFQN
 uJ8VL3QpQ5V7xi69dxLzMAEUc3JB+jGspXu98k2CbBioGpPaelzhCNZHhQnV3Zdj8I/M
 fgcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2+s2DInK5oHFo493NogErEEbGOIQ4rxVPhyh3OL3yqCxGOZrSgsqsSyp4+huneKgCIPKJa3G7Qj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0FDahTNIvqHo7aWYwfTuL2SmmEUg9yS7FPGGZ+aDCUcCqax2l
 dO8wp2HJLzYczdNcSqWtPSUCsEBPj0FbLcoyRNBdiele4plJWkOhMF5FBf8WFEio3sUQmFuAZ4f
 yPKMXOo5wtb6MAekPnGKi3vRhi47UkYiFWUFzL2yojsK7j54VRjKA2cSpJKrTlmNoGCMSdVw=
X-Gm-Gg: ASbGnct4QoONjcIV5UtTPtsytD4yldwnLmO1LfYFZnaEr3X420xA1jzUfRfjeOTabro
 zZsRAYuZAdAizJNC7ihWjtx08xCRN1McSB/YAPeoj/rIb1jHiFLeEML5eZ7zxnh4XOKRSAqE+wD
 JzFb6vCk9r5Md0+Wq80QZUar57DWQnN0OL6CdJhxzRQvHBZIuOzo+KlpGQSwmllZBPSQNRloFDV
 wiWQ2E++2iGMZZ1mNMRE2baLCrKMMs2ftzhescRpob7khtsZb9LXG9H3wxQIK71EE73a5tuMRAP
 64qRJf7ApZE2L11vKZnAIjXy9o8DOGFv7wv3ptSr2HxcMq3Pvd2Kp86kiuC4u0n0IsXSXfm+EMk
 52vbx2B/yBisKE/tXZ/XDpLkbKZ65cgoYwrWFyQT3WT8IbUYnDqOh
X-Received: by 2002:a05:620a:40ca:b0:850:95d4:db01 with SMTP id
 af79cd13be357-88352f83c1cmr2928837085a.21.1760388942669; 
 Mon, 13 Oct 2025 13:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp6cEaL5p5bxM9BKec5c/+vKMAwKsA7FMuN565mKfxMvwbeeumVcMSCt/OjDjFwBqiUk+E3g==
X-Received: by 2002:a05:620a:40ca:b0:850:95d4:db01 with SMTP id
 af79cd13be357-88352f83c1cmr2928833585a.21.1760388942214; 
 Mon, 13 Oct 2025 13:55:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881f8c6csm4493487e87.28.2025.10.13.13.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:55:41 -0700 (PDT)
Date: Mon, 13 Oct 2025 23:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Message-ID: <x33zabb5un2boben6r4qp3vvrgca5s37gmseespdwwbajumdxx@mcxe6or5p63m>
References: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
X-Proofpoint-GUID: CI8hYwucL9di9UDJB3aOpZ25lZ5oJ0la
X-Proofpoint-ORIG-GUID: CI8hYwucL9di9UDJB3aOpZ25lZ5oJ0la
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX0BfcmkE3D1Mf
 fN/34GpAkzLSjrUmXKew8/Pmic/VJzZK/2DWWnWeVqj0RyVAkX7TnBH9+LUpvwiOKtEUFOBPgbb
 UFvjQ8NN1Ezq/kMBGvRy+pioBnoyVk3wnzH31DofFj4ktSersQAbZvMS6HbDGYVmGGaeZL40urV
 eQxOU9e/JT5MzQ5LhvSr8OC6kE9NmwNF3UAyC1lgYDoyAPql1YbabjIMXR/zASDfPK0AX+MJlie
 jIQjN47ip8D+aXVLarmnB6ioNYHkxtW+t0g2eVDSgVXBo25pC0utYZ//FgbI2Uc+4H5WKayV67K
 +LzH0thNB7B33APRiVYWMmCiO9hBis1tL1de5cj6ccHrwj2ak/SVbE8gl4/0+ycCkb8FGw3X2tY
 I7+r6QO0zba+XhUStsOz97U2WMsKtw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ed674f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6rgqHx4lmTWDBTbEgdMA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
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

On Mon, Oct 13, 2025 at 09:27:17PM +0300, Cristian Ciocaltea wrote:
> Some display controllers can be hardware-configured to present non-black
> colors for pixels which are not covered by any plane (or are exposed
> through transparent regions of higher planes).
> 
> The first patch of the series introduces the BACKGROUND_COLOR DRM
> property that can be attached to a CRTC via a dedicated helper function.
> A 64-bit ARGB color value format is also defined and can be manipulated
> with the help of a few utility macros.


Please provide IGT tests. I'd at least check that using the
BACKGROUND_COLOR results in the same CRC as then one when there is a
plane covering the whole screen.

Additional note. I see a value in having the CRTC property for the
background colour. However it might be more flexible to reuse old
proposal for solid fill planes ([1]) and instead implement the lowest
Z-order plane supporting only solid fill colour as an image source.

[1] https://lore.kernel.org/dri-devel/20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com/

-- 
With best wishes
Dmitry
