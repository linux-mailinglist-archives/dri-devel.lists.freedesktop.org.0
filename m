Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAB7A5E6D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917FF10E27C;
	Tue, 19 Sep 2023 09:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B47B10E261
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:44:50 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-59ea6064e2eso19552757b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695116689; x=1695721489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kJo8D8JWanSKhtAvp3wVew9z7mMntNBF78rt2N3S95c=;
 b=D8s6I6nmgl3qE49cw20xYmJCDrB+e/kHyU0UI3PPecyPaw07J31N0lODvcYeufaKrL
 JW+Al0bD1zIPENlrCOQCyCSXzL7ryM2xMslrUALdQt+a8o6l4H5xLJCwSaejETk0un3C
 gXVJJ783riBff/QmktFdbeSOrPidzYlle6aMMu26lrkgmt1BBRYVT59e1gBU5/m2y2d9
 mBWSB/LvyKA6KeeUa/3h/Qk5C8ImuX/cXx6dIXAsHjNSTAM5xEH3QZ/x24t2p79s0f4K
 Y0r7NAmEXZFgm3RqbQ3w6bwWVsq85MvEoT5EDcnmeC4+CRrZaCCEUIvaTv88iudck01M
 cDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695116689; x=1695721489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJo8D8JWanSKhtAvp3wVew9z7mMntNBF78rt2N3S95c=;
 b=F6XBKnmrIDSdeqcVUX9dPVQjBofqRnQdy+vNhW+JdA/vsk1zZQbW50XWtzIYFFuesB
 JsPCYzfIC74rbcMOqIOJyubQcumvMHhbiLvHxFV0pclM6l/EAjBabgV+i9GmtvQRFo6i
 RxhZQ8kRe7UK4D5Qj9WMQNJuho2yNoVBiVYPZhKCGoJK40eiA1tW27EWNd7VF5HAWwzm
 Q+DNPKsQMNTXZoYNuf7gHd+MMSDEgN8bHFYSU8WcFt846EpvjJl/+wNqbny1zO86vjl2
 utMHKwPPjoA+68qr287Zt1y2/O+xIW5QINpmkkH5bv/8ny7DPORzIWn9RafKlySFJZXw
 9Ftw==
X-Gm-Message-State: AOJu0YwrgHT0XZZeuA8pqFELBxxA7OzCX+cBpk8TxNM7abXYeUJzbPQp
 Rkqj8vMpSs2O7btrq4O5/C4wNMP4i6SLXR7NCkn2RQ==
X-Google-Smtp-Source: AGHT+IENyn8VI3VAOno3vVbJ1bNqVaui83jdYwUQMKt0LOgHNtl5eLnB0nSX0Nl6ZAz1VNxEww1ovp95wTFVdQ2s8hs=
X-Received: by 2002:a0d:df43:0:b0:59a:b7b2:5f02 with SMTP id
 i64-20020a0ddf43000000b0059ab7b25f02mr13131931ywe.18.1695116689106; Tue, 19
 Sep 2023 02:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-3-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprRrTW3pqmjVbfKG5t8t_QNGvPboETNgaAUxg3PvkRjcA@mail.gmail.com>
 <c1b816bc-4fee-338b-d066-6e6c528b5e3c@quicinc.com>
In-Reply-To: <c1b816bc-4fee-338b-d066-6e6c528b5e3c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Sep 2023 12:44:38 +0300
Message-ID: <CAA8EJppEJ_0JwVqRv+ue9kJRZhOdxXVnHe5G_ey-8eKZ9H23TQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/msm/dp: replace is_connected with link_ready
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Sept 2023 at 20:09, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/15/2023 6:51 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> The is_connected flag is set to true after DP mainlink successfully
> >> finish link training. Replace the is_connected flag with link_ready
> > finishes.
> > Also this is not a replace, this patch renames the flag.
> yes, it is rename.
> >
> >> flag to avoid confusing.
> > confusing what with what?
>
> we have ST_MAINLINK_RAEDY state which means mainlink had finished link
> training and ready for video.
>
> Therefore I think link_ready is more meaningful than is_connected.

Guess, all this should have been in the commit message.

