Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D256C131
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426DF10E244;
	Fri,  8 Jul 2022 20:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1910E244
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:14:25 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e7so3452084qts.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zOe+CzPYZZs/hmA7mLwnSYETa9zn5ouTBI7OSu/RXM=;
 b=jlg0sYmxCSlekWEk7NQBkZ/v19Hol4dEJFytfqMvbXmbrylbgmUsznHW5deXL+GObI
 c9byJ1xxn732BGyPZ2YFgZLKvzzaoXyXJ6YeErMhzlypeTGdazaAf+aUh/ymUhJVSQ0V
 l2C1701eGKL0YDrYY9Y2TP59wQS5z8Fn2t8Do0KbrAv/mYj4EcDcAtR7VomZn/I9xgPi
 9Z/G/Er3bYo3/GsTBOiKm+/9X8Y3ZKCnB4UhMLx4GkVS2khn6ek7Doiic9qM/hqjzz2O
 /yFe3k0pc+AGbxbBTqgWS9mF1Adb0Tu4jPCtp6dyMaIcOYUWBspkGCMNt8qD74p+ihaU
 SycA==
X-Gm-Message-State: AJIora8oZleOYK+UYfWISSXCg1dYExfPR9kZkOm+3ay5l+R1TPsFeImW
 +JWjZzuQZJtCp1ShPhZyGtWtACVf43Ea/g==
X-Google-Smtp-Source: AGRyM1vkPAZ/W8ItE4S7+4xtuhs2HDnG9sXtuixKO6eD+KFfN4Tv8nWPIGREYWlbDX70NPD7cSZZ0Q==
X-Received: by 2002:a0c:d983:0:b0:472:ee1a:8ef2 with SMTP id
 y3-20020a0cd983000000b00472ee1a8ef2mr4184503qvj.111.1657311264384; 
 Fri, 08 Jul 2022 13:14:24 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 s9-20020ac85289000000b00304efba3d84sm29357158qtn.25.2022.07.08.13.14.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 13:14:20 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id f73so8752049yba.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:14:18 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr5316435ybt.604.1657311257860; Fri, 08
 Jul 2022 13:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <402dea47269f2e3960946d186ba3cb118066e74a.1657301107.git.geert@linux-m68k.org>
 <c95724ad-a3b0-2ac8-5413-b971626e7e63@redhat.com>
In-Reply-To: <c95724ad-a3b0-2ac8-5413-b971626e7e63@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jul 2022 22:14:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4tmYfnc96SGKuvdKC_JGNOHUmmNwrN4DdOmw0LijPvA@mail.gmail.com>
Message-ID: <CAMuHMdU4tmYfnc96SGKuvdKC_JGNOHUmmNwrN4DdOmw0LijPvA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/modes: Extract drm_mode_parse_cmdline_named_mode()
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, Jul 8, 2022 at 9:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/8/22 20:21, Geert Uytterhoeven wrote:
> > Extract the code to check for a named mode parameter into its own
> > function, to streamline the main parsing flow.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1749,6 +1749,30 @@ static const char * const drm_named_modes_whitelist[] = {
> >       "PAL",
> >  };
> >
> > +static int drm_mode_parse_cmdline_named_mode(const char *name,
> > +                                          unsigned int length,
> > +                                          bool refresh,
> > +                                          struct drm_cmdline_mode *mode)
> > +{
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > +             ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> > +             if (!ret)
>
> As discussed in my review of 1/5 this needs to become:
>
>                 if (ret != length)
> > +                     continue;

Agreed.

> Which renders my other comment on this patch (length not being used) mute.

/me wonders if he would have seen the light earlier if gcc would have
warned about that...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
