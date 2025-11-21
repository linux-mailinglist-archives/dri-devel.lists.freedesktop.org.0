Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B2C780B9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 10:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8E10E7F9;
	Fri, 21 Nov 2025 09:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2071610E7F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:06:02 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8b2148ca40eso242501485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 01:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763715961; x=1764320761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsQ8cDkyT01+wOfENQ+tLoOAH/3N4WY8TL/xOv6Ppek=;
 b=B0YbTHHUZ5vbuegrch9EJtiCW8PKjYNjcmm3ssRhm6do3h3xMHhuTElYF4xaY8UaNn
 S1VakcyKpNdcp2uVnfHzwkQftJbPreP4YWUbanVLxunOf67VV0907++Y6uXEqC2Vivgw
 gibGODOLwTkGxNgMWg/UC9nlkI6t0IJ/4RMExn6N2oA19RK9NIZTzrnTVIDZDYP47jgc
 GsvzM4hscuLavlxAcjAuxyRYedv2XvipeiyS0ZvnG6ZzUktGl0XO7ADtL/yK7+E5HxSi
 zhV56LYXjcpwLjGSE+WvETSSwmMJi7ZD+zzAR9LviPho9oioj44H4flK/IUq0BDJWv+G
 eSqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvTtVisHvxVLBE0iHrEv1e34lFUngp0g4Y6n8MMKqAt1NXAo3eWViaovUdZNtMBHlup4t/KtV4Fzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnEUS/tZrWPY36UGsue/lOxQxzSktOHghEuUcEH929KUHUNKQX
 PXhrUKKQcZ0Ug5FhWt7eYTTuvyDdDsZx1xdLp94uVHJy4azAeWs9GMsurHzLI2R0
X-Gm-Gg: ASbGnctx7EFShFBkY2L/OKN3uNqWJsJKlDVpST622q5BJtRe7pLatgez1H5Bk39qEuQ
 X74hNM4jJfhPv80UoxXT8Brptr+t+JYvKJGEk9dYKK3ho8mhpGybvWjIHNFXbYJ8jEPengjJrzg
 f4fgLUtaHuSwRoD5wZjrM2J4hjOksg/fZwZEkZwYqSxtoscdaWIcGLsqsGnSQI91CmUq525ejMW
 TWClkTE7AZ7A7tdQg8kmHfY1nrNlHY2DyhWAeW2bThHmaMBhpEYLnBb6xcMnjrufJuGAKmaJ1lN
 BwrrDDgSpjoqYmIhaXdznQm6VWSeu7E9d6m8YzylX2L26uOVl3xRyPz6seBb5FNPhe2+pHwdyWX
 bwSFvMlBo4gjdqv0Z1T2fSY9Oug+MHpqUX+SobHJj/noYbLL6XddP+5PQhHEy6V+m8vLKXfqjcv
 Pux4RuV8VQRFZPrZt23K3fb1uGpsX3m19XnCR/XkWeHt6boh+xXwHR
X-Google-Smtp-Source: AGHT+IGnjxHZdK6YgYeQWiEf5kC4i3uB/AS5jxlL2wz4JLUI2l9QBYoOybryqN6CfGTwasNXsERGyQ==
X-Received: by 2002:a05:620a:4404:b0:8b1:7194:b926 with SMTP id
 af79cd13be357-8b33d477402mr135102385a.55.1763715960693; 
 Fri, 21 Nov 2025 01:06:00 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b3295db3e3sm328326885a.43.2025.11.21.01.06.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 01:06:00 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8b220ddc189so206441485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 01:06:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsmJD8kMUFjh8zEXVlyKHpdjajXB5fyIqW+2acMT6JJRqO3CC0lX6288vV1gyU2Y9k5vZBREDYyJY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3f10:b0:5db:d2b7:9518 with SMTP id
 ada2fe7eead31-5e1de423d78mr478729137.34.1763715558120; Fri, 21 Nov 2025
 00:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com>
 <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 09:59:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
X-Gm-Features: AWmQ_blyptlri4Pqcl2NwaA7Kkvpb6TwU_7MqBj9JCpi6c-uP2G1untsfrdqMis
Message-ID: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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

Hi Chris,

On Fri, 21 Nov 2025 at 05:04, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Nov 19, 2025 1:23 PM, Hugo Villeneuve wrote:
> > > +                           params->pl5_fracin = div_u64((u64)
> > > +                                                ((foutvco_rate * params->pl5_refdiv) %
> > > +                                                (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +                                                EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > >
> > >
> > > Also:
> > >   foutvco_rate (max) = 3000000000 (3GHz)
> > >   pl5_refdiv (max) = 2
> > >
> > > so the result of (foutvco_rate * params->pl5_refdiv) could become
> > > 6GHz, which is greater than unsigned long on 32-bit platform and overflow?
> >
> > I confirm that when testing with "COMPILE_TEST" as Geert suggested on a 32-bit platform, the results are not
> >  valid for this combination (but they are valid on 64-bit platforms).
> >
> > I think that the kernel robot could potentially issue a build warning for 32-bit platforms (if they also build with
> > COMPILE_TEST enabled, which I'm not sure about). Maybe Geert could comment on this?
>
> I've got no comment here.
>
> I can't image when someone would ever want to compile this code for a 32-bit system.
>
> So I'll leave it as it is now unless Geert wants me to change it to something else.

Pieces of code are reused all the time. So I think it is better to make
sure it doesn't overflow on 32-bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
