Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1231C773
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 09:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691D589D6C;
	Tue, 16 Feb 2021 08:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9B89D6C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:43:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AF9164E04;
 Tue, 16 Feb 2021 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613464985;
 bh=Wayio7irTNKnLE43e7gB8L7kpLaXwLsdFHBc2FXaHxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PyLo6K+MinGD6a+Q8i48Zt4xk+joDe6j5yvQFkeWpdIqPchl02HF1hwiGbb8bujUR
 Nz+U75F+pCUYaSk9qA/E/m4OP7AHN//1kgtZ3EKdUNV2frfT+Dl5Af5Wtn6Wtheryc
 hj9Vi7w2kA4viZJyqe1jcRM/cgsvVh5X2q9fdBS8=
Date: Tue, 16 Feb 2021 09:43:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/3] video: Remove in_interrupt() usage.
Message-ID: <YCuFli/TEl6gysTb@kroah.com>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
 <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:35:00AM +0100, Sebastian Andrzej Siewior wrote:
> On 2021-02-08 23:38:07 [+0100], To linux-fbdev@vger.kernel.org wrote:
> > Folks,
> > 
> > in the discussion about preempt count consistency across kernel
> > configurations:
> > 
> >  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> > 
> > it was concluded that the usage of in_interrupt() and related context
> > checks should be removed from non-core code.
> > 
> > In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> > driver code completely.
> > 
> > This series targets the video subsystem. The omap patches are a repost
> > of [0], the amba-clcd is new after I received no feedback on my analysis
> > [1].
> > 
> > [0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
> > [1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de
> 
> Could someone please apply the series? Video seems unmaintained.

It's the merge window, no one can apply the series...

Please resend once 5.12-rc1 is out.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
