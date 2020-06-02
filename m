Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7291EBB26
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30FD6E084;
	Tue,  2 Jun 2020 12:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873D6E084
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:03:24 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id z9so11786452oid.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncUahkMlR8RcEuHvwU1aMqYYdzOJso8KWIzaPU8BmKE=;
 b=WTwza9oXUGcXxisNXelqVMtiY4njU6dTqH0DEO2nrMt9WSMRsndb3WiUMvMFCRXoo0
 rak6LES34IUjmk/+DNoKQv8UhAo/y1oJGhTuWYU21RfyDedmpnS+uOYIIoY8fB1amiuo
 hDdsCfPgfirXYx1g9fQP7yX6zwFYqMKf9Zmny7fhjpZMD4m1HcrXGk6kUVwkoD5DQtCf
 /K5lSqHA//+4lJ+y4pK2GtSk+2oNgfIa7lx6b7hFCBuaeOW0MpdI/nMkAL4Fk6L3Ealp
 9iyPBpAHoRVvt4Xnvolm4AzavhBygxTRUJQM0Zw63W4ViCu4i3U3eBHpCUoBdmjibRMI
 EXnQ==
X-Gm-Message-State: AOAM532jjji5uF162CblGAbX84u2nssvHyE4Rj7LEvjQDa7fIQkI4hoZ
 +CU3Uel1Z+K4VNVPEHuoLsfmGi9A8uZSQzDOv/g=
X-Google-Smtp-Source: ABdhPJzEcQPMgPom1yIf3zWleRm3zOSF/oQgx5/HyuKONRP9TVyRubZN2n1LbmblaEecYiJrxwiFTA/boKIBcGBzwjs=
X-Received: by 2002:aca:644:: with SMTP id 65mr2609554oig.148.1591099404240;
 Tue, 02 Jun 2020 05:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
In-Reply-To: <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2020 14:03:12 +0200
Message-ID: <CAMuHMdWac+YE3qr0CTepn5K24tGZq0VHuQDGg-yUOHW1rJDbbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] video: fbdev: amifb: add FIXME about dead APUS
 support
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 1:50 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:
> > These #ifdefs are relics from APUS (Amiga Power-Up System), which
> > added a PPC board.  APUS support was killed off a long time ago,
> > when arch/ppc/ was still king, but these #ifdefs were missed, because
> > they didn't test for CONFIG_APUS.
>
> Add FIXME about using the C code variants (APUS ones) in the future.
>
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
