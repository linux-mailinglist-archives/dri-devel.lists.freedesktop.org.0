Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFA1AF186
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 17:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889A4880C6;
	Sat, 18 Apr 2020 15:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A9B880C6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 15:17:16 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 489D22072B;
 Sat, 18 Apr 2020 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587223036;
 bh=qugxNfPkvqYi5+IUgteDQlgxWnSNpZvobR+yGLVDicc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BkhkS6zEdLKRGqWQpRLzde6OxUxvIwlsvwGWQPRdCua2pBb8tHU3aRvh2C5SCmGxF
 hJJb3A/+a666MlSl69WLezjGQ6lb9GPV3C8sSkDhE+D/DkCU8wBeqbBydQz5q1+cfp
 Px4H65dHyixYKeb6TjYi7fnmo/ai+VhYvqh6vU6A=
Date: Sat, 18 Apr 2020 16:17:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 4/6] iio: Fix misspellings of "Analog Devices"
Message-ID: <20200418161710.55ccf37c@archlinux>
In-Reply-To: <20200416103058.15269-5-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-5-geert+renesas@glider.be>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jiri Kosina <trivial@kernel.org>, Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-iio@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020 12:30:56 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to the togreg branch of iio.git and pushed out as testing as there
are other things in that tree that need a build test.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/ad7791.c                       | 2 +-
>  drivers/iio/trigger/iio-trig-hrtimer.c         | 2 +-
>  drivers/staging/iio/Documentation/overview.txt | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7791.c b/drivers/iio/adc/ad7791.c
> index abb2393926317087..70bfc41052db2740 100644
> --- a/drivers/iio/adc/ad7791.c
> +++ b/drivers/iio/adc/ad7791.c
> @@ -444,5 +444,5 @@ static struct spi_driver ad7791_driver = {
>  module_spi_driver(ad7791_driver);
>  
>  MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> -MODULE_DESCRIPTION("Analog Device AD7787/AD7788/AD7789/AD7790/AD7791 ADC driver");
> +MODULE_DESCRIPTION("Analog Devices AD7787/AD7788/AD7789/AD7790/AD7791 ADC driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/iio/trigger/iio-trig-hrtimer.c b/drivers/iio/trigger/iio-trig-hrtimer.c
> index a5e670726717f0d8..f59bf8d585866ea2 100644
> --- a/drivers/iio/trigger/iio-trig-hrtimer.c
> +++ b/drivers/iio/trigger/iio-trig-hrtimer.c
> @@ -4,7 +4,7 @@
>   *
>   * Copyright (C) Intuitive Aerial AB
>   * Written by Marten Svanfeldt, marten@intuitiveaerial.com
> - * Copyright (C) 2012, Analog Device Inc.
> + * Copyright (C) 2012, Analog Devices Inc.
>   *	Author: Lars-Peter Clausen <lars@metafoo.de>
>   * Copyright (C) 2015, Intel Corporation
>   */
> diff --git a/drivers/staging/iio/Documentation/overview.txt b/drivers/staging/iio/Documentation/overview.txt
> index 43f92b06bc3e5574..ebdc64f451d7c798 100644
> --- a/drivers/staging/iio/Documentation/overview.txt
> +++ b/drivers/staging/iio/Documentation/overview.txt
> @@ -34,7 +34,7 @@ turned on or off (if possible) via sysfs interfaces.
>  fifo / ring buffers on the sensor chip.  These greatly reduce the load
>  on the host CPU by buffering relatively large numbers of data samples
>  based on an internal sampling clock. Examples include VTI SCA3000
> -series and Analog Device ADXL345 accelerometers.  Each buffer supports
> +series and Analog Devices ADXL345 accelerometers.  Each buffer supports
>  polling to establish when data is available.
>  
>  * Trigger and software buffer support. In many data analysis

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
