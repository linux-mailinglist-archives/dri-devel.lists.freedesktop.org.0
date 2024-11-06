Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B09BF610
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 20:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D8310E76B;
	Wed,  6 Nov 2024 19:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DE310E76B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 19:06:58 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-290c69be014so82605fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 11:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730920017; x=1731524817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZfJuo7pugYHJJaS8IJNytNUoBp8GBDpjZKB6B7LHdk=;
 b=K46PHG6X2pLxsQvu9uyYNRwNAB2Bj9CMvmaRqH341B6Wx2WG1qTroipGgrryfP7k7c
 SUfICnGMJ1ss6xoAKoz8JyBqV7GYfEfd4x6TcRcdhF4kzQPrSX2gYIM8q3uq4eW0QlHv
 YdHtizEcT82vUiASxx2vlhHFF2XUcvHn9BQPmxIFjc9/69FbhsR7EdwVQYlU1ytMBFWy
 gEzzN50vZ3UXhkBuhBdEnwhDfGH+SGyIEQb6jagbBuAPCwGFTE+vzich/Hm1QGtGwnjf
 YVM3Ip9D2sN0mpaT460A/hdzDW8Imbt4mKxXVdjWNoEYQINDZuJQgd6SkmZ7oZsDcP86
 oePQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW24/Oy+40JcckQ3aD23wSkBpockCmRjWCr1yKlnycqq6Ys+0A29GpvaVAQZyl03VjGQvCfInMt+aY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP/cG3uko3Fg3YkOPs609SEfALefIZcTAnIe9eb2tqI2/3Mdwj
 FDXxb8l2hfLKogU6oy0gMd/2GiAHmVOh6hQoRQwdfS6EueUJn4ELxAp38dre
X-Google-Smtp-Source: AGHT+IHgE7j6dkS9N+e+h/lSSKsAEXludTHwZUQn/nNO2jVsSRi30vL1XdKJgr05NCVB3nVxPsJNRg==
X-Received: by 2002:a05:6871:ea0e:b0:259:88b4:976 with SMTP id
 586e51a60fabf-2949f04a931mr17853740fac.43.1730920016709; 
 Wed, 06 Nov 2024 11:06:56 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29487429433sm4458523fac.6.2024.11.06.11.06.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 11:06:55 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3e60966297fso111310b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 11:06:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxqtDBRTorUNC8+ggCG2UXozjHiSl/QGxs1MptrPphJ9iQqLOP6F25YfQj7KNJBEqtr57rHeesfAI=@lists.freedesktop.org
X-Received: by 2002:a05:6808:130a:b0:3e3:a99a:433f with SMTP id
 5614622812f47-3e758c5a52bmr17620319b6e.13.1730920015121; Wed, 06 Nov 2024
 11:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 20:06:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
Message-ID: <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
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

Hi Biju,

On Wed, Nov 6, 2024 at 7:49=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane from bindings.
>
> [1]
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV75=
35.pdf

The above is for ADV7535. Fortunately
https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533=
.pdf
agrees ;-)

> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

With the description updated:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
