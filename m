Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713A3696E1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47C6EC0A;
	Fri, 23 Apr 2021 16:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208C6EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:30:52 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id i12so18626257qke.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnPkOae3N3QNLfW2JXPw4qTg19P7LS7x3meffpeNsUc=;
 b=oOWzIy3mWuS6BWg8Zy0+TynqeZAiE3ZSt8ELRuOz1uAEN4ySjH+jCi7+4wq42lLCf6
 pWI21DpyBztpl1GpAjQ0VdUrs+7dOsKKgaUwYt3s0vy5q2UZ1TNduOSnPD4SoxJHEWfY
 5OltXJXVHWMShT/LiT6ZbueZcaIHry68371Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnPkOae3N3QNLfW2JXPw4qTg19P7LS7x3meffpeNsUc=;
 b=Bug47kjwK4Q/cHLVrw6oruGCSXIKL9n5yPIObS11LEhWT+E0E6jkHVzcnvtFmVZQ2S
 hzZZjvQCJT5HVCgHYGNm05Yo496eMnh+1ndfQCUYUX3GGlkBNGPANxr5QxsQlF/Lzgu8
 w117Knvht7Qn+8b/loQw4jsPaEZwJglD/9DpJ6rQWm9gnsco32NCcC9vl3DV5s3neHR/
 GIZee6G6FyoJF+sAblVbKXfGgMxXwvkFWCYorlOYqDmCU3MDGFYil68HIkH10U9uw1wY
 TsW/9800heM1/RPNMT7ZVWiyfwVqtGDV4dnCpcoZ8ZrEa4m/X9nSkXnWWj1opksVB3nA
 zI0w==
X-Gm-Message-State: AOAM530768ROfi2sd5oBWQRv5vp2HYaqiLCp+MTm0Fli5+45lH7wP9QS
 Oy9zQudlo6QbdNm+P+74Os898bzVhGodTw==
X-Google-Smtp-Source: ABdhPJxct1EnS1VxoR8K72np9FFpcOqPdPb21rDUGbWLJ/V09ta1vCNR295G3qEGWBGMbMCRjUi9uQ==
X-Received: by 2002:a05:620a:7d4:: with SMTP id
 20mr4850889qkb.58.1619195450244; 
 Fri, 23 Apr 2021 09:30:50 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id c2sm4709539qkk.2.2021.04.23.09.30.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 09:30:49 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 130so12484307ybd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:30:48 -0700 (PDT)
X-Received: by 2002:a25:2d0b:: with SMTP id t11mr2980774ybt.79.1619195448418; 
 Fri, 23 Apr 2021 09:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.24.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
 <YILx/iODs+DFWWwm@builder.lan>
In-Reply-To: <YILx/iODs+DFWWwm@builder.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Apr 2021 09:30:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhOKcSC5FPPZgXiqfFCYOu4iFGrhtrgfGz_ovT8Qi-6w@mail.gmail.com>
Message-ID: <CAD=FV=UhOKcSC5FPPZgXiqfFCYOu4iFGrhtrgfGz_ovT8Qi-6w@mail.gmail.com>
Subject: Re: [PATCH v4 24/27] drm/panel: panel-simple: Cache the EDID as long
 as we retain power
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 23, 2021 at 9:12 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:
>
> > It doesn't make sense to go out to the bus and read the EDID over and
> > over again. Let's cache it and throw away the cache when we turn power
> > off from the panel. Autosuspend means that even if there are several
> > calls to read the EDID before we officially turn the power on then we
> > should get good use out of this cache.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 40382c1be692..5a2953c4ca44 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -189,6 +189,8 @@ struct panel_simple {
> >       struct gpio_desc *enable_gpio;
> >       struct gpio_desc *hpd_gpio;
> >
> > +     struct edid *edid;
> > +
> >       struct drm_display_mode override_mode;
> >
> >       enum drm_panel_orientation orientation;
> > @@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
> >       regulator_disable(p->supply);
> >       p->unprepared_time = ktime_get();
> >
> > +     kfree(p->edid);
> > +     p->edid = NULL;
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
>
> But separate of this, shouldn't the driver have a pm_runtime_disable()
> in the remove path to synchronize the autosleep? Or is that not how that
> works?

Indeed! I'll add a patch to the start of my v5 (coming shortly) that
fixes this. Thanks for catching!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
