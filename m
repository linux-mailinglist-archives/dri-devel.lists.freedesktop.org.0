Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD66691D3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A668B10E9C5;
	Fri, 13 Jan 2023 08:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AFD10E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:54:07 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id t7so14445951qvv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHH87Wz4eqdDYk3yPRdInSdOf4/Qu/uaLfX4LZwjHtY=;
 b=Pu9BnplqW+IlNQ8I4RNP5R6RkYY2Ivuh7/OzivsrUE71kOSCx+p2Ss1M8KcMvWJUxG
 0bASUQrYyb0Qt67lAWSJTapcNwPCLl0SGFp+o35/ucToYJvrENgd5S6FpENrttwoGETg
 fFgdr4wiUwKiwZA3vxV/PH+vp+Ny1mFIQ5hii5Gj8CID/HkKkbYz8Qs8Jmom1K5m615t
 a97asrBlZsWc7b8S5vTXX7r/KkL1pqA5pOSh5jZy7ilvvsrgr1E8ul6R3Q9+Z9hjLnkg
 Ft7cWjHeJkOUGE5OQwKtWrVVZ4pVq9+SaZuFscQWc9WugCE0fJEYB+9L0G1Axomstml4
 nmdg==
X-Gm-Message-State: AFqh2kpwvL7FZM6GqWYCKcIYHpbFSpIBBURC7U3AdAo95tffU+iMfINS
 TzgM9nd/Sspo67j5iN6B754tTAtnnSKm8A==
X-Google-Smtp-Source: AMrXdXushjcPR3EKj9Bt3o3Ppa3BO4CnRGqVfTM/JR89L8s1gQHW02SNe3tUFsYMBxhpteUAVP683w==
X-Received: by 2002:a05:6214:3d9e:b0:532:1518:2a66 with SMTP id
 om30-20020a0562143d9e00b0053215182a66mr47868124qvb.0.1673600046747; 
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05620a24cf00b007055dce4cecsm12546361qkn.97.2023.01.13.00.54.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id o75so21643935yba.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:54:05 -0800 (PST)
X-Received: by 2002:a25:d095:0:b0:7b6:daae:ad50 with SMTP id
 h143-20020a25d095000000b007b6daaead50mr3261996ybg.89.1673600045570; Fri, 13
 Jan 2023 00:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-20-hch@lst.de>
In-Reply-To: <20230113062339.1909087-20-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:53:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Subject: Re: [PATCH 19/22] fbdev: remove sh7760fb
To: Christoph Hellwig <hch@lst.de>
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
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

On Fri, Jan 13, 2023 at 7:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1861,7 +1861,7 @@ config FB_W100
>  config FB_SH_MOBILE_LCDC
>         tristate "SuperH Mobile LCDC framebuffer support"
>         depends on FB && HAVE_CLK && HAS_IOMEM
> -       depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +       depends on ARCH_RENESAS || COMPILE_TEST

Nit: this part should be a separate patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
