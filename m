Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC59E830D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 02:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCF710E1D0;
	Sun,  8 Dec 2024 01:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cn5/jKCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212CF10E1D0
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 01:58:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa629402b53so408367666b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 17:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733623135; x=1734227935;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
 b=cn5/jKCEaradMQnqgNU6pQZn+WQZ8mc4ltCVinukqF+qBnKrAFupf6Bzl+Lf43jvhs
 VDqn5xUZYzgQxq3jJO3BoeI645r3UK8zXm+0IwqV9sNLPKHUoUadzcEyf3qQd+mGlyAF
 rH6AKFcHBUz2SEnoKh11w0QNNzPjLcajwnJ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733623135; x=1734227935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
 b=eViSmH+qgg9WjeCI0eXrl2P7VmD1kQFcBw+WJcnJHQuCLysgLUaNWgDv+kxU+lSaHZ
 dBkbhJoOiRYYlag5zkFpmidGeZXidkfHl8fBNpuh6f2q16zEdVoUQ2AQvz8iC1oPLH6s
 E3S8c2oYJ4aobTKAnsS/7E4iUOIGUoIBRr45ssyKVvq4CZeVJ9ti7hMiHHOGMLXrGnfH
 dSZG1njmFhMU9+9eolm+qeY8N9F0otNJLssfLpHKuRRQdYDOL8tuWioCKdINebbE6nJ1
 c8kV1o/GwtNLei6tGdsncysdC8jpi7VY0Nwc5AySC76RYaiq300ndOa5L59izP5etERR
 +Qfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQHcG2sCn2JSx4ZthVQ5zeo0V4H7hscUD7M8CNzRKA2smFgZANhdwy8/7TFqn6fDWFYQhR9+caZKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6z4HzDZpNJ3Js/SZa10YpkPZtJxSTu38Et63SOTZVleJMw8Qp
 JTLA5EwCle99ue/TrxIbdADCtcbKyLDeoIaQMlkc7ubCWCnFlqObmL4RerPx72Srb4YzgGWUBSO
 Lzg+X+g==
X-Gm-Gg: ASbGnctRe8vWst0F6SI5r1zViGxVNVX/8/Fs2nLqpOoBxI08qB7AjHk10nyIhapuV01
 dLYLOo89yk8mGq66x/4femvFjbKUtANcz4pSf+wuAtLqCK72fMCm8y2sq821vEghuAJhBJbikZ0
 4XmdrUlXsYcR85+sA3XbBp58BxC4HdyOlVIlA8v0ga4UB7FdGW3hydPSgRZc2J/PtKPlByubsMn
 1KDtSS2uKHlogw5HvBxxvZ8+jVi/xIaOSA8/S5rDEsruJ0rZ3YyyB76TNM40T38MC1l/om6npAW
 +4clTdAvwXSg3lfJT6luotZN
X-Google-Smtp-Source: AGHT+IEU0O/rdj12NGZWVd41EeK6RvLTW7o08AYM9AhTyyzzFU9s4h0kRM0gxyZlQe+Uv83Gtcjlsw==
X-Received: by 2002:a17:906:1ba1:b0:aa5:3729:e550 with SMTP id
 a640c23a62f3a-aa639fb233amr553867166b.6.1733623135115; 
 Sat, 07 Dec 2024 17:58:55 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e5c76fsm458529766b.8.2024.12.07.17.58.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 17:58:54 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so10968766b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 17:58:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQWGphAX+uCUTQzvNE+zUdd0ZrDKu6PtirfpxtO9SgR2rHCw68oW6mBnCh3LNXIoZ+fxDiX+W5Lnc=@lists.freedesktop.org
X-Received: by 2002:a17:907:84c8:b0:aa6:2fc7:71aa with SMTP id
 a640c23a62f3a-aa63a24f1famr565813866b.55.1733623133832; Sat, 07 Dec 2024
 17:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
 <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
In-Reply-To: <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 17:58:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Sat, 7 Dec 2024 at 15:52, Martin Uecker <muecker@gwdg.de> wrote:
>
> Can you point me to some horror stories?

So the main issues tended to be about various static verification tools.

Ranging from things like the stackleak plugin for gcc, where handling
VLA's and alloca() (which are pretty much the same thing with
different syntax) was just very much added complexity, to perhaps
overly simplistic tools that literally just check the stack usage by
parsing "objdump --disassemble" output and then building up
approximate "this is the combined deepest stack" call chain
approximations.

And even in the *basic* infrastructure like gcc itself, VLA's simply
made -Wframe-larger-than= just simply not work.

I also have this memory of bad code generation (again, this is 5=
years ago, so take this with a pinch of salt: dim memories), where gcc
wouldn't end up re-using VLA stack slots, so VLA's made the frame
bigger for that reason or something like that.

We explicitly use "-fconserve-stack" to get gcc to reuse spill slots,
because gcc has been known to sometimes makes insanely piggish stack
frames when it just creates a spill slot for *everything*, even if the
spills aren't live at the same time (think big functions with lots of
case statements).

We also had several cases of the VLA's just being silly, when a simple
constant-sized allocation just worked fine and didn't generate
pointless extra code.

Pretty much none of the code core actually ever wanted VLA's, so the
end result was that we had these bad patterns mainly in random drivers
etc. Don't do that.

                Linus
