Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2BFA9FB36
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF810E262;
	Mon, 28 Apr 2025 20:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fZBRDrgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBE10EA62
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:57:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e61da95244so776704a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745873878; x=1746478678;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
 b=fZBRDrgpTvZDHdboDYb6gkWz8mQtYyQ9WjN5BfNwoxhZE+KzU5tTxTyoF43PPg6DBQ
 gpM/Fn2X5JN9OmD6Eoj93J/lSiq9w0rNGfAROcvfChraKAxBIO0x5B7m/MqAC5KRY2jA
 mfjsfvRCFqgNv+3msMOeGA2ysCc8AhhsfcQBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873878; x=1746478678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
 b=VLtRCf+r6mk00CCti/z+1Y6Ekpyj+IkVmeErEmlvJVlC2VlB0STceGQB4k0AcGr2uF
 AJLP9PMysalb1KyMg8eBNfze53s2dafE6xMXdPZSdknK46G78AaBeeU8yKN/XwPqGWrP
 9Ia3RN8plErP7SpSxgeBdCkNi31c8YCHwgtbtsSy8InmmZHi/TjAt8ZJOn7uQChs/rcb
 XB7v/xTNcVkvLO4pnt8sLRZV0eveEOjImxO1wdHxLmoEXpM7ND/MSg+eCgf3a5D77Yta
 ljITgeEcUv+YyU2g1pUjkSwFxv+cykOp6ADaZJMOqXClCKuDbdYUBOIFWDEef6OLcs4C
 ON5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlnutP8v7anZqR6CAhqW537km6O03GsJ5msGavKqYkK7EqDkrI4dW84HmQafUQa1IUw9ve5pzWyrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDok3FwoeayKw89lmPCWXTQkj9ZrkaX18b1/tSbSTjDgYwkDRV
 xI6GXAU4uvz63iWAjUG39dAZgRAHrMDC2flU9pHDlVOnXUteXjf8NlZgp/HLUDI1i0sS3+Z1ihn
 jAL5Thw==
X-Gm-Gg: ASbGncslTqHpc4gI2pkzIZ/ROWotyMZ1qjXZtxgY+m7VoFW5z1Fd6NIiwORPFbUVQoB
 SFWFRwTnes3UNGBxUbDSx+ED99W35GmXM99HxBQUoQxJ9fdOyl6n5t2i9MFLRznUmzQ75IL1l9M
 b+ig5QM58c7dBTPWOmfBHNvvvDeZqFvHoHgebIAdy1z5i7py84QtNiVU95acfW2rSta6VO7KHMi
 g2V8Ep9iAZMxckwefrJ05jh/pm701DQv3PhC6ZVzjRRvLCtpy50vf/zg8dk2qOpPzB7LHWI/iBt
 vtaG6yYFkbR7QTuYD3Q1+yJVl5GpAhYZxjHva587FcWnSmYgFqBXc9yS25qhbyxq0tlrTFTkdM2
 Mp+dDvXejf+DS4o4=
X-Google-Smtp-Source: AGHT+IFBmqitrpsg+yj23VCZfaNAkBLXKNzg+pCeDTO3xKMZK79ZHOYr0K9MbaFin0E5L+gZetRfFQ==
X-Received: by 2002:a17:907:7208:b0:aca:c9b5:31a8 with SMTP id
 a640c23a62f3a-ace84adb781mr949453666b.45.1745873877732; 
 Mon, 28 Apr 2025 13:57:57 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41bc41sm678774066b.24.2025.04.28.13.57.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:57:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so886371666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0W0jE18l2GN11BsWS5tCfG0QF8pTLb8U+ljOpQI2YkbMKh8T/K3SHtN1+Kyx11kaslCslf2DxaQk=@lists.freedesktop.org
X-Received: by 2002:a17:907:2d21:b0:ace:6e8b:516c with SMTP id
 a640c23a62f3a-ace848f79c7mr950122666b.20.1745873875562; Mon, 28 Apr 2025
 13:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
 <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
In-Reply-To: <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 13:57:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
X-Gm-Features: ATxdqUHVoU0fqtTa0EcdInlUrRY0LAso2qHrbrMUyXdvOmWof2RJdPZnjJYyf4I
Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
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

On Mon, 28 Apr 2025 at 12:54, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I've noticed Clang also generates UB for negative shift values.  I
> assume we'd want it to stop checking for those as well.

Yeah, that seems to match the exact same issue.

And again - the correct fix would be for the compiler to not do extra
work only to make for worse results.

Note that it's different if we *ask* for -fsanitize-undefined-xyz: at
that point we're literally asking the compiler to add extra code for
reporting.

But even then we absolutely don't want the "fall through to random
code" behavior. We'd only want the reporting part, and then still
generate valid code.

So the "turn undefined behavior into truly random behavior" is *never*
a valid model.

It would be much better handled as implementation-defined. So "divide
by zero" would have a very valid model - it will raise an exception.
And shift by negative would have all the usual semantics on x86 (the
shift value is just masked).

Undefined behavior is a bad bad thing to try to take advantage of.
It's bad in CPU design, it's bad in compiler design. If we have a bug
- and bugs *will* happen - it's a lot better if that bug then causes
some reliably bad behavior. It's better for security, it's better for
debuggability.

            Linus
