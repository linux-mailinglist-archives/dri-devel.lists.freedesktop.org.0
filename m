Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB362D58F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB58E10E576;
	Thu, 17 Nov 2022 08:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3FC10E581
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 08:54:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i186-20020a1c3bc3000000b003cfe29a5733so4463325wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9hYrAT2BNVskU/iDANhKEsz2VyGmJLN/rJvwow2j2xk=;
 b=GejQpumCcaJEwAMF9vs5N6MTa4HzjPwDmJEUeAvSGwmdPfgcFftqfp718ZY//Kwd/6
 NiRLKvzHWmOEB2glIPDCQqS20M5AbpWcheJWEe0v9HSameNpXDzd3tnXIkr21M/fO/+B
 pMxqk3YwUh68R3+JoME0RkA8m5KvnhhhS5BEJpn7PLYav1RuSPombssgPei++tn1Lbhg
 FKRcEUteXeQMMH39vFxOtoAEEqhtSHQu3b9aIGoVVR1/ibfYRas58aI9oEtbYLOM1yiM
 SRgaK8m7sSzvY+2xBJIHjAcY9v4AZ62NV5llYbm9KOpaVbb/wgsOyny44CZrK2w4rHgZ
 96pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9hYrAT2BNVskU/iDANhKEsz2VyGmJLN/rJvwow2j2xk=;
 b=vXmQop3/iOeii8vsgGz9rfbHrXVuoYG3Enz1CwutSXyXyfXswWd9B7KfrtWstlfPhT
 /rgb5u2nZ+aUihMw6lu+H9NuY27JzoSR38RYNq2kirkR+IwFNpGkVVqnYmSMCDgYbDsW
 2kWfT4Bq3NzCJ6DbcJNBFXGYyoJ7PnM1XpJ08HvwRUQvwjV3TU1QziE7C2TtU4kILn0U
 0/yvMoxecjIih0rxSa1UEaLroQdPQnnNNLojDknvj4/Pu98Wp0HpCmcjmKVP70/oTAq0
 YiCmF0ocIbY7GKuDNJs1DUKeKC4Hy1tO3Fuygpc0DQh92B0F2S7C+9Iw/7T8UzxK7Wip
 1ZnQ==
X-Gm-Message-State: ANoB5pkJTCXuTinOydNAMbWfDdQyvjkUOgcBHZDs/iVYYPNEDP7TQ4AV
 zGLhbghn4FHasuLCfOi3JLDwTw==
X-Google-Smtp-Source: AA0mqf7R5pytyH9/lNfPVQJWtwPbmJ8SiI7lVBKrIVlZzrwL5/u2Uq88NSqEZmONRgEmdbXer9wwaw==
X-Received: by 2002:a7b:cd85:0:b0:3cf:931c:3cfa with SMTP id
 y5-20020a7bcd85000000b003cf931c3cfamr940137wmj.203.1668675281746; 
 Thu, 17 Nov 2022 00:54:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b?
 ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d6dd0000000b0022584c82c80sm386384wrz.19.2022.11.17.00.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:54:41 -0800 (PST)
Message-ID: <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
Date: Thu, 17 Nov 2022 09:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/11/2022 09:47, Carlo Caione wrote:
> On some hardware (reproduced on S905X) when a large payload is
> transmitted over SPI in bursts at the end of each burst, the clock line
> briefly fluctuates creating spurious clock transitions that are being
> recognised by the connected device as a genuine pulses, creating an
> offset in the data being transmitted.
> 
> Lower the GPIO CS between bursts to avoid the clock being interpreted as
> valid.

I'm afraid this will actually break SPI NORs for example where CS actually splits
transactions.

Isn't Amjad change enough ? The CLK pull-up should avoid this.

If it's not the case, then it's an HW issue and the CLK line pull-up is too weak and an
external pull should then be added.

> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/spi/spi-meson-spicc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index d47f2623a60f..af8d74b53519 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -291,6 +291,10 @@ static inline void meson_spicc_setup_burst(struct meson_spicc_device *spicc)
>   static irqreturn_t meson_spicc_irq(int irq, void *data)
>   {
>   	struct meson_spicc_device *spicc = (void *) data;
> +	struct spi_device *spi_dev;
> +
> +	spi_dev = spicc->message->spi;
> +	gpiod_set_value(spi_dev->cs_gpiod, 0);
>   
>   	writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATREG);
>   
> @@ -309,6 +313,8 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
>   	/* Setup burst */
>   	meson_spicc_setup_burst(spicc);
>   
> +	gpiod_set_value(spi_dev->cs_gpiod, 1);
> +
>   	/* Start burst */
>   	writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
>   
> 

