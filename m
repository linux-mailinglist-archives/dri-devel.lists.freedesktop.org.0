Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AEA7DA90
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 12:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09C410E414;
	Mon,  7 Apr 2025 10:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CYRbyaGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FE910E414
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 10:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F78261129;
 Mon,  7 Apr 2025 10:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33094C4CEDD;
 Mon,  7 Apr 2025 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744020031;
 bh=/azf35r5cQXte1FxB3g5fAuyGOdAl0zghe2ozQC+Kn4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CYRbyaGjCTlWAvE77/0u6V30sPCuB80WsYDLaqroMlIWmBOOkVPhGBebGZOSu4Lyd
 mdIVGa2j/eDkSq3GVN6zToGrvyshTlJ+t9UgFJbIkHLKXhOwPQMfQt0YQua+/VJSAA
 HUPOr74ed64AFZdCuolGgZaSBvUXCtJikQTYzPbYDXjNeqGm8pUtlh0bHktlucp4Gc
 skViajnJwU3h9WkHKEnnykPzrmwcIik44eJ1jbjV7tCAZm4Jzzm7M5I21kA2fZLKvH
 L2tUuo1WOxx05GV6kOd57IVsQqCrAlmVhI98b29o/HmO26BgzFgbcEDF2VUezjgu7+
 J+HEUyvxFJucQ==
Message-ID: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
Date: Mon, 7 Apr 2025 12:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
To: Pengyu Luo <mitltlatltl@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-3-mitltlatltl@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250407095119.588920-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 07/04/2025 11:51, Pengyu Luo wrote:
> Kinetic ktz8866, found in many android devices, nowadays, some oem use
> dual ktz8866 to support a larger panel and  higher brightness, original
> driver would only handle half backlight region on these devices,
> registering it twice is unreasonable, so adding the slave handler to
> support it.
> 
> Note that, none of the devices supported by upstream require this, the
> devices using this is porting.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/ktz8866.c | 68 +++++++++++++++++++++++++++----
>  1 file changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index 351c2b4d6..017ad80dd 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -3,6 +3,9 @@
>   * Backlight driver for the Kinetic KTZ8866
>   *
>   * Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
> + *
> + * Apr 2025 - Pengyu Luo <mitltlatltl@gmail.com>
> + *	Added handling for dual KTZ8866(master and slave)
>   */
>  
>  #include <linux/backlight.h>
> @@ -43,11 +46,17 @@
>  #define LCD_BIAS_EN 0x9F
>  #define PWM_HYST 0x5
>  
> +struct ktz8866_slave {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +};
> +
>  struct ktz8866 {
>  	struct i2c_client *client;
>  	struct regmap *regmap;
> -	bool led_on;
>  	struct gpio_desc *enable_gpio;
> +	struct ktz8866_slave *slave;
> +	bool led_on;
>  };
>  
>  static const struct regmap_config ktz8866_regmap_config = {
> @@ -56,16 +65,22 @@ static const struct regmap_config ktz8866_regmap_config = {
>  	.max_register = REG_MAX,
>  };
>  
> -static int ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
> -			 unsigned int val)
> +static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
> +			  unsigned int val)
>  {
> -	return regmap_write(ktz->regmap, reg, val);
> +	regmap_write(ktz->regmap, reg, val);
> +
> +	if (ktz->slave)
> +		regmap_write(ktz->slave->regmap, reg, val);
>  }
>  
> -static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
> -			       unsigned int mask, unsigned int val)
> +static void ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
> +				unsigned int mask, unsigned int val)
>  {
> -	return regmap_update_bits(ktz->regmap, reg, mask, val);
> +	regmap_update_bits(ktz->regmap, reg, mask, val);
> +
> +	if (ktz->slave)
> +		regmap_update_bits(ktz->slave->regmap, reg, mask, val);
>  }
>  
>  static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
> @@ -124,10 +139,41 @@ static void ktz8866_init(struct ktz8866 *ktz)
>  		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
>  }
>  
> +static int ktz8866_slave_register(struct ktz8866 *ktz)
> +{
> +	struct device *dev = &ktz->client->dev;
> +	struct ktz8866_slave *slave;
> +	struct i2c_client *client;
> +	struct device_node *np;
> +
> +	np = of_find_compatible_node(NULL, NULL, "kinetic,ktz8866-slave");
> +	if (!np)
> +		return 0;
> +
> +	client = of_find_i2c_device_by_node(np);


I wrote on IRC - phandle to express the relationship between hardware -
and I do not see it implemented.

If you have devices depending on each other, you need to express it -
for links, for resource dependencies etc. phandle is for that usually.
Or OF graph. Or parent-child relationship.

You did not provide any description of the hardware in the binding, so I
really do not have any idea what is this setup thus how to represent it.
Use hardware terms, diagrams etc to explain the hardware in the bindings
commit. What are the addresses? Are there any shared resources? What
buses are devices sitting on, etc.

Best regards,
Krzysztof
