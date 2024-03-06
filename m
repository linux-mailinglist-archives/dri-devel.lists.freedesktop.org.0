Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EB87411B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D4F113508;
	Wed,  6 Mar 2024 20:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n8p+UZb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C981411350A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:06:02 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so64337276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709755561; x=1710360361; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4PXujBSZ8FvLDvY0K2TIfDzAysZgYZ9VK/ikeWwgFec=;
 b=n8p+UZb1pXUMSQiPxqYTfXERU1722A3ZRrVlXrit/ymOd+DKSCdjyPlXP+XnkENXRd
 UbhdIU/QzeyfDnKJADyWv7+9kprIoJAYmGCk1bAXYQmBbDp4W/E5o4U9mL0uIiIOUFrH
 jIayPeAhJETrO09aF5GkABT/ZikHBfvc45tFe6jPvah3+JSHGAzmbt7AFfyEszwWKyfa
 rLcknuecu9LEhkmRjMPISzTeefHmZhFk/heWOq6AKEpOhRJPumkC9CNQIMuwAOkspqLO
 MMhV5l8CvJyiVsqdzBraZpfny5druH/EXtgjf11hoVEeKhzGdQOwidWoAM4BdMeLW+M/
 faDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755561; x=1710360361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PXujBSZ8FvLDvY0K2TIfDzAysZgYZ9VK/ikeWwgFec=;
 b=A6iAxzlXa8vOAXH3BJeYIF3xBRRswCc/zl06riW9Z7Co4iD79nOzHJeOOgN7dXfP12
 aRfS4OTWj8EaPSj6ncWgHXLDletqnMQomSPZh5yMvVAWsReQSIe6ZaPwDIb5S8W2wlE1
 btXasTtYk38+ma6yYom7/+h7/sxozVeJkwOwIGUQFb5DF4JtZDvXQuWQOdtUKmhFgDNN
 QRsS5J/MYSt51vFliMcfKgsRGwQqhgHNIxPgggRBLgscx1JyMDHiRAFEEXdTTEjQHqWV
 ZpnHcH+LtptkM8L2IJXBQjWDSVzU0G2GOWivHQhGsRA5s1jaC0u1lR3Bo508tdSKLmXX
 7HXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrGMZw5C9db5jIyzMT97gU/TwjZlSP9MpzcOikxjv3297qgkaOXzNPfMHqz05K213v9P8sc7e9Xybe+GVuwdJpnyWmECwPURSy3YVTMtLJ
X-Gm-Message-State: AOJu0YyZCxxYtpjUPovvMVtItDdwtM9G0mrQl9mogzzzR1pKm2bCynFq
 PMyd0/LCnnOx3Qbf3Jm0efLdeTSQuTjXms/xvO0j0MTtC/Jc6s4puqZpizm0qGRPeYyvjqwDVDX
 OvJvO5WGlr9z0NJ2t2fIK+spxNs0Z6PEjmQFk7w==
X-Google-Smtp-Source: AGHT+IFa2jOmW/7Mnfj4IRBnhnTPN2y+PfXCBXlkHor2t9o+1xiC2eXXMGaB2T0SmxSappk79AgqFwvOpB0iTT+ziZU=
X-Received: by 2002:a05:6902:1b88:b0:dcc:c279:d2fa with SMTP id
 ei8-20020a0569021b8800b00dccc279d2famr15505206ybb.30.1709755561553; Wed, 06
 Mar 2024 12:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
 <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com>
 <2295092e-355b-4ebf-f630-14623cf7d9a3@quicinc.com>
In-Reply-To: <2295092e-355b-4ebf-f630-14623cf7d9a3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 22:05:50 +0200
Message-ID: <CAA8EJpovNX31rWS_TdBTQiDmk0+kGBPdax6JncZupbXL0iUZhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dp: move link_ready out of HPD event thread
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
 quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 6 Mar 2024 at 21:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/6/2024 11:52 AM, Dmitry Baryshkov wrote:
> > On Wed, 6 Mar 2024 at 21:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> There are cases where the userspace might still send another
> >> frame after the HPD disconnect causing a modeset cycle after
> >> a disconnect. This messes the internal state machine of MSM DP driver
> >> and can lead to a crash as there can be an imbalance between
> >> bridge_disable() and bridge_enable().
> >>
> >> This was also previously reported on [1] for which [2] was posted
> >> and helped resolve the issue by rejecting commits if the DP is not
> >> in connected state.
> >>
> >> The change resolved the bug but there can also be another race condition.
> >> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> >> link_ready will also not be set to false allowing the frame to sneak in.
> >>
> >> Lets move setting link_ready outside of hpd_event_thread() processing to
> >> eliminate a window of race condition.
> >>
> >> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> >> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 068d44eeaa07..e00092904ccc 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>                                                           dp->panel->downstream_ports);
> >>          }
> >>
> >> -       dp->dp_display.link_ready = hpd;
> >> -
> >>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> >>                          dp->dp_display.connector_type, hpd);
> >>          drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> >> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
> >>                  goto end;
> >>          }
> >>
> >> +       dp->dp_display.link_ready = true;
> >
> > Do we need any kind of locking now?
> >
>
> hmm ... correct me if I have missed any flows but I think all paths
> where we will set link_ready are already protected by event_mutex?

I didn't check the source code, that's why I was asking. If it's
protected by event_mutex, then it should be fine.

>
> >> +
> >>          dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >>
> >>   end:
> >> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
> >>   {
> >>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
> >>
> >> +       dp->dp_display.link_ready = false;
> >> +
> >>          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> >>
> >>          return 0;
> >> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
> >>                  drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
> >>                  if (dp->hpd_state != ST_DISCONNECTED) {
> >>                          dp->hpd_state = ST_DISCONNECT_PENDING;
> >> +                       dp->dp_display.link_ready = false;
> >>                          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> >>                  }
> >>          } else {
> >> --
> >> 2.34.1
> >>
> >
> >



-- 
With best wishes
Dmitry