>
>
> >
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
> >>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
> >>   drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
> >>   3 files changed, 17 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index c217430..18d16c7 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -367,12 +367,11 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> >>          drm_helper_hpd_irq_event(connector->dev);
> >>   }
> >>
> >> -
> >>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>                                              bool hpd)
> >>   {
> >> -       if ((hpd && dp->dp_display.is_connected) ||
> >> -                       (!hpd && !dp->dp_display.is_connected)) {
> >> +       if ((hpd && dp->dp_display.link_ready) ||
> >> +                       (!hpd && !dp->dp_display.link_ready)) {
> >>                  drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> >>                                  (hpd ? "on" : "off"));
> >>                  return 0;
> >> @@ -382,7 +381,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>          if (!hpd)
> >>                  dp->panel->video_test = false;
> >>
> >> -       dp->dp_display.is_connected = hpd;
> >> +       dp->dp_display.link_ready = hpd;
> >>
> >>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> >>                          dp->dp_display.connector_type, hpd);
> >> @@ -922,7 +921,7 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
> >>
> >>          dp_display->plugged_cb = fn;
> >>          dp_display->codec_dev = codec_dev;
> >> -       plugged = dp_display->is_connected;
> >> +       plugged = dp_display->link_ready;
> >>          dp_display_handle_plugged_change(dp_display, plugged);
> >>
> >>          return 0;
> >> @@ -1352,16 +1351,16 @@ static int dp_pm_resume(struct device *dev)
> >>           * also only signal audio when disconnected
> >>           */
> >>          if (dp->link->sink_count) {
> >> -               dp->dp_display.is_connected = true;
> >> +               dp->dp_display.link_ready = true;
> >>          } else {
> >> -               dp->dp_display.is_connected = false;
> >> +               dp->dp_display.link_ready = false;
> >>                  dp_display_handle_plugged_change(dp_display, false);
> >>          }
> >>
> >>          drm_dbg_dp(dp->drm_dev,
> >>                  "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
> >>                  dp->dp_display.connector_type, dp->link->sink_count,
> >> -               dp->dp_display.is_connected, dp->core_initialized,
> >> +               dp->dp_display.link_ready, dp->core_initialized,
> >>                  dp->phy_initialized, dp_display->power_on);
> >>
> >>          mutex_unlock(&dp->event_mutex);
> >> @@ -1754,8 +1753,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >>                  return;
> >>          }
> >>
> >> -       if (!dp_display->is_connected && status == connector_status_connected)
> >> +       if (!dp_display->link_ready && status == connector_status_connected)
> >>                  dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >> -       else if (dp_display->is_connected && status == connector_status_disconnected)
> >> +       else if (dp_display->link_ready && status == connector_status_disconnected)
> >>                  dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >>   }
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> >> index b3c08de..d65693e 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> >> @@ -16,7 +16,7 @@ struct msm_dp {
> >>          struct drm_bridge *bridge;
> >>          struct drm_connector *connector;
> >>          struct drm_bridge *next_bridge;
> >> -       bool is_connected;
> >> +       bool link_ready;
> >>          bool audio_enabled;
> >>          bool power_on;
> >>          unsigned int connector_type;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> index 785d766..ee945ca 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> @@ -24,10 +24,10 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
> >>
> >>          dp = to_dp_bridge(bridge)->dp_display;
> >>
> >> -       drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
> >> -               (dp->is_connected) ? "true" : "false");
> >> +       drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> >> +               (dp->link_ready) ? "true" : "false");
> >>
> >> -       return (dp->is_connected) ? connector_status_connected :
> >> +       return (dp->link_ready) ? connector_status_connected :
> >>                                          connector_status_disconnected;
> >>   }
> >>
> >> @@ -40,8 +40,8 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
> >>
> >>          dp = to_dp_bridge(bridge)->dp_display;
> >>
> >> -       drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
> >> -               (dp->is_connected) ? "true" : "false");
> >> +       drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> >> +               (dp->link_ready) ? "true" : "false");
> >>
> >>          /*
> >>           * There is no protection in the DRM framework to check if the display
> >> @@ -55,7 +55,7 @@ static int dp_bridge_atomic_check(struct drm_bridge *bridge,
> >>           * After that this piece of code can be removed.
> >>           */
> >>          if (bridge->ops & DRM_BRIDGE_OP_HPD)
> >> -               return (dp->is_connected) ? 0 : -ENOTCONN;
> >> +               return (dp->link_ready) ? 0 : -ENOTCONN;
> >>
> >>          return 0;
> >>   }
> >> @@ -78,7 +78,7 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
> >>          dp = to_dp_bridge(bridge)->dp_display;
> >>
> >>          /* pluggable case assumes EDID is read when HPD */
> >> -       if (dp->is_connected) {
> >> +       if (dp->link_ready) {
> >>                  rc = dp_display_get_modes(dp);
> >>                  if (rc <= 0) {
> >>                          DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
