Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A67AD45D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 00:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8810E5DE;
	Tue, 10 Jun 2025 22:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TspI/1g2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547E10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPpQ7028668
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2hza23gY3coL4GLirsikjG3A
 jHM2RQT+qzkG3p4icuA=; b=TspI/1g2OXSBthgYyOLRrh6omOIB1ysX+Ho0IDwa
 UFE4/OLz1OkqKVRSYwuo3h70Z5kmmTaLsGtnMMY6Tmg4ObuVwIBR6+J/8Z5azzzE
 9apr4NQuprzo2pR+1uHLxl4Je9JktEK3mCY+boeehrY4XAO02drVYETlCRrEsbgj
 0joXd+igquKPoSJJH7UvrCCLtCZgIInP+dA2fvV9sn0syUuF5r3IoGs9+EiYOQeL
 1PSlcjMxkfPsEVBeTiRjVzuR6Te5OHWx4y2KdWPr6yqL7diZdGWzGbszpYlFo7kz
 mTnKpsnkjoxPI15BAEU5kQ7idKQnXKYLOKraxByxVqGwXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh9x6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:23:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so1080767485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594204; x=1750199004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hza23gY3coL4GLirsikjG3AjHM2RQT+qzkG3p4icuA=;
 b=C6dOtoD4CTi1sXBu4g+8DJjGB7vjpSYeOs13ZXNDsedJ5SxdbkAA5mv09kYLHlKDZ2
 MGm6ol9aeokhTvzlWv+DzIUmdDH66TGC+ZjsXFmSAI2DCz9dBIhEzklIPH7wv739CEyf
 mUqI5QqAmlAmqav9d+cpqKgpqbXlCNs7cP4vvBUUQCd8t5EBqrbiNABfOVQR4U4wrWnJ
 txlJTOuHcgVF7cnUlj5JTvJaGQ9kUDUGR9TlD0OIsNRWAH2jTizn56Ps0h3oS7cec4u0
 5kDnX4i7dfeounmZtG8gmFa+c5lO/20RwhiWMiK2YqmMPxaDwf1wj7ioDcG+NIwvcOO3
 hH4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsIL5FWlLq+U0zZYmwdn2Q4gloEmHR0CZJNFKvGmJdderKKcL2tBg0+Y8N4mMpBvLPUE4VY4JgANM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoSjrMabwTRaqrNfGq6KqNH4kO704ufqPcudSOzFJ08Gsam4E7
 53Odt3aPfqCPOpuzbANupmMY+a8dNh9hyLl9C5DnQbpfTLWMWVEqjhjiaXq6rrcHw1zEgWU25ZY
 ei4YbMVjXBMPSD33KN9N6dyz2yUxgczaKRHzwYk3Eqg+iH8LJ6OAGEG0SbPNvUXd1SGwtens=
X-Gm-Gg: ASbGnctfJz5ZkYx+eRsvteMxOA/B/4VrTorSm/AG1+hroRYvFkGQjJz3ntoLFEuvNTy
 bHhSjQeJs9wDUpCAbkXVojExMDeudeKi+mgmbTpNIICceNYVM5MT1LtcyOGGcuGb1ih6Hsf1RCt
 hPQ/UfG6dcl6bNqew5LuTm/TD+8i97+zi1VXxuLZhVu3Mra906aTSXGBSndxIGVQDtGqfvCL78q
 6Tj4R484nv3s69sSg6i+qCU+Op1aRt3j4faHEq2ynHU6WPC1aDLeYlHqxnAgiDyB0E/Hur+i55A
 23nlg+CwnmF52O51MUVNUrhbcYDmW1MsFi0PTD5H1EBAK06avBn4DdAE/u0B30NVEgaXwIidgxG
 7HghSt7dz9oON4sgayzvpr8os9mnvhZDISLI=
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id
 af79cd13be357-7d3a89bb112mr168584985a.46.1749594204456; 
 Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCcqxVLVUJFrq+O0cQ9j5/TPx+SAaSrKInIQWb4KK+4mCxXHk5ZJ92VOUVg+qUAfhrlPtaxA==
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id
 af79cd13be357-7d3a89bb112mr168578585a.46.1749594204049; 
 Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55379b2c854sm1321061e87.142.2025.06.10.15.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:23:21 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <w4napqk3loelkhl36gvhke6z6xg4g4xxymxsfjn3hmntkj2urv@bshk4l63nfrn>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848b05d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3n_StpEWJ1elpYQgr94A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uy2OMl_-1AwJXUsdWEUSJ2CdxS5kfCeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfX0LSuPsWfLpSc
 1ppywQYCqAbQLQjuz2LRtiYp2cjnndLV/Vmup5rvmpXgCJ+uWtkq6W2EGWOp3i+uOtTogIdLpk/
 HN4JnuCPI2MpE+iVlOGHIulgwtft0r/IgE+3I8JpdxzFP2zug5LGyaOVjdgnKR1mAmtdUSeNz1l
 qchIR8IOlRgP90SxCkYr206N44bj0b0BPEgJ4kCJgsMkCaDh5Hnwu3lAYBV6wgxZTi9aLuAkUkJ
 j8YjwoRz94nTK0rO5Lilqhk44KmX1mbZJd+ENhTro9yJ4uIfquUu5naJK+LJzyQ2l+rkPopDOtg
 G4mZE8Ncolcrlwq2UhW7yVh3h2jS8gH0eKjzKxQxrPBoZKz1QSCXe2gJn0Katki7IcWwBtuKk2T
 R9d5KFRC7scz5kuiKBAMaWd4nPNYQYxVMeZbohFhHG8dcU7/AsepRMg0hyLgSr9OEqV08Ykk
X-Proofpoint-GUID: uy2OMl_-1AwJXUsdWEUSJ2CdxS5kfCeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=485
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100184
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

On Tue, Jun 10, 2025 at 04:05:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add new line between declarations and actual code (Dmitry)
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
