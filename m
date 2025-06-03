Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA10ACC0E7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2649010E6DB;
	Tue,  3 Jun 2025 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A370510E6C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:11:25 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c5b2472969so462329385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934684; x=1749539484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLb8HhO98/51A3Sg1akRHkfjqC4wsBeHTx0qur+bJ6w=;
 b=uyoNa5hdjzAY24LT18nID5nyGdWAkgRD17Zb8jqob5JroTI0AXwpTgQZ7bpXzSu4Wy
 DD9ysrCeDgM3zDirLOosHG07TrKPbbrxaut9Ch6w0+SyOgjMWGMH199lrRm3Kmk/Whtj
 seqK2Iy6mbkIv3cb0Lm+yLsfMZHRetMRyEvgRpFtIIStsZgCNSr40Xm9T9o5KEGjs3V4
 EhBEbi338O9wlcpCV1GzDBpGS9feulwiNSqsy8ydk33ZSww8XT+c3mLDhZcC5NfUQ0Tx
 0aVKldqTzjlFZNWFCWyZQhZoC8WmK/iankoxYTixq+wD3EXBqzwpVIK2P3351A+L9yFK
 nzaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvNpGI7UDqwINtuOXzW1+bBzLqjyNHiCGtadJbGYMU0eUxc/73f8CM0eRoKxlzVwYxZMr8JLZbt64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx84PPod51udMfqsG2lbwFpN07ypnBvtGO/70ahkYVBVZMq2sE
 K9uOh0dy9+c2tqA5GVQdLd6aZ3Z+DlnVJKw8VKv77L6EG33j0yKVBUDmAtT/aeLN
X-Gm-Gg: ASbGncs3HhMlEfNOnZLhgF3Jt0yy1z8Z3w6c4j41QcUpMWf3tjRKw53AX02bwiPnD6N
 o4mQZswDqs7w/uHGi8i/QQNzaUZv22WrJkhwaBUAk8ocmADX3QQU6iWXWGDtVzurNv1tHJUk9bo
 b/E16Gt1g7w1myEX39cRbrCQm+R+vgrN6Y3MsT2oyl1zt0eL8QHBO8lEN0ZPZk9fBeru8t7wTa5
 W1e847jF8i9NIu7OkV3Sp2w6vCQ0gs3pmTeKohrlnzCOB1YH8W+JRQD/tuYC4r4oGyKKta6cn8a
 /vWzYqjaJrhRm30tCQxVcGmdxU5vBSLilEAJFLKL1T0beB0hbH3/O1k6voBHQkVn8QoBtGt3s7K
 HlJH3E69Uaszp7EG4NA==
X-Google-Smtp-Source: AGHT+IHkCUacEW9yE3CZ7PGFV+cURQS5mVOEPX6PoBcAYpcwZxYvXLbV4Ph/cXUBMHZNSHwsHiP0vA==
X-Received: by 2002:a05:620a:2814:b0:7d0:a1ce:1ec7 with SMTP id
 af79cd13be357-7d0a201696bmr2642850785a.36.1748934683925; 
 Tue, 03 Jun 2025 00:11:23 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a0e54c7sm812287385a.2.2025.06.03.00.11.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 00:11:23 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7cf749ef9b1so481613185a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+rAqSYJhj1JpxeV/4sorMT/KqwqGnLMcZaX8nBhNQNFMJ4sBz//MV4N3rlR7udNowSzRTTQ/rtkI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3751:b0:4dd:b192:960f with SMTP id
 ada2fe7eead31-4e6e410d39amr14204348137.13.1748934671280; Tue, 03 Jun 2025
 00:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jun 2025 09:10:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
X-Gm-Features: AX0GCFtcVOHqZD8BcFzZWMq6QGLbY93W1tbb2YLDvTYE6IWQhmuycmj54r1gmT0
Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
Subject: Re: [PATCH v2 01/46] panel/orisetech-otm8009a: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

Hi Anusha,

On Fri, 30 May 2025 at 20:28, Anusha Srivatsa <asrivats@redhat.com> wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks for your patch!

I have a generic comment that applies to all patches in the series.

> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>         struct otm8009a *ctx;
>         int ret;
>
> -       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);

The old code used sizeof(*ctx) instead of an explicit type, for
increased type-safety.

> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx = devm_drm_panel_alloc(dev, struct otm8009a, panel,

Can't you use __typeof(*ctx) instead of the explicit type here, too?

> +                                  &otm8009a_drm_funcs,
> +                                  DRM_MODE_CONNECTOR_DSI);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ctx->reset_gpio)) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
