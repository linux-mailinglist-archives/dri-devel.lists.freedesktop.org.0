Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EDA8198E3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 07:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6737710E055;
	Wed, 20 Dec 2023 06:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Wed, 20 Dec 2023 06:59:48 UTC
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D7F10E055
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 06:59:48 +0000 (UTC)
X-HalOne-ID: 1db2c7e6-9f03-11ee-8462-a587b82ce961
Received: from mailrelay1.pub.mailoutpod3-cph3.one.com (unknown [104.37.34.38])
 by mailrelay3 (Halon) with ESMTPS
 id 1db2c7e6-9f03-11ee-8462-a587b82ce961;
 Wed, 20 Dec 2023 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=czDnAIGqZkpfvoL/iiaTcwjziBrJyFAvdctS7icVWtc=;
 b=WTEfw2kBTisB9iFEa9k6bTNf3ZeFtX6YS/mDbeFYMeHjQUFMj+djmcVbc1cef/pSFwCRLCub/jnhv
 2fHatP15emjbQbFiDThaWGqVzKmKZTqQ1B30zZ7bUqpGRIOScf1BV7XfkO0q+w/lvty/Pn0cL0On8W
 oqU+A1ANEhmyyXukEtwPJG+6D/eltnGFElclkTn/gw7ypdxput8jsuCt5HYFjedLwRgmL7k62wX2W5
 IiKKWdWv7A7Xvv0i7iN81LrU2MqpDrNWGFNT+dneqOhojAAtmAXX9/HCCeJ7aTlgviXPoBFtM6EX86
 AexoXyioyxNrhwepKSz3ee+qdLEEb0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=czDnAIGqZkpfvoL/iiaTcwjziBrJyFAvdctS7icVWtc=;
 b=I7V1QNB20dvpYRV1erNIT0+pk9yXU6uliif9Cl438drmSB++wNLblgBunf6TvAnxaAm4ycM59iEKF
 M4AyopcBg==
X-HalOne-ID: 1ce66959-9f03-11ee-964d-27feea414716
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 1ce66959-9f03-11ee-964d-27feea414716;
 Wed, 20 Dec 2023 06:43:43 +0000 (UTC)
Date: Wed, 20 Dec 2023 07:43:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 01/27] sparc32: Update defconfig to LEON SMP
Message-ID: <20231220064341.GA847783@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-1-64bb44b598c5@ravnborg.org>
 <2fc75a39-a6f4-42f4-ab09-d7622cb23b10@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc75a39-a6f4-42f4-ab09-d7622cb23b10@app.fastmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Dec 19, 2023 at 10:23:05PM +0000, Arnd Bergmann wrote:
> On Tue, Dec 19, 2023, at 22:03, Sam Ravnborg via B4 Relay wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> >
> > This is a copy of the leon_smp defconfig found in
> > gaisler-buildroot-2023.02-1.0.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Andreas Larsson <andreas@gaisler.com>
> 
> I did not get a cover letter for the series, but I looked at
You are listed as a receiver?!?

It can be found here:
https://lore.kernel.org/sparclinux/20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org/T/#m2fc5b3c23331efd12492a61ba39ac000a563ac52

> all 27 patches and they all look good to me, nice cleanup!
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
Thanks!

	Sam
