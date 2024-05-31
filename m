Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3758D641C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF0F10E1E9;
	Fri, 31 May 2024 14:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DNHR+J8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0010E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:12:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9CD962CCC;
 Fri, 31 May 2024 14:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2049EC4AF08;
 Fri, 31 May 2024 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717164744;
 bh=nE28feJXr8MPuJwuEZRSEsHxpTmzh4iG2yFFSYfyIBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DNHR+J8BC5mW9id4WWWHd7JyQ+k4VIq8JWrWB1y4icmwRs26+ZlCFFDBI9SUREwac
 RUNKB7A6lF5higO8ga1VVxKf4p3OLjycx28XoEINCg/0Fp5ysq2QBj1TSQ/yedIT8z
 xuShXtCgyrYgelRbnb+4Q2tdfZKEwUS058HByGfRvvHrP1B4yBdmPzmoU8RHfOnTZC
 g5pGpKiuX7Z6aWYyjOyfWKfQVI4bGIxmlRrUAaUEpIMmDHic5v13kiIHWhNHr5YXDR
 4PFagZxclHfaMeHC1BzS1vDQXyBzzml8MeSJd2kbcNJRCFBNp/CG0nOcVRFNEJS85d
 UPJI01ya2jm6Q==
From: Lee Jones <lee@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Patrick Gansterer <paroga@paroga.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20240526105136.721529-1-paroga@paroga.com>
References: <20240526105136.721529-1-paroga@paroga.com>
Subject: Re: [PATCH v6 0/2] backlight: Add new lm3509 backlight driver
Message-Id: <171716474187.1122706.14204003162391534648.b4-ty@kernel.org>
Date: Fri, 31 May 2024 15:12:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Sun, 26 May 2024 12:51:28 +0200, Patrick Gansterer wrote:
> This is a general driver for LM3509 backlight chip of TI.
> LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
> Dual Current Sinks. This driver supports OLED/White LED select, brightness
> control and sub/main control.
> The datasheet can be found at http://www.ti.com/product/lm3509.
> 

Applied, thanks!

[1/2] dt-bindings: backlight: Add Texas Instruments LM3509
      commit: 0aaee23d49a614b573ca51ab7758e77fcc3d7d14
[2/2] backlight: Add new lm3509 backlight driver
      commit: b72755f5b577357cac661cbf9048cad704eb4ad8

--
Lee Jones [李琼斯]

