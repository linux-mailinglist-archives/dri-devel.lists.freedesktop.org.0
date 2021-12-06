Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11484693EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748007B5B8;
	Mon,  6 Dec 2021 10:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1ED6F58B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 08:53:34 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id az37so18029500uab.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 00:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fa88EzZGCDt/on2PK9adyVtAB10G/5IDqGLBZHmYHC8=;
 b=f/fFayVKTTIoROvXSjpx8Ws7FQw1M3P5BbD09OTkG02vHJ2hmUKWDdrNo0ZDGdnYfa
 G9WOqWYcV1irB4VR9o36ZfbapVwXfaiw79Yn1tyMfU/DI5L6IJqKRAA1Q82QtMAdzPtA
 uOQMFOlCDGepwS+8wnsIBHpXmSKaXZRznueT+tFFL0TQxsPX4Anmryb7dEw6fDpE2CmF
 eNcyFP47cUn30iETeYsMWMv8EUjID7CFNiJEy3a/cn15XHq2kGyd/J2NZgGRZAzV5+MN
 C2y05kEE5TFa/hPMktTX3rNZ00+RLtUFreNvzB1FzGu5qYM+YJHPbhYMNubzg+c5smzC
 3BPw==
X-Gm-Message-State: AOAM532yPnZgrh960GDJK3X2fxt295BUYNxsAVVtGVdAabGbEcmxKd7I
 erwU3EvhXrNh0Nko8tgBtULsBVwOgfTSpw==
X-Google-Smtp-Source: ABdhPJwQ1yL+zzDBq54HfAqLgbimJg4XnnG7ayOSvW2Ib6v/aQVnpcxP3fMV9exvCN4Hio2Q5n3UgA==
X-Received: by 2002:a05:6102:3ec9:: with SMTP id
 n9mr33100417vsv.22.1638780812839; 
 Mon, 06 Dec 2021 00:53:32 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id 62sm4013640uam.6.2021.12.06.00.53.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 00:53:32 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a14so18207221uak.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 00:53:32 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr37900038uai.89.1638780812238; 
 Mon, 06 Dec 2021 00:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-2-noralf@tronnes.org>
In-Reply-To: <20211124150757.17929-2-noralf@tronnes.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Dec 2021 09:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhtwXVFNCzijdtXtuRD=VeHQm2sEQ8WZfin6uBmY0QHg@mail.gmail.com>
Message-ID: <CAMuHMdUhtwXVFNCzijdtXtuRD=VeHQm2sEQ8WZfin6uBmY0QHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: sitronix, st7735r: Fix backlight
 in example
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 4:17 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
> The backlight property was lost during conversion to yaml in commit
> abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT sche=
ma").
> Put it back.
>
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to =
DT schema")
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Mea culpa
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
