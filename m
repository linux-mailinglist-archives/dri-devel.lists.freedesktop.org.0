Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA927A5E7E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD0C10E338;
	Tue, 19 Sep 2023 09:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD110E338
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:46:07 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-59c00b5c8b2so46478367b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695116766; x=1695721566; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5QwnMEr9g+UV2zSClp4LdEyAkoPr5XRWwAzh3mE4dxo=;
 b=AoC86rS2hEtyw5P38Q0X0W1zvh49nLO4WJY/3gZQ7pIzYt17nOoOhEsi6BqHkhPwbs
 vXm73fR4bxlE3b+DdadGPeJrpz8XU9o7F/4O1XUDUf3EuqcfX8Bq9P+kK3y8mGCfL9/M
 7tBD1OD7hMewk+hQRqs6uoKbuXbqlIBlyWCRLLviVEg5HXFF+xRjUs7zlcQmulFMbCPZ
 Ml3nYp5rwdaMK19p9qqG6HQZsV0NDW6YslwjIticWdkazX1GO09lc71YsGYoHikMMBPL
 22nHFiBJID2jcpluY5wH52PPJ2ktrjcyg7N86m/4KYCutXt/NAHw1cQtSGMwAGbGNuAB
 kE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695116766; x=1695721566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QwnMEr9g+UV2zSClp4LdEyAkoPr5XRWwAzh3mE4dxo=;
 b=XWL5tVG9UQVqieihUqolYjoiA1r7kVqrpWFUTb1INLAFRvRNeT64FfaEVSObim7ueK
 iHr6iYbGEBG8CVPWFk0BRiHA2ldeHwkI6SLt9Cp2hMiRZzn9DVh1wHajyopNeCgjoz7/
 pSyjyGhP8msHoZqoArTfa1La6QTyOl4h4jGSHerwOZT7DPdG94HDUPAFf1c7eKtib1WZ
 gQ5Ebqi9fxEnAiEzpflzaVFmVskXVmMH2fypzyeYj7hjV78BXjDmClRCju1LtkTSCCou
 EIxcTJ1Mrbeh282INqiPVG4/9vS73FvU8N50RjdvprLQjiSZWgEIa1+AAVW+M1J+mDaD
 XRZw==
X-Gm-Message-State: AOJu0YxWci37FMlYhWcvbk1qx5ajiTAcS091B5cJiXKX1g919sAcJwaS
 1Kkbon8jFEjGr9RXW9DbcGZYmUfmibT8UuIU3ydFXA==
X-Google-Smtp-Source: AGHT+IEPLhKcEQ8VnPqTGkwZWPQeCGEa8pbJIGsJUn9x4bl87n6z2UlZ8WodvmGmXYRjZe6EBVmQQgOm6zqwAoRaqB8=
X-Received: by 2002:a81:a208:0:b0:583:d722:9ae9 with SMTP id
 w8-20020a81a208000000b00583d7229ae9mr12169719ywg.41.1695116766554; Tue, 19
 Sep 2023 02:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
 <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
In-Reply-To: <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Sep 2023 12:45:55 +0300
Message-ID: <CAA8EJpof+dp_d_5-oADuA7RNU7ut=TKLY5Fw12EjxaSa2S+=rg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes
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

On Mon, 18 Sept 2023 at 23:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/15/2023 5:41 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
> >> framework, to report HPD status changes to user space frame work.
> >> Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
> >> bridge.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Also see the comment below.
> >
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
> >>   1 file changed, 2 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 18d16c7..59f9d85 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
> >>                  (dp->link->sink_count == 0);
> >>   }
> >>
> >> -static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> >> -{
> >> -       struct dp_display_private *dp;
> >> -       struct drm_connector *connector;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> -
> >> -       connector = dp->dp_display.connector;
> >> -       drm_helper_hpd_irq_event(connector->dev);
> >> -}
> >> -
> >>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>                                              bool hpd)
> >>   {
> >> -       if ((hpd && dp->dp_display.link_ready) ||
> >> -                       (!hpd && !dp->dp_display.link_ready)) {
> >> -               drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> >> -                               (hpd ? "on" : "off"));
> >> -               return 0;
> >> -       }
> >> +       struct drm_bridge *bridge = dp->dp_display.bridge;
> >>
> >>          /* reset video pattern flag on disconnect */
> >>          if (!hpd)
> > Note, this part (resetting the video_test and setting of is_connected)
> > should be moved to the dp_bridge_hpd_notify() too. Please ignore this
> > comment if this is handled later in the series.
>
> I think keep them here is better since eDP does not populate hpd_enable,
> hpd_disable and hpd_notify at edp_bridge_ops at drm_bridge_attach().
>
> Keep them here will work for both eDP and DP.

Having them here doesn't work for DP-with-external-bridges, which will
not use dp_display_send_hpd_notification.

>
>
> >
> >
> >> @@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>
> >>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> >>                          dp->dp_display.connector_type, hpd);
> >> -       dp_display_send_hpd_event(&dp->dp_display);
> >> +       drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
