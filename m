Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C67669087
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D7A10E1E9;
	Fri, 13 Jan 2023 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2513A10E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:19:48 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id o17so14384187qvn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MowQaQp0G9uX2jhG1rQLtIGSPC7S+MJhKLN+g9WmpVM=;
 b=73pmHUQVw4K7NZOAhWXJ7sCM8wgifwoun6IaAmv9r20RekaDy5hC7FvD1jhCoGOULm
 RMfvHzYy09SoELO54N6UmlMD8nOHomoLDrEpAhMvmqye6l5tXTBcwZZIkdf/n0/5BwVg
 k4k1uywOZGIilzpI+HcQQ5QQ9/mLKK8/ks/QrxqyCidgSOAL9PROT0FRjBl3H1q7Jfag
 mNDyE6pYD2e85aPTZra6loK5LD9POq+9BhQ3TnkGvs3D+rMguU0/bEOzs8Lts/VYxtL3
 BNF8P1rVCjK/w1wrL6HNUgVlUjUrvaF9I9fi+j0/uAh59VGUAkFJckYXXM5x9+VAdXr1
 J6tQ==
X-Gm-Message-State: AFqh2krNKIDrhm1IXO05FD2jiaapISeWh8mJTp77Nb6l0yC+EmoeI3fU
 zsdWJCqchbmcA2LEL5uf+hm4OAg/Y3+1Zg==
X-Google-Smtp-Source: AMrXdXuMOqMZfXlKzfA8V1/7NPgvYpz0Eqd6VrsraXmH/khTZ5qyE7Fe41dLGAMsb/OlMuAVe1q5+g==
X-Received: by 2002:a05:6214:1903:b0:532:2932:6205 with SMTP id
 er3-20020a056214190300b0053229326205mr27908496qvb.24.1673597986892; 
 Fri, 13 Jan 2023 00:19:46 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 w22-20020a05620a425600b006cbc00db595sm12362068qko.23.2023.01.13.00.19.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:19:46 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4d19b2686a9so147115067b3.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:19:46 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3489142ywb.47.1673597985912; Fri, 13
 Jan 2023 00:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
 <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
In-Reply-To: <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:19:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 8:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 13, 2023 at 09:46:49AM +0200, Laurent Pinchart wrote:
> > On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> > > This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> > > set for each/sh, making the driver dead code except for the COMPILE_TEST
> > > case.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > No objection from me.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> To expand a little bit on this, ARCH_SHMOBILE used to be set for the
> ARM-based shmobile SoCs too, until
>
> commit 08e735233ea29b17bfec8e4cb302e799d9f920b8
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
> Date:   Tue Aug 28 17:10:10 2018 +0200
>
>     ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol
>
>     All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
>     platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
>     to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
>     9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").
>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> merged in v4.20. The DRM shmobile driver's Kconfig entry wasn't updated,
> making it dead code indeed.

Note that it wasn't updated because this driver was not used on Renesas
ARM platforms, due to the lack of DT bindings and DT support, so it
didn't make sense to make it selectable.

> I haven't tested this driver in ages, hence my lack of objection, but
> someone may want to keep it for the pre-R-Car ARM SoCs.

Indeed, this driver should work with the R-Mobile A1 (which made it
into orbit, so we could call it the first member of R-Space ;-) and
SH-Mobile AG5 SoCs.  The major blocker is the lack of DT bindings.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
