Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A987B95A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7667610F990;
	Thu, 14 Mar 2024 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F96910F990
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:35:08 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so624149276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710405306; x=1711010106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZOxcwDirhcwqixj1qjfT/PStYtmu0hBzxyawzPkVJ0=;
 b=VnuaoTndHr48wfFp5WGuvYcHAkhiWgLw9JoXHdrzmgt/Z8T16YrGsTbmH5b7/Tz8wn
 jTTyiXES/3/HTHEfW9OHNeFMsqBofSuQNd84+55GBoVAAIFeMfpD4BUBE8/SR7l2Q4DK
 T2eoiK+j1kZWDww4geW3cA50MQ3F8yxkIW/DWqH0J725yJ0kKb4GTTLkD3Oly9GgY8Fz
 U4AOAkbzqj91D4Ss1xUx3oMvPbn7FpZvB2lCe+I5Q2vjbQZxc2NgKUJn40Mt8jhD7tC4
 HM2RO8jmekznZAzy6cY96BqsrwsOMSSQB+2i8bmnADa34r96hY872w5uJOUwNSrtLP+c
 xKug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQVg4gF95VUB9jiY1FPctDHjbVgBCCFuIkJQKC2xE4LOIp1sIn/YvSraAxg3MDul2AvdLn2v/i/PrvVQqJwf12n1lMxLjiM8xuduZygbsW
X-Gm-Message-State: AOJu0Yw2R/M5zFkG4S0gv1+0xRvmZ9FZllwaaOR23JzIdJGyCTM5t7bU
 +A8WE7+V/kYd0M9cPT/F71IT5TIAKeGXsZQRBxwRnPHca90D2gvHY5eMbMf0bqs=
X-Google-Smtp-Source: AGHT+IFAJTWYvztMHBZeBLeyRNCsypIq2wvWdDVAf6XLIW9SYdUGJwSXeY4HFB1q+1v+neUtAdfwbA==
X-Received: by 2002:a25:a06:0:b0:dcb:e82c:f7d with SMTP id
 6-20020a250a06000000b00dcbe82c0f7dmr823710ybk.41.1710405306126; 
 Thu, 14 Mar 2024 01:35:06 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 b11-20020a252e4b000000b00dc7622402b9sm169525ybn.43.2024.03.14.01.35.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:35:05 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-60cbcd04de9so7456517b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXw0GJ2JTpeEJzN0XZah4R72g2TbqRzo+RmwTSCnEnq7beDQzAI6QyZIPCIVHqjSxLny4t6bCUDLmm983ASI93RJlEZvy5WZdIcNsC8Gp7r
X-Received: by 2002:a25:aa2d:0:b0:dca:c369:fac8 with SMTP id
 s42-20020a25aa2d000000b00dcac369fac8mr1122089ybi.1.1710405305661; Thu, 14 Mar
 2024 01:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 09:34:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE+ZjQjdKz15enO9MJBu=LjmP=06RPMrtWVkzXqvoVXA@mail.gmail.com>
Message-ID: <CAMuHMdXE+ZjQjdKz15enO9MJBu=LjmP=06RPMrtWVkzXqvoVXA@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
 Miguel Ojeda <ojeda@kernel.org>
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

On Wed, Mar 13, 2024 at 4:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
