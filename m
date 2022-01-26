Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE02049C54C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571D610E56B;
	Wed, 26 Jan 2022 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6410E56B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:31:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 613F9B81C11;
 Wed, 26 Jan 2022 08:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44118C340E7;
 Wed, 26 Jan 2022 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643185885;
 bh=5XhiZ9KX1O+6kUkna4BitOhkQ8ITLiIjnAMjcJq/erA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ulYF2aCwDeYsDSKdzal7qDeMVH8cUyYiRLAB9ET7S50sbVis5gDUOO6oBhAk0ZiaF
 SaoD1q/qMWN2CmDguFhFPlpE5IMHIDsbgQOk0y5r46raaWZ7EY0NY8cKcZSmT60Jl+
 pTiO25aD0DFIFJgJrJLxp8MPUO7RvYWovnOaq0WA=
Date: Wed, 26 Jan 2022 09:31:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfEG2qVO9K9G+g1d@kroah.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> Let's maintain occasional fixes to the fbtft driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..16e614606ac1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7372,9 +7372,11 @@ F:	Documentation/fault-injection/
>  F:	lib/fault-inject.c
>  
>  FBTFT Framebuffer drivers
> +M:	Andy Shevchenko <andy@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-fbdev@vger.kernel.org
> -S:	Orphan
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git

I'm ok with the files moving if the dri developers agree with it.  It's
up to them, not me.

thanks,

greg k-h
