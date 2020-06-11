Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B641F6A18
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 16:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5256E08C;
	Thu, 11 Jun 2020 14:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13B36E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 14:35:02 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id u17so3504104vsu.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYtkvOUUq+F5r82ywOVrxc+PmLG4PLG1lF6L9X8WFAQ=;
 b=JwFAosiRGgcrMccXp1IcrdjBYmsOftrJJLrKaDYIaNTLD9IBnNdJ/9+Ge95yVw1pJa
 eF10R5r9IN/uc14Ot157EujMysw2LUwRvzGGFjvQj442e3rJwy2e5HV86KQ59kiP6wuB
 K6NfRIJ5BQPDixgmT9dpTvt1o6OnC0PEQk1t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYtkvOUUq+F5r82ywOVrxc+PmLG4PLG1lF6L9X8WFAQ=;
 b=GnLyXD9uR3w3vfL9v7mDyEH2f+TbwwSrpzzGCNChaPs9a8OO0PG9NdRAePJaxVOyy9
 OBARQqkwaFyQ9J304pAYH43uz1CuimEh9wKb4iHlanwfTBcczgRmBiPUjyBPI+kETEPp
 lkeYLG0e1qsiA5wS6znFxGWKKQQLk45JmffOKtedVt8JbsETi/5i6bP39G5QugyqRf68
 9XVZhDKp3Nq0TiHfCzMuBx3gwZfjJnWm0T1qDp7LY0BI7eX5R+F/flGQzCjBnRQ5wrvt
 gZ14idO+pJx9eebmtOVGokBPnMelDoC7TcVvCjbdqeVdm9lfRbcfa/4y1znwUZG7efkb
 3xPA==
X-Gm-Message-State: AOAM5302V4MnzkYYNvLnq+kLKOmIwbM+/A4hr9FbvhhD25UHR0gxX1ET
 Kry7Yc87nbTA06WpGbP97Qeev4PswDc=
X-Google-Smtp-Source: ABdhPJy12cyJ41EZYjUty6z6WUekaj+ntpNSCWdc29te5SiTg6mTwkcMdNu04KXWhj3jIybXk4Axrg==
X-Received: by 2002:a67:7914:: with SMTP id u20mr6348049vsc.102.1591886101471; 
 Thu, 11 Jun 2020 07:35:01 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id f138sm473253vke.54.2020.06.11.07.34.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 07:34:59 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id m25so3503977vsp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 07:34:59 -0700 (PDT)
X-Received: by 2002:a05:6102:20c8:: with SMTP id
 i8mr7101389vsr.106.1591886098468; 
 Thu, 11 Jun 2020 07:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
 <20200608104832.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
 <159186950406.242598.11120838219466948342@swboyd.mtv.corp.google.com>
In-Reply-To: <159186950406.242598.11120838219466948342@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Jun 2020 07:34:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt8AdnemnKLgxwkC-W=LWC06OU9x20RszXPLfAvUm9Og@mail.gmail.com>
Message-ID: <CAD=FV=Xt8AdnemnKLgxwkC-W=LWC06OU9x20RszXPLfAvUm9Og@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Check the regmap return
 value when setting a GPIO
To: Stephen Boyd <swboyd@chromium.org>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 11, 2020 at 2:58 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-06-08 10:48:35)
> > The ti_sn_bridge_gpio_set() got the return value of
> > regmap_update_bits() but didn't check it.  The function can't return
> > an error value, but we should at least print a warning if it didn't
> > work.
> >
> > This fixes a compiler warning about setting "ret" but not using it.
> >
> > Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 1080e4f9df96..526add27dc03 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -999,6 +999,9 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
> >         ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
> >                                  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
> >                                  val << (SN_GPIO_OUTPUT_SHIFT + offset));
> > +       if (ret)
> > +               dev_warn(pdata->dev,
> > +                        "Failed to set bridge GPIO %d: %d\n", offset, ret);
>
> GPIO %u because it's unsigned?

Sure.  I'll plan to spin tomorrow in case anyone else has any
feedback.  If any maintainer would prefer me not to spin and would
rather fix this when applying, please shout and I won't send out a v2.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
