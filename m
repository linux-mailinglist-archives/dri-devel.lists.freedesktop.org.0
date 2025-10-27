Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD0C0DF8E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6B10E492;
	Mon, 27 Oct 2025 13:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwIVjq4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CB10E494
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R9tWJK1504060
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2Kj22k9fvRGgrx/wBkPeuGzy
 xbWnEzFTmd7/uwZJCyo=; b=dwIVjq4xhUDZCJzwxE3ZOMyH4nR3tEZKNUzWKmWL
 BYF30w9mq6/zytpBeT8+02bz/FS6qUpm4ueaf7G7rKzX8cU6PsdcM8fHy43ppRLJ
 AlBbhSFJVYTtNJ29IByKTesZUlRG0/qIyvj1sJdOxmNQbhyjF/SDaPp/Oqkl8TYs
 vQsup9ySY1bW1uZkN51tYm4sUEzLERKGquf9TAtH9oc9krrbewD6ICg9L5WCq3cj
 /STxRRCRouQWW5O/ZeFAq2QwbPl7iYvlctf51PLeIEqNHVl8TUqRg26zp9kfpXCd
 56FxdozwSlcDrWxog7nosV2lKd8dQZCFMvkaQIAqu+THdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a20pnskpy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:20:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8a387d01bso219187191cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571225; x=1762176025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Kj22k9fvRGgrx/wBkPeuGzyxbWnEzFTmd7/uwZJCyo=;
 b=r6VVATvvrET7Nbm243/u53f9eMP88US3wf6FeNcCC1GT7bQ/mBwlvofLgZUfS4Yma7
 zb2w+D3UUVMrwPl8yPeczLzUSk9bQPtkYqAuT+H9V323caL757cTxuxKJvdC6N2UHjwS
 42E76owS1vPjY3yu9Yl6UwE+iLULHqtCW6Vt7j2vthDF6J3pzi86TUOg83EAC8BXFZnB
 IhEeS3kdbSoAvBtVZtg7afQ+S+wpANy3/QWu4G3QngJIRDF6nr4OEzllqvic36PiZI8Z
 AHTbM/OJRemgDYwjaYRbnXIzqyXSsmC5BJPO2blxM3Tk+GBdsLj1WHN5YRMHy3YajxnE
 AWFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2fJRz+CV6ofe7lt77Wt8QwNQIiszmKlNwbPIJZWZAr8QgmMzQ2q5PMs+F7n1aU8h1kp2wzj4fNeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIV8Nw1zkFf012YpgW8G4wIIybauRvPsdz17Y8K9iUKwzY7tZW
 jIyHkckxDzS6G5kW6cP+9TmG3OGP9t2gPV1vB6IiR0A0yq9yLPhP0pCCieD45O8StINn3NQhyqE
 xlO6MUFVQjFHj/Ue9t18NMWiaCY23CHrGtfQXGGLCq2ZLFuY4IdpT9uDKgjuKJ0HMmtRIMDg=
X-Gm-Gg: ASbGncs87cwX4Oo/GSYrLY/GTA7jD4jE+K/bBEu/ezOpRU0tWIlT505boWJD+gvEZH/
 DMztjScnT0DThtTNm8lDQJQQLPIWcjyEdXsql/CcJ2MonRrfThjVqi4A0l8wRo2ZqdEavPq1HOZ
 8eQ/kSaUsO1A6uJlyff6WOn6nOWRWYYSVrCEU/KilQ4YpXX24hzbw7ccO6Gc6k36cK/evDQ15Uy
 vh/lqGme/B0dRvsZItZTRaPdmgI13upT+XvqgnOz5ylM8PgWJ67m/D52vFW9kaSvxqT8b/hv975
 +h5U7mUIEmakwB8ungztVIjiI80y9/sp/QAiYaxyGCVoEr/r37/BOY7zDl+HHeqMnMBXO5pi/m5
 2oAhQ4CEeGqD7+eyk0Br0PrUCtIBb1KoasOknRiyFSG6NNLVTVdq9cU5P+4QRqqY4GByr/znQBz
 YiAmGJf2Iaidfg
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id
 d75a77b69052e-4eb9c80fb64mr120719701cf.35.1761571225590; 
 Mon, 27 Oct 2025 06:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHBc2C7TR7QhTEGEcw9us4tkFC7f4Ut/FGoqtIIC79l1JnmcHizx0ypgFkWMXTqqEaPMgwhw==
X-Received: by 2002:a05:622a:1a94:b0:4eb:9c80:f68e with SMTP id
 d75a77b69052e-4eb9c80fb64mr120717821cf.35.1761571223545; 
 Mon, 27 Oct 2025 06:20:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee09213fsm19983561fa.1.2025.10.27.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:20:22 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Message-ID: <wg6ncd4zyoh3lrrxtpjm6bup7ymyy3v3notzvvdssoptveblxq@4g4shyi2xqar>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
X-Proofpoint-GUID: Jro85xtxYpoybRZnIQIcdbRTAyqQdVYD
X-Proofpoint-ORIG-GUID: Jro85xtxYpoybRZnIQIcdbRTAyqQdVYD
X-Authority-Analysis: v=2.4 cv=A+xh/qWG c=1 sm=1 tr=0 ts=68ff719a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=kAMrfz4tof1vowKnfp0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNCBTYWx0ZWRfX0ztvhmfzLJ+D
 PRbGuBxAp632w3jHk0aYc6qt4MQvbOfkH/ZdcqZH9hn95uuHV69fOUYP0nXWQWb6o66cn2h6ckG
 WhR8FJ1N0NpTFKV/iXTi0/s0WGdRhcGBHtvf9f8/CM2w05HehvREthJkpEFmrvLx3TAbuBkGNX2
 l5wYce9Hwi8zRt0sqJ7L7aUVqiikbbPe8wGgqsn2RYu92lh7K/dXNix1ih0CnMTYY2rwXUQWcGo
 E2HJbvsLTBg317pgQekjytzr9M6T/Y2+aKAjeH3dGyIYOaobEP8tRd2nQC8zN5qyXdXIfNwbiXr
 Z6Va+Crah8+g8fg7GWaSbSgDFR3kHC1FdP8I2xjW4dI/Vxm9k5QCbEuu9qmqEG4r/pye2h7YFBh
 JsdJt0tgpQQoNjJr5ijPkYRm6Kll5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270124
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

On Mon, Oct 27, 2025 at 02:09:48PM +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> By introducing a protected variable pll_enable_cnt in the commit
> cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared"),
> this variable is only initially set to 1 when the DSI PHY is initialized
> making it impossible to set the PLL before, breaking the bonded DSI
> use case by returning 0 when setting the PLL from the secondary DSI
> PHY driver and skipping the correct clocks initialization.
> 
> But since it was already possible to set the PLL without enabling
> the DSI PHY, just drop the pll_enable_cnt setting from the PHY
> enable/disable and simply increment/decrement the pll_enable_cnt
> variable from the dsi_pll_enable/disable_pll_bias to make sure any
> PLL operation is done with the PLL BIAS enabled.
> 
> Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
> Closes: https://lore.kernel.org/all/50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org/
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 ++----------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
