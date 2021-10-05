Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DE422831
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 15:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1766E084;
	Tue,  5 Oct 2021 13:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01736E084
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 13:45:24 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id b78so3368716iof.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgOIE96eS9LCwM8xrp/VmKNjdKCV3OUl2f/h98/P2uA=;
 b=Ik3VtettYsKq8tCKrQwpYih9V4scwM/ap7YHv9s4H1bIAmcl44e9EYxcyile1eNDjn
 BA60YaZR+yP6XLpREe7X48XFqf2HQLVL/VgOaJfgs5/OE7V9Vp2DkS5EhbtvrYQNGIaV
 XqjjaHpSRqrz7gvM4MQOiNmfkXBcFX89TDXl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgOIE96eS9LCwM8xrp/VmKNjdKCV3OUl2f/h98/P2uA=;
 b=InipjDw6OSDh0RC3/9CrGZJ5zaC3cd742CxcFtZg2HSb0xcQNqW7nx4T+bqzcCsVih
 jfj8+C4SECbDCY7FBgi5DY9CCIWF4ROdrT5ObQd93EsPUyz6wHrKfmC0ETuprg5tBPdT
 9vVS/3f8MbiguzeFI7jCTUayNpY9J/nxJJIQL4ZwX0K9yNxcrPUZCyNCN6PqPFXeYj9H
 KqS1WwYopYeXyzF2QvSR95v0fHoQ2Y9UVTsbOYE9I4fzUuVFR+UUuNGfjvMiLLP8uOEY
 rZ0ZA8yGEhAJh97JXJrnPJvU9KFdR7HQQ61auvkqQ8s46+Oh+Z4zGkC2oHyFk11ELxOy
 IOAw==
X-Gm-Message-State: AOAM533ekGoLgaId+lYQcA0GVn6MRSq2rJdlyRu1s4bAgTfa/aUDM4PT
 oeizAJEjKGxUKqpZu2j4G4L8UsY5j5ZmHw==
X-Google-Smtp-Source: ABdhPJwERzki2XXRRmn1jezGlJeVWBRyIjO4U0jligeGtUm6d8Pn4bXGMXMe6/bmKIv5BOrK6UkMRg==
X-Received: by 2002:a02:7154:: with SMTP id n20mr2676712jaf.77.1633441523404; 
 Tue, 05 Oct 2021 06:45:23 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id k7sm2015574ilq.37.2021.10.05.06.45.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id p80so24345712iod.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr2725618jao.68.1633441521325; 
 Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
 <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Oct 2021 06:45:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEdnszvbRR3dPijbzvwENUnQi2Ai+Erg6e1L9fb24R9Q@mail.gmail.com>
Message-ID: <CAD=FV=VEdnszvbRR3dPijbzvwENUnQi2Ai+Erg6e1L9fb24R9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 kernel test robot <oliver.sang@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jani Nikula <jani.nikula@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, Oct 4, 2021 at 5:40 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Oct 4, 2021 at 10:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Douglas,
> >
> > On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > > the EDID") I broke out reading the base block of the EDID to its own
> > > function. Unfortunately, when I did that I messed up the handling when
> > > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > > when we went through 4 loops and didn't get a valid EDID. Specifically
> > > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > > passing an error-pointer.
> > >
> > > Let's re-jigger things so we can pass the bad EDID in properly.
> > >
> > > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > The crash is was seeing is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for testing! I'll plan to apply tomorrow morning (California
> time) to balance between giving folks a chance to yell at me for my
> patch and the urgency of fixing the breakage.

Ah, doh! I can't push until I can get a review tag from someone. As
soon as I see one then I'll give it a push.

-Doug
