Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB39B3F7FA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB02210E1AD;
	Tue,  2 Sep 2025 08:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GO+VfbRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DE210E1AD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:15:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6DE460203;
 Tue,  2 Sep 2025 08:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6306C4CEF8;
 Tue,  2 Sep 2025 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756800955;
 bh=MJXowf2wgR3zMSaL6vAUZvkiL3FLEXndHtAwni/LPaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GO+VfbRqg9SyCpITfXxDVWS3AFB1Ybu4vslt2juwYAohgQOzzG8IaPTu8RmDqqZG/
 /FKExk28TQnHfpxBiGTDwXKUZ8zIiCqUZbc+s50zgq/EMkTikSHjWNfbNXBWaLur5i
 TeMui4hHvkRuq9eSR2x1Q0x9+zSIfSiZeyewZFLzi6Bho0kA9HM30lNg95iP8+Ekwz
 3atLbvNO+V4KWyks9qP1dbcaa05IGlXBz4c4E6a2Lq71ss1mgtFH0btcGtJ7UamhLZ
 lDyHvwgkZMhZG+S6m3cbBvo+dEZEi6KH3ucKLyBIRRaPri0A8NMBtYOKw74GER2oZy
 lwLEValqyxfIQ==
Date: Tue, 2 Sep 2025 10:15:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Message-ID: <20250902-robin-of-optimal-performance-eeb9c4@kuoka>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
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

On Thu, Aug 28, 2025 at 04:01:19PM +0200, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 

37 patches, 9-15 separate subsystems. That's really not how you are
suppose to upstream things. Please split this per subsystem. Few
bindings without drivers could be together, though.


Best regards,
Krzysztof

