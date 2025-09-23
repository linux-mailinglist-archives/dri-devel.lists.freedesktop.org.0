Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D8B949BF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCCE10E0E3;
	Tue, 23 Sep 2025 06:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92010E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:47:17 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-54a9482f832so2072001e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758610036; x=1759214836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrqmRbHxqTgRekvhDXdBEX/h9tK7W2RIqWha/LWNLSo=;
 b=baAaGDOamOYcjsRSKdwh536RArJzp6Ib02drh6/iIR//Bih2r1euw8l9oZcCPlGGI2
 olE9Eug95bfmFQM+1hnVMkl92qBHmqFGpHbakIdHlH9iATHAl7hpFwVB0rN43gjXTeOX
 QkjgZny8URMkbIG29RTmpCnJ4hBzgQzhCVdR+4JoO9x2RSO2yD1VuYg3/5nZ9ZVOtYv2
 m17Oyx+TPL3sYzlF6hg/oz5s593XdvQ2M5uNUPcwpQ0ZSaJOJyXkVNC2Y3oQDhWkutTB
 7L3ULD7Abs9mdDU23GmBOlu3xe3DwTCSWPU2NsfIfrqp3R2LPQyhOiUdprjdvpbIjLki
 JnWg==
X-Gm-Message-State: AOJu0YzOdPAWRTwbkBtmIG2DSfM2B1HzHpHwqBivOYuH+LIMLwflu7+f
 Scb1ugWqAOOqO3raNfFvyke+VBZRIMnAyJrGQ1eVuJT9AniJ8Awq8/fhEEUsIyVK
X-Gm-Gg: ASbGncuyRk30fhSV9PGkbxb7/Kp9lMz+JG2WhV+FutppMTkHmHHwX/S5WQD7cdOtrD/
 vEmDdoRBRDdcVHSDEQCViLPQUEaNd6QiwNfm9N7ynC20NwlTOfW9uilf+dSKiXgY+E76ItdxiLw
 1FMTyd1KbMPZfPl/IgNuDUFKNL5nnRHc1potxozg8pPhwNy1kXYKTTPzPa+SbMBrDVr5GtyW0Yq
 oCc0Yuaz9dJt8bJaIpW6pIjtFNrjgFg1wbtdJtOxA2ExXOQIqLpWjhOnlK/aESWvYk/5Kh0euHv
 sVXoRGWiTqy59djQMPt7kKyZqqsYZvlTnw3ol+hE5ULa8ctiViIHVAgEvcGTOSMEf+m5gRkLWPc
 VLXpVBdX0B7ynNkmshzY9O97X0aUN0tH8skwDVa8eC66AiAlS0g+yFvvqjOMLai5K
X-Google-Smtp-Source: AGHT+IGiI9nMK5h/h9+i9wjDBkIe+W/0qX21jn72MQiy90Th0ByMfIY/IzJMvwQIlA47yXK7Y0ldHQ==
X-Received: by 2002:a05:6122:2094:b0:531:236f:1283 with SMTP id
 71dfb90a1353d-54bcb1d6f9fmr495752e0c.10.1758610036080; 
 Mon, 22 Sep 2025 23:47:16 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-54bcaeec81asm347094e0c.22.2025.09.22.23.47.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 23:47:14 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-54a9482f832so2071972e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:47:14 -0700 (PDT)
X-Received: by 2002:a05:6122:3122:b0:544:9313:8387 with SMTP id
 71dfb90a1353d-54bcb245adamr531248e0c.15.1758610034331; Mon, 22 Sep 2025
 23:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 08:47:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
X-Gm-Features: AS18NWBbqJdzROVb-R_5LsREkzO-QMxyulkUW7pFQYzo2rYa7Cd6WwBB1tWZSMs
Message-ID: <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate
 mipi_dsi_pixel_format_to_bpp() usage
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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

On Mon, 22 Sept 2025 at 20:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Call mipi_dsi_pixel_format_to_bpp() once in rcar_mipi_dsi_set_display_timing()
> and store the value into a variable. This slightly simplifies the code.
>
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -449,6 +449,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>                                              const struct drm_display_mode *mode)
>  {
> +       const int dsibpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>         u32 setr;
>         u32 vprmset0r;
>         u32 vprmset1r;
> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>         u32 vprmset4r;
>
>         /* Configuration for Pixel Stream and Packet Header */
> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> +       if (dsibpp == 24)
>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> +       else if (dsibpp == 18)
>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> +       else if (dsibpp == 16)

What about using the switch() statement instead?

>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
>         else {
>                 dev_warn(dsi->dev, "unsupported format");

The current code even has a default case ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
