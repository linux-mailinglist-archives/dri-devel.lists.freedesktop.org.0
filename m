Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17663C19D51
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95B10E791;
	Wed, 29 Oct 2025 10:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1B10E791
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 10:46:32 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-59a8c1eb90cso4203736137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761734791; x=1762339591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eA6u7QQ5nlSe+lHdfS7BYGXAj5XGFi12G5/HOmEAPE=;
 b=YZQqX4QZiz/3stttn8HFnzsbifc+AKPynQ47TLpHzGb/KU4pd8LLI/wq4Nlc9c6Vzb
 yM4ip8P4iDLfKMzZpVcBC0dk+lQUqALvegsLmoskM4qftaWzGe3ZtLOAVySiIdKciXxn
 iNZfwF+G358TXIyzrBcxbmp775hhRm87O3hbShZaI0bdZ046z6b6iwmmHDZehxjqxM81
 EWkZZyUmSdK8tr9GmH7UNfer79dCGQ5UWHR9CEebZ9QqgoDIS6uMqfd5gqFYg+1mxlUU
 SVwWQiHMGjA9YaQAy5gXxun6bc9QZ24lfDCliHV/FQZFcDf4IL4A5bPe8oB1P6VqoKaG
 mPbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUuCqZFUUKYtQi70tNvuP3oWAhq3yFkUWftKHagLh8PzPs/Oengk06n9SZIEVzH1ueozax9MczsLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi4yxLKDBtgYdWJzBZ0CU4JdHRPn0NOvLpwNI8vthOlsmfTUmF
 dQAR49XuMcIthkTFWLlHU/7w77LS5jlhUTsRnmCV1ZVfcjGSklGF2baeAQSZBEer
X-Gm-Gg: ASbGncs9Rtt88DncQy6KLDrSSJe2pNlbkHWnfsY72qLV8t3MytSAxCp7lOe/hXoM45S
 whUcK/e1seVWP/cGcMNZ95EIR4IRAun5/dW1s2W3xsvw5oxWeM3euXINCUlX/gRk4j23I0fLrGO
 3uuoIHmqqPG0swmUJu+4xLa9VBUf+v7oDNNZR/yZWyHkklJL8eh5SZe6I0pwtmk0VQ9kX2Eusl6
 gXrsK3piCTQyyK3YXQ+K+qWeIpq0LtCA32Lmc5sbVrcwezE1g5UHk0WDA6Ze7WJS6W4jjLZDvIn
 4DtGUBNW/RwN6Dth1Kyoihw2YOtnWhzEt5+fWnytfdFoW6A579F0NZk1DrN0AnXy46/v6LcjAWh
 77pXug02JqlmzKhZmY2Fwoet0X1xAsrwSgTfYaMCNEJGxSAs2PN0NOD78OoMAr8jUoeUl2tNQ3N
 8SQavpBGSkpTE1H/M1m5PymWeZpnZYo5GXDdVSrw==
X-Google-Smtp-Source: AGHT+IE05JMoDMeQAHOHyxbgPnkBvBwAXBYniowY2xAKWc6bETqECquss1m4E5hIsXcFr359eqCAAA==
X-Received: by 2002:a05:6102:c4d:b0:528:d2ad:1f4d with SMTP id
 ada2fe7eead31-5db906945cdmr708749137.34.1761734791327; 
 Wed, 29 Oct 2025 03:46:31 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-934c3f17bd8sm5217394241.5.2025.10.29.03.46.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 03:46:30 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-89018ea5625so2919685241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5yKsdB51Zm/wZwdFtV5USY4Q4OuW797XkUJv8PIfxJMfCdOy2Cl8k/bkOBNwA9LQO+mElsJWRR9E=@lists.freedesktop.org
X-Received: by 2002:a05:6102:54a1:b0:59e:68dd:4167 with SMTP id
 ada2fe7eead31-5db905b133amr578976137.7.1761734790615; Wed, 29 Oct 2025
 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
 <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
 <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
 <a8e2a977-0bf7-476c-9a45-da7f38954465@ideasonboard.com>
In-Reply-To: <a8e2a977-0bf7-476c-9a45-da7f38954465@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 11:46:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnEHrqzKADRq+xhpNK-JiYCBLS0N1P+B-+RBMR9tGa+Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmRNbYYozi5mZ22DqtUw0N0zNJPBRF0Npg62bLaxI5YiS6Pm-IVrlWp3_I
Message-ID: <CAMuHMdXnEHrqzKADRq+xhpNK-JiYCBLS0N1P+B-+RBMR9tGa+Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
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

Hi Tomi,

On Wed, 29 Oct 2025 at 11:37, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 29/10/2025 11:57, Geert Uytterhoeven wrote:
> > On Tue, 28 Oct 2025 at 18:15, Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> On 05/10/2025 06:02, Marek Vasut wrote:
> >>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> >>> @@ -246,14 +246,14 @@
> >>>
> >>>  #define VCLKSET                              0x100c
> >>>  #define VCLKSET_CKEN                 (1 << 16)
> >>> -#define VCLKSET_COLOR_RGB            (0 << 8)
> >>> -#define VCLKSET_COLOR_YCC            (1 << 8)
> >>> +#define VCLKSET_COLOR_YCC            (1 << 8) /* 0:RGB 1:YCbCr */
> >>>  #define VCLKSET_DIV_V3U(x)           (((x) & 0x3) << 4)
> >>>  #define VCLKSET_DIV_V4H(x)           (((x) & 0x7) << 4)
> >>> -#define VCLKSET_BPP_16                       (0 << 2)
> >>> -#define VCLKSET_BPP_18                       (1 << 2)
> >>> -#define VCLKSET_BPP_18L                      (2 << 2)
> >>> -#define VCLKSET_BPP_24                       (3 << 2)
> >>> +#define VCLKSET_BPP_MASK             (3 << 2)
> >>> +#define VCLKSET_BPP_16                       FIELD_PREP(VCLKSET_BPP_MASK, 0)
> >>> +#define VCLKSET_BPP_18                       FIELD_PREP(VCLKSET_BPP_MASK, 1)
> >>> +#define VCLKSET_BPP_18L                      FIELD_PREP(VCLKSET_BPP_MASK, 2)
> >>> +#define VCLKSET_BPP_24                       FIELD_PREP(VCLKSET_BPP_MASK, 3)
> >>>  #define VCLKSET_LANE(x)                      (((x) & 0x3) << 0)
> >> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> >> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> >> (3 << 2) is signed.
> >
> > Huh?
> >
> > Either you use the unshifted value "(define for) 3" with FIELD_PREP(),
> > or you use the shifted value "(define for) (3 << 2)" without FIELD_PREP()?
> Sure. My point was, VCLKSET_BPP_MASK is a signed value, but GENMASK()
> would produce an unsigned value. Normally FIELD_PREP() is used with
> GENMASK, i.e. with unsigned mask, but here FIELD_PREP is used with a
> signed mask. Does it matter? I don't know, most likely not.

IC. Yes, it is better to use GENMASK(3, 2) here.

Always use BIT() and GENMASK() for bit definitions.
Or the new BIT_U{8,16,32,64} and GENMASK_U{8,16,32,64,128} if you
want to be really explicit, or avoid compiler warnings when using
~mask later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
