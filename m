Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C42858E2C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 09:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C910E69A;
	Sat, 17 Feb 2024 08:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jLDIylYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B21910E68E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 08:56:59 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-608170eb5efso1100117b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708160218; x=1708765018; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RUEfzjoew9j+QLs5DN2Fo+ki26fkaj9Og/wwuf6tOns=;
 b=jLDIylYrmS7O36xR/hJAsisENWoz3MOoB8aeozeol7tXpkQm9IW8Z18plZNSXxc5gi
 v2WmtrbC4Ys+TGrf34w+xjZ6Y3BDshXf37VTMAHI8AJz9ae3V44WtRAYk1mvRfHqJqlg
 +/x8VWORaQj25SaKZ+4oxQhsgh+kk7IeGSurP+bCh3jDgUmfcSOzh71pNAgqJJtJdxN1
 wmH8+rrSm5LPQVfNNFAJTSM74d2BR0bhm7O5d5M/72NWtqyuc/5aBhegtwTK2P8yPX/9
 I5gbiH9/C62Mvb2mP2Pwv7XhVYrDjALRwL7PZj3VzYl9cm3vfecK4wDx2IOzVcqGDhB8
 uc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708160218; x=1708765018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUEfzjoew9j+QLs5DN2Fo+ki26fkaj9Og/wwuf6tOns=;
 b=GULsGnWE1P8uFkoGlZ9pVwhwgjaVpZvypt/N3RA6l/7BRP+GtQfpCA+T/FqIAz1Hd2
 pSqVTfmMxQkaMGC52UH6FKKgQB1zJ8hGooCQB2Gk37U0googRn5fUfzLiLZWUK2cwNWF
 8YMnfSA3bajza1ifNfHh8G6hv5jkZbwTE9fFn2EMClFZl1GD1vAnWJXkIQqQHj3dXTLz
 /3HJGOO/M/Xe0QgZ62/llsWwAJkMjut3MW8zduvaPWSMW6lgtrIwxn5KLPHxjKCnKWBj
 IaQNcSxW6/O6y1F1U4PyjHwEp52JpZD8n39PGKNLhPwtYGYUyNUxhXS9nKd89ctyO0R2
 wbRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9V2+Cd+p0yVD4X64lESwJC924GERFaY2Ng4ugsNo3xr2EakVYyp1x+WGxgunQ8OVYcFfmNRphaUQl1Eflr/Y+S2av6LaaVwOTtCr1KqUz
X-Gm-Message-State: AOJu0YxWjRzglvXWF+AWsiVbE7f8pj9CFQQHMCXUc21Hik8aRG6UW1qO
 enEzNI+iMszPyMfD2N7H6IbC0P4Z8CcqP5kU76y6pUqnQgo/mFJgoRki+hN3jyE4VDVZcDuaakW
 lMeOPe0mumHY5C2kRJ/23+69SzsdV4cBmv7FOdQ==
X-Google-Smtp-Source: AGHT+IFerLn7GLlc3VOTSIvWnsCD6LuQEAoqpzxWLTMZrPS7z58TSphiolDLjdJf80miHTuyaRcphS8gR1GQK/QsW/8=
X-Received: by 2002:a81:6c8b:0:b0:608:a11:2d25 with SMTP id
 h133-20020a816c8b000000b006080a112d25mr2150392ywc.41.1708160217854; Sat, 17
 Feb 2024 00:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com>
In-Reply-To: <20240216230228.26713-14-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 10:56:46 +0200
Message-ID: <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
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

On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add support to pack and send the VSC SDP packet for DP. This therefore
> allows the transmision of format information to the sinks which is
> needed for YUV420 support over DP.
>
> Changes in v4:
>         - Remove struct msm_dp_sdp_with_parity
>         - Use dp_utils_pack_sdp_header() to pack the SDP header and
>           parity bytes into a buffer
>         - Use this buffer when writing the VSC SDP data in
>           dp_catalog_panel_send_vsc_sdp()
>         - Write to all of the MMSS_DP_GENERIC0 registers instead of just
>           the ones with non-zero values
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
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 107 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   |  56 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |   4 ++
>  7 files changed, 236 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5d84c089e520a..c6e57812a239e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -901,6 +901,113 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>         return 0;
>  }
>
> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
> +                                         u32 *header)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 val;
> +       int i;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }

We are two or three levels deep in the dp_catalog. Do we really need
to check that dp_catalog is not NULL?

