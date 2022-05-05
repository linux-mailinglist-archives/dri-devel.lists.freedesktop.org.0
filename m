Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187351CA4B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 22:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F4F10F052;
	Thu,  5 May 2022 20:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6098B10F052
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 20:12:00 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id s30so9509347ybi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 13:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3/V47f9z10aY8fNVMYn8QvpcDbl57QLdHc+QoKNSM4=;
 b=XwLN5A6p91UcSNtBV3WitaWWZCXN+PQ1ijSepyAK/JU+qrB0Frq0QEnuNNbDVPXoW9
 N+Tyfqqdmzjcsd2brB2ohjsV3pGVMZVK+lcAwija8hL4idjAWJXdMQrzaXoEmY9hixsz
 3mtT+CxXdet61uAxerkNaC9g8u8rIITBPYcWZdPJojCrwT28Jn1//PH1HoyUK/96LkFH
 tCGVOj9XLI477hArTy5vE2JLHV439HAss42zk8IquaCn7vWYnrjzVY0d6MUIEnw9G+I/
 /auDdJUncPXPmTSJgX02V6/zGvSFvam41/L7VADvMsLpRu8I01cT6egae7ejS/TCfKkE
 ji7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3/V47f9z10aY8fNVMYn8QvpcDbl57QLdHc+QoKNSM4=;
 b=FjdLaT+psMUr+n7wNlzluQoTnqC5UHJ4H4ipfrnsYkvq1GGeWDXHmzi+XFL7IzHISy
 1RQy+n6sXQRgLfxlJ3tAlKeXHvmjklkikJ0WcXPRj4byhPWF2nrWwnnrPABuVLyZQvyA
 8mN1fjRx9vNlfWmielTbypJvcakn/qVpIfN7cN5jbjn2UJseyKEL05DlYVMHyHjYtUd3
 TaPhIP1Se9zog67J26oxtjkSV02pU+jCMn+jYIB9HOZxrFsWBJykGzK+3ipV7/2iU0ib
 1QeB8iqNyIlfB+imlzGvz1QYvaQZUGJBKzcVpzcsfSzmtQH35lr/PcQPbaZNJj8r7bfJ
 PpjA==
X-Gm-Message-State: AOAM533pvauqKcDQLTgZc5mW560CMwGavAILxGtEEoj/1bzGEHmiPPox
 oJne3iSPJt71z+7NF0aKTuGFuD0zhzZjONZkZhVgfQ==
X-Google-Smtp-Source: ABdhPJwlb98UW3/pGaDYgW02qFbBFTz3qjiSA/ybeqhoTQ7mgT0cFwCIUDSnzBv+M/FkeEgh+eOVojR8YTDJx7Lvpeo=
X-Received: by 2002:a25:b1a5:0:b0:648:e230:aef with SMTP id
 h37-20020a25b1a5000000b00648e2300aefmr24299965ybj.175.1651781519563; Thu, 05
 May 2022 13:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
 <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
 <4186ab8f-d227-f2c7-ab3f-0729bb915f17@quicinc.com>
 <01852b37-faf7-c4ab-b159-e525c03d6e54@quicinc.com>
In-Reply-To: <01852b37-faf7-c4ab-b159-e525c03d6e54@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 23:11:24 +0300
Message-ID: <CAA8EJpo4aaoOu+5TbTJRQ9ExBKZH=dEHW5hVv9suk=+MkmopbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 at 20:30, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/5/2022 10:20 AM, Abhinav Kumar wrote:
> > Hi Doug
> >
> > On 5/5/2022 8:44 AM, Doug Anderson wrote:
> >> Ville,
> >>
> >> On Tue, Apr 26, 2022 at 11:47 AM Douglas Anderson
> >> <dianders@chromium.org> wrote:
> >>>
> >>> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> >>> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> >>> mode.
> >>>
> >>> A DP compliance test expected us to utilize the above fact when all
> >>> modes it presented to the DP source were not achievable. It presented
> >>> only modes that would be achievable with more lanes and/or higher
> >>> speeds than we had available and expected that when we couldn't do
> >>> that then we'd fall back to 640x480 even though it didn't advertise
> >>> this size.
> >>>
> >>> In order to pass the compliance test (and also support any users who
> >>> might fall into a similar situation with their display), we need to
> >>> add 640x480 into the list of modes. However, we don't want to add
> >>> 640x480 all the time. Despite the fact that the DP spec says all sinks
> >>> _shall support_ 640x480, they're not guaranteed to support it
> >>> _well_. Continuing to read the spec you can see that the display is
> >>> not required to really treat 640x480 equal to all the other modes. It
> >>> doesn't need to scale or anything--just display the pixels somehow for
> >>> failsafe purposes. It should also be noted that it's not hard to find
> >>> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> >>> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> >>> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> >>> display via a DP to HDMI adapter and that screen definitely doesn't
> >>> support 640x480.
> >>>
> >>> As a compromise solution, let's only add the 640x480 mode if:
> >>> * We're on DP.
> >>> * All other modes have been pruned.
> >>>
> >>> This acknowledges that 640x480 might not be the best mode to use but,
> >>> since sinks are _supposed_ to support it, we will at least fall back
> >>> to it if there's nothing else.
> >>>
> >>> Note that we _don't_ add higher resolution modes like 1024x768 in this
> >>> case. We only add those modes for a failed EDID read where we have no
> >>> idea what's going on. In the case where we've pruned all modes then
> >>> instead we only want 640x480 which is the only defined "Fail Safe"
> >>> resolution.
> >>>
> >>> This patch originated in response to Kuogee Hsieh's patch [1].
> >>>
> >>> [1]
> >>> https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>>   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
> >>>   1 file changed, 21 insertions(+), 5 deletions(-)
> >>
> >> I think this patch is fairly safe / non-controversial, but someone
> >> suggested you might have an opinion on it and another patch I posted
> >> recently [1] so I wanted to double-check. Just to be clear: I'm hoping
> >> to land _both_ this patch and [1]. If you don't have an opinion,
> >> that's OK too.
> >>
> >> Abhinav: I think maybe you're happy with this now? Would you be
> >> willing to give a Reviewed-by?
> >
> > Yes, I have no concerns with this approach from DP spec standpoint and
> > in addition, kuogee has tested this out and this does help us to pass
> > the tests.
> >
> > Although, I might be missing some historical context on why this is
> > not already done.
> >
> > But apart from that, LGTM. Hence,
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

This line got wrong quotation level, so it will not be noticed by
patchwork (and can be easily missed by other people too). Please
resend.

> >>
> >> [1]
> >> https://lore.kernel.org/r/20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
> >>
> >> -Doug



-- 
With best wishes
Dmitry
