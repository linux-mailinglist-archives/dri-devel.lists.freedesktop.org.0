Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C4855350
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E7310E206;
	Wed, 14 Feb 2024 19:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EHttagAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48AC10E038
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 19:40:02 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so30667276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707939602; x=1708544402; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+aEtl9txZOUBvPgkFQWxmnzvYey5mAJIlvUSK/7hjwg=;
 b=EHttagAQAV5uzp+10lvCWNhZTZk75XbWaRi7YP1B/J9EcTG2Q7pjZxo24jr5BdnN1p
 +ir821CkDyjwn3zgveU+GMkNWj1W7lXmMC1AgJHvnLZhT788vv6MatNdGo5fcFC/mVpr
 5l/FsgKee/HmoDwfRtI1lNHzss8CViePCoL2sypi5+Ob0EQRiEamGBHbjnzo4nIEqzav
 Yxmq/A5/6JEyxlB1s2z++ib9orWykjkxY5oLBJbJ/YAcvNW3RYEfR6wf7VonA2lAWKe/
 EBzu7aOP5bgrPeaBKB6V3JwnxH4ZZENyL6zf+fq5yAC74tQkB3FQmCYUxyMJ6vST842v
 0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707939602; x=1708544402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aEtl9txZOUBvPgkFQWxmnzvYey5mAJIlvUSK/7hjwg=;
 b=Dy0W5wBgy5NmqXzPIuxZLKNG9/tW1EJD7PqsSI4/Q+XF3tf/iumnY24hXbytm6jKmJ
 B3kMA/0r7b55vaCqmNfPJGUWEVHY4n9jcQt/8qskKY+u9TNJVBTUq7srdeipm1n/T8Ho
 ksTIQQnZ4sm6KS4CLsaMNFxD59t2ll7bEE/+7X00RiEgJkxkk51PY3qaY0OTMs3cxQsi
 /iCcWvu6wpAV1n2Eb6UWBze9wLEOmRAwLPl+Kz3n+5vVV8oH+MUI3fUnTVoYcPpCCIIo
 mYhjjOs8a+E2ZhirKEzJRcGGnH/7Ygd4QWlWS2VUEdPsxqXUukiU4Iz8x5resLrUzlQQ
 tflw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQJPLtCtdVUh1y7xEoQ8lDQjJ80+2G1QvxDrCnH0j/tfT6MUzopnD0DLbB0pkAUnmUOsgHzgDxB3tyOoH6QlVwWMLGQ7vTeq94Tw4uBm7
X-Gm-Message-State: AOJu0Yxc5j2riYMASzpTuSTIFPZlChE1JfdCeQ+Ow8H/C4lMBRv9OFC6
 7tW449jjRivuqRyPCZzUwCpill5nY/l1Lgw2YesNlKGX+u7ikFtYm6VlNZK/35VStDI0dbGZs2t
 /4WIujjdK3muPx7QCtgrgPN2RTCV5B+xlKQulsw==
X-Google-Smtp-Source: AGHT+IGsj3M09hmPATBPBdaSv5UwA+b0u+L+jNqrwqMBpzc27669etx5zjd33g3m3pc/S9WVsGLZPLlVAb1ySznCtuU=
X-Received: by 2002:a25:8402:0:b0:dc7:4c21:fbd5 with SMTP id
 u2-20020a258402000000b00dc74c21fbd5mr3300451ybk.0.1707939601776; Wed, 14 Feb
 2024 11:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-14-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-14-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:39:50 +0200
