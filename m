Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081181105E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6F710E795;
	Wed, 13 Dec 2023 11:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C35A10E77E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:42:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 582DACE1DF5;
 Wed, 13 Dec 2023 11:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFCBC433C7;
 Wed, 13 Dec 2023 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702467732;
 bh=1vE/zzbxSADW+upL7QWLplgWH0pgOZiq9dOEA6CmitU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KndCDJnulYRqiJ3doUao0vYtq17Ji+F+E3huOFCgEVjKCQSusaPJF6sGxezj+zB03
 v57qlCpx5XoJbBrwuUcXCcqQRYv5bg8uZsdipbsSbYJ44xo4OzWJijSeH7gW4oyIPE
 Uf1jIuIJRSvegnP04aUIVL2CqE5aJM2G2Ezhix4QsrMB0vpSjAOO53YhyTJ2v3neSQ
 Klnk2TLdXhozpsA0payECkTpCtkUnkv0BdrHCwLiNoosRAc1V7I5J0h3um5wk/1a1A
 BLTAK/kiBegGEYOdv7yz3a4GgCeHCW6sHwXdIB6QXDIRlAtR+ZMRpkCB8X1cMZCXyi
 Yuf2szvDw7sqA==
Date: Wed, 13 Dec 2023 11:42:07 +0000
From: Lee Jones <lee@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/2] fbdev: Remove support for Carillo Ranch driver
Message-ID: <20231213114207.GJ111411@google.com>
References: <20231208224703.1603264-1-willy@infradead.org>
 <1f800b42-03a2-452e-b2a3-912250936413@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f800b42-03a2-452e-b2a3-912250936413@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Alan Hourihane <alanh@fairlite.co.uk>,
 Thomas Hellstrom <thellstrom@vmware.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andy Lowe <alowe@mvista.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Helge Deller wrote:

> On 12/8/23 23:47, Matthew Wilcox (Oracle) wrote:
> > As far as anybody can tell, this product never shipped.  If it did,
> > it shipped in 2007 and nobody has access to one any more.  Remove the
> > fbdev driver and the backlight driver.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >   drivers/video/backlight/Kconfig           |    7 -
> >   drivers/video/backlight/Makefile          |    1 -
> >   drivers/video/backlight/cr_bllcd.c        |  264 -----
> >   drivers/video/fbdev/Kconfig               |   15 -
> >   drivers/video/fbdev/Makefile              |    1 -
> >   drivers/video/fbdev/vermilion/Makefile    |    6 -
> >   drivers/video/fbdev/vermilion/cr_pll.c    |  195 ----
> >   drivers/video/fbdev/vermilion/vermilion.c | 1175 ---------------------
> >   drivers/video/fbdev/vermilion/vermilion.h |  245 -----
> >   9 files changed, 1909 deletions(-)
> >   delete mode 100644 drivers/video/backlight/cr_bllcd.c
> >   delete mode 100644 drivers/video/fbdev/vermilion/Makefile
> >   delete mode 100644 drivers/video/fbdev/vermilion/cr_pll.c
> >   delete mode 100644 drivers/video/fbdev/vermilion/vermilion.c
> >   delete mode 100644 drivers/video/fbdev/vermilion/vermilion.h
> 
> I've applied this patch to the fbdev git tree.
> It touches the backlight tree, so I hope it's ok for backlight people?

Better to ask for forgiveness than permission it seems! :)

-- 
Lee Jones [李琼斯]
