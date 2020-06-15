Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5731FA1C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 22:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21156E312;
	Mon, 15 Jun 2020 20:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212C6E312
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 20:38:51 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id t132so10179560vst.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 13:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/Mp7iKWT7GJmgr8/QHDR53t1KgWn8P7FwKRZ54fDz4=;
 b=nyQv9W0a7BcbzNqTfK4QHt1nuHWmFDxJhtl708ayOpYUemDeK7k75l5Bf93A91FNb6
 baIlDVjAqMEECZ3IJ25V9nnjghtCdIDkK0QLVxt4lVZH6ALhXhDsE9fqbI1PRIR05Hie
 5HjxZ6b5D7stefT+VAckIZlUB7XBoYTH2IPw71fkpWNYRXCOxD/o4d0Qe1q2nZ87zmdd
 98/uCSMolaEe9jGaVGM/3MbQC8GW4GmMMaZE73Rlu15AInwdzqJQQKC1cKCqGSfys/39
 oR2kRMx/Isi/I7sdkuJtBdnwSOsxIo/lIMbWkttPmAkuNYhdFW5+xg5b3WK6x/MZCUYE
 Zp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/Mp7iKWT7GJmgr8/QHDR53t1KgWn8P7FwKRZ54fDz4=;
 b=uOG3MgV7RBGSltggFByREvElqDYZAUBGIhNEfdgUmO+aFp0Etzr7+S4Ek8yEwfO+XU
 /5k4eHGaDJ3wRdTcxcDO4klbqLvw06jDOY1S58N+X70JR7BFxaPdmqv2PMiIfS2/ZfR3
 8oh2goE4Y/xrEQg4Xd9VZNWjTYW6HOgbQ1CN/NSdbHGJSg/w9Hw0okpjjJ4m7UJDwP7E
 cTguwsHLRG4EyQ1IORXCEcwGiUoimaF1qr+6s6nyr/Z2lUAOAF6L5ZS0Lem/n+ERWe09
 DGaIswWh1R/N2m4tRN6F9yLHKajby3sEOoyR+acJVYKCjS0Oc4ysRz2QSx+c2vKeZPVt
 Pp0g==
X-Gm-Message-State: AOAM531fjRNa2JyssTBaSt0y4VkdFSWYMzTLKPoq4iFibsacgIT9ekXq
 Ngl0/cu9Z4rT8Rnjp1IRvMFHMxlfgPI7JUJ/xK9yh4nY
X-Google-Smtp-Source: ABdhPJylTOxLG8Jwa648uPABoZk5EHApkaRAi7nl5VMQvz4nQKzBl2iyQVBq0cmqvnQMufm+VlBoYXAVYt/TWvSA0JA=
X-Received: by 2002:a67:3291:: with SMTP id y139mr21083280vsy.37.1592253530812; 
 Mon, 15 Jun 2020 13:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <839133dd-8ed4-5fec-c311-ce9f8abf3d5f@samsung.com>
In-Reply-To: <839133dd-8ed4-5fec-c311-ce9f8abf3d5f@samsung.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 21:35:10 +0100
Message-ID: <CACvgo50HieMRRb1kK3X0XWXtNmgidYi_OWW9DGCrxT+1q14RWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] video: fbdev: amifb: remove dead APUS support
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej,

On Tue, 2 Jun 2020 at 11:37, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
>
> On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:
>
> > These #ifdefs are relics from APUS (Amiga Power-Up System), which
> > added a PPC board.  APUS support was killed off a long time ago,
> > when arch/ppc/ was still king, but these #ifdefs were missed, because
> > they didn't test for CONFIG_APUS.
>
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/video/fbdev/amifb.c |   63 --------------------------------------------
>  1 file changed, 63 deletions(-)
>
A quick look through my checkout (drm-misc/next aka 5.8 ish), shows
multiple other places which check for the define.
And a single place where it's being set - the Makefile below.

Should those be addressed as well? Or perhaps they are and I've got an old tree.

HTH
Emil

$ git grep -c __mc68000__
arch/m68k/Makefile:1
drivers/block/floppy.c:2
drivers/ide/ide-probe.c:2
drivers/input/misc/hp_sdc_rtc.c:1
drivers/input/serio/hp_sdc.c:3
drivers/input/serio/hp_sdc_mlc.c:1
drivers/net/ethernet/i825xx/82596.c:8
drivers/tty/vt/keyboard.c:1
drivers/video/fbdev/amifb.c:11
include/linux/a.out.h:1
include/linux/hp_sdc.h:1
include/uapi/linux/a.out.h:1
lib/fonts/fonts.c:2
lib/mpi/longlong.h:1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
