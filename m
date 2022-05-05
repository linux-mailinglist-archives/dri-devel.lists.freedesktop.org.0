Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F551C2A1
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A510E3C9;
	Thu,  5 May 2022 14:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0FC10E3D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:33:18 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id r11so7943702ybg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
 b=fewd6t0m8AlbJsOL8rMMtmdSbrblLC+tou4WQa5Ukx0fDLML8yOTTiI03IEYZHxp2c
 5W5CFU2Qo00NadwNz4fu2sdMo4N/fhzCDiGLHlJnCCs1Ua3dcldY61sEg61hMdSawUir
 7eSZQI2CebwLUn4u4p9Bz1nt0xWXEswSQ1mxvA/ee4Uu5XXGOucd4+6oSzUonl+Kg0LI
 8uOzDzX7qYjSqNbAmA90tOmmW4qdH/x0e5n5IbhGhckydFuX0s17/FQo0madWUU2q0+q
 rIcDxGLzvzfaBFeSvXHNgwp/tqsLvfCOnU4JqRfERHcRhzltPIYSlpBkJGsKowlUJZN7
 2CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
 b=urFByzzsrqHiaY74XrWLyeeGHABd14Vx9T6rmqis3ZXwELs7Ur3GdL7mInWHhFPk7U
 7ShK0TOdB0fRAGWBEjNjsVHAt/+4eeGZDiXgLmHLl9/mR/GwwWDXd+CHF1ksMdrPw+Hb
 wHJf+0fEzbgKFZ4/WbjHJGbbvI49ECOLFWOVPoAK/KmTKV/cjtVbwKbwrMQesVuGyiW4
 2H0CtD1+J5DMsUIxWlsBlCnb7h1iRbCHD6vSs1R5ElG8l2vMJNo9JHf80RdaI2tscpSp
 YUL1+m70feSpsJUSo55SzUAM8uNm3A7vBScCZE8+Bv6Tvha2N5pj94oF428Qqz1wZhuN
 63zg==
X-Gm-Message-State: AOAM532ETnX/2/zoSeMAbf+EkAlSH3oB/6Ozf5BBZiU9ETfxr60YU5Ni
 IyGbzkgsl/WvuvwApSM1i9ES3BprjEJwv1kycWtPCQ==
X-Google-Smtp-Source: ABdhPJwo8Hf6LSoTaiB2cHkTaFM0+gz3ZfG++D4wXVwew3EevAVlxRmwDqgoKNolEWO5oTKK+x6Cg+35P6TVPloh+u0=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr22199185ybm.514.1651761198027; Thu, 05
 May 2022 07:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
In-Reply-To: <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 May 2022 16:33:06 +0200
Message-ID: <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Wed, May 4, 2022 at 11:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)
>
> Ok, done. But I still leave the extra 'invert=1' in hs_jack_pin[], right?
>
> /* Headphones jack detection DAPM pin */
> static struct snd_soc_jack_pin hs_jack_pin[] = {
>         {
>                 .pin    = "Headphone Jack",
>                 .mask   = SND_JACK_HEADPHONE,
>         },
>         {
>                 .pin    = "Speaker",
>                 /* disable speaker when hp jack is inserted */
>                 .mask   = SND_JACK_HEADPHONE,
>                 .invert = 1,
>         },

Hm some ASoC thingie. No idea what that is, but I suppose another
place where a subsystem for legacy reasons try to do the gpiolib
inversion on it's own accord. That one isn't flagged as active low in the
descriptor so it's fine I guess.

Possible this should be fixed in ASoC to rely on gpiolib but we can't
fix the entire world.

Yours,
Linus Walleij
