Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC03C9932
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E256E53E;
	Thu, 15 Jul 2021 06:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17E86E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:54:48 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id h9so1073452vkp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 23:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTwyBQY31SR0k9D6ud/qHazq+KVSjgeC457BWvTVmiM=;
 b=tXXbG8q75jKo2U3wyGTUaL+6ypRZKjDy8mvzv+sYysUcy6Vr7mGzbtBEBiIWV7vN/7
 272/wndPQOhU8aL0zarQIoGxW0o8CWyM2Oui3Lf1mxDuNG8tlLVrPFkFLZgNc9atJhsi
 ho0fd9iJs+VvMThmokp31NQ2xEwOFSxi2Kmtic5ajUEQAW8DTf7/cvvF8Qc2kZkQgGKH
 0CUpi8RTWSuEPBEaifEn6hT1rN6LyURoeTgcyHV8b0ERud7VaOENpumk1XF8u6E7v6Hl
 hbrRalfS8hEb+D3FOaylp0XUAyjEsWCHBrIwdEnQbVPfPbq3KI6m04Lc6dVG+NS4R04S
 EGjw==
X-Gm-Message-State: AOAM533Te+1xReT4tcTDs/+8fX0ygb2BdVp14pKQwhLznH7uhWPoT5z3
 zIu2hGwIY2I5755wF12Ehn6Zo0xrULWAwvG05TI=
X-Google-Smtp-Source: ABdhPJwpwUUWe4BFauukF4jBR4wGnmFd1K5ch7H5PTp1oLbLQs8rxa4S50A9H18uIxoc8/R0vmbeR/Pfefns8mnnR08=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr3950937vkn.1.1626332088002; 
 Wed, 14 Jul 2021 23:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <YO8CT+Hcw1wfhnH5@ravnborg.org>
In-Reply-To: <YO8CT+Hcw1wfhnH5@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jul 2021 08:54:36 +0200
Message-ID: <CAMuHMdVjXhTE2x8mRrinmh9CCrdXQr+BYPfP-peaZ4AsLwsaaA@mail.gmail.com>
Subject: Re: [PATCH resend 0/5] video: fbdev: ssd1307fb: Optimizations and
 improvements
To: Sam Ravnborg <sam@ravnborg.org>
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
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Wed, Jul 14, 2021 at 5:27 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jul 14, 2021 at 04:57:59PM +0200, Geert Uytterhoeven wrote:
> > This patch series optimizes console operations on ssd1307fb, after the
> > customary fixes and cleanups.
>
> What is required to to have a drm driver that could do the same?

Add monochrome support to DRM?

> Note: I will take a look at the patches a bit later.

TIA!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
