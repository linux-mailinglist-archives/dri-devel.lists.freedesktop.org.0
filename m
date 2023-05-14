Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3E701FDF
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 23:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0410E113;
	Sun, 14 May 2023 21:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD69810E0DD;
 Sun, 14 May 2023 21:31:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CE6F23F250;
 Sun, 14 May 2023 23:31:44 +0200 (CEST)
Date: Sun, 14 May 2023 23:31:43 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v8 0/8] add DSC 1.2 dpu supports
Message-ID: <h6vc4delvatto3vyyho5io3ebs2yhmgrchnxcprca56my6fflb@4fcb334sdmpn>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Asked this before: change the title to "DPU support" (capital "DPU",
singular "support") if this series keeps being resent.

On 2023-05-12 11:00:15, Kuogee Hsieh wrote:
> 
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].

series*

rebased*

Also I think it's not just the catalog fixes but everything now, because
we were both touching HW block implementations?

- Marijn

> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/
> 
> Abhinav Kumar (2):
>   drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
>   drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
> 
> Kuogee Hsieh (6):
>   drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
>   drm/msm/dpu: test DPU_PINGPONG_DSC bit before assign DSC ops to
>     PINGPONG
>   drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
>   drm/msm/dpu: add support for DSC encoder v1.2 engine
>   drm/msm/dpu: separate DSC flush update out of interface
>   drm/msm/dpu: tear down DSC data path when DSC disabled
> 
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   7 +
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  11 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  59 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  31 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  36 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  29 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 382 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
>  19 files changed, 649 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> -- 
> 2.7.4%%
> 
