Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5829E8A7E03
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30B1132B4;
	Wed, 17 Apr 2024 08:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ykCPEj4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52AF1132B4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 08:19:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61804067da0so52731197b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713341950; x=1713946750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
 b=ykCPEj4DbBor3xv2NMdpyodV0tTLHEBUWcoAiHAj9mNr5rvZUkho90IFgfvVeQP6i1
 e9xsq1ppd9+Qq8b8GXizS7whXgHZ35FaI3kPJtAWOVK6UzjrYcBbepMTWYxA8TCKrzbu
 5w1ghY1QjFnjrWgftuPdEcDlLV2inArs++ux2s7kEjJxuqNbDD+cp4B8sIPgdofLtAi9
 vITMs3/rwMLsItwFZIRTFsCQx3Jx6+a5y+HiZ1hrrMV3y/XcjkX8ysV08Vk1eHI4fBMw
 LnLdCxT68EibGRKQAcyrd30zqxYcey53/VaGq4q8EOrArjeK76+1HbTyCXPZKF6FFssu
 we0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341950; x=1713946750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
 b=FBp6LaYs5irhVMTl3BwmOKpKv+l+4ynyqnkrpkBfXZuHI50j75TaO8EW42i2TF/IGk
 SPPVJv1foMVcE85D4RhrEcjhY7zUlh3HooA98d3WEfsUMlv7Qv13KnkOwrHQVWZPcrvJ
 pEGtJm0l0hDB6qCF+grT6+BbClK8RkmilPxTUP/KC5uWta0V5vvJvpRMYyfuqspM5qLH
 woVbfQ0eEqNO5ZyJnaJcvhqgBz4HLE2uGmf5njl/B+qJ70WJ088537yIT6QBsRvU5lCW
 yecKaDSmlm8MH3PqhldLBSIU1wmiuc6HAdUp9WlUOwRHVOqfQWYjfg8p1OcG/2wH7rDl
 +GHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcTyk1qIlDefIsvYVgvKpNcOR+6BZ+fxjWOzWuVqS6OB/KZFuJAgC4R8kKgDbckEQChJZn2Wg9CNHviITelrPmf1fZzZpi+sQSERP38FOP
X-Gm-Message-State: AOJu0YwCPMJ9kCzwRCT2nQayPB4UBxwXyhAeQDOzDU8OcwCmXqssc3Di
 C4jGo+b9/cjKkbe3CAPCJ+2TFmiD1dwx6ac1JwFxgNq+p7l7PI1/rzin5fOFC0NHvBx/sh2MS1k
 9TUYlkbcORRxcpCsWNsW50G9rWIYHv/tPE5PKlQ==
X-Google-Smtp-Source: AGHT+IE2lKg2BSkdW3aFZxTMV4gr/x3dbq3U7YbGvWBPNOlVvmP5HPCh/lfty+hy19RjhqRJv46ueaHdDZUJSm/+bS0=
X-Received: by 2002:a81:430f:0:b0:615:1e99:bd6e with SMTP id
 q15-20020a81430f000000b006151e99bd6emr14355086ywa.35.1713341949713; Wed, 17
 Apr 2024 01:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 11:18:58 +0300
Message-ID: <CAA8EJpry5Gct7Q2sAwFBVYV163X9BOcuKu9So47FEJaeXcdSaQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/dsi: Set PHY usescase before registering DSI
 host
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Ordering issues here cause an uninitalized (default STANDALONE)
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
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index af2a287cb3bd..17f43b3c0494 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -85,6 +85,17 @@ static int dsi_mgr_setup_components(int id)
>                                                         msm_dsi : other_dsi;
>                 struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>                                                         other_dsi : msm_dsi;
> +
> +               /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode.
> +                *
> +                * Set the usecase before calling msm_dsi_host_register() to prevent it from
> +                * enabling and configuring the usecase (which is just a mux bit) first.
> +                */
> +               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +                                       MSM_DSI_PHY_MASTER);
> +               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +                                       MSM_DSI_PHY_SLAVE);
> +
>                 /* Register slave host first, so that slave DSI device
>                  * has a chance to probe, and do not block the master
>                  * DSI device's probe.
> @@ -100,10 +111,6 @@ static int dsi_mgr_setup_components(int id)
>                         return ret;
>
>                 /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -                                       MSM_DSI_PHY_MASTER);
> -               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -                                       MSM_DSI_PHY_SLAVE);
>                 msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>                 msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);

Please move msm_dsi_host_set_phy_mode() calls too. Also please update
the non-bonded case.

>         }
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
