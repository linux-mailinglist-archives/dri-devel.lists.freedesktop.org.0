Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8CBB67DB
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26D810E04F;
	Fri,  3 Oct 2025 10:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IRASBGsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34C410E04F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:53:12 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b256c8ca246so461938566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759488791; x=1760093591; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xv2gpNFgYGQlw771XZUydF0n4XV+aO27CStYLLyqj80=;
 b=IRASBGsbLKLRZfJuyq2vF2WHrDyfVwQZZVSN7ZADPBtv+mhaow1MAUH/Nx4mxEVMJS
 rgqpVXW41bfNyMdjd083tgjo6+EWuyJ77f6C+vsrIKxzIZKoJq0Rl1SwpmKYO+r5Jsea
 VP84aEUpiCXBVXVNX7IqSqiSoLADtr5gHhpyZgyua0f19dBNRTSoFcXSFo7cL/QhSZzs
 jav1hCnU+3gdsP/w5rl9MsT6NQMEyg4wNmWbpp1Km15cnpPTmnp/amDyg2bULA7LhDAC
 IU26+bFe3pO40uYqRNn6Yy77gFugZy3aMPgYgaQSIKRnqIQLCva3QBNwV6djDkpixWuA
 5Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759488791; x=1760093591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xv2gpNFgYGQlw771XZUydF0n4XV+aO27CStYLLyqj80=;
 b=wtsNwB4u2MbRE740kCTHTSOPEJ6Re/Bos8Kov2WunyNjapQNE8omONUVF+M6XRVfvm
 +3yN3AguBRwGB+2MwItC8oslPxi8wO/JXjveB272cU8mf0JORYK1FmDPLe09DwCucHb8
 /emurOoTV7fpZfwWYrJGXwne6hV9LWqrfd0/vnkOTSeBGc+ONZYMJjwpAOBCWkb3GSI6
 /rTUXo6n8pwpu7c8OB+DSNcz679mU5tGGicIfMWzrGE0UE6dkSh/aUSEuwRpf05wvqcY
 EQi7NavwGJwJOiVszVyjrdp/fF3EPE9ynIdfDSaGUU0G8XSIK8jFx5TDFuJWqL4RZ8Or
 HGTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3XLL1O4o1+EV+CU8eH1ba00SNzdng9CRv4Gv9EigkbsohETJv56dW7VhS2BS/7PeXKLQ3QaqD71o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Pv8AtXo8TOL9iPKxbFQoFCYdmCUG/1XFtygj9nP36Aism9hZ
 nchkeVt2LhAACFtlrJH5llCpWLyordIOLu7JOEIhLTGG4gvWJUWzyvQmXzxYim8vOtSHnFbZAfh
 0If8mRr/QiwG1RZ48jkegZrsbmN+jKcg=
X-Gm-Gg: ASbGncs2ELvoinFHZ41ekgqcnzrftZl2yIdnpAorbaUviOTomRWS0Q3oiVxFpSMVR7s
 Rc5kpFq5nzxGojLash73gR8jsJlLoj6y/Xwv5C7p7539DvhC2J/6YQM4Ra/Q6oWd/otHEro2Yy7
 o3Je/jCoudHt+eUa86BZzJR8diQVB3Y00HJ/ytER6jVOl2UbelWNlBFUiLh4LgKni1z1e3v1s9K
 tGmRx4e8UHzUoLZLeOxE9JCKk/82Qz5/T+MDSx5
X-Google-Smtp-Source: AGHT+IGqD7IH0wzy2/Gvx8OVGLPE6VYVfVxxFLMsDXK6gStEMs7q8K2hIp1eXWthqk7Jht+6JYh+PeboTzqTp/1AZJM=
X-Received: by 2002:a17:907:7213:b0:b0b:f228:25a with SMTP id
 a640c23a62f3a-b49c449b9bdmr304825066b.64.1759488790849; Fri, 03 Oct 2025
 03:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
In-Reply-To: <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Oct 2025 20:52:58 +1000
X-Gm-Features: AS18NWCy6wg3P3shM0ZZ_lTlUy8RmsVTWNDf1yncrmx783MLpOxMuvgdnU4fC8c
Message-ID: <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Oct 2025 at 05:54, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Miguel: Rust conflict resolution question at the end ]
>
> On Tue, 30 Sept 2025 at 21:06, Dave Airlie <airlied@gmail.com> wrote:
> >
> > As usual, let me know if there are any problems.
>
> You are still corrupting indentation in your explanations.
>
> I don't know *what* you are doing wrong, but it's wrong. You seem to
> have lost all indentation.

