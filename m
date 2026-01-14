Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D8D1FA9A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CD010E2C8;
	Wed, 14 Jan 2026 15:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E278E10E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:15:32 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5eeff7e8bb3so4081510137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403732; x=1769008532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mAk6Po7rUczPO72n7frU+FuUdnko5VLEu/mgiUZN78=;
 b=QHMlrgvIMJIoHgDXv5C0KitUjd+M7uA2lGiah1QUhc2prHCPB4TR0/SkrHlTofbkEL
 NO8A6YSIkibyihG5EolYnE4/PF8IlXR/N0H/HWaenKv1kAQkIyBujSK7LihV7lLv84HM
 AF74IwaLg+t+wJrAPYQ+XtQLn1USY0ZkNkgif8q9GvThtnGC8Fh0PgYixmLMIqS7eGTw
 n3pOBd8E+WDLNqRZ4kc8+nY/wQCDx8WTejPI9+9MM86Qp4lt1te2b3VeHvCx1U+SkM90
 uOf2k2jZm9SJYPfwhnzjTRAOJqvfA97qhSO+ou8YYkS0lMidgbeACFGt+BZuTlYut5jg
 B1Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0RtA5aZXIxMZhbE8FWiff69l6WaQ1QNMK8/kNdI3NRh+bzcyiuYGYYfHPIcc5XlUnBjdKqBXxeDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwT7Rpg8JKFgYOGte7jLzJbITeDrvkRAz9D3HfWWxLjQN97Ver
 jJEkWKg4YaWypg9S02v1wl+VtJwriRB/0LxYSbj1Ome3Fpy3rawbFCpX4AfrcbiP
X-Gm-Gg: AY/fxX5zuFHCVvw/ASzqH8XpUR94HdzsV6X3gEMtYlIAvj+KDjwhqkx3Tn+FfVWzzHz
 KwsEJcKzW9zks5t2ZLRvO1jvYqB/tTIEdiWK6rB6xPpZAy06v7fZjWdIYHq+LA4r+5h/4imXrfI
 HQ7nmMJjEoY2ZwpKlGQk26V4nDFMWfg44FGC/GgkFTabUniBfG1vFG9sPNUdna/dDI3f7JSNQlx
 MCett3Ct5YXOmlQtrxM0Ma5uuF46EVxm5DKdfJa4HAPF3j/wMpH8StsfdtIteZk0hjTrFd3CLuZ
 fvVtCJyA3GPNiEpZ/RV1kCdFOa5segaoKKTj2kIreBs9xXO0JLzQpvsDBqEru55Gg+0JDMwWVag
 7W12qJuYAx+TkGOWfcV/0o5hHpiBEw77j4STcZ7gXMUMcRQXbRmS+eRLhsEled1K7AAeSesAJvq
 1j9CisK9EbFjWafYzxyUeJ2Oeu/s3Qu2Yvmuhmtq8vtyUAWKSa
X-Received: by 2002:a05:6102:948:b0:5ef:5389:634d with SMTP id
 ada2fe7eead31-5f17f58b234mr1540751137.20.1768403731589; 
 Wed, 14 Jan 2026 07:15:31 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944122ad97esm22285970241.3.2026.01.14.07.15.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:15:30 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-93f5905e60eso5506705241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:15:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXT5sMaqATwVNgNAsZDCi/8GkJpVhCKM8kACtNLDsOhvRoGXzqI3pM+mYzEde+oTVtohbrdPkF7iKk=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3e05:b0:5ed:99d:6f6 with SMTP id
 ada2fe7eead31-5f17f4a6362mr1410838137.19.1768403730497; Wed, 14 Jan 2026
 07:15:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:15:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
X-Gm-Features: AZwV_QiK_um5XwX0Uu_MDOD3I9TuaB-CMYyAU5lez0Cp5nlWbm7lpzSkXutUdXY
Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] arm64: dts: renesas: r9a09g047: Add vspd0 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add vspd0 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
