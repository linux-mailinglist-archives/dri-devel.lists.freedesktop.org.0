Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA52B20597
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C204410E430;
	Mon, 11 Aug 2025 10:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iabp8jC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06E10E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGxxF024551
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3nfN60jdUBtaQs39UNaxVpig
 z5/FB/TFepwaJ8bZmqU=; b=Iabp8jC37l+5c1heoHBD+T5SrH7/okVsULQROKRB
 4CBkj/JSZHMqZ54QQXeKxOrXHgbXoGBTBdDjtNoQM1iopYSgO5Kg3/rUdb+GyHoJ
 Zy/PeLma5V2wHjNIQwvYYaeu8RQnFBuFf9xDlPa55UVmVazVug9oUJpEx+QIGIcp
 FFI6oYnM0VaYO4I/vbi7rCii9D7n041roc5P361r663yV1C3YHwoC199KRuO1KIu
 VK5l9p3LnDvx+xpZlohvUh7wp/b516RQBrqA/poieFDWyyf3mqE/RLRLR8yOeion
 gnrszwMY/4JnQCl6Ni4juj+H7xV8NGGqda2WU1e260uNOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem481jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b06a73b580so62328411cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908533; x=1755513333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nfN60jdUBtaQs39UNaxVpigz5/FB/TFepwaJ8bZmqU=;
 b=QYwjJ3OpP2F/RGrfj4J3lWJ6hOAGIFRIB5YyXkz+th2VyYKdinyOzh/FRNa7Rb6tPv
 vXkHsebAmR/UvL4NzUChTG784bV7VWouhrrpQRVBehZmgVl72/BJhNVMMOg8iWppB1pE
 WA4fpIZ47XPCtQqaY+qTZqr1RZg5EoZ20ZWoQB3eJ/IBaK3AV2iQmG635sTLRgvG64Y1
 IEnBYygsDEconlA1Wcvs+EyvjwlDV1F2c7DCbACPdPsyhB4NB6jPi3kr2Uyrmc68FaDH
 w2X/F9BGb55LCihd/kT0rLzjCOlRAINH0IDoViGhYf9YKvHa/+/gnjf9TGbTzrFtr3+k
 B68g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxt7gUcYsGiYoEIozxEVzlPWSoxScyaL9t2QqDZVvLXx7ZAJY+zI/iDE5fe4lph/lgfl+E5L6pdIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS76vrPIEfeAIb9CdIQWUMH25dFgvhKEATPCFBTnH4v+aq1GGt
 JwNIacMfoYPWawylhVshEHbzftQ3NFyjl3iQTdPx6DJ3L+1ZjJev8Vild6XTCu19c5uh2uSFjBQ
 c9qikP+8HoX7adxnwN43WonLKvk0pvwUKEpw9MBNittvB1y8BDRhF2se+mBUTnf0nxFT71g4=
X-Gm-Gg: ASbGncsx5RWbj86KPJdv4k3wqeSvDzy0C294dgBXCGtFTCo0KptoObOrOgJ6v+ktgyU
 Ep4c3SPYjunNowOAKCBqQHhOryKT93kskv5O6tZY4oIovg+BohRo2ZkGkKj0vD2HaTJCbyssAWU
 XwCkSH1O8yFKqApWCez6zo1TTSM40b5fdM3tCDOWD0z+ZxwBNBwydh+/b70zs3KcALxUIixAzJZ
 X2u7BG22IbDxR/+wyy3IW4xmeIZ9ZqhjcLVnAzKfLc9CKyefWQtd2pHlSgyhu/x48RC44sFdnLh
 WeP5Reb+3YIsiIO861dR7xa87HioG+4CjHeQuUM2dC9lVkMm81bMNLaD0fMM5A2VqsMhOMQVDjM
 WX6Xd8XzpoUhUfgU2c2GX+Q+AJJtpn9Vuj879ChTfaLpcL99B7/ff
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id
 d75a77b69052e-4b0a0718816mr236623681cf.10.1754908533244; 
 Mon, 11 Aug 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyahsxVGaRdWMce+qoZBor8nKFhSp+X072mklH4pqlqFsX+5NaNxsNkaIEI2fGWy6wHtVUA==
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id
 d75a77b69052e-4b0a0718816mr236623311cf.10.1754908532801; 
 Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55c9c847db8sm2272681e87.84.2025.08.11.03.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Message-ID: <pem6b4hf5gzo7jbo46asminbqqrnkhcx3nwsvstv76ntmeasfr@sgckrdc5s6og>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: qRHf2IkS0vTK01MgLFcF5BU2HdYsFg0x
X-Proofpoint-ORIG-GUID: qRHf2IkS0vTK01MgLFcF5BU2HdYsFg0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX9tnVooAQa4Zd
 MZ/Hlw3OhhSK6JggKrowHm3nrf2bNzgN5fFCJgcqJDIrH1n3/zZjJs6CekvPo2rXo4III04vYdr
 c6LfxzEeVlmm7Mt4YvobidtHyL6ebVKJMadoHgETChA/4FLyAivX3yga4rgspBmxRLfNXbNkygF
 TRyDnIj1HBtCUiI/3q5xev5LOxCXcqFGDNTUZIH+z2mTTy+yeC8OheW+YxTM8Um0kM2wnTFwJUc
 /fz4LoWr9ymCC/8KMHQYTiP2mIrWGXaQIMuhz1q6GChs7aXZwSmK5izS7v2Wdj/JqQOdGbXON5+
 +I+edY+LBQrM2RjZ6+jPJoJSgTXZb3KTjM0rEh/8NuFG2hMX7+zYk+WR4rGQtJa0LmxtZCTJ59f
 iY3lbyoL
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c776 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On Sun, Aug 10, 2025 at 06:57:29PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
