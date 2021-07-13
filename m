Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD263C6826
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 03:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFA789811;
	Tue, 13 Jul 2021 01:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA4289811;
 Tue, 13 Jul 2021 01:38:52 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id w13so6549172vsa.3;
 Mon, 12 Jul 2021 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVRoZz+2KZUE01RCl0zcI7r1nciW52XhEXHIAydI07s=;
 b=usFkAnZeCrSGtXvu1Y8dMHuJA2eouw7ILheGbnV+sFCegmKn5HTPJAPen3DsFLR6BP
 zLozZPA6LqWpdACeZI9kQYLd3smukMrdawmnBRRV+POXT1N7CUoCELlqwZ6SUlzBVO5N
 lXnBQJyZfqezmP5vzr6O2ZXPiqvD+Dl1iwJ23vTnBRFQWlaw8tVEIqnn+hCDNtgHRoM0
 z5fxtLrcfNk0qx8+anefIjthpGgPNZsJXDGnlp4XR2rdd+NvgzpnWxkMJlUI/i05Zkdm
 tdCMsZEkP0EPZ0Rykte/7HYCflhoSxXjb1uF0tsrf+sj8Mec8ds8tP2ufVwbbszCcdag
 jl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVRoZz+2KZUE01RCl0zcI7r1nciW52XhEXHIAydI07s=;
 b=G+R3ZtT8K4DnhTN5fFmg83JwmLtYv5gp6u9yjsaDu4tfPIAXq056NVVh8Lgr2fJ3Nv
 Exqp1Cj1S/u0qJVSewvf33MeKJfAhscvO8zGPtdDthLkPW3z0IdMH40qhG1VqVm8tPds
 7/ObT59zuYhQPdb9OvUGZUltn+K3pJ3YAkSKGKvo0OlpGshZSliyJiyKxNQUYbsL0Y1N
 hU4cu01gyRKrvHIBHWMVlNBp66AmKDxaF/+nU6kT85/tCeYh3coL8647BaqKrno0gsdP
 D3a9yw6iHiM91fE/llXA3gjsvtSTlflJU0LoNEL9hP1zpYz+Hfaw5z0oE/c7lqEW8Dhf
 Agfg==
X-Gm-Message-State: AOAM5316DKLur1ZgTvwQ5Dl6oWsi+Tl84YsMKKh39i/sIf6Mz/Hk5UM5
 wPl18YCHGi5UXiWUioiCo8c+pvJ+17ms4dzxmf0=
X-Google-Smtp-Source: ABdhPJwiJvHoN1KeOA+yHTm5cOf0dNXY5PwMTenqd7lD/48NL0Y5MQRaddEnECPmspaIE+NqPRaUpkqa0nCvi1EXLPU=
X-Received: by 2002:a05:6102:732:: with SMTP id
 u18mr2935020vsg.14.1626140331187; 
 Mon, 12 Jul 2021 18:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210711055003.528167-1-jim.cromie@gmail.com>
 <20210711055003.528167-2-jim.cromie@gmail.com>
 <e9f8186b3b96ba909f156fd750ba0aaf3d60a5fa.camel@perches.com>
In-Reply-To: <e9f8186b3b96ba909f156fd750ba0aaf3d60a5fa.camel@perches.com>
From: jim.cromie@gmail.com
Date: Mon, 12 Jul 2021 19:38:25 -0600
Message-ID: <CAJfuBxyRvPbjBQ0dVL5g9SL=hRgKxNKaadb5cxeEoEWt56k-Gg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] drm_print.h: rewrap
 __DRM_DEFINE_DBG_RATELIMITED macro
To: Joe Perches <joe@perches.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Jason Baron <jbaron@akamai.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 11, 2021 at 10:17 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2021-07-10 at 23:49 -0600, Jim Cromie wrote:
> > whitespace only, to diff-minimize a later commit.
> > no functional changes
> []
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> []
> > @@ -524,19 +524,24 @@ void __drm_err(const char *format, ...);
> >  #define DRM_DEBUG_DP(fmt, ...)                                               \
> >       __drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> >
> >
> > -#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)                                        \
> > -({                                                                                           \
> > -     static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
> > -     const struct drm_device *drm_ = (drm);                                                  \
> > -                                                                                             \
> > -     if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))                        \
> > -             drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);       \
> > +#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)                \
> > +({                                                                   \
> > +     static DEFINE_RATELIMIT_STATE(rs_,                              \
> > +                                   DEFAULT_RATELIMIT_INTERVAL,       \
> > +                                   DEFAULT_RATELIMIT_BURST);         \
> > +     const struct drm_device *drm_ = (drm);                          \
> > +                                                                     \
> > +     if (drm_debug_enabled(DRM_UT_ ## category)                      \
> > +         && __ratelimit(&rs_))                                       \
>
> Though I don't really see the need for the change, the typical style
> has the logical continuation at the end of the test.
>

yes I caught that late, old habit, hard to break.
That if-statement is altered as part of HEAD+2
    drm: RFC add choice to use dynamic debug in drm-debug

which replaces drm_dev_printk with drm_dev_dbg
(which calls pr_debug in DRM_USE_DYNAMIC_DEBUG)


>         if (drm_debug_enabled(DRM_UT_ ## category) &&                   \
>             __ratelimit(&rs_))                                          \
>
>
