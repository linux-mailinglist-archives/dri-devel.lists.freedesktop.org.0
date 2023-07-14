Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953C7544F8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 00:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01A10E62F;
	Fri, 14 Jul 2023 22:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3D110E62F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 22:30:36 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c5e76dfcc36so2290009276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689373835; x=1689978635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YW5FZ1K6diwrH4+nhB/fXam/1SoVM/vT+mwAPHKfWHA=;
 b=rBbT6LWCBcILoh5Jm0TEi+CRZwEV9gpSIN8HctlOVfxcLiBkQMX3UCtFgBpLXMo6P1
 yIV2N9Ldwrf6dni7DNdQmGw/QDhCYHcasZcL7ed+QtLHjPz4068kidSh2UIOLM+4SkDN
 68dqJh4B7CKZ+DcmLJpUkSyswV6pnnXnso9LI+yRxZmi6bj+fO1bRFGD3NnmFA8n9uYe
 h3JoEtm4s+HkNvJo6Nh/JTVfDQBbLToNy63qj0vBhr01ykDvXb4uOziN3pOoKZPOGxrn
 9Md4BJb17/qiviTs45CTPiWRss3TkJVw8G3OutWN7LEMnWJPtpTQaKNoh2lqwh5oCYT5
 3NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689373835; x=1689978635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YW5FZ1K6diwrH4+nhB/fXam/1SoVM/vT+mwAPHKfWHA=;
 b=XACwRYDpaBUo6igmEcIGMQ9htFCuF8UlNRSbQJaI4WqOrBoTIiKhl52DGIGLQvA6mf
 /BugzsofkNILoXoaua/SFBXCBJ0mv/ol9v7DymW6wCJaX9ivhI9Q1CahHre3lrYNGV6g
 dSvg8RbRfcvg86hHT2OEQMZtNXenW+6dtbRJJsIpFnzZ5W/8nx6YYiZTECYn2kWRhYtX
 wfpQNv+vqbMrVzPNgb3vbAckh4LYyBMaNPvqYE8CdgJ/VllZiyYvj3I5yS9TV7gww2FX
 /3WHOD8T4qXnd62GryTzrjLfrk1ZMHgiENW5b9izaD9aY0Ja2lhA5ozg3hmmSG1XMxQd
 J0zw==
X-Gm-Message-State: ABy/qLatgBSLIEd7G6HUEdwDz5rj9PkpCaR3WqKwxCUAgeZMcOygB9WX
 rn71FmpvKClmbd8bEKCjcHRs/Plx8n+WDXUSSl6rvQ==
X-Google-Smtp-Source: APBJJlHTMsllj2Rlmbc6r+TTnedyb7w6obUup5DXWhx7RuOpqt9hVfQCfdmq0dSgeOHn3qgdFe5RsrKnREF9KfMvZHk=
X-Received: by 2002:a25:8689:0:b0:c0b:7483:5cf0 with SMTP id
 z9-20020a258689000000b00c0b74835cf0mr5289905ybk.65.1689373835500; Fri, 14 Jul
 2023 15:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
 <91bc6348-2030-85dd-1492-1609b392793f@linaro.org>
 <05996344-0e43-7f37-c99a-42c04f91dc83@quicinc.com>
In-Reply-To: <05996344-0e43-7f37-c99a-42c04f91dc83@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Jul 2023 01:30:24 +0300
Message-ID: <CAA8EJppFDcrVdegskSD0TJPOdSzVw_50+Bq+u8LKn26jdKE=tw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
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

