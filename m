Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E4AA7C5D
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38EC10E299;
	Fri,  2 May 2025 22:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7AK8ydC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F2E10E970
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 22:44:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAh0b032297
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 22:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WRrq+JvjCchJkzjakhXCAMug
 ssdkhskj9a7C56XZN6Q=; b=N7AK8ydCrs0QV7SJMozTnUh7yXQ1rJagdVIATUlD
 mzufpYOVzBMTjUONZ1D1ZUzVhGTUM/rrXCya3jcB3DeHWYW8y0uDQsr8CpcMvbl4
 K1wwaA996PT0Jx0iM9xQXiilZdifyqOV8k4LREj9ZutVXpIABGavdOZ250ySw0eF
 MKXpp8JIfkzxRrNGyn2M2UyfaG/RigUbY+NF3BQ/sCxpNsz5zq48Nur3XNNBTlmK
 796BRf956tr1Ea1yufLhJkgwGMhnLVYngWlR7IfIonP5o007Qt5+ThREIbNb997v
 yFw/rNoBiIo/hV5VAOEV88X2j6ml4lfsy2Y2t+DnW3x8kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u79n6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 22:44:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c92425a8b1so457892285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 15:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746225878; x=1746830678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRrq+JvjCchJkzjakhXCAMugssdkhskj9a7C56XZN6Q=;
 b=SBtDjMqFdNvFAz/b88rJUaVAejhWfuXftEtmO2NosZfbm+/0099PEwZ0J8C7lGQwUz
 6i2LprFa0rxfKZjyUfpclgcw6eoQ6sKr+OAgvsBSXOq55pbRkNMwGQ0m1+vn99EUwuTT
 S6ZITjQWneFMvebd26qHQ9HTRenXA+JFGf2YhIdHMe+I4lRTaXhhopfqVpDwfpTKssiD
 rXoC1gl5bDMweoNS846PrUHEv2sDNtpuRnI7MZy3xWR/TUPKqtxoXLgnJs+ngMGe1Nc4
 Pei+J9EiRo4qOHVKFNywieINwR3uFKrhhe5mF+mv9DUdv1dOoASMsoXS3VMjJ7Bnaoc1
 JCBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7afiYTyNtZbyoGm3KvZkZhw+5wkmdMApKM18jdqAys/SwdWB1Gex6UAi29qIhHj7cUpaF27WyOWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0gZ3FrxcwKBo+JHSWk6Fokdov9n9MYKH5lPPKrJu3chO2yGcX
 x8f6ND+stO4mOXdcTKGcryIXlhpKzSrjwObcimUJzSTSb11qYDw1Q6vLH5W1/awXWjB7pDiHwex
 QC3hZq5OMWX6G7GknFuzmpTlSW2KnWUbSCTP5QX5QyzAqA3CkA/2jIQ78psbJXSPdaog=
X-Gm-Gg: ASbGncs/LVf1Qud1Owr1a4kr42hkELTOe9iUNh5npImLV2hNuW53xhU+VeGd2oOABZ+
 s4nY5uBVTw2C7hTeXbUyrCr5dUyCub8oC0IiocDHn2JKPCVnskcmc62/nGCg9jURAliX0XVJswI
 IjdpJBTOF2qTM//mUGd9g5IqAIhyaioQrIEYahTjwG9zotf94sS6AMwMRiSBjEKzkmpM4vuNsEs
 foEvvwKWRTyXtybYiw2KaXLbbwVkGw4GzKiAGrNKTKHjK1BzPiPEu3y8AD+axmh0y+DbM84tUOo
 ZFniUEUQjse75vTmS3ceuBxck0w8vEieJV3q9PBPWiAROiY0fohgjAzyXA0kt7VAdqRh5XZb2Ag
 =
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7cace9d3466mr1299524485a.14.1746225878506; 
 Fri, 02 May 2025 15:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR9ei7jxgp/PS8onB87Q7/5GSY//ByuX9fCpmi6JJqZKrf2d98eQeCqXYOG1RoePQHCor2Jg==
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7cace9d3466mr1299518985a.14.1746225878099; 
 Fri, 02 May 2025 15:44:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5541sm521277e87.77.2025.05.02.15.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:44:36 -0700 (PDT)
Date: Sat, 3 May 2025 01:44:34 +0300
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfXyko41CzamY6e
 +a4nAvt7eMindnENjHIImxJkHHIrt+hjUvKFTZZFZgGg+BWpo1Mt4K50QqYNS/vMwYxENpX4HHw
 3+IjmZq2KyWSdMUZcVrPm4YiCrokRS38du3o7T+54TeIgqQv9wwXJkx6U+7Mg5IKUN3N9VB1U50
 QjMFqb1dLQb4/R/+E8nMcp3xa1cMXUwNkSWLsiyijlqYbMortQI1lDaJnf7rq7xbGSmZlDq6Fsa
 lMMJ8LcOAKXGRbmF9jNV7LIOJsQBnzPNpUnxGMJTjnMNtsrZpCywAti0FwLAx+pXmOEnzJ0VB8N
 MydQaFJh7Sy1iafqSjDS53Ny6jf2BS2bweBEiydqO0vb/QQmzYGxEBtysqhi7OUJwysBN3d16eE
 Zxk5dQlduWDh9C3ZztA06kviCsxQhqVtUOjnzuCGQpZsJnZnMbwDrJqm98dq2eCMxWImZ+Aw
X-Proofpoint-GUID: FZTTh9q147cC_nkkj6Wr7RgtWKcVBtmq
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=68154ad7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=kpr1jEbMLSdAOIkivb4A:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FZTTh9q147cC_nkkj6Wr7RgtWKcVBtmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);

This (and several following functions) should be triggering a warning
regarding empty line after variable declaration block.

> +	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  
>  	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	ndelay(250);
>  }
>  
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
> -	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	ndelay(250);
>  }
> @@ -996,7 +998,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	}
>  
>  	/* de-assert digital and pll power down */
> -	data = BIT(6) | BIT(5);
> +	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
> +	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
>  	/* Assert PLL core reset */
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
>  	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
> -	<reg32 offset="0x00024" name="CTRL_0"/>
> +	<reg32 offset="0x00024" name="CTRL_0">
> +		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
> +		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
> +		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
> +		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
> +		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
> +		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
> +		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
> +		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
> +	</reg32>
>  	<reg32 offset="0x00028" name="CTRL_1"/>
>  	<reg32 offset="0x0002c" name="CTRL_2"/>
>  	<reg32 offset="0x00030" name="CTRL_3"/>
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
