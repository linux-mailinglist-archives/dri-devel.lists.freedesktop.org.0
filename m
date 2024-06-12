Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EA905045
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7F10E03B;
	Wed, 12 Jun 2024 10:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="nAExHd22";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="s1YeLXkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod3-cph3.one.com
 (mailrelay1-1.pub.mailoutpod3-cph3.one.com [46.30.211.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B03510E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=af9tXlANVtlQwBmD+QdoVRddc7MbwnrlvWQxh4+FXXs=;
 b=nAExHd22AYzTdymX0eFUsjJ2mlWPhKSOdWtU0yVqH2bU9ovLQRKQeZhur+KfJ9CFef2wWc47Eb1wg
 woOvVerA19jBz+5gvLQEOBBtyke7o+GbIukjEuM3ZFXjpkaEcRfRSsbO5e2Apkledi0IcxtO6RpbyB
 QVjxpoYsI2Mh4yHhhzdKehjFYvAnjtfAP07u/G3JZzmhsgldRIlHn08Vj/yKZWjbyDzIlv0Ue+38LA
 H1SDzlwLvEI6KctWEaonN+QYNeUO17NX70Vm9iAfNb2NuWGsn5OsIsUE2DLVUcKwgDKX5Hlwd21HQ7
 7c4aw7cmCTxMos5o7CTNRG41oGsfTmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=af9tXlANVtlQwBmD+QdoVRddc7MbwnrlvWQxh4+FXXs=;
 b=s1YeLXkzSJLX/9K3+GaWebedmZYs8udZAJgDQJzsM/hyEHA4ts5BOcNk1YM3j2Pq+9DSbxCaHCu5j
 +qO1afiCQ==
X-HalOne-ID: 0c327bce-28a5-11ef-a645-bf3d7f4c9d3b
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 0c327bce-28a5-11ef-a645-bf3d7f4c9d3b;
 Wed, 12 Jun 2024 10:18:03 +0000 (UTC)
Date: Wed, 12 Jun 2024 12:18:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/17] backlight: Add BL_CORE_ constants for power states
Message-ID: <20240612101802.GA595554@ravnborg.org>
References: <20240611125321.6927-1-tzimmermann@suse.de>
 <20240611125321.6927-2-tzimmermann@suse.de>
 <20240611175544.GC545417@ravnborg.org>
 <736884a4-8077-422d-8877-6ac4af58a85b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <736884a4-8077-422d-8877-6ac4af58a85b@suse.de>
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

Hi Thomas,

On Wed, Jun 12, 2024 at 09:26:11AM +0200, Thomas Zimmermann wrote:
> Hi Sam,
> 
> long time no see.

Had some spare time between jobs, started on my new job last week.
Time will tell if there will be energy and time for hobby stuff.

> > 
> > On top of this - many users of the power states could benefit using the
> > backlight_enable()/backlight_disable() helpers, but that's another story.
> 
> Should I attempt to fix that? Many drivers appear to do something like
> 
>   props.brightness = ...
>   props.power = UNBLANK
>   backlight_update_status()
> 
> That's the same pattern as in backlight_enable().

I would keep the changes at a minimum, hoping someone else jumps in and
do the cleanup. Then you can keep the patches that remove the fbdev
dependency simple and easy to review (and thus get applied).
Maybe the obvious places, and do the simple replacement for the rest..

The drivers initialize and use the backlight properties in interesting
ways so that would require a bit more effort to implement and review.

I did it once for most of drm - but it was buggy so I ended up scrapping
the patches :-(

	Sam
