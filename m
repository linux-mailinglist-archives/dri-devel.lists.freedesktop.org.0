Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9FA0344F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 02:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD4A10EA4E;
	Tue,  7 Jan 2025 01:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZTOgNqBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCC310EA4C;
 Tue,  7 Jan 2025 01:06:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 51C95A42016;
 Tue,  7 Jan 2025 01:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44E6C4CED2;
 Tue,  7 Jan 2025 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736211992;
 bh=HxnpOGAaI3OOYc4etBOTWD/3CdKBm8mzRjtbLNKX4Fk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTOgNqBNpXXztAGru/Ns2aHvzB1UuAUWqVMxdL63KjTA/Az8JZiF+TJK9AqYUWVHS
 uR9fkTTF+sZw9NNcwheR+w8MNxz9eQiTQVX1/Pw5JxpBIg52z4R6qgeSp0vZNhz74C
 QuOWn8tHT7SV/IqmpRmx42381TKq96eRfpg9yJxnR+UCcen/pr/PQbyB7pGeHrlhq6
 VoLspvT5u3HT1TCmRiEv4/TIr+c0j++c3cFMXUjSJpkAFU9bSkZ72bbbvNAHpXgm7r
 YB4+rzYG6BcDoJjKtwaKIcE1T2Us0kd3i+VkPFe69aX0BCKRiQsmo5hGPn1FQ7zTWc
 7AIWFIwhNMvGQ==
Date: Mon, 6 Jan 2025 19:06:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Rob Clark <robdclark@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 00/45] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <krjmi2i6vywfh4tgizcdqw2d45r7argjaatly3tjnsg6p3cgxr@jipl5accjkde>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:31PM -0800, Abhinav Kumar wrote:

Please discuss with and reply to Dmitry's questions/feedback on the
list, so that it's possible for others to join the discussion.

Regards,
Bjorn

> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/patch/622243/ (to avoid a log spam)
> [2] : https://patchwork.freedesktop.org/series/142010/ (to fix up HPD)
> [3] : https://patchwork.freedesktop.org/patch/612740/ (to avoid blank screens)
> [4] : https://patchwork.freedesktop.org/series/140216/ (MDSS DT for sa8775p)
> [5] : https://patchwork.kernel.org/project/linux-arm-msm/list/?series=912200
>       (Display Port DT changes for sa8775p)
> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [6] : https://patchwork.freedesktop.org/series/142016/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.
> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Stephen Boyd <swboyd@chromium.org>
> To: Chandan Uddaraju <chandanu@codeaurora.org>
> To: Guenter Roeck <groeck@chromium.org>
> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Vara Reddy <quic_varar@quicinc.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (43):
>       drm/msm/dp: dont call dp_catalog_ctrl_mainlink_ctrl in dp_ctrl_configure_source_params()
>       drm/msm/dp: disable the opp table request even for dp_ctrl_off_link()
>       drm/msm/dp: fix the intf_type of MST interfaces
>       drm/msm/dp: split msm_dp_panel_read_sink_caps() into two parts
>       drm/msm/dp: add a helper to read mst caps for dp_panel
>       drm/msm/dp: remove dp_display's dp_mode and use dp_panel's instead
>       drm/msm/dp: break up dp_display_enable into two parts
>       drm/msm/dp: re-arrange dp_display_disable() into functional parts
>       drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
>       drm/msm/dp: move the pixel clock control to its own API
>       drm/msm/dp: split dp_ctrl_off() into stream and link parts
>       drm/msm/dp: make bridge helpers use dp_display to allow re-use
>       drm/msm/dp: separate dp_display_prepare() into its own API
>       drm/msm/dp: introduce stream_id for each DP panel
>       drm/msm/dp: convert dp_display_set_mode() to use dp_panel argument
>       drm/msm/dp: add support for programming p1 register block
>       drm/msm/dp: use stream_id to change offsets in dp_catalog
>       drm/msm/dp: add support to send ACT packets for MST
>       drm/msm/dp: add support to program mst support in mainlink
>       drm/msm/dp: no need to update tu calculation for mst
>       drm/msm/dp: add support for mst channel slot allocation
>       drm/msm/dp: add support to send vcpf packets in dp controller
>       drm/msm/dp: always program MST_FIFO_CONSTANT_FILL for MST
>       drm/msm/dp: abstract out the dp_display stream helpers to accept a panel
>       drm/msm/dp: move link related operations to dp_display_unprepare()
>       drm/msm/dp: replace power_on with active_stream_cnt for dp_display
>       drm/msm/dp: make the SST bridge disconnected when mst is active
>       drm/msm/dp: add an API to initialize MST on sink side
>       drm/msm/dp: skip reading the EDID for MST cases
>       drm/msm/dp: add dp_display_get_panel() to initialize DP panel
>       drm/msm/dp: add dp_mst_drm to manage DP MST bridge operations
>       drm/msm/dp: add connector abstraction for DP MST
>       drm/msm/dp: add irq hpd callback for dp mst
>       drm/msm/dp: add support to re-use and clear the panel edid
>       drm/msm/dp: add a mst session mutex to protect bridge ops
>       drm/msm: add support for non-blocking commits
>       drm/msm: initialize DRM MST encoders for DP controllers
>       drm/msm/dp: initialize dp_mst module for each DP MST controller
>       drm/msm: add a stream to intf map for DP controller
>       drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
>       drm/msm/dp: mark ST_DISCONNECTED only if all streams are disabled
>       drm/msm/dp: populate the max_streams for sa8775 mst controller
>       arm64: dts: qcom: add mst support for pixel 1 stream clk for DP1
> 
> Yongxing Mou (2):
>       drm/msm/dp: propagate hpd state changes to dp mst module
>       arm64: dts: qcom: add mst support for pixel stream clk for DP0
> 
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   23 +-
>  drivers/gpu/drm/msm/Makefile                       |    3 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   25 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   29 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |    1 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  292 ++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   27 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  454 ++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   21 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |  559 +++++++---
>  drivers/gpu/drm/msm/dp/dp_display.h                |   33 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |   53 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   12 -
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c                | 1118 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h                |  110 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   41 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   15 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |   25 +-
>  drivers/gpu/drm/msm/msm_atomic.c                   |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   29 +
>  drivers/gpu/drm/msm/msm_kms.c                      |    1 +
>  24 files changed, 2589 insertions(+), 296 deletions(-)
> ---
> base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8
> change-id: 20241205-dp_mst-d62fa86257ed
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
