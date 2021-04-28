Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24736DD88
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836E36EBFE;
	Wed, 28 Apr 2021 16:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010C86EBFE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:51:11 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a30so4358614qvb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7bjsRegze0J8KMBLsd6S1kBXzifIu76DMKQBA84MfE=;
 b=H6GvR/jJOzxy5yvUfCUkF+EMKldJel4VTzuxpNzjmhRH8YjlZLt2EzcmEoB9kuRTpp
 J+S1tttlyYfNfXCYv1VnThpaRAKe35vjhUfbxu7lWEsG6xkD6fpttoWrTCDJyaB4s1yh
 qpsFpp1ULXf6O5GRNrGy8VZodsPVr2ptimptY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7bjsRegze0J8KMBLsd6S1kBXzifIu76DMKQBA84MfE=;
 b=HIdVZDRUhcF/V77Kq3wmGLMIqNW8ZHv+vGuQH0CMmOD2GOoToV50va6WWr9+JBzZyL
 2Qtw2NusW2Z86QtlOunVnTiQR4TvgYCCtsrXEC7Kx/dTisEXxy1ujzJWT1A6yrtn5tjE
 Qt83p5LIydtnwVsDTtOy8uCVJXgGsMFgfasnWKVgxTSX0jArD0e0bqlXWE51OxA7FHmO
 c9/Z3+m2vZ7vWSrZSFYUR9CjThxR8NFAbVHYo6hqTadpCh35U5BM3L56Bp11bjN0rKdn
 mskRGtTbD3vY0PKYVdq+q60YjqeoeiDJucU5d6yRI1zQx2Hjt2Ho9A4iWTDQV4vcQO4F
 Nwfg==
X-Gm-Message-State: AOAM532K9fggw2stWdQnl8tjLVT3m6mdA1HfmX7vwAxDtmUCC3Ii1o2j
 CBZnT3eKmLx2hNCmsJH0OHG4YsdQl9dk2A==
X-Google-Smtp-Source: ABdhPJzDc4ebR4gB07DGfMQgUweJUUJWLfG3TqHClym/ke74IxhohgcVxis1NKz3ZRAel2Adys6dVg==
X-Received: by 2002:a05:6214:12d0:: with SMTP id
 s16mr18035728qvv.60.1619628670838; 
 Wed, 28 Apr 2021 09:51:10 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id 198sm208280qkf.20.2021.04.28.09.51.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:51:10 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p126so21113712yba.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:51:09 -0700 (PDT)
X-Received: by 2002:a25:778d:: with SMTP id s135mr31447093ybc.21.1619628668908; 
 Wed, 28 Apr 2021 09:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.18.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
In-Reply-To: <20210423095743.v5.18.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 28 Apr 2021 12:50:30 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLtEF4VbhOPEJGNj2PnEE4Jk-BBtpLF_CrxFEhzF4f+Rg@mail.gmail.com>
Message-ID: <CAOw6vbLtEF4VbhOPEJGNj2PnEE4Jk-BBtpLF_CrxFEhzF4f+Rg@mail.gmail.com>
Subject: Re: [PATCH v5 18/20] drm/panel: panel-simple: Cache the EDID as long
 as we retain power
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> It doesn't make sense to go out to the bus and read the EDID over and
> over again. Let's cache it and throw away the cache when we turn power
> off from the panel. Autosuspend means that even if there are several
> calls to read the EDID before we officially turn the power on then we
> should get good use out of this cache.
>

I think i915 caches the edid once on init and never refreshes it
(assuming no hotplugs). That said, I think it makes sense for a more
conservative approach in panel-simple.


> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a12dfe8b8d90..9be050ab372f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -189,6 +189,8 @@ struct panel_simple {
>         struct gpio_desc *enable_gpio;
>         struct gpio_desc *hpd_gpio;
>
> +       struct edid *edid;
> +
>         struct drm_display_mode override_mode;
>
>         enum drm_panel_orientation orientation;
> @@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> +       kfree(p->edid);
> +       p->edid = NULL;
> +
>         return 0;
>  }
>
> @@ -510,15 +515,13 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> -               struct edid *edid;
> -
>                 pm_runtime_get_sync(panel->dev);
>
> -               edid = drm_get_edid(connector, p->ddc);
> -               if (edid) {
> -                       num += drm_add_edid_modes(connector, edid);
> -                       kfree(edid);
> -               }
> +               if (!p->edid)
> +                       p->edid = drm_get_edid(connector, p->ddc);
> +
> +               if (p->edid)
> +                       num += drm_add_edid_modes(connector, p->edid);

I suppose this would keep banging on the ddc if drm_get_edid()
continuously returns NULL, but maybe that's desireable (it'll succeed
sometime in the future)? At any rate, this is an improvement on
current behavior so it has my vote.

Reviewed-by: Sean Paul <seanpaul@chromium.org>

>
>                 pm_runtime_mark_last_busy(panel->dev);
>                 pm_runtime_put_autosuspend(panel->dev);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
