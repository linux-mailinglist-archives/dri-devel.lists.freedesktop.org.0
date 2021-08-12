Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9A3EA829
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 18:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C546E42D;
	Thu, 12 Aug 2021 16:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994686E42A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 16:00:29 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id v2so1303886ilg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkJ9eY9sNpdQyMVe+0pcG6m3ooB5K5M6INJoQWT+o/s=;
 b=GjuNVqDaRiqBz4zyK3V+2n5ScpxGtvZN3wriHUi73F3HvZgp8MxBgFES6Be6wbG5m0
 GSxHwamV94HZmZTH8PfGJhxOIGpstPYtiq6pZsX0M7UqSaCCe1EiGRggq5unN6IQSwxU
 Jj9XsqDEaiovSVkXYaqxVSyDGOCN4INNyRZ3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkJ9eY9sNpdQyMVe+0pcG6m3ooB5K5M6INJoQWT+o/s=;
 b=bOHorDoHXk5Oy03Nv64QX73x1GVvGJRoxH/r1H+LOQddX6d9ILFPxw6PXv+DK6GJbB
 +AA6D3fXWVHCZ8JV8GkSwT3qyycEuJAXGpzGfNOvOhl10Gq8m7x4q0615xCRhnNnOTgN
 F2ab4lPvpE4VNBCKDG77BT2RIWSU4JJH/R9H0rp0sLXUvYm7+ro6UnAp8Zn4WeN/16/G
 BxVcy+yCbj96Xq8R8MEfTXwJsi76NAsWoGsPqWKZefgY1uUadZ8lF/3CMr7wbramIxhe
 5WqhwRT+rHWDwK/6FGQxvxjvlIM7lDxi8jmXS/habSrAqqmX6lWKkjo9jociObLbqETc
 KZMw==
X-Gm-Message-State: AOAM53228yVBz9qu6ZR4Acbtm7B1p61+CXUTrrgnC5W3J/ucJce55pU7
 HHki8Q5Q6xOmwbsvALbFtK6IlIXF7BjbjQ==
X-Google-Smtp-Source: ABdhPJxYhu4k8we8gExfzrlAs9nNK1VCtaf64zIzJbEYTCN2KXRt6rdihq3acj8lwmidtgfsGwEKbQ==
X-Received: by 2002:a92:6408:: with SMTP id y8mr3485185ilb.84.1628784028648;
 Thu, 12 Aug 2021 09:00:28 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id x6sm1517078iop.30.2021.08.12.09.00.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:00:27 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id x10so9055769iop.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:00:27 -0700 (PDT)
X-Received: by 2002:a05:6602:713:: with SMTP id
 f19mr3710787iox.140.1628784026906; 
 Thu, 12 Aug 2021 09:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210730212625.3071831-1-dianders@chromium.org>
 <YQmp3mGpLW+ELxAC@ravnborg.org>
 <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
 <YRTsFNTn/T8fLxyB@ravnborg.org>
In-Reply-To: <YRTsFNTn/T8fLxyB@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 09:00:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UiATFdiYbrAtinmu3BwO=XoOLaWBkypxRwm+GqfQEhyg@mail.gmail.com>
Message-ID: <CAD=FV=UiATFdiYbrAtinmu3BwO=XoOLaWBkypxRwm+GqfQEhyg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>, Linus W <linus.walleij@linaro.org>, 
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

On Thu, Aug 12, 2021 at 2:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Doug,
> On Mon, Aug 09, 2021 at 03:18:03PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 3, 2021 at 1:41 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Fri, Jul 30, 2021 at 02:26:19PM -0700, Douglas Anderson wrote:
> > > > The goal of this patch series is to move away from hardcoding exact
> > > > eDP panels in device tree files. As discussed in the various patches
> > > > in this series (I'm not repeating everything here), most eDP panels
> > > > are 99% probable and we can get that last 1% by allowing two "power
> > > > up" delays to be specified in the device tree file and then using the
> > > > panel ID (found in the EDID) to look up additional power sequencing
> > > > delays for the panel.
> > >
> > > Have you considered a new driver for edp panels?
> > > panel-edp.c?
> > >
> > > There will be some duplicate code from pnale-simple - but the same can
> > > be said by the other panel drivers too.
> > > In the end I think it is better to separate them so we end up with two
> > > less complex panel drivers rather than one do-it-all panel driver.
> > >
> > > I have not looked in detail how this would look like, but my first
> > > impression is that we should split it out.
> >
> > I certainly could, but my argument against it is that really it's the
> > exact same set of eDP panels that would be supported by both drivers.
>
> The idea was to move all eDP panels to the new driver.
>
> My hope it that we can make panel-simple handle a more more narrow set
> of panels. eDP capable displays are IMO not simple panels.

Ah! OK, this makes sense. I can work on this, though it might be a
short while before I can. I think moving all eDP panels out of
panel-simple.c to something like panel-simple-edp.c makes sense. It
will be a patch that will be very hard to cherry-pick anywhere since
it will conflict with everything but it should be doable.


> Likewise DSI capable panels could also be pulled out of panel-simple.

At the moment I haven't done much with DSI panels so I might leave
them in panel-simple for now. I'll evaluate to see how nasty it would
be for me to try this.


> This would continue to duplicate some code - but we have a lot of
> duplicated code across the various panels and the best way forward
> would be to implement more helpers that can be used by the drivers.
>
>         Sam - who is trying to recover form the deadly man flu...

Feel better!

-Doug
