Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECAC274982
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 21:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9016E8E5;
	Tue, 22 Sep 2020 19:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2E6E8E5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:52:30 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id z46so5858075uac.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgZ2mhARJlJ6/Rs9LtdYJ41hAXAoZKODwF/dLpRa5KQ=;
 b=i3GH6UriNhSCQrAYnkxAzxgU+zQWpRYExbWStOov/MrzOAGui4UIFg9ccABFz8Pp9h
 9+ZUriUsxb3hgbCutxOs/5hhbjoyvIE6XzMpcMDiCouN/TlLnZyW49yHPbNPKu2XOdtL
 0mBDJDr0iz8P+h0XwmMDSzERV+pXRHrNe/+48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgZ2mhARJlJ6/Rs9LtdYJ41hAXAoZKODwF/dLpRa5KQ=;
 b=HWRKQn4ydtv+7MnO3t1xshVeIXOJq9xr5wUJURVmpvuxkYEVBrCGuGRuymtnVKGasJ
 JKTb14RERxIlBJMnBaTA62NcAirg8Oiv7hK3Q7vel3QZEW7AdDwln58cLAAn3DO2Tzii
 3UcgcKTZzkJqzwKtQqQuYUjPtS4wj2iiR3GnRxqbyiL91YWX0VRS1ylymYri5PGFhUzq
 eVK+TwWsU2JzMxQ0I+RwMyrz0YKJ3vGboIOM+Imejk3Ypk2ZjXx0UBTWsnuIs05ENM85
 XHRV4jq1BdDpZNGQqVhbQxQdFQXe3gQarPTWMCUu0onUGfOTygJVvARPnHO8FbAqPqrZ
 n0Tw==
X-Gm-Message-State: AOAM533S7z6UxscsdaTBdy7dQWB6T8cFD0djZQFMZwXuaalVYIQXL2/Z
 kjNqepxulLEoxYORi7jlyJjgPLyaa8a9eg==
X-Google-Smtp-Source: ABdhPJzoeMw6DcP7Sghz0iq2aSpL1FHcU5jy6fAo2JJJL0iNe1tkMudSEHXa9aghgTwqyV7txLW/pw==
X-Received: by 2002:ab0:208d:: with SMTP id r13mr4474393uak.81.1600804349072; 
 Tue, 22 Sep 2020 12:52:29 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id o145sm1239660vkd.13.2020.09.22.12.52.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 12:52:27 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id q13so11012702vsj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:52:27 -0700 (PDT)
X-Received: by 2002:a05:6102:2f7:: with SMTP id
 j23mr4713665vsj.37.1600804347111; 
 Tue, 22 Sep 2020 12:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
 <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
 <1ada2daf-16f3-191f-ccc1-d3d7d0c319fc@rock-chips.com>
 <CAAMcf8Az5AVWNzMHuxXda5WUm4_E5QCwpgb2fVtaT0w2+cQELw@mail.gmail.com>
 <bd2d67ee-4023-ccde-3b2a-e88c3e076d12@rock-chips.com>
 <CAD=FV=Xv+CZhvXc583VTR2HpSEtkpho3aV5qG5_1-tKFgw_vaQ@mail.gmail.com>
 <CAAMcf8Btd4iTAVXXKd6knJdBcufTrKiX5UPas9ugV01p1ffHpg@mail.gmail.com>
 <CAD=FV=WfJJ4Tr4WZnFuUtz=XS1jHAUDfgnwy6qjyJ6iektTGDA@mail.gmail.com>
 <1af700b8-c4fb-4f3f-b56b-2602cb620aca@gmail.com>
In-Reply-To: <1af700b8-c4fb-4f3f-b56b-2602cb620aca@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2020 12:52:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WymHj1SXAkJHVMrsHimAq+mPYGRGXXe1wWzpyP+S9Kbg@mail.gmail.com>
Message-ID: <CAD=FV=WymHj1SXAkJHVMrsHimAq+mPYGRGXXe1wWzpyP+S9Kbg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: rockchip: hdmi: remove vop_crtc_mode_fixup to
 fix clock handling
To: Vicente Bergas <vicencb@gmail.com>
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
Cc: crj <algea.cao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 22, 2020 at 12:10 PM Vicente Bergas <vicencb@gmail.com> wrote:
>
> On Tuesday, September 22, 2020 5:26:17 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 22, 2020 at 7:52 AM Vicente Bergas <vicencb@gmail.com> wrote:
> >> On Tue, Sep 22, 2020 at 4:28 PM Doug Anderson
> >> <dianders@chromium.org> wrote: ...
> >
> > Here's the code:
> >
> >   rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
> >   adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
> >
> > Input clock is in kHz and DRM always rounds down (last I checked--I
> > guess you could confirm if this is still true).
> >
> > Imagine that you want an input clock of 999999 kHz and the PLL can
> > actually make this.
> >
> > DRM will request a clock of 999 kHz because it always rounds down.
> >
> > First:
> >   rate = 999 * 1000 + 999 = 999999 Hz
> >
> > Now we'll ask the clock framework if it can make this.  It can, so
> > clk_round_rate() will return 999999 kHz.  Note that, at least on all
> > Rockchip platforms I looked at in the past, clk_round_rate() and
> > clk_set_rate() always round down.  Thus, if we _hadn't_ added the 999
> > here we would not have gotten back 999999 Hz.
> >
> > We have to return a rate in terms of kHz.  While we could round down
> > like DRM does, it seemed better at the time to do the rounding here.
> > Thus, I now rounded up.  We should end up storing
> >
> >   (999999 + 999) / 1000 = 1000 kHz
> >
> > Then, when we use it in vop_crtc_atomic_enable() we don't have to do
> > any more rounding.
> >
> > I guess it's possible that the problem is that the function is
> > starting with an input where it knows that "adjusted_mode->clock" was
> > rounded down and it ends with it rounded up.  That shouldn't cause
> > problems unless somehow the function is being called twice or someone
> > else is making assumptions about the rounding.  You could,
> > potentially, change this to:
> >
> >   adjusted_mode->clock = rate / 1000;
> >
> > ...and then in vop_crtc_atomic_enable() you add the "999" back in, like:
> >
> >   clk_set_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
> >
> > That would make it more consistent / stable.  Does it work for you?
>
> Hi Douglas,
>
> i've tested this as suggested:
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1181,7 +1181,7 @@
>          *    this in the actual clk_set_rate().
>          */
>         rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
> -       adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
> +       adjusted_mode->clock = rate / 1000;

You'll also want to change the comment above.  Specifically it says
that we're storing the rounded up state.


>         return true;
>  }
> @@ -1380,7 +1380,7 @@
>
>         VOP_REG_SET(vop, intr, line_flag_num[0], vact_end);
>
> -       clk_set_rate(vop->dclk, adjusted_mode->clock * 1000);
> +       clk_set_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
>
>         VOP_REG_SET(vop, common, standby, 0);
>         mutex_unlock(&vop->vop_lock);
> and it also works fine.
> Should i sent a V2 of this patch series including your approach?

That would be good w/ me.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
