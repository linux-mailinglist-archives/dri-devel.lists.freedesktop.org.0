Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F454C23DEC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D949C10EAD1;
	Fri, 31 Oct 2025 08:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0491B10EAD1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:43:13 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5db1e29edbcso1340683137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761900192; x=1762504992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srKuvBcN8qwhEwMAzIP9jvMl8T/5K7+6w69VAb/dJjw=;
 b=mm//o+AvtYoDgjC+RxIl6bdYXC9Kl1cTAUIh4UhD25Z5D/rLvGnl/XMBfKav/TzixX
 4wVLXzzif7Sb5sOPjMEOOupxDkFZt2riybN8giMajHETdKUBiisDhOUsdqjNE6H4itVE
 VnmMymK/cTxutFptR1ATme9aAMkWhYFYItCHkU11BJCtpEUFolfDBWBrEbg5VLn0DZmM
 89Jd9TnOi00sJfJ8uY0VN5LCXci9kJKGCJlmbt2sYUfDtizbfaE8U34v5FXFQUfiLD7j
 JUhD0B5YUkZUFuxI6AvY9ZvperzP3AUd7HlL8mj2FEVvShW2ivNRTFjuKKcJEiGc55Bb
 9gRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBn/1sQUQ2F2//La9RFdYZGj2GCdwplur6vWhXItrBIAg/neSiEczvej3KjRmbrxiEhwwbXO2b8PQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynNYd5gsL807BgTu3slk5f06Iud2M5l0hdwpihozIdx43uyGje
 EJYQgw8T3m+McSrGFH8Zoqa8xdu6M/31x76KrD0j6K7rPRm711B37u83k/nVkP7M
X-Gm-Gg: ASbGnctwn09GiTqEpLDfveWCcxr1E1q9nQze9Om/Se4kY14FRDOLm2OPbnRNgJ4xx6D
 zo25BCKoum/uVYIAXJdhSEewpkWnwGqBDORyoCJAQgDcPqXP9d5sOH5D1gMk5liKM0vi1SCMJWC
 vo6yZk3E82aBRovU2MnLA02U9CzcmNhTqFNhWVInGDw6g69MIdBjmtukjg5i1sNl3SdLKpPYaKM
 dmNbBcBUl1AfxYiHLQO3+AFa+/y3AMcvRb3YfJaNpk6JRjLttLhlQ31I5EqwZOqFAMk3soVawyp
 bDac6vW0E5YUnotr+BJz7/clLZ6riDm5niQNhI7FgE3P8lMUhJBZSyZsZnX09JUhwFHErxR1+s0
 8DPfGoxmJ0t5ifgjifKKVU0xwi1STbRmwqJXE3vl2vsOniRVdlpRpeUU/LeJ8QIv45K17JL1zSg
 v8DS+p1m/Fw4BGTYDwN4MwsqK2dfYDGDjCmtf3L0o3hi8dDcME
X-Google-Smtp-Source: AGHT+IFCSZX1zhKyDs8JJsW0KLPc+0pqwFofgGp2CVsRKlECK3joDPWtU0aA5ccC1Ai0tCDrKtnlHQ==
X-Received: by 2002:a67:fbd9:0:b0:5db:b7c3:116f with SMTP id
 ada2fe7eead31-5dbb7c315c2mr165091137.11.1761900191528; 
 Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5dbb617acf9sm399820137.3.2025.10.31.01.43.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5db4006eb0fso1545979137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQZcq/KPdcNr55nG/c1Kapenv451a4EVU1oYOpWadqfazEguOSqfbnlBUl3BfsWS2I6ZsMai/WhGQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:26d2:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5dbb133e6acmr609871137.35.1761900191030; Fri, 31 Oct 2025
 01:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
In-Reply-To: <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:43:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
X-Gm-Features: AWmQ_bl5-OwN-KWDVvu4tvr704LIaV03yTPqbwFu_WpQDxzklRlUNeQBSF_vnQU
Message-ID: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>, 
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
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

Hi Matt,

On Thu, 30 Oct 2025 at 13:18, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 29/10/2025 14:08, Geert Uytterhoeven wrote:
> > While playing with the PowerVR driver on various R-Car SoCs, I ran into
> > a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
> > the GPU device node to DTS, the driver fails to probe due to lack of
> > suitable firmware, as expected:
>
> Thanks for the detailed report! I'll make time to look into this. Do you
> encounter a similar issue on other R-Car platforms, or is this exclusive
> to the V4M?

Yes, I managed to trigger it on Salvator-X with R-Car M3-W, too.
Reproduction steps at:
https://lore.kernel.org/linux-renesas-soc/CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com

renesas-drivers-2025-10-28 is available at
https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2025-10-28-v6.18-rc3
My aarch64-linux-gnu-gcc is gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
