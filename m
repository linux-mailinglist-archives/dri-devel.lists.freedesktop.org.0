Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72001732278
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3E510E033;
	Thu, 15 Jun 2023 22:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DAD10E033;
 Thu, 15 Jun 2023 22:09:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0C2A920AA5;
 Fri, 16 Jun 2023 00:09:15 +0200 (CEST)
Date: Fri, 16 Jun 2023 00:09:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Message-ID: <wlye7cj7q74ag6x6dnsqsb5brw2kauq5fgx75g5qgjq7wtkjig@cd3kujen77k2>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-13 03:09:39, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> Major part of the conversion was performed using vim script found at
> [1]. Then some manual cleanups were applied, like dropping fields set to
> 0.
> 
> Dependencies: [2].
> 
> Changes since v1:
>  - Rebased on top of msm-next
>  - Dropped dependency on interrupt rework
> 
> [1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
> [2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1
> 
> Dmitry Baryshkov (22):
>   drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
>   drm/msm/dpu: correct MERGE_3D length
>   drm/msm/dpu: remove unused INTF_NONE interfaces
>   drm/msm: enumerate DSI interfaces
>   drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
>   drm/msm/dpu: simplify peer LM handling
>   drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
>   drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
>   drm/msm/dpu: expand .clk_ctrls definitions
>   drm/msm/dpu: drop zero features from dpu_mdp_cfg data
>   drm/msm/dpu: drop zero features from dpu_ctl_cfg data
>   drm/msm/dpu: correct indentation for CTL definitions
>   drm/msm/dpu: inline SSPP_BLK macros
>   drm/msm/dpu: inline DSPP_BLK macros
>   drm/msm/dpu: inline LM_BLK macros
>   drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
>   drm/msm/dpu: inline MERGE_3D_BLK macros
>   drm/msm/dpu: inline various PP_BLK_* macros
>   drm/msm/dpu: inline WB_BLK macros
>   drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
>   drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
>   drm/msm/dpu: drop empty features mask INTF_SDM845_MASK

I am not sure how to process this series, seems like something went
wrong during sending.  Besides patch 16 being duplicate albeit with
different content, patch 20, 21 and 22 are duplicate as well and have an
interesting pattern where 21 and 22 are sent in reply to 20?

6587 N T 2023-06-13 02:09:54 Dmitry Baryshko (   0) ├─>[PATCH v2 15/22] drm/msm/dpu: inline LM_BLK macros
6588 N T 2023-06-13 02:09:55 Dmitry Baryshko (   0) ├─>[PATCH v2 16/22] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
6589 N T 2023-06-13 02:09:57 Dmitry Baryshko (   0) ├─>[PATCH v2 17/22] drm/msm/dpu: inline MERGE_3D_BLK macros
6590 N T 2023-06-13 02:12:37 Dmitry Baryshko (   0) ├─>[PATCH v2 20/22] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
6591 N T 2023-06-13 02:12:38 Dmitry Baryshko (   0) │ ├─>[PATCH v2 21/22] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
6592 N T 2023-06-13 02:12:39 Dmitry Baryshko (   0) │ └─>[PATCH v2 22/22] drm/msm/dpu: drop empty features mask INTF_SDM845_MASK

^ Here are 21 and 22 in reply to 20 ^

6593 N T 2023-06-13 02:14:49 Dmitry Baryshko (   0) ├─>[PATCH v2 18/22] drm/msm/dpu: inline various PP_BLK_* macros
6594 N T 2023-06-13 02:14:50 Dmitry Baryshko (   0) ├─>[PATCH v2 19/22] drm/msm/dpu: inline WB_BLK macros
6595 N T 2023-06-13 02:14:51 Dmitry Baryshko (   0) ├─>[PATCH v2 20/22] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
6596 N T 2023-06-13 02:14:52 Dmitry Baryshko (   0) ├─>[PATCH v2 21/22] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
6597 N T 2023-06-13 02:14:53 Dmitry Baryshko (   0) ├─>[PATCH v2 22/22] drm/msm/dpu: drop empty features mask INTF_SDM845_MASK

And here they are again.

See the same on Lore: https://lore.kernel.org/linux-arm-msm/20230613001004.3426676-1-dmitry.baryshkov@linaro.org/

- Marijn

> 
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 329 ++++++++----
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 348 +++++++++----
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 411 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 430 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 180 +++++--
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  89 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  89 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  96 ++--
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 236 ++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 484 +++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 445 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 467 ++++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 130 -----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
>  23 files changed, 3320 insertions(+), 1563 deletions(-)
> 
> -- 
> 2.39.2
> 
