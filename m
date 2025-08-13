Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C0B24216
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0ED10E1C6;
	Wed, 13 Aug 2025 07:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5241810E1C6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:00:02 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4fec0d6fd90so2214006137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755068401; x=1755673201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kHnvCAVwfQ4q/T0cjVxNPyYyL60fB4Xq07rENVSySo=;
 b=iYmSECsDPnMVqs9ZhZbqWR44qZ/sb+Y84NXNDWCQgPesEAjeJjzwkKHHV2yzGMpSbT
 4i6RNQ6IoDyMSAEzpcnvAD3cNDxKgyyQjI/uTJbZE+oyYG9vaKyCl1G340vf2H/RQ9Bh
 bz3CqGCztGzqnjJY621Jn2ajcaKvV8mYWFoGGDl+5I/7+oVXrOO/RXfyo0RkDAs8pHmr
 P6fI7q+MMrkuPX0m4hkytmf+VFAqj5Hx75b1DrZ7SyQC6lsGlBGxUwZDx5PZUq5HCDe2
 PGC2mAvUQnIg7d+1uolNPs6zNHhKggKUWGp4eT5ENvX5Z9xET7HrLtz0dQC0jzlmUbaZ
 V4/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzo0Dr+YXQ4hxSALyVqUwB6dl9MlFnBLg3897j9SOiXNAAJ/yBG9xJSiuPypjHRstmfl/OeoKe0Wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk59bT8yGDOdSh2kdHLHYprqpjUiRE7XLUuIwy1XFubJcrJdib
 UNBVKdUYxfAJKQv1Qd2SwRlg8lZYvTxVFT5f3HIj5+gnjQOwXdAcrlgn9kLalAZu
X-Gm-Gg: ASbGnctZQfVeORbaDjM5PU13LWzqgfIZpRJxDAgj32Io7Z6dZZFcf6t6M8ZcFjZYiII
 ryIe/dzb8VU8tXKwws1+sYL4nqdvlDKd8JcsnGdBBkVjbisS6L+utTvpq9FQDZeN75edYUUUuaY
 PSNHSiijX1hPoqUXBrcJx32gxGLYus+wbBopbii7Z4WRBlQ/JRSr362oy7LMnizEqkQmBOPadpE
 nn1InKkPxVYiehiuZn0Vyt7CWsT7tYaGlVGJbv2ZwJDCzFIS6UAAGCB9L4p9/mxa8tctvyQTT0X
 Ub7fcDO3bQuJMba/0rcMRaxBo9cIVaJdMyTil9ES/SNZsoqJKbZ9o5PMh18ymFnfgSR+ZezJRQt
 58W2ymTIor7v0lYPUQehM6t8d/26fqsWK3pXiWXCNeOMpBme/FCtMjjc1EQN0jzmSQaB2Cm4=
X-Google-Smtp-Source: AGHT+IEQcKV/IVHULBjQtB97etIacZH5NxjzOFmurxTbzZdHQtq8h/TV/2am1U785J7wZZKkMHLToA==
X-Received: by 2002:a05:6102:b09:b0:4e9:b0ec:9682 with SMTP id
 ada2fe7eead31-50e513aeb72mr704295137.24.1755068400755; 
 Wed, 13 Aug 2025 00:00:00 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53ae13ec4aesm2131255e0c.4.2025.08.12.23.59.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 23:59:59 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4fc18de8e1bso2112484137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 23:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyp9vRkKfifl7Ro/uFU1G6UAXXhsUq/TjuafAGJKc58kIXNBnHwYxkuyUtc02/kTqVehrbX0qiTm8=@lists.freedesktop.org
X-Received: by 2002:a05:6102:e0e:b0:4e7:bf03:cd79 with SMTP id
 ada2fe7eead31-50e4e5d2141mr640353137.5.1755068399534; Tue, 12 Aug 2025
 23:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
 <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
 <20250812200526.GA12797@pendragon.ideasonboard.com>
In-Reply-To: <20250812200526.GA12797@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Aug 2025 08:59:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQxEpxgpedHHZguncCjaapLo9t9+OQN0o8CVe774PQnw@mail.gmail.com>
X-Gm-Features: Ac12FXzYHD6o7Zu0xKI2LGENopDTqNbsO1HrRxXM3S-o6SplmdapAJBtZ0w8rDA
Message-ID: <CAMuHMdVQxEpxgpedHHZguncCjaapLo9t9+OQN0o8CVe774PQnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT() macro
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
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

On Tue, 12 Aug 2025 at 22:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Aug 12, 2025 at 09:32:36PM +0200, Marek Vasut wrote:
> > On 8/12/25 3:26 PM, Tomi Valkeinen wrote:
> > >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > >> index a6b276f1d6ee..b3e57217ae63 100644
> > >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >
> > [...]
> >
> > >> @@ -51,11 +51,11 @@
> > >>
> > >>   #define TXVMVPRMSET0R                    0x1d0
> > >>   #define TXVMVPRMSET0R_HSPOL_HIG          (0 << 17)
> > >> -#define TXVMVPRMSET0R_HSPOL_LOW           (1 << 17)
> > >> +#define TXVMVPRMSET0R_HSPOL_LOW           BIT(17)
> > >
> > > I'm not sure about this (and below). We have two defines for the HSPOL,
> > > high and low. If one of them is (x << y), shouldn't the other one be of
> > > that style too?
> >
> > It is inconsistent, but one macro describes bit set to 0 and the other
> > bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I
> > would be tempted to remove the bits set to 0, that's probably the real
> > discussion that should happen here. But that would also be a much bigger
> > patch. What do you think ?
>
> For what it's worth, for single-bit register fields, I usually define a
> single macro. I understand it's usually a coding style preference.

An alternative would be to define 3 macros:

    #define TXVMVPRMSET0R_HSPOL        BIT(17)
    #define TXVMVPRMSET0R_HSPOL_HIG    0
    #define TXVMVPRMSET0R_HSPOL_LOW    1

and use FIELD_PREP(TXVMVPRMSET0R_HSPOL, TXVMVPRMSET0R_HSPOL_{HIG,LOW}).
But I agree a single definition is fine for a single-bit register field.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
