Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0368AD3AC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F0510F543;
	Mon, 22 Apr 2024 18:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF8C10F543
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:11:31 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61587aa9f4cso52616027b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713809490; x=1714414290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIYJICZAHp3tuVglFyrlAugeozSb8a+qq+gPa6pnnj4=;
 b=xKSMhglY0z97FRZeQzYySr/sHeVJK6gxeU7Zp1dEaWy0w7HtYA6HgE7p+3wNv4fSVg
 X+j8ThIqDn01cTauXcRObn9b6Z/C/vvjpiA10bnO/gX3LuLFAgSG9bvFoeb0ooZdgiw9
 LLz5ofa9i5vxW7Lki/gDlnN1O049yS/PUJMih/n371wQ7LsuDMdLu2IGMXS3tkDl+am6
 pQVlqamUJkiN0iKG9VRyotSn6TiKOajHb7d3YkuG6PI3Uv6FH3M+3A1ILMRMZN0IAl0b
 IRqO61tH1WWyN3jqzE1jmmlh0gIDjLLqtFzVHiwUU7Jd/6+BmIngYBBPU50l/JESmc9W
 ZDwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHnWiKiJ3lVLMHLtg1XsHLUlnLlBiFiAN2USaqU8hWzZICMVefHdMQCM/CkgNLtRMD/4NcT8gIBABsdHdIlTVtIkHCf8KyrXs3oPQxy6Az
X-Gm-Message-State: AOJu0Yx/pJldOgRA5guB9o1OdU6lgU/NbAmlk0E/4CCNQqeyUVY10VfV
 SxB39jbG6JlTNto9nziu39ssIMh9/Etn6DXZhmQ8EWf1jJf6nVz0v6znnt7o
X-Google-Smtp-Source: AGHT+IHwD+Biqj0pBPyMUCGdpah67jxyYYjwepiCj0HrgdenA4jbVEbS24wWdIzcOdPXH2BuhKlFzA==
X-Received: by 2002:a05:690c:74c6:b0:61b:472:fa92 with SMTP id
 jw6-20020a05690c74c600b0061b0472fa92mr13072276ywb.32.1713809489717; 
 Mon, 22 Apr 2024 11:11:29 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 w126-20020a817b84000000b006156ced7476sm2041184ywc.62.2024.04.22.11.11.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 11:11:29 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-618874234c9so51662947b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9SPAruz9MyFGPlyibpLOAjHUrIEp4ETmz5W94ZyrrIy2n581KMpjdzsnphR7COdxQ5UFWDwcHMBUu2zEO+8s3mB2ecv3AlJvuIPqbh0Tl
X-Received: by 2002:a25:d655:0:b0:dcc:58ed:6ecc with SMTP id
 n82-20020a25d655000000b00dcc58ed6eccmr10979493ybg.41.1713809488807; Mon, 22
 Apr 2024 11:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
 <87wmops57s.fsf@intel.com>
In-Reply-To: <87wmops57s.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Apr 2024 20:11:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWU5R-C-sKs1GsF9Jt9giRD_moUs=1jvXastBwhWRYMJg@mail.gmail.com>
Message-ID: <CAMuHMdWU5R-C-sKs1GsF9Jt9giRD_moUs=1jvXastBwhWRYMJg@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kbuild <linux-kbuild@vger.kernel.org>
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

Hi Jani,

CC kbuild

On Mon, Apr 22, 2024 at 7:00=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
> On Mon, 22 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> > I'm not sure where this misunderstanding comes from, as you
> > seem to be repeating the same incorrect assumption about
> > how select works that Maxime wrote in his changelog. To clarify,
> > this works exactly as one would expect:
> >
> > config HELPER_A
> >        tristate
> >
> > config HELPER_B
> >        tristate
> >        select HELPER_A
> >
> > config DRIVER
> >        tristate "Turn on the driver and the helpers it uses"
> >        select HELPER_B # this recursively selects HELPER_A
> >
> > Whereas this one is broken:
> >
> > config FEATURE_A
> >        tristate "user visible if I2C is enabled"
> >        depends on I2C
> >
> > config HELPER_B
> >        tristate # hidden
> >        select FEATURE_A
> >
> > config DRIVER
> >        tristate "This driver is broken if I2C is disabled"
> >        select HELPER_B
>
> This case is really what I was referring to, although I was sloppy with
> words there. I understand that select does work recursively for selects.
>
> >>   There is no end to this, it just goes on and on, as the
> >>   dependencies of the selected symbols change over time. Often the
> >>   selects require unintuitive if patterns that are about the
> >>   implementation details of the symbol being selected.
> >
> > Agreed, that is the problem I frequently face with drivers/gpu/drm,
> > and most of the time it can only be solved by rewriting the whole
> > system to not select user-visible symbol at all.
> >
> > Using 'depends on' by itself is unfortunately not enough to
> > avoid /all/ the problems. See e.g. today's failure
> >
> > config DRM_DISPLAY_HELPER
> >        tristate "DRM Display Helpers"
> >        default y
> >
> > config DRM_DISPLAY_DP_HELPER
> >        bool "DRM DisplayPort Helpers"
> >        depends on DRM_DISPLAY_HELPER
> >
> > config DRM_PANEL_LG_SW43408
> >        tristate "LG SW43408 panel"
> >        depends on DRM_DISPLAY_DP_HELPER
> >
> > This version is still broken for DRM_DISPLAY_HELPER=3Dm,
> > DRM_DISPLAY_DP_HELPER=3Dm, DRM_PANEL_LG_SW43408=3Dy because
> > the dependency on the bool symbol is not enough to
> > ensure that DRM_DISPLAY_HELPER is also built-in, so you
> > still need explicit dependencies on both
> > DRM_DISPLAY_HELPER and DRM_DISPLAY_DP_HELPER in the users.
> >
> > This can be solved by making DRM_DISPLAY_DP_HELPER a
> > tristate symbol and adjusting the #ifdef checks and
> > Makefile logic accordingly, which is exactly what you'd
> > need to do to make it work with 'select' as well.
>
> So bool is kind of problematic for depends on and select even when it's
> not really used for describing builtin vs. no, but rather yes vs. no?

Yes, the underlying issue is that bool is used for two different things:
  A. To enable a driver module that can be only built-in,
  B. To enable an option or feature of a driver or subsystem.

Without this distinction, dependencies cannot be auto-propagated 100%
correctly.  Fixing that would require introducing a third type (and possibl=
y
renaming the existing ones to end up with 3 good names).

Actually two types could work:
  1. driver,
  2. option,
as case A is just a driver that can only be built-in (i.e. "depends on y",
which is similar to the behavior with CONFIG_MODULES=3Dn).

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
