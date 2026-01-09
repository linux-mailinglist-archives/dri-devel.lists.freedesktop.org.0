Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E61D0BDB4
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1AA10E923;
	Fri,  9 Jan 2026 18:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E99610E91F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:36:20 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-943d0cafe77so1487866241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983779; x=1768588579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fa2jKIqs2yYTNXV3hdw53GbF0voF5R+l35nND2b7JKA=;
 b=cB5rDF1Xj8p0tfZoWeDlHGOBm0zMr3OTko9Ql1fkMSd7dwowvzNiUOc3Ys9rcp+xli
 cxaBrCc8PINDM2YMnoRtJfH14j+OoAjlofr1y9j5XbgoY6O6uxOuUBiryQ2FuRGhqhNQ
 0gSBIRqOJVTl1usJIUqXfVtobl0hqmISccXWyxYFzMOpiboYnTtnRyLM2TU2QE47tlO+
 u0k1nOz0ESe5Ozo/moFFZx3drBMjglQEu9JyqRapJQ5YA8Tup6vDRaNQ00Rd9bAZBG28
 gzxOl/OWeXqD/fGVlFwlur7ipyORichbI4vBqdCYpBTBiKgcYv+8YMjaXgsYKvXaDogO
 8kJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZbyiFoxAlhdSW0vY4YBg+M/XiUjJc6AZO95KqWWYVjU7fE2bfvSgaYDNhIFz2U4sJLN+vDlfJ3ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUReluPlXo57BZnfirbvIvkjFu+73GPEnmwJnKHboy/6R/sxie
 P8XzzLBbvTdW8lnyIurE+Nc5jSlbLU+5F8tC1ggCAlWZ2tXC0hxd43PyRhOu0DeS
X-Gm-Gg: AY/fxX58jHxWVFzFv7J8euQrGAzzY6g1O0/4lwmeUx/S5fP9JElJ3Oz0TrgzSbUpHHW
 6aaED6Vumb5cGeCXSJUu7CaWtHHVJ5aXjg+j9k/QJeknuCQwBZAKasrOtIzZRR0MDEC3mwAJcvs
 dDldxqQv+B2BhONjXEyj7i7OfDcN16C5AW8N6XdKuUXGI1EfXQpevePGhI+MLhhGIBoEnwxZ/03
 Qr6/bkj+5oQa0DlmSLbW0PoYE8SEOe+p/IngnsjN/F12QvpYt/j9/uohcbklSNn34amqD2K936M
 Q+ap09Uj1UU8TQbggzOWPQYsHUXttbHeboZFtIvuqnjYHbGoGNGHO0tcY6vidAgKBgqdQPX6unQ
 Qreav6rcxvO49fv1mx9QH8ijWYYKZjlDz82+B5iwnoD8GntUALHvEqzS13/P3NONducS8YRAnnV
 JqvSEJEF0KIf+MHXCgDnhBelsiOjVyAzubfduXxy8bQ6VrCf2uKI18
X-Google-Smtp-Source: AGHT+IHgk9X4pVVnG8O1nNTHtlJqJZZLegpWAxqbxvXxN+ytkt3hZtLg2sQWUOqBhKF4f3y0rzo4Uw==
X-Received: by 2002:a05:6102:419e:b0:5df:ab05:d846 with SMTP id
 ada2fe7eead31-5ecbae4aedemr3521235137.40.1767983778934; 
 Fri, 09 Jan 2026 10:36:18 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944124a3386sm9587430241.11.2026.01.09.10.36.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:36:18 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5636227a6e6so614996e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHSYkQAb21N9rmeGmDRwQrXq9zeWXwV9jbIz7fB5I2eMrut0ZzcDrst4v63LagLBsaq8CM0+KXjDE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:dc9:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-5ecb692ea6emr3804438137.25.1767983778284; Fri, 09 Jan 2026
 10:36:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:36:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
X-Gm-Features: AZwV_QjUM7Wb6ei547ywW3OJAaC3IFOVWsMcEtNjkONgJiVb3Bt1YrhDacYAZYY
Message-ID: <CAMuHMdVfXnmDs6UkEmGT_AR9YktEGZqAWaWiu9AijhsvWfgorQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_DIV7 clocks
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable LVDS0 and LVDS1 output support.
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
