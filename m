Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4E860FED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9D710EBA9;
	Fri, 23 Feb 2024 10:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="phxydC6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9010EBA8;
 Fri, 23 Feb 2024 10:56:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B91E86345A;
 Fri, 23 Feb 2024 10:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E60FC433F1;
 Fri, 23 Feb 2024 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708685818;
 bh=wpuR+EilBGzruVMBpMve5kxH6P2DEnFv9bDGobFvHBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=phxydC6iNaesOvsAy4b3GQ9bBiLI0UKgfGTzH5GBzMYCXrYN1Hmlvc6u5VjuZxP/t
 JQNDJOKk80ofPt4yKF0qKrQmAzOzK7p1OLYazAvmAYwTR2yneN00C60K/Mw5L/I2jM
 Ih5JiaSo1GBcuSjELOod0ZUqVjdb8mWkXts1qLUirg5gczIdlxe+YOr0pIziRDR46f
 Gev1EsdXG/PTfJQb0DV9DwW7oH3fYn9mbsHAnnyQL5fO2j3htBvpSbjrSo5Y5a6XQV
 OeEVg5geBlspbPGxiaUbpTtrsHEnIQ3nnXB5vWGBuLDwJANGfqk+RT3QkFyFJIhJem
 D5z5Sn8wpU1Ow==
Date: Fri, 23 Feb 2024 10:56:52 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/9] backlight/corgi-lcd: Include <linux/backlight.h>
Message-ID: <20240223105652.GT10170@google.com>
References: <20240219093941.3684-1-tzimmermann@suse.de>
 <20240219093941.3684-2-tzimmermann@suse.de>
 <1e577f18-c6f7-44e7-b50f-720915f257eb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e577f18-c6f7-44e7-b50f-720915f257eb@suse.de>
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

On Wed, 21 Feb 2024, Thomas Zimmermann wrote:

> cc'ing backlight maintainers

I cannot review/accept patches like this.

Please submit a [RESEND].

> Am 19.02.24 um 10:37 schrieb Thomas Zimmermann:
> > Resolves the proxy include via <linux/fb.h>, which does not require the
> > backlight header.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   drivers/video/backlight/corgi_lcd.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
> > index 0a57033ae31d1..dd765098ad989 100644
> > --- a/drivers/video/backlight/corgi_lcd.c
> > +++ b/drivers/video/backlight/corgi_lcd.c
> > @@ -11,6 +11,7 @@
> >    *	by Eric Miao <eric.miao@marvell.com>
> >    */
> > +#include <linux/backlight.h>
> >   #include <linux/module.h>
> >   #include <linux/kernel.h>
> >   #include <linux/init.h>
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Lee Jones [李琼斯]
