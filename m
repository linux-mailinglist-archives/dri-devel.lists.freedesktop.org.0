Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB44503A1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E806E92B;
	Mon, 15 Nov 2021 11:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B16E92B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:38:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d5so30070203wrc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wECB8Odve8M6ApPsX4FLwbNORmpbNOWeDrC7D87THPA=;
 b=rOOD66sAr/gPFYySdX4jAJtAumwH55agqU6FjPjdq8n4+DSmmNDGMEmEWZN+hGOVSI
 QOHilEQiPItA50fpVuibDmmTJGF7LWoNb2EbWMvmOmSd1fwq/JL1C0QWywTh+cl8QsTJ
 xkxfdW5N7uImM2zDiI/6ceqCUpW6GQ27k9L07rcpPuLIi6UShpKMXc+X158QtepT9XGs
 i221RT2e+gtwzrz9y+iAf7vDROEqLxb6DZv488TVtm+vn87lu9vIFFeagdhc13cYnGG6
 qG4jhR3m4vMZm1ksTO2sHAB2gyHZG8aD6e85FZxzb3QM4R5iNL8skSEo960u4mfY2UAw
 y+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wECB8Odve8M6ApPsX4FLwbNORmpbNOWeDrC7D87THPA=;
 b=CqyGbrbYbDqcMasL6wPRnlEVRciGBKM52Jjcavz5TgIvPAeHu7kVMSr0c2j4JpM0IA
 n/SY6+v/R9DJ6orr1n9oxO9eepAn2w02Ix+XsodTU5qyCYkEq8Y+HIR2SamDb9DtCfKA
 47Ygi6Ws07BM1jExO19PLUcxeq2ZlcwcF6lHVlxY7ImIULL+iGKWm1mlS70WcWeu55un
 Rvw9NVRgbw8I8+HJLs/A+V2e4OrSC4n8UmDoQEu7csjHPF2u4IziJw24M9paaPwZbXki
 9hmGD+Stkt8Gldvg9ShPnTilaIr7ISQV1klFyPy1DOUWXCHcqX15q42c03MpeS3vJWd9
 EJ3Q==
X-Gm-Message-State: AOAM533r1GP2RZpG6v/CX6HBIwQBib2x1X8YFj9f3WROiBE1Ugn/lUNX
 F0vHY1jaBHF9Gy/Iux44fkibrQ==
X-Google-Smtp-Source: ABdhPJxblwpG4OXJ/jt54vhrD7w5/uHn5GsBdY4QtO/lT+xZrnupLotEmBZoHheg2Ad1pFFf1hX43g==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr44846230wrn.218.1636976315312; 
 Mon, 15 Nov 2021 03:38:35 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f7sm16119643wri.74.2021.11.15.03.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 03:38:34 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] backlight: ili922x: fix kernel-doc warnings & notation
Message-ID: <20211115113832.rsdx3ziuujrobwxx@maple.lan>
References: <20211115033925.22024-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115033925.22024-1-rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>,
 Stefano Babic <sbabic@denx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 07:39:25PM -0800, Randy Dunlap wrote:
> Convert function-like macro comments to kernel-doc notation and
> fix other kernel-doc warnings:
> 
> drivers/video/backlight/ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * START_BYTE(id, rs, rw)
> drivers/video/backlight/ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
> 
> ili922x.c:92: warning: contents before sections
> ili922x.c:150: warning: No description found for return value of 'ili922x_read_status'
> ili922x.c:193: warning: No description found for return value of 'ili922x_read'
> ili922x.c:247: warning: No description found for return value of 'ili922x_write'
> ili922x.c:353: warning: No description found for return value of 'ili922x_poweron'
> ili922x.c:382: warning: No description found for return value of 'ili922x_poweroff'
> 
> Fixes: 4cfbfa971478 ("video: backlight: add ili922x lcd driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Stefano Babic <sbabic@denx.de>
> Cc: Anatolij Gustschin <agust@denx.de>

Thanks for the fixes. Just a could of quibbles about full
stops/periods.


> ---
>  drivers/video/backlight/ili922x.c |   29 ++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> --- linux-next-20211102.orig/drivers/video/backlight/ili922x.c
> +++ linux-next-20211102/drivers/video/backlight/ili922x.c
> @@ -82,13 +82,7 @@
>  #define START_RW_READ		1
>  
>  /**
> - * START_BYTE(id, rs, rw)
> - *
> - * Set the start byte according to the required operation.
> - * The start byte is defined as:
> - *   ----------------------------------
> - *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
> - *   ----------------------------------
> + * START_BYTE() - Set the start byte according to the required operation

Missing full stop/period.


>   * @id: display's id as set by the manufacturer
>   * @rs: operation type bit, one of:
>   *	  - START_RS_INDEX	set the index register
> @@ -96,14 +90,19 @@
>   * @rw: read/write operation
>   *	 - START_RW_WRITE	write
>   *	 - START_RW_READ	read
> + *
> + * The start byte is defined as:
> + *   ----------------------------------
> + *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
> + *   ----------------------------------
>   */
>  #define START_BYTE(id, rs, rw)	\
>  	(0x70 | (((id) & 0x01) << 2) | (((rs) & 0x01) << 1) | ((rw) & 0x01))
>  
>  /**
> - * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
> - *	for the SPI transfer. According to the datasheet, the controller
> - *	accept higher frequency for the GRAM transfer, but it requires
> + * CHECK_FREQ_REG() - Check the frequency for the SPI transfer
> + *	According to the datasheet, the controller
> + *	accepts higher frequency for the GRAM transfer, but it requires

Also missing the full stop/period in the first sentence of the summary.

Note that here the missing full stop does not benefit from a new line to
conceal it and we will generate bad text as a result.

  Check the frequency for the SPI transfer According to the data
  sheet, the controller accepts...


Daniel.
