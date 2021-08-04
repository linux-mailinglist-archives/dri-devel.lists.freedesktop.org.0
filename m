Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500973E0A32
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 00:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D776E11A;
	Wed,  4 Aug 2021 22:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144066E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628114520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d2KqUld+afo/DqE9+AEtQTsC0qFJZ5g464VDzN5fDCk=;
 b=DznlWIsIohk04aVdpHuasVaWIpn8mGeEI3/N4ONXjaLG+NfnuxbGlM40phnf0Mko7D3CNP
 o7ll2jECSR28U4AqOrVcw24K42YjHxR2OoO9C4tVF+O+dcmP/oNt6jULlZaZpZGtDiileM
 Ea3FcVdOPwapWD7Lw9XhQIUSEFQi3xc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-F3r68G6mOEKCmXKvY4WLjg-1; Wed, 04 Aug 2021 18:01:59 -0400
X-MC-Unique: F3r68G6mOEKCmXKvY4WLjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c41-20020a05600c4a29b0290253935d0f82so2299548wmp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 15:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2KqUld+afo/DqE9+AEtQTsC0qFJZ5g464VDzN5fDCk=;
 b=LwpIvxtExZnlyoNJMaxyC5lN5S4ByC2PwR26NfE3SljfrfryL1A1dhhxo+XH5ZuR6G
 95oj0hzEUO7nZeg4Kvs+3SuMmFVwxflt1OsqOA/lOLhTgcQQVY0drSXZ9M78ybrhAtqw
 j/ZHTaW9OC2+rFKwY/lukCNq1m1R6tlnti3c4xmNo8lNFpnEk3a65RVrYdHV+TO547D+
 sk0GQuc4Q52kgCrIBD9e0bpSozn3A4NwJVQwfgDbhyBwbyS8cHXEmYPbYJa+cZL1VKZX
 AEr9QLH5YW+ERogJz3sDfIML5TbwjgBqXa5aO2u2Cm+908OFERFG2fh00BG3sUJosX0n
 w+rg==
X-Gm-Message-State: AOAM53287pad8GYxJMej66V7NWxqOYI8ub164iyIZBtHhzaZz/46aMfH
 /znIZsc91T0BMyN7cmAqbdAwevYjz7VEdA6lfesY8Zoxw7mCkv/qEaEBPeqsPr3d9xG3t/wHwxM
 xz9geuCNgQJzD9cgFNSvF04sZVuKoVO554j8cQ4sVMuhT
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr11802101wmm.171.1628114518477; 
 Wed, 04 Aug 2021 15:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY5/nXWklNR1mjmCS911U1388HsPu+p770sIXPA+rC70wi12iHVm9penxHkIrsLojhFxJ+H/cT1xS0GAj+5BQ=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr11802083wmm.171.1628114518302; 
 Wed, 04 Aug 2021 15:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
 <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
 <CACO55tuy5Am9zbcR490KWYYAg7MguBN5m82vbjzifGN5KpGbxw@mail.gmail.com>
 <CAK8P3a3hZ7X5+kM5E+_Y+COUp49Kt6iDjiqMFtimiSbPk4byzQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3hZ7X5+kM5E+_Y+COUp49Kt6iDjiqMFtimiSbPk4byzQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 5 Aug 2021 00:01:47 +0200
Message-ID: <CACO55tsj_dgo8NENArCQ_=qcuJoMPg9k-gfkWxZ_8FCQUOTY1A@mail.gmail.com>
Subject: Re: [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Wed, Aug 4, 2021 at 11:10 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Wed, Aug 4, 2021 at 8:59 PM Karol Herbst <kherbst@redhat.com> wrote:
> > On Wed, Aug 4, 2021 at 4:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > playing around a little bit with this, I think the original "select
> > > > > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > > > > drivers selecting and others depending on it. We could of course convert
> > > > > everything over to depend, and break those cycling dependency issues with
> > > > > this.
> > > > >
> > > > > Anyway this change on top of my initial patch is enough to make Kconfig
> > > > > happy and has the advantage of not having to mess with the deps of nouveau
> > > > > too much.
> > > >
> > > > Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> > > > option itself 'default FB || DRM' though, to ensure that defconfigs
> > > > keep working.
> > > >
> > >
> > > okay cool. Will send out a proper updated patch series soonish.
> > >
> >
> > mhh, actually that breaks drivers selecting FB_BACKLIGHT as now
> > BACKLIGHT_CLASS_DEVICE might be disabled :(
>
> Are you sure? It should already be the case that any driver that selects
> FB_BACKLIGHT either 'depends on BACKLIGHT_CLASS_DEVICE'
> or 'select BACKLIGHT_CLASS_DEVICE'.
>

none of the fb drivers seem to do that.

> If you change all the 'select BACKLIGHT_CLASS_DEVICE' to 'depends
> on', I don't see a problem with doing 'select FB_BACKLIGHT' from
> those.
>
> I have applied your patch to my randconfig tree and built a few dozen
> kernels, don't see any regressions so far, but will let it run over night.
>
>       Arnd
>

