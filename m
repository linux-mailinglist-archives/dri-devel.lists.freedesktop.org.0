Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AFD6FF7DC
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 18:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967910E597;
	Thu, 11 May 2023 16:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696F10E557
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 16:57:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-96652cb7673so908902266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1683824219; x=1686416219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eIrlHj/p33851IJJUMyIELQCvN7E0tMoFl3kn+VUlQ=;
 b=dQdlSJJShMCYrjbpDwabk+FIT1A2SafS8siQovAjZSLcbr09KWFdhCkO9t/VIAkbqI
 SxemabX9Sq3kys1riygVnfhgZuzsjURbfsb/nCAN/YnjFKBzxaiJ/w9ucec4NGH15MPU
 61c7/T5Y3L2SPnuLni16BoNq+MMtvU8maaMJw5GLkbPZQ71vWi7dfUxSHIj+wdqodTor
 RANrriCzgmuJpVHMLm9uWG6lxinoDEb7j5DJ4d4IewfpOQPaaK3Mszx5TaHfBTivoR+5
 5y/Fro+XzhitfhJZbHlPvNZiNKDKuXiruuBrceN/TxE2izNoS44uDSm6+BIc+8S6RHuS
 +/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824219; x=1686416219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eIrlHj/p33851IJJUMyIELQCvN7E0tMoFl3kn+VUlQ=;
 b=ai5bTm3mqF8LECBhId9LUYS8CVK7zKJnsBIddLk3kaF+e/WLatbAaiTOMq3VfIPUFw
 KvPHsjAaxZE+bXRYOES2r0qDsC72Lb23nRH5Aefkc9A3fJjPdmSIW2wnTiAPmYYdyTb5
 k7b02v8jxMKH7yFLZklzUxTwWg9i6iq220gUheYYFkGdxdSmEqL3bgHZ0X6vqT0UVz5B
 AWt1YHTdb6ooWPmO7nrFKJvmyfooN9sn0ZWYO1IsZ7DyxD36Vu87o0kdd4sKD051Rx1+
 Kr8EyYmuH7m56eSZRK5I3oejtf//e2sdn3kT+smdiuqKs4wbk07uUV4i52LkUStysJU3
 x1oQ==
X-Gm-Message-State: AC+VfDwaqLQ4dY1UMk8SGWSwtCZkKx7GkeY2Y1MLdSd2nZlpfLbZQXF6
 A6qtdmM8zOMjSjJ8vhpyIVRP65cw7lbi9nqMoWUykw==
X-Google-Smtp-Source: ACHHUZ4hRQqLqkE/B/A+YhVQOlBYiVRpNb2LivlkGkEKdrOd4mb80j4IlwnpG+RDILzLfhCMoIeY6A4H/3GExTih4Lw=
X-Received: by 2002:a17:906:ef06:b0:960:d9d:ffb5 with SMTP id
 f6-20020a170906ef0600b009600d9dffb5mr18341154ejs.41.1683824218741; Thu, 11
 May 2023 09:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
 <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
In-Reply-To: <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
From: Joshua Ashton <joshua@froggi.es>
Date: Thu, 11 May 2023 16:56:47 +0000
Message-ID: <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we are talking about being 'prescriptive' in the API, are we
outright saying we don't want to support arbitrary 3D LUTs, or are we
just offering certain algorithms to be 'executed' for a plane/crtc/etc
in the atomic API? I am confused...

There is so much stuff to do with color, that I don't think a
prescriptive API in the kernel could ever keep up with the things that
we want to be pushing from Gamescope/SteamOS. For example, we have so
many things going on, night mode, SDR gamut widening, HDR/SDR gain,
the ability to apply 'looks' for eg. invert luma or for retro looks,
enhanced contrast, tonemapping, inverse tonemapping... We also are
going to be doing a bunch of stuff with EETFs for handling out of
range HDR content for scanout.

Some of what we do is kinda standard, regular "there is a paper on
this" algorithms, and others are not.
While yes, it might be very possible to do simple things, once you
start wanting to do something 'different', that's kinda lock-in.

Whether this co-exists with arbitrary LUTs (that we definitely want
for SteamOS) or not:
I think putting a bunch of math-y stuff like this into the kernel is
probably the complete wrong approach. Everything would need to be
fixed point and it would be a huge pain in the butt to deal with on
that side.

Maybe this is a "hot take", but IMO, DRM atomic is already waaay too
much being done in the kernel space. I think making it go even further
and having it be a prescriptive color API is a complete step in the
wrong direction.

There is also the problem of... if there is a bug in the math here or
we want to add a new feature, if it's kernel side, you are locked in
to having that bug until the next release on your distro and probably
years if it's a new feature!
Updating kernels is much harder for 'enterprise' distros if it is not
mission critical. Having all of this in userspace is completely fine
however...

If you want to make some userspace prescriptive -> descriptive color
library I am all for that for general case compositors, but I don't
think I would use something like that in Gamescope.
That's not to be rude, we are just picky and want freedom to do what
we want and iterate on it easily.

I guess this all comes back to my initial point... having some
userspace to handle stuff that is either kinda or entirely vendor
specific is the right way of solving this problem :-P

- Joshie =F0=9F=90=B8=E2=9C=A8

On Thu, 11 May 2023 at 09:51, Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, May 10, 2023 at 9:59=E2=80=AFAM Jonas =C3=85dahl <jadahl@redhat.c=
om> wrote:
> >
> > On Tue, May 09, 2023 at 08:22:30PM +0000, Simon Ser wrote:
> > > On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> w=
rote:
> > >
> > > > There are also other vendor side effects to having this in userspac=
e.
> > > >
> > > > Will the library have a loader?
> > > > Will it allow proprietary plugins?
> > > > Will it allow proprietary reimplementations?
> > > > What will happen when a vendor wants distros to ship their
> > > > proprietary fork of said library?
> > > >
> > > > How would NVIDIA integrate this with their proprietary stack?
> > >
> > > Since all color operations exposed by KMS are standard, the library
> > > would just be a simple one: no loader, no plugin, no proprietary piec=
es,
> > > etc.
> > >
> >
> > There might be pipelines/color-ops only exposed by proprietary out of
> > tree drivers; the operation types and semantics should ideally be
> > defined upstream, but the code paths would in practice be vendor
> > specific, potentially without any upstream driver using them. It should
> > be clear whether an implementation that makes such a pipeline work is i=
n
> > scope for the upstream library.
> >
> > The same applies to the kernel; it must be clear whether pipeline
> > elements that potentially will only be exposed by out of tree drivers
> > will be acceptable upstream, at least as documented operations.
> >
>
> they aren't. All code in the kernel needs to be used by in-tree
> drivers otherwise it's fair to delete it. DRM requires any UAPI change
> to have a real open source user in space user.
>
> Nvidia knows this and they went to great lengths to fulfill this
> requirement in the past. They'll manage.
>
> >
> > Jonas
> >
>
