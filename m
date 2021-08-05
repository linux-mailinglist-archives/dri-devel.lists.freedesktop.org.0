Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D53E0E8E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 08:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FE89DB5;
	Thu,  5 Aug 2021 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3B789DB5;
 Thu,  5 Aug 2021 06:50:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D182560EE8;
 Thu,  5 Aug 2021 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628146258;
 bh=qMsPpqQgFUPSSPnZfZavNoLnNsZYb+hVgAtPZNQBy5w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ObhBf+NN4GqwQxNx/Lx+8AMAwuGlEvoXaj2dr50XEIYqzYy/HZE2xI7CL2r/XBdRm
 h7Jl0yGq7YppbC5Qi+io0LfpKg8+sqkjPa7VgkgDzQj7MZ8Za/g84FRPLsS/geIrib
 XeHHxL9J9xr5FwusDdEI8d630JA5vK4xwDEB/ag73EcJ8nyoA5iocv71E6axsMyg03
 MQJsYEqpOGmzbPpV4barhyJ1DNTVMGbVfR76rJJ/glh7MLH4aQwApNRc3MqRkjAboQ
 UO7cggith/pKaisdmkMHzNieFdV7GQLpIG3V5j64ROArAcaNQjL0LWYWAPOA436KVE
 lr78sf0ffppPw==
Received: by mail-wr1-f54.google.com with SMTP id l18so5065705wrv.5;
 Wed, 04 Aug 2021 23:50:58 -0700 (PDT)
X-Gm-Message-State: AOAM5332cUY1qq1cpgRM5svl93MYyCJ8j5W7K+QSo6MC5hEm4K4wBTp0
 PkHNgvbKa/IPX3m1fhge05g7guTBTfO7K7rkUNU=
X-Google-Smtp-Source: ABdhPJznMWhOISmuIYDXrWpGkt4y1m+fqzTgxmRqDkmkTEHJHsPKR7IHYLL2Gk1DFScHpZ5gzgXyDTyRE3rrOBfVhqs=
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr3290312wrq.99.1628146257464;
 Wed, 04 Aug 2021 23:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
 <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
 <CACO55tuy5Am9zbcR490KWYYAg7MguBN5m82vbjzifGN5KpGbxw@mail.gmail.com>
 <CAK8P3a3hZ7X5+kM5E+_Y+COUp49Kt6iDjiqMFtimiSbPk4byzQ@mail.gmail.com>
 <CACO55tsj_dgo8NENArCQ_=qcuJoMPg9k-gfkWxZ_8FCQUOTY1A@mail.gmail.com>
In-Reply-To: <CACO55tsj_dgo8NENArCQ_=qcuJoMPg9k-gfkWxZ_8FCQUOTY1A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 5 Aug 2021 08:50:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rAr0BH6cNLkhES+81x2hWW31RTLZkHLDJYK-r8+x6Gg@mail.gmail.com>
Message-ID: <CAK8P3a1rAr0BH6cNLkhES+81x2hWW31RTLZkHLDJYK-r8+x6Gg@mail.gmail.com>
Subject: Re: [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
To: Karol Herbst <kherbst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, Aug 5, 2021 at 12:01 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 4, 2021 at 11:10 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Wed, Aug 4, 2021 at 8:59 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > On Wed, Aug 4, 2021 at 4:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > > On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > > >
> > > > > > playing around a little bit with this, I think the original "select
> > > > > > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > > > > > drivers selecting and others depending on it. We could of course convert
> > > > > > everything over to depend, and break those cycling dependency issues with
> > > > > > this.
> > > > > >
> > > > > > Anyway this change on top of my initial patch is enough to make Kconfig
> > > > > > happy and has the advantage of not having to mess with the deps of nouveau
> > > > > > too much.
> > > > >
> > > > > Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> > > > > option itself 'default FB || DRM' though, to ensure that defconfigs
> > > > > keep working.
> > > > >
> > > >
> > > > okay cool. Will send out a proper updated patch series soonish.
> > > >
> > >
> > > mhh, actually that breaks drivers selecting FB_BACKLIGHT as now
> > > BACKLIGHT_CLASS_DEVICE might be disabled :(
> >
> > Are you sure? It should already be the case that any driver that selects
> > FB_BACKLIGHT either 'depends on BACKLIGHT_CLASS_DEVICE'
> > or 'select BACKLIGHT_CLASS_DEVICE'.
> >
> none of the fb drivers seem to do that.

Ah, right, I see now that my randconfig series has a couple of patches
applied that deal with other random failures, including this one:

https://patchwork.kernel.org/project/linux-fbdev/patch/20200417155553.675905-8-arnd@arndb.de/

Part of the series went in (through different ways) now, but this one
never did.

      Arnd
