Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D88209C10
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888FD6E9A1;
	Thu, 25 Jun 2020 09:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282116E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:40:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so5079624wrj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TlmH6CUdIAxBdzHoXkJA+99qDumm1XXj1357pinG+ZI=;
 b=YcmE+Im9XZ7cBXoYmYZkFd+TUXCQKZaFtyX9M0aBLCnTaDtwFXG10K875A7mhoZgFt
 71yo/XAjAgPkE6om6A1NlAGHl5mT5y+rnAdDz3TI3Bz7sJi8vkncQfEH9CTwuAIpUyc0
 fbTj0m2ZDGn7crejTzpH8uULmP6iMzU3QGX51+wJhV86k/NL3gAuPAKmhU89hYWVGoxI
 ddnqMAc2yOq5YxlYo6U+wHMioDAziVOu84iKChzwHytbpmGwuL5s1IZt26PKbH5oM4+T
 8rbFbtcP259jH0szLCcN2Snog/qW6IEqmYSOkq1HVbKvvLIkllftm6UYFoAOg6mchBRA
 yk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TlmH6CUdIAxBdzHoXkJA+99qDumm1XXj1357pinG+ZI=;
 b=tFRYx2d4v3OetJVEq0xLbcVT3YilwsgRJaPXyJ0XX8TQarZDowLCMGX49g3XjYpl7O
 c0+8sMjLNLTgAUpJEa0SZ4LeVRTuDKh0tT1fFYQ3WQMuNyw+dXdfFubck/iHkvYSoXfy
 /a5BMpFh4YycovQHlw6/9er22AhpY920/VEa52hx2Lb0CEMPS3kXVeBY7mnEJMfdAhC8
 8vyM0Gmgk5Rs/vInrfVppkzsMveV84ssMEuKYOkwxLHopPA4IZPLUd6Nv5A37zx8B5yD
 7PiRC/YMqLF2OqQby5cx4+1ehBj/v/W/eFfCJxGu7s/5i1ezjgXtOfr9yEmTBVJyYgCX
 hACw==
X-Gm-Message-State: AOAM5307xvgPCKyV0mClaaO9l9qSg7PfSp2rsSuc/dnLUrdhD7FMbPku
 kc9EYkGHhu2sCxMG5rYE3HSC/g==
X-Google-Smtp-Source: ABdhPJy87UtoAD2RwowyPkHPcmUfIwaVK7ldX8ETiKlJPlPgPIPmViUdDBSNcBx2Wk03qCIhThHFvQ==
X-Received: by 2002:adf:b608:: with SMTP id f8mr36492832wre.363.1593078053819; 
 Thu, 25 Jun 2020 02:40:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d9sm30518424wre.28.2020.06.25.02.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:40:53 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:40:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200625094051.u4hanl3rycczlwiy@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-4-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 03:57:16PM +0100, Lee Jones wrote:
> Kerneldoc syntax is used, but not complete.  Descriptions required.
> 
> Prevents warnings like:
> 
>  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 's' not described in 'CHECK_FREQ_REG'
>  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 'x' not described in 'CHECK_FREQ_REG'
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Software Engineering <sbabic@denx.de>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/backlight/ili922x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> index 9c5aa3fbb2842..8cb4b9d3c3bba 100644
> --- a/drivers/video/backlight/ili922x.c
> +++ b/drivers/video/backlight/ili922x.c
> @@ -107,6 +107,8 @@
>   *	lower frequency when the registers are read/written.
>   *	The macro sets the frequency in the spi_transfer structure if
>   *	the frequency exceeds the maximum value.
> + * @s: pointer to controller side proxy for an SPI slave device

What's wrong with "a pointer to an SPI device"?

I am aware, having looked it up to find out what the above actually
means, that this is how struct spi_device is described in its own kernel
doc but quoting at that level of detail of both overkill and confusing.


Daniel.


> + * @x: pointer to the read/write buffer pair
>   */
>  #define CHECK_FREQ_REG(s, x)	\
>  	do {			\
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
