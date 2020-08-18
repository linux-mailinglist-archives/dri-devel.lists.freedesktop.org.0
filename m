Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6C24876B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB4589C59;
	Tue, 18 Aug 2020 14:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730889C59
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:26:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0849420786;
 Tue, 18 Aug 2020 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597760803;
 bh=v9wmnCwZq0StdpyeVbz/jpUx2XM7rEEGCM62t/WKJyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jf5UOYbhgw+HeH7fm80qH8g2TIEWJwBDXi1tq+w5sxCZxE6ylbB5bcWNRqaWnsfGs
 4ZiPAdVmVIm7Vk+GQEJqJ64+5k/Btm1RLbK5bkfmCDhh4rdCHC2OM1bzdDIVUmeEHT
 +DcsdbGIWIeUBExsz3ayrfFHzrLgZ2uaSccLxZiA=
Date: Tue, 18 Aug 2020 16:27:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomer Samara <tomersamara98@gmail.com>
Subject: Re: [PATCH v2 1/4] staging: android: Replace BUG_ON with WARN_ON
Message-ID: <20200818142707.GA626703@kroah.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
 <fd55c53cb20c4887a87c05fffa28c28a740cd314.1597602783.git.tomersamara98@gmail.com>
 <20200818141106.GB562377@kroah.com> <20200818141940.GA357037@tsnow>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818141940.GA357037@tsnow>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Riley Andrews <riandrews@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 05:19:40PM +0300, Tomer Samara wrote:
> On Tue, Aug 18, 2020 at 04:11:06PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Aug 16, 2020 at 10:23:25PM +0300, Tomer Samara wrote:
> > > BUG_ON() is replaced with WARN_ON at ion_page_pool.c
> > 
> > Why?
> > 
> > > Fixes the following issue:
> > > Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().
> > 
> > Ideally you can get rid of WARN_ON() too, right?
> > 
> > Many systems run in panic-on-warn mode, so this really does not change
> > anything.  Try fixing this up properly to not crash at all.
> > 
> You mean by that to just remove the WARN_ON and leave the condition the
> same?

Or fix the problem that could ever cause this check to fire.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
