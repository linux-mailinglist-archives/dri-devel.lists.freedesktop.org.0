Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61274CBA453
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 05:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6521510E94D;
	Sat, 13 Dec 2025 04:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzveGwpq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ4D4wJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2110E94D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:01:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BD0hbqC1562645
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LcNVAJsLGQf24kG2wRpel78O
 cIah1cBrBEulv8MZ6Y8=; b=YzveGwpqsxyZMxL+MIWY6mbtC40VeRt42mhWiAQK
 Wu3ASXaVCOZC3omld1a4BoNsJpoLKcf5ITq5he34sUjdHCV8z+UMjOA60oLrMayi
 bnDw3cv6Lu6Fjc9j1/hbTRsAvYsIOlRh60eelyqPF79E8scE0puEOXlqRD6WrsEI
 Xwg26V3QxPAsawjRI9VOuL0mz2bCP19fJtGXHwE1yjqz0F+KUqspWNLKzW68Q9+y
 VSIezrJMUXYXMcwkIYfOuWtaIJUZ29xf0kki072Cr5pZHpkbBx3W61XydXQibkJp
 Du8agDyyiaVewnsRAMtMhJluIcjCXEPD7lZPDjRzEVDvyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0wuf871q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:01:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1b7686f0fso32737011cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765598500; x=1766203300;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
 b=RQ4D4wJiH7moudZTFuVFqrSXNSrcQDJt3Jn8/xfuqIe1Fu/shAQcM9YavF0d+W433D
 xLy5DaXSor+aSMkhsDmflX7brZ7GhTEZ+ISLZKgCiNnMIq9Bmk22j0DnXvLfRURfCAqA
 7BNTOOUrPMwP42ZpfufAfbAvZWQiJKQ01hUM9thz8vJiqP9YeRLBqbU3JMS9wl69+PwB
 qiNmUoKBHQkYana2Mrrlw/7vpNpKHzzTyhNPwxTZCacoaP9qDAhmnj0Nm3Yicxbm+8uP
 Wr6jXqhidkkYUAcW9fB4cfskWjenQN9RMmf5wxLtG0swS4CYmhW2/275zyOevyHgYzOR
 dh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765598500; x=1766203300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
 b=DiFXIfAK/RqzlrhANg/nGy2gZXQjKW12ZpP99BuF/GkDEOmAcGbrQzd7Wn0UpmT0Yl
 s87FiJBo/sVKweSXhYK4HW+aWmM6VC60FJYVl4FTruCpAMWXgnamaUS6YPhcIFeq/3lj
 wx/iT/X+r7LNloyvJPEHg8ejPjt7kRDgVGdFq3F+4aq83ck3mOXHcaLl3zBqGi5BmcF2
 vtizClmqOWsA6ILuchcKvynmkhTNdJDsd/PgqnD/LH8kZA8FW0jGy9GLsg8lbokyfIvs
 8aJ9RW7ibYjU8zYrQMagSy35/hKUtjLy0yndwkZN0TfhWSD10cykTUx74QYz63TxHShM
 rv8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiToId1DEJ/CJMhMF6sdvcHh32PPzX3BS7CADgBBiONNFVH6VmbPoN/ZK7TMB0mXqXpY9vH0uX+IE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwr855Ti9DqlKWU3Wm2qIdkVNdPveS6kwdjjdv5J4O38PcQ6UG
 bzx7uX7oSI8zv8SDB/4Dy3sHPkUZsrhp08kO3PnXUCJkDdVmbCwQ3hNJTV6/lCOWV0/IIYpBXlU
 OIvO2B4I+zL/4JQXeSty9TiYrCWcBUME4vca7kEilTzJ79/7mMIDAuHpRfxrlVUgzYsvqJ5A=
