Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FBA9F273
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 15:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4379C10E51A;
	Mon, 28 Apr 2025 13:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05CB10E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:33:43 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c08fc20194so1121848285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745847221; x=1746452021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BEsm26/ULBWvXKeKH9l2FyVqKv47K9xZOm0eiyll4M=;
 b=Ba//TIJePG/QhHSsazsU42uWTzCRBOJXG7XZrzOiGZF2t1j7cOC2z7nxFOanLEdFHU
 /BzjySZAeTVrTBGcvjH9O46RL4hoGvdxedn7AFt7i385v4vi8bMiftMPPvoYY/Ya5kRn
 aAJeahuU5ZVz/+R+XjDuI7SxTvXL8E21d6y29I7L9yahC/8//1loGWwjFHV9ixg7CZdR
 iMQy02mdDVQ+rodSSNvcPMm3VXYUDHFydOQrp6M+1EH6tsk8OtbnDVfSG4GB+HE83EkJ
 MUAf4ajWu7xdn8spcuORB4ChY5neMHAlnXpbRvLdu5QskLDLHAiIqMPFqds+QILMhPgO
 6/Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIAJ0fi4rEugMs2c5lXr8vZ0HynihJ7t1yJWFseb8kJx8KQ5cnH1EZ1BABLM5MuDR5/bJRrOxa024=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhlXgESGPcb9zl1r/BMj7p9p6Lq9ykjUhUWceGkahURPNmvB/y
 EoxEIOVtMxn9LtJrXq80/WATww5VybZoMVkBHG9GKmEvzIRy3sfQf2e2vmuW
X-Gm-Gg: ASbGncsLqJBgXZxd6KdC4bTR5wfMdH7zlaTuSXzxFLyOQUdNRFy76NiFfBu3kzly7fc
 jdIs+SChirIh5rLpyEcCuvHJCkMDCbEZ2nRALIfNN2tNmut7ZlneXhluPbYP3vH0wRD4lKt4327
 g/y02OCVS7tnbrnNvU0ndrNBnyj2EkRGJjlrPx56LT57W0/NHMLZlGbk1RXCtvf8oPVgNEDwsdp
 7GufJ/SyZQHcbDfY7jzbaREhnep9bXepKvp/BP40cqEJ41xYlNi7iPyhaVfsJ10JSXbaLX4zJpb
 ei5wnsYsxpdyN8d3Uy58BAzg6AUwsh5oXX+EQNY2m73WgqiVZ03aNuRm84tgNXjetr5lAlFB2bQ
 e7h8HOTB3XBn623RAKg==
X-Google-Smtp-Source: AGHT+IF9+YGeCpaYSg4l3shyq2IsBMAgdfqHO0ro4k1VAUFRxNO3JtBWmB7X2KOzSqxLO9wQb64g5Q==
X-Received: by 2002:a05:620a:f04:b0:7c5:afa6:83ed with SMTP id
 af79cd13be357-7c9668496e4mr1329440785a.11.1745847220668; 
 Mon, 28 Apr 2025 06:33:40 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
 [209.85.222.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c96d39f0b6sm259454485a.87.2025.04.28.06.33.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 06:33:39 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c54b651310so789313385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8hxnd4HXxSn0uWcDUAqE6Q3V2XevmGdGl5kpsDC/8BbDB/sFUlakw4w/LTIkn9AetlxxotilEM58=@lists.freedesktop.org
X-Received: by 2002:a05:620a:1787:b0:7c3:cde7:a685 with SMTP id
 af79cd13be357-7c96686a84bmr1764084385a.13.1745847218260; Mon, 28 Apr 2025
 06:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250428123132.578771-1-pmladek@suse.com>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 15:33:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
X-Gm-Features: ATxdqUFmD3scy2HsHjle6vsPCd-N6jvnwhDUq0YXyuK0ax-ge1T-9jGSCM3VE7o
Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering
To: Petr Mladek <pmladek@suse.com>
Cc: alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, 
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, 
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Aditya Garg <gargaditya08@live.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>
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

On Mon, 28 Apr 2025 at 14:31, Petr Mladek <pmladek@suse.com> wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
>
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
>
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
>
>         %p4cn   00Pg (0x30305067)
>
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
>
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
>
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
