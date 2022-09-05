Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392145ACF55
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 11:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A656A10E287;
	Mon,  5 Sep 2022 09:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BD110E275
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 09:56:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p7so12398396lfu.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
 b=et2BStfuMMuGC6Hmc0ahP2YMtl2IOvVs82z7fBLtShtRiNOLZEUcKr2FN+yvHNZxWj
 hUQof0CelJPy6k645QZnNEtobw55lyLfO/xzbj7BHjhPUtrr6ZyyJrZD5+wJPU8x4s/V
 wDTG6XP1BvwPE/YT5IW93WWtvTubg44nQ/U2m0Ukxn8zuXPeusqOLZkrZIQo7BaTII3T
 tjpw7YIxVKZOVR6ozOO29YwJBQZS8KoqWz1HV/AEJBiJwCnjVlLgAcdY8jrwxwGrjJtw
 gmvPsEX0owb2idPOc8tLiT8uceUOa827MJ139sBCmc4Km7ZtH35OknAdtVpmn61dpmua
 LvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
 b=n9TipAyxzjrk32ISsIjnir2tRnDW9x0aWLd9IOB47pS/a6tZo6eVfogCWr8oJXLeNZ
 R8gSNIbuZ3iCP/Csg/JChr64bmRkTGAMpjPA2j5pERzwZndJ8odD0fGzQhReBCH5KRfp
 0UIK+/khofOG50zE68kRtw69hCiMqjdHsOb5mlMG2raRYAjAbsIBAG4pU1yJXlsXoYtg
 1SrN78yaaD3ajZckap8B5J+PxiexNl3z+Bis6IojIKwl2HjxttWh8U1UneGvWcxHmA7+
 XgTHu4BnJ2O0r7xP2UY3Car2rjqFycje4ZnyWOqq1o8cntHwcXdb1g2SULDXLwzPpkGD
 IoQQ==
X-Gm-Message-State: ACgBeo3LjJtoMau2sgGnyv3YXtIfFCfwc7KKXlEySXhu9dd+RC8v4gPK
 L83q7k57Z0araAMLSfQr3d4=
X-Google-Smtp-Source: AA6agR49m1znt1xCwEgykIjaaYQRJwjqD0WPTDOx4N16eYQFUBRnr5DGteFNKPh7H42GT7aHHRsE7g==
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr15342515lfa.380.1662371790521; 
 Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Received: from [172.16.194.136] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac25e24000000b004965e80b761sm40259lfg.224.2022.09.05.02.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Message-ID: <0b051f7e-1754-cb69-c0df-0bae08c967fd@gmail.com>
Date: Mon, 5 Sep 2022 12:56:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
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
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
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
> While at it switch the rest of the calls to read properties in
> bd957x_probe() to the generic device property API as well.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>


Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
