Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5184DE83
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6E210E3AB;
	Thu,  8 Feb 2024 10:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tjRY9w2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3691710E3AB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:43:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BF306CE1B9D;
 Thu,  8 Feb 2024 10:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C8CC433F1;
 Thu,  8 Feb 2024 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707388997;
 bh=KfIx2dvD9Jx16XIaLbt5IT05wsfzW5ISA44UElE5OiE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tjRY9w2OHQSTLts+RsI6TC0+oV3wVGZBD22CKaiW5JBl++0CGspdttW57gtTtfzJl
 kpDOu1cAitbOgRgLfkG8Pi3MniPIarNzVujgwmJtpUB6wm082Txijk4aVFKxv8Q81R
 aglazxU80ynmPCso9AQoyow1pId1abJkrgMA5Rb5jJ6Ky7s9KmfiHRTz6/JBDnvW7q
 SzX6xghjqAeyMFQqFmwaX05eruWUgL+yoq076ElXhPpnOWegbzWL1O3blyqZFI3STz
 ulyVk0FUzz1JMeeDtFgVIl4qt9rJajxVORZ1rL0nC6Pwb/y9cbFX/ARrlCq6Hnqe2C
 BO/573b7JcOkQ==
From: Lee Jones <lee@kernel.org>
To: sam@ravnborg.org, bbrezillon@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lee@kernel.org, thierry.reding@gmail.com, 
 u.kleine-koenig@pengutronix.de, linux-pwm@vger.kernel.org, 
 Dharma Balasubiramani <dharma.b@microchip.com>
Cc: hari.prasathge@microchip.com, manikandan.m@microchip.com, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240202001733.91455-4-dharma.b@microchip.com>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-Id: <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:43:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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

On Fri, 02 Feb 2024 05:47:33 +0530, Dharma Balasubiramani wrote:
> Convert the atmel,hlcdc binding to DT schema format.
> 
> Align clocks and clock-names properties to clearly indicate that the LCD
> controller expects lvds_pll_clk when interfaced with the lvds display. This
> alignment with the specific hardware requirements ensures accurate device tree
> configuration for systems utilizing the HLCDC IP.
> 
> [...]

Applied, thanks!

[3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
      commit: cb946db1335b599ece363d33966bf653ed0fa58a

--
Lee Jones [李琼斯]

