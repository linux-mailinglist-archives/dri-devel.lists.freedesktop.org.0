Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3187BDD0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AD410FB18;
	Thu, 14 Mar 2024 13:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E5010FB18
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 13:37:09 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-60a0a54869bso8985077b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 06:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710423428; x=1711028228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDiARA/24cHYG8FRrouoTvUxwp5WbH/hNpGJ/9ezCCU=;
 b=AQ3JkHYTq5ZCTX2RuQqBsLGSFUcBK3Q/hFwAb5jSP3gwwzhzIpaMg2dtCavIFb9rZy
 t5GWtm+7KolqsH0fBPhEw/Mktw4kV1JLmWCc0UAeNTXHdDbeyjL3w5LQkx1rzwT8ZNQv
 XWE+vPgEgAvpJ9v48n4CjgVcpmZvU+GvDsjx6Y9tDNnS8CPSsrHZX9BFDvJq/yQ84mm1
 s8V2xtW68Qy4Ouvj6iYiLEMXfUioAIq0t52Z1XY0V5XLr8+zh7ZPIJz7/XMz1z1F5gyu
 hwdOFGo6RWPk/UQg/sRmZIMu2adJsr2rdDstsk411uhWlgj+JwJvY0xK0JaAAuWpoSbn
 U57Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMtO16jLAB6hcjur6WVNbbNA9yyjsNk09ozg3Va8Ylgb4OJdPlGxJcFXMYrxZ24NEkEZQHmYjpEEBAu6zTF7KTF3OMp5qewEY7IoUutLsc
X-Gm-Message-State: AOJu0Yz7XuXr8dQjNYyJstL/VL7jC6mnO/JYaMg7ZujUmMkvzSDGijZz
 gTZrBjuC4zwCUpkKS6Hyt4SY6rQLh5a+pMse3Kiwqjq0kVxUE2NPZ9fom1Sh+yI=
X-Google-Smtp-Source: AGHT+IHzTBuulfFzbfZlMUrBX9GFkMFKzxurUTLPGcuEgWd5cCFH212cCf4UO8S6bYgGWTQUOQcuhw==
X-Received: by 2002:a0d:dbd0:0:b0:60c:c62d:516e with SMTP id
 d199-20020a0ddbd0000000b0060cc62d516emr1122151ywe.15.1710423427571; 
 Thu, 14 Mar 2024 06:37:07 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 fn18-20020a05690c341200b0060a08edc81dsm269421ywb.4.2024.03.14.06.37.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:37:06 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-60cbcd04de8so7768397b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 06:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1j/FQddhMGORhwnqp1nMM970rYjMKIdL2NgTgETwFIJsC71Ebz0sYZkAOWowmvmvN7viYSTv5h1PrHkUimvAd9+FlxwqXtEeb1H+4t24v
X-Received: by 2002:a0d:fe04:0:b0:60a:4930:5bb1 with SMTP id
 o4-20020a0dfe04000000b0060a49305bb1mr1000757ywf.5.1710423424398; Thu, 14 Mar
 2024 06:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
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

On Tue, Mar 12, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multipl=
e
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.

Thanks for your series!

I gave it a try on m68k, just running backtrace-suppression-test,
and that seems to work fine.

> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
>   size increases if CONFIG_KUNIT=3Dn. There would be some benefits to
>   adding those pointers all the time (reduced complexity, ability to
>   display function names in BUG/WARNING messages). That change, if
>   desired, can be made later.

Unfortunately this also increases kernel size in the CONFIG_KUNIT=3Dm
case (ca. 80 KiB for atari_defconfig), making it less attractive to have
kunit and all tests enabled as modules in my standard kernel.

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
