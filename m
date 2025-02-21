Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7881A3FF20
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775C10E113;
	Fri, 21 Feb 2025 18:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QikNcr6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DF410E113
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 18:57:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so884984f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740164233; x=1740769033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PN3oGQQws7Six7IFqs4lj8276Rsr9itBvWsUOy5dh5s=;
 b=QikNcr6r6qOWfU1314DYRcARuj0HxIChX0Qmk7U8KSJI5fdEojf8sZiVWOrIIydaDe
 DPx9l35XG6b9WkpxNqKC9nU5eEml1DCwVvWsz/kyJUsiJNsuKAlj6cwpT9nkcaVl0Ei+
 6L3x/f4KIx/O33RxlPVChTtLG8bbogOYrJdCMdLabEENF0VP5lEykmoV73XIjLlgN49S
 0ygTLCfd0c32taqIxMKEWl2LDHS0B7e3RX+wiCcp+QfFlbVImchBnYrme0RXqOfKkAVs
 6Oyt56rlNGj/v9jXdlgsmZ8HBp2grRKe2ntPhK42CzqM/cvPFWZ7vfBGsCG1iifGJUor
 TYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740164233; x=1740769033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PN3oGQQws7Six7IFqs4lj8276Rsr9itBvWsUOy5dh5s=;
 b=tM3IHK6JgOSBbtuKmLoKsYsVk4HTKwwO2Fct9VdxhyBeR85bUBV5IFBLVajP5WyCMZ
 vT7jYv456jtLFxNv6QCOe9P2ZiH6iekvAZ6CBMHkH73PZ11MXzxWaUoSgQu/rAHmLsdP
 GMj7+vpPW+WvLgGetrYnGeA/sCe+7cc3K7/j0OMWC/g+UNGhM155fXTwu+PIp/WDvQWQ
 ys2cfAsoJ9ettmjK38oaKv2VF3dKw09oCd7KKFQKyyJNmoMgoyGuVi0uzNQk5HyRF481
 aPc3+dMaqkUImLsURflH4plQUAAL1cpKWW7Bxusisk1L3XLc1/lXnNrjMj9eHLaWIuwQ
 MCBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPzwD4+iTqbWoN+wsF9/4zUn83oi9IOu8IxYIeWCksJ69SfZH43T0oOZ+EfbzwsbFgyI0bO+ZsjrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI8pIIJ6ajwE1pW1EqCjRJVi3n32oR65bYamZBLFHoQt/XmlJE
 4zWuZnS3Agy9Ned6QB7sjv2IAHl0/8g3uCPJFqFMJdCySkSta31j
X-Gm-Gg: ASbGnct8IjK/YO6gbRDH/PevlW278gVNXEOqgLGrsO7vAin6FHFre1dpyiO5CPDKSiC
 iPfFbb7VUccMjUDZJqwkb9D2a0b41EWQJ+BPbxEMLIPPtb5rC2kMwtXFJThv1yLyvvWv/MayfBH
 kmi5eoeNWqvduRx57pRAeN2Z03tAc6TBb5y8fvp6c91zN95fg778GZcCrvdEN21MyBIAWH1P9Vt
 WSs07NNxUdUrj9J4yxc3JYJwaZurSLtm8JxfLnypqy2XaYJc/Fpp9AwrhYKOYq4qclMwLZp35th
 Ara+1sYrraqp6mbk2VOOVyEtipn4GHD+77U3RPv60OV9NUa75/O0ScP0jvMi5i+Tabecy8jHC2y
 1wg==
X-Google-Smtp-Source: AGHT+IED3JUpuFrGJtsUJIgfdM5lhUdX84mBy/uSqrlejM+ibWRA7x2nFo9HzaxyAF3shIBnXClB+g==
X-Received: by 2002:a05:6000:1fae:b0:38d:cbc2:29f6 with SMTP id
 ffacd0b85a97d-38f6e947434mr3452719f8f.17.1740164232187; 
 Fri, 21 Feb 2025 10:57:12 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm24085725f8f.77.2025.02.21.10.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 10:57:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Fri, 21 Feb 2025 19:57:09 +0100
Message-ID: <2221204.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250216183524.12095-1-ryan@testtoast.com>
References: <20250216183524.12095-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Ryan,

sorry for very late review, but here we go...

Dne nedelja, 16. februar 2025 ob 19:31:59 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> Hi All,
>=20
> v7 of this patch adding support for the Allwinner DE33 display engine, us=
ed in the H616 family of SoCs. Apologies for the short interval between ver=
sions but a compile error due to a missed helper function in patch 11 snuck=
 by me. v7 only differs from v6 in adding this back.
>=20
> v6 includes some small fixes to the device tree documentation, improves n=
aming of an enum type, moves colorspace configuration from the sunxi engine=
 object to the mixer object, and a handful of very small style and whitespa=
ce changes. All comments/tags from previous versions addressed. No function=
al change from v5.=20
>=20
> A v1 patch to enable LCD output for the Anbernic RGnnXX family of devices=
 which use this SoC with an RGB LCD will be submitted shortly.
