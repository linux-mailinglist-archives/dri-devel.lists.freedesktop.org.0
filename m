Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF86DD4C7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A514710E4D7;
	Tue, 11 Apr 2023 08:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8B10E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:09:04 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-54ee17a659bso145284067b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681200542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hALJfm4jnccIo090MDgna4b/Z74t0kji7w+cuP7uYXI=;
 b=xHMYDIZA0oFqy7ZZtaRwDf9lyfO8rnsMzvXKkDqwE/inRBawXbovXXOt3Z0Wc45O3S
 spBQ1xmdHXVN4AMPmAloV+F1ZHSzjaUgzHhFfJC0jqfxd1BWWKY2uQeJ1bCiVOudgeh+
 WrlFB5udWbbbuRrFGgbS7tcuZyB+ROPcZ744x4pH9UOfGMdWoA7/zC8nfqRtQfnU6/Tm
 nLV6j1+wCQmYKlT0bdJk0xo5JjNMTbe1zJaniUVR0ueb3h+/gDqPNjorVDBnZpYb5Uo9
 wpE3Rbq/weAlo6+cZPk4P9LLu5zHSpZrYlz6dtj9hz691sN+sj20fv+9IaQT+QWoW5C9
 JM0Q==
X-Gm-Message-State: AAQBX9fYRaQP3CY3gVGojo9Xo/ZXOzhL1fDEAN7EdeNo7AdLL1Sn9U/5
 pWRdeLdMmapZJxHLfrNkaOXAGr7QCK+xrA==
X-Google-Smtp-Source: AKy350Z2ZophgmiL1eOXJvyZklr9tT2uuxNBVn4Zh85YCTxb5WOyeLpzOPseTT9C+LrzIj+Zxwf3/A==
X-Received: by 2002:a81:5b0b:0:b0:54f:89c:a327 with SMTP id
 p11-20020a815b0b000000b0054f089ca327mr5385823ywb.39.1681200542498; 
 Tue, 11 Apr 2023 01:09:02 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 187-20020a8103c4000000b00545a081847fsm3346690ywd.15.2023.04.11.01.09.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 01:09:01 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-54c12009c30so251159437b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
X-Received: by 2002:a81:e401:0:b0:54c:19a6:480 with SMTP id
 r1-20020a81e401000000b0054c19a60480mr7173247ywl.4.1681200539960; Tue, 11 Apr
 2023 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-2-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, daniel.vetter@ffwll.ch, deller@gmx.de,
 linux-mips@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 gregkh@linuxfoundation.org, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect()
> and by removing include statements. The default mode set by
> fb_pgprotect() is now writecombine, which is what most platforms
> want.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> v2:
>         *  use writecombine mappings by default (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/include/asm-generic/fb.h
> +++ b/include/asm-generic/fb.h
> @@ -1,13 +1,32 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
>  #ifndef __ASM_GENERIC_FB_H_
>  #define __ASM_GENERIC_FB_H_
> -#include <linux/fb.h>
>
> -#define fb_pgprotect(...) do {} while (0)
> +/*
> + * Only include this header file from your architecture's <asm/fb.h>.
> + */
> +
> +#include <asm/page.h>
> +
> +struct fb_info;
> +struct file;
> +
> +#ifndef fb_pgprotect
> +#define fb_pgprotect fb_pgprotect
> +static inline void fb_pgprotect(struct file *file, struct vm_area_struct=
 *vma,
> +                               unsigned long off)

Does this affect any noMMU platforms that relied on fb_pgprotect()
doing nothing before?
Perhaps the body below should be protected by "#ifdef CONFIG_MMU"?

> +{
> +       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);

Shouldn't this use the pgprot_val() wrapper?

> +}
> +#endif

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
