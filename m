Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04B49AE03
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAEA10EE89;
	Tue, 25 Jan 2022 08:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6710EE8E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:31:10 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id y4so36013908uad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLI0NpGLcGeDoF34x+JYc6mPOV18pDeJSnyNKlPba8Q=;
 b=jRhos9UQ/9yGi+Iygg/zdhrj75yuX7WaDMKq3nS1BV06qrhBVxxn2skZTvAAgZCtaT
 0ARJUR7gvWDUzSkTu4AfXTJk+yokN9vSvObMcb1wS+CeOIxDpg484Cgy8w0zOQuj9Q4I
 FZ8Y6VsMPhLvoTcwPf/nMtaFaplNBETfpxbzncfAIDAd+lM9Vu36gJgfdz2M4yZj3+rr
 MTbwNtBFCkX2oNflXSBoP8dQ6066Xu3qbWDh/pIt2QJitIWMoT4yE26p5Ts0jtD9gRJO
 2U7KG0bCoXJYbzjg/AHmDB76Wtkv88zEdn0AtDTbQRvEOGQf61i62rN5msZnCPyqWfap
 wqSQ==
X-Gm-Message-State: AOAM530gS8nIsB7k/dfyioufY6+O6C1uCUMaWcTZSCtOIXNEr/EfWDFT
 yuDv/CsAqLrM91OqMxSULMjKYAZZgzsXcg==
X-Google-Smtp-Source: ABdhPJzMOE5+3PzEnd0SdiahgMK/tQp7dnNC7Z8p+KmRuKzi86fMY6ZfNE+HbNvtKKz+7Tfcxj1c/A==
X-Received: by 2002:a67:a409:: with SMTP id n9mr6741303vse.74.1643099468962;
 Tue, 25 Jan 2022 00:31:08 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id f68sm3263884vke.55.2022.01.25.00.31.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:31:08 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id u6so36070242uaq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:31:08 -0800 (PST)
X-Received: by 2002:a67:c18e:: with SMTP id h14mr3289857vsj.5.1643099467906;
 Tue, 25 Jan 2022 00:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20220124210319.325512-1-deller@gmx.de>
In-Reply-To: <20220124210319.325512-1-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 09:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5m2z1FmYi2-+rwpr4xc8F_V4TivKcddzA6oVReUijOQ@mail.gmail.com>
Message-ID: <CAMuHMdU5m2z1FmYi2-+rwpr4xc8F_V4TivKcddzA6oVReUijOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Claudio Suarez <cssk@net-c.es>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc regressions

On Mon, Jan 24, 2022 at 10:04 PM Helge Deller <deller@gmx.de> wrote:
> This series reverts two patches which disabled scrolling acceleration in
> fbcon/fbdev. Those patches introduced a regression for fbdev-supported graphic
> cards because of the performance penalty by doing screen scrolling by software
> instead of using existing 2D hardware acceleration.

In the mean time, a userspace regression has been reported, too:
https://lwn.net/Articles/882054/
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988039

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
