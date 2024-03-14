Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADE87B8FF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 08:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3207D10F353;
	Thu, 14 Mar 2024 07:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFEB10E832
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 07:58:01 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-60a15449303so8187707b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710403079; x=1711007879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kd7vHFr5fszcwgfp701zhW6bd0WPIDQKlsKOb1KQCg=;
 b=Zd+HvsdXk6RMhXv2zRVxbn8XMs3FMCudDWbTO2CWOhKFLq68AROgKxhl7Ltr5qOodC
 L6ttHjGbBuZxklR7v7ra2OYyc+N1VhWwWbYjfQ3tAGnafyxu7klrJ0Vmmt0/ShfM6Hf5
 MaMCCsK6QfuJp/8OtD2JcGSsHmy8f1f6pw2EcvnYwR+DfPw4/SqUizENO1cBMzVHF/fR
 GMKcra7seVj7rb+D6RhvLsPonfohkWkUP+fSSHbJ1mZvI9FseSp5FAyu3oCeFkQ1FX6V
 76GvURjFwnJVofZoK5+TYtl8B5Y3hN+iWDI5LLeb4bZxdqrHWMZjVOizeGJsmpPDq9Mp
 L0+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNh53gujr3VzjUdXvMU43mL+0hPadoGSidpLAfkkuD90Rchqm0mKKm1m9tcGZmbikKp2ypcIrtRCXJaaLfl5UGB+Uv+PWcEhFqMVdrZmjo
X-Gm-Message-State: AOJu0YybqMmoOD4/PuRfkVh42X5NZsvsJIyPCdyO844upMZPUwCnyc08
 cTCYEMEYvYjDV2E/yaiGP8/MNdCxMGWKExHC6hqWqkYyoRy4jqUxiYPoYFMzRLM=
X-Google-Smtp-Source: AGHT+IGI3+L6P7RSXPXu8vzKZ5HtvJUEk/pISfoiGvf9eSX409JtrpEH27rhN+sdP1JtxhtBvW5njw==
X-Received: by 2002:a05:690c:3406:b0:60c:caae:d01a with SMTP id
 fn6-20020a05690c340600b0060ccaaed01amr713667ywb.7.1710403079173; 
 Thu, 14 Mar 2024 00:57:59 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 j67-20020a819246000000b0060a588c41a3sm173716ywg.76.2024.03.14.00.57.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:57:58 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60a15449303so8187177b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1h3eADUIgHLNHhhY30q2Tw69AM2C7VciR0EAxxS364VCVtCV3+mrt7MHQSmZJji+se5CiwOqSfZRnKfc0X8ig0uW0RDxsVgqcdfJcYR2
X-Received: by 2002:a0d:ea4c:0:b0:609:239a:d0fc with SMTP id
 t73-20020a0dea4c000000b00609239ad0fcmr990474ywe.38.1710403077141; Thu, 14 Mar
 2024 00:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-12-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-12-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 08:57:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] s390: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
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
 dri-devel@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 loongarch@lists.linux.dev, netdev@lists.linux.dev
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

Hi G=C3=BCnter,

On Tue, Mar 12, 2024 at 6:06=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only adde=
d
> to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBO=
SE
> are enabled. Otherwise, the __func__ assembly parameter is replaced with =
a
> (dummy) NULL parameter to avoid an image size increase due to unused
> __func__ entries (this is necessary because __func__ is not a define but =
a
> virtual variable).
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks for your patch!

> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,19 +8,30 @@
>
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>
> +#if IS_ENABLED(CONFIG_KUNIT)
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR        "       .long   %0-.\n"
> +# define __BUG_FUNC    __func__
> +#else
> +# define __BUG_FUNC_PTR
> +# define __BUG_FUNC    NULL
> +#endif /* IS_ENABLED(CONFIG_KUNIT) */
> +
>  #define __EMIT_BUG(x) do {                                     \
>         asm_inline volatile(                                    \
>                 "0:     mc      0,0\n"                          \
>                 ".section .rodata.str,\"aMS\",@progbits,1\n"    \
>                 "1:     .asciz  \""__FILE__"\"\n"               \
>                 ".previous\n"                                   \
> -               ".section __bug_table,\"awM\",@progbits,%2\n"   \
> +               ".section __bug_table,\"awM\",@progbits,%3\n"   \

This change conflicts with commit 3938490e78f443fb ("s390/bug:
remove entry size from __bug_table section") in linus/master.
I guess it should just be dropped?

>                 "2:     .long   0b-.\n"                         \
>                 "       .long   1b-.\n"                         \
> -               "       .short  %0,%1\n"                        \
> -               "       .org    2b+%2\n"                        \
> +               __BUG_FUNC_PTR                                  \
> +               "       .short  %1,%2\n"                        \
> +               "       .org    2b+%3\n"                        \
>                 ".previous\n"                                   \
> -               : : "i" (__LINE__),                             \
> +               : : "i" (__BUG_FUNC),                           \
> +                   "i" (__LINE__),                             \
>                     "i" (x),                                    \
>                     "i" (sizeof(struct bug_entry)));            \
>  } while (0)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
