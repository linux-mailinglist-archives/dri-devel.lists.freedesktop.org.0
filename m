Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58A30D4CE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D656E9D3;
	Wed,  3 Feb 2021 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8F6E923
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 15:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id DFE99243CA;
 Tue,  2 Feb 2021 10:15:55 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7YuhNWjVJSq; Tue,  2 Feb 2021 10:15:55 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id A3BDC243C7; Tue,  2 Feb 2021 10:15:55 -0500 (EST)
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
 <87k0s4ai33.fsf@vps.thesusis.net> <YBlfKgQ1laQLFqpW@phenom.ffwll.local>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
Date: Tue, 02 Feb 2021 10:13:14 -0500
In-reply-to: <YBlfKgQ1laQLFqpW@phenom.ffwll.local>
Message-ID: <87wnvqts9g.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Daniel Vetter writes:

> Just a quick comment on this: Since most framebuffers are write-combining,
> and reads from that tend to be ~3 orders of magnitude slower than writes
> (at least on the pile of machines I looked at here, there's big
> differences, and some special streaming cpu instructions to make the
> reading side not so slow).
>
> So scrolling by copying tends to be significantly slower than just
> redrawing everything.

I know this was the case years ago with AGP as iirc, it doubled ( 4x, 8x
) the PCI clock rate but only for writes wasn't it?  I thought this was
no longer an issue with PCIe, but if it is, then I guess I'll go ahead
with cleaning up the dead code and having it re-render with the larger
text buffer.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
