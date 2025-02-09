Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E40A2E165
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 00:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9821A10E0DE;
	Sun,  9 Feb 2025 23:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IckJv4zR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4127110E0DA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 23:12:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450475df04so1500872e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739142723; x=1739747523; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
 b=IckJv4zRc8qUiRud+5BmtAU9185i13yrjCEyPe0F5ApjF1Ysv2SeDyM1ndlyK+3Z0+
 sdAueaghn18apFHkjtQKbhBGycItqD4puD+ha1A30HZQBRXQW8gwv885P94/BsvNPtWA
 aZ6uha+x4itITEg7mmLEVrnpmUe0MzJqjCUFX9EgE20TInawDkGOrpARR3SfbGv/kY0F
 P1Q2rXyQaJEE6Md7PKCCm5RZO8Z7zBO4x54KbudqSpNNkZlBadewF1Wcs+i2noTmn+lE
 /eCxFF/ujaIPUjmW8TExWyznC7GnF8iwhYFl39Ph+ZV90yyPjtq1aK3Ve6DMU8k7kbBm
 G8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739142723; x=1739747523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
 b=wK+iUCaxS4nRVHv7nOZ5lq1/i2fUCCs3tYq7GiN+OuC03Gyyvq48YtDdUqWW7RIWT1
 nqOfafZYMffUoGCf26m4Pzj6q8dJYr3cieS6C0O1vH6t1XI+5aYWRK3LJjdszT5zOKaT
 R3OVNsu6tLLYt3ulwYHcX36anxVq3GUUeiK0Wq9kKXrFeTTjytVwXlAb4GY3Lg+5ghry
 dp20kGHsSRVdH9XnBMWamX9aEXyV27wZIPjnEJ2nRwrs/XW3uwukq/VhRXC0vVxAUs9d
 mGILwCrud9dtFam4TMOW2Z+6u/fXUl6FmBO8/GuOjkzC4lCm0mbS6YP83oEse8zg4g9T
 Decw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp5SNQJBo00yfRixmPihcbNsUw++nnS0BOrOSw6sRhvMkAXS34Risbo9qz4CZlh6Wd0H20bbegx80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Mmrb+gV3z5nM/QIHCYWBQGp87lwbyLhRqF2FmuCSmimtCbqV
 6tf2gMM0YNfYHO28ZB/jmdU0eB0opuIpUovRtnLVSCfvcChcJtx5kG/JSInoctM=
X-Gm-Gg: ASbGncs0PyUTMkR/9tR3gVy+5qcABI1ikXb0QGGUKA6ukfpzdCk0uYKJh4/SWvFZg/f
 1xDXCKx6HPDNg5Wqmb3WXnlbnfT9nS6tLCT+rWXNobRXLKbgOSQyEkaR/xMqmYlGxGT1qtbGbSh
 L7pVrqIBaWc2dQ1U24wd9Rrw8bSLnqw/A7P6xrtms1DAW1f3J0NXqC8jIPbaRkYeowIhBTHHAg0
 1gEvzBtg4FnTCnXno3XFA6dGWPwYIiJs4Px1fQ07PnIY6Yf1pI5yG78V9bRfvwLCOrq0El9JPNU
 jBQG4l6lyC53rKM7QetD1NyOdKVCq+Sh3NHbeqHgNDMwDFy8u+FqTvtnYFP641+TL5xCx/o=
X-Google-Smtp-Source: AGHT+IF00rLDAE/Zu8DuAgn3EOiGHavqn93g+Q4K+br4ppdg5/rNEYRwOpkH1xQrqhqfhAl/+SpNmA==
X-Received: by 2002:a05:6512:6c5:b0:545:a89:4dc7 with SMTP id
 2adb3069b0e04-5450a894ef0mr906708e87.52.1739142722973; 
 Sun, 09 Feb 2025 15:12:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450bb646a5sm208604e87.146.2025.02.09.15.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 15:12:01 -0800 (PST)
Date: Mon, 10 Feb 2025 01:11:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
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

On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> Ordering issues here cause an uninitialized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> 
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
> 
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)


Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
>  	int ret;
>  
>  	if (!IS_BONDED_DSI()) {
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +
>  		ret = msm_dsi_host_register(msm_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  	} else if (other_dsi) {
>  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							msm_dsi : other_dsi;
>  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							other_dsi : msm_dsi;
> +
> +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> +		 *
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +					MSM_DSI_PHY_MASTER);
> +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +					MSM_DSI_PHY_SLAVE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> +
>  		/* Register slave host first, so that slave DSI device
>  		 * has a chance to probe, and do not block the master
>  		 * DSI device's probe.
> @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
>  		ret = msm_dsi_host_register(master_link_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -					MSM_DSI_PHY_MASTER);
> -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -					MSM_DSI_PHY_SLAVE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
>  	}
>  
>  	return 0;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
