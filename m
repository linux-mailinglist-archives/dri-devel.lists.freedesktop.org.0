Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D243D5E6195
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BCB10EACC;
	Thu, 22 Sep 2022 11:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D5910EAD9;
 Thu, 22 Sep 2022 11:44:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84DDB62D33;
 Thu, 22 Sep 2022 11:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFAFC433D6;
 Thu, 22 Sep 2022 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663847054;
 bh=azhcTDdJTK0KkQWrJRsy2lPns5Akr3BdY1FgCzSmMLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZHI3ooVRzNbl9OZO3Fl5sl1qg44wBb+WiHG6QnEdKsX2f2whlzMdMbdAU3P08cvkW
 tw9Tsuu+Ejl0vjsQtNB4Gsso7hC3Fg7amaMzjuEySRPZh3Vvjcllw11hZzpUCgc9Z1
 y2kT7GN9KumIG3DLoMxELg26l7fs1axe2wqSjYpz99JTdur/SH88w4NgkhXtEcuWfV
 TFQ4S/Rdp0Xpl4qQ7KNhUnAdNUm3xebOsct7GT0FghSeqaW+I+y1kP+hEbouALHGmy
 7Ct2XTTC14oLCyWD4PjnWqHTsQV7wlDP3ZQ/67VqLQp2wFXEflGjnYVWew975t6b5V
 ZrI7/hTnPaj8A==
Date: Thu, 22 Sep 2022 17:14:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 0/5] drm/msm: add support for SM8450
Message-ID: <YyxKiv4NZw90HVlh@matsya>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-09-22, 14:30, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Tested this on DM8450-HDK with HDMI and it works for me.

For whole series:
Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>


> 
> Dmitry Baryshkov (5):
>   drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
>   drm/msm/dsi: add support for DSI 2.6.0
>   drm/msm/dpu: add support for MDP_TOP blackhole
>   drm/msm/dpu: add support for SM8450
>   drm/msm: mdss add support for SM8450
> 
>  drivers/gpu/drm/msm/Kconfig                   |   6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++++++-
>  drivers/gpu/drm/msm/msm_mdss.c                |   8 +
>  11 files changed, 381 insertions(+), 15 deletions(-)
> 
> -- 
> 2.35.1

-- 
~Vinod
