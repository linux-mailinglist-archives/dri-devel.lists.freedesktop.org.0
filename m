Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E725806DD9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5AF10E6DD;
	Wed,  6 Dec 2023 11:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E134A10E6DD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:26:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so354134f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 03:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701862007; x=1702466807; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EvSC8sFJC144TRBvtM3+ZPdJXLrfbSly1D5iu6epzXY=;
 b=OlMYzgi1IhyCBKcbcEr+tWFPopVUgUwT2tZ1GY6sTF4HHyNRjqSyfhC9sJ9A65JjT5
 8GNFvi+AeTIQX53Di/4Kyu8WwD8Afj+Wj8bj30fj9tpZ9hVaX0oTK73d43FuiOBSo1my
 20lNv733+n8M+24eM7lYhPHnTvkqFdNrg/PuhXGiePrklsIyc31dsWSpCPeXv3gr+YKZ
 ukG8ufj1IWWOlgGO3KlmvxF6VMCwIuqRyLZxWCQTU46mHIA5h+vpSPpIeAERIrD2bmyY
 tMVh2rPqKLc8UFOam01bzNOaNnNlKTPb7s9BtZF9Ab+7cxj8ZALXQka1lQteKhV7T0qz
 NHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701862007; x=1702466807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvSC8sFJC144TRBvtM3+ZPdJXLrfbSly1D5iu6epzXY=;
 b=E5kaDMFJdhJC0DNqE0FuyFgA/z8c4qW3uTx7RvkUUrpjZ6a7umjZh/1HuSvleFEGBq
 m1zI0JDPSGVvxOQ+im3eK4UmZR2Tidm8UNI0FJ9c9F5NyhGCbr3gidk5hWZXfh997zgO
 67SbYoZEBToolT6O4RCYxMZx7kWqRSVqoEZEaAP+8Rw8VVSQnK5tpLRJcp6nkcTibXfl
 QAsYqdBzc2+9eIOeib794qhC3LvtFXxQvQs8O5TtVssQt+YJtL3nJdvOU4DUJTNUpooX
 49G9MkdrCqA0eo4znmTO38HNikkX9vM5jYZzP9un7xbBFGhsKLPdi7pGDEh7oY3pWAE+
 v4WA==
X-Gm-Message-State: AOJu0YwjfOh17CPnM4kUWUAYVYxdTf0YkHjRLPbMK4fs4N1MdC++0mOK
 GrjMwBs2ts7dXuhteTkD6n0jOmBtx5QPmB3NcxP4QQ==
X-Google-Smtp-Source: AGHT+IGLGNtV6sQTUXUZq/T4TEJqUVUvZaN893Vu0zQMRSW6n3M3Mtf8yrqGuZC/2DvnctBaVxiZuA==
X-Received: by 2002:adf:e644:0:b0:333:73e:632b with SMTP id
 b4-20020adfe644000000b00333073e632bmr435543wrn.31.1701862007313; 
 Wed, 06 Dec 2023 03:26:47 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b003333a216682sm11483046wrb.97.2023.12.06.03.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 03:26:46 -0800 (PST)
Date: Wed, 6 Dec 2023 11:26:45 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] backlight: ili922x: fix W=1 kernel-doc warnings
Message-ID: <20231206112645.GA81045@aspen.lan>
References: <20231205225638.32563-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205225638.32563-1-rdunlap@infradead.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 02:56:38PM -0800, Randy Dunlap wrote:
> Fix kernel-doc warnings found when using "W=1".
>
> ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> ili922x.c:85: warning: missing initial short description on line:
>  * START_BYTE(id, rs, rw)
> ili922x.c:91: warning: contents before sections
> ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/video/backlight/ili922x.c |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff -- a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -82,13 +82,12 @@
>  #define START_RW_READ		1
>
>  /**
> - * START_BYTE(id, rs, rw)
> - *
> - * Set the start byte according to the required operation.
> + * START_BYTE() - Set the start byte according to the required operation.
>   * The start byte is defined as:
>   *   ----------------------------------
>   *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
>   *   ----------------------------------

I'm not sure we want "The start byte is defined as" in the brief
description. Needs a blank line between the brief and full description
(or hoist the argument descriptions up to match the idiomatic
form for a kernel-doc comment in the docs if you prefer).

> + *
>   * @id: display's id as set by the manufacturer
>   * @rs: operation type bit, one of:
>   *	  - START_RS_INDEX	set the index register
> @@ -101,14 +100,14 @@
>  	(0x70 | (((id) & 0x01) << 2) | (((rs) & 0x01) << 1) | ((rw) & 0x01))
>
>  /**
> - * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
> + * CHECK_FREQ_REG() - Check the frequency
>   *	for the SPI transfer.

Likewise I think there is no need for "According to the datasheet..." to be
included in the brief description.


Daniel.


>                             According to the datasheet, the controller
>   *	accept higher frequency for the GRAM transfer, but it requires
>   *	lower frequency when the registers are read/written.
>   *	The macro sets the frequency in the spi_transfer structure if
>   *	the frequency exceeds the maximum value.
>   * @s: pointer to an SPI device
> - * @x: pointer to the read/write buffer pair
> + * @x: pointer to the &spi_transfer read/write buffer pair
>   */
>  #define CHECK_FREQ_REG(s, x)	\
>  	do {			\
