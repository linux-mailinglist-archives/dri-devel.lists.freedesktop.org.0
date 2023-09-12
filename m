Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84E79C8B8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B298810E3A5;
	Tue, 12 Sep 2023 07:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4288210E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:53:14 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-58dfe2d5b9aso73238287b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694505193; x=1695109993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6pjXkev8HSFZ8VrviZj3gQLVlyqDHJj7+WTis9YTpk=;
 b=oZv5DLCUJRzM0m+tyx2C2RnHk5qC216YFlpCfWOPrsEoqKq7QKKcder29Z9QqmdtYV
 qUL9W/kBlxmWc4OYCcL/1HzFGDg9BNVvV+JY2mLr94JegTcKpIO3NTMqAnk7SQCg4muB
 QbPxA+Yv9jetKMpA6MuJqi6Bc5wfuvsQ8cczX08sw3eidd3FcN6d7JVKjT5R4i6tCAP2
 MfIcgt4oXeKeGRYUzfyLMbVmZiN4PRE8CFtpMaKdN3L75oV3+UhIGT/vIVhRojOqrEeS
 KjTF0hZ5EtKKoxiQPv1idix2QlN9OuUbyucoZvXfSrJGWBIwWFrXqAJeqTJa8prN9HIW
 6+6w==
X-Gm-Message-State: AOJu0Yy/osxRn91b6aZhAGZX5a2wj7fHc7wTXfH+rg2k2/PJK7UaVV6z
 7w0bgiaXLQ2JXC9cw2R297i0fEBojqZ6gg==
X-Google-Smtp-Source: AGHT+IHFIZtZabpdo7DIeshAlwJdDXwfBKupfLtCImQWVJoWe68ndJZAsLH7LvHw/4sn0JIh9qQDYw==
X-Received: by 2002:a0d:db93:0:b0:59b:5bd2:1052 with SMTP id
 d141-20020a0ddb93000000b0059b5bd21052mr2104479ywe.5.1694505193058; 
 Tue, 12 Sep 2023 00:53:13 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 v72-20020a81484b000000b0059b085c4051sm2420194ywa.85.2023.09.12.00.53.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 00:53:11 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d7bae413275so8897959276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:53:11 -0700 (PDT)
X-Received: by 2002:a25:c786:0:b0:d7b:a78e:6b2d with SMTP id
 w128-20020a25c786000000b00d7ba78e6b2dmr2246302ybe.20.1694505191360; Tue, 12
 Sep 2023 00:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <87a5tr3k92.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5tr3k92.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Sep 2023 09:53:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8azQbC6D0PTHSVqnOX7h8No3wr2-ZxTGDbuwsgOLQgg@mail.gmail.com>
Message-ID: <CAMuHMdX8azQbC6D0PTHSVqnOX7h8No3wr2-ZxTGDbuwsgOLQgg@mail.gmail.com>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Sep 12, 2023 at 9:48=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>
> [...]
>
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
> >>         bool "Enable legacy fbdev support for your modesetting driver"
> >>         depends on DRM
> >>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSO=
LE
> >> -       default y
> >> +       default FB
> >
> > While this is true for existing configs, it is no longer true in genera=
l,
> > as DRM_FBDEV_EMULATION is no longer related to FB.
>
> Maybe default y if (FB_DEVICE || FRAMEBUFFER_CONSOLE) ?

Which is almost if FB_CORE? ;-)

Won't a dependency on FRAMEBUFFER_CONSOLE here introduce
a circular dependency, when combined with the hunk below?

> >>         help
> >>           Choose this option if you have a need for the legacy fbdev
> >>           support. Note that this support also provides the linux cons=
ole
> >> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kco=
nfig
> >> index b575cf54174af..83c2d7329ca58 100644
> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
> >>  config FRAMEBUFFER_CONSOLE
> >>         bool "Framebuffer Console support"
> >>         depends on FB_CORE && !UML
> >> +       default DRM_FBDEV_EMULATION
> >
> > Sounds good to me, although it looks a bit strange at first sight
> > (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
> > y on emulated fbdev?).
>
> And there Maybe default y if (FB || DRM_FBDEV_EMULATION) ?
>
> > So this is the fix for commit a5ae331edb02b ("drm: Drop select
> > FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").

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
