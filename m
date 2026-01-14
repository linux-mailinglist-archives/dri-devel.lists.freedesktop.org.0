Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2259D1FA40
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4007310E253;
	Wed, 14 Jan 2026 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B907210E253
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:12:37 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5efa4229bd2so3468398137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403557; x=1769008357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTf4Ia98cnNEFdpDb8exU9CBi6eG0s42SPNHJEcig2U=;
 b=ub4cGBvgLRL9209VyVxfEAN0jRq26GlRLTHIgVaxwGCQ6ofxjs+hxKkswYON5w9tiF
 1vifS971O2Aogw5g6uMl+BbdLKPCxx6HMNN9tSieN0iyu9WSUxeIzeqb3h0dGPnIPHEq
 AkltAaZVTUsHUOOwsDnS/4Pjx5AM8YrsPY+UPrurhHgqz9IMK8smy21WWf+wwxH9JqY+
 RdE70ZSqQqTQ03LE6G4BqYoWiuY2xzUZOGR0qh/pupAFecNOB/GvNHaKnKgpfzbA31B4
 OLdW0nAMz1ApIV6pl1avyM3xClzPzM1+s7zu6ldAxF8ZyFr9KdPjYJmEtmOCMsTa+lId
 WWtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4FYf0gYoWXAsQd7eBzF3yORlTRVb04XbtYrrSqVwrPMQhLFNIZ9cD266HJ2sMcdu4TU3u1FIwWF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfIYafTVJLKrjogahAzoEwhtZ2MC90WUQpB/Sy/ykL4K9DbeFN
 H1EvFhTvPyZs1z/RWYU/Kd0wkSfyh2xDFSpT0zThTJ3PyyQh/wBrFxn+TG8dQR+p
X-Gm-Gg: AY/fxX7NSLN5y2UYaQDAYcipoZvWwQv+Ka7mDbbEMpHhz20b+9cUOCaX3mZr7LWbzd+
 A43ljWeNxnRfhjwdTkEZotKGSoWg4Iutia1jlv6muOLRmh5W5wjI9ZhmIxmTY+SI1mK6Xb2+kdY
 oeMurDzXTJOZLgMI9GwZmZB6/0vN+BmRZT9X8MVJHB797WXvVzxyFh1l7Dr+mmqT/agUa1z7GjF
 x0PYECYCus9hMpEtM4Ybs4XGIhXsiKUV3c4NwxUqnR7KGjAv0OpDBjOJjlphzsIQaNcKbrkBBfb
 g/Yj9fKFGpmeEt9PfZx9zwE8z12biZmN8HBHHpaubhLomQ2IQEeoLyX0mEGzlIXTuVmotWo2OZt
 HHgx5y+09M6EWo/T+14ipEvlPdE8tN7Xb7hBsPsx4zSMY3cbZka4snTkbufOpKSgMhlVWEdLfgb
 0X7NO8h+bJsv6nDfMNU8ukhjyej5Q5iln6okzpO5K6SlxOGehb
X-Received: by 2002:a05:6102:dc8:b0:5ef:a2d0:a099 with SMTP id
 ada2fe7eead31-5f17f4041a9mr1209926137.1.1768403556400; 
 Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ef15be79c6sm16486333137.12.2026.01.14.07.12.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-5eeff7e8bb3so4079033137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXoET/zE2YvF+zbF65FMXLeL05DQVhx6HCfDkU0MIGtTHMdQhAn/YC1IsGgVjFb1ZU2vuXn833Jb80=@lists.freedesktop.org
X-Received: by 2002:a05:6102:644d:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-5f17f58e48cmr1339389137.27.1768403555913; Wed, 14 Jan 2026
 07:12:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:12:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
X-Gm-Features: AZwV_QgBsmdOL1CsIZxC91XqWUZahJaPBp6OhsrHXMfNCw9hk5svX0lNu6KcuTU
Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] arm64: dts: renesas: r9a09g047: Add fcpvd0 node
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

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add fcpvd0 node to RZ/G3E SoC DTSI.
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
