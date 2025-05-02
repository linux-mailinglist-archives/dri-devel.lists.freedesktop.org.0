Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BFAA7C6F
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059FB10E976;
	Fri,  2 May 2025 22:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4owbPlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D89810E2C2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 22:52:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAq24009068
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 22:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IMgAeV6O9mToM6/y5/LWAAK7
 kKgWJWa/1zV0eFvjo2Y=; b=M4owbPlIx830KWEtD2qzmIOJ0vpdBREmuHVV0IY6
 lOmcaJO4nb7/TECsPc0QZdXryxi9x/hNOcl3Cw4TD3oZYoJQ4hdIwnp48STQYq8j
 zfSS4di/0Z2+2lqvJKbNEA6XZDpnVwNXb4saHH0LEj3Ow863SpZfOuTHk2f6K5v9
 jAAdFf7y5WngmnjBjBoi+oyzVlGBlFz/3KXNQDvTmJSzHZobx3N/tApCA8fnN1ZQ
 8L09vPreOj5g51+nl6LakGZKFvKJHuUIFsY5l4ftgNToMdKe6bnsfVfuHE7X8BJS
 jBskEexEF2LjJxy3LKFyx8IaykauLZfwVnOboiq5jx/w6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21k8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 22:52:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so389627985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 15:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746226364; x=1746831164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMgAeV6O9mToM6/y5/LWAAK7kKgWJWa/1zV0eFvjo2Y=;
 b=pOLis9NKisfzePSHQoISRw7XvEPe8oBnYYtqSljnuCZbEbrRokfBXVA1yg6Jx8ry+i
 9hVeY4L4lVHfs7w+NYlMfzfKoQoVoEyrW1imzekQCeS09t75Tdp1sW8HyFit+j0n+zzP
 /v5PdyYU7ijCN7FO2lKMBLU6tabxRfxb5cbcgGypPo6eq6g/3xxig8dUNnHMUFyoBMZR
 5ggUVh7d3OaGOr04L+MjE+6o1AauYy7r6jjl6iXG3GkcFSt4vW2R5ttCZ7FhnUQpVwo7
 W2bEUPri4Pnd7LdIAjhzWD7EnBS2O2rHoEBzVQyBVANNdx627CurHHcRfD0hh3cPtQFk
 a1Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW8mvC63Lb8IElrMmue76JcRhPffmCZ9cRjnmUP0HtPG6nQMmLpcGLSDpCTl+J9AnIBMshRkBc+pI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx92hgCnbdu+Xs0KZwXbmoFq3X0C4fX5HONa5w2JR+Bb65UIna+
 4rS1kpJYB5UFd9bLxOZXlirgddOUkQT/5lQIMQu9g11+IgAyUW4AEH1p3uMZKx3OQk2laiEpoaH
 xjcyPE53iydvJAWmZIhsl5N/YLrmxi6nzSgYpzoxxHCVOcyQVsxTBLE/FOWMNCHTygLE=
X-Gm-Gg: ASbGncuSBYFO0z3jKcVdeAHTQIJJG+Om6pa2TCn+Oo9P0EU/m0fq7GFH/T0aHT8EpqU
 cJhgcL033kYa2cjNFOUAQG9WyhoVr5aSLWKskOWkDFhWm2nC0GVoFpZF332C1czh66fKBVOAU65
 5Snusq8QYiouRbdRtQvKL+a9eOPMgh66C2TvDvvU8u5nhw10Eg7uaVQy4NpE+DE6fJKJZON+tmx
 t2oHkkhVEfl+QKkaY3/t/3bTPc2a6ARYLtmXImo/LtqTcPcolBg+VPirVMsfNxU6eKOYpZfVmKj
 Nuy8NY44M4CBq4/IQgjIiAucg4fd6GBpH99Vp+77wpbD/lc9eIBXC7ET3Qq56CTcK5EEbg5gr80
 =
X-Received: by 2002:a05:622a:244e:b0:476:980c:10a8 with SMTP id
 d75a77b69052e-48c3163ec05mr85645311cf.21.1746226364184; 
 Fri, 02 May 2025 15:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFAXOcRLf2Z3bspGcZv0cNlael5HGsrydFHbIvTQUjv2j75Z2QZiLIQoy7bHSRAG7G4lj9PQ==
X-Received: by 2002:a05:622a:244e:b0:476:980c:10a8 with SMTP id
 d75a77b69052e-48c3163ec05mr85645011cf.21.1746226363828; 
 Fri, 02 May 2025 15:52:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32029306984sm4992161fa.58.2025.05.02.15.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:52:42 -0700 (PDT)
