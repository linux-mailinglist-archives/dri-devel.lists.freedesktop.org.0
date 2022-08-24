Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D996859FE1A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0AA12B114;
	Wed, 24 Aug 2022 15:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96703113A25;
 Wed, 24 Aug 2022 15:18:46 +0000 (UTC)
Received: from beaker.jlekstrand.net
 (2603-8080-2102-63d7-019e-342e-5881-a163.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:19e:342e:5881:a163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: jekstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A26056601E8F;
 Wed, 24 Aug 2022 16:18:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661354324;
 bh=CKHuVBASiq0bwU1N9BiqmMpIEm+D2n6K1zJaGuYbHfM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=mqIcXO5o/cElB06Rd7CbFvQgQSfm6cJlnhFhILB6mLFk/46BqZr4azZB0Zry3aJch
 hyqemzAfUkQXowGItZ009Fr7ux/g1tDLlZzk4py6aJL1zilT09dsye+DTF4KPrZmoL
 CvOwY1Wvq3B8Hu1+CtBcr1IUsgypwYi/NZR3uQB2c+FQOfh9OUoMT8FIQO+QOs5Z/7
 GmQ8I0Cak1znohewkN/SuABTPXmpGd+AfNSEnXEszi7ICZaeIdVvxdBylYtMWoerba
 jtOjIoSWgnaef8BF6LkqTd74/caaOp+nzxCk56S2JRHGcg6KJEv5pks1+9r8eA5Ek9
 wUwuD2MpzvbBw==
Message-ID: <c9e47776a1328e077ce20643d0cd81dbf4381012.camel@collabora.com>
Subject: Re: Rust in our code base
From: Jason Ekstrand <jason.ekstrand@collabora.com>
To: Karol Herbst <kherbst@redhat.com>, Rob Clark <robdclark@gmail.com>, 
 mesa-dev@lists.freedesktop.org
Date: Wed, 24 Aug 2022 10:18:39 -0500
In-Reply-To: <CACO55tsgz6_c0wLzwBXdRfm9--NnSi6N+QBAuiLB+csc5Rkyfg@mail.gmail.com>
References: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
 <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
 <CACO55ttztg76GOCoNWSse7Xu6LAOz66LUeeZ8AmCdePZhghokA@mail.gmail.com>
 <CACO55ttrvvk=zH7hGdfv7xxUoUONpxbbVDVd1bp_zKs5X3NiGQ@mail.gmail.com>
 <CAF6AEGu9gq8Nsw60ZmdUKTOM-mT7Z7SM6mKBkzNDiY9p9-Eh9g@mail.gmail.com>
 <CACO55tsgz6_c0wLzwBXdRfm9--NnSi6N+QBAuiLB+csc5Rkyfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, marek.olsak@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dylan Baker <dylan.c.baker@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+mesa-dev and my jlekstrand.net e-mail

On Sun, 2022-08-21 at 20:44 +0200, Karol Herbst wrote:
> On Sun, Aug 21, 2022 at 8:34 PM Rob Clark <robdclark@gmail.com>
> wrote:
> >=20
> > On Sun, Aug 21, 2022 at 10:45 AM Karol Herbst <kherbst@redhat.com>
> > wrote:
> > >=20
> > > On Sun, Aug 21, 2022 at 7:43 PM Karol Herbst <kherbst@redhat.com>
> > > wrote:
> > > >=20
> > > > On Sun, Aug 21, 2022 at 5:46 PM Rob Clark <robdclark@gmail.com>
> > > > wrote:
> > > > >=20
> > > > > On Sat, Aug 20, 2022 at 5:23 AM Karol Herbst
> > > > > <kherbst@redhat.com> wrote:
> > > > > >=20
> > > > > > Hey everybody,
> > > > > >=20
> > > > > > so I think it's time to have this discussion for real.
> > > > > >=20
> > > > > > I am working on Rusticl
> > > > > > (
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15
> > > > > > 439)
> > > > > > which I would like to merge quite soon.
> > > > > >=20
> > > > > > Others might also plan on starting kernel drivers written
> > > > > > in Rust (and
> > > > > > if people feel comfortable to discuss this as well, they
> > > > > > might reply
> > > > > > here)
> > > > > >=20
> > > > > > The overall implication of that is: if we are doing this,
> > > > > > people (that
> > > > > > is we) have to accept that touching Rust code will be part
> > > > > > of our
> > > > > > development process. There is no other sane way of doing
> > > > > > it.
> > > > > >=20
> > > > > > I am not willing to wrap things in Rusticl so changing
> > > > > > gallium APIs
> > > > > > won't involve touching Rust code, and we also can't expect
> > > > > > people to
> > > > > > design their kernel drivers in weird ways "just because
> > > > > > somebody
> > > > > > doesn't want to deal with Rust"
> > > > > >=20
> > > > > > If we are going to do this, we have to do it for real,
> > > > > > which means,
> > > > > > Rust code will call C APIs directly and a change in those
> > > > > > APIs will
> > > > > > also require changes in Rust code making use of those APIs.
> > > > > >=20
> > > > > > I am so explicit on this very point, because we had some
> > > > > > discussion on
> > > > > > IRC where this was seen as a no-go at least from some
> > > > > > people, which
> > > > > > makes me think we have to find a mutual agreement on how it
> > > > > > should be
> > > > > > going forward.
> > > > > >=20
> > > > > > And I want to be very explicit here about the future of
> > > > > > Rusticl as
> > > > > > well: if the agreement is that people don't want to have to
> > > > > > deal with
> > > > > > Rust changing e.g. gallium, Rusticl is a dead project. I am
> > > > > > not
> > > > > > willing to come up with some trashy external-internal API
> > > > > > just to
> > > > > > maintain Rusticl outside of the mesa git repo.
> > > > > > And doing it on a kernel level is even more of a no-go.
> > > > > >=20
> > > > > > So what are we all thinking about Rust in our core repos?
> > > > >=20
> > > > > I think there has to be willingness on the part of rust folks
> > > > > to help
> > > > > others who aren't so familiar with rust with these sorts of
> > > > > API
> > > > > changes.=C2=A0 You can't completely impose the burden on others
> > > > > who have
> > > > > never touched rust before.=C2=A0 That said, I expect a lot of API
> > > > > changes
> > > > > over time are simple enough that other devs could figure out
> > > > > the
> > > > > related rust side changes.
> > > > >=20
> > > >=20
> > > > yeah, I agree here. I wouldn't say it's all the responsibility
> > > > of
> > > > developers changing APIs to also know how to change the code.
> > > > So e.g.
> > > > if an MR fails to compile and it's because of rusticl, I will
> > > > help out
> > > > and do the changes myself if necessary. But long term we have
> > > > to
> > > > accept that API changes also come with the implication of also
> > > > having
> > > > to touch Rust code.
> > > >=20
> > > > Short term it might be a learning opportunity for some/most,
> > > > but long
> > > > term it has to be accepted as a part of development to deal
> > > > with Rust.
> > > >=20
> > > > > As long as folks who want to start introducing rust in mesa
> > > > > and drm
> > > > > realize they are also signing up to play the role of rust
> > > > > tutor and
> > > > > technical assistance, I don't see a problem.=C2=A0 But if they
> > > > > aren't
> > > > > around and willing to help, I could see this going badly.
> > > > >=20
> > > >=20
> > > > Yep, I fully agree here. This is also the main reason I am
> > > > bringing
> > > > this up. Nobody should be left alone with having to deal with
> > > > changing
> > > > the code. On the other hand a "not having to touch Rust code
> > > > when
> > > > changing APIs" guarantee is something which is simply
> > > > impossible to
> > > > have in any sane architecture. So we should figure out under
> > > > which
> > > > circumstances it will be okay for everybody.
> >=20
> > Yeah, this sounds fine to me.
> >=20
> > > > At least I don't see a way how I can structure Rusticl so that
> > > > somebody working on gallium won't have to also deal with
> > > > rusticl. One
> > > > possibility would be to have a libgallium.so file I can link
> > > > to, but
> > > > then it's all about "stable gallium API" vs "not having to
> > > > touch rust
> > > > code" and I hope everybody prefers the second :)
> > > >=20
> > >=20
> > > uhm... I meant "stable gallium API" vs "dealing with Rust code on
> > > API changes"
> >=20
> > Yeah, stable gallium ABI makes as much sense as stable drm (in-
> > kernel)
> > ABI (ie. it doesn't).=C2=A0 So even if we tried to make it so that folk=
s
> > who haven't used rust much (or at all) yet on the gallium side,
> > we'll
> > still have to deal with it on the kernel side.=C2=A0 So let's not desig=
n
> > our APIs to avoid a learning curve.. lets' just recognize that the
> > learning curve will be there.

I think this is mostly fine.  If you're making a gallium change that
touches all the drivers, you need cross-project review as well.=20
Learning a bit of rust or asking one of the rust-knowledgable people to
update rusticl's wrappers seems reasonable at that point.

Where I would take issue is if various wrappers or inlines are
duplicated in rust such that a change which wouldn't break drivers
because they're all using the wrappers do break rust code.  I know
that, at least at one point, rusticl had some of this which is why I'm
pointing it out specifically.  I've not looked at the branch in a
while, though.

> > > > > I do also wonder a bit about code tooling (indexers, etc)..
> > > > > I'm not
> > > > > sure what the state of things when it comes to cross c<->rust
> > > > > integration.=C2=A0 Ie. it is usually straightforward enough to
> > > > > track down
> > > > > all the spots in C code which would be affected by some
> > > > > change.=C2=A0 It
> > > > > might be easier to overlook things on the rust side.=C2=A0 On the
> > > > > mesa
> > > > > side, pre-merge CI jobs help to catch these issues.=C2=A0 Less
> > > > > sure about
> > > > > how to handle that on the kernel side.
> > > > >=20
> > > >=20
> > > > At least for Rusticl it's all within meson/ninja. We use
> > > > bindgen to
> > > > generate the bindings automatically so you simply run into
> > > > compilation
> > > > issues. And for the kernel side I think that Linus wanted Rust
> > > > to be
> > > > non optional. If something uses it, you also make sure the Rust
> > > > side
> > > > compiles. And the build system is dynamic enough that you can
> > > > also
> > > > wire up bindgen and make it part of the normal development
> > > > model.
> > > >=20
> > > > In regards to code tooling, for rust you usually rely on
> > > > rust-analyzer. I've already figured out with dcbaker on how to
> > > > integrate our meson setup with that. Atm I am able to get the
> > > > full
> > > > experience with VScode. Not sure if we also need to figure out
> > > > how
> > > > that can work with e.g. vim and how to deal with C <=3D> Rust
> > > > boundaries.
> >=20
> > Yeah, I've used vscode with rust codebase (crosvm).. just not for a
> > project that includes the combination of a significant amount of
> > both
> > .c and .rs.
> >=20
>=20
> we have meson generate a rust-project.json file which you can point
> rust-analyzer to: https://github.com/mesonbuild/meson/pull/10682
>=20
> Sadly there is no "real" integration of rust and C code, so all you
> get are references to the bindgen generated files, but you can't jump
> to the actual C headers from there.

I would be very surprised if any sort of C refactoring tool could see
through bindgen now, or in the future.  Seeing across language
boundaries is tractable in C because it's basically a superset of C++.
(Yes, I know it's not really.)  I wouldn't expect a static analyzer to
see across a C/Python or C/Java boundary, so I don't expect it to be
able to see across C/rust.  (Sadly, the boundary is sharp enough that
that's a reasonable comparison.)

> > If bindgen is integrated with the build system, that sounds fine as
> > far as helping to not overlook changes that are needed on the .rs
> > side
> > of things.. crosvm seems to mainly make bindgen a manual step, but
> > then again it is mostly used for external dependencies like the
> > interface to virglrenderer
> >=20
> > Side note, from my experience with crosvm, please be careful about
> > any
> > external rust dependencies that are used.. rust still seems to be
> > young enough and evolving quickly enough that thing can quickly
> > turn
> > into a big headache
> >=20
>=20
> That's easy: meson doesn't support external crates, so no external
> rust dependencies are used at the moment :)
>=20
> But yeah, I was planning on using some where it really makes sense,
> but we can have this discussion once we get there. So far it all
> works
> without any external dependency besides bindgen.

I think most of us are agreed here.  Mesa has pretty strict rules about
pulling in piles of external dependencies and we don't want that to
change just because we added a bit of rust.  There may be a crate or
two that we want to pull in in the future but, for now, everything is
core.

One point not mentioned above is Rust compiler versions.  Because Rust
is a rapidly evolving language, new features are being added to the
language and standard library every day.  If we impose the same
requirements on Rust that we're imposing on GCC where we still compile
with a version from 10-15 years ago, that's going to really hamper
development.  We probably don't want to require people to always pull
the very latest compiler from nightly but I do think we want to be able
to bump the compiler version once a year or something.  IDK how distros
and others will feel about that.  Hopefully, they feel about the same
way towards compiler requirement bumps as they feel towards rust
itself.

--Jason

> > BR,
> > -R
> >=20
> > > > > BR,
> > > > > -R
> > > > >=20
> > > > > > CCing a bunch of people who think are the most impacted by
> > > > > > it either
> > > > > > from a reviewer/maintainer or developer perspective. If you
> > > > > > think some
> > > > > > others should be explicitly aware of this, please point
> > > > > > them to this
> > > > > > discussion here.
> > > > > >=20
> > > > > > Karol
> > > > > >=20
> > > > >=20
> > >=20
> >=20
>=20

