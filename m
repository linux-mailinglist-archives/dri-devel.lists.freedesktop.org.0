Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF0F8AD3A2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897B510E0F0;
	Mon, 22 Apr 2024 18:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80D710E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:02:29 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-61ae4743d36so51190387b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713808947; x=1714413747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIzcre4L/EBUlEtvCuRrxfW3XnVYCAdmaiVZhZRHwg0=;
 b=KBl4H6ZiVaCemX00lzaND0EzpFS5fTskdOBnLUzpDLBiLn3n+oTNNsB25nNqfFpfID
 xsSjAsqhcJOzm0JiJaVIrWCqjvtNX4Ua6pQ670HVwp3zccrd7IQFkJUx54FFo545rJ7r
 2ebptn94gSIVBRiDxzhE2Ass2wm1+pzqqqfHBFrSWgqNTpYZIcKcl8Ex5gQ1Ndx8Heve
 Nje9O2ps2h6djF72NhCKGDUIOPbyz/ml6TTCZOLVUZxLfMcDnb2ppfcEP2Z+V5k1XS7U
 HaE1Ly0fXCCYsOP/jXeKr5KIgB/GrufNnunb76ZluR+MHJ96Peg6DZw25+e+rZppZlTY
 RnpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjI39+t4AOAZZvfu5deVFqvHraME9HO4rRXwyT/k1Y9O94aVDbLDYG5InomdKOHqnqrcu/7nMI+q1EBq2+pTpgkaspYanbyYkSs+JQywcH
X-Gm-Message-State: AOJu0Yw7TTgkJju0BFbD9N9NLKcwDsT5RYaVZkizsz5z86ssc265iw8g
 Vvd17ipnmbf9c212tBrLna2LD/AufMb+zsWMi9O9BJWe0c8MBSPO1bsQlVWR
X-Google-Smtp-Source: AGHT+IE0DwBFgoPYXrX1X8xj5P6pKGe/xBb9ngeEvU9xdiWz8q6sRCd48VhlsQC+9b+7Y6FVTod8Zg==
X-Received: by 2002:a05:690c:f16:b0:618:b08:2ab6 with SMTP id
 dc22-20020a05690c0f1600b006180b082ab6mr10634017ywb.47.1713808946600; 
 Mon, 22 Apr 2024 11:02:26 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 r11-20020a81440b000000b0061824f9a78esm2077323ywa.79.2024.04.22.11.02.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 11:02:26 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so4554454276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:02:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgvwd5azUp+rAoNymAdu/LD7b5ldWXPijEubs7pPanGB6wL+yOJXUPESaC6QpQsFsjIP6doX5bDYuOVtxUdl2fyAso3p33oiUzIzIJNheq
X-Received: by 2002:a25:fc08:0:b0:de4:6efa:debd with SMTP id
 v8-20020a25fc08000000b00de46efadebdmr9818662ybd.29.1713808946217; Mon, 22 Apr
 2024 11:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
 <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
 <87ttjts4j6.fsf@intel.com>
In-Reply-To: <87ttjts4j6.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Apr 2024 20:02:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb5sqhk1m4kD_72k0OzB5MTEFcP+QHFo+4rs8j8WEzPQ@mail.gmail.com>
Message-ID: <CAMuHMdWb5sqhk1m4kD_72k0OzB5MTEFcP+QHFo+4rs8j8WEzPQ@mail.gmail.com>
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

On Mon, Apr 22, 2024 at 7:15=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
> On Mon, 22 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Apr 22, 2024 at 3:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> I'm not sure where this misunderstanding comes from, as you
> >> seem to be repeating the same incorrect assumption about
> >> how select works that Maxime wrote in his changelog. To clarify,
> >> this works exactly as one would expect:
> >>
> >> config HELPER_A
> >>        tristate
> >>
> >> config HELPER_B
> >>        tristate
> >>        select HELPER_A
> >>
> >> config DRIVER
> >>        tristate "Turn on the driver and the helpers it uses"
> >>        select HELPER_B # this recursively selects HELPER_A
> >>
> >> Whereas this one is broken:
> >>
> >> config FEATURE_A
> >>        tristate "user visible if I2C is enabled"
> >>        depends on I2C
> >>
> >> config HELPER_B
> >>        tristate # hidden
> >>        select FEATURE_A
> >>
> >> config DRIVER
> >>        tristate "This driver is broken if I2C is disabled"
> >>        select HELPER_B
> >
> > So the DRIVER section should gain a "depends on I2C" statement.
>
> Why should DRIVER have to care that HELPER_B needs either FEATURE_A or
> I2C? It should only have to care about HELPER_B. And if the dependencies
> of FEATURE_A or HELPER_B later change, that's their business, not
> DRIVER's.

That's correct. But currently the dependency on I2C is not handled
automatically.

> > Yamada-san: would it be difficult to modify Kconfig to ignore symbols
> > like DRIVER that select other symbols with unmet dependencies?
> > Currently it already warns about that.
> >
> > Handling this implicitly (instead of the current explict "depends
> > on") would have the disadvantage though: a user who is not aware of
> > the implicit dependency may wonder why DRIVER is invisible in his
> > config interface.

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
