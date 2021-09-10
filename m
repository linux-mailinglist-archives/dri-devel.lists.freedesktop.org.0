Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C7406729
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 08:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8116E977;
	Fri, 10 Sep 2021 06:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381686E975;
 Fri, 10 Sep 2021 06:21:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lc21so2025443ejc.7;
 Thu, 09 Sep 2021 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rc47DAFBHht81L63lYlo/o42HpBggaS7zV+MLv8YHOU=;
 b=mt+XVROdEcBet94DgbIDqgXpvSW1V0vYNer0g/o2djYKlUVVgVR7XUd+28W8meqtYG
 2d41LNkyOo7a9UMT+AJmsvjUdexV9OQZsqfDuvVjBta+rN+Iybo0ZGsVTvdt3BK6/Kc8
 qv+xT9hy1ie23o+iywxrztHG3mNNQqEQ1jtA0haVm5Opm6XFB1oDLfGRCGWRbnf3uIc1
 y67mFcTCqsBV2suY97RvRgrlOUO/0Vq+ePlB7oRzPcTeFEQgLYdrtvF1iozlmdsLKeH+
 bDR9rdBsdyNSqGRYxdmZq6f6WliTxJCFvULutddEi9xncCQttwmd6Tg6Pd5JhRJkNUtu
 VWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rc47DAFBHht81L63lYlo/o42HpBggaS7zV+MLv8YHOU=;
 b=E+G4gnfd31OkHmGQXtlWaWlX6UG48o/5Mceo4Oqukss0KIIkSq96FKL3ApbZmyUwQB
 eHFuEAEr5AT32CnpLjLmugXVKgx5hYtFFkEIAk6q4Sb/HcVnC6qCoHs1+ciKhtJ2+A9S
 2diViFRwjpzhvmz92mpVDaQOspa5DgKoJsth+BxQ4EtIiBUQB1Ctf+lhjNMw4loc+8z0
 3fEHRglCSknCsWERccinj6d9Jk+Xcs+aCK/M/G5lC8e7tBH9YfnaI1Acy4qv9DmP2LjN
 O5rIhmDJ+D6r9eQ43AMq9f6S/XvR3xsrBWDGiHfaWA9iWluVk8JWWbKUqHxASJd03vH0
 JLAg==
X-Gm-Message-State: AOAM533meNEcMpH59R4cCts3d3t2rapdY1lSCOMagpSPUjLHU51I3Qf5
 1NdjoiOoc7xlNwhh9W8CD9XyMcXl5A/5FSQzJyE=
X-Google-Smtp-Source: ABdhPJyuRbn3A5Hb/G7cmLmBaHLa+KxE5+F2SfZrwQ5Y6q6scNv90JW7ppqNtPbGgTNw168BUXOI2PSR6696qpKvoQ8=
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr7391165ejx.470.1631254864545; 
 Thu, 09 Sep 2021 23:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <YTj2Y0MKu51CZdbW@linux-uq9g.fritz.box>
 <CAPM=9twpHCGLh3nYeTF69woSFWpuWUT+Zk48YyOX3zzNLFLw+g@mail.gmail.com>
 <CAKMK7uEZv_YztMn5j0TWsakrRNdXk_ST3SUJRc_SVy08-THHSQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEZv_YztMn5j0TWsakrRNdXk_ST3SUJRc_SVy08-THHSQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Sep 2021 16:20:53 +1000
Message-ID: <CAPM=9tz3-xgzN78RDrOKmsWPkQwN1=whatJxU+mFBpOoX7GMQQ@mail.gmail.com>
Subject: Re: [PULL] drm-misc-fixes
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
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

On Thu, 9 Sept 2021 at 19:30, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Thu, Sep 9, 2021 at 5:35 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 9 Sept 2021 at 03:44, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi Dave and Daniel,
> > >
> > > here's this week's PR for drm-misc-fixes. One patch is a potential deadlock
> > > in TTM, the other enables an additional plane in kmb. I'm slightly unhappy
> > > that the latter one ended up in -fixes as it's not a bugfix AFAICT.
> >
> > To avoid messy merge window, I'm not pulling this until after rc1
> > unless there is some major reason?
>
> Christian misplaced a ttm fix, so we really want this. Maybe
> cherry-pick to drm-next and then drm-misc-fixes gets rebased instead.
>
> And yeah I dunno what do with our conflicts around merge window, maybe
> we're letting trees diverge a bit too much.

I've cherry-pick the ttm fix, the kmb fix should be somewhere else,
I'm not going to pull it in from there.

Maybe once rc1 gets out it can be rebased. Please nobody push to
drm-misc-fixes until post rc1 + a day or two.

Dave.
