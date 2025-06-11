Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA5AD50BC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE8C10E5FE;
	Wed, 11 Jun 2025 10:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A97A10E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:00:39 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4e58d28ebb0so2284316137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 03:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749636038; x=1750240838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVNUt1zXJa9mOFl6PLZWhV0CAuJbuq8CgZxL2ha14hg=;
 b=ouCqSZoo2VvYdjoCK4BsN7voK+5YvjfPMR8uYf6MTMOSGOAWn8k26PG3Po5261VRVA
 rIDmmVYiRPaUyeIe2GvZWQHhl51CeMCbZULC/mtnCiPZwg6HIMylFe3gZ5OpDp9oEYLj
 iDNH5mqBwjvX/Rha2FMb2k7M2CifxX0IX3cMpwZM7UNLXYFLnWvXzmjvQG9byobVX2c2
 slhxjcfxmnpeWmviWl1MOMm5Axn3DC83UGPZRvPIlPFNLgaHzJ2CMQ39Wc2qi9sBdT8x
 9fO9oX6XCKVsC/g9QH/nbb9/MbmGuxbS5YaOgQCisEUPL3fdhx4Vs7ZXFIJTljWWgDD2
 SnsQ==
X-Gm-Message-State: AOJu0YxuKF1YgwqkgSQvc7msK7zHiyGW/W21yo+IEsxmJBQpDxC+CG0q
 rejcziDF5nVkwzrcWyb1vLW5BaeWJcVYnJDTuY0MFrGNKIDa8JhUSaRE56NU9mYh
X-Gm-Gg: ASbGnctyqLVvG6+iXO2RBEJbkQbC1Lod1miS4zf8fUo5Y6fgCh5TutdqQt2Y2Flp1P6
 AdPRqSAqEIVwHF15Tct2e2rKs0wSHCy+nG5j2pmAFMylk8KlQNt+cipdExcIL0GIasiqmZ4yOMF
 HTcmcECaPTNXaZTXIXVQ+C4oe8UzVT2LNbBgfkDf0517O22QCH+MH/zXUH3XFYYXRZM/Tvy14J+
 r6ULH4lOIO8o3/mZJl4XAzHn3GPbC8ewjNNbQG/k72bEVsXCdYZwKAV0SioajsibXzpqoKxKRUo
 NjcppPuEL1caimoosmoICKYAif4hJJEkYZRaVywi1LLhoMkBR8zzMWZ56EGls+x3vDY7ZptFx3E
 iBZKnGJ8Rzu5jFYU9SPcDFcWQ
X-Google-Smtp-Source: AGHT+IHKre62FDkBAT6wCHnpAnULgC25aK41yJaWAb03XCI4Kr0Vr+uRJR2CEF5w+uNrRJV8qd+CRg==
X-Received: by 2002:a05:6102:149a:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-4e7bbaf56c4mr1956226137.13.1749636037799; 
 Wed, 11 Jun 2025 03:00:37 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-531244a1968sm486803e0c.5.2025.06.11.03.00.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:00:36 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4e58d28ebb0so2284307137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 03:00:36 -0700 (PDT)
X-Received: by 2002:a05:6102:4406:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e7bba2aa59mr1703833137.9.1749636036730; Wed, 11 Jun 2025
 03:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
 <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jun 2025 12:00:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3zezC8X3Z1vSd2PuauaafQ1-3DdFueRu1UgYGy13Y=A@mail.gmail.com>
X-Gm-Features: AX0GCFtdl7eJYuvMUpMJQIJMqzcl4oDAUWuBYo46PLBnsCr9DCEg3l2ekpjPOiM
Message-ID: <CAMuHMdU3zezC8X3Z1vSd2PuauaafQ1-3DdFueRu1UgYGy13Y=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: ilitek-ili9881c: Allow configuration of
 the number of lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Sun, 8 Jun 2025 at 23:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Not all panels use all 4 data lanes, so allow configuration based
> on the compatible string.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,6 +43,7 @@ struct ili9881c_desc {
>         const struct drm_display_mode *mode;
>         const unsigned long mode_flags;
>         u8 default_address_mode;
> +       unsigned int lanes;

You may want to use u8 instead, so this fits into the existing hole
on 32-bit systems.

>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
