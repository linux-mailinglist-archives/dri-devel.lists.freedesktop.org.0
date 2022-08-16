Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05EF595E91
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 16:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ABF8B35C;
	Tue, 16 Aug 2022 14:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB818A986E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 14:49:59 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id e28so8281778qts.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 07:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tf29XLGj+1bd58LVE065Hm1nPqeAKMph377e+8mce68=;
 b=Pm9H/6RoDFkk4qMQbygu7dX1qOYaVG+2Z9FPK+xuI505NbYzu8KoIZRzHdAOCVmLyg
 4k4NB3o7wP0IEuTTNujYrFjMBIG/HsoMF/PfGE/npgqAK7dI5hoBtX1QPfbPtZXlcfro
 0k+97S7YolzwvYLEwI2iDwR3oUuw6qVLMlOIoB9te/NfnYjwvz/HaKInNihdYfDP/VqX
 oHwQz188bmI9wqVqzXkQblDz5D99BjyjuQzxVV3W+cq7fpo0F25q2+Nai/eyqEXMZlJX
 efOCg0xrPqMsmy6go8ZFdjHLKRwWbU647lDegpl98FRIcUgyrTXmLPC5iWnn1dUa5MDJ
 EjIg==
X-Gm-Message-State: ACgBeo0e1sgq83qoTaba4LVLJARKT+a7ijDG/DD76jiuObduCvTgZH5g
 XKLyq9taoCDObdGJ/fpeMvCIYkxOJyMZ1g==
X-Google-Smtp-Source: AA6agR5OfEmW8/Dy6J+XY26me02wmOfWiXl6MSKH+vCUMSMFeAJu1wc1jCSMjOd5CxIdD/2D8y3f2g==
X-Received: by 2002:ac8:5c0e:0:b0:342:7cba:8fad with SMTP id
 i14-20020ac85c0e000000b003427cba8fadmr18149869qti.667.1660661398573; 
 Tue, 16 Aug 2022 07:49:58 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 t24-20020a37ea18000000b006b9a8fc0c93sm11580265qkj.53.2022.08.16.07.49.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 07:49:58 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-332fc508d88so87790737b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 07:49:58 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr16448315ywe.502.1660661082059; Tue, 16
 Aug 2022 07:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
 <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
 <20220816134624.cmb5s6i6pkdhu3qj@houat>
In-Reply-To: <20220816134624.cmb5s6i6pkdhu3qj@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 16:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Aug 16, 2022 at 3:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:27:17PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > The current construction of the named mode parsing doesn't allow to extend
> > > it easily. Let's move it to a separate function so we can add more
> > > parameters and modes.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
> > drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
> > (https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
> > ;-)
>
> Indeed, I forgot about that one, sorry :/
>
> I think I'd still prefer to have the check for refresh + named mode
> outside of the function, since I see them as an "integration" issue, not
> a parsing one.
>
> It's not the named mode parsing that fails, but the fact that we both
> have a valid refresh and a valid named mode.
>
> >
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
> > >         "PAL",
> > >  };
> > >
> > > +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> > > +                                             unsigned int name_end,
> > > +                                             struct drm_cmdline_mode *cmdline_mode)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > > +               int ret;
> > > +
> > > +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> > > +               if (ret != name_end)
> > > +                       continue;
> > > +
> > > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> > > +               cmdline_mode->specified = true;
> > > +
> > > +               return true;
> > > +       }
> > > +
> > > +       return false;
> >
> > What's the point in returning a value, if it is never checked?
> > Just make this function return void?
>
> Yeah, it's something I went back and forth to between the dev, and it's
> an artifact.
>
> I'll drop that patch, take your version and move the refresh check to
> drm_mode_parse_command_line_for_connector if that's alright for you?

Fine for me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
