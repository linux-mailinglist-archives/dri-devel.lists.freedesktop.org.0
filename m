Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A207D6BD73D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 18:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58E10E215;
	Thu, 16 Mar 2023 17:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366BE10ED89
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 17:38:53 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y4so10765272edo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678988331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YryrzFP9xzjyk98MIHgDswzk42M925/BWmA7MtQw0v4=;
 b=Jfb1ynq4xrVSf1D4REHjnK+EpFGPfP00F+F8BOaN5HEXC3qaNn9aUdjJ2733ESlEK0
 JU8nAKUdkumIeRTUJDhi4W58XvQ2xI95nw4rzX+Wzex8PBuOjlkdial1tEPgfofb3Sy4
 5Q26RmAYM4S4xiB5B0Rovd/AuM6osIVwwp1gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678988331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YryrzFP9xzjyk98MIHgDswzk42M925/BWmA7MtQw0v4=;
 b=GHJ4fp7Rr9edjX90A4QrRtS/12SMuoeXfD2ndtR+uIBiNQiKB3OOvmRDTcu/pjoWWg
 lcMq4rHPeA0r6bZpNnlbskDxmISxM5IpEUinsGqf90bimGf4l4njJLf3I0Q8aU3zbyvt
 hO3BxW0VmixeRsXIlARqExkozS2fYnq2b4XhIWPUhFh5/JWZEhG0a/meCbxuWt95CpJw
 7gd6LjXuDqo4RNY7+i/Ur4qQM/yoUOoBNPFSzW5z3uOR1eXchmWKyD6JYj2YUA6nqA+Z
 mNA6djheZ1dvstUGBuJZyER1CkYrjnhrKPM8FxqTl5C8ZK6p6tsn1CRODZFO5aNnPHXT
 anJw==
X-Gm-Message-State: AO0yUKVntB6DwS43MIfsu/umqEj7N5mcM2B1o6qtrx8Zh2q2NdgBnb+7
 QmLJ5ioQv6/Jref7UxGoXekRI6kgTus4hmVZUSUazA==
X-Google-Smtp-Source: AK7set+7wFXaY2aVvANufrXdj/mx+y0FypGetE/7xDI8uqgzJfrhZiKUjDe7phnvmeFmBHrHzlYmQw==
X-Received: by 2002:a17:907:9708:b0:878:711d:9310 with SMTP id
 jg8-20020a170907970800b00878711d9310mr13791414ejc.1.1678988331053; 
 Thu, 16 Mar 2023 10:38:51 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 dt17-20020a170906b79100b0092bea699124sm4091495ejb.106.2023.03.16.10.38.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 10:38:50 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id cy23so10606528edb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 10:38:50 -0700 (PDT)
X-Received: by 2002:a17:907:2069:b0:8af:4963:fb08 with SMTP id
 qp9-20020a170907206900b008af4963fb08mr5816749ejb.15.1678987850768; Thu, 16
 Mar 2023 10:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
 <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
In-Reply-To: <81f8be3e-4860-baf9-8e13-fec3a103245b@tessares.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Mar 2023 10:30:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
Message-ID: <CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
To: Matthieu Baerts <matthieu.baerts@tessares.net>
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
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 4:43=E2=80=AFAM Matthieu Baerts
<matthieu.baerts@tessares.net> wrote:
>
> @Linus: in short, we would like to continue using the "Closes:" tag (or
> similar, see below) with a URL in commit messages. They are useful to
> have public bug trackers doing automated actions like closing a specific
> ticket. Any objection from your side?

As long as it's a public link, I guess that just documents what the
drm people have been doing.

I'm not convinced "Closes" is actually any better than just "Link:",
though. I would very much hope and expect that the actual closing of
any bug report is actually done separately and verified, rather than
some kind of automated "well, the commit says it closes it, so.."

So honestly, I feel like "Link:" is just a better thing, and I worry
that "Closes:" is then going to be used for random internal crap.
We've very much seen people wanting to do that - having their own
private bug trackers, and then using the commit message to refer to
them, which I am *violently* against. If it's only useful to some
closed community, it shouldn't be in the public commits.

And while the current GPU people seem to use "Closes:" the right way
(and maybe some other groups do too - but it does seem to be mostly a
freedesktop thing), I really think it is amenable to mis-use in ways
"Link:" is not.

The point of "Link:" is explicitly two-fold:

 - it makes it quite obvious that you expect an actual valid web-link,
not some internal garbage

 - random people always want random extensions, and "Link:" is
_designed_ to counter-act that creeping "let's add a random new tag"
disease. It's very explicitly "any relevant link".

and I really question the value of adding new types of tags,
particularly ones that seem almost designed to be mis-used.

So I'm not violently against it, and 99% of the existing uses seem
fine. But I do note that some of the early "Closes:" tags in the
kernel were very much complete garbage, and exactly the kind of thing
that I absolutely detest.

What does

    Closes: 10437

mean? That's crazy talk. (And yes, in that case it was a
kernel.bugzilla.org number, which is perfectly fine, but I'm using it
as a very real example of how "Closes:" ends up being very naturally
to mis-use).

End result: I don't hate our current "Closes:" uses. But I'm very wary of i=
t.

I'm not at all convinced that it really adds a lot of value over
"Link:", and I am, _very_ aware of how easily it can be then taken to
be a "let's use our own bug tracker cookies here".

So I will neither endorse nor condemn it, but if I see people using it
wrong, I will absolutely put my foot down.

                    Linus
