Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299FA9DCA5
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 19:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA87610E098;
	Sat, 26 Apr 2025 17:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="glPXAijV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2E10E098
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 17:52:29 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso578125666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745689948; x=1746294748;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ilc4ZqBanqCc92fVWGxIS3nPZUWorDx2QpnCQQ4E2Tc=;
 b=glPXAijVUjPoPCSr58gxCir3SFTaj7F/j8+FuGwJu8h2bhXvSRBkHO3CtSuS7ygvHq
 qNmJIpwOd5Zt8syQ+KjBm5P0Aats4Ko4DjZQOyVPHtpC960N6t+oW05LIs3aPJbVZZZI
 rRilXj99zjvgJQ4vg8P1ugAIEe5imFB/2O1Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745689948; x=1746294748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilc4ZqBanqCc92fVWGxIS3nPZUWorDx2QpnCQQ4E2Tc=;
 b=O/CezYEKOXStyg1LV+ovmzOJodu1Dcbv9yIbtuyZ1Vb+lubWL4jlMkGo5SZveHc7tF
 EkmpkHqkhdUt4k1MnYtaZYEyLlB6/MSrSWLtt6XV1pSK/QpBCKMQgbpxyusuki0sbLHv
 JBa7HcamzLBD/JiD3wDR0Onh+qi5gwLME+iMw5TlmnJ2cxJloZfR3Wmjvijd5lk2tr/u
 bSmkwqs1y4zKfL4kUCyzNqjZ2F36IUu18Nxj/hUsMIFCafGpQPvZrXqWmbWIJ2g6E+iC
 TFlQ0glNJzjJuSz0aQEmqZzuem8GBj/ZlsphemYAAci++hbICbSx4Wmw0hgNs9zrNIow
 H7NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Tdi5bZ2XC82CcdvUJ8hdaRn/tAq8q+HLs8Iiulnv2Bp0ruoBqKLCTt0zWibLI/7BhHVzsitfu0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHJH1FjxX7o3Bw5Srjgz+DlsJqcRq+tXouoc5aI1/s9jbuXd99
 y3w2gqUstYJisR9n4ENrRpBR3+6vFJqeO+9e4tscShZAv/hsr9n3XG+novUIi8C4v9soPD2Fhhc
 0F6Q=
X-Gm-Gg: ASbGncv9O3x9tckRL6IPVU22CFERF+bcUUQOO1uvkD2J4GivpLYBb8/kVMfAJ9vxbev
 wV1SarD8XKcFWmIbll7NamxKuZOufGQbgel+5Qx4QgQkSZzJJxPbHw+9645qnGtvy95DMLlZ05+
 ez9377iJuqItHQ/o1QYW9glxZ1dilHMLKZrWdV33MpwL3bR6KL+c7NurN8h7VyZp3I+jPeU1clU
 Eg/iejB/gm7c8KkzMQIB8vKPeNA4ohzLopJgDDlj8BouzCeL2t8q9ryeGBrWfg9CsasMZT6bpy+
 Zo60WT2duQAeWgN8jmGMi4Oh/BzmUb/9S2M2iJMOScoj/GU7/2/Flex6CWsigrGh+bJ5X6lXbAN
 +5lya+oYvQzC8ZRk=
X-Google-Smtp-Source: AGHT+IGeOAb3P6fMKYohdvbzPp7GlbOkeWE5qaQxsYnnY9vN/s3AApGNOS1FgLhZZvD+CuJZy2wUgw==
X-Received: by 2002:a17:906:7311:b0:ac7:3918:50f3 with SMTP id
 a640c23a62f3a-ace713efb52mr642109266b.58.1745689948133; 
 Sat, 26 Apr 2025 10:52:28 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed64fc5sm315621866b.129.2025.04.26.10.52.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 10:52:27 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso6337311a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 10:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpYGkMk7pa4YSjhRET4DzxSMfw5vjjI4xmSa0whbCgbmkxY+D8NCFUPLRpVhM6TZk4C0mA3LmxvTs=@lists.freedesktop.org
X-Received: by 2002:a17:906:7311:b0:ac3:8516:9cf2 with SMTP id
 a640c23a62f3a-ace713deee2mr658764966b.55.1745689946923; Sat, 26 Apr 2025
 10:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
In-Reply-To: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 10:52:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
X-Gm-Features: ATxdqUFJhpP1cnPfVY8nm1K1gppvnR2N5pQ5E7BQd9ZjkOk2BZpV-x-DK59L6io
Message-ID: <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
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

On Sat, 26 Apr 2025 at 10:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We had something similar some time ago, where there was a drm
> assertion without error handling, which caused the compiler to see
> that there was a static path where the invalid value was used, and
> then caused other problems. I forget the details, and gmail search
> isn't helping me

My dim memories came back and helped me with the right search terms,
and this is what I was talking about:

   https://lore.kernel.org/all/CAHk-=wg4ETks+pGUco4gDrRxT+1UBbFGQtpOqSxLSzvVAWpm5w@mail.gmail.com/

different compiler, very different results, but same kind of issue:
warning about an error case without actually *dealing* with the error,
which results in the compiler seeing a static code path from the
warning to an invalid situation, and causing odd problems.

Please people: "ASSERT()" like behavior is simply not acceptable in
the kernel. WARN_ON() and friends need to either be otherwise benign
(ie "warn but then continue to do valid things") or they need to be
*handled* (ie "warn and then refuse to do things that aren't valid").

Just warning and then doing random crap is not sane. If you aren't
capable of dealing with the situation, don't do the bogus test. Just
warning about it isn't fixing the code, and can make things actively
worse as in these two examples.

But I do think that clang needs to stop doing that "make things
actively worse" part. Maybe even have an actual honest-to-goodness
"this is a static undefined situation, I will stop generating code AND
THAT MEANS I FAIL THE BUILD".

Not this silent "now I generate random code by falling through to
something else entirely" that clang does now. Not good.

              Linus
