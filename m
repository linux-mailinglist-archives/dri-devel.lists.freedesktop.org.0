Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F759B605
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 20:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78098FE2A;
	Sun, 21 Aug 2022 18:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8268FE1B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 18:34:52 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id v10so8801973ljh.9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=d6RaxE8FrXlfSxkwGMMjKpqBUOefmLzThFhL8q60Zn0=;
 b=L5EfxWfPilIO4vs1K2HR59KK8J30XfjG2AT4xyYDkO+LWrk43/PZmgdRg3jzrp7qc9
 8F84NrdMrrAFwLWBEgh/Na587Z6t9sQo/LWh/Zb2DW347mTYk7r+HXlpUEPrKiap+9NP
 1cQoysG0BbGb3s/rcanSRh6TqF6WhiXe6xSpeuymPrGYvB4xBmhI8VTlv2txOH+XreNr
 2Ceu6mjWgoCca5PyYnfpzW/vJlOgWx66m6FCnh78Gx9+Lr2FE6WpFeEpyI5pmZmzAZhF
 5eAUlonFqrVssuNxgGsECOVEtRHzNLti/kKXqyqz6YmY+wZHb53rntyT5f81kjf1ZXd/
 WQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=d6RaxE8FrXlfSxkwGMMjKpqBUOefmLzThFhL8q60Zn0=;
 b=ytgXo6gsH0LJ+UZ7LppsfctulpcbLv+PISK0hCvxJnr1Bnj+5Z7oBJy7juq++8hgfw
 URQo57JdN6SOPnMbW9FhyPFskkAGWTMuc2k8NZe5kKeVBtN/1dmb4xPtpl8pu7aQ8o0W
 ZdcDURlZctg35glhzndRIpZyHOj044xfLqFQYvQkoCSfS53rvyXglgoTYvYRISuZZgSk
 NdQlan9YpCm2fcKMhvhUwuA4zfL+JXrHefOsH4K3npF0OCCOVEAX6zU5FOMsbME82vev
 1SPIbei74RFTURlN6URvSsvD2WRb/q1g7d7F2GIi0g24fvYtm1qxDZSXRpx8mXbWX9x9
 wsjA==
X-Gm-Message-State: ACgBeo3To2A6kNVGTZzyHik89IYb5J+ZZ60GZ96fmcrsemRByFD37pJk
 L0P7gPUArFLyMpawsc4CnsjfEHsluw4abHOueuU=
X-Google-Smtp-Source: AA6agR6InSUwczDQnuodY45y3I0DroDSNS3XkVvRsErYUBiwe9ztlGlHF4WPCN4YHlQR2PHNA5OJrn7H59ZYNIiYW90=
X-Received: by 2002:a2e:bf23:0:b0:261:bd22:b2ba with SMTP id
 c35-20020a2ebf23000000b00261bd22b2bamr3667994ljr.438.1661106890341; Sun, 21
 Aug 2022 11:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
 <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
 <CACO55ttztg76GOCoNWSse7Xu6LAOz66LUeeZ8AmCdePZhghokA@mail.gmail.com>
 <CACO55ttrvvk=zH7hGdfv7xxUoUONpxbbVDVd1bp_zKs5X3NiGQ@mail.gmail.com>
In-Reply-To: <CACO55ttrvvk=zH7hGdfv7xxUoUONpxbbVDVd1bp_zKs5X3NiGQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 21 Aug 2022 11:35:22 -0700
Message-ID: <CAF6AEGu9gq8Nsw60ZmdUKTOM-mT7Z7SM6mKBkzNDiY9p9-Eh9g@mail.gmail.com>
Subject: Re: Rust in our code base
To: Karol Herbst <kherbst@redhat.com>
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

