Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA958D67EC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6860610E57D;
	Fri, 31 May 2024 17:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xsi4w0Rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40610E57D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F127CE1C6E;
 Fri, 31 May 2024 17:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D873C116B1;
 Fri, 31 May 2024 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717175671;
 bh=9P1Ir8WKg26GeXuuS3odKkZE/Pc+6MTvdlKOntSYO8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xsi4w0RxX7lrXL3U7qqbWnh+5LB55a7IfV+I3Gvuu4PB/+KEspQ+OX0nwWmekuzRs
 aX2DYTMu1Iyqww/1bspWawfbEYnu42cYAoPOscFjmcts+CcpYEndq4COQlDVvH5I3d
 BFkjjRv0FF2W8icBNcGgPIGoaNol1cfmTLk9ji/lbCtAaU9nINEk/8u5BucDTyPOTN
 /MQzE5iLWTyd2IYND5uRqgNinQ1jGWJPtv9lN3ohKzJhmuVNXRM+YBnMgZrUmNoXce
 TSFus5h3yNcWvyJVrfxgBwKq6oHnwHg2HRDvqIsfU/TK8mhP7pW+511i+q52DhpyYC
 M6dwbSnnfdCWQ==
Date: Fri, 31 May 2024 18:14:25 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, johan@kernel.org
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
Message-ID: <20240531171425.GE1204315@google.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
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

Making sure Johan is aware of this with his new address.

On Fri, 31 May 2024, Andy Shevchenko wrote:

> Driver is quite outdated from the Linux kernel internal APIs
> perspective. In particular GPIO code is using legacy calls,
> that started being replaced by a new API ca. 2014, i.e. ten
> years ago.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Andy Shevchenko (4):
>   backlight: lm3533_bl: Remove the driver
>   iio: light: lm3533-als: Remove the driver
>   leds: lm3533: Remove the driver
>   mfd: lm3533: Remove the driver
> 
>  drivers/iio/light/Kconfig           |  17 -
>  drivers/iio/light/Makefile          |   1 -
>  drivers/iio/light/lm3533-als.c      | 922 ----------------------------
>  drivers/leds/Kconfig                |  13 -
>  drivers/leds/Makefile               |   1 -
>  drivers/leds/leds-lm3533.c          | 755 -----------------------
>  drivers/mfd/lm3533-core.c           | 645 -------------------
>  drivers/video/backlight/Kconfig     |  11 -
>  drivers/video/backlight/Makefile    |   1 -
>  drivers/video/backlight/lm3533_bl.c | 399 ------------
>  include/linux/mfd/lm3533.h          | 100 ---
>  11 files changed, 2865 deletions(-)
>  delete mode 100644 drivers/iio/light/lm3533-als.c
>  delete mode 100644 drivers/leds/leds-lm3533.c
>  delete mode 100644 drivers/mfd/lm3533-core.c
>  delete mode 100644 drivers/video/backlight/lm3533_bl.c
>  delete mode 100644 include/linux/mfd/lm3533.h
> 
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Lee Jones [李琼斯]
