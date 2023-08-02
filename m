Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A276D6D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773E210E0E0;
	Wed,  2 Aug 2023 18:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463DF10E55E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:25:17 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d066d72eb12so222061276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691000716; x=1691605516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5rqnhpukvnuroNpgIhuZ9KfllzGzBjkAWHO7GNn33Zk=;
 b=tdRmHORtrVoProVKvDSNsGAlMh6mwrIM4BGH/OGo+JVYBufe7LKoaKZCOFd71mVztY
 6xkHD5yCeVF6KBSYOy+BWCcf72ACYn40XNHI/oZocmLWnrgaKX9IDmQNicEhOdZO4vTJ
 QXM6flWto7fGK8mbbKG1CuYY9hDOcIBiGyVkqMopus0PR+4p7NzhIKat8qPeepBJIkfA
 oBSOD1LnxQ4uoN/TkOL+IgLy/I8OyZClvbmizvM+c1wrUm2/IIz2THu9ca4L94pByOcO
 NtXJcb2FxwGlBF4c4Z+QSlS/saM30gG2XtmZhBdp0kCH8l+SviR2gVLCkSg6s+RuMIxX
 fSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691000716; x=1691605516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rqnhpukvnuroNpgIhuZ9KfllzGzBjkAWHO7GNn33Zk=;
 b=N40HgKd5k4Py6Nwpmi3rEf3lXqC29gNnV+JePrldForKTQmoNkQrLkVOZTJUk95jr3
 JIc/k1rTpD5PGvmV1swHMBx5ss37CVvT6YPjPbbsgOJ1/8rOW3lf4GfeiKaIBi2dIzVu
 Y07BtQI3j8K2YycTpn2ADEYJ9JfwMEkT6vYjrEf7mgV3B6MzfCj/EKohmo4DLS00G6lD
 DYYsWbXkjOtPBVbmZ44FGaVp2Fk7ltjxiU2B2CNxf8GarNqRDbnsJ/UehvPh5AjMzIvB
 KMMGtHFkI7OURvTpgHF9Ge9maNGTOhDLDyE+odKat1oVDFNRRXL3CAAszLTjNTb8/4NV
 Er7g==
X-Gm-Message-State: ABy/qLYpsHLrhnD8kIJ5CR5264waDL9zyfo7eOKi8uhO7rid7BAXV9kI
 nnV/+nHKI/g9GC67C0edoubMEH35YZ6mQCIYAbCSHw==
X-Google-Smtp-Source: APBJJlGURMqux6vjsKCyEZh5uiiRc2JPbZFyh118s++aogxKu7iUDz2oUe6gsb+DYPZiJrvV3yPjpFvKrpB5WxbFELI=
X-Received: by 2002:a25:d3d0:0:b0:d0e:3831:fa26 with SMTP id
 e199-20020a25d3d0000000b00d0e3831fa26mr21044770ybf.9.1691000716085; Wed, 02
 Aug 2023 11:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-4-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-4-2661706be001@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 21:25:05 +0300
Message-ID: <CAA8EJpoodqcWXsvjjpfMhMxmmvjNfYu5KUM6iOxqxYRH6wxsRA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dsi: Enable widebus for DSI
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 21:09, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
> 48 bits of compressed data instead of 24.
>
> Enable this mode whenever DSC is enabled for supported chipsets.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c      |  5 +++++
>  drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 30 ++++++++++++++++++++++++++----
>  3 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index baab79ab6e74..4fa738dea680 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -17,6 +17,11 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>         return msm_dsi_host_get_dsc_config(msm_dsi->host);
>  }
>
> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
> +{
> +       return msm_dsi_host_is_widebus_enabled(msm_dsi->host);
> +}

If this function is not provided at the time of the previous patch,
compilation will break. I'd suggest to provide a stub first and then
change it in this patch.

> +
>  static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  {
>         struct platform_device *pdev = msm_dsi->pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bd3763a5d723..a557d2c1aaff 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>  void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>  struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
> +bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host);
>
>  /* dsi phy */
>  struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 645927214871..231b02e5ab6e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>         dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>
> +bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host)
> +{
> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +       return msm_host->dsc && (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&

Please add a line break after the first &&. Compare two following statements:

> +                       msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
> +}
> +
>  static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>                         struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
>  {
> @@ -753,10 +761,16 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>                 data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
>                 dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
>
> -               if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> -                   msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
> +               if (cfg_hnd->major == MSM_DSI_VER_MAJOR_6G) {
>                         data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
> -                       data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +
> +                       if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
> +                               data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +
> +                       /* TODO: Allow for video-mode support once tested/fixed */
> +                       if (msm_dsi_host_is_widebus_enabled(&msm_host->base))
> +                               data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
> +
>                         dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
>                 }
>         }
> @@ -894,6 +908,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>         u32 hdisplay = mode->hdisplay;
>         u32 wc;
>         int ret;
> +       bool widebus_enabled = msm_dsi_host_is_widebus_enabled(&msm_host->base);
>
>         DBG("");
>
> @@ -914,6 +929,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>
>         if (msm_host->dsc) {
>                 struct drm_dsc_config *dsc = msm_host->dsc;
> +               u32 bytes_per_pclk;
>
>                 /* update dsc params with timing params */
>                 if (!dsc || !mode->hdisplay || !mode->vdisplay) {
> @@ -937,7 +953,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                  * pulse width same
>                  */
>                 h_total -= hdisplay;
> -               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> +               if (widebus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
> +                       bytes_per_pclk = 6;
> +               else
> +                       bytes_per_pclk = 3;
> +
> +               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> +
>                 h_total += hdisplay;
>                 ha_end = ha_start + hdisplay;
>         }
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
