Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C6425DC4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 22:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9796E02D;
	Thu,  7 Oct 2021 20:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF96E030
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 20:42:49 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id n63so10721435oif.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R7AOnGenRS0rd8ADOa6GfVMtI/YOuyOV/MLd+Be+R0c=;
 b=D0ql250itKs6b5jrU81lvPM5X4iXeo7I9h26xSPtMefkgAlPF7I5umHv65/NP3yNET
 b0NTmolKOqSzrVsBQMH5Cb0HAzMxWG3/HW06IWM89UgZ+mASnj6G8Gni3zNzGK992nmq
 ivPuMqeAbYsiBP7FC+7ojnurKEmxx2+GpYgk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R7AOnGenRS0rd8ADOa6GfVMtI/YOuyOV/MLd+Be+R0c=;
 b=ewvDl3/HqwHyo7u4zKWg5bajGpl4jbbXtCwh6DeYarmsUiskqIGCWRLM8aC7Y4wFy1
 jisHIPFUxt83ibu7ekIYsKipw+//j3wmZB4ydbsOTrrMnffTYAtjFN+0Mk9vp9okP0va
 HnpYO1NJQPRRwEXy4aR3cTjtxKhzz1vOi148+Uv6ZaXc68euC1umWHrzpq29HHSWL1Ry
 /7k5vKSxS5eb3HHW6GU696O5iXHAVfaFSJp+lSdhkoyoYyJkPMhrGG82I6vhJZ6m9qTZ
 n8y18l+ukOerrwcMF9zLPy9oHkBvgPOSnH6Uf3ahxAoIiloC3zaXJcMQLsGNS/QQMxOW
 VFtw==
X-Gm-Message-State: AOAM532fqbGtybj0TomqYZZV8yjsS/EiuOu+553+veWn/oqEJn+fFZ87
 iG0kppkyXr1OtpWo3PqeicZuG1VtZ3r2nMlUiF001A==
X-Google-Smtp-Source: ABdhPJyRHLAr1f3d4Yk9VGqp/0AmBwz/RGWzpgAEJM66vp53oJrkmUw9U/H3DtIqvwHWqjAAz/L31SvUgMC95zGthL8=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr13381417oiw.164.1633639368453; 
 Thu, 07 Oct 2021 13:42:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 16:42:48 -0400
MIME-Version: 1.0
In-Reply-To: <YV6HpM8NlO29UjAI@kroah.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <YV6HpM8NlO29UjAI@kroah.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 16:42:48 -0400
Message-ID: <CAE-0n51QPTT3TcgNJf2jDoXaRdxNnnyQY6--UqpNTp9ZKToqbw@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, 
 Saravana Kannan <saravanak@google.com>
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

Quoting Greg Kroah-Hartman (2021-10-06 22:37:40)
> On Wed, Oct 06, 2021 at 12:37:47PM -0700, Stephen Boyd wrote:
> >
> > Let's make the component driver into an actual device driver that has
> > probe/remove/shutdown functions. The driver will only be bound to the
> > aggregate device once all component drivers have called component_add()
> > to indicate they're ready to assemble the aggregate driver. This allows
> > us to attach shutdown logic (and in the future runtime PM logic) to the
> > aggregate driver so that it runs the hooks in the correct order.
>
> Why are you creating a new bus type and not using the auxiliary bus
> instead?
>
> You have seen Documentation/driver-api/auxiliary_bus.rst, right?
>

Nope, but I read it now. Thanks for the pointer.

My read of it is that the auxiliary bus is a way to slice up a single IP
block into multiple devices and then have drivers attach to those
different "pieces" of the IP. It avoids polluting the platform bus with
devices that don't belong on the platform bus because they are sub
components of a larger IP block that sits on the platform bus.

The aggregate bus is solving the reverse problem. It is rounding up a
collection of IP blocks that live on some bus (platform, i2c, spi,
whatever) and presenting them as a single aggregate device (sound card,
display card, whatever) whenever all the component devices call
component_add(). For example, we don't want to do operations on the
entire display pipeline until all the devices that make up the display
are probed and drivers are attached. I suppose the aggregate_device in
this patch series has a 1:1 relationship with the drm class_type that
makes up /sys/class/drm/cardN but there's also a couple sound users and
a power_supply user so I don't know the equivalent there.

Long term, maybe all of this component code could be placed directly
into the driver core? That's probably even more invasive of a change but
I imagine we could make device links with component_add() as we're
already doing with these patches and then have driver core call some
class function pointer when all the links are probed. That would
handle the 'bind/probe' callback for the aggregate device but it won't
handle the component_bind_all() path where we call bind_component() for
each component device that makes up the aggregate device. Maybe we can
add even more devices for the components and then call probe there too.

Sorry that's a long-winded non-answer. I don't think they're solving the
same problem so using the same bus type looks wrong. We'd have to take
two different paths depending on what type of device it is (aggregate
vs. auxiliary) so there's not much of anything that is shared code-wise.
