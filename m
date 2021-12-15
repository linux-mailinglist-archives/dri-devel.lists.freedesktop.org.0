Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875AC4755EE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FE810E3F7;
	Wed, 15 Dec 2021 10:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418110E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:12:46 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id q21so14301834vkn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oYyudWNRvP8Hla1hFk2l+R+UaR2deY6N33lbhAdimyI=;
 b=p+kNDPTucMj9PJ0hskC01+isoBGopXFbE5sug/rGohJH1LzzR89e+8/93/gxI+S96q
 4jYh/y1JRvNPLMtDWCpIizykfjEUL9ggs989aLXglh7Gcd4LOS1aXloPEJtypbX0OQfF
 pvUSm2qeiBkSr09c4QnlzxapqUcjMMh8Sy0OmX9FZv/Q0WJNAERAyItOpo3y3er46g4i
 GnSOrcOSGReAB2pUGE40jM9xk2tFNNJzV9TAciupY2jDU0NCZjLSIe7/53xZqPKQWXrQ
 s/xM90lUDbJz5QiXW8YeSaiVHm6Eq1/ywOsa3qkWphWNq3goEGToN0kAjxih3Q4xpyU3
 EgOQ==
X-Gm-Message-State: AOAM533f40PkIWr0FPK44uJTWLzIrsnlFZBZLRs6J/MvOx4vkZzEQUBG
 w9HPCjgt/Lq1qGml44kqdZm4fa9eNNaGug==
X-Google-Smtp-Source: ABdhPJxxjy+dgjsOd81P5Mhcf4CxAiF8HBNWF2/k1qu0gad9n6uTTLlTu8xTlTyReMZUvf+0Y2cSGw==
X-Received: by 2002:a05:6122:78c:: with SMTP id
 k12mr2802403vkr.25.1639563165486; 
 Wed, 15 Dec 2021 02:12:45 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id g28sm323759vkl.16.2021.12.15.02.12.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:12:45 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a14so40129948uak.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:12:44 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr2373758vsg.57.1639563164657; 
 Wed, 15 Dec 2021 02:12:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be>
 <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
In-Reply-To: <Ybm4oFaYgtl5+MRk@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:12:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKdWvTPQ=9EHpEr5Rb_sSAQ=3cgchmeSFpEXs2_we4wA@mail.gmail.com>
Message-ID: <CAMuHMdWKdWvTPQ=9EHpEr5Rb_sSAQ=3cgchmeSFpEXs2_we4wA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: rcar-du: Add missing dependencies
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 15, 2021 at 10:43 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:44AM +0100, Geert Uytterhoeven wrote:
> > This patch series adds missing dependencies to Kconfig symbols related
> > to the R-Car Display Unit.  These dependencies prevent asking the user
> > about R-Car display drivers when configuring a kernel without Renesas
> > SoC support, or when the answer wouldn't have any impact on the kernel
> > build.
>
> Won't this have an impact when someone will regenerate an ARM64
> defconfig, given that we want to keep those options enabled in
> arch/arm64/configs/defconfig ?

arch/arm64/configs/defconfig has CONFIG_ARCH_RENESAS=y, so it is
not impacted.

> > Geert Uytterhoeven (3):
> >   drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
> >   drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
> >   drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on ARCH_RENESAS

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
