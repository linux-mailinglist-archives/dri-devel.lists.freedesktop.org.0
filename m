Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64728F6B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 18:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51C6ED7D;
	Thu, 15 Oct 2020 16:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A976ED7D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 16:30:43 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a1.dynamic.kabel-deutschland.de
 [95.90.213.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEBD522240;
 Thu, 15 Oct 2020 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602779442;
 bh=UkrdZc47kC7Domj8uTDjSM10oqtJl1xRrFG4Y7ujeOg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jAycibV+0HW/YJR1j1AXWHsG+t4V70W9RF+Z7A1yJfkw1n/jtHkkNELqJN/8RorIK
 6RLAypqatDkt6B2V0lD81QpVQPH19DRUrRKSqtvSYnIl8IpAC/tY9jZDjauex+Za4v
 Iqn0/9Kl9fAYH2TQgN+TRGOIAnQYfaMBwhdy9zeE=
Date: Thu, 15 Oct 2020 18:30:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 00/80] htmldoc build fixes with Sphinx 2.x and 3.x
Message-ID: <20201015183036.1f3dca65@coco.lan>
In-Reply-To: <CAKMK7uH1uh+cO2=5ojtBhNYQmsrNOcM1qM8rsoHFaifx6v3dYA@mail.gmail.com>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <CAKMK7uH1uh+cO2=5ojtBhNYQmsrNOcM1qM8rsoHFaifx6v3dYA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Thu, 15 Oct 2020 17:49:23 +0200
Daniel Vetter <daniel@ffwll.ch> escreveu:

> On Tue, Oct 13, 2020 at 01:53:15PM +0200, Mauro Carvalho Chehab wrote:
> > This series actually folds the previous Sphinx 3.x patch series
> > with the other patches I sent fixing warnings with Sphinx
> > 2.x and with kernel-doc and that weren't merged yet via
> > some other tree.
> >
> > It is based on the top of upstream, plus the media
> > pull request I sent yesterday:
> >
> >       https://lore.kernel.org/lkml/20201012134139.0d58f5d7@coco.lan/
> >
> > My plan is to send a pull request with those patches after Thursday's
> > linux next release.
> >
> > On this series, I removed the patches that depend on material
> > currently found only at linux-next.  
> 
> Was a bit tricky to find the cover letter here and that you plan to
> send these out this merge window. 

Sorry for that. As this series touch lots of subsystems, just c/c
the maintainers mean more than 50 c/c to patch 00. Some e-mail
servers may not accept e-mails with too many c/c people. 

Yet, checking at the c/c list of the original patch, you were
copied on patch 00/80. So, maybe the e-mail server had silently
dropped the original e-mail.

> I think we'll have some confusion
> now with Alex from amd having picked up a few already.

I ended moving (at least part of) the drm patches from this
series into a second one, as I'm intending to submit most of
those patches today or tomorrow, and the remaining ones by the
end of the merge window.

> Anyway Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> for the
> remaining drm patches. 

Thank you!

> Although I can also pick them up to
> drm-misc-next (but that's going to be 5.11 or so).

It would be a way better to have them merged for 5.10, in
order to have a clean html build there.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
