Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB5A2DE2F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B6510E497;
	Sun,  9 Feb 2025 13:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1177 seconds by postgrey-1.36 at gabe;
 Fri, 07 Feb 2025 12:36:48 UTC
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB50110E322
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 12:36:48 +0000 (UTC)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 517CGfoY007959;
 Fri, 7 Feb 2025 06:16:41 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 517CGcXR007958;
 Fri, 7 Feb 2025 06:16:38 -0600
Date: Fri, 7 Feb 2025 06:16:38 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250207121638.GA7356@wind.enjellic.com>
References: <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh> <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3
 (wind.enjellic.com [127.0.0.1]); Fri, 07 Feb 2025 06:16:41 -0600 (CST)
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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
Reply-To: "Dr. Greg" <greg@enjellic.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 06, 2025 at 09:58:36AM -0800, Linus Torvalds wrote:

Good morning to everyone.

> On Thu, 6 Feb 2025 at 01:19, Hector Martin <marcan@marcan.st> wrote:
> >
> > If shaming on social media does not work, then tell me what does,
> > because I'm out of ideas.

> Because if we have issues in the kernel development model, then
> social media sure as hell isn't the solution. The same way it sure
> as hell wasn't the solution to politics.
>
> Technical patches and discussions matter. Social media brigading - no
> thank you.

I truely wish that technical patches and discussions were the currency
that matter but I believe we are struggling with that, at least in
some venues in the kernel development process.

No one should construe that statement as an endorsement of berating
people on social media as the 'fix'.

I come at this from the perspective of having worked on Linux since
around December of 1991.  I first met you and Tove in 1995 at the Free
Software Conference at MIT that Stallman sponsored.  When we first
met, I told you that cancer patients in North Dakota were enjoying
more time with their families because of what we were able to do with
Linux and optimizing medical processes at our Cancer Center.

RedHat paid me to speak at a number of conferences in the 90's talking
about how Linux was going to dominate enterprise computing, given that
it was about technology people doing the 'right' technology thing.

I'm seeing things that make me regret those words.

Probably the last technical contribution of my career is leading an
initiative to provide the Linux community a generic security modeling
architecture.  Not to supplant or replace anything currently being
done, but to provide a flexible alternative to the development of
alternate and/or customized workload models, particularly in this era
of machine learning and modeling.

Four patch series over two years, as of yesterday, not a single line
of code ever reviewed.

For a contribution that touches nothing outside of its own directory
and does nothing unless people choose to execute a workload under its
control.

We were meticulous in our submissions to avoid wasting maintainers
time.  We even waited two months without hearing a word before we sent
an inquiry as to the status of one of the submissions.  We were told,
rather curtly, that anything we sent would likely be ignored if we
ever inquired about them.

We tried to engage, perhaps to excess, in technical discussions
attempting to explain why and how we chose to implement what we were
proposing.  Including input from advisors who are running production
IT systems that feel that there needs to be better approaches to
addressing their security needs.

There were never any relevant technical exchanges.  The discussion
consisted of, we have decided to do things a certain way, no
discussion, if you don't like that you should really consider doing
something other than submitting to upstream Linux.

The all powerful sub-system maintainer model works well if the big
technology companies can employ omniscient individuals in these roles,
but those types are a bit hard to come by.  Lacking that, there is the
tangible risk of stifling innovation and Linux is the only place that
innovation can occur in the operating system space.

Not sure what the fix is, from a project management perspective the
technology industry has never faced a challenge like this.  The fork
model, which was the classic protection in open-source, doesn't work
at this scale.

We have a Code Of Conduct that we can't scream or hurl four letter
words and insults at one another.  Maybe it already exists but a Code
Of Standards for maintainers would seem to be an imperative if we are
going to move forward productively.  Jim are you listening?

Obviously respect and open-mindedness to new ideas appears to be the
grease that makes all of this run smoothly.  Unfortunately that seems
to be about as rare a commodity as omniscience in our industry.

>                  Linus

Linus, best wishes to you and your family, it has been a fascinating
ride and thing to watch.

As always,
Dr. Greg

The Quixote Project - Flailing at the Travails of Cybersecurity
              https://github.com/Quixote-Project
