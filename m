Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109B3D7471
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522A6E811;
	Tue, 27 Jul 2021 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981586E811
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:39:57 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id g2so6920378vsb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMORGYq9zYL0BbSC5siHJfgjQsNzYI00xMgJvguvEqQ=;
 b=pKUeLsrX/iayfvWNe0AwMCHxBmiOsrxa2i/95Eab065mUPdikkUNn+bHqDb/Z+Maz5
 o3DNnbDoUnanO5gYEAujeLxxHQcoTqrmfUNkyKvoi2vc1xQXhceC1raoL/E+JUfDNfav
 DF/V7J26Ii64unBYCjTZCBGX1K6QPlg2Sx+r3bY+3fv7zUXbQB1p5wT1OA+PzG345+BD
 uex1iiP5h5q/TyH9+8Up4MMIV4DHMYG8KEUHCO2bQesb3kzOiVDEXsrSlAtTU6XOI1rP
 oU7kOvlB1B2iIOUWVl7tlkFyFy32ym3ZzL2aDPJDO9sgj8GYRa+OK/RLn5ds2sNZZuCf
 ZeMQ==
X-Gm-Message-State: AOAM532pc6x9wTnzaVaQe72y4U/e20xJSHjRjIpxOL3QaeKmm7SxCPFC
 CZwWmvXWo/fI/tf0Fu9QEieaefFr9RSwXt0SzPQ=
X-Google-Smtp-Source: ABdhPJz8EAHSpA5ssumFMd2SO7/p1K8PP/rO1gNlbgefMt9MamIF0aFU6Rje/V/LzHfe6Y7dv4vFKrYpt9b1YlS0RHg=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr15890283vsb.18.1627385996758; 
 Tue, 27 Jul 2021 04:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
 <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
 <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
 <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
In-Reply-To: <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jul 2021 13:39:45 +0200
Message-ID: <CAMuHMdX+hsXeoY8jNdDvyiw2HxhwcQw60LJddsaOGZBcHT=a=A@mail.gmail.com>
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

On Tue, Jul 27, 2021 at 1:32 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 7/27/21 1:17 PM, Geert Uytterhoeven wrote:
> >> Not enabling this, would mean that a platform device to match a driver
> >> supporting the EFI GOP framebuffer (e.g: simple{drm,fb} or efifb) will
> >> not be registered. Which will lead to not having an early framebuffer.
> >
> > Do all (embedded) EFI systems have a frame buffer?
>
> That's a good question. I don't know if all EFI firmwares are expected
> to provide a GOP or not. But even the u-boot EFI stub provides one, if
> video output is supported by u-boot on that system.
>
> > Perhaps SYSFB should be selected by SYSFB_SIMPLEFB, FB_VESA,
> > and FB_EFI?
>
> It's another option, yes. I just thought that the use of select was not
> encouraged and using depends was less fragile / error prone.

Select is very useful for config symbols that are invisible to the user (i.e.
cannot be enabled/disabled manually).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
