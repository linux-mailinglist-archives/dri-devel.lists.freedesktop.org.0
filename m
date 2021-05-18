Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE73879F3
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B946EB82;
	Tue, 18 May 2021 13:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3656EB82
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:29:17 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id t11so5536523pjm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+9uUXCGM1WRSLZSKiMJRcVlxa7yFZ11QeqDeoqK0ih0=;
 b=VkJlo6aDzmgedwuPJlD6/sR6xRtHX9hlA6a/sT70kxM2CZtzJyB8E/1f/uuQQL72jM
 RgSd6CTnJ2B8mkWBWA7T0biB/qWptdVWJ9CR01MoM8wSemX4pQcuioxOoGD8iMwxSqVl
 XQ+vV6CHG6cLAKBc+U65HZA+xTQ50ElmVQg9XEpUUFRoAx/RBNP8hb8+iQcsNgRNVq+O
 1C3RmUqfsqY3k3SB4L/KTblMT6dkmnA3dGlpLD0OyZ9iqFadqbftsKmdSguz3nBHpHTP
 1xWuNf7DlOd8Pt6G6kasTA8SpWbuGGeOJpGdag8TzGjNPizBOaQxbraSgTAundfiJsDM
 4Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9uUXCGM1WRSLZSKiMJRcVlxa7yFZ11QeqDeoqK0ih0=;
 b=Ft5a9D9W990aDChawDf0E1YfV4bxJ2UbJUL+UxXgioCrxo8weVnAfQqHSqXTfAOaZ3
 s+Bt5p0+pVUPycw8lZx5sHXHUStvgLVkPKQQCyt7HaLxipJY8R4fvb1ey/H221/6ZLNw
 +9in6LaB0MmpPksLv+EaKMgdsCh70kRt8RRitGT0dyfNV8hD3YcANcPDg/0Mldi5zkPe
 YzRdwnS+mSgS1wYUevNDt5/cui+VvBfA8uK9UD03ELH1sUmzKYtmmgnjw7rXnKTZT37/
 JDGdkX48LFitFRnwGWKJNikXio2KM3NvacTaQHBO0RFO+FOvR+Mz+In7t+HBbnhN4MoF
 ireQ==
X-Gm-Message-State: AOAM533ILOP4XMQLOix1LkbOXZGfMzEbXQjH0zNzB7CxqQpDNZA5FHiS
 noEoYLZh+X7pWW06Q65mLGwFS7NZSBqaiiKYchMNCg==
X-Google-Smtp-Source: ABdhPJyiRloyNEJhG1wQmfsOk1IFKsu7S1Qi/FL145KCqHGpn79hzewNqDX8wpkVthQLJYRuP/xASf05ED/bn9leiOU=
X-Received: by 2002:a17:902:4:b029:ee:8f40:ecbf with SMTP id
 4-20020a1709020004b02900ee8f40ecbfmr4596509pla.28.1621344556939; Tue, 18 May
 2021 06:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <YKOGogHasIyvF8nj@mwanda>
 <CAG3jFytpOb8KeNCjCJ7gq20LQK3UGA9PgGne+cR2kZdADS-Oxg@mail.gmail.com>
In-Reply-To: <CAG3jFytpOb8KeNCjCJ7gq20LQK3UGA9PgGne+cR2kZdADS-Oxg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 15:29:06 +0200
Message-ID: <CAG3jFytF9KToiQcNZpiVz7T-uAx6gHDcxSnc6MH7d3bqpWWz8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix a ternary type promotion bug
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it fixes drm-misc-next, applied it there instead.

On Tue, 18 May 2021 at 15:20, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Dan,
>
> Thanks for submitting this.
>
> On Tue, 18 May 2021 at 11:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The ti_sn_aux_transfer() function returns ssize_t (signed long).  It's
> > supposed to return negative error codes or the number of bytes
> > transferred.  The "ret" variable is int and the "len" variable is
> > unsigned int.
> >
> > The problem is that with a ternary like this, the negative int is first
> > type promoted to unsigned int to match "len" at this point it is a high
> > positive value.  Then when it is type promoted to ssize_t (s64) it
> > remains a high positive value instead of sign extending and becoming a
> > negative again.
> >
> > Fix this by removing the ternary.
> >
> > Fixes: b137406d9679 ("drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out pre-enable")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index bb0a0e1c6341..45a2969afb2b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1042,7 +1042,9 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
> >         pm_runtime_mark_last_busy(pdata->dev);
> >         pm_runtime_put_autosuspend(pdata->dev);
> >
> > -       return ret ? ret : len;
> > +       if (ret)
> > +               return ret;
> > +       return len;
> >  }
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> Applying to drm-misc-fixes.
