Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC3B06256
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33510E5EB;
	Tue, 15 Jul 2025 15:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kms4CHhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D85310E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCY18j008069
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
 ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
 iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
 udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
 1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
 PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
 bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug380tsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:44 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-736f37286a2so4991361a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592063; x=1753196863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
 b=dwXCAk/Dq/cKhsQSzvNoro1XptivGe2qrnpXCtnQ0ySJA7ONYhidXWA6Erou5Id5Z0
 nsRWQS5oKHV8pzfN/abPKaFM4R7kDixS0wMuZTbpcKN8fYQF4Lpo59Qeb5vkZRy8KEXP
 Tnm5C/nUn0/luZcWCzXWp3HtKWyWNS5DY8oGMkdlhWAG5ioTCfZurdpvTvlkDt3DGe77
 W/pPL+OhL0nWGo7ClSGeoIobOkNn/DmvA1KeNzTTweFGd5z7ZiiaODkSOfGjQ45S5L1W
 ogCmjY89v9wzzHgMtsSlsTVsvX7Tu7XGN7Wjf2X9lfxaJF523wvTFFRgqF3P7IVO9sPr
 3nsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFIThbWGpxl9wNg0/W7VYC6NZcFw545/ONZHl3lyHUqrIqglCPKmAKBJ+snPKdaMQtvLEFbN8ccA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVyiAP+ai7/7uu4akQ/DTS1m5xEiD3mwAAe99C6MI5BgPRMllc
 BDZbQY+X1dOd0EXryfhR0hAxmAO9qcBJHoF+yP33Ne85VhwVXOd4exSbvdPODfkuSb7m9gsjTKB
 s617oGiQngz9T6sNSO9DxJplGJKW32+gmny1MCBgCKAxdUy5Eyz2E/PUVu3OAGHrVia+78/Y=
X-Gm-Gg: ASbGncsd/p5aPiYa2IpdsxpZL8vUH9fdYR7/1/ShsCdP6PfuAURCEVGdppsnFnbQxXZ
 Uufdp3MIj3pvvUU2QkLNsX4IAdjvyOhdzP68wW9KS6CbenUoa+kpncnW7bcF7Ow0ILud2+zlL7A
 ouq6UlD8oDVO2D8JNbvTFQXSMuzhIlXZIBT7a4pslLQ3YxjrMc7W1GdMWULj6ZfvVz8yspHubp2
 61oqQz/Ya/UROAlBbcVPmIdKODREwjmZHmcujrigX6aa1cXXCXa/w/e0S1SrahMSHBwtiXxoO8Q
 vC5zFxQmATmbfux9HHSioGGL+up9oNcDXRxnn8BiZQnQV+jsdKMoQFJsmecK1QQnMNhgpb2xAS6
 a5RYNK5Sfqh773u5rvDcTfzQGz4J/Z4q77hx4FT4EemjBLqVLrDxk
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018622fac.11.1752592063050; 
 Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451; 
 Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXyQjzz5hv3AvM
 EmjwdBSdqNbcL+PbC/x1fq3w1MPLUpcek57xijwNFE42BBeT2WrIc77tyAj2n/w3onoyW7PSlqX
 DGInDsYYadPmtGtxiDGnhReO+2Y67Nl5cFq/6s2KHSqtrIJt1Hr1KkZIFYon7CTSzc1dr32EyWb
 g/Qrcu+Tv5bfrcOcW7P97lefVkAQ7/Tjo9eGEHsGdaZFIA4uUOaCg5M9BPZJ7/08bKxRHXpuGYN
 IgrhPLFM74Dp0GEIuQAW6DMFJZ5MOLj7qXWtnuqmPFOUsoycCW3t/dgDAb1yA53jibjT2hoX60X
 FVzZNGPd4NfK3qTmtpLAIF66c/6EqzJzYuU7coRWC74uByI8nT2eUvZCcrvH9iqV9rkB/Jgb4JO
 5SCizOtnv0nA02iDDOstZC/zNRmeHIqiV1hwW+GEluNVsgr3sOWD/A6F/oR3To1mkrsxtqRF
X-Proofpoint-GUID: xPxUXzpwD1iSrusg82IeYQf3Fui2KlKL
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68766ec0 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: xPxUXzpwD1iSrusg82IeYQf3Fui2KlKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=903 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150139
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

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
