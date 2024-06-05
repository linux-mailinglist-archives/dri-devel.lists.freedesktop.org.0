Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84D8FCD6D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0610E7B2;
	Wed,  5 Jun 2024 12:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ILOFt2xD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393F10E7B2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 12:42:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 182BD617C4;
 Wed,  5 Jun 2024 12:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84BDC3277B;
 Wed,  5 Jun 2024 12:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717591361;
 bh=JbMspYh1b0RcaRaZ4nSseQoB5VDk9OVF1ggAJwKyX0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ILOFt2xD7wv3XSFL/Cri4khqdWptym7ANOG/4VoOSIU6GYv/imhzyE0nDIi5OcTH7
 2WKMz29L/Imc4RyomBpYlSaP4T8juOkF1UG1fLQqvZh+51YhLmt8wvwR23q5zRkDvm
 ifvyHnPzxQOm83q02E4pqABsSGGGRyfSaXytxQBwsjxnjXneCFyCLB+pVL7O1Mq9oW
 i69CU7n25Dj0vdzbgXbpRvA2V43sh+YXctBOPetZ35qdBvos/5xtRAY+NlYgxfuNDt
 jvjkEbsmK08r1Cy9zAKQw/BRCcy9a/OQzeba0xiWhyI6mXX8KOMG04Sy6JUs6b5skX
 DuUN7PQd+W6fA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1sEpyV-000000007jb-1M1P;
 Wed, 05 Jun 2024 14:42:43 +0200
Date: Wed, 5 Jun 2024 14:42:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Message-ID: <ZmBdQygUaVzxieH9@hovoldconsulting.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
 <ZloGLmlfHIfWfWV9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZloGLmlfHIfWfWV9@smile.fi.intel.com>
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

On Fri, May 31, 2024 at 08:17:34PM +0300, Andy Shevchenko wrote:
> +Cc: Johan (via kernel.org)
> 
> On Fri, May 31, 2024 at 08:14:43PM +0300, Andy Shevchenko wrote:
> > On Fri, May 31, 2024 at 07:56:12PM +0300, Andy Shevchenko wrote:
> > > Driver is quite outdated from the Linux kernel internal APIs
> > > perspective. In particular GPIO code is using legacy calls,
> > > that started being replaced by a new API ca. 2014, i.e. ten
> > > years ago.
> > > 
> > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > >  drivers/mfd/lm3533-core.c           | 645 -------------------
> > 
> > Oops, still leftovers: one file and Kconfig/Makefile updates...
> > If needed I'll send a v2, but now I leave it to Lee and Johan to decide
> > the destiny of the drivers.

I prefer to keep them as I just mentioned here:

	https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/

Johan
