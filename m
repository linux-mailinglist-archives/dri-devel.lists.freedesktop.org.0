Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D52814C8E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455F10E04A;
	Fri, 15 Dec 2023 16:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D58010E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 16:11:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso9196975e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702656665; x=1703261465; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oiYfNucyGrJK9+Fismuk7ieCgUCyCPw4k2hNnP6Ge6o=;
 b=WZ0Ss4pvOGz8S0tizhYLKMUlErfD510xbpTHIZMSUl921HRHkCkw8Ir6smYMH9UDAF
 dDwVu+OH9GQ9gwjX2ME3SOX3x1HgACeES0aumYFNVkxBibNKDSTvZNl9oCz+JRSEwYOe
 rIuzd0yKM6ZtMAdB0fTHrjhmpe3nNEJAwXeO5aiFKwjtG7iicjOo/thVHIi5+KsJPTxy
 Q8yx8Rurun4ljm9s2rqbPoi3sE7RUMrTacIoUWJHPrc9nXH3HIlp4kOK+wmbKw9IyfTk
 97fJ0dtFwTqI3Yz1HhA1bDiXuQ/D09lMXUXmQMHhYLp9ZdE6/kIHqOKMzwPq0gL8icTh
 hnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702656665; x=1703261465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiYfNucyGrJK9+Fismuk7ieCgUCyCPw4k2hNnP6Ge6o=;
 b=Nt1r+X5GRCXvcEKCg5MGflx1TjF/1rSPHd4R8CxRH07ykgWa1aKF7/hxguGkhvSIpr
 7Pu9AQU43ixfnBYg94c8Pm5QpCve4JG1Brq3fBDn9SrQ58jtZ1ciA+pMiMzC1iXRtGWo
 2NXVQueRfKoNtDguByWGTrnVi2vTALmzbHy6pYSyEJap+ZLLdpdKZBzcul1rQfsfYtAX
 YvpYOOE4E4q8OCJnR7shUjkgkfuoBtV3BJkVJ8wI1V6k3kaqXCJev+M59CKYwsnoLc3V
 G0UuICNCu6m4XfDfObuAlL7wvJUUPhQ4csn2czT0Q5wUe9d8sMxmmaHqWQPgbOxEVCJ9
 eeBg==
X-Gm-Message-State: AOJu0Yz00AANNOCuqdj+/sgVP3XN9Qt7ha8LXE67pJ1LD/O80sUECpKL
 mjtxEUhHHH6mIsHQuROTm0RDWQ==
X-Google-Smtp-Source: AGHT+IE9/QpVqN2I8/3tKtSs5UIywuHjtuZECShg0SZTo046hup40+fbNNexXXT5wkPSCrngxFK7eg==
X-Received: by 2002:a1c:6a07:0:b0:40b:5e21:c5ec with SMTP id
 f7-20020a1c6a07000000b0040b5e21c5ecmr4187384wmc.186.1702656664783; 
 Fri, 15 Dec 2023 08:11:04 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b00405c7591b09sm29759819wmo.35.2023.12.15.08.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 08:11:04 -0800 (PST)
Date: Fri, 15 Dec 2023 16:11:02 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Message-ID: <20231215161102.GA662726@aspen.lan>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 09:51:13PM +0200, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Add mod_devicetable.h include.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/mp3309c.c | 38 ++++++++++++-------------------
>  1 file changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
> index 34d71259fac1..d9b08f191999 100644
> --- a/drivers/video/backlight/mp3309c.c
> +++ b/drivers/video/backlight/mp3309c.c
> @@ -15,6 +15,8 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/pwm.h>
>  #include <linux/regmap.h>
>
> @@ -202,15 +204,12 @@ static const struct backlight_ops mp3309c_bl_ops = {
>  static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,

Pretty minor... but I wonder if it should be renamed:
mp3309c_parse_fwnode().


Daniel.