Message-ID: <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add support to pack and send the VSC SDP packet for DP. This therefore
> allows the transmision of format information to the sinks which is
> needed for YUV420 support over DP.
>
> Changes in v3:
>         - Create a new struct, msm_dp_sdp_with_parity, which holds the
>           packing information for VSC SDP
>         - Use drm_dp_vsc_sdp_pack() to pack the data into the new
>           msm_dp_sdp_with_parity struct instead of specifically packing
>           for YUV420 format
>         - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
>           data using the new msm_dp_sdp_with_parity struct
>
> Changes in v2:
>         - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
>         - Remove dp_sdp from the dp_catalog struct since this data is
>           being allocated at the point used
>         - Create a new function in dp_utils to pack the VSC SDP data
>           into a buffer
>         - Create a new function that packs the SDP header bytes into a
>           buffer. This function is made generic so that it can be
>           utilized by dp_audio
>           header bytes into a buffer
>         - Create a new function in dp_utils that takes the packed buffer
>           and writes to the DP_GENERIC0_* registers
>         - Split the dp_catalog_panel_config_vsc_sdp() function into two
>           to disable/enable sending VSC SDP packets
>         - Check the DP HW version using the original useage of
>           dp_catalog_hw_revision() and correct the version checking
>           logic
>         - Rename dp_panel_setup_vsc_sdp() to
>           dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
>           currently VSC SDP is only being set up to support YUV420 modes
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 113 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   |  48 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  18 +++++
>  7 files changed, 248 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5d84c089e520a..61d5317efe683 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -901,6 +901,119 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>         return 0;
>  }
>
> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> +                                         struct msm_dp_sdp_with_parity *msm_dp_sdp)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 val;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB0) << HEADER_BYTE_0_BIT |
> +              (msm_dp_sdp->pb.PB0 << PARITY_BYTE_0_BIT) |
> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB1) << HEADER_BYTE_1_BIT |
> +              (msm_dp_sdp->pb.PB1 << PARITY_BYTE_1_BIT));
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, val);
> +
> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB2) << HEADER_BYTE_2_BIT |
> +              (msm_dp_sdp->pb.PB2 << PARITY_BYTE_2_BIT) |
> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB3) << HEADER_BYTE_3_BIT |
> +              (msm_dp_sdp->pb.PB3 << PARITY_BYTE_3_BIT));
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, val);

I still think that this is not the way to do it. Could you please
extract the function that takes struct dp_sdp_header, calculates
padding and writes resulting data to the hardware? This way we can
reuse it later for all the dp_audio stuff.

> +
> +       val = ((msm_dp_sdp->vsc_sdp.db[16]) | (msm_dp_sdp->vsc_sdp.db[17] << 8) |
> +              (msm_dp_sdp->vsc_sdp.db[18] << 16));
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_6, val);

Shouldn't we write full dp_sdp data, including all zeroes? Here you
assume that there is no other data in dp_sdp and also that nobody
wrote anything senseless to those registers.

