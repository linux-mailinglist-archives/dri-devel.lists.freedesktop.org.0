Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A26B388E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAF110E975;
	Fri, 10 Mar 2023 08:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA76710E975
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:28:29 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id m10so4000784vso.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678436908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eM9+oariG5AZHJb2flm0bcRsFcKIv5vHQs/p7YmsVBU=;
 b=7khphlFnRzV/gOx6bs376RvtvX79UAD3GaKA3YjAeVHAqO1PEiuiOIHAqYezAA4fAg
 4DPYG664bfZEBTRtai8pWshXVaUv//8t4q09YQJV6xh+aXtjuRm5gVuqIDmjmOhKCQGV
 SkFMx80q1qywcPb5j3FpnhgEjxdBUxUCXnW7Vhkar0bbC512O9+LgtlrUbu0NnBgv9Sz
 3tAD13sFiwQmgbqCN/6khEOjO8xEfDg1QI8Ivos9O+Ov8OifZ+VlTCkEQRU96xFK+uwQ
 uyk7DzvffoJWz8CKhz+OtfwSMgvFx58gtVLU9KQv29YB6dQyFxBWtg5roNniiNSs/3mQ
 xQxQ==
X-Gm-Message-State: AO0yUKX66R/mfQNgvbVDxbTg2gKM4mMBrgM+U849ixR1Msn4g6VgDbXJ
 TnkJGHbTkxr9R7LxrI/Hce5ma5/VrNJhLw==
X-Google-Smtp-Source: AK7set+RygPzH2JfE+adwto4i2LIxxbAhXNVMSw6zUL+RQkbqIRaME7D2LG0on6S63PY0u7rrYYyTg==
X-Received: by 2002:a05:6102:1593:b0:422:1e1f:e968 with SMTP id
 g19-20020a056102159300b004221e1fe968mr2926107vsv.3.1678436908512; 
 Fri, 10 Mar 2023 00:28:28 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 l73-20020a1f254c000000b00401aaab0805sm255872vkl.28.2023.03.10.00.28.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:28:28 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id f23so3952545vsa.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:28:28 -0800 (PST)
X-Received: by 2002:a81:4306:0:b0:538:49a4:b1e0 with SMTP id
 q6-20020a814306000000b0053849a4b1e0mr896811ywa.2.1678436489434; Fri, 10 Mar
 2023 00:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <20230309160201.5163-2-tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 09:21:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>
Message-ID: <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>
Subject: Re: [PATCH v2 001/101] lib: Add option iterator
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, thomas@winischhofer.net, adaplas@gmail.com,
 timur@kernel.org, corbet@lwn.net, deller@gmx.de, rdunlap@infradead.org,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Mar 9, 2023 at 5:02=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Add struct option_iter and helpers that walk over individual options
> of an option string. Add documentation.
>
> Kernel parameters often have the format of
>
>   param=3Dopt1,opt2:val,opt3
>
> where the option string contains a number of comma-separated options.
> Drivers usually use strsep() in a loop to extract individual options
> from the string. Each call to strsep() modifies the given string, so
> callers have to duplicate kernel parameters that are to be parsed
> multiple times.
>
> The new struct option_iter and its helpers wrap this code behind a
> clean interface. Drivers can iterate over the options without having
> to know the details of the option-string format. The iterator handles
> string memory internally without modifying the original options.
>
> v2:
>         * improve documentation (Randy)
>         * implement option_iter_next() as function
>         * allow modification of the returned options
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

I> ---
>  Documentation/core-api/kernel-api.rst |   9 +++
>  include/linux/cmdline.h               |  36 +++++++++
>  lib/Makefile                          |   2 +-
>  lib/cmdline_iter.c                    | 109 ++++++++++++++++++++++++++
>  4 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/cmdline.h
>  create mode 100644 lib/cmdline_iter.c

Just wondering, is there any code that can be shared with/reused from
the existing lib/cmdline.c?

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
