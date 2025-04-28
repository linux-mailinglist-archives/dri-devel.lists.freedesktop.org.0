Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53408A9F994
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34C010E6C8;
	Mon, 28 Apr 2025 19:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ALHvBGNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5010E6C8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:34:48 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ace3b03c043so799802566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745868887; x=1746473687;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
 b=ALHvBGNBq+C6AoYL9pTVMo0hqfoyGtSeEr7q/k2Cn5YflPWF4mSBd6693OZgGP+kcW
 BicfF7EG1Y8LXNvn9cxHVzgKmycod/TLwQfF0h2RNtZBueCTVEABt9edrDcTFsOocJEo
 RFgsq3qqPeo+rH3mcivQCfmXSWZUl3QMyRiM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745868887; x=1746473687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
 b=nAHKDbXD1yqx/5uws5lB6fuSUXInTMhljzsrzy0l/bgzoV715UrEi3R0rq8tbA44Lq
 arX0SUvbBCwcbYVIQu60BQw8O4Bnvz62bRc0DOzzcs0pv7gPz+jqEslCMYCl6uvbj0Lw
 rnHuhi7DPXEIHy4LAdTjzpaANDy7VaixZznbaNmLxdRKhJ0ytmaETClv2/uVb7r30CNW
 dW5S5MRW2qISeZIUbJSrQOg9zJM+1gtuAXTN81D+sOMY1F8HfQeu2NeFithJW0FYoUa8
 UGcS3TYPyeK4n/BU9hIivG3a1Z3W4KhGY4IT50rSGNCvYh3mocspkZD/H+dfzKc/yAfb
 s7bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoZk5IKq+w2HuEaY19fMjJkbt7ZYbJZOX9mSsPghji3iiKoTmMzpb83Xmn5IeDn60EIz5/8bJ/Fl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxooBrHC2XwaBVMvx7NeXJ+22zis8LTWbg0/fhy3aMaEVdPUJoF
 oiifXS7fTCa7TF5p6BJ2MFW/w2ntHw4447EFXj4Uy/OjY52PMroWblITuaT7XjjXdPpAc10mVU+
 LIe8sHg==
X-Gm-Gg: ASbGncuABBKgOHjB1acfzuj+2vLFOhexpycPocOFtqbxrzF4MNcDPVPJfJY+C9B6PQr
 WnMTxtD7N1sVWE0qOKU5MOMAwqtlrCKFFIaC3RDzuBDAD1+kSXJ+Qdx9ppgi8bvXSWgeM/l3nAE
 277YpWlYyJkbs3+dokxTAgqwHokco7tSNPHYF4+zPs/l+Y6ntvw7aTWIOQ08CWo+ieInhHXkPZL
 pV6bcBebbRmW/wIgeUAjwh+ta/Wp3QwP5VJuw3mvr7X9MkGRI1RE47aGKdEnsmC4cybnx2fkcS/
 MErF3Z9FukaQo4oyAXZI0Mez3NsJTrBe6sFsjjO4PcguC0Hx94zx4bTIb37Mny/LnxGgG9Pre/y
 bU77zT2q4J2YhbM4=
X-Google-Smtp-Source: AGHT+IGwqvXOxnnuNoOul+X9CNGz5G0gvAJqDj/W6NZKzru8ZIAbDKOF21HRyWkYoWuIX40ujIql+A==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id
 a640c23a62f3a-acec84b8840mr9907766b.2.1745868887145; 
 Mon, 28 Apr 2025 12:34:47 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb15a7sm684261366b.178.2025.04.28.12.34.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 12:34:45 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso8471206a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgRobbOWGEw0+3pgsBVawq4S8Gbps7J+TmQLnwYd2TiblnkVls708pEaVuo04kcHFOqz+jXJcQ2Cg=@lists.freedesktop.org
X-Received: by 2002:a17:907:86a1:b0:ace:5207:e2ec with SMTP id
 a640c23a62f3a-acec84b84bbmr8545366b.4.1745868885415; Mon, 28 Apr 2025
 12:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
In-Reply-To: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 12:34:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
X-Gm-Features: ATxdqUFMKb4hr1dAUfVb_bErfkkOWxj_7W2ubNDIidp8Hnky6iOrTQdD_4CxoZ8
Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Bill Wendling <morbo@google.com>
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

On Mon, 28 Apr 2025 at 11:08, Bill Wendling <morbo@google.com> wrote:
>
> This situation is one of the
> easier ones: "do something other than fall into the next function";

Note that the "fall into the next function" is just something that
objtool notices. It *could* be "fall into the next basic block of the
same function, and objtool wouldn't warn, because objtool generally
wouldn't notice (there could be other things that make objtool notice,
of course - things like stack updates being out of whack or similar).

But I really wish that clang would look at a "don't depend on UD as a
code generation model AT ALL" as a flag.

The whole "this is undefined, so I'll generate something different"
model is just wrong.

That said, there are certainly graduations of wrong:

> but there are far more involved examples, of course. And even in this
> case, the compiler needs to know if a "trap" is okay, or would
> returning with garbage in %rax be okay.

Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT ALL.

IOW, just generate the divide instruction.

I can almost guarantee that that will actually then generate the best
code too, because you'll probably just end up sharing the divide
instruction will all the *normal* cases.

So the best model is to literally remove that pointless and stupid "is
this a divide by zero" code. It's pointless and stupid because it
literally just makes for more work both for the compiler AND it
generates worse code.

Why do extra work to generate worse code?

Btu if some religious nutcase decides that "I will not generate divide
instructions if I know the divisor is zero" is a hill they will die
on, generating a "trap" instruction is certainly not inexcusable.

Generating a random value for %eax is WRONG. Now, that said, it's
clearly less wrong than falling through to some unrelated code
entirely, so it would be an improvement on the *current* situation,
but that's like saying that getting shot in the foot is an improvement
on getting shot in the head: true, but if the alternative is not
getting shot at all, why is that "less bad" alternative even on the
table?

The "just execute random code" is clearly so bad that it *should* be
off the table in the first place, and I don't understand why it is
what clang does now. It's just crazy.

And yes, this really is a very potential and real security issue. In
the kernel I don't think we have this ever happening, partly because a
lot of configurations use gcc which afaik doesn't have this particular
horrendous model of UD.

But this isn't just a kernel issue, it's a "anybody using clang to
build any program that might have security issues would be *insane* to
think this is a good model for dealing with UD". We do more checking
than most on the code generation, so we actually had tools that
noticed this odd code generaton. I can guarantee you that 99% of all
projects out there would never have even noticed.

And who knows what cases we *don't* find.

And obviously hopefully UD doesn't actually happen. But that's like
saying "hopefully we have no bugs". It's not reality.

Using UD to change code generation really is a truly horrendously bad
idea in the first place, but doing it in anything where security might
matter takes "bad idea" to "just don't do this".

                 Linus
