Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593349C82D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E16610E881;
	Wed, 26 Jan 2022 10:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5E210E882
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:59:08 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id b22so4095369qkk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPx10yE8yULTQ2I1GWpvbI+9jFGXWf+l/TyyfhdSi2s=;
 b=DcKJgjZo5MjwZhR1BP8rm+BYvknvqznCY9tfc++zczXRYrENWh/CmheKNnm7njeYxQ
 JtG06XqoPV3iDFbEj5xILlHIeXxrwXEmgmLtRmH4lyQ0LTkBY+z9+ycGOcCkNXzS7tDq
 uBxZzyCUzDg34fMSX7vFq+Yxm/iOXaPup4rqvxMubW4hSJrTbneNZwu1l4Ne7YGW/xMp
 MkZaz/rCe004RJEK7y8FN0PGeMa9vrGWzv+gz/GfsE6Gwz9e1196sTOMVDoy/4vkaHq6
 DX2mZ7rdR8sBeaIQBI0yK4oP//EL4ekOwCV2uPzYg+FOX9FvD80PUiKX6eCFYqQltRMC
 /ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPx10yE8yULTQ2I1GWpvbI+9jFGXWf+l/TyyfhdSi2s=;
 b=Pirre4zWCZcQYs/zbmnsxxoY5ZEyFT5HRJHcbYd/QRDqk2aE6OmKdsOrDcPZjDW25q
 hSiIHo5epnIhlSPUDXbyMh+IW42xxtLMOaiZgs3MRhE0iVn3+PQ1V+u63QvWOlo4L6FH
 jg9uucRw0q2sddKgh3Y//sDPET1FlLyyjOgi1695/ECZNjFIF8yf+/AejMEhsVVHwmbJ
 5tbc4uKYPhZdk18yuMlPab1DvqolPRIZOhg2j/HRFV1W99VqsxxiiLjzr1Lg4CQ1fPpp
 1vjYtu1wAxxCnYewCo6Fptkf8lDxVWgt1XfEQmCYnKL2NeXBUlqD2/nuzUyPFFx2DPx6
 sE+g==
X-Gm-Message-State: AOAM531FUMGhWzeNGKt50P00+nKPDR/VUlTqb5ewqEivjWxTa6D7rMEF
 1hXgOqQO0U/EGXKnUgaLnfUohGXTjfRWqyCozEz4ww==
X-Google-Smtp-Source: ABdhPJxjvuXkYK5Oyx78s5S22uQf0bXFzDeEdF5A3RuUkZEEMGL+lFFyurB31lgTk9CuURIUfP+K9DbMGn+uVKEvtjo=
X-Received: by 2002:a37:ac08:: with SMTP id e8mr1636406qkm.30.1643194747895;
 Wed, 26 Jan 2022 02:59:07 -0800 (PST)
MIME-Version: 1.0
References: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n505fYR1zpgZnC=J7WSxp_gpn6mnda9TuVjmJD8vMRn2Rg@mail.gmail.com>
 <7155e3ab-daf1-4104-6712-1c4e3a328b56@quicinc.com>
In-Reply-To: <7155e3ab-daf1-4104-6712-1c4e3a328b56@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jan 2022 13:58:56 +0300
Message-ID: <CAA8EJpp-DB9+zWZnszkyxNGd+kO5Bko+mw7T_KoeFVTQPmxvDw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add connector type to enhance debug messages
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: aravindh@codeaurora.org, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022 at 21:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/24/2022 5:50 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-24 14:44:52)
> >> DP driver is a generic driver which supports both eDP and DP.
> >> For debugging purpose it is required to have capabilities to
> >> differentiate message are generated from eDP or DP. This patch
> >> add connector type into debug messages for this purpose.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++------
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++++++++-----------
> >>   2 files changed, 60 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index 245e1b9..dcd0126 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> >>
> >>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
> >>          phy_init(phy);
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>   }
> >>
> >>   void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> >> @@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> >>
> >>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
> >>          phy_exit(phy);
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>   }
> >>
> >>   static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
> >> @@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
> >>          phy_exit(phy);
> >>          phy_init(phy);
> >>
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>          return 0;
> >>   }
> >>
> > These are entirely new messages. Adding messages isn't mentioned in the
> > commit text. Please either split this out or indicate in the commit text
> > what's going on here.
> >
> >> @@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> >>
> >>          phy_power_off(phy);
> >>
> >> -       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> >> -               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> >> -
> >>          /* aux channel down, reinit phy */
> >>          phy_exit(phy);
> >>          phy_init(phy);
> >>
> >> -       DRM_DEBUG_DP("DP off link/stream done\n");
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> > The DRM_DEBUG_DP macro says it's deprecated now and we should use
> > drm_dbg_dp() instead. Can you use that macro instead? Then it looks like
> > drm->dev can actually be any old struct device, so I guess we're allowed
> > to pass in the particular instance of dp device this is for. Allowing us
> > to figure out which DP device is actually printing messages.
> where it say "deprecated"?

Quoting drm_print.h:

/* NOTE: this is deprecated in favor of drm_dbg_dp(NULL, ...). */
#define DRM_DEBUG_DP(fmt, ...)                                          \
        __drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)


> >> +                       phy, phy->init_count, phy->power_count);
> >>          return ret;
> >>   }
> >>



-- 
With best wishes
Dmitry
