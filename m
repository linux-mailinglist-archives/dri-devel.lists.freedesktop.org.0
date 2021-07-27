Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49B3D7429
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB36E58E;
	Tue, 27 Jul 2021 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1DD6E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:17:31 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id o12so6919771vst.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6KUNJv2uoXrIO9Z94cPI6QCbRXnZyOGViaOY2yoHjk=;
 b=aGIozA1zPgOM5fIKF92CyI88FhfBvG8vC6m9Qi2Xc04BGv+qCNbDyfNs2brv4oBxu2
 cFGE8lsKHwiM4/IwIkc5rcvwjt7K5YWOHMKT4dtjiAT7HQmkviAPbY5an6l/mb6fR1yK
 07jyulECIR7rmpKQCHZVV2mqLE6KbRKkHQkrOsr6+FmzrQR229VuqUMa2ETHj8Z/0znN
 Fd6LGN71TEGYoE3CiaLEwiXp0G2pU/dd/XqFipao1nU3T3RolB3peop/JH6UdocFSIlM
 EtQQ0iyfIX4SJNXx+6pB8gue0cP68O4ipEx8VBNEEJX7v+DvPG3c8d7VKgHIeFT0Iho8
 bIuw==
X-Gm-Message-State: AOAM531cRoHPLO4NcPR+Ta/skxRZgYsSmnydDuCYjdriqkJCHCZdhVpq
 nasTcDM25P8CX2a+dsMad3RCsIiVuRf9JCoEhRQ=
X-Google-Smtp-Source: ABdhPJzdJc/SjKstfuXj+nsFalKzdo9cYKN9WJguuDhjSXSUMFsd/595b57U+p6vypuiCz2+dHf3+igq1LjTvgJflcc=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr15836833vsb.18.1627384650666; 
 Tue, 27 Jul 2021 04:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
 <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
In-Reply-To: <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jul 2021 13:17:19 +0200
Message-ID: <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jul 27, 2021 at 12:22 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 7/27/21 12:03 PM, Geert Uytterhoeven wrote:
> >> --- a/drivers/firmware/Kconfig
> >> +++ b/drivers/firmware/Kconfig
> >> @@ -254,7 +254,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
> >>  config SYSFB
> >>         bool
> >>         default y
> >> -       depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
> >> +       depends on X86 || EFI
> >
> > Thanks, much better.
> > Still, now this worm is crawling out of the X86 can, I'm wondering
> > why this option is so important that it has to default to y?
> > It is not just a dependency for SYSFB_SIMPLEFB, but also causes the
> > inclusion of drivers/firmware/sysfb.c.
> >
>
> It defaults to yes because drivers/firmware/sysfb.c contains the logic
> to register a "simple-framebuffer" device (or "efi-framebuffer" if the
> CONFIG_SYSFB_SIMPLEFB Kconfig symbol is not enabled).
>
> Not enabling this, would mean that a platform device to match a driver
> supporting the EFI GOP framebuffer (e.g: simple{drm,fb} or efifb) will
> not be registered. Which will lead to not having an early framebuffer.

Do all (embedded) EFI systems have a frame buffer?

Perhaps SYSFB should be selected by SYSFB_SIMPLEFB, FB_VESA,
and FB_EFI?

> The logic used to be in drivers/firmware/efi/efi-init.c, that's built
> in if CONFIG_EFI is enabled. We just consolidated both X86 and EFI:
>
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8633ef82f101

Thanks, I'm aware of that commit, as I was just about to reply to it,
when I saw the patch is this thread ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
