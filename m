Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F39209BEA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB166E8C6;
	Thu, 25 Jun 2020 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC4D6E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:28:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r12so5040586wrj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wZ3xkBP5w3XYMTvLh2QI28P63jV7LX3p1gxwcLJzIps=;
 b=C6ixCOK/9LDYiY0Iwdj0/BoXa6w1A+fVDp3C9NTV870s6gG/5+o7RFK86X+TVtVjXO
 q2Fd7XtY4cMBU7LnlK1fi0oh+7mNOpseqKEEx36NJDl9hPhjbJG0IlU8uohfhCtMDDmA
 qI9QC4KmUOG0sd4/G44kphZaMTKwFcfcEdkm0zc+uLUEmRyccAU6b1/6tbokYvVESB5D
 biufTUOLOJGcIHM127C7NlQGB1lzC3AI2IWv+5KLP9NFdARQ+/N3HC0NNULNu+xMmNsU
 tF9Tf7mDvqc8a6Uvm+GRJhJgfjdseGRLI2jYuGgtAk2BrNA0qS29Wnmqa6LG7O5ktqYm
 C87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wZ3xkBP5w3XYMTvLh2QI28P63jV7LX3p1gxwcLJzIps=;
 b=Gm892GFoVUVXubFG2XKTvTfSzs0aB/2V0Rac1nMlq9WlDpgC6LMebhOS+rIXbZoX82
 3J704z6Vn0i51a6ZF4GkWgp/LHYkgzjQy6qTTDjYKr/3ZjKzdqmPemOkuM9vLJP2Heez
 PzeW6j+OaanFrtJaZ1ofQPGzaMZbpbX1MFL+ygi8Z2+dejOtMDka32ydJ9H59ujEvaeL
 7p6pPUKojr7B0PrUSep3nqDDMfksce9xM7rCTFGIQgmQvwlCv0m6m2Xd9yxXt75Hgav9
 m0QLh5EI5wEtioRHE2rbqcwrc+3jIzKG5EDbWa4eguGS2kPvv50M971Ult2R8i8Ts0x2
 8FyA==
X-Gm-Message-State: AOAM532lKsJPQ03ZjYc1x8nzwqvkMvGZUU4UjvyLdMhj91jPESYwZRpZ
 l0fVadI+hJNbKgmmILM19kRMSg==
X-Google-Smtp-Source: ABdhPJx8YLsfpqLIR1nhVjd+aDujzMmrOlHvE8k8+Jx+sWaM87JAC9/9z7769ytqaaAAvW8mDEkHGw==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr14655476wrg.205.1593077310376; 
 Thu, 25 Jun 2020 02:28:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g16sm26802137wrh.91.2020.06.25.02.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:28:29 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:28:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/8] backlight: lcd: Add missing kerneldoc entry for
 'struct device parent'
Message-ID: <20200625092828.2cpdofvor6ehhbwh@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-3-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Andrew Zabolotny <zap@homelink.ru>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jamey Hicks <jamey.hicks@hp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 03:57:15PM +0100, Lee Jones wrote:
> This has been missing since the conversion to 'struct device' in 2007.
> 
> Cc: <stable@vger.kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Jamey Hicks <jamey.hicks@hp.com>
> Cc: Andrew Zabolotny <zap@homelink.ru>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/lcd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index 78b0333586258..db56e465aaff3 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -179,6 +179,7 @@ ATTRIBUTE_GROUPS(lcd_device);
>   * lcd_device_register - register a new object of lcd_device class.
>   * @name: the name of the new object(must be the same as the name of the
>   *   respective framebuffer device).
> + * @parent: pointer to the parent's struct device .
>   * @devdata: an optional pointer to be stored in the device. The
>   *   methods may retrieve it by using lcd_get_data(ld).
>   * @ops: the lcd operations structure.
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
