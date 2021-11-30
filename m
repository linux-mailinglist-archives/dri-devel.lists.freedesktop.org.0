Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6310A462E4F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348BD6E44F;
	Tue, 30 Nov 2021 08:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50E26E8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:13:58 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id p2so39590764uad.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9TvqAb2dbPQyUlV58mO9YTh/iv9wO/YMHLV7b29cnQ=;
 b=IP3PU1M7oKj4xGny+oppD9ULNyYjnt9M+cgQAjo5alNOcpKS8QqY5WSaN/v5kzMeN6
 ZDpAYky9yBRxl2AzXYgmb8dk+BYjh+QjMlG3B04dZewDvhjorvuH2/n4972JAEkgv7fP
 TWAqAqT4Z5MQforBW8R+yvCiUnpgWTZxvAEcMfuha1ZG1FPvtFPCmmcPLy4aMQMRff/L
 3+r73UmQf+v3vXOI2P1DmPZ5yIgTs6D8WLQN4PdpU7XhA2FjWuVBNbKZbR9iCj19FwK+
 TtdTzWK7Q7eILvDzIwmL3UgfDR48v+oOCSVqNZqzZ9NH7ts7C6uwmo/TiqZJnQBl1BKW
 cpLw==
X-Gm-Message-State: AOAM531KGQhH9dICi+ie/d7NKGUjH/pleLbjo89+E1flUk1pqTFlDJp7
 YSKqCpMtoi5o9M/QFfkPcNL/F3Kmf5YR/A==
X-Google-Smtp-Source: ABdhPJyep66aALlK7xrDO++zYUV2h/acIy69StK5yvnPKAAPcttjP6V2kWItuv+MtZ58CTaQxJqQrQ==
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr39716018vsl.0.1638260037429; 
 Tue, 30 Nov 2021 00:13:57 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id s13sm9693325vkh.32.2021.11.30.00.13.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:13:57 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id s17so13022330vka.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:13:56 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr25229885vka.0.1638260036796; 
 Tue, 30 Nov 2021 00:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
In-Reply-To: <20211129093946.xhp22mvdut3m67sc@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 09:13:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
Message-ID: <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Lechner <david@lechnology.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-staging@lists.linux.dev,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Nov 29, 2021 at 11:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The problem that fbtft (and this series) wants to fix is completely
> different though: it wants to address the issue the users are facing.
> Namely, you get a cheap display from wherever, connect it to your shiny
> new SBC and wants to get something on the display.
>
> In this situation, the user probably doesn't have the knowledge to
> introduce the compatible in the kernel in the first place. But there's
> also some technical barriers there: if they use secure boot, they can't
> change the kernel (well, at least the knowledge required is far above
> what we can expect from the average user). If the platform doesn't allow

If you can change the DT, you can introduce a vulnerability to change
the kernel ;-)

> access to the DT, you can't change the DT either.

How do people connect a cheap display from wherever to their shiny
new SBC and make it work, without modifying DT?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
