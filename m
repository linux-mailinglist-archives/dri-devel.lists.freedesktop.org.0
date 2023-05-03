Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE896F61CD
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EBB10E379;
	Wed,  3 May 2023 23:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911BF10E371
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 23:10:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A7B34401D7;
 Thu,  4 May 2023 01:10:21 +0200 (CEST)
Date: Thu, 4 May 2023 01:10:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v4 0/7] add DSC 1.2 dpu supports
Message-ID: <pctbvyuh6jpgm7ey7xlsjc3bg56gehtn7agl6n2uk7ntly2q5s@sp7wund5phee>
References: <1683144639-26614-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683144639-26614-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-03 13:10:32, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from [3].

I left a bunch of comments, suggestions and questions on a few patches
and the cover letter in v3, but some do not seem to have been
addressed/answered.  Can you take a look?

> Abhinav Kumar (2):
>   drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
>   drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
> 
> Kuogee Hsieh (5):
>   drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
>   drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK and PP_BLK_TE
>     marcos

Since I did not get to review this patch yet:

  macros*

But remember that, as per my comment in the v3 cover letter, it is
conflicting with the catalog changes in [3].

- Marijn

>   drm/msm/dpu: add PINGPONG_NONE to disconnect DSC from PINGPONG
>   drm/msm/dpu: add support for DSC encoder v1.2 engine
>   drm/msm/dpu: separate DSC flush update out of interface
> 
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  23 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  26 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  35 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  26 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   2 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  33 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  34 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  22 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 385 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
>  25 files changed, 650 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
