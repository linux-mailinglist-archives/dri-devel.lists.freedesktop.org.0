Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834964C8AAE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 12:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868410E121;
	Tue,  1 Mar 2022 11:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2A910E121;
 Tue,  1 Mar 2022 11:28:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qx21so30799294ejb.13;
 Tue, 01 Mar 2022 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=;
 b=ioxwEWwSec2mkWoQpVaP+m+cuqfrILVMZy97DsxGJQFNwUj5vt0t9wo5G7myUpC8Gn
 ea9oHHWNkcI1g0+ETzPDSekL4muwhDYsG3jrD0dPjJWnH1vW4gUq2ufbL8yBIo9ax2rC
 LCc4peu3G2+oC3D/CoxTwxe0jKznErkS9hGO2cQ4rpTAmgLJ5M6BCvPaoqQObgiQcr6n
 RKDduahlScES6wicQqME3eGzY8GUno55Oqx2eUsC/sQVyrcKAkNt4/DW8JZWJd6l/Vwp
 mTTzA+edxLDCldwyXcUf3Jn0ErW39L5ba+PqRXF7jiU95w3jgcW/Rs/bUGAwA8mWZWkw
 L2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=;
 b=wnosJEtt+lStdp5RbnD3LICp8D3gBbuhoGeTYi9vBHRbLzjt4P/273lOph/aM+2Y5w
 TpoMfyg33NliiTZLlNPcZLJElzLhnZpqnlHvUPBR+sNOSmuCREdjJkzrtFtm5OS6I9Ew
 jOjC87f0xN8nIkIJ6ypjfQuhp270kzibYZVoIM0vZpcPIGK4NIIaDy483f53k55wfqFh
 Kr3BP0qW5IOUXrcsrfSdQJ9kU3QLY2a0DeasT4jwNRIVnM0zACJ9Gr9PGJ9V2a1CWvkh
 re+wVepiCYcDpVxgQINE4D1koKO7IBOFB3deBgpRo0GmS8xy46IRBNy4cjESexpBA/Vk
 PIrg==
X-Gm-Message-State: AOAM531LvL/P5hC/JlXhAzSxQag+RS4J388kTgx3IUZQ3WDY1whtjr0a
 5AeUjsU3iuRtinvBuUSLSr8=
X-Google-Smtp-Source: ABdhPJykJwlP+KqTh6zSzndCpDSZzE2bN4aLh28OSmyBBaWLei6TdHv4i/sMtFtkO4GxsNuXK9LBkw==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr18827008ejr.41.1646134097608; 
 Tue, 01 Mar 2022 03:28:17 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:6db3:8d4c:747e:98ad])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a50ff19000000b0040f84cd806csm7036870edu.59.2022.03.01.03.28.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 03:28:17 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Date: Tue, 1 Mar 2022 12:28:15 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On 1. Mar 2022, at 01:41, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> =
wrote:
>>=20
>> The goal of this is to get compiler warnings right? This would indeed =
be great.
>=20
> Yes, so I don't mind having a one-time patch that has been gathered
> using some automated checker tool, but I don't think that works from a
> long-term maintenance perspective.
>=20
> So if we have the basic rule being "don't use the loop iterator after
> the loop has finished, because it can cause all kinds of subtle
> issues", then in _addition_ to fixing the existing code paths that
> have this issue, I really would want to (a) get a compiler warning for
> future cases and (b) make it not actually _work_ for future cases.
>=20
> Because otherwise it will just happen again.
>=20
>> Changing the list_for_each_entry() macro first will break all of =
those cases
>> (e.g. the ones using 'list_entry_is_head()).
>=20
> So I have no problems with breaking cases that we basically already
> have a patch for due to  your automated tool. There were certainly
> more than a handful, but it didn't look _too_ bad to just make the
> rule be "don't use the iterator after the loop".
>=20
> Of course, that's just based on that patch of yours. Maybe there are a
> ton of other cases that your patch didn't change, because they didn't
> match your trigger case, so I may just be overly optimistic here.

Based on the coccinelle script there are ~480 cases that need fixing
in total. I'll now finish all of them and then split them by
submodules as Greg suggested and repost a patch set per submodule.
Sounds good?

>=20
> But basically to _me_, the important part is that the end result is
> maintainable longer-term. I'm more than happy to have a one-time patch
> to fix a lot of dubious cases if we can then have clean rules going
> forward.
>=20
>> I assumed it is better to fix those cases first and then have a =
simple
>> coccinelle script changing the macro + moving the iterator into the =
scope
>> of the macro.
>=20
> So that had been another plan of mine, until I actually looked at
> changing the macro. In the one case I looked at, it was ugly beyond
> belief.
>=20
> It turns out that just syntactically, it's really nice to give the
> type of the iterator from outside the way we do now. Yeah, it may be a
> bit odd, and maybe it's partly because I'm so used to the
> "list_for_each_list_entry()" syntax, but moving the type into the loop
> construct really made it nasty - either one very complex line, or
> having to split it over two lines which was even worse.
>=20
> Maybe the place I looked at just happened to have a long typename, but
> it's basically always going to be a struct, so it's never a _simple_
> type. And it just looked very odd adn unnatural to have the type as
> one of the "arguments" to that list_for_each_entry() macro.
>=20
> So yes, initially my idea had been to just move the iterator entirely
> inside the macro. But specifying the type got so ugly that I think
> that
>=20
>        typeof (pos) pos
>=20
> trick inside the macro really ends up giving us the best of all =
worlds:
>=20
> (a) let's us keep the existing syntax and code for all the nice cases
> that did everything inside the loop anyway
>=20
> (b) gives us a nice warning for any normal use-after-loop case
> (unless you explicitly initialized it like that
> sgx_mmu_notifier_release() function did for no good reason
>=20
> (c) also guarantees that even if you don't get a warning,
> non-converted (or newly written) bad code won't actually _work_
>=20
> so you end up getting the new rules without any ambiguity or mistaken
>=20
>> With this you are no longer able to set the 'outer' pos within the =
list
>> iterator loop body or am I missing something?
>=20
> Correct. Any assignment inside the loop will be entirely just to the
> local loop case. So any "break;" out of the loop will have to set
> another variable - like your updated patch did.
>=20
>> I fail to see how this will make most of the changes in this
>> patch obsolete (if that was the intention).
>=20
> I hope my explanation above clarifies my thinking: I do not dislike
> your patch, and in fact your patch is indeed required to make the new
> semantics work.

ok it's all clear now, thanks for clarifying.
I've defined all the 'tmp' iterator variables uninitialized so applying
your patch on top of that later will just give the nice compiler warning=20=

if they are used past the loop body.

>=20
> What I disliked was always the maintainability of your patch - making
> the rules be something that isn't actually visible in the source code,
> and letting the old semantics still work as well as they ever did, and
> having to basically run some verification pass to find bad users.

Since this patch is not a complete list of cases that need fixing (30%)
I haven't included the actual change of moving the iterator variable
into the loop and thought that would be a second step coming after this
is merged.

With these changes alone, yes you still rely on manual verification =
passes.

>=20
> (I also disliked your original patch that mixed up the "CPU
> speculation type safety" with the actual non-speculative problems, but
> that was another issue).
>=20
>                Linus

- Jakob

