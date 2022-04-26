Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D24510A66
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 22:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AA110E534;
	Tue, 26 Apr 2022 20:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FC710E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 20:26:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p18so18579787edr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2511p8lKZKcGvrdWMgX+EBPJEHzSt9seRbYqac/RtCc=;
 b=hGaC+IKpJb4ZV+/ENuOXAUoomcMvR+upCE8ArlkpYy2b8mRmHTEsubcOgafG49YseP
 HkjfuuPrbfj0jJLzu8eNAa2qEfgNSd2/LiT0jOpAksb761IuBP5LFzmucDc7WpKcv2oz
 mU2cNpQEwya2VI/kRxFNNe1GpUFz8nIO94XqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2511p8lKZKcGvrdWMgX+EBPJEHzSt9seRbYqac/RtCc=;
 b=auILhzkFPAQTT5wi6UpJLuMsSvTJa/dSlK6/dQmxRmwKEOcnq2dj0NtioY/w9cod0X
 PrNVzFsWQTwYhUB14dvDIXpnyQJ9wptmKiE+rBvLNRNNpaFgCuQSIwX3p3Tr5tIJh1x0
 zI7xWbpod5bjBGRPhFmvN161ca0lgc0YJzc50Y7pV2Oy1E88VfyF9M8WmIoy7Z/eWGS0
 wK5apVcWNTzz4Rgiwdjgs7tTYdHowjLFh0ah2Kc/8ckEqu80y9K09qkpCy0f/hZS3Jcz
 Pe4WWbYqwyVdZkvl0kcRDGZGWnYB2ARSShj5JLmGPU+Vx9v9Ny7XG6LjdUHgcaHEZ5E3
 7F6w==
X-Gm-Message-State: AOAM531VJF9nzQ6a1W6NrJ0LNM7YnQoe14qzp/uNVfBXGQzSaZho57jk
 CTik59aoigrcSaGHUarWNVpqZUQ1EwyQr7tDA64=
X-Google-Smtp-Source: ABdhPJyH73pwe+EvlX9G4OkA94jP1uNg4BqTHD/6+OCejRo6/nD54dDNrU8Ypou0Z1jFG0IhA0zbFQ==
X-Received: by 2002:a05:6402:1bce:b0:425:bfaf:f20c with SMTP id
 ch14-20020a0564021bce00b00425bfaff20cmr24949242edb.359.1651004786469; 
 Tue, 26 Apr 2022 13:26:26 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm5347732ejn.130.2022.04.26.13.26.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:26:24 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id e24so7144383wrc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:26:23 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr11038520wrx.422.1651004783068; Tue, 26
 Apr 2022 13:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
 <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
 <517f71e4-785f-ef6f-d30e-fb18974eed57@quicinc.com>
