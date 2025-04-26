Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE04DA9DC9F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 19:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9752910E0F9;
	Sat, 26 Apr 2025 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QiqBbowp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CC610E098
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 17:43:00 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso5396590a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745689378; x=1746294178;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p5ZuHweNuEVBE3Fej2LIynmyJBbRTA/TM1UDo0+mKg0=;
 b=QiqBbowpRusqNwfcKLbaJ3wkhISP5Sn6D66lOkO0UKUpJtZnknqW76iJK9YcqzdmUp
 zKdhQ5lHcI74zZPFwJqkciDAlCiUFX/uwxM5HhcBOauyQ2fq1WAcjbUJMow4dinxdOd3
 zwaRtfciYZB42GASp9Gc5UVOWAxlw5avFHliE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745689378; x=1746294178;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5ZuHweNuEVBE3Fej2LIynmyJBbRTA/TM1UDo0+mKg0=;
 b=v6MByPb6GbXe5b4zqgaQ/ml1yN8UOMKvTcJTCBGdjBtMYcroCxPasvL5fB5ehCnT2j
 2izJugwox4kU9CnaGmV5NY+fy0ec6sBW0UV3Ho3l/rLWBkJyPRpL2btESlYclx4Q7af+
 7lbwTeMH8tJYjpl4JAF8yghGQRycK1YyFZFXNKHtHgneXp4Mm8szEbQ6tBDYMUU26w7C
 gsh8XX5w/ixQxCk25rcMB2gIZvvU536sEJ+OB+qal6G1ZiZls4G1iMMDiGzOUqG6xllA
 UuPE8PZ411KLgBLy05jjHkVTyjn9ANcShv+i8bdxSLZq3T1At0mcR+GXUj26zKPKPDUr
 urbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBhiJ4RZ9eQdEpbm2fu1xPNpi1mikGBX/ToUhrb7fzYjBpJn0P1WBOh2BFyoB/l0a+RJAVN0H0TTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjjC7POBuQ6wBj36CWBbhy7mi90/6au1iGdOgWkteu1CjFZhuY
 imhFKi54Q78rSktZNFEKz5/aiLmNvzqhRWD4E7tMHskvktB/y5zQjr5ByiRwseygoOQ4CwYT3Ep
 rXk8=
X-Gm-Gg: ASbGncscUXNOud6Q6EcWFkW9w6Is7td1KpE9Bovc4psVZ1Q6RHXhgcrOEwc8d9e5p+u
 U4b3DO0jBHjYkuJJ+1aQtEc2yku0eGuqGHvqFLfQuYXGBpv79ciHYRCoCSr7KZ1V7X9g3IKrg6B
 4WOjReQ7SB2GYArwyPHmwuBuUQhBTmRs00riEySmvTaW0EwtIkuaXz49RfvonBjh4a2nyHago8M
 j9hHSJVSjpIbp4CoEKWLJ6UsQxy+xpAj17EE/m9jpEd/fZzVc3FtotWjO8dGtogP3sfwYCiilEJ
 JkEFUY4eCDUGtHMGm1fi5QnWDQIYLBi3Z0Es3uuvASmPFpLs7MN0doIXTwiUKWm1bXUAIdKvXLO
 s24q3oqZuh75KyoE=
X-Google-Smtp-Source: AGHT+IEixbpB5SrnyMOU04D2JkYhuGXnIPXAuHn12AqSNhogamRjFkdDPMywKpuj6zd/5FrEnX11fQ==
X-Received: by 2002:a17:906:34d6:b0:ace:8280:8eff with SMTP id
 a640c23a62f3a-ace82809109mr271807366b.26.1745689378184; 
 Sat, 26 Apr 2025 10:42:58 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7013fef5esm2920188a12.18.2025.04.26.10.42.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 10:42:57 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso5572023a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJTSECA+L5pLGSAV/xNyz3De8lqF4X34ROKp+W0Hl20/0d37f/ppxtvd/UfGEwI8i3GlLOyE4Wa2I=@lists.freedesktop.org
X-Received: by 2002:a17:906:9fc7:b0:aca:cde4:fac1 with SMTP id
 a640c23a62f3a-ace71131c2dmr658231266b.31.1745689377007; Sat, 26 Apr 2025
 10:42:57 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 10:42:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
X-Gm-Features: ATxdqUF66SgVPO-TQX09fkvhV4kdjdHCzpMk_g01lv5yN5C2c15Un2Rowbof3YY
Message-ID: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
Subject: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

So with clang, I get these drm build warnings

  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o:
     warning: objtool: dc_fixpt_recip() falls through to next function
dc_fixpt_sinc()

  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_fixpt31_32.o:
     warning: objtool: spl_fixpt_recip() falls through to next
function spl_fixpt_sinc()

and the warnings seem real. I ignored them because it wasn't entirely
obvious what was going on and I was looking at other things, but today
I looked at why these happen.

What is going on is that the *_fixpt_recip() function has a

        SPL_ASSERT(arg.value);

which results in basically a test for 'arg.value' being zero and a WARN_ON()

Then - through inlining - we get from *_fixpt_recip() to

  spl_fixpt_from_fraction ->
    spl_complete_integer_division_u64()

here we have *another* check for the divisor not being zero:

        SPL_ASSERT(divisor);

and then it goes on to inline the code:

      spl_div64_u64_rem() ->
        div64_u64_rem()

which does

        *remainder = dividend % divisor;
        return dividend / divisor;

so now what has happened is that clang sees that when it inlines those
things, it basically has a path with two warnings, following a divide
by a value known to be the constant zero.

And that makes clang just stop generating any code at all, and the asm
looks like this:

spl_fixpt_recip:                        # @spl_fixpt_recip
# %bb.0:
        callq   __fentry__
        testq   %rdi, %rdi
        je      .LBB3_10
  ...
.LBB3_10:
        #APP
     .. disgusting unreadable for WARN_ON() on line 199 ..
        #NO_APP
        #APP
     .. disgusting unreadable for WARN_ON() on line 32 ..
        #NO_APP
.Lfunc_end3:

because clang has decided - correctly - that this path now divides by
zero. Notice how it just falls off at .Lfunc_end3 with no actual
divide, and no other sign of "you have failed at life".

However, this is actually problematic for the kernel: yes, the warning
hopefully helps show what is wrong, but because clang has now
generated code that basically jumps to random code, you get random
security issues if the warnign ever triggers (and there are
configurations where the warning is just disabled).

So there are two problems here:

 - the drm code should not "assert" crap. Do proper error handling, or
don't. But don't have a random "this is a known bad value" and then
fall back to using that value anyway.

We had something similar some time ago, where there was a drm
assertion without error handling, which caused the compiler to see
that there was a static path where the invalid value was used, and
then caused other problems. I forget the details, and gmail search
isn't helping me

But I *really* think that clang silently just generating known bad
code for invalida operations like this is very very dangerous, and is
a bug in clang.

So I'm cc'ing drm and clang people (and x86 people) in the hope that
we can fix both of these things.

Can we *please* get a flag for clang that it doesn't just stop
generating code because it has decided some path is unreachable or
undefined? Add a TRAP instruction, for Chrissake! PLEASE!

 Maybe such a flag already exists, and the kernel just doesn't know
about it. This whole "do random things for undefined behavior" is a
bug, dammit.

And yes, the drm code shouldn't be doing this. Adding warnings for
things that will oops is actually counter-productive. It generates
extra code, but this is an example of it actually causing *more*
problems. We'd have been better off with a nice clean divide-by-zero
oops than with a warning followed by random behavior.

               Linus