I do that on purpose. there are Alloc: to show. Think C no python :-)

I get about 15-20 pull requests in various formats from very different
groups of people, if I just cut-n-paste them all into the changelog it
would be horribly inconsistent.

I try to harmonize them for myself, so they are somewhat visually
consistent, i.e. single level of indenting is my limit.

I can keep all the crazy if you feel it's valuable, for me it's just
different forms of the same information.

I'll let Miguel deal with rustfmt.

Dave.

>
> Look here as an example:
>
> > rust:
> > - drop Opaque<> from ioctl args
> > - Alloc:
> > - BorrowedPage type and AsPageIter traits
> > - Implement Vmalloc::to_page() and VmallocPageIter
> > - DMA/Scatterlist:
> > - Add dma::DataDirection and type alias for dma_addr_t
> > - Abstraction for struct scatterlist and sg_table
> > - DRM:
> > - simplify use of generics
> > - add DriverFile type alias
> > - drop Object::SIZE
> > - Rust:
> > - pin-init tree merge
> > - Various methods for AsBytes and FromBytes traits
>
> Notice how there are multiple sub-areas: Alloc, DMA/Scatterlist, DRM and Rust.
>
> But it's all just a random jumble, because you have apparently pasted
> it into your editor or MUA or whatever and dropped the indentation in
> the process.
>
> Or something.
>
> What kind of *broken* editor are you using? I'm not trying to start an
> emacs or vi war here, but you seem to be using something truly broken.
>
> EDLIN?
>
> And similar thing here:
>
> > msm:
> > - GPU and Core:
> > - in DT bindings describe clocks per GPU type
> > - GMU bandwidth voting for x1-85
> > - a623/a663 speedbins
> > - cleanup some remaining no-iommu leftovers after VM_BIND conversion
> > - fix GEM obj 32b size truncation
> > - add missing VM_BIND param validation
> > - IFPC for x1-85 and a750
> > - register xml and gen_header.py sync from mesa
> > - Display:
> > - add missing bindings for display on SC8180X
> > - added DisplayPort MST bindings
> > - conversion from round_rate() to determine_rate()
>
> Look, again, no logic and you've completely corrupted any multi-level
> indentation that presumably existed at some point judging by the
> organization.
>
> WTH?
>
> I try to make this all legible as I walk through it myself.
>
> So I regularly fix up peoples language skills etc, because I
> understand that English isn't always the native language (and that
> even if it is, some people just aren't very good at writing
> explanations).
>
> But these kinds of "I'm pretty sure you've just corrupted the
> formatting that was there in some original message" is just
> _annoying_.
>
> Please make the explanations *readable*, not just a random jumble of words.
>
> And on a more technical side: I absolutely detest the mindless and
> completely crazy Rust format checking.
>
> I noticed that people added multiple
>
>   use crate::xyz;
>
> next to each other, so I turned them into
>
>   use crate::{
>      xyz,
>     abc,
>   };
>
> instead to make it easy to just add another crate without messing crap
> up. The use statements around it had that format too, so it all seemed
> sensible and visually consistent.
>
> But then I run rustfmtcheck, and that thing is all bass-ackwards
> garbage. Instead of making it clean and clear to add new rules, it
> suggests
>
>   use crate::{xyz, abc};
>
> but I have no idea what the heuristics for when to use multiple lines
> and when to use that compressed format are.
>
> This is just ANNOYING. It's automated tooling that is literally making
> bad decisions for the maintainability. This is the kind of thing that
> makes future conflicts harder for me to deal with.
>
> Miguel, I know you asked me to run rustfmtcheck, but that thing is
> just WRONG. It may be right "in the moment", but it is
>
>  (a) really annoying when merging and not knowing what the heck the rules are
>
>  (b) it's bad long term when you don't have clean lists of "add one
> line for a new use"
>
> Is there some *sane* solution to this? Because I left my resolution
> alone and ignored the horrible rustfmtcheck results.
>
> I tried to google the rust format rules, and apparently it's this:
>
>     https://doc.rust-lang.org/style-guide/index.html#small-items
>
> can we please fix up whatever random heuristics? That small items
> thing may make sense when we're talking things that really are one
> common data structure, but the "use" directive is literally about
> *independent* things that get used, and smushing them all together
> seems entirely wrong.
>
> I realize that a number of users seem to just leave the repeated
>
>    use kernel::xyz;
>    use kernel::abc;
>
> as separate lines, possibly *becasue* of this horrendous rustfmt
> random heuristic behavior.
>
>               Linus
