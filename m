Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514696BEF01
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 17:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4FF10EF4C;
	Fri, 17 Mar 2023 16:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D6710EF4C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 16:59:10 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bg11so4272971oib.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679072349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbbDQn1A8vthNnznohW7ycJC/LEOJ/kpAS8HmP79G5g=;
 b=HosbYxwVB7RIW33gKBDWMmwLOhKGvlQ3pOlPd4hpefavfzJ1clj7h2TS2GbVSRi3uv
 5eWdDD6HNSDbE1q2T4S66Is7Y7mDSLwPSefJVSNMny17IkWwzWxqqNJuXHfrwDMCP0Lf
 Er08wiZ2p6fHKOKrldHeWmqSXww/CV7Ehyx2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679072349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbbDQn1A8vthNnznohW7ycJC/LEOJ/kpAS8HmP79G5g=;
 b=sElo0GFt30j94CnQsCRmGF32UmE2PptDv7wNRKRF4Wii2AQJNmBBngwonIHz7uojnn
 EFXhBv9QOdrFOqWiaAKvGOfBfj+BRpuuPBZwfRj2to4eJUwhtGXEnAxQI8AeCZ2wIiRY
 M6X7W8ACe4zdv0JO4X7XpPRHAsKC4yXhFTJwOpK35r+eL9NmdPYvkaFeaJq2/wvTSWGL
 lj71KP+kmFZJeY09tzVMgHXbYCu1lGtOfKDHqswfjt/EPnFRpT5YMXdYbZd9ZeNMxuSP
 Pc3/4UsvnQs4iXhUPMo2mM8YMQgl4NzfEm1Aowybv4/KvpKUYLbdC3IUCbtRUeRrS6pD
 O1aQ==
X-Gm-Message-State: AO0yUKUCb7QpD42YPOQf50+ae+V5KIXiuzmZXhYGaS3U0mcR8R1NIluW
 bO2d7JjEQagIlbjH44FnTtKHWVviL5l8oRbhshEcOpzN/Wex46On
X-Google-Smtp-Source: AK7set+L2zleSfw5fVN0Oec1LbJ1X8C6NBaaRrjgnvp15TLcoL2wN9zgbF7gOISJ1rJb3tqW4k+GpBrcUV+ZbvYwyes=
X-Received: by 2002:a05:6808:b30:b0:386:bc3c:408b with SMTP id
 t16-20020a0568080b3000b00386bc3c408bmr1917639oij.8.1679072349591; Fri, 17 Mar
 2023 09:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
 <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
 <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Mar 2023 17:58:58 +0100
Message-ID: <CAKMK7uESvC-zgGJEup1OAmf34Rk8s5cCrSBYUNP_REFUuer1-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-doc@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andy Whitcroft <apw@canonical.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 at 18:30, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Mar 16, 2023 at 4:43=E2=80=AFAM Matthieu Baerts
> <matthieu.baerts@tessares.net> wrote:
> >
> > @Linus: in short, we would like to continue using the "Closes:" tag (or
> > similar, see below) with a URL in commit messages. They are useful to
> > have public bug trackers doing automated actions like closing a specifi=
c
> > ticket. Any objection from your side?
>
> As long as it's a public link, I guess that just documents what the
> drm people have been doing.
>
> I'm not convinced "Closes" is actually any better than just "Link:",
> though. I would very much hope and expect that the actual closing of
> any bug report is actually done separately and verified, rather than
> some kind of automated "well, the commit says it closes it, so.."
>
> So honestly, I feel like "Link:" is just a better thing, and I worry
> that "Closes:" is then going to be used for random internal crap.
> We've very much seen people wanting to do that - having their own
> private bug trackers, and then using the commit message to refer to
> them, which I am *violently* against. If it's only useful to some
> closed community, it shouldn't be in the public commits.

Yeah I think that's fine. The bot can then autogenerate a request in
the bug report to confirm that it's fixed, and ask the reporter to
close in that case. And then maybe if there's no message a few weeks
after the release, auto-close or something.

Bot needs to make sure it's only parsing tags for the instance it's
botting for anyway, so overloading Link: with all the meanings
(absolutely all themeanings!) is not really a problem since Closes:
has the same issue if different subsystems use it for different bug
tracking needs.

> And while the current GPU people seem to use "Closes:" the right way
> (and maybe some other groups do too - but it does seem to be mostly a
> freedesktop thing), I really think it is amenable to mis-use in ways
> "Link:" is not.

Huh I didn't realize this picked up. Way back we used Bugzilla: for
this sometimes, but I think just using Link: for everything and
letting instance-specific bots figure out whether it's relevant for
them should be perfectly fine. Humans should have no problem parsing
meaning out of a tag soup anyway (I mean we have Cc: stable meaning
backport after all, and I think that address is a blackhole).

I guess if you feel strongly we can percolate this a bit to
submaintainers and contributors in drm.
-Daniel

> The point of "Link:" is explicitly two-fold:
>
>  - it makes it quite obvious that you expect an actual valid web-link,
> not some internal garbage
>
>  - random people always want random extensions, and "Link:" is
> _designed_ to counter-act that creeping "let's add a random new tag"
> disease. It's very explicitly "any relevant link".
>
> and I really question the value of adding new types of tags,
> particularly ones that seem almost designed to be mis-used.
>
> So I'm not violently against it, and 99% of the existing uses seem
> fine. But I do note that some of the early "Closes:" tags in the
> kernel were very much complete garbage, and exactly the kind of thing
> that I absolutely detest.
>
> What does
>
>     Closes: 10437
>
> mean? That's crazy talk. (And yes, in that case it was a
> kernel.bugzilla.org number, which is perfectly fine, but I'm using it
> as a very real example of how "Closes:" ends up being very naturally
> to mis-use).
>
> End result: I don't hate our current "Closes:" uses. But I'm very wary of=
 it.
>
> I'm not at all convinced that it really adds a lot of value over
> "Link:", and I am, _very_ aware of how easily it can be then taken to
> be a "let's use our own bug tracker cookies here".
>
> So I will neither endorse nor condemn it, but if I see people using it
> wrong, I will absolutely put my foot down.
>
>                     Linus



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