Date: Sat, 3 May 2025 01:52:40 +0300
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
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Message-ID: <ahx623ttvzd62u4fri6iqguj7mirlf22tvwbu6k2ngxw6hwbcp@oh7mmex5fjmz>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68154cbd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=vPhFULFQeS3k4onP6IoA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NyBTYWx0ZWRfX3QClm9uwg5GN
 Io2qXmHrIeAbQ43e1lrKR3tk8phZPtKuczcMSpKCCmv71rcIht1LbxXjxouAiPiVlmJiGZ79oo+
 PSN8JYElzNd4v8gvUo/pyHtRekNTzlj/f9cNmxCG89nX1dYqkXmtSo83kDFSoPXtmbnDoeIUUp/
 /DmD9AHxSoaV8IgmXWMX8Ii0yOBcpjtLfIkWUiGwUh2QLmglIrutOI4uh7lnQtlKruGd88OxFzV
 TPcqQz6X0EtlKTJ2SN9P3JwJdBg7biUGHaLG/Lh+iGkTJIvO2WVGdKTixuskiskFxLVyXonPrlo
 cH2WuXMzqWmJmKQ181V/0Aqcem5ACqlh2s7V6fdFs2oTJQvIT5yBfWm7gPAIeLsvbAEHyAPW5M0
 qZzGL2DP2nlWsRis9sXQN1hAAog1j5GkHRjaBf0zJyqt4SFHFG33+uAaHqTmChos9Xps3/7W
X-Proofpoint-GUID: 4TfXeDUOos_r5Ml4JG3r9ukLjwJEvhtZ
X-Proofpoint-ORIG-GUID: 4TfXeDUOos_r5Ml4JG3r9ukLjwJEvhtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020187
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

On Wed, Apr 30, 2025 at 03:00:49PM +0200, Krzysztof Kozlowski wrote:
> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> 
> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> parents before DSI PHY is configured, the PLLs are prepared and their
> initial rate is set.  Therefore assigned-clock-parents are not working
> here and driver is responsible for reparenting clocks with proper
> procedure: see dsi_clk_init_6g_v2_9().

Is it still the case? I thought you've said that with the proper flags
there would be no need to perform this in the driver.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. Only reparent byte and pixel clocks while PLLs is prepared. Setting
>    rate works fine with earlier DISP CC patch for enabling their parents
>    during rate change.
> 
> Changes in v3:
> 1. Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
> 
> SM8750 DSI PHY also needs Dmitry's patch:
> https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> (or some other way of correct early setting of the DSI PHY PLL rate)
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 14 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 81 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 98 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>  int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
> @@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..7f8a8de0897a579a525b466fd01bbcd95454c614 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -257,6 +257,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
>  	.calc_clk_rate = dsi_calc_clk_rate_6g,
>  };
>  
> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
> +	.link_clk_enable = dsi_link_clk_enable_6g,
> +	.link_clk_disable = dsi_link_clk_disable_6g,
> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
> +	.tx_buf_get = dsi_tx_buf_get_6g,
> +	.tx_buf_put = dsi_tx_buf_put_6g,
> +	.dma_base_get = dsi_dma_base_get_6g,
> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
> +};
> +
>  static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
> @@ -300,6 +312,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
> +		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
>  };
>  
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -30,6 +30,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
>  
>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 4d75529c0e858160761f5eb55db65e5d7565c27b..694ed95897d49c477726a2b0bec1099e75a3ce21 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -119,6 +119,15 @@ struct msm_dsi_host {
>  	struct clk *pixel_clk;
>  	struct clk *byte_intf_clk;
>  
> +	/*
> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
> +	 * PLL:
> +	 */
> +	struct clk *byte_src_clk;
> +	struct clk *pixel_src_clk;
> +	struct clk *dsi_pll_byte_clk;
> +	struct clk *dsi_pll_pixel_clk;
> +
>  	unsigned long byte_clk_rate;
>  	unsigned long byte_intf_clk_rate;
>  	unsigned long pixel_clk_rate;
> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
>  	return ret;
>  }
>  
> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
> +{
> +	struct device *dev = &msm_host->pdev->dev;
> +	int ret;
> +
> +	ret = dsi_clk_init_6g_v2(msm_host);
> +	if (ret)
> +		return ret;
> +
> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
> +	if (IS_ERR(msm_host->byte_src_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
> +				     "can't get byte_src clock\n");
> +
> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
> +				     "can't get dsi_pll_byte clock\n");
> +
> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
> +	if (IS_ERR(msm_host->pixel_src_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
> +				     "can't get pixel_src clock\n");
> +
> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
> +				     "can't get dsi_pll_pixel clock\n");
> +
> +	return 0;
> +}
> +
>  static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  {
>  	struct platform_device *pdev = msm_host->pdev;
> @@ -370,6 +411,46 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	return 0;
>  }
>  
> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
> +{
> +	struct device *dev = &msm_host->pdev->dev;
> +	int ret;
> +
> +	/*
> +	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
> +	 * setting the rates of pixel/byte clocks.
> +	 */
> +	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
> +		goto out_disable_byte_clk;
> +	}
> +
> +	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
> +	if (ret)
> +		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
> +
> +	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
> +	if (ret)
> +		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
> +
> +	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
> +	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
> +
> +	return dsi_link_clk_set_rate_6g(msm_host);
> +
> +out_disable_byte_clk:
> +	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
> +
> +	return ret;
> +}
> +
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
>  {
>  	int ret;
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
