Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC69FC881
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 06:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF9510E70F;
	Thu, 26 Dec 2024 05:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dyjxDSBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35710E70F;
 Thu, 26 Dec 2024 05:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 963605C6003;
 Thu, 26 Dec 2024 05:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EFEC4CED1;
 Thu, 26 Dec 2024 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735190285;
 bh=vMxXnhukB2vwcZRK8b6hSIIgYKD4V02K2P6FXrgfp1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dyjxDSBOVYkRsCj4YaE7+Chk9LX5vjKu0IAAEhdK0WUPhRofhxs4HgWUJwnxoXx26
 GwDxBbrI+9D66omxAYjXm9fakAcHYAtMaFobO/ndxzu/ug9oCW17foVZ8cxyGB7LHw
 DNKdWUldDUXS5U+II28HVZnTLpHPD7ItR3BaiQXpKnSDA0FFEgd1CjqPplxs9WJGW2
 nk7TQ7YHJVcoMw1WbUvg5kiZ8aPH1MSYaOkCtGkV4XSqRgQrMGpgC4ekFG+XODzUbP
 qvOHoyLrlGRL3jscEZtyPq5W5fUteb6sKCJiCAb+0BTzf0Q/fZVhAHbpdQ6+scue8Q
 XW7SIm2iF3zrQ==
Date: Wed, 25 Dec 2024 23:18:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Liu Li <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/9] Add display support for QCS615 platform
Message-ID: <eqlps3dslxiq2vogelt4cl6edkyljim5yxhioo4qry3ryetxen@42lyv7pjzzfz>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:53:51PM +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> Only dts part of this patch series depends on the following patch series
> The other dependency patches have already been merged into linux-next
> - dispcc
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> - dispcc dts
> https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
> 

I don't understand why you send patches to the list with dependencies on
patches that has received feedback and requests for changes. Now you're
forcing me to go see if perhaps there was a new version of that series
that I have merged.

I can't find a v2 of that series, so your series is spam in my inbox.

> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> Changes in v4:
> - Add dp-connector node for anx_7625_out [Dmitry]
> - Add missing qcom,sm6150-dsi-ctrl for dsi-controller-main.yaml [Krzysztof]
> - Change VIG_SDM845_MASK to VIG_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
> - Change DMA_SDM845_MASK to DMA_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
> - Remove redundant annotation from sdm845_dsi_cfg [Dmitry]
> - Remove redundant blocks from sm6150_intf [Dmitry]
> - Update mdp_opp_table opp clk to correct value
> - Link to v3: https://lore.kernel.org/r/20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com
> 
> Changes in v3:
> - Add reg_bus_bw for sm6150_data [Dmitry]
> - Remove patch for SX150X defconfig [Dmitry]
> - Remove dsi0_hpd_cfg_pins from ioexp [Dmitry]
> - Remove dsi0_cdet_cfg_pins from ioexpa [Dmitry]
> - Remove tlmm node for ioexp_intr_active and ioAexp_reset_active [Dmitry]
> - Remove qcs615_dsi_regulators and reuse sdm845_dsi_cfg [Dmitry, Konrad]
> - Rename qcs615/QCS615 to sm6150/SM6150 for whole patch [Dmitry]
> - Rename qcom,dsi-phy-14nm-615 to qcom,sm6150-dsi-phy-14nm [Dmitry]
> - Rename qcom,qcs615-dsi-ctrl to qcom,sm6150-dsi-ctrl [Dmitry]
> - Rename qcom,qcs615-dpu to qcom,sm6150-dpu [Dmitry]
> - Rename qcom,qcs615-mdss to qcom,sm6150-mdss [Dmitry]
> - Split drm dsi patch to dsi and dsi phy [Dmitry]
> - Update yaml clocks node with ephemeral nodes and remove unsed include [Dmitry, Rob]
> - Link to v2: https://lore.kernel.org/r/20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com
> 
> Changes in v2:
> - Add QCS615 DP controller comment in commit message [Dmitry]
> - Add comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins [Dmitry]
> - Add missing port@1 for connector for anx7625 [Dmitry]
> - Change 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects [Dmitry]
> - Change 0 to GPIO_ACTIVE_HIGH for GPIO flags [Dmitry]
> - Move anx_7625 to same node [Dmitry]
> - Move status to last in mdss_dsi0 [Dmitry]
> - Rename dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins in ioexp [Dmitry]
> - Rename dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins in ioexp [Dmitry]
> - Rename anx_7625_1 to dsi_anx_7625 in ioexp [Dmitry]
> - Remove absent block in qcs615_lm [Dmitry]
> - Remove merge_3d value in qcs615_pp [Dmitry]
> - Remove redundant annotation in qcs615_sspp [Dmitry]
> - Remove unsupported dsi clk from dsi0_opp_table [Dmitry]
> - Remove dp_hpd_cfg_pins node from ioexp [Dmitry]
> - Splite drm driver patches to mdss, dpu and dsi [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com
> 
> ---
> Li Liu (9):
>       dt-bindings: display/msm: Add SM6150 DSI phy
>       dt-bindings: display/msm: dsi-controller-main: Document SM6150
>       dt-bindings: display/msm: Add SM6150 MDSS & DPU
>       drm/msm: mdss: Add SM6150 support
>       drm/msm/dpu: Add SM6150 support
>       drm/msm/dsi: Add dsi phy support for SM6150
>       drm/msm/dsi: Add support for SM6150
>       arm64: dts: qcom: Add display support for QCS615
>       arm64: dts: qcom: Add display support for QCS615 RIDE board

Don't write "..for <soc>", use the same format as all other changes to
such files: "arm64: dts: qcom: <soc>[-board]: change subject"

Regards,
Bjorn
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 108 +++++++++
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 245 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  89 ++++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 181 ++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
>  16 files changed, 917 insertions(+), 1 deletion(-)
> ---
> base-commit: 1031240d9d007339c6661dddfbe2efda0b3859e9
> change-id: 20241209-add-display-support-for-qcs615-platform-22b8e8848f87
> 
> Best regards,
> -- 
> fangez <quic_fangez@quicinc.com>
> 
