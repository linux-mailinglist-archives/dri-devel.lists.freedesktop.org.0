Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715698740DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318D1134DF;
	Wed,  6 Mar 2024 19:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TKJ5/z5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4A1134DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 19:53:01 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcc73148611so41789276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 11:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709754780; x=1710359580; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d27KImFrNXS8TH5Uy9ti36RCHItgUnUBpBlO5w+2ibI=;
 b=TKJ5/z5N+jhjiY2M2GFwTwlWeOdrEzpV9X5aKIp+00dd1Bih8rDnI3tfJOWMMZh8oz
 m8DZ6QNN+d2H2X8uPvHlgrMs/Zy2FrYr6LD3ItPyWfbS0NbKubjHjVjjhyie69iFFdrs
 jGiIKWhVl+f68k7Ft6QFrSLT5BnE82/eiu7UDjEYbjgZa0q5XzL/+rIwvbJDk7yvnZTY
 M4TxhkHCvWwE7K2RD6QWXCh5QsxVGeD8eCxGd/y69fMlqonEbAoMygGtyq0zpa67BXmE
 mSatuyWlx3DL0VfUegJa83zdGTreNQj/wqWM/OoN3zTAurqBn4o6lo0U0CBcCTJJGH3U
 oL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754780; x=1710359580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d27KImFrNXS8TH5Uy9ti36RCHItgUnUBpBlO5w+2ibI=;
 b=cDpW3i5JdkOjubBrIBmZsZeJsP9Qfeu8bmdWZMniFiIU+Wlr4hGQhsteeTg6PYwjz5
 g3PQknTps06Uim6VF3/Bji4qRsyrhdz/J5+TydIxnm5vMMr8xjYzYPV6XlM7EWq/GAZ+
 P1dV9gSzRXzXzvy3RKINvDM2u9zZfa8SYM+rEnGqsqtL5xaCG2XLF9uCKnoYwM9PHuYb
 GBoircUsItuAVFxgaUBZbw6mgAUTyPIWmEBnKJ3+xFcvimCSisvCLL+JIzjs22KXySAD
 UWLzq15p+asFXg9+WK5j/XdVxT+r5MbJ/0KUKNACF1fFc4vBx6jHxbdBVPo5LP/7gbIR
 Sy/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8yloNd9Z9yu+iefoEATngKbBsjd6334s942J7rja8WT6ljDGYwGIFJIA/gK7jZ8Soh8HwH3n5Cfz484AYS42nUaiv9cdnuga162MEMvzM
X-Gm-Message-State: AOJu0YxnT61KglTFpydO0Nm7HuSFPLK+RjePxnnZIbLbvQrwjOIZRZKR
 frLHxX1mX21npVQTYpYlS000oG7ldJDR2bSaVca0mBuP4IMBdCODNaVrACMY1NRpFxaOI3SHY87
 D9iRrb74S3p8PUwlPJWe34536Nkzl8Gr9SJ7ZFg==
X-Google-Smtp-Source: AGHT+IGHfNDjfh7hFs/ZwG4KT9lA9AimK6yKN74rJTfSS+TfmaWUA5IQ4eiis9rUmiQWP7vtu12pPVkJnV3wZTUiXuk=
X-Received: by 2002:a25:8a08:0:b0:dbe:4f15:b5cf with SMTP id
 g8-20020a258a08000000b00dbe4f15b5cfmr12953825ybl.15.1709754780141; Wed, 06
 Mar 2024 11:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:52:48 +0200
Message-ID: <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com>
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

On Wed, 6 Mar 2024 at 21:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> There are cases where the userspace might still send another
> frame after the HPD disconnect causing a modeset cycle after
> a disconnect. This messes the internal state machine of MSM DP driver
> and can lead to a crash as there can be an imbalance between
> bridge_disable() and bridge_enable().
>
> This was also previously reported on [1] for which [2] was posted
> and helped resolve the issue by rejecting commits if the DP is not
> in connected state.
>
> The change resolved the bug but there can also be another race condition.
> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> link_ready will also not be set to false allowing the frame to sneak in.
>
> Lets move setting link_ready outside of hpd_event_thread() processing to
> eliminate a window of race condition.
>
> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 068d44eeaa07..e00092904ccc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>                                                          dp->panel->downstream_ports);
>         }
>
> -       dp->dp_display.link_ready = hpd;
> -
>         drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>                         dp->dp_display.connector_type, hpd);
>         drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>                 goto end;
>         }
>
> +       dp->dp_display.link_ready = true;

Do we need any kind of locking now?

> +
>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>
>  end:
> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>  {
>         struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
> +       dp->dp_display.link_ready = false;
> +
>         dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>
>         return 0;
> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
>                 drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>                 if (dp->hpd_state != ST_DISCONNECTED) {
>                         dp->hpd_state = ST_DISCONNECT_PENDING;
> +                       dp->dp_display.link_ready = false;
>                         dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>                 }
>         } else {
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
