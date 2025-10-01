Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F3EBB078F
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8010E716;
	Wed,  1 Oct 2025 13:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8B110E714
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:23:50 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-78f15d5846dso77111776d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 06:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759325029; x=1759929829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYdalTnEkJlTI6nAxkZ1pZoLmc57oQNk8+NRjQz1+SA=;
 b=Z7UznOy9Rz7fy11rz+Q7CKJO2/yW55TIV+p2DBehTCoUEYd/BZTp/zeCkTR5Cr2Hbz
 cRISsHPSfgR9t3szsqdbH3hmSVw9WNjJnsQU314jv8S9Jw+cq6P06Bw9twcXzRFMwj59
 MvvpZhyy+RWV0fLpMG309HcnC9NL4ik972wJFuGsfvOLQgX5Vkx/4xDz0tCeZoXDXZ94
 DSPBRfdT5V0bbY7rVA+uUjE/nZyj83InDPILEnwdFSqeASrQcKvk1KS+47X0f6LCr1wG
 dB2MOA57DurmbsswTWwJ445euSxEmPrkJ5BkvvMDRl/O1Lcpa42PaavMJLTf809YpE9A
 Yi0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcUxw2DfG1e+YArocO4Lo8S9DhJy62ALjK8dbZ6yEMYH5YMpV0/T/nCnWcY6aIPncWjS1/vG1kxRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFk6QTq8110kLlWXvL0ShGE5Bf9ikcs6r4k617olWqUb/KZs+w
 /FJookJlxcEWnTCxI99to47Cix0Sq3sfj5DnhBIGcQYx7YmUhmZuf1UG3Dl5pY8u
X-Gm-Gg: ASbGnctceMwukSfX+jkNMxaVUaJqbUA2O7l8KjVPkkdu0VlnP8ZgdqeieyNAG9py6Ld
 dgdUubXbovyRrI7eoqCpYsgToxfQBy0X12SraAm8KSZNOAbskGdeTlyYQ1z/lKyWm0C3ekHrLFi
 h9Q4fAV0uExTNVE9XzYi9kX8F2YUoBpK8pkBG54xUH+9Rgoe14YpnFhBbIYRYZt/uwkKrYsUH5z
 sye+Z3yM16Vy0druP3HJj1xRqNxQvtGH9wtjX4s9uMmnq1v6k9CNWE/AguVC3xjzx9zY19iLcB9
 JnlA8VRv5DLjzK8vkTK3hkpGHNO3GvVX+y6oQubzuVOOnKmGspc2AOUz2TFnf91WU7V8iUUWPeT
 bQcrgnmgnDX88ZXfq2PZHVag9vtZMN62T0efk/C5RDXcK5fPMmOOgXHcRtzz2p5Y7dwjw/VDqfD
 GrjLXjF88C
X-Google-Smtp-Source: AGHT+IFsACWYlLYqIiiy6aFjXIgPIV+ULURnDH2J+2kZPPk/TsEKtjnaAs/VpEfAVStLEZlp93EMqg==
X-Received: by 2002:a05:6214:54c5:b0:710:9995:ced4 with SMTP id
 6a1803df08f44-8739d9e5a3amr40947946d6.17.1759325028817; 
 Wed, 01 Oct 2025 06:23:48 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80167b8b79esm110557766d6.38.2025.10.01.06.23.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 06:23:48 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-78defc1a2afso85606236d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 06:23:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJnx6h+Mpx6c9djsE9mrm9h2BaAlAfGQmlq3uKFk53jTJ/9V4heDZFzsTkbOVk8ivt1H0leeR4izI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:161e:b0:58f:31da:dbd3 with SMTP id
 ada2fe7eead31-5d3fe509ac2mr1393313137.13.1759324645740; Wed, 01 Oct 2025
 06:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
 <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
 <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
In-Reply-To: <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 15:17:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
X-Gm-Features: AS18NWDiZs7Ynz61qNNAVC6cUY3oeLbFhcjv_kGBKaaXq5pMP7Ji5m5RgOlqVh8
Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
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

Hi Prabhakar,

On Wed, 1 Oct 2025 at 14:23, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Thu, Sep 11, 2025 at 3:26=E2=80=AFPM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> > I still don't see why all the code here has to be in a header file.
> > Usually headers contain only a few lines of inline code. Is there a
> > reason why it's not in a .c file?
> >
> Ok, I will move the functions to rzv2h-cpg.c and export the symbols
> and have the declarations in include/linux/clk/renesas.h.
>
> Geert are you OK with the above?

Sure. The DRM driver would already have a hard dependency on the
clock header file anyway.

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
