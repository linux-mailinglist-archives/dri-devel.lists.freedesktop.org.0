Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC1B06283
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9075510E5F3;
	Tue, 15 Jul 2025 15:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElfxlvT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3F210E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FAGO8j027505
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
 27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
 y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
 cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
 GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
 TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
 EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruhbfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:18 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-86a5def8869so1097574239f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592337; x=1753197137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
 b=dlZoG1WefvOMuu9inLEPpApTx9THYvd3XjxW/ANBiGdOwz5+1rtz9HopAKVS4jXIbT
 +spnqIMuizQw227qJXt3ma9oPGnVEliI6ZVzPuV1K+vkxzuCQWpHQGBgt2EcarPkwPvY
 H3fUnTBsLr6jHqAvz44G1gy9PYWnJVmWlyPvflST9QWFL4jEXxF8Zmnn84bvh/jl5d07
 8aMxvUExKOOJe2MytrqQpgD7h5NqLQBeP5jwcfAneCJYBPT8aHPfHskoHC0VgkAU2QPB
 ZurfUfsI6/Hp0Quv+22OtoGpdwJ8xDVsDLq5wUSmavkETccbO1QNKZ3zI0x9zRsIYu/3
 7uhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR53ZeMhg0h075cRqxSICB1+1ohOKpIpuTNITUDDXPmexLZGvh1joA1BfrTP13umPAGhOfgxaZ8TQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxx5fQ6sf3Ns8LtyI8s2pa5QOhJk/8ajAVK+dVdM0XoFwEjvjo
 PCJcSB9EsTuxxSA3BKE55O1KGmM04/4ZgGMc5ARLPLbH7dxD0CI6q2899BwPyg/z0VtIUIkBXP1
 NCcr3+acj6Q0gbUch41SVrILKw0OEezPkjrAYVA9KO+Yaye9+Zg6GdEP7XCD+KjITxLR/1ec=
X-Gm-Gg: ASbGnctVZGbuEz40n73+UAgC1h0NG5LefEzmIACW9IEKxEx/jepAImKj2MxfgwywGt2
 kBEMbWUMjL9Q+HF03V0ANEwtcSXqRtfqg14hRpzqvI7n9ceC7srqkYCVmx1M2iHxQIphsZWr9nv
 pGt4xnXyKwiacR6rD3wvtmA3rdR59fgF8mh0W9O1Q7GkmDtivRHaJqutSlLKXIllZGOX1c/OWTd
 tFJ5hhV/9n3uhsZFBKW5T/wrIU3OxVG6sjoicTVoKEDUluvAP9DW9N5o7NMjKVKElabXlogDwX2
 S10NmXupBMyjleFf+91ZCfYzAO4v9t2W+WlodA2wKGLOouPRU/DOPXSgfBVY4gZv0uxwFaUSYz1
 afPk0CQTBCzxiIZjTCj9evUpud1AIE36Y3Cosyh4yCIeknmRLxwjF
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190550645ab.14.1752592336609; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
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
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-GUID: hlhrSOevpjhOjR0rmu1fuHzhof5rEIKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX6TnBqt8Q15bA
 ma4kj8nJqfaGXq6UWPCjtz3Yyt0+ziFctNe3zQDypMXuEtrcNi+nsJj5uwODfJlxVTApOqlzOq6
 wIY1jINDtxo7lrbSRP3vy6UXdOzCVWyOEZ77MG43NSrzou4k2Z3PhOeTBezBYH8OW8dKlvYSFuh
 LN7dZYff1i/mhB2g3hF5SbdVNH2OedLzyexSzdDgfewKVPtsovcpXyti8RHqXI4qBjdiJzY41Ez
 p6VxWBCatD+nxxHLhN9X4ed0NcLwsPSMTpySIpodxBnGovDbW+GeU2r0IuXHpc4OQnhnUKmgxQO
 KAgDzXcZFDKLsnXQFnf17PgT3ENATkxVmusSmfkEQ4XgbqRhzzEGkEwx4hUykCWsogq3BUorl3h
 4vTGcEShPJWEsU1YecA4k8XAHP3InBx6Uvm0bHx6FgBiAR5kP66AUy7sNOy/hFRtFEKRZ/e7
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68766fd2 cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-ORIG-GUID: hlhrSOevpjhOjR0rmu1fuHzhof5rEIKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
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

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
