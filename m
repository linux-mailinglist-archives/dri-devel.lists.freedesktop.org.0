Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345367D10B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 17:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11510E2B3;
	Thu, 26 Jan 2023 16:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE6B10E2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
 b=Qus+ZU4RfOcNTS5rGnxfoQBcYpzPyF+aRz3PIQVZfjvTUjFpmtXeWmvp4rw3S7WD4kIU1isAjNCvI
 qUFaf54lfngcQlsAyzn24QB3jg6dJQZkwRy6ly958KbRgFoeCt50M1sQ+1V2A0na3zKwfSSZ+BYCfi
 svYtBApqryHA65/AytjF3mjQIlcOArwXu3tumrruNQocjmqLszEyWasAT29despRAzu0aObcNzXFBK
 v0ytzr0e6G8s8tDhyint0ydbcValxEsn4ABDRtgPQ0br5+OrWW6rVQPIsnBDgzQ8nRQ8WiuKVDc8U0
 nHkv92BxdqWcfXVuUnCtBBmCycCDUXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
 b=52qvCSVoaxzKZeZmgUDnZYFeQCCVuo6KfDcOqqSiktTnnPsDDyAxqd+8jTSlziHCfI76MLtMpL0Iy
 vITTQDACA==
X-HalOne-ID: 27718327-9d94-11ed-b665-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 27718327-9d94-11ed-b665-7703b0afff57;
 Thu, 26 Jan 2023 16:11:58 +0000 (UTC)
Date: Thu, 26 Jan 2023 17:11:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9KmTFl5YbypgMZy@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y9KNziZJxMjCffbs@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9KNziZJxMjCffbs@google.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,
On Thu, Jan 26, 2023 at 02:27:26PM +0000, Lee Jones wrote:
> On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:
> 
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > With all users gone remove the deprecated fb_blank member in
> > backlight_properties.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > ---
> >  drivers/video/backlight/backlight.c |  2 --
> >  include/linux/backlight.h           | 22 ----------------------
> >  2 files changed, 24 deletions(-)
> 
> Applied, thanks

Some of the dependent patches in this series are not yet applied.
I have them queued up for processing this weekend, but I missed the -rc6
window for drm-misc so they will likely not hit upstream in the upcoming
merge window.
I can try to expedite it.

But if you have not yet pushed it, please revert this patch.
Then I will resend only when the remaining patches are upstream.

	Sam
