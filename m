Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA9845675
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 12:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4762C10EC3C;
	Thu,  1 Feb 2024 11:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BU9Dmkd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (unknown [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74D410E9DE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 11:47:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CEB78CE248D;
 Thu,  1 Feb 2024 11:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC0C433F1;
 Thu,  1 Feb 2024 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706788010;
 bh=B6kqzkRK4glDQvlEuCa9QVdBlMc7GkHgutxdKIuYASU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BU9Dmkd3b5PaBA9/hvqiJqUvtIzvUbxV+Gl5YTvyNJ+LpLHTKsI7NkCho6lTprxi/
 C+nDFKDuNTxySZcwYmjmFP7/7rlyXytOWKq6E2C3JlWH/LvmRe+0sGL6RPxR2g2O3e
 xa+3UZEUyNLM02j96GUksR4UnUPN4kDl53DYI1drM6zdIQbJQ0jtr6ZzwQLLYNWobr
 23NNiexqgAtEzo7A/1dOtraNfEhXXEcFC1j/3e+zEZEUJhCIWKt1C6KmxcjzpEBpfb
 iY/6OwaIB43ugX3lbPFWIpLSMETL0XkWi9UGtxuSqeMuVnQAx84gb4IrYBEdRShmI2
 ZOOlxdUxVCPnw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
In-Reply-To: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
References: <20240125-ktd2801-v5-0-e22da232a825@skole.hr>
Subject: Re: [PATCH v5 0/4] Kinetic ExpressWire library and KTD2801
 backlight driver
Message-Id: <170678800633.1338717.2755658439241529457.b4-ty@kernel.org>
Date: Thu, 01 Feb 2024 11:46:46 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Jan 2024 16:30:52 +0100, Duje Mihanović wrote:
> This series adds support for the Kinetic KTD2801 LED backlight driver
> IC found in samsung,coreprimevelte.
> 
> Support is already upstream for the somewhat similar KTD2692 flash
> driver, and this series since v3 also moves its ExpressWire code into a
> separate library and converts the KTD2692 driver to use that library.
> 
> [...]

Applied, thanks!

[1/4] leds: introduce ExpressWire library
      commit: 25ae5f5f4168bbf91e7b6b126d24c30c91ef952e
[2/4] leds: ktd2692: convert to use ExpressWire library
      commit: e59a15af7aa690fa0997758df23069a9f0756c49
[3/4] dt-bindings: backlight: add Kinetic KTD2801 binding
      commit: 4ac621a418ce8f4c562b50ea6f676196bd5262da
[4/4] backlight: Add Kinetic KTD2801 backlight support
      commit: 66c76c1cd984c14660453dfa2118014817924375

--
Lee Jones [李琼斯]