In-Reply-To: <517f71e4-785f-ef6f-d30e-fb18974eed57@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Apr 2022 13:26:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xn_uTOxvwTZsKnQN4651T1OuZNd-EQG0WqvDsFPz+4hQ@mail.gmail.com>
Message-ID: <CAD=FV=Xn_uTOxvwTZsKnQN4651T1OuZNd-EQG0WqvDsFPz+4hQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 26, 2022 at 12:20 PM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Missed one more comment.
>
> On 4/26/2022 12:16 PM, Abhinav Kumar wrote:
> > Hi Doug
> >
> > One minor comment below.
> >
> > But otherwise, looking at this change this should work for us acc to me.
> >
> > We will test this out with our equipment and then provide R-b.
> >
> > Thanks
> >
> > Abhinav
> > On 4/26/2022 11:46 AM, Douglas Anderson wrote:
> >> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> >> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> >> mode.
> >>
> >> A DP compliance test expected us to utilize the above fact when all
> >> modes it presented to the DP source were not achievable. It presented
> >> only modes that would be achievable with more lanes and/or higher
> >> speeds than we had available and expected that when we couldn't do
> >> that then we'd fall back to 640x480 even though it didn't advertise
> >> this size.
> >>
> >> In order to pass the compliance test (and also support any users who
> >> might fall into a similar situation with their display), we need to
> >> add 640x480 into the list of modes. However, we don't want to add
> >> 640x480 all the time. Despite the fact that the DP spec says all sinks
> >> _shall support_ 640x480, they're not guaranteed to support it
> >> _well_. Continuing to read the spec you can see that the display is
> >> not required to really treat 640x480 equal to all the other modes. It
> >> doesn't need to scale or anything--just display the pixels somehow for
> >> failsafe purposes. It should also be noted that it's not hard to find
> >> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> >> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> >> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> >> display via a DP to HDMI adapter and that screen definitely doesn't
> >> support 640x480.
> >>
> >> As a compromise solution, let's only add the 640x480 mode if:
> >> * We're on DP.
> >> * All other modes have been pruned.
> >>
> >> This acknowledges that 640x480 might not be the best mode to use but,
> >> since sinks are _supposed_ to support it, we will at least fall back
> >> to it if there's nothing else.
> >>
> >> Note that we _don't_ add higher resolution modes like 1024x768 in this
> >> case. We only add those modes for a failed EDID read where we have no
> >> idea what's going on. In the case where we've pruned all modes then
> >> instead we only want 640x480 which is the only defined "Fail Safe"
> >> resolution.
> >>
> >> This patch originated in response to Kuogee Hsieh's patch [1].
> >>
> >> [1]
> >> https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
> >>
> >>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>
> >>   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
> >>   1 file changed, 21 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_probe_helper.c
> >> b/drivers/gpu/drm/drm_probe_helper.c
> >> index 819225629010..90cd46cbfec1 100644
> >> --- a/drivers/gpu/drm/drm_probe_helper.c
> >> +++ b/drivers/gpu/drm/drm_probe_helper.c
> >> @@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct
> >> drm_connector *connector,
> >>       const struct drm_connector_helper_funcs *connector_funcs =
> >>           connector->helper_private;
> >>       int count = 0, ret;
> >> -    bool verbose_prune = true;
> >>       enum drm_connector_status old_status;
> >>       struct drm_modeset_acquire_ctx ctx;
> >> @@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct
> >> drm_connector *connector,
> >>           DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> >>               connector->base.id, connector->name);
> >>           drm_connector_update_edid_property(connector, NULL);
> >> -        verbose_prune = false;
> >> -        goto prune;
> >> +        drm_mode_prune_invalid(dev, &connector->modes, false);
> >> +        goto exit;
> >>       }
> >>       count = (*connector_funcs->get_modes)(connector);
> >> @@ -580,9 +579,26 @@ int
> >> drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >>           }
> >>       }
> >> -prune:
> >> -    drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
> >> +    drm_mode_prune_invalid(dev, &connector->modes, true);
> >> +    /*
> >> +     * Displayport spec section 5.2.1.2 ("Video Timing Format") says
> >> that
> >> +     * all detachable sinks shall support 640x480 @60Hz as a fail safe
> >> +     * mode. If all modes were pruned, perhaps because they need more
> >> +     * lanes or a higher pixel clock than available, at least try to add
> >> +     * in 640x480.
> >> +     */
> >> +    if (list_empty(&connector->modes) &&
> >> +        connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> >> +        count = drm_add_modes_noedid(connector, 640, 480);
> >> +        if (_drm_helper_update_and_validate(connector, maxX, maxY,
> >> &ctx)) {
> >> +            drm_modeset_backoff(&ctx);
> >> +            goto retry;
> >
> > Do we need another retry here? This will again repeat everything from
> > get_modes().
> > The fact that we are hitting this code is because we have already tried
> > that and this is already a second-pass. So I think another retry isnt
> > needed?
>
> This will help cover the case of 4.2.2.6 but not fix 4.2.2.1.
>
> For 4.2.2.1, we will have 0 modes and so the original DRM fwk code of
> adding all modes <= 1024x768 will kick in.
>
> Now, in that list, we will still need to pick/mark 640x480 as the
> preferred mode.
>
> We still need IGT for that.

Are you sure you don't have those backwards? It seems like 4.2.2.6 is
the test case dealing with corrupt EDID and that's the one that will
still be broken, no? ...and corrupt EDID is still the case where we
have 0 modes.

In any case, let's see what people think about:

https://lore.kernel.org/r/20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

I've marked that one as RFC just because it seems like a bigger change
to existing behavior, though it still seems correct to me.

NOTE: reading 4.2.2.6 more closely, it actually looks as if we're
actually supposed to be able to try various video modes one at a time
until we find one that works (or land on 640x480). Seems as if we're
supposed to be able to try the higher resolutions one at a time and we
can tell whether the sink "accepted" it by seeing if SINK_STATUS goes
to 1? I have no idea how that works with all the Linux APIs, though.

-Doug
