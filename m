Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65F5ACF3B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 11:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28B10E22C;
	Mon,  5 Sep 2022 09:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AD010E22C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 09:55:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z29so12312301lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
 b=IHLIbQ5vHZQVIyqqjxII8xfEjM3Q6fZoeMqDFdIiU0vsFp6oi7h0IwMdNfx1vPlnFp
 ZPEemHQtgtDg6DfHplUdQ9jQ9sLqz7D7QN4FLqbsDi3rJNDxpjjlWDcgUMOkA9w2Tjs9
 x9VWcOV0/2DW1Hg36LsG6DteksM93YpJyP0rfadAndCJKb/yY4pF55KE51FqNTxioDRe
 KBJzVpsAFs2k6LKzsnJmjaNF0PAQrTJoMhIKZekTRu34MSjNFM9c+GyRzLjBHe1ybOQZ
 eLbeL6kyIXJDXmENmbtGhQKPn5KPfZrIYSXNEMQPhMhg5ikHY+XI6LCK0LoPM/K1/Mnt
 uzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
 b=1wnmhV3Da82+QWIb2biUZfNwoi00i/VIghayDRBnwccTDHb/HCx4PZpF+lVuRt+tDG
 NlCxTvuVOy1iBtOF3kyNOJg1GI89taEgquQNM9I2fDXWvrUr7wCAY0jMfy9VoHevdvTd
 R+xcDHU410WW6UKWLDU7TA6Pe9WCCz5DKYh0yw96aRU00VjYZekX6f/npCCn1Ea6wk1x
 47BA9Awz0grP2A4TzRC7azAmb0UCWx3dc+jh5vhkibboIvIJcrgS4/4AN5EVRMJ+BIiv
 fJAIJQQNiytX07XZcq8fVgcvUrHzSnp/YQ31+QEGbIRjjc23ReOIG8Jc/C0ybLRVrtGX
 vk/A==
X-Gm-Message-State: ACgBeo2Q7iu6hqnG6iG9qvIa7aVTVgE234gUG4tWaRY4BFq87Hd38cvl
 hX3ALVuL2WGCiOlKRt4xlqI=
X-Google-Smtp-Source: AA6agR4gwPt5aivllJzzHsjCuIDbWlzFIp6/PHCkmSvNiw6IUsaZdTaionvGINkVRjZdKCtkzi3jFA==
X-Received: by 2002:a19:6b16:0:b0:48c:e218:7c51 with SMTP id
 d22-20020a196b16000000b0048ce2187c51mr15164353lfa.681.1662371728951; 
 Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Received: from [172.16.194.135] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 v27-20020ac258fb000000b0048b13d0b896sm1141980lfo.141.2022.09.05.02.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Message-ID: <4a536310-3f79-d248-dc48-5cdbd640e04a@gmail.com>
Date: Mon, 5 Sep 2022 12:55:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 09:31, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "No parent regmap\n");
>   		return -ENODEV;
>   	}
> -	ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -					      pdev->dev.parent->of_node,
> -						 "rohm,vsel-gpios", 0,
> -						 GPIOD_ASIS, "ldo4-en");
>   
> +	ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +					dev_fwnode(pdev->dev.parent),
> +					"rohm,vsel", GPIOD_ASIS, "ldo4-en");
>   	if (IS_ERR(ldo4_en)) {
>   		ret = PTR_ERR(ldo4_en);
>   		if (ret != -ENOENT)
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
