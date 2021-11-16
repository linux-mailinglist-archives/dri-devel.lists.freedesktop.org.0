Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99353453183
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149F06E09F;
	Tue, 16 Nov 2021 11:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D316E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 11:55:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a9so10819637wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xVmgLrTg7EafzupUj3WHCgWIY7jwV5Y51V4BTTWgTkQ=;
 b=hfnrXki1mxFgNJkPEZ55HLNLsArcWJABhwSK+IButgZB+9oilzgyFEZLYggvc5j9a3
 C5xYS2MOkrWD+UP5BNijy2cPvi6fcr7oVzoqx+n7t2F0r138/QUqHQ6/q3FI0IO3dCaq
 LN7WwFfJ4XhdycNQdY0WycwAQwyHk1Y+EDW3rHEWgdkNxfEKT7lh74o+mNr/cNwUkOtR
 wjTlDuqFfaXSFipGXhVk8TDpJY+XOUk6YoaTG5ndgfWaZaRmtV07Wpyk7OSwuaJQqM9A
 d04tZivzDRlbhA/EW6tzt2zYGgsCTIjPELfeGcSciVc8Mn5jYS96+13UiG8tOQZA6Gjq
 xLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xVmgLrTg7EafzupUj3WHCgWIY7jwV5Y51V4BTTWgTkQ=;
 b=0yVENPJLty0kvuIYhmtIAc6gjhFZUG2Porm5xGRJqax9yrvIC4B/za5rVZgN2CTYM8
 Un1ayByFAZzShpUGAK+J3grhNE0Ad45CVhqX1vYAiiBDv+9BtH9WCY4fYn8FlGl4pORC
 9E8kUsxuV78B7UAlfwpiD/OBlm6SLBA1iRx3KnhOCTjWFNXsWXVbKMfZbmcQYSNdl6QS
 yvC1gLYnN1Iy6w2DMbQ2MzPrLg/waTVpucCBWWkAR6jEX2A76sLdPflcnPNbpkvcj8ml
 lVJrLxCM6m4nHgu4g+aWrjzmUKNt/N7ZkHF7mQcd2Km+RApbw2Q/Iyib6Y5F+6BezIiD
 rCIg==
X-Gm-Message-State: AOAM532v2GwtRyOGK75q7I2o0UGuvoo0xVEkS26aoD9XbgiXIFtUrYDg
 HwKK7bgesXFWbeZbU3UwRF7aUg==
X-Google-Smtp-Source: ABdhPJyV/RgHXasIzc74MY0/AMpKbqeOBawsiBis5Vn3OKt+UuS9YhzUxmmgERizQK3I0TLs123kog==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr8606706wrr.177.1637063725359; 
 Tue, 16 Nov 2021 03:55:25 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c79sm2141179wme.43.2021.11.16.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:55:24 -0800 (PST)
Date: Tue, 16 Nov 2021 11:55:23 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] backlight: ili922x: fix kernel-doc warnings & notation
Message-ID: <20211116115523.oobk2tfidvup5czz@maple.lan>
References: <20211116023355.1775-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116023355.1775-1-rdunlap@infradead.org>
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

On Mon, Nov 15, 2021 at 06:33:55PM -0800, Randy Dunlap wrote:
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
> ---
> v2: add periods at end of sentences so that the generated documentation
>     flows correctly. (thanks, Daniel)

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
