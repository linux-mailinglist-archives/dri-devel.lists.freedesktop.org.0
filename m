Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB54AF67A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B3710E277;
	Wed,  9 Feb 2022 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75E10E277
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:25:16 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id z62so988124vsz.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GuniAOq5DbLNh++mRg7r5HcnQnN5dB0Mrzttjolx/0=;
 b=JvoXhqHh4fRaRTGFXjTUViYteMfWZYVEJjXVWgEP8jABE9TSdjnkZ5uDbw1qHW5LjQ
 Sg0OmJkeARJKwdte7vAvaT22KQJVosDqipAO/UKOMmKx5aMGafBNcWdP+TZD+zgYznL4
 SXx8J6d+vgCpdMCNWDlqLGAb/IYrEkxtsgsbyLyJHVWfIi+/hMT7C1TQA5sVH+8n/gQ7
 leN11oRfiwOZOCt2ddnVf7Y/BMtCGXUr7GgIsSnOygpBflDfqibr33icBeLqxwSlCxn8
 cvPFWr/FLqEXu0Adgq89dWWXSFdDtWSuzGYQabebCMOuAZdJFhEq2XuIbXdvjVLs3dCv
 EGnQ==
X-Gm-Message-State: AOAM5322p/KZEwSomq7UpeLXD9LhpnEumca+dbSfet0ly5jFRWBECd9e
 8zGay3jRdchQAJ6wf+/CfFIvgr/pnkfQ3g==
X-Google-Smtp-Source: ABdhPJxgf9/Qbk5K4Ek+mTQtxWurGTeKdQJC6wxlV8NtdXwjp27Av8Z95RcpDNPf+qW/TOMew/0Sig==
X-Received: by 2002:a05:6102:e0d:: with SMTP id
 o13mr1078095vst.40.1644423914853; 
 Wed, 09 Feb 2022 08:25:14 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id m3sm5892vso.0.2022.02.09.08.25.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 08:25:14 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id b2so3185149vso.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:25:14 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr920976vse.38.1644423914101;
 Wed, 09 Feb 2022 08:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209091204.2513437-1-javierm@redhat.com>
 <CAMuHMdWSDBjpYJv6JtgvyaKiFKh_eqbvH78TR6VBtpDeFJvqFQ@mail.gmail.com>
 <YgPbAL0I8Wn7nnNb@smile.fi.intel.com>
 <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
In-Reply-To: <d32c731b-c06f-2dcb-5a6d-1a84351719b2@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Feb 2022 17:25:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
Message-ID: <CAMuHMdXsAyp18ivtSe-ZVmu6xbBBnvjMuZ=H1w9Gk=Ys4rkCeg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] (WIP) drm/solomon: Add SSD130X OLED displays SPI
 support
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Feb 9, 2022 at 5:07 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/9/22 16:17, Andy Shevchenko wrote:
> > On Wed, Feb 09, 2022 at 01:25:46PM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Feb 9, 2022 at 10:12 AM Javier Martinez Canillas
> >> <javierm@redhat.com> wrote:
> >
> > ...
> >
> >>> +               .compatible = "solomon,ssd1305fb-spi",
> >>
> >> This needs an update to the DT bindings.
> >> Hence this may be a good time to deprecate the existing
> >> "solomon,ssd130*fb-i2c" compatible values, and switch to
> >> "solomon,ssd130*fb" instead, for both I2C and SPI.
> >
> > Agree!
> >
>
> Did you see my comment about automatic module loading ? I think
> that would be an issue if we use the same compatible for both
> I2C and SPI drivers.

We have several drivers that have a core and separate i2c and spi
wrappers, see e.g.

$ git grep -w ltc2947_of_match
drivers/hwmon/ltc2947-core.c:const struct of_device_id ltc2947_of_match[] = {
drivers/hwmon/ltc2947-core.c:EXPORT_SYMBOL_GPL(ltc2947_of_match);
drivers/hwmon/ltc2947-core.c:MODULE_DEVICE_TABLE(of, ltc2947_of_match);
drivers/hwmon/ltc2947-i2c.c:            .of_match_table = ltc2947_of_match,
drivers/hwmon/ltc2947-spi.c:            .of_match_table = ltc2947_of_match,
drivers/hwmon/ltc2947.h:extern const struct of_device_id ltc2947_of_match[];

Are they all broken?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
