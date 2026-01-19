Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3503D3AFBD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21310E4AE;
	Mon, 19 Jan 2026 15:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26EA10E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:56:29 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-5ec8781f5c9so1988592137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768838188; x=1769442988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIG0R7dTQh7juPXtId/WkTt26c5+hMUHXl8ZjoaDDHE=;
 b=E53blZU1iRsfGBuSNQT7VegHuNP0K9zTz8a5Tmw2F0DXV4VVEOcd44eabglJ1Ol9YU
 Tn1+V3djtY4ATgy6XdkgiFKlnILDU5aV9LD0dAKh5dOzgUWRGlKJ0FHir/jkTWJIDGHl
 5Zuzyt0mosa4en5sb71EQKFalmGZuomRMENcwXwTZT8TBjkewC5DP/lhwKSRCzm+dcxZ
 V7k5Tnz01HDGGW2wWShHsSRwX9w7TLhCUhq+4UzyxkdqxVe1tTMNaH+hwbDT1nvQnoCo
 X5cMMGLd5XWtzWl+q3DaJ/GPy+vxCy/dtSVfI8upkcGsDcZlXni6qRbILYzOBFADoaj1
 knLw==
X-Gm-Message-State: AOJu0YwwV0+N3BBufd/q5Csq0HMoNVEGVCXh9lGBkPVaftqfIfZeLo8s
 3lxZdUsyXx3iwLq7W7BkOcNc2FfrB440GxPYC/xpveokC5fKDp90pXRTYpm6wWdk
X-Gm-Gg: AY/fxX6H3CSoi+EyKAN5dmJmkMkqk7NV3BI5cq8noB49fCbRWFHNeykv0U0JMcIqcVl
 DfNgH2W4bSKAvQZDHNg7O+KuPTl8KkvHNDpAJGwH2u2tu4NpY2kymCDXKnDTkVVIDWoiGYx345E
 bwQN6jJ5FVJgdxdeWEudgbfC1ouXcggfkTTmjOX5T7BTorTHpvyg0fcdlhdPtRHtQjOtfN583Kx
 vu8CuD+B3PTfGsbym0flUM1llZE7buJQQRldctNlZPiLCmH6pi1x8bt8ktsG20NFBcDpV2mx2Pm
 nxdKa3Vbz461yuD+86ho19Xqhsw2K1J8PQSv9Beu1andbIshlRbOjU0+emPmCuMYZjG+PR6OA1C
 Zce28v/Oa9u/OGyIQfmeRzxfc3zK7yrRcmNjyzJ9aVE5ObRafWM1jRLDD366Dl5/ejtPPuvt5HZ
 WrpOtd6l8rEna9ftJFGgpXMLGCoqE5vB6UEZAXxeNFFwK8Y91q
X-Received: by 2002:a05:6102:40ca:10b0:5ef:a1ec:fbb0 with SMTP id
 ada2fe7eead31-5f1a5570d39mr3268108137.30.1768838188373; 
 Mon, 19 Jan 2026 07:56:28 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-947d0458fc0sm3384655241.15.2026.01.19.07.56.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 07:56:26 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-93f69720a7cso2890969241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:56:25 -0800 (PST)
X-Received: by 2002:a05:6102:d92:b0:5ee:a04c:7ea8 with SMTP id
 ada2fe7eead31-5f1a4dbb696mr4034214137.11.1768838185442; Mon, 19 Jan 2026
 07:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:56:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
X-Gm-Features: AZwV_Qi7XL9IrXJqTbj9Y3MASXIhOVDU833eXHPX6YIuUQHpjkdHjq-l7kFo-k4
Message-ID: <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Marek,

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
>
> While the panel is described as DPI panel, it is part of a larger unit
> in non-removable metal casing, so the actual internal configuration is
> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
> It is likely that internally, this panel is an LVDS panel, connected to
> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
>         .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>  };
>
> +static const struct drm_display_mode waveshare_133inch_mode = {
> +       .clock = 148500,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 88,
> +       .hsync_end = 1920 + 88 + 44,
> +       .htotal = 1920 + 88 + 44 + 148,
> +       .vdisplay = 1080,
> +       .vsync_start = 1080 + 4,
> +       .vsync_end = 1080 + 4 + 5,
> +       .vtotal = 1080 + 4 + 5 + 36,
> +       .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};

That looks like the plain standard 60Hz Full HD mode.
Is there really no other copy of that structure available in the kernel?

auo_t215hvn01_mode is almost the same, except for .clock and .flags.
drivers/video/fbdev/core/modedb.c has the same mode, but in a different
structure.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
