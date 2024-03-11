Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637E87869F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187FF10E954;
	Mon, 11 Mar 2024 17:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="V7yP0SMK";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="nS1rWewz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod3-cph3.one.com
 (mailrelay1-1.pub.mailoutpod3-cph3.one.com [46.30.211.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B0110E1D4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cd5g7+y3ZJJCh2Ko+xCMBEZ+m4kbDCL/fdaw/LYfBo8=;
 b=V7yP0SMKbtgW1/HQYCOzC88dDIeiQDR2Ols3pu6JLi17oRPwJyP2/PaicGD4OjxZngIUcb3JaUQg6
 vAwkp8FiBv58goGE3h6vex+GEXo5WLLp1G0/IcHBC9vQYgRlp852LiD+c0eKSza2vdgF4yMh1bmcfP
 PiF/bnUtIcH+ABSO+CJTZnvKLreabOzhsT7cE0lpeP0YQMCGeYLUrb0zHfwEr6TKykJaUqqhp8fqrz
 3jdnm/+lvXEUco7FgFCmoFDFSLyxNoOwZ4T/HV/51c3onW24oZaKZHdwiNSUKTs3hVlvYu94UYgbC5
 fGk0kFjSIRt2l6TwkcX31WZGQ87b2nA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cd5g7+y3ZJJCh2Ko+xCMBEZ+m4kbDCL/fdaw/LYfBo8=;
 b=nS1rWewzFdGnrHoc1+TIrcLhB69z5yEplIxJH+LbMmLD1HhpYnBKAKBpO7Dyn2rNeb/sLg+/4KKdR
 oCgyyaDCA==
X-HalOne-ID: 6f272b20-dfcf-11ee-93aa-1ff1563c5748
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 6f272b20-dfcf-11ee-93aa-1ff1563c5748;
 Mon, 11 Mar 2024 17:47:32 +0000 (UTC)
Date: Mon, 11 Mar 2024 18:47:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kjetil Oftedal <oftedal@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 28/28] fbdev/p9100: Drop now unused driver p9100
Message-ID: <20240311174731.GB1369531@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
 <20240309-sunset-v2-28-f09912574d2c@ravnborg.org>
 <e387ad3c-7646-49b6-a5f5-afd287556d8c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e387ad3c-7646-49b6-a5f5-afd287556d8c@app.fastmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Mon, Mar 11, 2024 at 03:05:25PM +0100, Arnd Bergmann wrote:
> On Sat, Mar 9, 2024, at 19:15, Sam Ravnborg via B4 Relay wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> >
> > The p9100 driver is only relevant for the Sparcbook 3 machine,
> > and with sun4m support removed this driver is no longer relevant.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Acked-by: Arnd Bergmann <arnd@kernel.org>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Andreas Larsson <andreas@gaisler.com>
> > Cc: Helge Deller <deller@gmx.de>
> > ---
> >  drivers/video/fbdev/Kconfig  |   8 -
> >  drivers/video/fbdev/Makefile |   1 -
> >  drivers/video/fbdev/p9100.c  | 372 -------------------------------------------
> >  3 files changed, 381 deletions(-)
> 
> I tried to figure out if there are other drivers in the same
> category and found the list at
> https://everything2.com/title/Sun+graphics+cards
> 
> As far as I can tell, the only SBUS graphics that were
> shipped on sparc64 are FB_FFB and FB_CG6, so we could
> go further and remove BW2, CG3, TCX, CG14 and LEO as
> well.

Looks like you are right, so we can drop more - good.
As you already wrote - let's get the current patch set processed first.

I did a quick hack on top of my current sparc32 patches.
This is nice reduction of ~2700 lines and 5 fbdev drivers less to care
about.

	Sam
