Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F684DE72
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38D610E394;
	Thu,  8 Feb 2024 10:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LUgcpQKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7572010E394
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E841CE1BC1;
 Thu,  8 Feb 2024 10:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50626C43390;
 Thu,  8 Feb 2024 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707388705;
 bh=3AETScruqkniEwNPSQ+NMaYC/8cwISq036PBk0cTtnU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LUgcpQKRtuhjFJDiKTqdPWjCsggDpcTwYXQhj03kzMUMieEg6DLASSrp5Jjl5S8jM
 auS6Q2sRso+iCGkthVdLHM+tfFixhfn90rBxv+nPxszTUUL9J1WvYt9GQ7CsbGdyWf
 efkKt5wNFFRPBeZnuoqICx6JtNtNx8g6me+g08gm+hpr8Cc+vgUDb5ul88Wd74fmHb
 2caj3zysLIDePMJTgWBjOvn6+lp9VJa/uSqBBmRp8GJiMuXe04QlY0RCTqq9Mn15mn
 7N4AWuCIj4Smb5sD2KYetGz/DmVEFNhDQJgnBuILiEYB6y8r1E2G2EadPQO8K7tEPf
 KxKWKNWvx7T0Q==
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
Cc: hari.prasathge@microchip.com, manikandan.m@microchip.com
In-Reply-To: <20240131033523.577450-4-dharma.b@microchip.com>
References: <20240131033523.577450-1-dharma.b@microchip.com>
 <20240131033523.577450-4-dharma.b@microchip.com>
Subject: Re: (subset) [linux][PATCH v5 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-Id: <170738870103.916068.17422553727568917627.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:38:21 +0000
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

On Wed, 31 Jan 2024 09:05:23 +0530, Dharma Balasubiramani wrote:
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
      commit: 7dd93269787781869d3dbb23138ec1455d26b047

--
Lee Jones [李琼斯]

