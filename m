Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2313F8FB5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 22:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE776E8B8;
	Thu, 26 Aug 2021 20:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1E36E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 20:36:19 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id z2so4674466iln.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
 b=VZbC9LJdjvm7jBIyQ99wpnFBXRhf/RtavRPrmiWlpnBkMX5G2PEaCCDA0eZpnirKCK
 rYivpqDHjpUeYYuxVPPrkWyKbtMNCAR8T0WpQhagK1uWeMtJX+uXPlYF2ZPbRa0A29zC
 YImvafN9RqYP7O0dVpcGpMgKLCwbxPpZnMZ8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=of32+HsVJg8BjIpFCQkLFrsfUsAQLmJI9fq1/gQoEQc=;
 b=jhRxCV5ocIPPKlWRkaW+44qOEk5Pbd+SIZBlzXmXmEzN/9JyAbcrK6x2heM83XGTnR
 FYmxa7C1GCdHRxjWjvL9DIGAy9IXQ2FOkdFzhQTTuOfgOxA5j5G6dgqdjyJ7wjexILx3
 BiL67+OML9QABWSpxQhQRw96sGlZC3kwR4TXFPWCKDkeevrZ3eaIvA38z6CVTQ5YJRaY
 CvgO8t4fP4zAxGI63ei/o/svvvaiBlT2dBpLx2l0CaQBrZ7g3IuWWR1tZSHxg16I21dw
 kkpujmKPqWhmTfJIhGhYjqMW4N4HKOtUs/8MYZM/rdUwrDt7/DlapDAhiQGryiM4WuZ2
 JeMg==
X-Gm-Message-State: AOAM533xg1lL6Wnrx0rSep5DE/ABQufj1CLxzKYPSyRpTN85qf36HZyQ
 WvgLoRVFF4lho4QQqlwNFRhBPqSN2I5Exw==
X-Google-Smtp-Source: ABdhPJzjIiBsMyGVuT9uR8SkeHjmWl+H4+kbERepbnUI+Hg7ecPfA2s6ZosGUFIC2GkgmbHMS0TQhg==
X-Received: by 2002:a05:6e02:1b81:: with SMTP id
 h1mr4199734ili.240.1630010178370; 
 Thu, 26 Aug 2021 13:36:18 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id k21sm2127800ioh.38.2021.08.26.13.36.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:36:17 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id l10so4598272ilh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
X-Received: by 2002:a92:d304:: with SMTP id x4mr4140800ila.82.1630010176526;
 Thu, 26 Aug 2021 13:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
In-Reply-To: <CAE-0n50HohAKisSSsNijcxgZGHdBgt=sQbLE3b7C87wPkLJ0cw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Aug 2021 13:36:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
Message-ID: <CAD=FV=VnkJqJnGHawyqNS5+p6miWd44zR7FPXZWgLk5vo9fOYQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vara Reddy <varar@codeaurora.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Aug 25, 2021 at 6:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-07-26 16:13:51)
> > eDP panels might need some power sequencing and backlight management,
> > so make it possible to associate a drm_panel with a DP instance and
> > prepare and enable the panel accordingly.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > This solves my immediate problem on my 8cx laptops, of indirectly controlling
> > the backlight during DPMS. But my panel is powered when I boot it and as such I
> > get the hpd interrupt and I don't actually have to deal with a power on
> > sequence - so I'm posting this as an RFC, hoping to get some input on these
> > other aspects.
> >
> > If this is acceptable I'd be happy to write up an accompanying DT binding
> > change that marks port 2 of the DP controller's of_graph as a reference to the
> > attached panel.
>
> dianders@ mentioned creating a connector (and maybe a bridge) for the DP
> connector (not eDP)[1]. I'm not sure that's directly related, but I
> think with the aux bus code the panel isn't managed in the encoder
> driver. Instead the encoder sees a bridge and tries to power it up and
> then query things over the aux bus? It's all a little too fuzzy to me
> right now so I could be spewing nonsense but I think we want to take
> this bridge route if possible.
>
> -Stephen
>
> [1] https://lore.kernel.org/r/CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com/

The idea of modeling the connector as a bridge is something that makes
sense to me, but it probably makes sense to tackle that separately. We
don't need to block on it.

The whole DP AUX bus can also be tackled separately after the fact. It
really doesn't change things very much--we still have to find/attach
the panel. It just makes the panel probe in a slightly different way
and as a side effect gives the panel access to the DP AUX bus.

-Doug
