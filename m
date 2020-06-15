Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC41FA2C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1616E512;
	Mon, 15 Jun 2020 21:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247DA6E512
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 21:27:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g5so14302743otg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JKk9UUE7zWHt2Qbqb1KWLAlQZOdKvtSR2tBzDwT+0k8=;
 b=PT6caG5wJ3wJmHFzFpmAq/3XqmQYn157f5ybCoTc121plm305bQMiKqodwxFs7zt4Z
 i6p0i5Rlhevj1aa+csT/4NMIAOjsCAJdlGUjgomwC6qVz53iV2ShjKT5xQYpGVUyQshq
 tl5K2aL+LuFiAhXYCJ/0EsygHWtLH+4vvYDYuwgRh4fqijcsK7V6AqilEjcehtGySPjq
 fPLDblmvuHWIWjsQS5viOEOvZD+k9ht9a6Hm0Qjd8mfUnO+FmpngRJB5x6cblsTAkZBa
 hfaKV1ngfflBFN8TQNiyhGPqmcDgpaST5RNl9IjegHkBQCjlvzOZcXIGNvlcgSvZSmSr
 XTXA==
X-Gm-Message-State: AOAM532BSSDYmQCk7aGyT0O1tbqsI9gIgfo4iRNzYCkNEpuF5zDVfLBt
 Yo0pOSiDgh0ZwabdOrav5pf2lvipbK8LGFr8t0Q=
X-Google-Smtp-Source: ABdhPJwKxe804YeQ//bJYzoHJeWs8CG/0trTL80DIjWDkyez4zqA0qZwYwo00/BGcss3dh2WBXmGGTuL56+epTo47PI=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr21760685otr.107.1592256429423; 
 Mon, 15 Jun 2020 14:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <839133dd-8ed4-5fec-c311-ce9f8abf3d5f@samsung.com>
 <CACvgo50HieMRRb1kK3X0XWXtNmgidYi_OWW9DGCrxT+1q14RWQ@mail.gmail.com>
In-Reply-To: <CACvgo50HieMRRb1kK3X0XWXtNmgidYi_OWW9DGCrxT+1q14RWQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2020 23:26:58 +0200
Message-ID: <CAMuHMdVpT1oCg0LuQXHdoZg-nQTFfk7ZUs=qm+S2oARaPb5DTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] video: fbdev: amifb: remove dead APUS support
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On Mon, Jun 15, 2020 at 10:38 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> On Tue, 2 Jun 2020 at 11:37, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> > On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:
> > > These #ifdefs are relics from APUS (Amiga Power-Up System), which
> > > added a PPC board.  APUS support was killed off a long time ago,
> > > when arch/ppc/ was still king, but these #ifdefs were missed, because
> > > they didn't test for CONFIG_APUS.
> >
> > Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > ---
> >  drivers/video/fbdev/amifb.c |   63 --------------------------------------------
> >  1 file changed, 63 deletions(-)
> >
> A quick look through my checkout (drm-misc/next aka 5.8 ish), shows
> multiple other places which check for the define.
> And a single place where it's being set - the Makefile below.
>
> Should those be addressed as well? Or perhaps they are and I've got an old tree.

Only the above apply to APUS support.
All other below are probably legitimate.

> $ git grep -c __mc68000__
> arch/m68k/Makefile:1
> drivers/block/floppy.c:2
> drivers/ide/ide-probe.c:2
> drivers/input/misc/hp_sdc_rtc.c:1
> drivers/input/serio/hp_sdc.c:3
> drivers/input/serio/hp_sdc_mlc.c:1
> drivers/net/ethernet/i825xx/82596.c:8
> drivers/tty/vt/keyboard.c:1
> drivers/video/fbdev/amifb.c:11
> include/linux/a.out.h:1
> include/linux/hp_sdc.h:1
> include/uapi/linux/a.out.h:1
> lib/fonts/fonts.c:2
> lib/mpi/longlong.h:1

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