Side note: I think we should drop most of such checks. They add
nothing, just clobber the code.


> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
> +
> +       for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
> +               val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
> +                      (vsc_sdp->db[i + 3] << 24));
> +               dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
> +       }
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
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
> +                                    u32 *header)
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
> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, vsc_sdp, header);
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
> index 6cb5e2a243de2..4bdc087410a68 100644
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
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
> +                                    u32 *header);
> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
>  void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>  void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>                                 struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index bffb7bac2c2c8..a42b29f9902c1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1947,6 +1947,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         /* set dongle to D3 (power off) mode */
>         dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>
> @@ -2021,6 +2023,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index db1942794f1a4..417655dca2bba 100644
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
> +       struct dp_sdp vsc_sdp;
> +       ssize_t len;
> +       u32 header[2];
> +       int rc = 0;
> +
> +       if (!dp_panel) {
> +               DRM_ERROR("invalid input\n");
> +               rc = -EINVAL;
> +               return rc;

return -EINVAL directly.

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
> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack vsc sdp\n");
> +               return len;
> +       }

So, at this point we have the header data both in vsc_sdp.sdp_header
and in the packed header. The relationship between them becomes less
obvious. Could you please pack dp_sdp_header into u32[2] just before
writing it? It really makes little sense to pass both at the same
time.

> +
> +       dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp, header);
> +
> +       return rc;

return 0;

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
> index 78785ed4b40c4..aa9f6c3e4ddeb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>  #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>
>  #define DP_MISC0_COLORIMERY_CFG_LEGACY_RGB     (0)
>  #define DP_MISC0_COLORIMERY_CFG_CEA_RGB                (0x04)
> @@ -204,9 +205,11 @@
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
> index 3a44fe738c004..5577e2366a520 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> @@ -4,9 +4,12 @@
>   */
>
>  #include <linux/types.h>
> +#include <drm/drm_print.h>
>
>  #include "dp_utils.h"
>
> +#define DP_SDP_HEADER_SIZE             8
> +
>  u8 dp_utils_get_g0_value(u8 data)
>  {
>         u8 c[4];
> @@ -71,3 +74,56 @@ u8 dp_utils_calculate_parity(u32 data)
>
>         return parity_byte;
>  }
> +
> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
> +{
> +       size_t length;
> +       u8 header, parity;
> +
> +       length = sizeof(header_buff);
> +       if (length < DP_SDP_HEADER_SIZE)
> +               return -ENOSPC;
> +
> +       memset(header_buff, 0, sizeof(header_buff));
> +
> +       /* HEADER BYTE 0 */
> +       header = sdp_header->HB0;
> +       parity = dp_utils_calculate_parity(header);
> +       header_buff[0]   = ((header << HEADER_BYTE_0_BIT) | (parity << PARITY_BYTE_0_BIT));

Drop extra parentheses, please. Also it might be easier to just call:

header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
     FIELD_PREP(PARITY_0_MASK, dp_utils_calculate_parity(sdp_header->HB0) |
     FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
     FIELD_PREP(PARITY_1_MASK, dp_utils_calculate_parity(sdp_header->HB1);

This is more error proof and (I think) easier to comprehend.

> +
> +       /* HEADER BYTE 1 */
> +       header = sdp_header->HB1;
> +       parity = dp_utils_calculate_parity(header);
> +       header_buff[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
> +
> +       /* HEADER BYTE 2 */
> +       header = sdp_header->HB2;
> +       parity = dp_utils_calculate_parity(header);
> +       header_buff[1]   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
> +
> +       /* HEADER BYTE 3 */
> +       header = sdp_header->HB3;
> +       parity = dp_utils_calculate_parity(header);
> +       header_buff[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
> +
> +       return length;
> +}
> +
> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header)
> +{
> +       ssize_t len;
> +
> +       len = drm_dp_vsc_sdp_pack(vsc, vsc_sdp, sizeof(*vsc_sdp));
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack vsc sdp\n");
> +               return len;
> +       }
> +
> +       len = dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
> +       if (len < 0) {
> +               DRM_ERROR("unable to pack sdp header\n");
> +               return len;
> +       }
> +
> +       return len;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> index 5a505cbf3432b..9d1057bd5a24c 100644
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
> @@ -18,5 +20,7 @@
>  u8 dp_utils_get_g0_value(u8 data);
>  u8 dp_utils_get_g1_value(u8 data);
>  u8 dp_utils_calculate_parity(u32 data);
> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header);
>
>  #endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
