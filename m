Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869985BE3F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969210E430;
	Tue, 20 Feb 2024 14:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TqgZauV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9973510E436
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:11:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41270d0b919so2805835e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438270; x=1709043070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WYAwDAwFgnqBG7CxkptbcyQsBM6DtwJYIQlGTNsuuGE=;
 b=TqgZauV+xm2gAtdfmIYvUILyMg0sbT9nki6xK6toshXTI5+Hh68JMJofcMaPqxuwIL
 KsM0YpASs0sHig7j2ewSpwKkEJquNolwPloh+R+p7u8VWqtLPZOI330v13JSlaiiu25Y
 IALjH2PwZu46i3WCSW+IL6PpqKgk0i1rq6nGnQEnXk83botDhxib2YXnl1c6+acKZLXi
 VDI0fqA3CQG1tIuFRUHCUCgBZ+97U9jYyXOQ9DStBKZr6Fl+g7Hnu0poUpLfIVBWUDDy
 rAdjL5vA82egZ3QCexspt1OsDjnXQAd60avqxZ2wBhyLWpONnl65g3p4tvvp4EdoGtSi
 6jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438270; x=1709043070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYAwDAwFgnqBG7CxkptbcyQsBM6DtwJYIQlGTNsuuGE=;
 b=uc0U8KqKM+uvD0YBQcVm+exTbKOu73XmlpghkciA1TWJnz2IUMCMp/+zpb+IAwZeKf
 GMJUIoXBHT6WSQFQNL3xoqy22lc9tNiCm2TMVCv7zknhZAHXECjauGLwDWubRNEC7jh0
 w8EPtDN6MCnhp/x8ktjzgLzEnXx2b/CUbfQj6f9mQnA3fSsHRc/jqLYGfa1C6t8XgqhF
 oAC0DRRL0LXNTBE/d1+Jj7GwMmUoL9fpJrMBf3NJoJbFuHCSlaNJ1fDNW664nSuKSkFg
 FkJ1shNNKT3GbYfazOrvNht5+uVx9cW0J0R04n/VzolD1NF8KdKdljrHET+uTEMUf9zc
 ypOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUcAlds6NvlsjOlt2oZ7xx+VfjQ+2q5+EKbmHNIyggPxV4DT7XPuwfkYMMe6c27AdVXYSaxG3eLDJIrjQn9XQPgynIyY1c1s/uEklUhYHM
X-Gm-Message-State: AOJu0YxhmLadDxUDoeccCDgHZBOhvB1i6jsGOCXH61RJ1BF9JYW6nb4e
 hE/QsJxfzbCckNjMyGI+h7I0tv0tRizTowH/7srkOmtgJKhKP8TzIa1ZowBOdks=
X-Google-Smtp-Source: AGHT+IH7G6/8AbTda6e+b8uSaQ+ucRuJkJiJ61GD7iDnIPSep0vXQt5/dU86gOTGDRGrdA5ym28B4Q==
X-Received: by 2002:a05:600c:4fc4:b0:412:913:5484 with SMTP id
 o4-20020a05600c4fc400b0041209135484mr10836802wmq.11.1708438269747; 
 Tue, 20 Feb 2024 06:11:09 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bp1-20020a5d5a81000000b0033d38cbe385sm9829129wrb.6.2024.02.20.06.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:11:09 -0800 (PST)
Date: Tue, 20 Feb 2024 14:11:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: lm3630a: Use backlight_get_brightness
 helper in update_status
Message-ID: <20240220141107.GF6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
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

On Tue, Feb 20, 2024 at 12:11:21AM +0100, Luca Weiss wrote:
> As per documentation "drivers are expected to use this function in their
> update_status() operation to get the brightness value.".
>
> With this we can also drop the manual backlight_is_blank() handling
> since backlight_get_brightness() is already handling this correctly.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

However...

> ---
>  	/* disable sleep */
> @@ -201,9 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  		goto out_i2c_err;
>  	usleep_range(1000, 2000);
>  	/* minimum brightness is 0x04 */
> -	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
> +	ret = lm3630a_write(pchip, REG_BRT_A, brightness);

... then handling of the minimum brightness looks weird in this driver.

The range of the backlight is 0..max_brightness. Sadly the drivers
are inconsistant regarding whether zero means off or just minimum,
however three certainly isn't supposed to mean off! In other words the
offsetting should be handled by driver rather than hoping userspace has
some magic LM3630A mode.

You didn't introduce this so this patch still has my R-b ...


Daniel.
