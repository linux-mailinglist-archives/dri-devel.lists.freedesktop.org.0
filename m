Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996B3A3E79
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694E6EE4C;
	Fri, 11 Jun 2021 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833636EE4F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:01:09 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id t17so2011897qta.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfBuLm9X/ZFXx9ulil7rRE1PalBWgkaUHxCcK7gre2o=;
 b=kMjVqKxFejQZaqNMlqj1gWhBGuhmgh5iPQVRw04gqH3ZfEB6cww+JUptb2jVQlxzKI
 JUvi8JIWUBBUOR97GUCkAlrIZyOciy4wuVi9hEXTzZfZczG21NNBDCIzf3rkgsjqU8L1
 x3Uv13sehkZBRO5vvhL6/l2UADxJgWYHeKLnUHza1K/D43tRVNIoYN4sRCGNVf9vE4hq
 86hCkyEC37HrQY/FPTOE5+rhCwy0JlEITBk3q/d096R7zods0v93ooy2L8mRsAGXYVOT
 sqW01ti1clKi3e/ImMRIMQePftSxwixyGOzyZJQq1hM9lJq6OWoue7pxmyY/UHJ1ZBHt
 iV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfBuLm9X/ZFXx9ulil7rRE1PalBWgkaUHxCcK7gre2o=;
 b=CerruPZ0sOAwLKDdr5QTOsP5uX5ggWoR+VZmvb+tuETPl3gD1TchHpttrMcenS6cWv
 w3GKe/xUBGt/qxZZd9USk9wlnsYoxa6/qZzxTNyrm54GAJIousg+Dy/K4MmOOlPgOnvh
 Ya55G8atYMMee7sLMuvWPXq7djqVw7lwgvex0gFO3IzlLeev0gTSPWpSCJMFY25JZAbB
 vCB3k+hCR4VCQKhlWdbosd7whqNajSq8KzLfw8OTV3juDkc1bdY1xrro/gKKkM+8ebPy
 IplwhE13IOJixSgu8Zx4fNTbrl0sqI3WGY0UdyX5zdMi9DPiBP3eDK4ET7eoSCe5h7Qi
 hUNQ==
X-Gm-Message-State: AOAM530cZi9q0KUKN+FLGuHa7nT2DE3F0ryQ5rxctdCMrRERnzDFOIHy
 iKOFWGWdZ2GOGRzDIyZvburZpKyo77RM6YEGIDiZQw==
X-Google-Smtp-Source: ABdhPJyoSiWIM25RDZZZ6wPuwrZshCZyw4fcyOTmsNFEelVwi6tVKUBCLG6rTxGVPobpohofx+V8cSeSRpN6ph51sYo=
X-Received: by 2002:ac8:7412:: with SMTP id p18mr2755368qtq.273.1623402067123; 
 Fri, 11 Jun 2021 02:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-23-dmitry.baryshkov@linaro.org>
 <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
In-Reply-To: <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Jun 2021 12:00:55 +0300
Message-ID: <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] drm/msm/dsi: remove temp data from global pll
 structure
To: John Stultz <john.stultz@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Vinod Koul <vinod.koul@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 11 Jun 2021 at 10:07, John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Mar 31, 2021 at 3:58 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The 7nm, 10nm and 14nm drivers would store interim data used during
> > VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
> > structures to the onstack storage. While we are at it, drop
> > unused/static 'config' data, unused config fields, etc.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
>
> Hey Dmitry,
>   Just wanted to give you a heads up.  Peter Collingbourne reported
> today that his db845c wasn't booting to display for him on his 4k
> monitor. It works fine on a 1080p screen, and while 4k isn't supported
> (yet?),  normally the board should fall back to 1080p when connected
> to a 4k monitor.  I was able to reproduce this myself and I see the
> errors below[1].

It looks like I made a mistake testing these patches with the splash
screen disabled.
Stephen Boyd has proposed a fix few days ago (will be included into
the 5.13). Could you check that it fixes the problem for you?

https://lore.kernel.org/linux-arm-msm/20210608195519.125561-1-swboyd@chromium.org/

>
> I dug back and found that things were working ok on v5.12 w/ the
> recently merged commit d1a97648ae028 ("drm/bridge: lt9611: Fix
> handling of 4k panels"), and started digging around.
>
> Seeing a bunch of changes to the
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c file, I tried reverting a
> chunk of the changes since 5.12 to that, and that got it working
> again. I've narrowed it down to this change -
> 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll
> structure") upstream (also reverting following 6e2ad9c3bfca and
> 36c5dde5fdf0 first - but its reverting this change that actually makes
> it work again).
>
> I've not managed to really look into the change to see what might be
> going wrong yet (its late and I'm about to crash), but I wanted to
> give you a heads up. If you have any ideas for me to try I'm happy to
> give them a go.
>
> thanks
> -john
>
> [1]:
> [   19.846857] msm_dsi_phy ae94400.dsi-phy:
> [drm:dsi_pll_10nm_vco_prepare] *ERROR* DSI PLL(0) lock failed,
> status=0x00000000
> [   19.857925] msm_dsi_phy ae94400.dsi-phy:
> [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0) lock failed
> [   19.866978] dsi_link_clk_enable_6g: Failed to enable dsi byte clk
> [   19.873124] msm_dsi_host_power_on: failed to enable link clocks. ret=-110
> [   19.879987] dsi_mgr_bridge_pre_enable: power on host 0 failed, -110
> [   19.886309] Turning OFF PHY while PLL is on
> [   20.415019] lt9611 10-003b: video check: hactive_a=0, hactive_b=0,
> vactive=0, v_total=0, h_total_sysclk=0
> [   20.481062] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.489306] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.513031] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.553059] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.561300] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.625054] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.633299] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.657033] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.697065] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.705316] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.769066] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.777330] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.801035] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.845049] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> ...



-- 
With best wishes
Dmitry
