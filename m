Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A859B5B6
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 19:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDC48F378;
	Sun, 21 Aug 2022 17:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A7A8F378
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661103846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9xO+sG+BC8+KMFWEhB6iGiep2l65q80r8X9tWSjTux8=;
 b=OTaXYExCeB2r8eT0au/Zkk+PUn5QnLXKJtSGOmXhPqSoGvMznyj9YKzDVidSh+cWO1HQlF
 hS/Coat/cdh0TZkynt3nkDq0+AbU+BDKVSkCOGOmbfqgkUCoR2FFzXZj8/9lSCT7WKSpvR
 ymgocJDWZHm7ZvuIosIVk72AAg79k7Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-3ttzbE62Pfa9EmAxak0I2g-1; Sun, 21 Aug 2022 13:44:04 -0400
X-MC-Unique: 3ttzbE62Pfa9EmAxak0I2g-1
Received: by mail-qt1-f200.google.com with SMTP id
 i19-20020ac85e53000000b00342f05b902cso6917132qtx.7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 10:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9xO+sG+BC8+KMFWEhB6iGiep2l65q80r8X9tWSjTux8=;
 b=Y1QW3jlqdish7WOhFCxekrerpsQY2BbajhL/Wr72UzzE6Rv/jhKqpObpwYPx7L+Fdx
 Kp+FdhMTRwFsTQnZzQjefDGvJMEB+7GZmByuTRieegWTIidIgASJJoxNFQWdmtcJz1Un
 mr0Xcz2SbkqaR+K+E7+adyXea4t8qYgsQJZS6lV0FnEPJ4MhoUiWrzezr0qMAECbHp/w
 MPKaYGAModtq7XWZd3SuxtpAkHO3Np8mfuMUbaIfet5JRAko3l4hkoEx9IJ/s/x76Fyh
 E3wcvjixiEKgm05CTVyUhJ6NACo8aILZs59FZqEQaPonPw4MJ1b8K3dBTUPreeqY6570
 e4vw==
X-Gm-Message-State: ACgBeo1zk/iZKz5uztKKH2ZPcUYlC3Pq1v8TGuTxi++mSo+djianxbuD
 ekKP46dOjOI3bEgC2tYRcR3wu2kH+IKEYwtyd/VfqhNf2OdIDGc4x9WlI6LIHd+yeaReXwWEmCO
 V163n+kxspAMY6HR07tcs/KHDgCNAKmWP0VfWuaOJts+3
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr13003953qty.141.1661103844305; 
 Sun, 21 Aug 2022 10:44:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6YMzdjxWtkdeyrmGGm0fLsixTUHAku3orBHLxbpl7lmCRT3lQ5nRzwPYBrv2oOkgmUotinFfwSsA1GbkEiU1s=
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr13003937qty.141.1661103844026; Sun, 21
 Aug 2022 10:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
 <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
In-Reply-To: <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 21 Aug 2022 19:43:53 +0200
Message-ID: <CACO55ttztg76GOCoNWSse7Xu6LAOz66LUeeZ8AmCdePZhghokA@mail.gmail.com>
Subject: Re: Rust in our code base
To: Rob Clark <robdclark@gmail.com>
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
Cc: jason.ekstrand@collabora.com, marek.olsak@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dylan Baker <dylan.c.baker@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 21, 2022 at 5:46 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Sat, Aug 20, 2022 at 5:23 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > Hey everybody,
> >
> > so I think it's time to have this discussion for real.
> >
> > I am working on Rusticl
> > (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15439)
> > which I would like to merge quite soon.
> >
> > Others might also plan on starting kernel drivers written in Rust (and
> > if people feel comfortable to discuss this as well, they might reply
> > here)
> >
> > The overall implication of that is: if we are doing this, people (that
> > is we) have to accept that touching Rust code will be part of our
> > development process. There is no other sane way of doing it.
> >
> > I am not willing to wrap things in Rusticl so changing gallium APIs
> > won't involve touching Rust code, and we also can't expect people to
> > design their kernel drivers in weird ways "just because somebody
> > doesn't want to deal with Rust"
> >
> > If we are going to do this, we have to do it for real, which means,
> > Rust code will call C APIs directly and a change in those APIs will
> > also require changes in Rust code making use of those APIs.
> >
> > I am so explicit on this very point, because we had some discussion on
> > IRC where this was seen as a no-go at least from some people, which
> > makes me think we have to find a mutual agreement on how it should be
> > going forward.
> >
> > And I want to be very explicit here about the future of Rusticl as
> > well: if the agreement is that people don't want to have to deal with
> > Rust changing e.g. gallium, Rusticl is a dead project. I am not
> > willing to come up with some trashy external-internal API just to
> > maintain Rusticl outside of the mesa git repo.
> > And doing it on a kernel level is even more of a no-go.
> >
> > So what are we all thinking about Rust in our core repos?
>
> I think there has to be willingness on the part of rust folks to help
> others who aren't so familiar with rust with these sorts of API
> changes.  You can't completely impose the burden on others who have
> never touched rust before.  That said, I expect a lot of API changes
> over time are simple enough that other devs could figure out the
> related rust side changes.
>

yeah, I agree here. I wouldn't say it's all the responsibility of
developers changing APIs to also know how to change the code. So e.g.
if an MR fails to compile and it's because of rusticl, I will help out
and do the changes myself if necessary. But long term we have to
accept that API changes also come with the implication of also having
to touch Rust code.

Short term it might be a learning opportunity for some/most, but long
term it has to be accepted as a part of development to deal with Rust.

> As long as folks who want to start introducing rust in mesa and drm
> realize they are also signing up to play the role of rust tutor and
> technical assistance, I don't see a problem.  But if they aren't
> around and willing to help, I could see this going badly.
>

Yep, I fully agree here. This is also the main reason I am bringing
this up. Nobody should be left alone with having to deal with changing
the code. On the other hand a "not having to touch Rust code when
changing APIs" guarantee is something which is simply impossible to
have in any sane architecture. So we should figure out under which
circumstances it will be okay for everybody.

At least I don't see a way how I can structure Rusticl so that
somebody working on gallium won't have to also deal with rusticl. One
possibility would be to have a libgallium.so file I can link to, but
then it's all about "stable gallium API" vs "not having to touch rust
code" and I hope everybody prefers the second :)

> I do also wonder a bit about code tooling (indexers, etc).. I'm not
> sure what the state of things when it comes to cross c<->rust
> integration.  Ie. it is usually straightforward enough to track down
> all the spots in C code which would be affected by some change.  It
> might be easier to overlook things on the rust side.  On the mesa
> side, pre-merge CI jobs help to catch these issues.  Less sure about
> how to handle that on the kernel side.
>

At least for Rusticl it's all within meson/ninja. We use bindgen to
generate the bindings automatically so you simply run into compilation
issues. And for the kernel side I think that Linus wanted Rust to be
non optional. If something uses it, you also make sure the Rust side
compiles. And the build system is dynamic enough that you can also
wire up bindgen and make it part of the normal development model.

In regards to code tooling, for rust you usually rely on
rust-analyzer. I've already figured out with dcbaker on how to
integrate our meson setup with that. Atm I am able to get the full
experience with VScode. Not sure if we also need to figure out how
that can work with e.g. vim and how to deal with C <=> Rust
boundaries.

> BR,
> -R
>
> > CCing a bunch of people who think are the most impacted by it either
> > from a reviewer/maintainer or developer perspective. If you think some
> > others should be explicitly aware of this, please point them to this
> > discussion here.
> >
> > Karol
> >
>

