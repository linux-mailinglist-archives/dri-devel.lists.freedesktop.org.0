Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DF88FEB2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11181123FB;
	Thu, 28 Mar 2024 12:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Spbsk7Pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572521123FB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:08:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF37061716;
 Thu, 28 Mar 2024 12:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEFBC433C7;
 Thu, 28 Mar 2024 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711627710;
 bh=EOIqVbBIZHvmBl2nm/3zOxapkwwfi8FK8QI0I/jzM24=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Spbsk7PjMKIKrWSHfhR2U6ayxxErjKwTza79sGUVMTiZm+8phYPhbzdHuQpuM7nKO
 OHV2i6e0nxXj4T0sEBBRsFe7XzFIjecpGJPdijgToMeXY53AZ8XZlIzNS/gCYGTtuf
 +BmDBbFlrgoUJwVhP/czcBIpPwN2TN47zg1PN0YeOITmPuw0NARTWLHmMMxlVhs1YU
 YbTlsDQNCZVt0FpdnRq3oOdYZ5M5aKFB9wGhIVD5XoakV2jz++kC4g5x82fq/RbtDq
 3vfPZbegZ95axifNinQCt8/aSmoIwQgDTxOdjQ0USBHkchxqooRQlWK0I2FobV4LIy
 NB91Uw6Mr5wtg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
In-Reply-To: <2024032805-putdown-mushy-a0f9@gregkh>
References: <2024032805-putdown-mushy-a0f9@gregkh>
Subject: Re: [PATCH v2 1/2] video: backlight: make backlight_class constant
Message-Id: <171162770830.1983471.4181539912129600848.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 12:08:28 +0000
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

On Thu, 28 Mar 2024 12:59:06 +0100, Greg Kroah-Hartman wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the backlight_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
> 
> 
> [...]

Applied, thanks!

[1/2] video: backlight: make backlight_class constant
      commit: 6683414cff25dc5b6e7dfe9dadf42b718384c892
[2/2] video: backlight: lcd: make lcd_class constant
      commit: d51564f749fe4e4efd570b0591f2d23696c90cc7

--
Lee Jones [李琼斯]

