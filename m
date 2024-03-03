Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220886F429
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 10:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E312510F928;
	Sun,  3 Mar 2024 09:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DF910F927
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 09:31:14 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-607f8894550so23692937b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 01:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709458271; x=1710063071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+h+cxR9Zi+zZIFamlmv2ivpOejR06HV/J+RWDkEaK2g=;
 b=KKt3uU2tvtsa8A8p8mh4RWibAAyX66eVDDx+cGQvoOnRGaRt286Syq5yalfgp6Gvx8
 HCuklLzv0TU/FzV0wnhnY2bauRE9RB830naudFHPCDar/ish8meQZzt8SAV64hFq18+H
 q2R1XoUJC+nefqHrNmPMF8cKTaSIx1tcTQDK0Ldson5aU7dmzHxGr993XGINnnnSuiIh
 Em3VD/YARFkKU2GYm7KOQExI4/mXDWPgBG2WzLuAW+JEijg18zZ9XyhMnQd8cXQbYfXi
 qALwAeTubI3OBKNbCqrvI7CAESyyjo03dakS4xUyomquMpneEa7S/hfvROf73zBIEtfd
 44zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNvfvJ+hbPW4s6lVFVmK4Uz4h1fVpiZ9FlxPUrZlC6lQIj/3vQz2dycB07FQYvV/iHvWts5JE2zCUaR7CNeXZVX2aXfjCtbU8G3gnngZxL
X-Gm-Message-State: AOJu0YyBDUHYUf/1SdYrxqdSrxSxvd0lvJWRi3NGs0+M3TnX4bcaRYG4
 MICtlrHEMqkTriClZsp29SC2DgaIcSjhYeHBtcnVmYlqPgw/Icp9S4s24i4Hmdw=
X-Google-Smtp-Source: AGHT+IH4FkWJDmWLEkBskojYi12NpZuDAshx2+ji8SDaRcx+tzpr3OMUh3UDXonSLNbo7omZmXKlaQ==
X-Received: by 2002:a81:49d5:0:b0:609:4736:b05d with SMTP id
 w204-20020a8149d5000000b006094736b05dmr5672582ywa.1.1709458270844; 
 Sun, 03 Mar 2024 01:31:10 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 h130-20020a816c88000000b0060997a156dcsm638633ywc.78.2024.03.03.01.31.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 01:31:10 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcd94fb9e4dso3465833276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 01:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrK0c8wcaf2YPJOF0p0iMdB5gHBySsbvbmsEwxs5ubRUwNIzUZNr3/E5OaqH4IYubHW4oMfL4oPZrtl0TXEdIEzMOZC/uK2UrpLi8nwUtf
X-Received: by 2002:a81:8494:0:b0:604:9b50:e973 with SMTP id
 u142-20020a818494000000b006049b50e973mr5488306ywf.44.1709458269052; Sun, 03
 Mar 2024 01:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
In-Reply-To: <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Mar 2024 10:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
Message-ID: <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <groeck@google.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, 
 Nikolai Kondrashov <spbnick@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> On 3/2/24 14:10, Guenter Roeck wrote:
> > On Thu, Feb 29, 2024 at 12:21=E2=80=AFPM Linus Torvalds
> > <torvalds@linuxfoundation.org> wrote:
> >> On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> w=
rote:
> >>>
> >>> However, I think a better approach would be *not* to add the .gitlab-=
ci.yaml
> >>> file in the root of the source tree, but instead change the very same=
 repo
> >>> setting to point to a particular entry YAML, *inside* the repo (somew=
here
> >>> under "ci" directory) instead.
> >>
> >> I really don't want some kind of top-level CI for the base kernel proj=
ect.
> >>
> >> We already have the situation that the drm people have their own ci
> >> model. II'm ok with that, partly because then at least the maintainers
> >> of that subsystem can agree on the rules for that one subsystem.
> >>
> >> I'm not at all interested in having something that people will then
> >> either fight about, or - more likely - ignore, at the top level
> >> because there isn't some global agreement about what the rules are.
> >>
> >> For example, even just running checkpatch is often a stylistic thing,
> >> and not everybody agrees about all the checkpatch warnings.
> >
> > While checkpatch is indeed of arguable value, I think it would help a
> > lot not having to bother about the persistent _build_ failures on
> > 32-bit systems. You mentioned the fancy drm CI system above, but they
> > don't run tests and not even test builds on 32-bit targets, which has
> > repeatedly caused (and currently does cause) build failures in drm
> > code when trying to build, say, arm:allmodconfig in linux-next. Most
> > trivial build failures in linux-next (and, yes, sometimes mainline)
> > could be prevented with a simple generic CI.
>
> Yes, definitely. Thanks for bringing that up.

+1

> > Sure, argue against checkpatch as much as you like, but the code
> > should at least _build_, and it should not be necessary for random
> > people to report build failures to the submitters.
>
> I do 110 randconfig builds nightly (10 each of 11 $ARCH/$BITS).
> That's about all the horsepower that I have. and I am not a CI.  :)
>
> So I see quite a bit of what you are saying. It seems that Arnd is
> in the same boat.

You don't even have to do your own builds (although it does help),
and can look at e.g. http://kisskb.ellerman.id.au/kisskb/

Kisskb can send out email when builds get broken, and when they get
fixed again.  I receive such emails for the m68k builds.
I have the feeling this is not used up to its full potential yet.
My initial plan with the "Build regressions/improvements in ..." emails
[1] was to fully automate this, and enable it for the other daily builds
(e.g. linux-next), too, but there are only so many hours in a day...

[1] https://lore.kernel.org/all/20240226081253.3688538-1-geert@linux-m68k.o=
rg/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
