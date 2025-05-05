Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C0AA9344
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 14:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C9610E102;
	Mon,  5 May 2025 12:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oB+bGQbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256410E102
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 12:35:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BQj8R008632
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 12:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=t3lkQBdOSxlK02o6RqfGSm1o
 lk235v8tbkgI5LntsXs=; b=oB+bGQbfO3KCHvTZCMoYbqKwKZPR7zwpgZMu5ttq
 0mw6i1yKfqGDQ3aE/StTTiHaFU7OI+ht3od9x0xz2heKNqSbRVEeO8hEnPM6CRV6
 4sW+k4p7P3MWCFYoRn9MSn3f+8vYWiTyqm7RhgJAS5UYK4xWADER0qRfLR6lHTE3
 3OLptjKcLw9zkonuG/tmrHhN27Z8nQ+FuQ6E/PA72Lw+04D57oXmvNxQrkB0t8BC
 Lj3jieZ6Y6IPg/aqGZyGchxGsP0ZfsmvxtP5PcMD06Iqb5rUyRMDoyUtp/zAWrYk
 ff9Z7Jt+dRDVhjOCeipyqgMrM41WXLDPJuWvMN0n/KAMbg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rv4gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 12:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f3b94827so706843885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 05:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746448547; x=1747053347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3lkQBdOSxlK02o6RqfGSm1olk235v8tbkgI5LntsXs=;
 b=rmvy7pgE07ScRuQuUoCVe1XmzuQ/w2a6kFzc+KUaaE0jAgDSc/J6PuyZjehGEnp7GP
 Z+PsC/2YvQP4dWkWf6Akp7SpPI7EBjYBoNbBNwG9cJAeF7DtQzqXuBCvhrCLQPBemhTi
 M66OVKJA8LPCiqy4mtpDPnA+hfODwM34UbJiXE8yHCCuLfO86CxI/JxPcDLMuW9E8BDl
 xhYEy/Jh9oGuicSf4vzFnCT31MIXrm+hlxtkyByZPvpUQT5CYXlV68mnX7Mrp1sNeZ5X
 H081cHbcKmg032e7PMsdZZO17qIUp4QfXbwAyDMk0h4qwAOTuazoFhhsmzMHBczuZevM
 zj5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrlwFOyKGDiFCqxS1XzZsFlZJi4WWsbe0i1umpyyvqHQQspRRStY6FHFsFcnLQzM+3TcFh+yonsIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5tWSa3dEt4goLcptQLLGYiZPqyesTUhc2/Zpo134JgMwwZTM+
 dXTl6pwtoeGyvt8fQGxQHINk+KPsABx8IYzJ3nZ1bFB69CyVjdq0+GNyQXOX2w9cRiwGu34xmjW
 2aMoKpQ5vNGgLes1TmTMrHNxLYV58E1PT5/jE5b6v5TljMpuqZHdCkIzW7/C+yRMzIcs=
X-Gm-Gg: ASbGnct7gbCKB8XS9CC+KNJJUAitfcJg64VfPW3n32Ig1UDdEXIkzCVqVSAbiisqlON
 qq5ll7mTUf63mA7JwdBHFDJY+cfhlBhuTjuRLY9KQ6SLHzuhlbsg12RxXoKoed53PMfi3MMouY1
 l0JdzxirZqD9S53zKHh6x2DgzbwNpXc6/056ZDSy1TIOU5gviDi2BpcX4+eztzMkOR44ozyaW4x
 NRo4rHkFICIRmIZZ509VwIZVL6lFzeWX/tkCcMEZgnjScpRCAp2G6TAnKPucW7LBCmy3NKdT9ot
 62dRi5gOoYpnAKaTXMQ9/mDRGxqAJY4tUlBbgOPH/rUMP31IaV+/zSN5aC6ByhawBtZCCv/A2lw
 =
X-Received: by 2002:a05:620a:2a16:b0:7c5:4b6a:d862 with SMTP id
 af79cd13be357-7cad5b4d28cmr1471549785a.33.1746448547558; 
 Mon, 05 May 2025 05:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwtkRQRntUbGznMt8lXyW4K5q0xBaV6j0bk3J+OZSNHs09W25QCShb9JofbW226xRCv08R8g==
X-Received: by 2002:a05:620a:2a16:b0:7c5:4b6a:d862 with SMTP id
 af79cd13be357-7cad5b4d28cmr1471544285a.33.1746448547088; 
 Mon, 05 May 2025 05:35:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1694392e87.105.2025.05.05.05.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:35:46 -0700 (PDT)
Date: Mon, 5 May 2025 15:35:44 +0300
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
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Message-ID: <hobn3fq647z54q6uqrooapokipr4zoxfb3tztg46lwzcsof3jd@5bwn34r2v7ks>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
X-Proofpoint-ORIG-GUID: I0FGjTupiSN9vveyMckF4dbFImrB9EMq
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818b0a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=vPhFULFQeS3k4onP6IoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I0FGjTupiSN9vveyMckF4dbFImrB9EMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyMCBTYWx0ZWRfX87/1YCBECjqR
 HrTxRw7GNdTx96gZjC1nbV3k4b5VesM+TDrq2ASQeLzDJ+F+TxQg2qMuRbG4CFCXt9jxk8mvEQy
 8cSbE7LvDzSyztmkpwGULfmsZBHumcjK7TycDCTZqg3Qja7FHaBnmUe/BrsYNz+VUxM3D0rnLLf
 /fO9Xu/kuFR9bFmt8pDGnpzLaS8SJWGjyck3eWHYUoDusMRCYF6Q3H7VrMCbrl7+2JSElIav5T8
 s3r00EGa0C+Z7RNUkOuKfDHYVyWKze+gj/9/FGk6aI2lIBJma27A9qtDrQupEygFXHO41oZL+K2
 F4GCMJNcvlfTWWZtLKtbdJg9iAMxIsdkL+g8MzFoqYooUaUMfK89eNih2pKty/116Vq7J1T+dGs
 vfOcK+MXSALK1qEYZvshhEVNeJOrUFnmi7k0st52kql6b0IJD4sGuCnwdsta6C5NXzu4xcXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050120
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

According to the docs this should be handled by the
CLK_OPS_PARENT_ENABLE flag. Please correct me if I'm wrong.

> +	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);

And this.

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
