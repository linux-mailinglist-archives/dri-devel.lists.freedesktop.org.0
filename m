Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519627E5B94
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C43010E7E4;
	Wed,  8 Nov 2023 16:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500910E7E4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 16:41:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 807EB61696;
 Wed,  8 Nov 2023 16:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3EFC433C9;
 Wed,  8 Nov 2023 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699461714;
 bh=mTSad6bJhZGA212S/cPdKprvVKPQ/Wzqui55Qdqk7Q0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHEkXpn0YUGCi5tDa5stf8TWfMEbxcSgszu1XhzbVhTBRgxBnyU/PzKxof2V9XnaY
 zuYUA7lRdYFVNhIGuPpGjAzNGK9m6qjHSad5xZq9BXgyC7S8qhsGji0Ws70V9ECWQW
 jJoXZW/EGelR6dVh/x8jxbO2B5fARPBf47voCmN+SWIdg/iQeJBUS+Yd3MJoHVi6ab
 DGmxVQMHM/QW683mvTs3EjeZs6+grLIqhLcS5nMjoq9FdFM+A/2Cc4onYm75xzfDY4
 F/4s2fEWLVRP2PVf719XdVQKnBtekM8cBdJNMMOwLap8uCWbX1q7vDSzfyPAn2wgCM
 XZ+PJnY19Z6bg==
Date: Wed, 8 Nov 2023 16:41:43 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <20231108164143.GC8909@google.com>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-rtc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-sound@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Nov 2023, Krzysztof Kozlowski wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
>  .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