On Fri, 14 Jul 2023 at 22:03, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 7/13/2023 6:23 PM, Dmitry Baryshkov wrote:
> > On 14/07/2023 03:21, Jessica Zhang wrote:
> >> DSI 6G v2.5.x+ and DPU 7.x+ support a data-bus widen mode that allows DSI
> >> to send 48 bits of compressed data per pclk instead of 24.
> >>
> >> For all chipsets that support this mode, enable it whenever DSC is
> >> enabled as recommended by the hardware programming guide.
> >>
> >> Only enable this for command mode as we are currently unable to validate
> >> it for video mode.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >> Note: The dsi.xml.h changes were generated using the headergen2 script in
> >> envytools [2], but the changes to the copyright and rules-ng-ng source
> >> file
> >> paths were dropped.
> >
> > Separate commit please, so that it can be replaced by headers sync with
> > Mesa3d.
>
> Hi Dmitry,
>
> Acked.
>
> >
> >>
> >> [1] https://patchwork.freedesktop.org/series/120580/
> >> [2] https://github.com/freedreno/envytools/
> >>
> >> --
> >> Changes in v2:
> >> - Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
> >> - Squashed all commits to avoid breaking feature if the series is only
> >> partially applied
> >
> > No. Please unsquash it. Please design the series so that the patches
> > work even if it is only partially applied.
>
> Acked.
>
> >
> >> - Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
> >> - Have DPU check if wide bus is requested by output driver (Dmitry)
> >> - Introduced bytes_per_pclk variable for dsi_timing_setup() hdisplay
> >> adjustment (Marijn)
> >> - Link to v1:
> >> https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++++++----
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 +++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
> >>   drivers/gpu/drm/msm/dsi/dsi.c                      |  5 +++++
> >>   drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
> >>   drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 23
> >> +++++++++++++++++++++-
> >>   drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++++
> >>   9 files changed, 48 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index f0a2a1dca741..6aed63c06c1d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2411,6 +2411,7 @@ struct drm_encoder *dpu_encoder_init(struct
> >> drm_device *dev,
> >>       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>       struct drm_encoder *drm_enc = NULL;
> >>       struct dpu_encoder_virt *dpu_enc = NULL;
> >> +    int index = disp_info->h_tile_instance[0];
> >>       int ret = 0;
> >>       dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
> >> @@ -2439,13 +2440,14 @@ struct drm_encoder *dpu_encoder_init(struct
> >> drm_device *dev,
> >>       timer_setup(&dpu_enc->frame_done_timer,
> >>               dpu_encoder_frame_done_timeout, 0);
> >> -    if (disp_info->intf_type == INTF_DSI)
> >> +    if (disp_info->intf_type == INTF_DSI) {
> >>           timer_setup(&dpu_enc->vsync_event_timer,
> >>                   dpu_encoder_vsync_event_handler,
> >
> > While you are touching this part, could you please drop
> > dpu_encoder_vsync_event_handler() and
> > dpu_encoder_vsync_event_work_handler(), they are useless?
>
> Since these calls aren't related to widebus, I don't think I'll include
> it in this series. However, I can post this cleanup as a separate patch
> and add that as a dependency if that's ok.

Sure, that will work for me. Thank you!

>
> >
> >>                   0);
> >> -    else if (disp_info->intf_type == INTF_DP)
> >> -        dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> >> -                priv->dp[disp_info->h_tile_instance[0]]);
> >> +        dpu_enc->wide_bus_en =
> >> msm_dsi_is_widebus_enabled(priv->dsi[index]);
> >> +    } else if (disp_info->intf_type == INTF_DP) {
> >> +        dpu_enc->wide_bus_en =
> >> msm_dp_wide_bus_available(priv->dp[index]);
> >> +    }
> >>       INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
> >>               dpu_encoder_off_work);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index df88358e7037..dace6168be2d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> @@ -69,8 +69,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >>                   phys_enc->hw_intf,
> >>                   phys_enc->hw_pp->idx);
> >> -    if (intf_cfg.dsc != 0)
> >> +    if (intf_cfg.dsc != 0) {
> >>           cmd_mode_cfg.data_compress = true;
> >> +        cmd_mode_cfg.wide_bus_en =
> >> dpu_encoder_is_widebus_enabled(phys_enc->parent);
> >> +    }
> >>       if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
> >>
> >> phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf,
> >> &cmd_mode_cfg);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 8ec6505d9e78..dc6f3febb574 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -521,6 +521,9 @@ static void
> >> dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> >>       if (cmd_mode_cfg->data_compress)
> >>           intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> >> +    if (cmd_mode_cfg->wide_bus_en)
> >> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
> >> +
> >>       DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> >>   }
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> index 77f80531782b..c539025c418b 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
> >>   struct dpu_hw_intf_cmd_mode_cfg {
> >>       u8 data_compress;    /* enable data compress between dpu and dsi */
> >> +    u8 wide_bus_en;        /* enable databus widen mode */
> >>   };
> >>   /**
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c
> >> b/drivers/gpu/drm/msm/dsi/dsi.c
> >> index baab79ab6e74..e3cc06c94397 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> >> @@ -17,6 +17,11 @@ struct drm_dsc_config
> >> *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
> >>       return msm_dsi_host_get_dsc_config(msm_dsi->host);
> >>   }
> >> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
> >> +{
> >> +    return msm_dsi_host_is_widebus_supported(msm_dsi->host);
> >
> > This is incorrect. It will enable widebus even for non-DSC cases.
>
> FWIW, all calls for msm_dsi_is_widebus_enabled() and
> msm_dsi_host_is_widebus_supported() are guarded by a DSC check.
>
> That being said, I also see your point that msm_dsi_is_widebus_enabled()
> is an incorrect name since this will only check if widebus is supported.
>
> Maybe a better change would be to change msm_dsi_is_widebus_enabled to
> *_is_widebus_supported(), move the setting of dpu_enc->wide_bus_en for
> both DP and DSI to dpu_encoder_virt_atomic_enable(), then for DSI set
> wide_bus_en = dpu_enc->dsc && dsi_is_widebus_supported().

I think we should change msm_dp_wide_bus_available() to
msm_dp_wide_bus_enabled(). We don't have a way to tell DP (or DSI) if
widebus really should be enabled or not. So it would be better to make
DP and DSI drivers provide is_widebus_enabled function.

>
> >
> >> +}
> >> +
> >>   static int dsi_get_phy(struct msm_dsi *msm_dsi)
> >>   {
> >>       struct platform_device *pdev = msm_dsi->pdev;
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h
> >> b/drivers/gpu/drm/msm/dsi/dsi.h
> >> index bd3763a5d723..219a9f756759 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> >> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host
> >> *msm_host, bool is_bonded_dsi);
> >>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct
> >> mipi_dsi_host *host);
> >>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> >>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct
> >> mipi_dsi_host *host);
> >> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host);
> >>   /* dsi phy */
> >>   struct msm_dsi_phy;
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> >> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> >> index a4a154601114..2a7d980e12c3 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> >> @@ -664,6 +664,7 @@ static inline uint32_t
> >> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
> >>       return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) &
> >> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
> >>   }
> >>   #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE            0x00010000
> >> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN            0x00100000
> >>   #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL            0x000001b8
> >>   #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK        0x0000003f
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 645927214871..6ea3476acf0d 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host
> >> *msm_host)
> >>       dsi_write(msm_host, REG_DSI_CTRL, 0);
> >>   }
> >> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host)
> >> +{
> >> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> >> +
> >> +    return msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> >> +            msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
> >
> > Would it be better to push it to the config data, like we did for DP?
>
> I don't think so -- I think adding it to the config data as a feature
> flag would bloat dsi_cfg.c. It would be simpler and cleaner (IMO) to
> keep this as a version check.

Ok.

>
> >
> >> +}
> >> +
> >>   static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
> >>               struct msm_dsi_phy_shared_timings *phy_shared_timings,
> >> struct msm_dsi_phy *phy)
> >>   {
> >> @@ -757,6 +765,11 @@ static void dsi_ctrl_enable(struct msm_dsi_host
> >> *msm_host,
> >>               msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
> >>               data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
> >>               data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> >> +
> >> +            /* TODO: Allow for video-mode support once tested/fixed */
> >> +            if (msm_host->cfg_hnd->minor >=
> >> MSM_DSI_6G_VER_MINOR_V2_5_0 && msm_host->dsc)
> >
> > msm_dsi_is_widebus_enabled() && msm_host->dsc
>
> *_is_widebus_enabled() also checks for major version >= 6G, so calling
> it here would be a bit redundant as we're already checking for that earlier.

However now you have different checks in two different places.

My suggestion is to have the function msm_dsi_is_widebus_supported(),
which the rest of the code uses to check if wide bus is actually
enabled in the HW. If at some point DSI 2.11 drops wide bus support,
I'd like to see a change at a single place, rather than having changes
all over the code.

Likewise I'd like to have the function msm_dsi_is_widebus_enabled(),
which is used by the rest of the code to check if the widebus should
be actually enabled.

Actually I think we can even drop the is_supported at all() and use
the following code:

bool msm_dsi_is_widebus_enabled()
{
   if (major < 6G || minor < V2_5_0)
     return false;

   return !!msm_host->dsc;
}

Then the rest of the code should call this function only.

>
> FWIW, I've nested the widebus configuration within the burst mode
> configuration to keep it so that we only have to read/write the
> MDP_CTRL2 once.
>
> >
> >> +                data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
> >> +
> >>               dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
> >>           }
> >>       }
> >> @@ -894,6 +907,7 @@ static void dsi_timing_setup(struct msm_dsi_host
> >> *msm_host, bool is_bonded_dsi)
> >>       u32 hdisplay = mode->hdisplay;
> >>       u32 wc;
> >>       int ret;
> >> +    bool widebus_supported =
> >> msm_dsi_host_is_widebus_supported(&msm_host->base);
> >
> > s/supported/enabled for this function.
>
> I would like to keep the name as *_is_widebus_supported() since it
> better reflects the functionality of the helper.
>
> FWIW, the widebus hdisplay adjustments are already guarded by a DSC check.