>=20
> Thanks to those who have reviewed and tested previous versions, and to Je=
rnej for the initial patch.
>=20
> Original blurb below:
>=20
> There is existing mainline support for the DE2 and DE3 AllWinner display =
pipeline IP blocks, used in the A64 and H6 among others, however the H700 (=
as well as the H616/H618 and the T507 automotive SoC) have a newer version =
of the Display Engine (v3.3/DE33) which adds additional high-resolution sup=
port as well as YUV colour formats and AFBC compression support.
>=20
> This patch set adds DE33 support, following up from the previous RFC [1],=
 with significant rework to break down the previous relatively complex set =
into more logical steps, detailed below.
>=20
> 1. Refactor the existing DE2/DE3 code in readiness to support YUV colour =
formats in the DE3 engine (patches 1-4).
> 2. Add YUV420 colour format support in the DE3 driver (patches 5-13).
> 3. Replace the is_de3 mixer flag with an enum to support multiple DE vers=
ions (patch 14).
> 4. Refactor the mixer, vi_scaler and some register code to merge common i=
nit code and more easily support multiple DE versions (patches 15-18).
> 5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to t=
he DE3 driver. This is currently only supported for VI layers (for HW-decod=
ed video output) but is well integrated into these changes and a subsequent=
 patchset to enable the Video Engine is planned. (patch 19).
> 6. Add DT bindings for the DE33 engine. (patches 20-22).
> 7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scal=
er, fmt and csc module support (patches 23-27).

This patchset actually introduces 3 disticnt features, which should IMO be =
separated
and thus making reviewing patches easier.

1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) - this i=
s used on
    HDMI for proper 10-bit 4K@60 HDR output
2. Display Engine 3.3 (DE33) support
3. AFBC modifier/format support (used for more efficient GPU or VPU output =
rendering)

If I'm not mistaken, your goal is only DE33 support. There is are two reaso=
ns why
I've never sent these patches myself:

1. scaling YUV images doesn't work

Not a problem for any user who doesn't use video player with DRM plane rend=
ering,
which I assume is most of them. We can get around of this issue to deny sca=
ling
YUV buffers until the issue is sorted out.

2. plane allocations are hackish

DE33 for the first time introduced option to move planes between the mixers=
=2E DRM
has also support for this, but for time being static allocation is acceptab=
le and tbh,
even dynamic support need appropriate initial setting.
As you might guessed this is done in DE33 clock driver using magic values. =
Proper
way would be to introduce some kind of connection between mixer/plane and c=
lock
driver, so initial configuration can be moved to appropriate module instead=
 of
being thrown into clock driver. I need to check where to put it and how to =
properly
connect DT nodes. Maybe syscon phandle? I'll do some research.

There is one glaring issue (when you work on driver and test every aspect o=
f it).
DE33 introduced RCQ, which is basically DMA, which copies shadowed registers
from memory buffer directly to hw registers. IIRC it does that at vblank ti=
me. This
tells you that current concept of writing register values at any time users=
pace feels
to do commit is wrong and we've been lucky that it works as well as it does=
=2E So,
in order to fix this, driver would need quite a big reorganization. Introdu=
cing
shadow buffers would solve most of the issues, most likely also with YUV sc=
aling.
Implementing RCQ would be then relatively simple and even improve timings.
Note that even DE3 has occasional issue with YUV scaler and also read-modif=
y-read
access to some of its register can produce bogus value and thus corrupt ima=
ge
until next commit.

This is not to say that these issues must be solved with this effort, I'm j=
ust stating
them to make people aware.

Best regards,
Jernej

>=20
> Further patchsets are planned to support HDMI and the LCD timing controll=
er present in these SoCs.
>=20
> Regards,
>=20
> Ryan
>=20
> Jernej Skrabec (21):
>   drm: sun4i: de2/de3: Change CSC argument
>   drm: sun4i: de2/de3: Merge CSC functions into one
>   drm: sun4i: de2/de3: call csc setup also for UI layer
>   drm: sun4i: de2: Initialize layer fields earlier
>   drm: sun4i: de3: Add YUV formatter module
>   drm: sun4i: de3: add format enumeration function to engine
>   drm: sun4i: de3: add formatter flag to mixer config
>   drm: sun4i: de3: add YUV support to the DE3 mixer
>   drm: sun4i: de3: pass mixer reference to ccsc setup function
>   drm: sun4i: de3: add YUV support to the color space correction module
>   drm: sun4i: de3: add YUV support to the TCON
>   drm: sun4i: support YUV formats in VI scaler
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: vi_scaler refactor vi_scaler enablement
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de3: Implement AFBC support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
>=20
> Ryan Walklin (6):
>   drm: sun4i: de3: refactor YUV formatter module setup
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
>=20
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
>  .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  21 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
>  drivers/gpu/drm/sun4i/Makefile                |   3 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            |  28 +-
>  drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
>  drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
>  drivers/gpu/drm/sun4i/sun50i_fmt.c            | 100 +++++
>  drivers/gpu/drm/sun4i/sun50i_fmt.h            |  32 ++
>  drivers/gpu/drm/sun4i/sun8i_csc.c             | 345 +++++++++++++++---
>  drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
>  drivers/gpu/drm/sun4i/sun8i_mixer.h           |  53 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
>  drivers/gpu/drm/sun4i/sunxi_engine.h          |  29 ++
>  20 files changed, 1306 insertions(+), 214 deletions(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h
>=20
>=20




