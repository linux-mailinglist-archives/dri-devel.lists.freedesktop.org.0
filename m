Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C580C904E2C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC4510E29C;
	Wed, 12 Jun 2024 08:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l1p6Lof4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C7310E29C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:31:14 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfab5f7e749so6576452276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718181073; x=1718785873; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AK4TGqSjjB40y8fmZJ44IyeI64N3R1XfTvfluZXkmSM=;
 b=l1p6Lof45PUcSvAKH3V8NKH4iGv2xW/NOADMA9NADSeFzbuoCcW+nxetlA1SGbpw0O
 9d0zL+cE1Qv1cw7mqHrowHeiAM2bpkdHnsxwrcBbw8WlT335P8LVYRRfDGsx6GGfm94+
 Ml0ixu3m0cwZvKtftuRP2G4PtzRS9JpNsalflacsVgshVi2DXccYjegmcnvb6NfD1neP
 hZH1f7j84RzSvt1lBu8KeNTtvDz6hST+FF6UJhUs025GptYJWxEjYsU2Q2txihWX+leL
 X7YglK/A8ktBGGGOW7RThzi8jIxhXvimabq4oFXk6SnkkjLFW8Bo7pm8njlo/QTRMOOG
 YWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718181073; x=1718785873;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AK4TGqSjjB40y8fmZJ44IyeI64N3R1XfTvfluZXkmSM=;
 b=WSDQSNt/6TwLDKZLJdUY1VypN2KQosuxQ3da9WkMxiNbNj9x11gJlsopZ0t4JXe2Wz
 M5nZjYw4iat2rFLoDdwtBDda9bL8ef+YmSuAtPCMbxXdUMxXz8X5YlGp+MwlO2/F7mUg
 noW6sBWObTnpp124c1jYxYSayVZaMsbWu+dUvYLa/FkKHzof3A7OPyFa0zrWkaM/VTkZ
 bJo0gPV6riohuhymQrRBdNSTVwIQg0K32lE9HJ6AZlEHMgWlDf57q0IQa5J58LXFK74a
 J3c2nnkEa2xkP4VsQSa/DHjoIrLJtol5bQqyUHp2AhddAP/HRKIfFkbQcGS+aLIfQXHU
 FhPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxjWwuDwsmP9q9pivLySpz7g5+WvhcwG4Gm98e9Z66wScJzhltD7senD8BLbbwvtlrs2wxeci2MNESkwAWqYIpjoWcDOydyJmjYr6TpSCl
X-Gm-Message-State: AOJu0Yy6l1QYcQYb6ivXAFenkcnYudsV2v/Mr+bs11qciYMPK0cqVzgX
 XeWSfjuNsO3uD7BCOhP2FCkv6UK3qDy2Fh7f5MIU4IXWLAY7YTyvExQ0PSCu8BPvsnqtut5vLz1
 tYWbvWjFldIcrx0CI+VMzyq7kGwm3D9VvWNiReA==
X-Google-Smtp-Source: AGHT+IFdVgVihf4MmaN1XEn9h9Ixbp9+ZsNMJGGhiEpC13jkv5QfaF4bLHL7sZmWC4CawHllZ8xWU5fU04nZMosDPgU=
X-Received: by 2002:a25:ad60:0:b0:dfb:9e6:5894 with SMTP id
 3f1490d57ef6-dfe68920559mr1030557276.43.1718181072766; Wed, 12 Jun 2024
 01:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
 <6f51224a-a7cd-4774-827a-967a4f4b38ee@quicinc.com>
In-Reply-To: <6f51224a-a7cd-4774-827a-967a4f4b38ee@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 11:31:01 +0300
Message-ID: <CAA8EJpr6v6vToYGc0MBU=SXHEoFOhLTLgs2QAS4JD_c23+8hDg@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable
 calls
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

On Wed, 12 Jun 2024 at 03:04, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> > In consequent modeset calls, the atomic_pre_enable() will be called
> > several times without calling atomic_post_disable() inbetween. Thus
>
> Hi Dmitry,
>
> Just wondering, where are you seeing multiple pre_enable() calls without
> a post_disable() happening?

I think that was with me hacking around, so the commit is indeed incorrect.

>
> IIRC, the msm commit_tail always calls commit_modeset_disables() before
> the commit_modeset_enables(). Also, doesn't the pre_enable() and
> post_disable() only happen once for bringing up/down the bridge?

I don't know if you mean it, but they are called each time the output
gets disabled and then enabled again, e.g. during modeswitch.

Last, but not least, I'm planning to land the HDMI rework ([1]) once
the drm-misc-next is merged into msm-next ([2]). This makes this
commit obsolete.

[1] https://lore.kernel.org/dri-devel/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org/
[2] https://gitlab.freedesktop.org/drm/msm/-/merge_requests/118


>
> Thanks,
>
> Jessica Zhang
>
> > iframes will not be updated for the next mode. Fix this by setting the
> > iframe outside of the !power_on check.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 3c6121c57b01..fb99328107dd 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >               msm_hdmi_phy_resource_enable(phy);
> >               msm_hdmi_power_on(bridge);
> >               hdmi->power_on = true;
> > -             if (hdmi->hdmi_mode) {
> > -                     msm_hdmi_config_avi_infoframe(hdmi);
> > -                     msm_hdmi_audio_update(hdmi);
> > -             }
> > +     }
> > +
> > +     if (hdmi->hdmi_mode) {
> > +             msm_hdmi_config_avi_infoframe(hdmi);
> > +             msm_hdmi_audio_update(hdmi);
> >       }
> >
> >       msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> >
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
