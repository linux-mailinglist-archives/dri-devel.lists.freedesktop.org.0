Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF5A3DE06
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F010E144;
	Thu, 20 Feb 2025 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RJndwkrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0113810E144
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:14:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 023CD5C5E04;
 Thu, 20 Feb 2025 15:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79472C4CED1;
 Thu, 20 Feb 2025 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740064485;
 bh=Jr4RZS/lLGSYYUJMf0yeHvt9Tqeg9FKGi1tgzkVvkgg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=RJndwkrSKfX2mzgsQQfynKTyajKX/j2plUbo3YFVKpm6aUFT7VYdMyzN9qc34fllF
 7usoiCpSQRkDI2NbiDYsqOd0eh2mNUMaYXUCtamP42vvZ/ry+f90XctS7/3vs3KeNA
 1kSzKEL8di2BgD4lgYWeTWUvZ0EnXfU3XDtITFQDIGjVPovtntDywBA1ISKrizZWsR
 Q2kbp3LTNV7fOllQy2ZsHa2M4pXotics8y1Yoe0nOTBTXSBTEE/SqXNQehkXkPnvVk
 7cexNoowoVyRuleDw/cDnHkffNBKU8p8KVbqGcl/gXCxGx8DVB+ZWi2uJxWiE86JmD
 PFUoUjgDiOmeQ==
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
Message-Id: <174006448223.804925.7595809321241346941.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:14:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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

On Fri, 14 Feb 2025 12:02:11 +0800, Nick Chan wrote:
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface.
> This series adds a backlight driver for backlight controllers connected
> this way.
> 
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
      commit: 0508d17506fffb6d38df4c2dc737fb4f343a0840
[2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
      commit: ea45d216dd4e5b389af984f8c9effa1312e3cd74
[3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
      commit: d1ebaf003a065d5d337b8fa3d69f9b90d7bb759d

--
Lee Jones [李琼斯]

