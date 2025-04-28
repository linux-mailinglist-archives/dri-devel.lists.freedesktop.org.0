Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE45A9FB44
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8BE10E27F;
	Mon, 28 Apr 2025 20:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ezAxGP1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448BF10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:58:49 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac25520a289so834550266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745873928; x=1746478728;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXxnMI8M/GtLF+9NF954ti8G8yA0onSPXV9Pub/d3Ic=;
 b=ezAxGP1Ul/wYabCIQO0Z/Y3/dNIW1y+Wd/WrfUZ+pkF77NPDxAm8YCXbOy6xP51OK9
 Id6yK6r21aB6blm5xBQbA07Z+E03vLunFEoXJnfrq6RnE8E+GhJc0CbgoGQf0CPMixDr
 ilWVxMETAgzL7c7EaNXfT5GIwqhlxgTKaDkgEyCwZcJbnxP72k0XP7B6rB04zjHq6qlk
 PSKfi9xYXxJMOFl7ncXbfhiTyfnQlB1ybvz78zEvTIRX6pHMiT7DIn8eI72HJAiVpY+Q
 Cp5MNFnk8HFDCWnP3KCJw6ZEhTQhhN+UotpdyGRD/+fktBSSlHKyuf1JU8gY2IGoUV4/
 hegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873928; x=1746478728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXxnMI8M/GtLF+9NF954ti8G8yA0onSPXV9Pub/d3Ic=;
 b=GxNcuL2C7L9vPVFrX9uYVXOF9OQv/jRwXpEHf1FhiH6ho4PLQCx7lPMfixm4C4/Del
 809yVUklQjeFVipiIM3CnuAw68jFTmU5DoDGvbhW80O8kHqthX2NAQw1+N9vyA6BKRD8
 c7t58bcpKDge/bxlgDbfLwm2i0lrt39GLVYvVh0d8RlZJsbSbrCJtWryobCbq7Q6L6oa
 12iAun+156EjZfQM5qcwKKgvyJ6HLO3kWTcGk1lnKAhPor1tbQWdRskWPuI7KJImqx6z
 dDRxh//cMWu8VD5fsvDi1h42xFMLUfMLwUUsgzKL7OVyJp2kk4FUWxaWHTqUmbgBUExJ
 6o6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU46t79N/lKVT+d5g7Pqe0YslQtLDb0lTuQfwRoOMrMpB5V1PWCFevIsBQ2BaVxRCrLbz6JILpaBw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnCPRcU3BWTq+A/fo1Js47YY2PPJfy3Xmg/BJnHtKK9qqhkivN
 X8fFgQo8eYNiz+2STKX2Ts8Sp4WkKQQbDGo2wuzfxn1q/npxi5E9/M0d9aoSq6fAc3p21Rl98f6
 vc9XKayxEKSZLp9jUzepRnne1eoQJAH8i+Tw=
X-Gm-Gg: ASbGncsy/DnGIVuQp+prRiWTwssHV5v8orY/euU2QGUUNnkbbiM6hXC3DY6DYAYiaMj
 COM5gQavK83h4sXiwpDHa90La75HtseJeLy9hA1aAoQ/CRrxoOHIdQMWxjlza89Gftkd5UDprAA
 Uem0RzllZpfkD9Fzfg/04=
X-Google-Smtp-Source: AGHT+IGOyelpELUrcOaJAvR9wIXmVNLb4kVyS6Bj3YvQoR4friAxcC5mv6fARKTEWbb74RFaxnK/H/YGZe2ubcspY0I=
X-Received: by 2002:a17:907:2da3:b0:ace:3643:1959 with SMTP id
 a640c23a62f3a-acec4b404d3mr117462266b.7.1745873927652; Mon, 28 Apr 2025
 13:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
In-Reply-To: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 13:58:30 -0700
X-Gm-Features: ATxdqUF4QkWNeHvPaIyn2o9vl9GR7lp0ClD6ieeSP_GVkSD20WfrHb3VJY9h8jg
Message-ID: <CAGG=3QVJWRNUEAm=bbszJGvAwT-1Fka4hd-0R6Uszyx8WZ3zQQ@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Justin Stitt <justinstitt@google.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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

On Mon, Apr 28, 2025 at 12:34=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 28 Apr 2025 at 11:08, Bill Wendling <morbo@google.com> wrote:
> >
> > This situation is one of the
> > easier ones: "do something other than fall into the next function";
>
> Note that the "fall into the next function" is just something that
> objtool notices. It *could* be "fall into the next basic block of the
> same function, and objtool wouldn't warn, because objtool generally
> wouldn't notice (there could be other things that make objtool notice,
> of course - things like stack updates being out of whack or similar).
>
> But I really wish that clang would look at a "don't depend on UD as a
> code generation model AT ALL" as a flag.
>
> The whole "this is undefined, so I'll generate something different"
> model is just wrong.
>
> That said, there are certainly graduations of wrong:
>
> > but there are far more involved examples, of course. And even in this
> > case, the compiler needs to know if a "trap" is okay, or would
> > returning with garbage in %rax be okay.
>
> Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT=
 ALL.
>
> IOW, just generate the divide instruction.
>
> I can almost guarantee that that will actually then generate the best
> code too, because you'll probably just end up sharing the divide
> instruction will all the *normal* cases.
>
I get what you're saying, I really do. I'm actually in the "playing
Wack-A-Mole(tm) is far better than generating code that accidentally
launches the nukes" crowd. The fact that the compiler silently
generates something wrong is horrifying to me. The compiler has a ton
of options to allow for "bad" math, but they're mostly (all?) for
floating point operations. It has some for integers, like the -fwrapv
you mentioned.

> So the best model is to literally remove that pointless and stupid "is
> this a divide by zero" code. It's pointless and stupid because it
> literally just makes for more work both for the compiler AND it
> generates worse code.
>
> Why do extra work to generate worse code?
>
> Btu if some religious nutcase decides that "I will not generate divide
> instructions if I know the divisor is zero" is a hill they will die
> on, generating a "trap" instruction is certainly not inexcusable.
>
I'll see what I can do with this. I might be able to sneak a patch in
past the religious nutcases. The fact that we have the two flags
Nathan and I mentioned could indicate that someone will be amenable to
the patch.

-bw

> Generating a random value for %eax is WRONG. Now, that said, it's
> clearly less wrong than falling through to some unrelated code
> entirely, so it would be an improvement on the *current* situation,
> but that's like saying that getting shot in the foot is an improvement
> on getting shot in the head: true, but if the alternative is not
> getting shot at all, why is that "less bad" alternative even on the
> table?
>
> The "just execute random code" is clearly so bad that it *should* be
> off the table in the first place, and I don't understand why it is
> what clang does now. It's just crazy.
>
> And yes, this really is a very potential and real security issue. In
> the kernel I don't think we have this ever happening, partly because a
> lot of configurations use gcc which afaik doesn't have this particular
> horrendous model of UD.
>
> But this isn't just a kernel issue, it's a "anybody using clang to
> build any program that might have security issues would be *insane* to
> think this is a good model for dealing with UD". We do more checking
> than most on the code generation, so we actually had tools that
> noticed this odd code generaton. I can guarantee you that 99% of all
> projects out there would never have even noticed.
>
> And who knows what cases we *don't* find.
>
> And obviously hopefully UD doesn't actually happen. But that's like
> saying "hopefully we have no bugs". It's not reality.
>
> Using UD to change code generation really is a truly horrendously bad
> idea in the first place, but doing it in anything where security might
> matter takes "bad idea" to "just don't do this".
>
>                  Linus
