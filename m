Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B26F5716
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 13:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810310E121;
	Wed,  3 May 2023 11:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD5C10E121
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 11:20:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso3088705f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683112856; x=1685704856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aJlibTx8TK7p5Pjke+lVcNzDYTvxet8ibw1NJMa5wZM=;
 b=FHtm5x0ckmS28FmXCTxXR5WMeSX0le5DilqQ0gNxeA5Hc4Op0A6tUfJBGxym5jh78Y
 iStp9o22yDPetjXAS438tCfbzHw6agB6jfy5skhbJK7WmPKMcGu/v9xgobFFryezbjl8
 a9SVLjJrehlCCTusDOdmiSPe67gmcwj9sp+5kzQWhe1d9H+IAMMfU6M6joHiZlpOkkAX
 Zmx7bBLUpZOYdZbxRXKgeOfR9knSWXqq2aGrJcGpK0j5Qtf1RuJOL6mcR+g9Tc7AO9Oh
 0VVRpOe/W5sSXDflEHnaVpYeEJat8+tky1jIC3ruZ0PN9ApbHt5daLcMPOewOG1z1e6U
 2L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683112856; x=1685704856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJlibTx8TK7p5Pjke+lVcNzDYTvxet8ibw1NJMa5wZM=;
 b=OTqxjFZWbAGemgK/pD1gOk2aoLNsaE26Mj4s30nT061iV1W7ToYiCK9WmmzuLdl9+Y
 saZ3So2wmB6qirYqcllRAJuqtEybqRDwaU9rg0lHJYYFLIW7zCTLOI7x57pfB0z3O2E8
 Rq472Ok0ksc1awp1E2aqI6qBP0QNlH9iXrUfOi4X+sbnA9IGToXo8fFAoykiXD8CZd4F
 w6a7TCjIjGN5eVOBurGlrQWlrgqC9B1+H8NrXjh/upEDKuToq7FJ9T9EM+ACv5qEBru9
 KGFBg1VYrS0ySR0m/DHVnnmv1i2wtdY8mhBch3eaMWrl3YMJ6116C5oJ+s5T4r8Ofd1B
 ofcg==
X-Gm-Message-State: AC+VfDzMpkFhSXssLxFW3mr/lqRyGOn7Udr5uvNtc9FhxwIgyW4mArjI
 l3lvVgbM1dfZEOQBOhT2IfCG1g==
X-Google-Smtp-Source: ACHHUZ5Hhp9kVQi8FJhj11p5+rQBMBVgoYd2qOZc+s77icf4hUmkxo3GJMxFW8h7/MTiWdRxS6KnIw==
X-Received: by 2002:a5d:5968:0:b0:2ef:bada:2f25 with SMTP id
 e40-20020a5d5968000000b002efbada2f25mr13980541wri.67.1683112855882; 
 Wed, 03 May 2023 04:20:55 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfee89000000b002f777345d21sm33424777wro.95.2023.05.03.04.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 04:20:54 -0700 (PDT)
Date: Wed, 3 May 2023 12:20:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] backlight: corgi_lcd: fix missing prototype
Message-ID: <20230503112052.GA109942@aspen.lan>
References: <20230417210213.2385912-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417210213.2385912-1-arnd@kernel.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 11:02:13PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The corgi_lcd_limit_intensity() function is called from platform
> and defined in a driver, but the driver does not see the declaration:
>
> drivers/video/backlight/corgi_lcd.c:434:6: error: no previous prototype for 'corgi_lcd_limit_intensity' [-Werror=missing-prototypes]
>   434 | void corgi_lcd_limit_intensity(int limit)
>
> Move the prototype into a header that can be included from both
> sides to shut up the warning.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
