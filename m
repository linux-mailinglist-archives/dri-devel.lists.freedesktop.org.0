Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866554ABED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B913310EF14;
	Tue, 14 Jun 2022 08:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE83B10EF14
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:38:10 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1011df6971aso9178760fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=utIOJeHG0w8xs3SdDFyTFAYjLdnYVwoFoYTnpKxafwQ=;
 b=PpOH0MNv6SWnsCve6x76GZ2a7kc2QZ0KWbrdW6PwdMuxBBXd7x7jmWZJ9Why9wWUlZ
 mo3tuBIoV7efRGdIejyHvqTtg//3/Ea/6842v6XznIBCTIdLIF5P0UHz/RWKAikYCH6T
 z60XTX8aSPx5UJmA8TfiQvgJ/E9L0dM3B9oBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=utIOJeHG0w8xs3SdDFyTFAYjLdnYVwoFoYTnpKxafwQ=;
 b=hyPwH0BjtNE/1+udjnuh3e6UPeb2kpGcH3ZnNp5cZBLmK0lcewxqpdgv8I4LraCOJ8
 Uxo8dlNmbwcbUBCDnL1gUOtsCBIEVCoHsOCRPzc79i4ZxaltOuvOHfzLG+OSTUAfszQv
 DweN+UTM0vMqo5+9moJfe2vwypcBU2XFe9/BpEsmf6WLz3jmio5AO2FsYk/p2tHA8tiG
 hlx8vtwhoUaa2bJRX9WuC62y/DkPfr+I6NU2PekWhCiehm6WrjGEwcpkttdoysjn2DKq
 E98j6quI7M9m9NaZoP+7gHNjuswUYl3BlSxP6+VRvrAdD76do98ODWjTlaFL+JCJxqyB
 cg3Q==
X-Gm-Message-State: AJIora9fBTfEY0htiOjqHgFnXWawxQlDpAs8auhLXa6Hvjomx66+0D3y
 nTCTUZgvOprRc8oHlKW9bmp2dZLUbN9ZBlyOp3kMlA==
X-Google-Smtp-Source: AGRyM1tIQCOd0lHpGAf9UboG4z86U6be0GMGv1Fy2kiXMRApvUT1XTQs3EslrPM7sbRGeKYe8XQa6rgpoSs+KeBwBEQ=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1683897oap.63.1655195889918; Tue, 14 Jun
 2022 01:38:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jun 2022 01:38:09 -0700
MIME-Version: 1.0
In-Reply-To: <1655156917-21726-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655156917-21726-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 14 Jun 2022 01:38:09 -0700
Message-ID: <CAE-0n50Z92PM+j7S_wmTeLcmu5cVO3YBT+viLeoLs5QhgXZMoA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: force link training for display resolution
 change
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-13 14:48:37)
> During display resolution changes display have to be disabled first
> followed by display enabling with new resolution. Display disable
> will turn off both pixel clock and main link clock so that main link
> have to be re-trained during display enable to have new video stream
> flow again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start link
> training if link status is not in sync state. However, there is rare
> case that a particular panel links status keep staying in sync for
> some period of time after main link had been shut down previously at
> display disabled. Main link retraining will not be executed by
> irq_hdp_handle() if the link status read from panel shows it is in
> sync state. If this was happen, then video stream of newer display
> resolution will fail to be transmitted to panel due to main link is
> not in sync between host and panel. This patch force main link always
> be retrained during display enable procedure to prevent this rare
> failed case from happening. Also this implementation are more
> efficient than manual kicking off irq_hpd_handle function.

How is resolution change different from disabling and enabling the
display? The commit text talks about resolution changes, but the code
doesn't compare resolutions from before and after to know when to
retrain the link. Can the code be made to actually do what the commit
text says? It would be clearer if the code looked for actual resolution
changes instead of hooking the dp_bridge_enable() function.

>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..bea93eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>
>         ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>         if (!ret)
> -               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl, false);

Does this even matter if it's true or false? The 'sink_request' has
DP_TEST_LINK_PHY_TEST_PATTERN set from what I can tell, and then
dp_ctrl_on_stream() bails out before calling dp_ctrl_link_retrain()
anyway. It would be nice if we could split dp_ctrl_on_stream() so that
the part after the check for the sink request is a different function
that is called by dp_display.c and then this code can call the 'prepare'
function that does the first part. Then we can ignore the testing path
in the code, and possibly remove the conditional in dp_ctrl_on_stream()?

>         else
>                 DRM_ERROR("failed to enable DP link controller\n");
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..370348d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       rc = dp_ctrl_on_stream(dp->ctrl);
> +       rc = dp_ctrl_on_stream(dp->ctrl, data);
>         if (!rc)
>                 dp_display->power_on = true;
>
> @@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>         int rc = 0;
>         struct dp_display_private *dp_display;
>         u32 state;
> +       bool force_link_train = false;
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>         if (!dp_display->dp_mode.drm_mode.clock) {
> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>
>         state =  dp_display->hpd_state;
>
> -       if (state == ST_DISPLAY_OFF)
> +       if (state == ST_DISPLAY_OFF) {
>                 dp_display_host_phy_init(dp_display);
>
> -       dp_display_enable(dp_display, 0);
> +               if (!dp->is_edp)

I didn't see any answer to my question about why edp is special on v4.
Can you at least add a comment to the code about why edp doesn't need to
unconditionally retrain, but DP does?

> +                       force_link_train = true;
> +       }
> +
> +       dp_display_enable(dp_display, force_link_train);
>
>         rc = dp_display_post_enable(dp);
>         if (rc) {
