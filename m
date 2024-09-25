Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0D986826
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 23:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5117D10EA73;
	Wed, 25 Sep 2024 21:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lzEtLyVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0047F10EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 21:11:37 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6e1f48e7c18so3444507b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727298697; x=1727903497; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+9TIU+9hxJV2zxmNs4d032rUDDVyJj1j83Li4zDnFvc=;
 b=lzEtLyVwIlhDP+n05ZtU51qY4wLkjKJkNxUi4/8a7aghCeNknpT+8y0rI/XHHy4B+f
 mtxrN2M9iMMHuF5YYNK9slCzqIMZ5zHWcKeqtbvTvvAd9CpZpoCB8i+dbyjbUhURpLXl
 SByGVkL2kul5DoIMWNWRS9eqNt8MOrXL4vIxjWLf8efbJG7f9E0D1P9xHAxl5EdeEKYy
 eLGuuibYbWER/pqK5rvnUJ3Ufpaj6SompTwcEM70RGRa6KJGpmcUD1multp7VR63SjXK
 OrALtuIuCY63+dmmD5QP3XcRPSo5+6tINC2YmgR2O/ZzutAlOgDVPfI11Q4BosltMqix
 /Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727298697; x=1727903497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9TIU+9hxJV2zxmNs4d032rUDDVyJj1j83Li4zDnFvc=;
 b=sju7rqjsbN+flSbatkADZ6jPcVERQUpltq0qsd/nhg0gMEBZs5Fk37bwpbB8ilTHqj
 5VezOgs5fVdjqam6v7IpIAUyCxf19pHUNSHUq6ZUF6IH1z0DP+wi5iHs21IOAjJ2QC66
 qPYdtpNFW7p9ZSvBT0YbLNFB5fGqCBrpFFnOv+MugmHhEJZ8/9v+sLrwzd+q56nFNNKe
 oJCYaX7JnRY5XB/zVc0sqpiyRj0NSmNNY1Tc33X5uWWozBWu0/pwFDwxnECW4vYG98xY
 nmHYomf4gVmjM84wNmQUlHsVzwCJa2hAwhZj3SHD5GsJKOZvahmq/Fv0Zpx/+WjUKDT0
 SPuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3vP3iM7lS4hUkouBfZwg8/Ig684TTakSt4lPToEMKUj/tArMgTAsbDDsHW3irH5u+DpMyUsDLlv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrYmA+9HTqur81xBdtIynA64DauX+I/U6CXTiQA6ZyADtGXkwb
 G2z96YPqHYsGbe7a4LHLRJpNLYtsCiZ1r+GZtblKUc7R5OL5wDk8IUs+5O7dWyL6E/nol9twpkT
 5s1Qg9joVCXR/zWtsg/oUpQcVC2f2S/7Gag/Zcw==
X-Google-Smtp-Source: AGHT+IEp+mxvGkg3YqT/1KJufgJQB/xXWcnPMsUafm3tUlKhN15iL95oyO8K6Op3Y8xSE5IQjn21aX/7DyU72/mq1E4=
X-Received: by 2002:a05:690c:660f:b0:6de:b23:f2c3 with SMTP id
 00721157ae682-6e21d6ec709mr41328167b3.7.1727298696928; Wed, 25 Sep 2024
 14:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
 <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
 <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
In-Reply-To: <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Sep 2024 23:11:25 +0200
Message-ID: <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

On Wed, 25 Sept 2024 at 22:39, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> >> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> All resource allocation is centered around the LMs. Then other blocks
> >> (except DSCs) are allocated basing on the LMs that was selected, and LM
> >> powers up the CRTC rather than the encoder.
> >>
> >> Moreover if at some point the driver supports encoder cloning,
> >> allocating resources from the encoder will be incorrect, as all clones
> >> will have different encoder IDs, while LMs are to be shared by these
> >> encoders.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >>   3 files changed, 183 insertions(+), 123 deletions(-)
> >>
> >> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
> >>      }
> >>   }
> >>
> >> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> >> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> >> +                             struct msm_display_topology *topology,
> >> +                             struct drm_atomic_state *state,
> >> +                             const struct drm_display_mode *adj_mode)
> >>   {
> >>      struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> -    int i, intf_count = 0, num_dsc = 0;
> >> +    struct drm_connector *connector;
> >> +    struct drm_connector_state *conn_state;
> >> +    struct msm_display_info *disp_info;
> >> +    struct drm_framebuffer *fb;
> >> +    struct msm_drm_private *priv;
> >> +    int i;
> >>
> >>      for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> >>              if (dpu_enc->phys_encs[i])
> >> -                    intf_count++;
> >> +                    topology->num_intf++;
> >>
> >> -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> >> +    /* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> >>      if (dpu_enc->dsc)
> >> -            num_dsc = 2;
> >> +            topology->num_dsc += 2;
> >>
> >> -    return (num_dsc > 0) && (num_dsc > intf_count);
> >> -}
> >> +    connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> >> +    if (!connector)
> >> +            return;
> >> +    conn_state = drm_atomic_get_new_connector_state(state, connector);
> >> +    if (!conn_state)
> >> +            return;
> >>
> >> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> >> -{
> >> -    struct msm_drm_private *priv = drm_enc->dev->dev_private;
> >> -    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> -    int index = dpu_enc->disp_info.h_tile_instance[0];
> >> +    disp_info = &dpu_enc->disp_info;
> >>
> >> -    if (dpu_enc->disp_info.intf_type == INTF_DSI)
> >> -            return msm_dsi_get_dsc_config(priv->dsi[index]);
> >> +    priv = drm_enc->dev->dev_private;
> >>
> >> -    return NULL;
> >> +    /*
> >> +     * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> >> +     * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> >> +     * earlier.
> >> +     */
> >> +    if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> >> +            fb = conn_state->writeback_job->fb;
> >> +
> >> +            if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> >> +                    topology->needs_cdm = true;
> >> +    } else if (disp_info->intf_type == INTF_DP) {
> >> +            if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> >> +                    topology->needs_cdm = true;
> >> +    }
> >
> > Just to note, the needs_cdm is not enough once you introduce CWB
> > support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
> > don't have), but this doesn't get reflected in the topology.
>
> Hi Dmitry,
>
> Ack. I can add something to make atomic_check fail if the input FB is
> YUV format and CWB is enabled.

I'd prefer for this to be more natural rather than just checking for
the DP && DP_YUV420 && WB && WB_FMT_YUV. In the worst case, count CDM
requests and then in RM check them against the catalog. But I had a
more logical (although more intrusive) implementation on my mind:

struct msm_display_topology {
    struct {
      u32 num_intf;
      u32 num_wb;
      u32 num_dsc;
      bool needs_cdm;
    } outputs[MAX_OUTPUTS];
    u32 num_lm;
};

WDYT?

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>   }
> >>
> > --
> > With best wishes
> > Dmitry
>


-- 
With best wishes
Dmitry
