Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2976A352F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC77710EBC3;
	Fri, 14 Feb 2025 00:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kkx.one header.i=@kkx.one header.b="G46XyWjx";
	dkim=permerror (0-bit key) header.d=kkx.one header.i=@kkx.one header.b="2pU9IPHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2025 19:30:19 UTC
Received: from uwu.kkx.one (uwu.kkx.one [37.221.196.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665E10E0FD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202411r; d=kkx.one; c=relaxed/relaxed;
 h=From:Subject:To:Date:Message-ID; t=1739474575; bh=6hNpM1gY/NUR9DUBtbD/GCe
 +m9x/2JKCR4VhU1/tHK4=; b=G46XyWjxwlQ8I4G1S6YxfnkRuDXFujldu8ee1qMmhDkuVo1MnM
 hF28P2jsYhSQH5ZaNqbx2Px90fZxymE+OMFPm+00X/9hZhZvbOCCFS7mcVJenvLU9OiLScmwL9F
 5um7Fnlt4zQF3G3sWGnfTz/5KwV4vmfG4d7Gz+PjwJLvhQn+uMLAy+em3CslzjspxqqkG8yywtK
 ZBORYEGrnJ3/12s8eSXVEEFPtGjFcmoe92tWBpjL4/b7gYZl6XAff/rCOSEgl6L5dLuM6WplVn+
 rf6br9gpDwbpbK1ZkytyfwCTr0hlEdAdFxeUFtuFMW0LT3klCc890QQ4N3jd7dckB3Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202411e; d=kkx.one; c=relaxed/relaxed;
 h=From:Subject:To:Date:Message-ID; t=1739474575; bh=6hNpM1gY/NUR9DUBtbD/GCe
 +m9x/2JKCR4VhU1/tHK4=; b=2pU9IPHff+Sr3LOXWulgpiggUT8weJcMJ8hCUE+6I62dJp+Z9+
 sLtwW8u9Yb6O9ubjDlLWfdG2s4LvDDOtzNDA==;
Message-ID: <6e3e26c7-002a-49c6-a3a8-1cc1b8941f57@kkx.one>
Date: Thu, 13 Feb 2025 20:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: a.hindborg@kernel.org, abdiel.janulgue@gmail.com, airlied@gmail.com,
 airlied@redhat.com, alex.gaynor@gmail.com, aliceryhl@google.com,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net,
 gregkh@linuxfoundation.org, hch@lst.de, iommu@lists.linux.dev,
 jgg@nvidia.com, kernel@valentinobst.de, linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, marcan@marcan.st, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, phasta@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
References: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Content-Language: en-US
From: 33KK <hello@kkx.one>
In-Reply-To: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

Honestly, how about you accept the fact that maybe the problem is you?

You're not doing any good by just scolding Hector for "social media 
brigading"
and not addressing the core issue, especially considering that LKML 
drama always
ends up on social media and on reaction content farms anyway, without the
"brigading", and Hector wasn't the one who started the drama.

You can't expect people to just keep going on and on in circular 
conversations
on the mailing list with somebody who isn't even engaging in good faith. 
These
conversations are about as technical as high school bullying, with you 
being the
teacher who punishes the one who tried to speak out, because they didn't 
want to
deal with figuring out who is right or wrong, and the victim is trying their
best to work out a solution for an unsolvable problem, since there's no 
solution
that the other side would accept.

Obviously, the people involved are tired of having this shit show happen 
again and
again and of course they will end up going to vent on social media, 
break down,
or leave, since they're not heard on the mailing list, and their mental 
health,
time and energy is clearly not respected by any of the adults present in the
room, judging by the complete inaction on the part of Linux's leadership.

You can't just pretend that multiple people leaving because of this is not a
problem. You can't just have people burn their time, energy and mental 
health on
pointless "discussions" and end up burning out, breaking down or leaving 
instead
of getting anything done. You can't just keep having your maintainers 
break down
one after another. This is not normal. This is not healthy. The process 
isn't
"working".

Just letting these "discussions" keep playing out like this is terrible
leadership, and is clearly not working well for mental health of people 
trying
to get involved with Linux.

You either want the R4L project to succeed and have new maintainers want 
to get
involved with the project, and you tell the hostile C maintainers to 
shut up and
cope with it, or you want the R4L project to fail and constantly have these
pointless "discussions" which boil down to some out of touch maintainer 
bullying
someone about something that should've been resolved long ago.

And as far as the *barely* technical arguments in the thread go:

The code is clearly exactly where it should be, in rust/kernel/dma, 
where else
is this supposed to go? Duplicating the bindings in multiple drivers 
would just
make the situation much worse, since now you have to worry about breaking
multiple copies of the bindings. R4L also proposed that they will 
maintain the
bindings.

Is the minor inconvenience of another maintainer having to review breaking
changes to DMA interfaces or some similar process to prevent build breakages
such a big deal compared to the pretty significant benefits Rust 
provides? The
Rust-based drivers were developed very quickly and ended up being way 
extremely
stable with relatively little effort compared to writing the same driver 
in C.

I think the benefits are pretty clear, if you can write a driver without
spending most of the time barely managing to tracking memory ownership 
in your
head, making sure you're not misusing underdocumented kernel APIs, etc.
obviously you're going to be significantly more productive, and it's 
also easier
for a new maintainer to get involved, since it's harder to break something.
Also, when writing safe bindings you have to double-check the safety of 
the API,
which helps to notice unsoundness in the C interface itself.

 > The only reason Linux managed to survive so long is by not having 
internal
 > boundaries

The actual reason Linux managed to survive so long is because of people 
working
together. Nobody understands the entirety of the kernel source, 
maintenance of
subsystems is split between different people that work together. What 
Christoph
is doing here, is pretty much opposite of that. He is actively trying to 
prevent
R4L from writing bindings to DMA, which are crucial to the project. 
Effectively
saying that the project should just go away entirely.

Christoph pretty clearly has no valid argument here.


NOTE: I am not affiliated in any way with R4L or Linux maintainers, I'm 
just a
Linux user watching this shitshow unfold, and am very disappointed about how
it's being handled.
