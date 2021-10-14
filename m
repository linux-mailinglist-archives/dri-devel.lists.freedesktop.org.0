Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D661242DA5E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668456EAC2;
	Thu, 14 Oct 2021 13:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974966EAC2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:28:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t16so24374483eds.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=y2s4CtwV4h9cAS9JApc0nY1rQkilQmz/B6Blret2/cs=;
 b=eGI4hTn3kMzcOZ/Sl1hHJuVcUTQb4suzrCd+MSMGv+9QCL6m0XZqppKcpAXNpdMxMy
 7Qm4kVVcYwb+wvP0seJMKSKxA5gjL2USW5rqHLpHVQHAyIFu77VwYW1lBuBTBce9xC7g
 FQTJkrZjgIpivzJ1KNizYqkS3Kb0iXbvZ93e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=y2s4CtwV4h9cAS9JApc0nY1rQkilQmz/B6Blret2/cs=;
 b=kJrCO+CUnmqzZThNDbhtUY0yZXyxw3/txvwzzDqMQXPEz8knnzF6JIWexEkppoR0qy
 M5iPcvltNvV+jTQKTE7m0lelfVQVUiJHuPqH/j5g5JvfG97Sb2mheswVBijGbY47ig4P
 6+LVfar+qDc4V9xqyKJjZgmZx0S2q0gNo9BmRUoO+wF3m9NQ+IS1gJC4jjefJ6s0Ux+V
 A5UzzzB/cb8ujaVlmD2d1BYMOnL0ruO0YDQ/mUOIYNvRts6rkQ3JXxjtiZAY+WFdeS84
 jn20W8VIK/+g+7mrQ624cbpF5b2lgQGhffHMGrI2psOX+iK5oPuD/In8fk52PSSZGsYJ
 zniA==
X-Gm-Message-State: AOAM531wt8JIyMlbq0SHxrOWH9ues+h16hgG4YdsnedM9wMycKORAVsi
 Xt3oXckngs/5jQrxbtdDp4/YUA==
X-Google-Smtp-Source: ABdhPJwumLGYDY0kHwLV5V0BQOX5VMB1QAPhMACoI2uzyEYkWF+AW5GpvQ6h5sXa1kB3dnr6C/t24g==
X-Received: by 2002:aa7:cb03:: with SMTP id s3mr8749943edt.334.1634218074167; 
 Thu, 14 Oct 2021 06:27:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm2265223edc.2.2021.10.14.06.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:27:53 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:27:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
Message-ID: <YWgwV3dW3Q9HQhlF@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <YV6HpM8NlO29UjAI@kroah.com>
 <CAE-0n51QPTT3TcgNJf2jDoXaRdxNnnyQY6--UqpNTp9ZKToqbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51QPTT3TcgNJf2jDoXaRdxNnnyQY6--UqpNTp9ZKToqbw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Oct 07, 2021 at 04:42:48PM -0400, Stephen Boyd wrote:
> Quoting Greg Kroah-Hartman (2021-10-06 22:37:40)
> > On Wed, Oct 06, 2021 at 12:37:47PM -0700, Stephen Boyd wrote:
> > >
> > > Let's make the component driver into an actual device driver that has
> > > probe/remove/shutdown functions. The driver will only be bound to the
> > > aggregate device once all component drivers have called component_add()
> > > to indicate they're ready to assemble the aggregate driver. This allows
> > > us to attach shutdown logic (and in the future runtime PM logic) to the
> > > aggregate driver so that it runs the hooks in the correct order.
> >
> > Why are you creating a new bus type and not using the auxiliary bus
> > instead?
> >
> > You have seen Documentation/driver-api/auxiliary_bus.rst, right?
> >
> 
> Nope, but I read it now. Thanks for the pointer.
> 
> My read of it is that the auxiliary bus is a way to slice up a single IP
> block into multiple devices and then have drivers attach to those
> different "pieces" of the IP. It avoids polluting the platform bus with
> devices that don't belong on the platform bus because they are sub
> components of a larger IP block that sits on the platform bus.
> 
> The aggregate bus is solving the reverse problem. It is rounding up a
> collection of IP blocks that live on some bus (platform, i2c, spi,
> whatever) and presenting them as a single aggregate device (sound card,
> display card, whatever) whenever all the component devices call
> component_add(). For example, we don't want to do operations on the
> entire display pipeline until all the devices that make up the display
> are probed and drivers are attached. I suppose the aggregate_device in
> this patch series has a 1:1 relationship with the drm class_type that
> makes up /sys/class/drm/cardN but there's also a couple sound users and
> a power_supply user so I don't know the equivalent there.
> 
> Long term, maybe all of this component code could be placed directly
> into the driver core? That's probably even more invasive of a change but
> I imagine we could make device links with component_add() as we're
> already doing with these patches and then have driver core call some
> class function pointer when all the links are probed. That would
> handle the 'bind/probe' callback for the aggregate device but it won't
> handle the component_bind_all() path where we call bind_component() for
> each component device that makes up the aggregate device. Maybe we can
> add even more devices for the components and then call probe there too.
> 
> Sorry that's a long-winded non-answer. I don't think they're solving the
> same problem so using the same bus type looks wrong. We'd have to take
> two different paths depending on what type of device it is (aggregate
> vs. auxiliary) so there's not much of anything that is shared code-wise.

Yeah component is the reverse of auxiliary, and right now a lot of
subsystems have their own hand-rolled version of this. I do hope that
component.c does become more of a standard (that's why it's in
drivers/base/), but I guess that's a bit tricky if the device model
maintainer hasn't seen it yet ...

Hopefully putting more proper device model concepts into it can fix this
problem :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
