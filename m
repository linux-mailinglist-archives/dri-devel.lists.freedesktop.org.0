Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA1D6895FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036310E742;
	Fri,  3 Feb 2023 10:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E110E742
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 10:28:17 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id g8so4876206qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 02:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OONFnhP6I7zS1Y45r5yPBZWg15dDNXvDl8f/Zu5HTcU=;
 b=bHJJ9hSBw35Zl0C+H/Bb2P0M6DMFOD59D7360A+b1W9FHgOF51o4FjeXKS70i7FWFA
 tbKp0ysEVtOpLVUUHe2gMipTUc8jV//6r0b+qZi95K6bSFCyKRLKnfyhYICME0f8jIYp
 Z3MoeICVqFRK1yGBcfz68W738efEIVn/YDzwAXE0s+UTnB849zbkzS8FAHqXLSlBYg0j
 4Pfdp/8sQlW8L0uFnECkXqaTEUTmwYodWddZ34VFby5z86YqCfo+sIv9SpzxaYdajf/c
 9EcJnCNeGw9+pJWEDlVC0EEAr4Nnyevd5vrTV3uwLHM1t+/KPGjTorgn9i6Ipy7uqwr5
 bLXQ==
X-Gm-Message-State: AO0yUKWdSr/9iMyx2gRPeGNfzwz/abfKUivSY7I2QEsLbOt2vXCmiKIC
 iX+71bTTplvEK5UHDIt419m0ARXBaAEhyg==
X-Google-Smtp-Source: AK7set/BhSGB/fxsRhHGvVqWXOWkwRurG70zpI/IrZDhX/7rfTE9iMKM/dkX4RpwRYaAQ5CjK6k/mg==
X-Received: by 2002:a05:622a:1047:b0:3b8:588c:40e9 with SMTP id
 f7-20020a05622a104700b003b8588c40e9mr18937741qte.19.1675420095929; 
 Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac8515a000000b003b82cb8748dsm1268607qtn.96.2023.02.03.02.28.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id i2so2439443ybt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 02:28:15 -0800 (PST)
X-Received: by 2002:a25:820a:0:b0:7d5:b884:3617 with SMTP id
 q10-20020a25820a000000b007d5b8843617mr1035225ybk.380.1675420094927; Fri, 03
 Feb 2023 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
In-Reply-To: <20230203101624.474611-1-tudor.ambarus@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:28:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
To: Tudor Ambarus <tudor.ambarus@linaro.org>
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, trivial@kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tudor,

On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> The deciding factor for when a/an should be used is the sound
> that begins the word which follows these indefinite articles,
> rather than the letter which does. Use "an SPI" (SPI begins
> with the consonant letter S, but the S is pronounced with its
> letter name, "es.").

While I agree with your pronunciation, I believe the SPI maintainer
(which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
with "spy" ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
