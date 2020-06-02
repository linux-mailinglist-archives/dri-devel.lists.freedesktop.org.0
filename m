Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58A1EBA04
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 13:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AEF6E143;
	Tue,  2 Jun 2020 11:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824736E141
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 11:04:50 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id v3so2078127oot.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 04:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SnU67PM5tYuOxOQ+ffnEXx7IP/EaDf221A3j8p4Bihs=;
 b=tm9ZZJbpzno3VGp/+R/xCzsAIOxh3q/DbXL/OA1PopZiivoFEiJh4GCi4G1fST/Tgg
 uFFMFAm7+SL2cZJ3dy0akwijRpXrLlHJwlSdHqmBEWu/WFYTUCfBzmrdNA0GW78kMVZ/
 mCRs+sMvlKOfyoUQJ2wRYb2JjWA6KRA7Qg4HMbAO5b0iZenAYp3NA9MIXtzFVrXRFySW
 1RWuPluJzhvdCOfJLWcJCgFARooIfzxMgGj29IUQz/zj8RIpRLJ8a/ZRvfMTFUhFcnhZ
 JLorETPWooeL0b6pv9W8mM87Lo0cNHSChm/JBXfWy4WY4/kpK6osJcHIEJOcJ2+sx2Gm
 r6kQ==
X-Gm-Message-State: AOAM531pGUX5ef4gfrSIa4gk+mkjtuJFVaj4Mqk8UadRlqDuk7JlAzjH
 xKbP+ajZdL4QcRoGq29HWKVxcnq37CZfHCmjwXs=
X-Google-Smtp-Source: ABdhPJx5LJM1BuqsyoFrXnT/JqbG5sPPQGLYtu772FLIRUMwlABs9hqY840TLSR+IxcpPBkOXCjVdX5M39D3Q54TX0I=
X-Received: by 2002:a4a:e295:: with SMTP id k21mr20587446oot.11.1591095884883; 
 Tue, 02 Jun 2020 04:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <839133dd-8ed4-5fec-c311-ce9f8abf3d5f@samsung.com>
 <72e0871c-d4bb-4887-4d6f-a60fd905bec1@physik.fu-berlin.de>
In-Reply-To: <72e0871c-d4bb-4887-4d6f-a60fd905bec1@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2020 13:04:33 +0200
Message-ID: <CAMuHMdXUD4PNndjtxz84pYMdXaM68g7vWiRd+Gf18a35T-oA=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] video: fbdev: amifb: remove dead APUS support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Tue, Jun 2, 2020 at 12:41 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 6/2/20 12:37 PM, Bartlomiej Zolnierkiewicz wrote:
> >> These #ifdefs are relics from APUS (Amiga Power-Up System), which
> >> added a PPC board.  APUS support was killed off a long time ago,
> >> when arch/ppc/ was still king, but these #ifdefs were missed, because
> >> they didn't test for CONFIG_APUS.
> >
> > Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > ---
> >  drivers/video/fbdev/amifb.c |   63 --------------------------------------------
> >  1 file changed, 63 deletions(-)
>
> What do you mean with the sentence "when arch/ppc/ was still king"?

Ah, Bartl copied that from my email ;-)

There used to be APUS support under arch/ppc/.
Later, 32-bit arch/ppc/ and 64-bit arch/ppc64/ were merged in a new\
architecture port under arch/powerpc/, and the old ones were dropped.
APUS was never converted, and thus dropped.

> Does that mean - in the case we would re-add APUS support in the future, that
> these particular changes would not be necessary?

They would still be necessary, as PowerPC doesn't grok m68k instructions.
Alternatively, we could just drop the m68k inline asm, and retain the C
version instead?  I have no idea how big of a difference that would make
on m68k, using a more modern compiler than when the code was written
originally.

Note that all of this is used only for cursor handling, which I doubt is
actually used by any user space application. The only exception is the
DIVUL() macro, which is used once during initialization, thus also not
performance critical.

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