X-Gm-Gg: AY/fxX6G4DgoaDTlR5Y30m8tPiHg7PWkr5kFfbKKu8sD7fpcqNvZBeqC4DRZVpwPiS+
 ubZZSRdD5N3dJxo4jEnYvFnAf3nUT+K+8pz4ZLVWs4dOx664CpfeXvXE5eOepf0uUOQ6u/smo64
 qFD7RFx1rf/FYdBZoWYiuLTcAdPcYF2mDn2nj1pfIaTDdEMEDuNECSN7Uc/a/oLlaHCTBUEl44b
 XrndZTeWM4PeJ39J3u7wkZ7wfLYJL4wxE5oLPnlpj35J3ASlxxktNjJK8F1wLymmNOc6oPrts6x
 8ZIdnYcxWy16B1nKBauul/tC8Hm0Ysz5DvmKx7cuSV2rV9FqXQ/KPiJMkuTqx1bs6N6FDseMoLN
 vLRSrKO9c9jZEDuZfWBDAFfZopzUOsHypddSxAyKGa9JnxuIfJn9z70jNgTfvJYmNT1MK1LsuxI
 m/+4hoQZfFuzVH1hIZXRkgHPY=
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id
 d75a77b69052e-4f1e2a4e0ecmr999761cf.4.1765598500314; 
 Fri, 12 Dec 2025 20:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6fsoDzbxK5AIYGHnnqvCIiJWXQuSf+BANSN6Bb11p3TUXgUWgwzIVGKz2HvArPjz2uurUQ==
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id
 d75a77b69052e-4f1e2a4e0ecmr999371cf.4.1765598499798; 
 Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f3eeecsm2643794e87.30.2025.12.12.20.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Date: Sat, 13 Dec 2025 06:01:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by
 register writes while clocks are off
Message-ID: <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfX+52e+NTf+FLZ
 4VbMmV/8PJo+h3+PWTulf0G0KMvgT1znXemejxB05HdRy8dVGj4CTxX9BqRCZisKs5tNHw96Fs+
 BRnDw4TUQQLf2JoBCW6FoCdsasYo9bzsAeKMrgDeTG1PwQs8NvxYQFBiyGs/cL8hjE9bzUkVWpN
 /2b5YSfx854w48/0pkwcPjY7pvPGWEVZKx/qaqKXWP4kCBW7F9X2LIeC4akeXTz71YCMrpp2HGh
 LZI4gjnvkwwYeITHcbQ3HDoKfV4bX5IhMv7Zdr6pI0gbNo4/NFGFk/Sp3K8TuzmZLofLiSEyxMy
 WA9dcM9n2V1uZQ65fKXj4tvYqkitP4VpyRy7qd6C0kD7FQQvo6zMPTo7CWrx7Sr9HQdeB3otGsM
 rmHIB4EPCpMBt8MHhzbhAjK3YmOs+w==
X-Proofpoint-GUID: 5cblIcFpjbdYuHsaB4-STdjDy_24FMbl
X-Proofpoint-ORIG-GUID: 5cblIcFpjbdYuHsaB4-STdjDy_24FMbl
X-Authority-Analysis: v=2.4 cv=cObtc1eN c=1 sm=1 tr=0 ts=693ce525 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=P0BQ7NvINjiI-4SoFKYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030
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

On Sat, Dec 13, 2025 at 12:08:17AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> This patch fixes system hangs that occur when RCG2 and DSI code paths
> perform register accesses while the associated clocks or power domains
> are disabled.

In general this should not be happening. Do you have a description of
the corresponding code path?

> 
> For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
> clock is gated can cause the hardware to lock up. Avoid toggling the
> update bit when the clock is disabled and instead write the configuration
> directly.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
>  2 files changed, 31 insertions(+)

This needs to be split into two patches.

> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e18cb8807d735..a18d2b9319670 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>  		f.m = frac->num;
>  		f.n = frac->den;
>  
> +		/*
> +		 * If clock is disabled, update the M, N and D registers and
> +		 * don't hit the update bit.
> +		 */
> +		if (!clk_hw_is_enabled(hw)) {
> +			int ret;
> +
> +			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +			if (ret)
> +				return ret;
> +
> +			ret = __clk_rcg2_configure(rcg, &f, &cfg);
> +			if (ret)
> +				return ret;
> +
> +			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +		}
> +
>  		return clk_rcg2_configure(rcg, &f);
>  	}
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e0de545d40775..374ed966e960b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  
>  static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  {
> +	/* Check if we're already powered off before writing registers */
> +	if (!msm_host->power_on) {
> +		pr_info("DSI CTRL: Skipping register write - host already powered off\n");

It definitely should be dev_something. Probably dev_warn().

> +		return;
> +	}
> +
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> @@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	int ret;
> +

Extra empty line

>  
>  	mutex_lock(&msm_host->dev_mutex);
>  	if (!msm_host->power_on) {
> @@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> +	/* Ensure clocks are enabled before register access */

And this looks like yet another fix, prompting for a separate commmit.

> +	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
> +	if (ret < 0)
> +		pm_runtime_put_noidle(&msm_host->pdev->dev);

pm_runtime_resume_and_get()

Also, where is a corresponding put() ? We are leaking the runtime PM
counter otherwise.

> +
>  	dsi_ctrl_disable(msm_host);
>  
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
