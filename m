Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E648DFEA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 22:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C39010E152;
	Thu, 13 Jan 2022 21:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4400D10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 21:52:26 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 t6-20020a9d7746000000b005917e6b96ffso7945505otl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=bmVbBYvDbuoWRp6+16w0QBWEdDpZDhj9Rn9ppv6AqCU=;
 b=R4YIafTOeVqUdXdbqRlIBGCfXxJpk6tNIX3941ZXMWUudH/y11d1T8nHksuAQesH3B
 8MpLfyWOHboTwG5KRaNKy9Jng6bVVLzk0YSy9ybaiKB1x8vp+LNEQ+FQaVe6DjacH+ig
 AhjR7UGnOtS1EZNnx1cWl0aN25Om5tQqvVw0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=bmVbBYvDbuoWRp6+16w0QBWEdDpZDhj9Rn9ppv6AqCU=;
 b=PmPH7yumXz5NEyj4on03sdtVex7y5V6VAnkLsR/d/oZ7jo6fd748Cun5qhsN4G938z
 eR5WwyePtvni+fcswjEjQCfUiOavneBgREczYYA9IVqgafNm+cQjrkSOvHc9+H3beY0S
 juyOGd2wWUHlfT5I6JGze3bLvA3pervNx/P3UJKyE4kAN+Kn6doErS63sHAe+dgEsAor
 w8lgyinMPuKC1KyQQHM2ytksrL95GdRp7rGjo3GcJ5VDv2oYCHl5KdRzs7badGSkmYGq
 V6Xbe1IhAyBQVlHDFfzNEkYIvZurns/8PFBeMraadb6b0GW9+q0rYgfWfgRPpKd4EtL4
 SGew==
X-Gm-Message-State: AOAM530bZidHBsJwJIjfDXPtzPnAxhKtRJPGl9doS5vFGLIyNhtsLGgU
 OnfaABieSZJGtMzcS7adYhPcIM4WZEl+7GyocJDbXw==
X-Google-Smtp-Source: ABdhPJzl32AbliMr0Gd5dEY2rbmR/jg7ItbYqI5kg6enxxnpK4a6gccC4QkePfqC8hLDhPUhhu9hq3VC/vAB/3rxQTk=
X-Received: by 2002:a05:6830:1614:: with SMTP id
 g20mr3695514otr.77.1642110745549; 
 Thu, 13 Jan 2022 13:52:25 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 13:52:25 -0800
MIME-Version: 1.0
In-Reply-To: <64ad7053-beac-0c28-7d09-ea32a4f7fbad@quicinc.com>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
 <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
 <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com>
 <CAE-0n51QbJHnOses5sF6xECR0gRZB1Fbi1KqoLG+61ZWH9BtOA@mail.gmail.com>
 <64ad7053-beac-0c28-7d09-ea32a4f7fbad@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 13 Jan 2022 13:52:25 -0800
Message-ID: <CAE-0n53qxer=shY3LdxzDPFaQb1L65okX9TM0TXYCdD59qau5g@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-13 12:44:16)
>
> On 1/13/2022 11:47 AM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-13 09:51:42)
> >> On 1/12/2022 8:13 PM, Stephen Boyd wrote:
> >>>>>> -       if (dp->usbpd->orientation =3D=3D ORIENTATION_CC2)
> >>>>>> -               flip =3D true;
> >>>>>> +       dp_power_init(dp->power, false);
> >>>>>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> >>>>>> +
> >>>>>> +       /*
> >>>>>> +        * eDP is the embedded primary display and has its own phy
> >>>>>> +        * initialize phy immediately
> >>>>> Question still stands why we can't wait for hpd high from the eDP p=
anel.
> >>>>> Also, I think "has its own phy" means that it's not part of a combo
> >>>>> USB+DP phy? Can you please clarify?
> Correct, eDP has its dedicated phy which is not part of combo phy.

Why does that mean we can't wait for hpd high from the eDP panel?

> >>>>>> +        */
> >>>>>> +       if (dp->dp_display.connector_type =3D=3D DRM_MODE_CONNECTO=
R_eDP)
> >>>>>> +               dp_display_host_phy_init(dp);
> >>>>>>
> >>>>>> -       dp_power_init(dp->power, flip);
> >>>>>> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> >>>>>>            dp_aux_init(dp->aux);
> >>>>>>            dp->core_initialized =3D true;
> >>>>>>     }
> >>>>>> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev=
)
> >>>>>>            dp->hpd_state =3D ST_DISCONNECTED;
> >>>>>>
> >>>>>>            /* turn on dp ctrl/phy */
> >>>>>> -       dp_display_host_init(dp, true);
> >>>>>> +       dp_display_host_init(dp);
> >>>>>>
> >>>>>>            dp_catalog_ctrl_hpd_config(dp->catalog);
> >>>>>>
> >>>>>> -       /*
> >>>>>> -        * set sink to normal operation mode -- D0
> >>>>>> -        * before dpcd read
> >>>>>> -        */
> >>>>>> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false)=
;
> >>>>>>
> >>>>>>            if (dp_catalog_link_is_connected(dp->catalog)) {
> >>>>>> +               /*
> >>>>>> +                * set sink to normal operation mode -- D0
> >>>>>> +                * before dpcd read
> >>>>>> +                */
> >>>>>> +               dp_display_host_phy_init(dp);
> >>>>>> +               dp_link_psm_config(dp->link, &dp->panel->link_info=
, false);
> >>>>>>                    sink_count =3D drm_dp_read_sink_count(dp->aux);
> >>>>>>                    if (sink_count < 0)
> >>>>>>                            sink_count =3D 0;
> >>>>>> +
> >>>>>> +               dp_display_host_phy_exit(dp);
> >>>>> Why is the phy exited on resume when the link is still connected? I=
s
> >>>>> this supposed to be done only when the sink_count is 0? And how doe=
s
> >>>>> this interact with eDP where the phy is initialized by the call to
> >>>>> dp_display_host_init() earlier in this function.
>
> At beginning of dp_pm_resume bot core_initialized and phy_initialized
> should be off.
>
> However at the case of dongle still connected to DUT, we have to read
> dongle dpcd to decided any hdmi connect to dongle (sink_count !=3D 0). in
> this case, we have to turn on phy to perform dpcd read and=C2=A0 turn off=
 phy
> after read so the following plugged-in interrupt can be handled correctly=
.
>

That looks like a lot of wasted work. Why can't we turn on the core,
turn on the phy, check if it's connected, and then turn off the phy if
it isn't? At the least, please put a comment above this phy_exit() call
indicating that we'll turn the phy back on while processing a plugged in
interrupt.
