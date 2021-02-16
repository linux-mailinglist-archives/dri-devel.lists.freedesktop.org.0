Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30B31C763
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 09:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F0389B38;
	Tue, 16 Feb 2021 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A6789B38
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:35:04 +0000 (UTC)
Date: Tue, 16 Feb 2021 09:35:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1613464501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=70lHKWgGoo6VhWpcJ2+NWE0z9250K2X/fg1wAF15xQY=;
 b=VWc85enQJ61K6OOs/SQq/iNUmiLwb6Dc7J87qef8XIH6433NQrGrEMuKkiEYLAYZMM96oy
 uJlPxQUzSmZQKMngJzvDvL6a7KsiaYHX41TZYeBCPqtTueGstCWopPnpjEGyFsQbI+ZGvc
 mEXLCwAmHQRWEJ48O/t+Bt4vMVSJ0XYpjq5n5+4j///Nfe+zlzrYDVJB2ZuxnaYpAqaVdy
 aaI17acCV7Abk6lSRHvS1vjpnEg5frbhKHGEzkOjPVAlAnsJCDK0oI4yZjF5jLKTDmF/om
 Gif4fHEo43ATe7RUIAHTsp0YhK8XFrMlHsxobTrFi1jmjMl+DpQ4NHk72kItKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1613464501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=70lHKWgGoo6VhWpcJ2+NWE0z9250K2X/fg1wAF15xQY=;
 b=EZQfdGrnk0Aq3GZa/wBny+XqOkAwEcFy9iNQ/ifeGFwHfm/cRGj5wOklP6k2A5mh6MTDIb
 MMaqq/EVDJgDZECw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 0/3] video: Remove in_interrupt() usage.
Message-ID: <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208223810.388502-1-bigeasy@linutronix.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-08 23:38:07 [+0100], To linux-fbdev@vger.kernel.org wrote:
> Folks,
> 
> in the discussion about preempt count consistency across kernel
> configurations:
> 
>  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> 
> it was concluded that the usage of in_interrupt() and related context
> checks should be removed from non-core code.
> 
> In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> driver code completely.
> 
> This series targets the video subsystem. The omap patches are a repost
> of [0], the amba-clcd is new after I received no feedback on my analysis
> [1].
> 
> [0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
> [1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de

Could someone please apply the series? Video seems unmaintained.

Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
