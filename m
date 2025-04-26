Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E98A9DD28
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 22:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6318810E0F1;
	Sat, 26 Apr 2025 20:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LLzQR43v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6759F10E0F1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 20:57:18 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so570679266b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745701037; x=1746305837;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
 b=LLzQR43vCwPMz0rEVn8GXB9r1Q56rry38L8dGmJJYw9xdZ6AAVsRgoYZebcum60Gd6
 ZUF55RGzTGzhHQ1UNrR+IVAo/wj2gKwrMe4y3TjTtOKcOLloIBK9k0MycuTefvpqRq7D
 PFJqEX3fHrN3Nk7D796QHv0g6hq+P/x5aiKSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745701037; x=1746305837;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
 b=TI/CyRLM0xkseJIZs0t0/1bMJcRLpwu7d2kMO0kv3hDkyif8+/EuU3bpJSCp7ZZs89
 Fkzd7mkPu8T2liiOnXQojL+DY5VKNHjdqqa15/+pDC/CpT2v/5bNd9OZ4yG7r8fsOTlq
 a0SPweCoFwKN9Z9vkBBaeK6eFGjXUDhhHZCDkmlCme4r4J34h44jaUETMjNh3H+6LWMa
 +UU4Hicj0exdi3vi8aaxyuJCkOrEXBYtM+gxEKw+5f0cwq/67oBZ+YjJUaPwlp85AUMD
 sbeG+sDD0oRZuKz6YRjquhtUt9sSKLTJmvz9MEpZ/jG+RH9ccTHERTE6YVkr31pE+HHJ
 UDww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVof+uLe/OIMh4z2TZ18vrMX2rEuX2XXg3CADTauzyzHJIVdUvatVBn2tdJEozBDPkJkR65pwJAjrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNIa8hC4GFAY76hPDFtNkX7fYm631VVq7ZMQOWYBSyGAJkM1g+
 QQXj5zksEkpvYqZcK6+zY5Y/botsUztod8mpm5BHht65p3ugKnGGEP7wlRz7G+DiNASyv8dxoe0
 T+aTryQ==
X-Gm-Gg: ASbGncs4jqprckK3wQUQq6rUR24SFksfPVBOdO3gFGDV8q5Se3/N20e8tPol6hZMb4A
 QFE6O8I/XE6vDGH3LOLdIvqqKlceCPfcybiG91+M/qfwPqny6F16qPXP2HVlmsrGSOkQ1Qqd4vN
 vO1FpJBuxiKe4MYWLDoP8UOcGCX/a5MvOefa65PKy8yXgNYt4E9tgxtvgmkno072Ghtcl90v1B7
 qH6S+5NUOwucc1xJznLI5/O2QC2rx57aZwIby1R0zYvgLwuqgvQCbIA9PR4ks3bgJq0fatEDNKk
 UwCablnmHuMPhDeeviQdvvVJazeYroWlMpGRd0MAkONI/OlDrGTglP+VXRLs+8385TIiObtB7bN
 2pD7bUB5wnz41yKo=
X-Google-Smtp-Source: AGHT+IHE/LVaR2aeFRIe0uZsMtZFLQr7JDnrlWga1BBj+vrKfG6lB4fP3rCQ0xFhnjg/yYDukbr+RQ==
X-Received: by 2002:a17:907:3e05:b0:ac8:17a1:e42 with SMTP id
 a640c23a62f3a-ace848f780emr288017466b.22.1745701036831; 
 Sat, 26 Apr 2025 13:57:16 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e6498sm338931966b.42.2025.04.26.13.57.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 13:57:16 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aca99fc253bso508794366b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 13:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcqq/SqEuV5fkNJQ5ZXGPc1vVdRyLWtIojqOTqWo2BMa2rucjoGkpH2JeZs/VhIk2Bz2FIDLD4OGE=@lists.freedesktop.org
X-Received: by 2002:a17:907:da6:b0:aca:d5e9:9ce with SMTP id
 a640c23a62f3a-ace848c0444mr251602866b.9.1745701035588; Sat, 26 Apr 2025
 13:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
In-Reply-To: <20250426200513.GA427956@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 13:56:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
X-Gm-Features: ATxdqUFEDV4hwTKkCo5LsFlF2depTN17SPH8wq3XkwJj60cqlzJsiqa-S0xR4lk
Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
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

On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote:
>
>     KBUILD_CFLAGS += -mllvm -trap-unreachable

Hmm. That certainly builds for me, but yeah, it generates new objtool
warnings, notably

   panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h

and I *think* that is because that flag makes clang not honour our
*explicit* "this code is unreachable" annotations.

So now objtool complains about the fact that clang has generated some
random code that follows a call to 'panic()' even though objtool knows
that panic() cannot return.

And those explicit annotations definitely should be honored.

IOW, there's a *big* difference between "the programmer told me this
is unreachable, so I won't generate code past this point" and "I have
decided this is undefined behavior, so now I won't generate code past
this point".

So what I'm asking for is absolutely not "trap on unreachable". That's
wrong and just plain stupid.

I'm asking for "trap on UD instead of *assuming* it's unreachable".

Because clearly that code *can* be reached, it's just doing something undefined.

See? Big big difference.

             Linus
