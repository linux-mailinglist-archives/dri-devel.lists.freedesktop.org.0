Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B558D67F7
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E02310E7BA;
	Fri, 31 May 2024 17:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DIdD0yEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043910E7D4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E879A62D73;
 Fri, 31 May 2024 17:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615FEC116B1;
 Fri, 31 May 2024 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717175752;
 bh=3mjCUPT3tD5OU5Z66Ty6rCRSMA4D4CBrZRr9Imwi0Nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIdD0yEC7VlFOlUUEGHg/j9u5deAMCXLkLKeJRO4eEnoNu2nt7j1sEdFc1jaYb6+5
 9x90QIiwOOEHbRHVHtn/qPJmeZ0BQAjJppBoxK5NuW9YzJoDH4M7kLbv9H7+4oEFuw
 IF9E86HOQ/RXocSbOYn9luyDSgHNpqHqaLpPN8apXXwPWS4lfNVldsYl0R+ndfXofq
 deDtWqGaWphUgUW44+T9iN5tcGx/DvbNRPwpS8MOTwaSaZ7NDaD57JDVuuyiQ6Dr7Q
 P1aj5awGzUvMvhLYNABuyew65dFZ/IqZcaRDOox+/DJINgC6GTs1xF5xHm3JAXpSbO
 F2UKgq1IF6ytw==
Date: Fri, 31 May 2024 18:15:46 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Message-ID: <20240531171546.GF1204315@google.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
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

On Fri, 31 May 2024, Andy Shevchenko wrote:

> On Fri, May 31, 2024 at 07:56:12PM +0300, Andy Shevchenko wrote:
> > Driver is quite outdated from the Linux kernel internal APIs
> > perspective. In particular GPIO code is using legacy calls,
> > that started being replaced by a new API ca. 2014, i.e. ten
> > years ago.
> > 
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> 
> >  drivers/mfd/lm3533-core.c           | 645 -------------------
> 
> Oops, still leftovers: one file and Kconfig/Makefile updates...
> If needed I'll send a v2, but now I leave it to Lee and Johan to decide
> the destiny of the drivers.

Let's not rush into it.  Take your time.

-- 
Lee Jones [李琼斯]
