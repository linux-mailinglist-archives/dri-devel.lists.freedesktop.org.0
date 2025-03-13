Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DDBA5FC2B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE26310E8F1;
	Thu, 13 Mar 2025 16:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fJfVWeQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B68E10E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741884073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
 b=fJfVWeQ1keQUQRxDyCnlHca4jyFS5q5rUljHxk1NcpHmCTIMrKD/K+/7EDeod/4pPSTwP+
 yOy99sO5zBTigfFD+PQ05bAId/EP3iBHfAHTJfegMkI+XUnVLJQIYIgBUGyttkzZPC/dUM
 KNuprU9iT7UFa/GNmqOH784c024XQLo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-13_01mn9N7WC8FJVlw0L-w-1; Thu, 13 Mar 2025 12:41:12 -0400
X-MC-Unique: 13_01mn9N7WC8FJVlw0L-w-1
X-Mimecast-MFC-AGG-ID: 13_01mn9N7WC8FJVlw0L-w_1741884072
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff798e8c3bso2098692a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741884071; x=1742488871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
 b=MwsiaTDIKjyyUd6Q6KSDDWpOS0nnIu6n74sUcXOsPDURjyB4ctARAGe1MwoiDYJoCq
 xeFQeAOFp8EmHtxHmskMgmGEoYiW8fZiRrqgBkF3uQKfWdN5pQSy8TUIfZRA5oJerSnX
 /SsfebMGmxmozeyMwN4l5jJ5ZKZ8poYCIOpXeArZC2BF3mx1cecmB8JhUsKm37R9t+dn
 OaJw2A1ozbMXsnMmELuOXHGgoDhOY3ZHhj1SLwnruE+BYpe4VZztW2nkhcwBwzUs69Fo
 7n2RPgFYFBp5nb5bCfIxMlV1/x1yb+c386Uv5BCCApnSWaQXIEBbskBTC2BCIbJOriia
 gQCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcKxGEvbUUN5W3QVjadqDC94ek77jKxkiLkdCVrk0DgBWh+DY86sz1yqcS3MApTwdlkfM7IuRMMj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHuajdDkev03NjWJ1Zkc9L9eybxklbDkVYNVmcl4kyye+kQI4h
 BiwIn1jwyzRo3zN3ZGMx/mgGMfoZvSc5C0nDCahwfCZvBJvxcIy3RaOPLVvB1tlB1PJ/WBIaLr7
 Y/DB6J9AdpOPEBCPivf6wiAueTuMP6nwD2WWaSaRMHqHZs+nUvRMrOJBtvOECzxc1httAD/H6xa
 EerXuAH8cKqNT9/pm68Cv/BTON1j05+ZE/sN8ZnILi
X-Gm-Gg: ASbGnct6JOd01jeQI3nZ2NgikX+31+Qmb0UytenYvLdouKUilNEClhkyk7KlKYZCAqz
 tSZZNHPEn+FNiph5ZVePccyDkmAFpzF+jDuA5nR89FsQZPMxZohFoZBfKoEKmICgG5JcQnPs=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-3014e814787mr282590a91.7.1741884071599; 
 Thu, 13 Mar 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZSR0GKOgpT9qIwRRXIxVMEVNcO4hzEa3HpTc2cVefBnUNShY5U2qKEnTkHJXaXXzQjc2Wb29JilB9GlX1pNU=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-3014e814787mr282561a91.7.1741884071208; Thu, 13 Mar 2025
 09:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
In-Reply-To: <20250313122503.GA7438@willie-the-truck>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 13 Mar 2025 17:40:59 +0100
X-Gm-Features: AQ5f1JoRjBn0wYL3TNCgo2Be9gEw3kQ3UV-S3_DQ-XzPf4lVXAvFHPCcZEOjQyQ
Message-ID: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 loongarch@lists.linux.dev, x86@kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mjyN-cWMpoFChAuobXrcU3bPZ_7SsWk0wBH_nCe6N8Y_1741884072
X-Mimecast-Originator: redhat.com
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

Hello Will,

On Thu, Mar 13, 2025 at 1:25=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> > diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.=
h
> > index 28be048db3f6..044c5e24a17d 100644
> > --- a/arch/arm64/include/asm/bug.h
> > +++ b/arch/arm64/include/asm/bug.h
> > @@ -11,8 +11,14 @@
> >
> >  #include <asm/asm-bug.h>
> >
> > +#ifdef HAVE_BUG_FUNCTION
> > +# define __BUG_FUNC  __func__
> > +#else
> > +# define __BUG_FUNC  NULL
> > +#endif
> > +
> >  #define __BUG_FLAGS(flags)                           \
> > -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> > +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__B=
UG_FUNC));
>
> Why is 'i' the right asm constraint to use here? It seems a bit odd to
> use that for a pointer.

I received this code as legacy from a previous version.
In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
Here, __BUG_FUNC is defined as __func__, which is the name of the
current function as a string literal.
Using the constraint "i" seems appropriate to me in this case.

However, when HAVE_BUG_FUNCTION is not defined:
__BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
but after investigating your concern, I found:

```
$ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
{\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
#define NULL ((void *)0)
```

I realized that NULL is actually a pointer that is not a link time
symbol, and using the "i" constraint with NULL may result in undefined
behavior.

Would the following alternative definition for __BUG_FUNC be more convincin=
g?

```
#ifdef HAVE_BUG_FUNCTION
    #define __BUG_FUNC __func__
#else
    #define __BUG_FUNC (uintptr_t)0
#endif
```
Let me know your thoughts.

>
> Will
>



--
---
172