> +}
> +
> +static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 hw_revision;
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> +       }
> +}
> +
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 cfg, cfg2, misc;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +
> +       cfg |= GEN0_SDP_EN;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +       cfg2 |= GENERIC0_SDPSIZE_VALID;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, msm_dp_sdp);
> +
> +       /* indicates presence of VSC (BIT(6) of MISC1) */
> +       misc |= DP_MISC1_VSC_SDP;
> +
> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
> +
> +       pr_debug("misc settings = 0x%x\n", misc);
> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +       dp_catalog_panel_update_sdp(dp_catalog);
> +}
> +
> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 cfg, cfg2, misc;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +
> +       cfg &= ~GEN0_SDP_EN;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +       cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +       /* switch back to MSA */
> +       misc &= ~DP_MISC1_VSC_SDP;
> +
> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
> +
> +       pr_debug("misc settings = 0x%x\n", misc);
> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +       dp_catalog_panel_update_sdp(dp_catalog);
> +}
> +
>  void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>                                 struct drm_display_mode *drm_mode)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6cb5e2a243de2..4bf08c27a9bf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_modes.h>
>
>  #include "dp_parser.h"
> +#include "dp_utils.h"
>  #include "disp/msm_disp_snapshot.h"
>
>  /* interrupts */
> @@ -30,6 +31,9 @@
>
>  #define DP_AUX_CFG_MAX_VALUE_CNT 3
>
> +#define DP_HW_VERSION_1_0      0x10000000
> +#define DP_HW_VERSION_1_2      0x10020000
> +
>  /* PHY AUX config registers */
>  enum dp_phy_aux_config_type {
>         PHY_AUX_CFG0,
> @@ -124,6 +128,9 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>
>  /* DP Panel APIs */
>  int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp);
> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
>  void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>  void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>                                 struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 209cf2a35642f..beef86b1aaf81 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         /* set dongle to D3 (power off) mode */
>         dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>
> @@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index db1942794f1a4..18420a7ba4ab3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include "dp_panel.h"
> +#include "dp_utils.h"
>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
> @@ -281,6 +282,56 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>         dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>  }
>
> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> +{
> +       struct dp_catalog *catalog;
> +       struct dp_panel_private *panel;
> +       struct dp_display_mode *dp_mode;
> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> +       struct msm_dp_sdp_with_parity msm_dp_sdp;
> +       ssize_t len;
> +       int rc = 0;
> +
> +       if (!dp_panel) {
> +               DRM_ERROR("invalid input\n");
> +               rc = -EINVAL;
> +               return rc;
> +       }
> +
> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +       catalog = panel->catalog;
> +       dp_mode = &dp_panel->dp_mode;
> +
> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> +
> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
> +       vsc_sdp_data.revision = 0x05;
> +       vsc_sdp_data.length = 0x13;
> +
> +       /* VSC SDP Payload for DB16 */
> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> +
> +       /* VSC SDP Payload for DB17 */
> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> +
> +       /* VSC SDP Payload for DB18 */
> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> +
> +       // rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header, gen_buffer, buff_size);
> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &msm_dp_sdp);
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack vsc sdp\n");
> +               return len;
> +       }
> +
> +       dp_catalog_panel_enable_vsc_sdp(catalog, &msm_dp_sdp);
> +
> +       return rc;
> +}
> +
>  void dp_panel_dump_regs(struct dp_panel *dp_panel)
>  {
>         struct dp_catalog *catalog;
> @@ -344,6 +395,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>         catalog->dp_active = data;
>
>         dp_catalog_panel_timing_cfg(catalog);
> +
> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> +
>         panel->panel_on = true;
>
>         return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index ea85a691e72b5..2983756c125cd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>  #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>
>  #define REG_DP_VALID_BOUNDARY                  (0x00000030)
>  #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
> @@ -201,9 +202,11 @@
>  #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
>
>  #define MMSS_DP_SDP_CFG                                (0x00000228)
> +#define GEN0_SDP_EN                            (0x00020000)
>  #define MMSS_DP_SDP_CFG2                       (0x0000022C)
>  #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
>
>  #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
>  #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
> index 3a44fe738c004..81601f3c414fc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/types.h>
> +#include <drm/drm_print.h>
>
>  #include "dp_utils.h"
>
> @@ -71,3 +72,50 @@ u8 dp_utils_calculate_parity(u32 data)
>
>         return parity_byte;
>  }
> +
> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
> +                                size_t size)
> +{
> +       u8 header;
> +
> +       size_t length = sizeof(struct msm_dp_vsc_sdp_parity);
> +
> +       if (size < length)
> +               return -ENOSPC;
> +
> +       memset(pb, 0, size);
> +
> +       header = sdp_header->HB0;
> +       pb->PB0 = dp_utils_calculate_parity(header);
> +
> +       header = sdp_header->HB1;
> +       pb->PB1 = dp_utils_calculate_parity(header);
> +
> +       header = sdp_header->HB2;
> +       pb->PB2 = dp_utils_calculate_parity(header);
> +
> +       header = sdp_header->HB3;
> +       pb->PB3 = dp_utils_calculate_parity(header);
> +
> +       return length;
> +}
> +
> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct msm_dp_sdp_with_parity *msm_dp_sdp)
> +{
> +       ssize_t len;
> +
> +       len = drm_dp_vsc_sdp_pack(vsc, &msm_dp_sdp->vsc_sdp, sizeof(msm_dp_sdp->vsc_sdp));
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack vsc sdp\n");
> +               return len;
> +       }
> +
> +       len = dp_utils_pack_sdp_header(&msm_dp_sdp->vsc_sdp.sdp_header, &msm_dp_sdp->pb,
> +                                      sizeof(msm_dp_sdp->pb));
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack sdp header\n");
> +               return len;
> +       }
> +
> +       return len;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> index 5a505cbf3432b..6946bc51cae97 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -6,6 +6,8 @@
>  #ifndef _DP_UTILS_H_
>  #define _DP_UTILS_H_
>
> +#include <drm/display/drm_dp_helper.h>
> +
>  #define HEADER_BYTE_0_BIT       0
>  #define PARITY_BYTE_0_BIT       8
>  #define HEADER_BYTE_1_BIT      16
> @@ -15,8 +17,24 @@
>  #define HEADER_BYTE_3_BIT      16
>  #define PARITY_BYTE_3_BIT      24
>
> +struct msm_dp_vsc_sdp_parity {
> +       u8 PB0;
> +       u8 PB1;
> +       u8 PB2;
> +       u8 PB3;
> +} __packed;
> +
> +struct msm_dp_sdp_with_parity {
> +       struct dp_sdp vsc_sdp;
> +       struct msm_dp_vsc_sdp_parity pb;
> +};
> +
>  u8 dp_utils_get_g0_value(u8 data);
>  u8 dp_utils_get_g1_value(u8 data);
>  u8 dp_utils_calculate_parity(u32 data);
> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
> +                                size_t size);
> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc,
> +                             struct msm_dp_sdp_with_parity *msm_dp_sdp);
>
>  #endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
