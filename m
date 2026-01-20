Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC60D3C3D2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C4F10E3DC;
	Tue, 20 Jan 2026 09:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5AA10E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:39:56 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso46893765ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768901996; x=1769506796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7d344nbbjcVllE1LooRYmu0N/T5hZ1c4qAtbT77fyso=;
 b=JvWifaNDeRv8fltf10VTmZAsZ9aMGMOgv7CIvhHfV38bHeZccMv4H3b7kHcx01yHbW
 rkm7tz8v/KmuHJLcrWARSrKn5RIGZ+GQ+vvL1L/zvi6SpFi1SpbEBHuCD4aIjDoV/iSx
 RlnHpdyFN2z4GfsRO7YSrzWY68xZealSZ1xU3K6gq2ZMMZ5298G0OvQ9x2BTW8shJi20
 zC/9+cQFBzevKLiYcfFdO1K82qZeH76BwtyPiKjXYmQXS44TsQtRyDcq+2hpqzS9Lv/i
 hBrT0/m8kZ8YAS68Ubvvqw7N4FIbUkgBQ+/K3JwJruWqpjbih28RNpizZ00/OFqRfFur
 zcXg==
X-Gm-Message-State: AOJu0Yy7pwuM/o7+fvbsW7o1P94Rh+1XroGVqp7gUJ1Ammn0MZfoWzc8
 l5K7BM0HdUpin9mciJGW2RNodKyt4d7VVF/TZsVy9RG1wZhvJZZhBty91pu+kr95
X-Gm-Gg: AZuq6aLxyJOAtObW7Pc264bQ4HZAhMPfmoMXfPHkjaj/vDQnwXMNgFK/8ax6AT0hqpf
 z9T30hDxUVYXYHAokd0ScWMUVtMmWMdixJvqZf+rvWOoGUchvw06REbcVh7yNUtV8E1PP0Yne1x
 oKBFe9/iFWm2fBK2btD56NH4o89vP/MQtnpyysbSnc+KnLUYS/Cc1vg4kJ4E9Wd9I0VzYhmuAV5
 PrWmbbgUuzCtUKE4PczmiqPyfNShr/4w1xx7Uf5mewwaP7GoukVYRdgsyR9feeOWsfVc4NmMBbO
 VTn77W7yLbp7OXtPHrzIC8EAMaA5v4TQU+qRPcaZ0T2tqqM3sj+M2oE4JBZ+Gq3lUjUk17fL626
 E+EKy8mK36t/8Hchf/OjHT3jsOz6OFIzIRVsUnVasdndOiDKUmPqFYfR+etdn+8/MqBvkFlzI8c
 CwfpwlAzzbLwfdKOBxCai8N/8YNj7GgQgOtXh0W7bD1Pe+vsLXEE+5
X-Received: by 2002:a17:902:e884:b0:2a7:561e:690b with SMTP id
 d9443c01a7336-2a7561e6e9fmr19372595ad.58.1768901995674; 
 Tue, 20 Jan 2026 01:39:55 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com.
 [209.85.210.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190c9edesm117011785ad.23.2026.01.20.01.39.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 01:39:55 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-81f478e5283so4530960b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:39:55 -0800 (PST)
X-Received: by 2002:a05:6102:950:b0:5f1:6f24:8554 with SMTP id
 ada2fe7eead31-5f1a55b22b0mr3577104137.37.1768901605464; Tue, 20 Jan 2026
 01:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
 <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
In-Reply-To: <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:33:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
X-Gm-Features: AZwV_Qg8oZhrOf1YB9AYEwTae8IfInWKLstAC0xoyl8s8vNgo8HaAia8hPuamek
Message-ID: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Marek Vasut <marek.vasut@mailbox.org>
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

On Mon, 19 Jan 2026 at 20:08, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/19/26 4:56 PM, Geert Uytterhoeven wrote:
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
> >>          .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> >>   };
> >>
> >> +static const struct drm_display_mode waveshare_133inch_mode = {
> >> +       .clock = 148500,
> >> +       .hdisplay = 1920,
> >> +       .hsync_start = 1920 + 88,
> >> +       .hsync_end = 1920 + 88 + 44,
> >> +       .htotal = 1920 + 88 + 44 + 148,
> >> +       .vdisplay = 1080,
> >> +       .vsync_start = 1080 + 4,
> >> +       .vsync_end = 1080 + 4 + 5,
> >> +       .vtotal = 1080 + 4 + 5 + 36,
> >> +       .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> >> +};
> >
> > That looks like the plain standard 60Hz Full HD mode.
> > Is there really no other copy of that structure available in the kernel?
> >
> > auo_t215hvn01_mode is almost the same, except for .clock and .flags.
> > drivers/video/fbdev/core/modedb.c has the same mode, but in a different
> > structure.
>
> The panel-simple.c is full of similar-ish panel timings . The timings
> above are adapted from the waveshare DTO for this panel. What else would
> you suggest I do/use for this device ?

I am just wondering if there is a better way for panels that use
standard timings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
