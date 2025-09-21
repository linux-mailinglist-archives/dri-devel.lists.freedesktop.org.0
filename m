Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BCB8DE7A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F7B10E321;
	Sun, 21 Sep 2025 16:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k9VA4+Ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCF810E317
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 16:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23261601D8;
 Sun, 21 Sep 2025 16:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8CDC4CEE7;
 Sun, 21 Sep 2025 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758470922;
 bh=WAbk4PWWXEXWUyECLBWj+jZRHQjNujjT1F6/7IR7Wkc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=k9VA4+OvtF9WMxvlQ8gfo6xoYVgPhME93HuDeyjVf3VJQKg5L51KazbJGvnQm02j3
 GEWkqrPtWUqFxr15WM4BpVIZ9dGHMDnsux1aleg52r5KyYv+LHxTGl3b169Cwpso2A
 yUbcEIYwho2ZjYgeMp0c05LtDAyQHhYgWuVOQykRCV8P/ZAO0A2xrsHUFcZ1ZYVztd
 hVuGVTIdguTJgiGej5woK5cjYGCQTRMU+ddYcO0s3teIMgUWENJJnMWoMVmgI+Xo//
 WXIz1Ll5H7P+4YaCUMRhwXoBllRaGg+2qQdNCRdAyyrY7rJGZ0a5/DxMDhjkybdc75
 H1Hi9m6Bn3eAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250828-dt-apple-t6020-v1-26-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-26-507ba4c4b98e@jannau.net>
Subject: Re: [PATCH 26/37] dt-bindings: clock: apple,
 nco: Add t6020-nco compatible
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
Date: Sun, 21 Sep 2025 09:08:41 -0700
Message-ID: <175847092150.4354.4054733553683969208@lazor>
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

Quoting Janne Grunau (2025-08-28 07:01:45)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,nco" anymore [1]. Use
> "apple,t8103-nco" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> The block found on Apple's M2 Pro/Max/Ultra SoCs is compatible with
> "apple,t8103-nco" so add its per-SoC compatible with the former as
> fallback used by the existing driver.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
