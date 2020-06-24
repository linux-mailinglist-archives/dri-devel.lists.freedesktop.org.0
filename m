Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F052074D2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6917D6EB56;
	Wed, 24 Jun 2020 13:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233176EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:45:41 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id s10so1460948pgm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKjWMjcOxALjROxn2da3zX/d0T2J4uaTbhVPfw/r1PQ=;
 b=YIFyo4x4txxZ4nqaQk75rQY5jHXt9ta7pLR6PGdDvI67aadyE5+L92CGN3HuHa8b+g
 /KTEzvOMJiyWfzC5nmOmK2F0CPWndgpgNbrk06imhGjhX/AlLealSi4h16f7ItYYqWQp
 PyZvzUIf94K7W8x7/Vl2YmhadvQ3VEME3M2psh7wm0Fkrr9QD1YDVNRRvkyw6X2OMVSL
 hXol1Mu8YovpfH7i6TRTMswRYxs1F8ULc3UF8BNVCr1iagu258KvU0qjmHvnlEvjDS1f
 RksFsoVidEsI7eEByIHnnjSMYNZHnDX09NvrqCF6AHCGSk0FIp/At/kgaov9Jdg+Ewna
 KzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKjWMjcOxALjROxn2da3zX/d0T2J4uaTbhVPfw/r1PQ=;
 b=GcFphNISeu7g7rQEHlS8fbHNg/Junuw2iIzLQF0T0nrvsfEHuaJ7c3MvyBFGhEfbvj
 AM58n5tkVtCKbcr8PPgqIb0cDrHfax3X5og8Jkyh5hcLv3Wg+80HwB0dNfgaoUmWgkx1
 NTFMxYhp2u0IXt0Bga9r9/rtvQCX1sPG7KcZSQcC+//lIYpgVucngCKLmiuNtldaPQny
 i5Hw/4eJcYL2PvAt1MolQkYORZGLdoa/N9rH+jw/DR8BbzPxb5ZWgb8eR0CGlfSKSx2H
 UXhctEUx8R1L9j8TbETTvIEwEnIt4kXbkKJaBbeBCaU3+8RB+/P0/xe3vpu3ktXFiS13
 J6kA==
X-Gm-Message-State: AOAM530heQu+79Ik00Oe701l3DOkaFQGSv8jBVS2dwv4bEI+z3gE9gSE
 tLXK1cWfJYLtiBkXBiCVKMXOoWjO07uREH9yZn8=
X-Google-Smtp-Source: ABdhPJzP96rHQVTbJaOF8adE4hygUklHj5+XAKX0WUXTgJf5HCnXbbYR24k5yfeYfOhMoH40Y1T+Uziyt/t5umR+CAw=
X-Received: by 2002:a62:5284:: with SMTP id g126mr30364100pfb.36.1593006340755; 
 Wed, 24 Jun 2020 06:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
 <20200624132714.GD5472@sirena.org.uk>
In-Reply-To: <20200624132714.GD5472@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jun 2020 16:45:28 +0300
Message-ID: <CAHp75Ve9V1Vyxe3bEeHJ9H2J900wUXHMmXFJt-dn9sO5OMejHA@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
To: Mark Brown <broonie@kernel.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 4:27 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 24, 2020 at 01:41:23PM +0200, Andrzej Hajda wrote:
> > During probe every time driver gets resource it should usually check for error
> > printk some message if it is not -EPROBE_DEFER and return the error. This
>
> As I said down the thread that's not a great pattern since it means that
> probe deferral errors never get displayed and users have a hard time
> figuring out why their driver isn't instantiating.

Don't we have a file in the debugfs to list deferred drivers?

In the case of deferred probes the errors out of it makes users more
miserable in order to look through tons of spam and lose really useful
data in the logs.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
