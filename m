Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C55257F1
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 00:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B93410E20D;
	Thu, 12 May 2022 22:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFD210E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 22:45:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ks9so12985638ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Jt3cP1a7pSTmIordOsQBiND5m8bbi2YpKIrE+mPhkM=;
 b=fqLHlnbObR2B44qlvG2vcl1goZgmgi7lfvQPG31LMzu9dt0+k98fCuYxRp94SkCDAO
 8T//3rqQrm8abKiJG3ZpIqAEadAUaaZKBzJ1E5YeB616jpa3OcM1h/xN0LwxtbEK8ceX
 K8z+UHj0qDRBrbvGthUjD4T+4NAKxStiQFaEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Jt3cP1a7pSTmIordOsQBiND5m8bbi2YpKIrE+mPhkM=;
 b=R3sjtEGwkC0aLLjGBKCDAyeP6Z1ZAg4L0IwfFt6RicClEc04J6e+2+C9UjGwi/h9KM
 x5NeYUlo+fG5TPOLNkUv05gq3GVjt69HwmdqJ887y0SBbRgl0om4P8lw1stIVSPPQJmd
 iF+zjIwYN2LABE6M51ojwqIIlIY6XJXzjvu4kcKIh9eqj+7fioLQ/g2WOX9ogciA7R2/
 zRqv8oHAIrXBMMlbFOR23024nHFZNfz+QxF4OkI8WxFrjdUUg7eCyAEhUzYvZNAT6UHe
 6Lt82H6pVDR1KJjF/KQ58uWOscOIl890NmX4cb9aP0JhecLIY9yPE3fMWdFprIsl6cNv
 NCaA==
X-Gm-Message-State: AOAM533joPBMZVLY9utLfZ21Zc6FeAwbGBJospYjKiRAZlQ36MYATy0o
 xUAkXDzM+1Z3son4xWB/FfaRNFxpyCDyzE54
X-Google-Smtp-Source: ABdhPJwpegYdWWgfpd8ZHZmBVejbQ8UnpecF7BT3rf/2oC19Y8RRlywkOlseswAYIwUVIw5rmhrBqQ==
X-Received: by 2002:a17:907:60cf:b0:6f4:5128:233b with SMTP id
 hv15-20020a17090760cf00b006f45128233bmr1899750ejc.239.1652395512607; 
 Thu, 12 May 2022 15:45:12 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 s3-20020a50d483000000b0042617ba63d6sm141784edi.96.2022.05.12.15.45.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:45:11 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id f2so2126669wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:45:11 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id
 q13-20020adff50d000000b0020ae09600efmr1411987wro.679.1652395510552; 
 Thu, 12 May 2022 15:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
 <dd62b8a7-43b9-364a-a427-94d621648012@linaro.org>
 <a721e2e9-934e-3028-cb1a-047f6d5c5b1e@quicinc.com>
In-Reply-To: <a721e2e9-934e-3028-cb1a-047f6d5c5b1e@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 May 2022 15:44:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_dfCzcW6kP9zH=pxOUAioTMwh7=0-_=zSAkX9hurZmg@mail.gmail.com>
Message-ID: <CAD=FV=U_dfCzcW6kP9zH=pxOUAioTMwh7=0-_=zSAkX9hurZmg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dsi: don't powerup at modeset time for
 parade-ps8640
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 12, 2022 at 3:34 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 5/12/2022 3:16 PM, Dmitry Baryshkov wrote:
> > On 13/05/2022 01:00, Douglas Anderson wrote:
> >> Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> >> time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> >> chip to fail to turn the display back on after it turns off.
> >>
> >> Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> >> handle the new power sequence. The Linux driver has almost nothing in
> >> it and most of the logic for this bridge chip is in black-box firmware
> >> that the bridge chip uses.
> >>
> >> Also unfortunately, reverting the patch will break "tc358762".
> >>
> >> The long term solution here is probably Dave Stevenson's series [1]
> >> that would give more flexibility. However, that is likely not a quick
> >> fix.
> >>
> >> For the short term, we'll look at the compatible of the next bridge in
> >> the chain and go back to the old way for the Parade PS8640 bridge
> >> chip. If it's found that other bridge chips also need this workaround
> >> then we can add them to the list or consider inverting the condition.
> >>
> >> [1]
> >> https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> >>
> >>
> >> Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> >> time")
> >> Suggested-by: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> Yes, I think this is a better solution than a full revert
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> I am curious to know why this doesnt work for parade but will not hold
> this patch back for that. We are initializing and turning on DSI PHY now
> before turning on the bridge chip which is actually better as we are
> putting PHY in a good state.
>
> So this should have been better, but somehow doesn't work.

I can't really explain it, but mostly because the Parade chip is just
a big black box. There have been several times when an OEM using this
bridge chip had one problem or another with getting the display to
turn on, then the parade FAE would make some magic tweak to the
firmware and it would be fixed. The current way that the Linux driver
is working is with pretty much zero configuration so I think this chip
bakes in a bunch of assumptions about the timings / signal coming from
the MIPI DSI side. It doesn't surprise me that changing the order like
this would confuse it.

In theory I believe the Parade chip can run in a less "automatic" mode
where everything is configured and controlled by Linux. I'd really
have preferred if we could have gotten that done, but it didn't end up
happening. :(

-Doug
