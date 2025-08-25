Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E88B34D58
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6410E577;
	Mon, 25 Aug 2025 21:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Bz3lMLUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866FC10E574;
 Mon, 25 Aug 2025 21:02:22 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id B8CB0BDC89;
 Tue, 26 Aug 2025 00:02:20 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id DCF94BDC08;
 Tue, 26 Aug 2025 00:02:19 +0300 (EEST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 6DF552066DE;
 Tue, 26 Aug 2025 00:02:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756155739;
 bh=W0T4c7wIznaXFr65JiL2TAkOouKcXe26zlH/IosZRlc=;
 h=Received:From:Subject:To;
 b=Bz3lMLUnqt+cnRbUZ+61T1RRyN/4eQWXleOftvZvYuhoq+OzasPIsox5MLIkGJAjQ
 VK6SE2o9CPt1+kuqA5eXep2/dgwCwE6gENQmFHI9qvMa/d9JoO51O1R8e5KVVjCZJ4
 DYUghCjK3Wx/A+vCJ+AkaFdvIWm+QW8h08L/5ydXIOcuUuIERhxtT2MzqiaQTJIRyB
 X0cyf/lxY5oi2Z6iUvJAnUOcDOUQKi8O8KSRk4sC1/ezdb3QUNp7IBtLe2Wtq6vEwR
 /HJHRjT7d4Dz6xJsWjeQ1WjrVH4w5y9iOHGvq3OdYX9U61mXE7Qn+RsSWY6KbuBICx
 x1Mfr+dUqVxaw==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-333f7ebc44dso48046821fa.0;
 Mon, 25 Aug 2025 14:02:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWz0PhMmaLgCdNpMLsYt4UcH4NaOXjfhEVz2ZDEuCBito3JJg4I61SyVnKSGwIgTE2GBVX/gqIngBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGLPoyx29w2YzfJDJk4PGatwLMefR/Z9KRWsqJs+AopqVOjBZQ
 XygZ67SqziuwcFdxdEqCAIxw9DSt8InaA37v7k1cZwLqDVz/ocCVzZJ2WcgAuywPGl5ffs44atL
 2kJEjiFnrfW4kEg0coSPM7WvvhbkxEWw=
X-Google-Smtp-Source: AGHT+IGAIFX+PrXtfL6Ko9yXggy6VtoQWqQWALKlpgU6/rjpp88x2VKFAiY5L8puK4F28TxM+ZaoasYW/0Nckeghy4Q=
X-Received: by 2002:a2e:b54e:0:b0:335:2d26:1408 with SMTP id
 38308e7fff4ca-336857c6469mr2002221fa.21.1756155738919; Mon, 25 Aug 2025
 14:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-6-lkml@antheas.dev>
 <f1ba9808-64a5-4d64-a4ef-b2a95cebae94@amd.com>
In-Reply-To: <f1ba9808-64a5-4d64-a4ef-b2a95cebae94@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 25 Aug 2025 23:02:06 +0200
X-Gmail-Original-Message-ID: <CAGwozwEGdcyFnOADrCTb2cUDvq8H0kxtA+KRb_Kz5De1eFXztQ@mail.gmail.com>
X-Gm-Features: Ac12FXygWR7T4ywts3rdl4fy2UMP-foC85evJaRePzdbfPmGm8w1BIpkhTtTtX0
Message-ID: <CAGwozwEGdcyFnOADrCTb2cUDvq8H0kxtA+KRb_Kz5De1eFXztQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm: panel-backlight-quirks: Add Steam Decks
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, philm@manjaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <175615573962.2875691.6911107963172446849@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On Mon, 25 Aug 2025 at 18:47, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
> > On the SteamOS kernel, Valve universally makes minimum brightness 0
> > for all devices. SteamOS is (was?) meant for the Steam Deck, so
> > enabling it universally is reasonable. However, it causes issues in
> > certain devices. Therefore, introduce it just for the Steam Deck here.
> >
> > SteamOS kernel does not have a public mirror, but this replaces commit
> > 806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
> > in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
> > See unofficial mirror reconstructed from sources below.
> >
> > Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
>
> Directionally I agree with this commit in favor of what the downstream
> kernel tree has that you linked above.
>
> But I would rather see it sent alone and not tied to a series to
> overhaul how quirks work.  If it's sent alone we should be able to get
> it reviewed pretty easily and in drm-misc-fixes.

That's a good idea. However, this commit relies on patch 1 and 3, as
it has no edid information and uses a second match.

Antheas

> >   drivers/gpu/drm/drm_panel_backlight_quirks.c | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> > index 78c430b07d6a..5c24f4a86519 100644
> > --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> > @@ -73,7 +73,22 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
> >               .dmi_match_other.field = DMI_PRODUCT_NAME,
> >               .dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
> >               .quirk = { .brightness_mask = 3, },
> > -     }
> > +     },
> > +     /* Steam Deck models */
> > +     {
> > +             .dmi_match.field = DMI_SYS_VENDOR,
> > +             .dmi_match.value = "Valve",
> > +             .dmi_match_other.field = DMI_PRODUCT_NAME,
> > +             .dmi_match_other.value = "Jupiter",
> > +             .quirk = { .min_brightness = 1, },
> > +     },
> > +     {
> > +             .dmi_match.field = DMI_SYS_VENDOR,
> > +             .dmi_match.value = "Valve",
> > +             .dmi_match_other.field = DMI_PRODUCT_NAME,
> > +             .dmi_match_other.value = "Galileo",
> > +             .quirk = { .min_brightness = 1, },
> > +     },
> >   };
> >
> >   static bool drm_panel_min_backlight_quirk_matches(
>
>

