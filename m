Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65A689ED2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 17:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7242E10E80A;
	Fri,  3 Feb 2023 16:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CC110E80A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 16:05:04 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h24so5905755qta.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 08:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wIYdPVdo9w8wJeFawgcWpGlCHgpXqP0aU2proD/z4A=;
 b=yK5bLEKQRtRmt8FPKBr5EU5fTrOglqXXY9HL81CprKnkaHuHC4qoXMYak4kIF6Hoh0
 zD+sbVGsWLg+QQFfAOHpmOTi9ESk2qDSyYgJfg8x53jir8CzpsaPTjKKK3W8cmqgnPF2
 cTYFOPeFHhAAtuK7ka89pg4NME7RD6TfC98mJ9ZcNcBF82Vr/MJuzrac7Juoi5Aj467D
 2y5QePyH1Lb7zro8pkqNK/TV4MOydRWKQ+87o46AVxXaxhFGOo81OzyfcG344ZPLUtno
 Qkla+iUZx9hF4zZcN2PBNoyFwbmsF1Bp8r9INifJCLi2kQ1PuJ309P1vnB8FDVmngHmM
 frVQ==
X-Gm-Message-State: AO0yUKWY0MS4ieXBfZSBww0BgDfkLioV5i0hLMXTCkuRqIj/rUanqY+l
 fEEv19PlzFjvCXCXRuc1c9JQhOfjLFsx7A==
X-Google-Smtp-Source: AK7set8r3fbQGh5ceSRgwo0jjAiGQIb5Rm4ZCx36rqoXWBncavyC8/0RRrM7FP5WQJP77v0WlTT4VA==
X-Received: by 2002:a05:622a:254:b0:3b6:2fbb:1f8 with SMTP id
 c20-20020a05622a025400b003b62fbb01f8mr18893198qtx.61.1675440303005; 
 Fri, 03 Feb 2023 08:05:03 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 u184-20020a3792c1000000b00718a650b86csm2035711qkd.51.2023.02.03.08.05.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 08:05:02 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id x139so6737388ybe.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 08:05:01 -0800 (PST)
X-Received: by 2002:a5b:941:0:b0:865:e214:f4e3 with SMTP id
 x1-20020a5b0941000000b00865e214f4e3mr352487ybq.604.1675440301482; Fri, 03 Feb
 2023 08:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
 <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
In-Reply-To: <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 17:04:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Fri, Feb 3, 2023 at 4:57 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> Is this "sh64" still accurate and applicable? from Documentation/kbuild/kbuild.rst:
>
> But some architectures such as x86 and sparc have aliases.
>
> - x86: i386 for 32 bit, x86_64 for 64 bit
> - sh: sh for 32 bit, sh64 for 64 bit <<<<<<<<<<<<<<<
> - sparc: sparc32 for 32 bit, sparc64 for 64 bit

No, support for sh64 was removed in commit 37744feebc086908
("sh: remove sh5 support") in v5.8.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
