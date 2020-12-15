Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAA2DAA7B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 10:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4496E185;
	Tue, 15 Dec 2020 09:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502766E185
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 09:59:04 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j20so14294578otq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 01:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tYDUx6SI753W7Hldtg8DzizZYg8W92/yzDFr2NF0Jc=;
 b=gTC6LoRHc43MBTbZlnX8BAsknS69Kf8Et97EgeTrEAsh/Sl05kYiGivLWSiZKq+LKn
 JGQfs7r5Kldu1HiO9mn7IYzmpcTLjXzSGbZ7zKVePIkHqKomOP3m7WnJ9/YEBu2X9cti
 YVrnIx1srPlO6H2wCzemZzLmnpiwBk09sWlnu8SzLkv+0dXaR4yZYJtqae/QoNHH5FSj
 9CPsCMc1kvHjYWtDMKz18/OL0635BCJZxYqyCxf0AQYArv2U6BP7P5kXCVf6bh1rDPiy
 e/6U7+VruJYmYzgXalfPMY0Wb8DCje0+f4irk/5vRT7bTpsp0sIWpg2J/SKehwlKdbEf
 MjZw==
X-Gm-Message-State: AOAM531IlLkKTi/qAWc30yzp5SDYiXxe0R/T0vHMibJ2QRTf8m2TG9p2
 gKzGLo4SymYPxt5oAKAriySLCTZrlYp5RlrA+mw=
X-Google-Smtp-Source: ABdhPJyyNRhC2Vw49xndoQcAupIZbC+RrIVipadrop2ecq63H3T7mySSTLO496si4WWnsrh5cgZ2HmOOGuWj5wTt9T0=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr22660508ota.107.1608026343634; 
 Tue, 15 Dec 2020 01:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20201214135453.16e76e9d@canb.auug.org.au>
In-Reply-To: <20201214135453.16e76e9d@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Dec 2020 10:58:52 +0100
Message-ID: <CAMuHMdWYBLqUVRyNRbOZm=oxv+_uLJ9FK6ebPPvgHcN4Y-YUSQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the crypto tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Crypto List <linux-crypto@vger.kernel.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Mike Healy <mikex.healy@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 2:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   MAINTAINERS
>
> between commit:
>
>   885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")
>
> from the crypto tree and commit:
>
>   ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc MAINTAINERS
> index 3b358262de8f,eb18459c1d16..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

> @@@ -8985,16 -8962,13 +8993,23 @@@ M:   Deepak Saxena <dsaxena@plexity.net
>   S:    Maintained
>   F:    drivers/char/hw_random/ixp4xx-rng.c
>
> + INTEL KEEMBAY DRM DRIVER

Is it KEEMBAY?

> + M:    Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> + M:    Edmund Dea <edmund.j.dea@intel.com>
> + S:    Maintained
> + F:    Documentation/devicetree/bindings/display/intel,kmb_display.yaml

I was just going to comment about "intel,kmb_*" vs. "intel,keembay-*", until
I noticed intel,kmb_display.yaml does not exist, but is called
Documentation/devicetree/bindings/display/intel,keembay-display.yaml
in next-20201214.

> + F:    drivers/gpu/drm/kmb/
> +
>  +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER

or KEEM BAY?

Or Keem Bay? Keembay? KeemBay?

All of them are present in next-20201214.

>  +M:    Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>  +S:    Maintained
>  +F:    Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml
>  +F:    drivers/crypto/keembay/Kconfig
>  +F:    drivers/crypto/keembay/Makefile
>  +F:    drivers/crypto/keembay/keembay-ocs-aes-core.c
>  +F:    drivers/crypto/keembay/ocs-aes.c
>  +F:    drivers/crypto/keembay/ocs-aes.h
>  +
>   INTEL MANAGEMENT ENGINE (mei)
>   M:    Tomas Winkler <tomas.winkler@intel.com>
>   L:    linux-kernel@vger.kernel.org

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
