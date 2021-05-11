Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C168037ACF8
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C42A6E7D5;
	Tue, 11 May 2021 17:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F956E7D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:19:11 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 t4-20020a05683014c4b02902ed26dd7a60so8008446otq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=go1LaTn+JyfnNbXmuN0CCBxYpt4cKSlPmbuS0BOCjb0=;
 b=J4uvkzvTwPOWZm01x9dBVdARTF4FC3M1Fw6NLUa6fADbc8UGlRb0heggAbMVyzPnw0
 Jv2YMdvUjfg2VbwFHUh0HuQcDmhwyZZvNh2qFFVvKZSiLPl7xweJwXBUGHhRhHOjoY2u
 fHsKABo0FF/V0f5rzvMwCPePdU/bmXJEgfYuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=go1LaTn+JyfnNbXmuN0CCBxYpt4cKSlPmbuS0BOCjb0=;
 b=FTnBi0t7t+ZEpPz5On2u347FR65qEybQxnnZapDmoCQKzRVypJkIlwpEVNTQS/uovH
 ilMLBaXsNBhdqVmu+iXxP+3X9KXbgYmn/icYb7sEWucnbH/CjO7wf+8UB24pGXJ0FT/E
 Hgzq5qfRgzAjeBg9qVb+RCvQR1IJt+8DLXv9dIFBfo76ENsNCUCx7y0x81pPsoMgsxGT
 YQqNpehOUrEpZ9G9q1cObyZkpqRkgP6qSJxHCyTwAEJ2Wl5bcULAF4/SugECkpbBKhsa
 F6QI0Qny8GRQd2aJCIBBtkgVvM+nNmIJxgi1ElyDvexFMMpS1dt8Qz5SvSP6yD/4RqtE
 5Hog==
X-Gm-Message-State: AOAM53047p94Fyva7FYX1pecmV27lImlD5u/oUtFlvXtU/xkSu6h641H
 say353qFFcN0MXqhBByIR52ZgSSq5MOLUE0p94CmLA==
X-Google-Smtp-Source: ABdhPJy5ewWyxel0RSu/PYx4gRp0zStcp9SyVtIIlGhKV9pvJMqR7eBy8o8UoORh9nYbniwgUexDAdfjeKDbs958eWY=
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr26940772otp.34.1620753550519; 
 Tue, 11 May 2021 10:19:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 May 2021 10:19:09 -0700
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHXon=k0AxF5fagz1_PW1WONppAZP1cbM72ujYN=pXn+A@mail.gmail.com>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
 <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
 <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
 <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
 <CAKMK7uHXon=k0AxF5fagz1_PW1WONppAZP1cbM72ujYN=pXn+A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 11 May 2021 10:19:09 -0700
Message-ID: <CAE-0n53AcL807G3WLp7phQUNN6umuwUikiz_5bNfcHdRbThu=Q@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Daniel Vetter <daniel@ffwll.ch>, "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-05-11 06:39:36)
> On Tue, May 11, 2021 at 12:52 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Mon, May 10, 2021 at 9:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > [cut]
> >
> > >
> > > >
> > > > > I will try it, but then I wonder about things like system wide
> > > > > suspend/resume too. The drm encoder chain would need to reimplement the
> > > > > logic for system wide suspend/resume so that any PM ops attached to the
> > > > > msm device run in the correct order. Right now the bridge PM ops will
> > > > > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > > > > After this change, the msm PM ops will run, the bridge PM ops will run,
> > > > > and then the i2c bus PM ops will run. It feels like that could be a
> > > > > problem if we're suspending the DSI encoder while the bridge is still
> > > > > active.
> > > >
> > > > Yup suspend/resume has the exact same problem as shutdown.
> > >
> > > I think suspend/resume has the exact opposite problem. At least I think
> > > the correct order is to suspend the bridge, then the encoder, i.e. DSI,
> > > like is happening today. It looks like drm_atomic_helper_shutdown()
> > > operates from the top down when we want bottom up? I admit I have no
> > > idea what is supposed to happen here.
> >
> > Why would the system-wide suspend ordering be different from the
> > shutdown ordering?
>
> At least my point was that both shutdown and suspend/resume have the
> same problem, and the righ fix is (I think at least) to add these
> hooks to the component.c aggregate ops structure. Hence just adding
> new callbacks for shutdown will be an incomplete solution.

To add proper hooks to component.c we'll need to make the aggregate
device into a 'struct device' and make a bus for them that essentially
adds the aggregate device to the bus once all the components are
registered. The bind/unbind can be ported to probe/remove, and then the
aggregate driver can get PM ops that run before the component devices
run their PM ops.

Let me go try it out and see if I can make it minimally invasive so that
the migration path is simple.

>
> I don't feel like changing the global device order is the right
> approach, since essentially that's what component was meant to fix.
> Except it's incomplete since it only provides a solution for
> bind/unbind and not for shutdown or suspend/resume as other global
> state changes. I think some drivers "fixed" this by putting stuff like
> drm_atomic_helper_shutdown/suspend/resume into early/late hooks, to
> make sure that everything is ready with that trick. But that doesn't
> compose very well :-/

Yeah it looks like msm is using prepare/complete for this so that it can
jump in early and suspend the display pipeline before the components
suspend themselves. The shutdown path only has one callback so we can't
play the same games.
