Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F99079A1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3580510EB35;
	Thu, 13 Jun 2024 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kXFfAgqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781A010EB39
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:20:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC2C1CE2723;
 Thu, 13 Jun 2024 17:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66789C2BBFC;
 Thu, 13 Jun 2024 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718299212;
 bh=Apy/YJfzCXG5qBffjVb5Em/7Y/ajo8ZRh+LCsukDKns=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kXFfAgqGGfRDajw1ZdSl8ujZ8VNXRrUmaB5qtDjpeh2Z+N7taNOmSuloB3JcuLlxY
 cQn7auRp4fQYw9q4qszuzglsJCU4SucZjkUAaahDbFKjsIUGkRvXpP28EcpM0Agd9K
 n8d6bfEiH0f0BmM9k7yQCnIqphMMFwSJc9DQSOvYG5VyhINGHmMerx0TozM2JWMXJX
 jp0xnrq5xZme5OE7Lfk6dn0LQxUWD094vSQxaCEtvXPP0ZS3q3C5r0ygn1by4LYoFv
 98QoRL7uyWnk0lrdx5nK4cw8ssU22dTHjOyn6y7qQGitRvmteIrGdvFrr/zCW+s5Bf
 yMtoAR8UHUmOQ==
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240612-md-drivers-video-backlight-v1-1-f4ca1beb36cc@quicinc.com>
References: <20240612-md-drivers-video-backlight-v1-1-f4ca1beb36cc@quicinc.com>
Subject: Re: (subset) [PATCH] backlight: add missing MODULE_DESCRIPTION()
 macros
Message-Id: <171829921116.2731555.2620177411029795057.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:20:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Wed, 12 Jun 2024 07:12:31 -0700, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> 
> [...]

Applied, thanks!

[1/1] backlight: add missing MODULE_DESCRIPTION() macros
      commit: 7857f5c38d04a38e7a20060a6d370caf0424aa4e

--
Lee Jones [李琼斯]

