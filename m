Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4E5A78EB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 10:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397110E26E;
	Wed, 31 Aug 2022 08:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FA710E263;
 Wed, 31 Aug 2022 08:21:56 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id t82so4196505vkb.6;
 Wed, 31 Aug 2022 01:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tL3Pu80GajPbXIuFp2pntr8ejcDbNLFHN+ltW3MDRBA=;
 b=Q6MwXirQAYjlOHFQ1NAHITS6yND0ik73xEkk5GaRK1To8hWUaQ7QYHgbWpy4x/mfTZ
 Yj0QrRVX6JpqPHwPFOBAx+RqxAxoAZhHbpaX5PUYs36puNA5971gXOm54jPIGpzNuR8z
 To3g8kT+2Iw0jzNa8EOJOtj3Ruawse03xA81fen+DT7MAKWZsgUO3YnyC7NQuLDSZ/ma
 DXbPWuZHzITDrxsPBZvJBkfSMTi7u9MPKSizDB50EQXXZKi0mtRNoMLWyBy+6wxitA+O
 dTk8UqOnu6XRqT/jRGd3yTij8wg81o0/ervVzQpA9s59Y2+BajTb31iFCZTl3ma2ip5k
 2S1w==
X-Gm-Message-State: ACgBeo3EAqAWAH4H5lNS56sVMD8erKDOUjEXvMp6UYGWEabU7MipRdZO
 VTy+BLeaWbKilf61Ml3PKT3JiTNRSyhwwg==
X-Google-Smtp-Source: AA6agR6GW/U9Q7LX0WKGY4rPPbL7wGDVR0A9uQO0xcpyLKMnSYRF5qsqhayku0SNewg4aaQnil8mLQ==
X-Received: by 2002:a1f:9b57:0:b0:379:1632:8dda with SMTP id
 d84-20020a1f9b57000000b0037916328ddamr6100661vke.15.1661934115152; 
 Wed, 31 Aug 2022 01:21:55 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54]) by smtp.gmail.com with ESMTPSA id
 x204-20020a1f31d5000000b0038ca654efa6sm2202663vkx.19.2022.08.31.01.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 01:21:55 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id q21so5168121uam.13;
 Wed, 31 Aug 2022 01:21:55 -0700 (PDT)
X-Received: by 2002:a25:24b:0:b0:696:4e87:7cec with SMTP id
 72-20020a25024b000000b006964e877cecmr14439821ybc.202.1661933679611; Wed, 31
 Aug 2022 01:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
In-Reply-To: <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Aug 2022 10:14:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
Message-ID: <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mateusz,

On Wed, Aug 31, 2022 at 3:44 AM Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
> Wow. That's an enormous amount of effort put into this patch.
>
> But I'm tempted to say that this is actually overengineered quite a bit :D
> Considering that there's no way to access all these calculations from user
> space, and I can't imagine anybody using anything else than those standard
> 480i/576i (and maybe 240p/288p) modes at 13.5 MHz any time soon... I'm not
> sure if we actually need all this.

We'll need it when we get an Amiga DRM driver, which will use
7/14/28 MHz pixel clocks.

> But anyway, I'm not the maintainer of this subsystem, so I'm not the one to
> decide.
>
> > +enum drm_mode_analog {
> > +    DRM_MODE_ANALOG_NTSC,
> > +    DRM_MODE_ANALOG_PAL,
> > +};
>
> Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes is common,
> but strictly speaking a misnomer. Those are color encoding systems, and your
> patchset fully supports lesser used, but standard encodings for those (e.g.
> PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some more neutral
> naming scheme. Some ideas:
>
> - DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refresh rate)
> - DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standard line
>   count)

IMHO these are bad names, as e.g. VGA640x480@60 is also analog, using
60 Hz and 525 lines.  Add "TV" to the name?

> - DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding ITU System
>   Letter Designations)

Or DRM_MODE_ITU_*?
But given the long list of letters, this looks fragile to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
