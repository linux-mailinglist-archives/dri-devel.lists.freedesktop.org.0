Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FF29FEAB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 08:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F26E960;
	Fri, 30 Oct 2020 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFABC6E960
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 07:41:44 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w191so5844755oif.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUqZb88Q/0ufWYeJ+IWRUs61LFgtSnTkf63Dv6bu7V8=;
 b=jWVOaY5oQviBP158oZM89w51EKFZO+vk+IGnuUubNMW7oB4B6izLsOwRIzxUTH+IwO
 43yJu4TOwSjfCMC4VSAc3Q6ZXTJRrhlS/uqucbifAgqCchf+5+NysfBP3JPfdqmi7ael
 2zJOn1wBsvoUQC3nXf7mivZ8mXfN88rxtRYDAY3LV2ra+szzADEca4WA/kuCleyZ//6p
 Ux/nG/DV7y5s1/1J9yJ4ibTcOF+YFD6+bPUmYdTB2CDVNrI3n1Ts4x/bwcr0l3INNhOO
 FBRqlntgfDfFgppyhXs6dRJHwdrIAt9gxK7UqoLxe1ge0o4gcDWZgTLdk5YsbcixmxvF
 Yk0g==
X-Gm-Message-State: AOAM532iS4UKiBDFkXSBe6QNMkN4vUmdwDjHa87To2zgY+xkhWdi2s3h
 sg6jdkpoAwaAqgPxQyB5G1XkHiJNyrcw4ui/fXQ=
X-Google-Smtp-Source: ABdhPJyM4/0ApYw24j7hJhvVORFY3r9UAsjCRQf9AbmQ++DpOBDdsns9JiBEZ14reWsk+RiL97ai+YaxCmHoLPd7gYc=
X-Received: by 2002:aca:f203:: with SMTP id q3mr694400oih.148.1604043704014;
 Fri, 30 Oct 2020 00:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201030002850.6495-1-linus.walleij@linaro.org>
In-Reply-To: <20201030002850.6495-1-linus.walleij@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2020 08:41:32 +0100
Message-ID: <CAMuHMdUS_xZS8nvWiVG9BPit26kvgeYeB2tL3NbLZ6ru5ujD4A@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh_mobile: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 1:30 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> The driver includes <linux/gpio.h> but doesn't use any symbols
> from this file.
>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
on r8a77440/armadillo, where this is the last piece of non-DT support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
