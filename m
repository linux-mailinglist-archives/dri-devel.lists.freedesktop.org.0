Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD672A27CD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD786E480;
	Mon,  2 Nov 2020 10:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9C56E480
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:11:51 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id j14so1892947ots.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+MK4cFxcECMw6HaQcTaXJfFnCrPJFtRRdKUxORfYzc=;
 b=jj9CSEiCUUEDklSk5GoZqjgmGZH/YijPnsh5+4NJvrTCirjORqbsyuWHsEzPCB/pTs
 nRCbQICPepuzNDiekA1tah/uZlTjPoO71y49D15cnvsXMyQHBSrWhZtxctazfmAjxfGJ
 yWhXakrquNo0Ey8f2rmtfGWzwrkI8wgFWOp3TAKMJOoZQAEIxCuhdl9X6OcGC7d5njb3
 R1uvRnpShMyZc27kKF75vJBITPQQbFMd3cLqCU/8RfqM7WcUiTM+g9xbDlddHzw/2HjX
 t3Rep1rfcywBYQgYllvhIbOYpSZr+yv0TuQRSYYAFG9hPZsbnXwGQoi2yXXWbWhUNeGu
 xpCQ==
X-Gm-Message-State: AOAM533y2uibNvXweyyH4C1bbLm61l27lvvsM0SCagnMeKdi9EYOAQm9
 rS8hkGR2OezaiKI1auFOhKGzYNMgJpNDszciN+HCtkyftmtquQ==
X-Google-Smtp-Source: ABdhPJzvdcaJ88yitcdsElFUGOylbc5E2IpVL1qwbM9iBFgIynaN/FqgPkOQGBCqi1JIhXlcQqWWbP0FRWoNl3xLToY=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr11375849otc.145.1604311911293; 
 Mon, 02 Nov 2020 02:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
 <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
 <87mu0014kn.fsf@igel.home>
In-Reply-To: <87mu0014kn.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2020 11:11:39 +0100
Message-ID: <CAMuHMdX4dferHsLJ_z7GOC3R=LxZMKUBvhE-ff+jtw2H8x2MtQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
To: Andreas Schwab <schwab@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andreas,

On Mon, Nov 2, 2020 at 10:38 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Nov 02 2020, Geert Uytterhoeven wrote:
>
> > 95 ns?
>
> No, 95 MHz.

http://alive.atari.org/alive6/tt3.php agrees with you

But 95 MHz sounds too low to me, and doesn't match the monitor docs.
Given the TT runs at 32 MHz, 32 * 4 = 128 MHz sounds reasonable.

Michael?

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
