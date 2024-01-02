Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E89821F95
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 17:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126A110E1C9;
	Tue,  2 Jan 2024 16:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4956210E1C9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7pKpo+sBmuDRPGTAU7DR6NOpi4cHG/Pa0KfY/BWs7xs=;
 b=iz2gtZvep5v6iWlxT8TmXRPOqebPYxEz+YLB1YV3J8ky/wKDiC5dKO8fQiOxOnqvi496xq/C7/qbZ
 3kD3ap+RVx35g21stU3T+o3TyLQ3MpdPDf9NWxk7qdJ/A1hNu639hmFCwORV24DHHkkhIu4VKM4+DD
 12UNSYbvU8UCyij0+Grw9Aa3r1Ax+10yTFsgF2isq9KJoQZKCLFFF3ya6JJSG59enlCC7onpm72Dti
 2soGMgllhhvDgCorop3JZKLsIb1PI/EyaJrupT2WJgP1BSkv8MZXcecP3DUV2ozeUGeIwTUe3PZ5WQ
 DL1Budqpvs+iu/qNaaNvAtnFzeJ6oMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7pKpo+sBmuDRPGTAU7DR6NOpi4cHG/Pa0KfY/BWs7xs=;
 b=ppjdj+bJv/kc4DB+tSOE73nHayIzOdvYjIV/deteqz8MnseJSyC3Q0Wluu76AS3imkD5hMqr+O2Aw
 FMclUj+CA==
X-HalOne-ID: 5539e9de-a98c-11ee-8a73-2dc64a403fa2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 5539e9de-a98c-11ee-8a73-2dc64a403fa2;
 Tue, 02 Jan 2024 16:31:10 +0000 (UTC)
Date: Tue, 2 Jan 2024 17:31:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 27/27] fbdev/p9100: Drop now unused driver p9100
Message-ID: <20240102163108.GA564954@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-27-64bb44b598c5@ravnborg.org>
 <0fc5ba5d-4513-48b5-bde9-3eb311cdc535@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fc5ba5d-4513-48b5-bde9-3eb311cdc535@suse.de>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jan 02, 2024 at 09:26:27AM +0100, Thomas Zimmermann wrote:
> Hi Sam
> 
> Am 19.12.23 um 23:03 schrieb Sam Ravnborg via B4 Relay:
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > The p9100 driver is only relevant for the Sparcbook 3 machine,
> > and with sun4m support removed this driver is no longer relevant.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Andreas Larsson <andreas@gaisler.com>
> > Cc: Helge Deller <deller@gmx.de>
> 
> Thanks for cleaning up.
> 
> Ack-by: Thomas Zimmermann <tzimmermann@suse.de>
Thanks.
> 
> if the series is accepted.
As you may have seen there is a maintainer vacuum at the moment :-(
That holds up clean-up a bit, and I cannot find the motivation/time
to offer it myself at the moment (no sponsor for this type of work).

	Sam