On Sun, Aug 21, 2022 at 10:45 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sun, Aug 21, 2022 at 7:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Sun, Aug 21, 2022 at 5:46 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Sat, Aug 20, 2022 at 5:23 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > Hey everybody,
> > > >
> > > > so I think it's time to have this discussion for real.
> > > >
> > > > I am working on Rusticl
> > > > (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15439)
> > > > which I would like to merge quite soon.
> > > >
> > > > Others might also plan on starting kernel drivers written in Rust (and
> > > > if people feel comfortable to discuss this as well, they might reply
> > > > here)
> > > >
> > > > The overall implication of that is: if we are doing this, people (that
> > > > is we) have to accept that touching Rust code will be part of our
> > > > development process. There is no other sane way of doing it.
> > > >
> > > > I am not willing to wrap things in Rusticl so changing gallium APIs
> > > > won't involve touching Rust code, and we also can't expect people to
> > > > design their kernel drivers in weird ways "just because somebody
> > > > doesn't want to deal with Rust"
> > > >
> > > > If we are going to do this, we have to do it for real, which means,
> > > > Rust code will call C APIs directly and a change in those APIs will
> > > > also require changes in Rust code making use of those APIs.
> > > >
> > > > I am so explicit on this very point, because we had some discussion on
> > > > IRC where this was seen as a no-go at least from some people, which
> > > > makes me think we have to find a mutual agreement on how it should be
> > > > going forward.
> > > >
> > > > And I want to be very explicit here about the future of Rusticl as
> > > > well: if the agreement is that people don't want to have to deal with
> > > > Rust changing e.g. gallium, Rusticl is a dead project. I am not
> > > > willing to come up with some trashy external-internal API just to
> > > > maintain Rusticl outside of the mesa git repo.
> > > > And doing it on a kernel level is even more of a no-go.
> > > >
> > > > So what are we all thinking about Rust in our core repos?
> > >
> > > I think there has to be willingness on the part of rust folks to help
> > > others who aren't so familiar with rust with these sorts of API
> > > changes.  You can't completely impose the burden on others who have
> > > never touched rust before.  That said, I expect a lot of API changes
> > > over time are simple enough that other devs could figure out the
> > > related rust side changes.
> > >
> >
> > yeah, I agree here. I wouldn't say it's all the responsibility of
> > developers changing APIs to also know how to change the code. So e.g.
> > if an MR fails to compile and it's because of rusticl, I will help out
> > and do the changes myself if necessary. But long term we have to
> > accept that API changes also come with the implication of also having
> > to touch Rust code.
> >
> > Short term it might be a learning opportunity for some/most, but long
> > term it has to be accepted as a part of development to deal with Rust.
> >
> > > As long as folks who want to start introducing rust in mesa and drm
> > > realize they are also signing up to play the role of rust tutor and
> > > technical assistance, I don't see a problem.  But if they aren't
> > > around and willing to help, I could see this going badly.
> > >
> >
> > Yep, I fully agree here. This is also the main reason I am bringing
> > this up. Nobody should be left alone with having to deal with changing
> > the code. On the other hand a "not having to touch Rust code when
> > changing APIs" guarantee is something which is simply impossible to
> > have in any sane architecture. So we should figure out under which
> > circumstances it will be okay for everybody.

Yeah, this sounds fine to me.

> > At least I don't see a way how I can structure Rusticl so that
> > somebody working on gallium won't have to also deal with rusticl. One
> > possibility would be to have a libgallium.so file I can link to, but
> > then it's all about "stable gallium API" vs "not having to touch rust
> > code" and I hope everybody prefers the second :)
> >
>
> uhm... I meant "stable gallium API" vs "dealing with Rust code on API changes"

Yeah, stable gallium ABI makes as much sense as stable drm (in-kernel)
ABI (ie. it doesn't).  So even if we tried to make it so that folks
who haven't used rust much (or at all) yet on the gallium side, we'll
still have to deal with it on the kernel side.  So let's not design
our APIs to avoid a learning curve.. lets' just recognize that the
learning curve will be there.

> > > I do also wonder a bit about code tooling (indexers, etc).. I'm not
> > > sure what the state of things when it comes to cross c<->rust
> > > integration.  Ie. it is usually straightforward enough to track down
> > > all the spots in C code which would be affected by some change.  It
> > > might be easier to overlook things on the rust side.  On the mesa
> > > side, pre-merge CI jobs help to catch these issues.  Less sure about
> > > how to handle that on the kernel side.
> > >
> >
> > At least for Rusticl it's all within meson/ninja. We use bindgen to
> > generate the bindings automatically so you simply run into compilation
> > issues. And for the kernel side I think that Linus wanted Rust to be
> > non optional. If something uses it, you also make sure the Rust side
> > compiles. And the build system is dynamic enough that you can also
> > wire up bindgen and make it part of the normal development model.
> >
> > In regards to code tooling, for rust you usually rely on
> > rust-analyzer. I've already figured out with dcbaker on how to
> > integrate our meson setup with that. Atm I am able to get the full
> > experience with VScode. Not sure if we also need to figure out how
> > that can work with e.g. vim and how to deal with C <=> Rust
> > boundaries.

Yeah, I've used vscode with rust codebase (crosvm).. just not for a
project that includes the combination of a significant amount of both
.c and .rs.

If bindgen is integrated with the build system, that sounds fine as
far as helping to not overlook changes that are needed on the .rs side
of things.. crosvm seems to mainly make bindgen a manual step, but
then again it is mostly used for external dependencies like the
interface to virglrenderer

Side note, from my experience with crosvm, please be careful about any
external rust dependencies that are used.. rust still seems to be
young enough and evolving quickly enough that thing can quickly turn
into a big headache

BR,
-R

> > > BR,
> > > -R
> > >
> > > > CCing a bunch of people who think are the most impacted by it either
> > > > from a reviewer/maintainer or developer perspective. If you think some
> > > > others should be explicitly aware of this, please point them to this
> > > > discussion here.
> > > >
> > > > Karol
> > > >
> > >
>
