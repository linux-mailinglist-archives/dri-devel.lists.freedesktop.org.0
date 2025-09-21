Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13CB8DE75
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2010E18F;
	Sun, 21 Sep 2025 16:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TZO+l66m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E07310E18F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 16:08:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 170984198B;
 Sun, 21 Sep 2025 16:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEED8C4CEE7;
 Sun, 21 Sep 2025 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758470915;
 bh=bjgVhndVUFUWDh9Kli3/1k8OQLzpscDz8f8evH9FF0I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TZO+l66md5y3YCmXc+ANR/7ZQQnj+9xH3xUYAKm16jr1VgmO7nbmA17BrgK/cp/1I
 ErAp9eU0l0ULWifGJSR8G6K31HdIhbPHRzPZCzoYVkURF0xm+t9Lp0IEZSKtUhv5To
 NZu/9IYg7jMI23EOHyqP+9Yf1aKiJVOzv4il1R+7W1e64H8azKP5cKmPz00VBgcjHS
 PM9ECn8MePHnkI7w4wRHfNxe5xMJ2h3rKfz6GeQ9giQ6ATo5gVf/vbqE+0BUftKaap
 6gENrL80OHsZU6jBLMOv2yTsyFq8PwSbbvOqjz6w5EsEXkHMQfXyVbT4c+pXfINbKa
 C6DAc9QudVGqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250828-dt-apple-t6020-v1-25-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-25-507ba4c4b98e@jannau.net>
Subject: Re: [PATCH 25/37] clk: clk-apple-nco: Add "apple,
 t8103-nco" compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andi Shyti <andi.shyti@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>, Jaroslav Kysela <perex@perex.cz>,
 Jassi Brar <jassisinghbrar@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, Johannes Berg <johannes@sipsolutions.net>,
 Keith Busch <kbusch@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Mark Brown <broonie@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Maxime Ripard <mripard@kernel.org>, Michael Turquette <
 mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>,
 Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sagi Grimberg <sagi@grimberg.me>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sven Peter <sven@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 van Spriel <arend@broadcom.com>
Date: Sun, 21 Sep 2025 09:08:33 -0700
Message-ID: <175847091343.4354.2623772725149192827@lazor>
User-Agent: alot/0.11
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

Quoting Janne Grunau (2025-08-28 07:01:44)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,nco" anymore [1]. Use
> "apple,t8103-nco" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
