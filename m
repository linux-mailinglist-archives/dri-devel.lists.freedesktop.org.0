Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3A379769
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 21:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD766E4EA;
	Mon, 10 May 2021 19:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121E06E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 19:08:41 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n184so16725422oia.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 12:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eP6gvGEziKbBxse1ZZa4wvu/p/N5mBk1XQzX+RNRSrk=;
 b=hAb0NhrwpTLU1E9f834oH321MocrM3MUFd3zvEkAe65c63eoIihBWTiFsXaEOrh09L
 uvlvV1bK7n57oTVQRH4Du7xv3/8P5yzgLHmpYsapsRtdU9zKJqFoCUbwWka0Y9UM42ig
 dxsoaVKO3LthfKZKX+O2N4ysN/uMJ5HMoCAZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eP6gvGEziKbBxse1ZZa4wvu/p/N5mBk1XQzX+RNRSrk=;
 b=gnb0ToPppOGGrouB/KYcW1+WnByfihXHuj4miKiTKuvdOLx8Bp4vDqgWhF5LijOVhB
 v4TcXO/RnrQK9B1KdKL8TJBKOfDoyOrvbwtS06Jshj5B5jDAFZviYnOhKNoaFTyOTDlF
 qOcB7kCOau//m/hA51OfGdtnMJXdM5626XfvcAyIz/ohxnxMzDan+IbEEcpb6PAoOnOS
 zHWVcPK3eSeIQKiFjFV8fhxUgWrpd923rw+F82DvEhjgltR+1DOJ0aa27TO/IVZh+xrc
 n7r06TIWhcWU5saeNDtM/Q7BKSzd5+zV4tdwZ/ohZ8kk9THzEiZE0p+UGbPHmJsId4xJ
 +xTw==
X-Gm-Message-State: AOAM533p2Ir/xlgXn0Mw57int9c3oI6xWpbDto9OnBafQkKZOZ7qBc5p
 fw1Ep+lpdnjfuj/fNUXU41MXMCgAAnWxFXacZoAiCA==
X-Google-Smtp-Source: ABdhPJzYMhCCpm68K994SNvm+ZulvXrBB02Bh/q2MyeStbZV0IE0NuWg4JX8A4X4mpFNoQGj4v/NujH3OVWaWcucZGA=
X-Received: by 2002:aca:211a:: with SMTP id 26mr18840223oiz.19.1620673720507; 
 Mon, 10 May 2021 12:08:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 12:08:40 -0700
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
 <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 10 May 2021 12:08:40 -0700
Message-ID: <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-05-10 11:26:40)
> On Mon, May 10, 2021 at 7:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > The device list now has msm, i2c, bridge in that order. When we go to
> > system wide shutdown the bridge is shutdown first, then the i2c bus, and
> > then msm calls drm_atomic_helper_shutdown(). That tries to call the i2c
> > bridge ops because it's attached to the end of the DSI encoder and
> > things don't go well because i2c is gone. This patch fixes the order of
> > the list so that msm is moved on the device list after all the
> > components that make up the aggregate device have probed. This only
> > works to move the aggregate device after the i2c bridge because the
> > msm_dsi_host_register() function won't return success until the bridge
> > device is probed.
>
> Ah I think I get this now. There is indeed a design problem:
> component.c only has bind/unbind hooks for all its things. Which means
> driver load/unload will work correctly because in your above sequence:
>
> 1. drm_brige unbinds
> -> this triggers the unbind of the entire aggregate of components
> 2. i2c unbinds
> 3. msm unbinds, but there's nothing to clean up anymore except the
> aggregate/master struct

Yes. I just tried this though and it didn't work, so I suspect there are
bugs in bridge unbind. Another rabbit hole.

>
> Now for runtime pm this also all works out, because each component
> grabs the right runtime pm references. But for the system-wide pm
> changes, where we rely on the device list order to make sure things
> happen in the right way, it all blows up.
>
> 1. drm_bringe shutdown
> 2. i2c shutdown
> 3. msm shutdown, and with very sad thrombones because we blow up
>
> I think the right fix is to make component.c more of  a driver model
> thing, which probably means either the aggregate must get tied closer
> to the main struct device, or it needs to gain its own struct device.
> Or minimally at least, the aggregate needs to gain an entire set of
> pm_ops, which gets called in the right order if any of the component's
> pm_ops gets called. Wiring that all up will be major surgery I think.

Yes the root of the problem is that the aggregate device is not part of
the kernel's driver model. It's basically a pair of probe and remove
functions and nothing else.

>
> I guess another option would be trying to figure out how the aggreate
> registration could fail with EPROBE_DEFER until all the parts are
> there, to guarantee the right ordering. Not sure that will work with
> the current component users though.

I had that written up and it worked for me but I was concerned it would
break other users, plus it didn't feel correct to defer probe just
because the components weren't probed yet. The aggregate device wasn't
waiting for the components to probe, so why change that? For msm it led
to more work too, because we have some child devices that are removed if
the aggregate device fails to probe, meaning we go through a few cycles
of add/remove of the components this way. If the aggregate doesn't defer
probe then we can avoid the other components adding/removing over and
over again until the final component, DSI that is waiting for the
bridge, can probe.

That's why I opted to move the device on the list to the tail. I'm
hoping that most component users (which is basically drm?) don't do much
with the device they're using to host the aggregate device besides tell
drm that the display pipeline is here now. Everything else would be in
the bind/unbind callbacks. If there was a 'struct device', or maybe a
'struct class', that was associated with the whole display pipeline and
aggregate device we could attach the pm ops to that. Would 'struct
drm_device' be that? If yes we could make some drm functions that let
you attach PM ops to a struct device inside of that and make it a child
of the device that calls drm_dev_alloc().

>
> > It's an interesting idea to trigger shutdown when the component device
> > is unbound. Are you suggesting that the i2c bridge device have a
> > 'shutdown' callback, that essentially removes the bridge from the
> > encoder chain via mipi_dsi_detach() and then drm_bridge_remove()?
> > Presumably that would somehow tell the DSI encoder that it should stop
> > trying to use the i2c bridge and then drm_atomic_helper_shutdown()
> > wouldn't try to traverse beyond the DSI to shut things down.
>
> Nope, we don't want to unbind the driver on shutdown. I somehow
> thought you're dying in there, which is why I wondered what's going
> on. But since you're dying in pm_ops->shutdown, that's a different
> thing.

I'm dying in msm_pdev_shutdown(), but yes pm_ops are similar.

>
> > I will try it, but then I wonder about things like system wide
> > suspend/resume too. The drm encoder chain would need to reimplement the
> > logic for system wide suspend/resume so that any PM ops attached to the
> > msm device run in the correct order. Right now the bridge PM ops will
> > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > After this change, the msm PM ops will run, the bridge PM ops will run,
> > and then the i2c bus PM ops will run. It feels like that could be a
> > problem if we're suspending the DSI encoder while the bridge is still
> > active.
>
> Yup suspend/resume has the exact same problem as shutdown.

I think suspend/resume has the exact opposite problem. At least I think
the correct order is to suspend the bridge, then the encoder, i.e. DSI,
like is happening today. It looks like drm_atomic_helper_shutdown()
operates from the top down when we want bottom up? I admit I have no
idea what is supposed to happen here.
