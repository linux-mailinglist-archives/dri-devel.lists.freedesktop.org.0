Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A344519CB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBAC6E4F9;
	Mon, 15 Nov 2021 23:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371EF6E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:25:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BAAB61882;
 Mon, 15 Nov 2021 23:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637018754;
 bh=rGYlQyxDaD3rF9edRUkWserAGW/waRNxxYO5X77TR0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHNtf20mOE69yBjq72LUkrANiH0nkEAgcXR7+XtZn5SkPFrx8uLyyYouV+vaWhJdb
 evf224lm2E+vdylYG396rGdoKa0fYKULmw71l3rWcdMVh1MIPBP8qRCkbiGBDB1lNE
 NPvVTe6XjPhS3ShdrbAM/oYdLu4LA+DcQq6MeFE/2SiXN1AkiOZqUt0ISNdc9EDxM2
 3D3IxCQ8sjPwOXZng7CRhMsNaVyQk9u7d858/12Rh0W/5oIeLxWWx9v3q8Pan4AknW
 TksRUI9MN8a7f6x7p8wjWqwAyEu5TU0KzutxtdEOGAPKuf+8XRf6PUsVMkhvSufNbx
 gEFhF/ecEICoQ==
Date: Mon, 15 Nov 2021 17:30:58 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] fbdev: sh7760fb: document fallthrough cases
Message-ID: <20211115233058.GA116241@embeddedor>
References: <20211115063257.14369-1-rdunlap@infradead.org>
 <CAMuHMdWerZGYz_i8oBK4-ZC+AHZm8c0VW7CXDRX=2PxboWFZ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWerZGYz_i8oBK4-ZC+AHZm8c0VW7CXDRX=2PxboWFZ-w@mail.gmail.com>
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
 Rich Felker <dalias@libc.org>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Manuel Lauss <mano@roarinelk.homelinux.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 09:35:09AM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 15, 2021 at 7:33 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > Fix fallthrough warnings in sh776fb.c:
> >
> > ../drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
> > ../drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >   138 |                 lgray = 1;
> > ../drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >   143 |                 lgray = 1;
> >
> > Just document the current state of code execution/flow.
> >
> > Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Section 30.4.4 ("Data Format") of the SH7760 Group Hardware
> Manual confirms fall-through is appropriate here (especially for
> the odd 6 bpp mode).
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm taking this in my -next tree[1].

Thanks
--
Gustavo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp-misc-fixes
