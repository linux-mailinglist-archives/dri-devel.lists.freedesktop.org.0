Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD0AC3C73
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E110E2B2;
	Mon, 26 May 2025 09:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690410E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:14:09 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-86d6fd581f4so1812084241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748250847; x=1748855647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OHHl3kxB/rKMhdmAcTI6YIxxCctpYm2ZTkKcUrpPxy8=;
 b=nC03rGy0ZZ6Y8w57GZFH6F9i3kkXXMfOHbVmakRgJZ9dJotC0aYthWBMQhiyJuCuhz
 dsA+4SaJ7uZVIMfPnykXSJkDeTchg0Q7Sf6xF9OL4KkASDIAQeN5cUkz7SOUtSw/THyA
 qet0PBbPCZbQkmGH7QqpwlkWhakUGNlP5AZsbQFeWJ8eogp3RnxJYVScVmIwwDILgRqX
 2fcMhqkM5x0FB3jP2P+McmWd6x+BRrvhvTShmcR9+xuI9aFvJtRRGZxviKB5wJuvjwyc
 +dh272VK8fZbSZy2zkgwXTERdHCrwQ4mlzwc/Kebgs10DaEf+oFXeyCO8m4BSMcvUo0M
 2fQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTvd5TmLWHeAGXYqw8beU1G7gKfb9vT4iiLPirKqasHQhwV4a4FHiZ5Tj3SBGLIJCbX/U8It7VCkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzERl1g2jHzkYW7hz8Cgr+wOZoGzgiQ3Jom0uavNjS2oIbimeBh
 mjWM4nn40ROB1xfoW4CqZJ+jgIeGuCBKv6cCxCQN1pZlk82jvxNSC47571wNkjx1
X-Gm-Gg: ASbGncsaukGuZjw51c+AXB46ymKg75i10aDFgVxVmLF2ujBtRDwyb1aKh6JXxkhqzL1
 GwDwSyx5Mcn3bHIevcTJ+mxbqz3SgRxn1mUEh1s9KkP7E3yF4nIZ3NYUcejLnGWa+d1RBJC3e88
 INkoP+lKSXyeokY9dsPY1g58H3bQmioHlQ1m90k8W5efErqgppMI1gp2YlKP1Wj6bZtUJH/Jp0Y
 kudA3k7oekkuB9/MEAKX7cQ//JKhoUIa5Nq4q6DUi4UU1kcgezpWJ+stnk8D2X2/KbG0F7hrl0T
 nhW7Wo5P0u1EyOVs9oVe4B4ZdUBoFQ8FxS6ZshyA5z3FjX90AfbNhFswsc2T8ETA/qJlN+3gZ3F
 JtEnZJitNi2pNzA==
X-Google-Smtp-Source: AGHT+IExIVbpausz4f5g1VivhzsDc/I9J6Wa7OeZ5MBKG35XW7O50OIk75rJBcQPuHn2Yb/KJBSO4A==
X-Received: by 2002:a05:6122:1828:b0:527:b7a3:dda8 with SMTP id
 71dfb90a1353d-52f2c04b1cdmr6122227e0c.7.1748250847100; 
 Mon, 26 May 2025 02:14:07 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab6c949sm17466515e0c.46.2025.05.26.02.14.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 02:14:06 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4e282b9a2b9so1502328137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3qJH0VNUeqbNXTyhZqhd3TUCe1hrja7PG92mWJSFf8IkQ4/0Qx1RiuIkT3Sw2SBeKCOHZuBSQPoQ=@lists.freedesktop.org
X-Received: by 2002:a67:e446:0:b0:4e4:3c3a:f163 with SMTP id
 ada2fe7eead31-4e43c3af25bmr2968298137.7.1748250846395; Mon, 26 May 2025
 02:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 11:13:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
X-Gm-Features: AX0GCFs0iTAPJyn3o_dQ93Zo1B5zmQvHXVBeKOyo9bKkSBZ5LaEVKWOqRf2Nfi4
Message-ID: <CAMuHMdVMDd2abFFzMY_Rbm=7pnX5C2qHBsa68tF_c=bRnp3zkg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi Tommaso,

On Mon, 26 May 2025 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> After adv7511_mode_set() was merged into .atomic_enable(), only the
> native resolution is working when using modetest.
>
> This is caused by incorrect timings: adv7511_mode_set() must not be
> merged into .atomic_enable().
>
> Move adv7511_mode_set() back to the .mode_set() callback in
> drm_bridge_funcs to restore correct behavior.

Thanks for your patch!

> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")

I can't find that commit? I guess you mean:
Fixes: ae01d3183d2763ed ("drm/bridge: adv7511: switch to the HDMI
connector helpers")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
