Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1265AACC7D
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 19:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00AC10E270;
	Tue,  6 May 2025 17:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kapDodpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr
 [80.12.242.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA32F10E270
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 17:49:50 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id CMQKuaPSQcZeMCMQKuBdP0; Tue, 06 May 2025 19:49:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1746553787;
 bh=99j4ktQ4ioERQ7ClGtknHWIhUAX0d0+faJNQyJyUCgc=;
 h=Message-ID:Date:MIME-Version:Subject:From:To;
 b=kapDodpNSQNPkdpb9Lvxb39Ed5OliWZhN5loHwBzN0BxU9VySASzXGebp6ic9KaP8
 Nghn5IeyIpvJWA34QrPoy2lfQZYwro+coJ78nd+QQYuhTpf5hslrUChD1jG44SnszT
 JF/65qcOmkAEcQiDI4m+baKKs/TNOnU+YYjValvJiNXU+uJiUd6mWWl8UrmvtW994s
 e/jtQOvLSaCiVc5577c7l8Bs1x13T2oGvho1FVM9coiDFKJCbwDzI9sF/ZArsDiDln
 Ak6s5n1jJWVjEHqxPl2S4Ahx6MCMq9XEpeAzU86J9Np0ApYG+m15nOJRvq9LlYwX4f
 YHjaTE/Y8NcFg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 06 May 2025 19:49:47 +0200
X-ME-IP: 90.11.132.44
Message-ID: <48472736-4182-4d47-9980-6d63541f6975@wanadoo.fr>
Date: Tue, 6 May 2025 19:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
References: <20250506093340.106575-1-clamor95@gmail.com>
 <20250506093340.106575-3-clamor95@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: clamor95@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
In-Reply-To: <20250506093340.106575-3-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 06/05/2025 à 11:33, Svyatoslav Ryhel a écrit :
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.

Hi,

...

> +config DRM_SOLOMON_SSD2825
> +	tristate "SSD2825 RGB/DSI bridge"
> +	depends on SPI_MASTER && OF
> +	select DRM_MIPI_DSI
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> +	help
> +	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
> +	  SPI bridge driver.
> +
> +	  Say M here if you want to support this hardware as a module.
> +	  The module will be named "solomon-ssd2825".

Is it "solomon-ssd2825" or just "ssd2825"?

> +
>   config DRM_THINE_THC63LVD1024
>   	tristate "Thine THC63LVD1024 LVDS decoder bridge"
>   	depends on OF

...

> +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd, u16 *data)
> +{
> +	struct spi_device *spi = priv->spi;
> +	struct spi_message msg;
> +	struct spi_transfer xfer[2];
> +	u8 tx_buf[2];
> +	u8 rx_buf[2];
> +	int ret;
> +
> +	memset(&xfer, 0, sizeof(xfer));
> +
> +	tx_buf[1] = (cmd & 0xFF00) >> 8;
> +	tx_buf[0] = (cmd & 0x00FF);
> +
> +	xfer[0].tx_buf = tx_buf;
> +	xfer[0].bits_per_word = 9;
> +	xfer[0].len = 2;
> +
> +	xfer[1].rx_buf = rx_buf;
> +	xfer[1].bits_per_word = 16;
> +	xfer[1].len = 2;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer[0], &msg);
> +	spi_message_add_tail(&xfer[1], &msg);
> +
> +	ret = spi_sync(spi, &msg);
> +	if (ret)
> +		dev_err(&spi->dev, "spi_sync_read failed %d\n", ret);

Maybe, just spi_sync in the message?

> +
> +	*data = rx_buf[1] | (rx_buf[0] << 8);
> +
> +	return 0;

Is it on purpose that ret is never returned?
Is it safe to update *data if ret is not 0?

> +}

...

CJ
