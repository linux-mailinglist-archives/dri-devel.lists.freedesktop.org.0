Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61D51C429
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47CD10E76B;
	Thu,  5 May 2022 15:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041C810E76A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:44:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so9486499ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=quJEpHcp/xQptAms2+pqVJe+BALCjwpz/XJpAyA2rOQ=;
 b=LtUWKtWwjEvzaJgwc+Y/Pc6ZtJYCCkbtEkwMj1kQLWR6QFKfyiqJlhG7vN+64C/904
 xP1Ersi2F/t8PVceS5QerFuVP5j/3gPomyLsiSTKmZBksKXz8GSeR+BShI51vCfXE6u3
 smVhw88erVhJUBtIhFgT/WIVkntmQ4UTU7dtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=quJEpHcp/xQptAms2+pqVJe+BALCjwpz/XJpAyA2rOQ=;
 b=MxtkAxOlgttLa2NVgelPjZ/Wo/2nliDEj0aMpIZJkfzmfKXXixWdGmSxSpoX2GCpFA
 Pysc9zrbzCuoNi8xNmXa+b3I2Db2pGJqBaIefgyySgZ+/NR9KuU4CK66AYy+BTY3dD5V
 I1FRf5jzVJuTh/uAdAM/uVEXJtSJTQ3gNeFwrjoMHEzNabp/2b3us2F10iJpksip1kym
 7cpGj5ewPFfpONT3/qxh3NzBOKrwTGSlzmtu11m5+ZxxWpE8/ljz7XQ2AtCuffuCQbGo
 VVfAySlC6yOCiMaA/o3ct4MaI5iNHe5dUGx7pp1WgfuuS1VTkdwbR1vRifPjKEwsfU4O
 a0IA==
X-Gm-Message-State: AOAM531pLIy9HSg+AbTWNBIRKVOQjITRKLv8DnMdO/XKbdj+MKAo1pW7
 pEIJFwW20chTU9Oi+DbutabrhnJUqe+mD3seDEI=
X-Google-Smtp-Source: ABdhPJz7BECtUJhQzb8KCzIZE4Xg/rSCYT+6VN0fn+0VR0Vs1zfbd4P9MGupVdHiVNLzOTWAiiGkbA==
X-Received: by 2002:a17:906:58d1:b0:6f4:6e61:dae with SMTP id
 e17-20020a17090658d100b006f46e610daemr17090122ejs.468.1651765492191; 
 Thu, 05 May 2022 08:44:52 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 c24-20020aa7c758000000b0042617ba63b4sm962486eds.62.2022.05.05.08.44.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:44:50 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so2892016wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:44:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr5718669wmq.34.1651765489131; Thu, 05 May
 2022 08:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
In-Reply-To: <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 08:44:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
Message-ID: <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville,

On Tue, Apr 26, 2022 at 11:47 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
>
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
>
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
>
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
>
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
>
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
>
> This patch originated in response to Kuogee Hsieh's patch [1].
>
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

I think this patch is fairly safe / non-controversial, but someone
suggested you might have an opinion on it and another patch I posted
recently [1] so I wanted to double-check. Just to be clear: I'm hoping
to land _both_ this patch and [1]. If you don't have an opinion,
that's OK too.

Abhinav: I think maybe you're happy with this now? Would you be
willing to give a Reviewed-by?

[1] https://lore.kernel.org/r/20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-Doug
