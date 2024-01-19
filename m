Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A3832E27
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 18:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591B410E1B5;
	Fri, 19 Jan 2024 17:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr
 [80.12.242.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F1510E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 17:29:32 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id QsgFrYNTInarWQsgFrf3Du; Fri, 19 Jan 2024 18:29:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1705685367;
 bh=JwBsDqoOR8SiedNBXI31hNKQkl0we/KwEcGVoVCDXdU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=U386wNGewBzAthdqhIdujVAu3XxD1xge3Hkts4nbBqvQ1Geu44Q7jwKuf+Qij0377
 RI7NJB2U0tzYQQw+aLF8arczrhTNhLwB8g6f+BCu123s0xGISChTRFNpImAk+DaTWe
 mWTqTcJTGOtPh95WBtomd3LbbCOykeIxr69gLDDla+KgJt2xxFXWP7RLF10znWjsM2
 857qN/+hb4j5WEbcKLKvjKqfjAIrbTfMXdxcwNiYg3Q4FZyP8ykSrXKAN7OBzYk/Ke
 4GHKH7AHzMpPkcuZQH29lYqD2zNFLjxyt7YTxKmh6dNyb9Wz/7q/JZD8SOZWzeYSsT
 Ow2jA0miGUPHg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 19 Jan 2024 18:29:27 +0100
X-ME-IP: 92.140.202.140
Message-ID: <51576fbb-c7dd-4ee8-a77f-ae7f62b254ab@wanadoo.fr>
Date: Fri, 19 Jan 2024 18:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] backlight: Add Kinetic KTD2801 driver
Content-Language: en-MW
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
 <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 18/01/2024 à 18:32, Duje Mihanović a écrit :
> Add driver for the Kinetic KTD2801 backlight driver.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> 
> ---

...

> +	ktd2801->gpiod = devm_gpiod_get(dev, "ctrl", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ktd2801->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(dev),

PTR_ERR(ktd2801->gpiod); ?

CJ