See my previous comment.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>       DBG("");
> >> @@ -914,6 +928,7 @@ static void dsi_timing_setup(struct msm_dsi_host
> >> *msm_host, bool is_bonded_dsi)
> >>       if (msm_host->dsc) {
> >>           struct drm_dsc_config *dsc = msm_host->dsc;
> >> +        u32 bytes_per_pclk;
> >>           /* update dsc params with timing params */
> >>           if (!dsc || !mode->hdisplay || !mode->vdisplay) {
> >> @@ -937,7 +952,13 @@ static void dsi_timing_setup(struct msm_dsi_host
> >> *msm_host, bool is_bonded_dsi)
> >>            * pulse width same
> >>            */
> >>           h_total -= hdisplay;
> >> -        hdisplay =
> >> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> >> +        if (widebus_supported && !(msm_host->mode_flags &
> >> MIPI_DSI_MODE_VIDEO))
> >> +            bytes_per_pclk = 6;
> >> +        else
> >> +            bytes_per_pclk = 3;
> >> +
> >> +        hdisplay =
> >> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> >> +
> >>           h_total += hdisplay;
> >>           ha_end = ha_start + hdisplay;
> >>       }
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> >> b/drivers/gpu/drm/msm/msm_drv.h
> >> index 9d9d5e009163..7ff56d09014c 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state
> >> *disp_state, struct msm_dsi *msm_dsi
> >>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
> >>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
> >>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
> >> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi);
> >>   struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
> >>   #else
> >>   static inline void __init msm_dsi_register(void)
> >> @@ -374,6 +375,11 @@ static inline bool msm_dsi_is_master_dsi(struct
> >> msm_dsi *msm_dsi)
> >>       return false;
> >>   }
> >> +static inline bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
> >> +{
> >> +    return false;
> >> +}
> >> +
> >>   static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct
> >> msm_dsi *msm_dsi)
> >>   {
> >>       return NULL;
> >>
> >> ---
> >> base-commit: 9445fc2942a890e84c74e170ebd7dfb9566e3357
> >> change-id: 20230525-add-widebus-support-f785546ee751
> >>
> >> Best regards,
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
