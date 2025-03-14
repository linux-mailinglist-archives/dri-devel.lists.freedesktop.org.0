Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81899A6100F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992910E9CF;
	Fri, 14 Mar 2025 11:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0WnNX0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C639D10E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 29BA3A441BD;
 Fri, 14 Mar 2025 11:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB385C4CEEB;
 Fri, 14 Mar 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741952215;
 bh=5jbzIcEu7rwa00GINfO3vvUggjO6E96rtOU63PwyPi4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=V0WnNX0bpdne7Oo1Vrr2fMv+OrFpEA/37KemBFxHsSPz5TI3wC8GPeFO163Tgof98
 rmhHEndV9+n2gQ4Z2qVnWDrKyZh0sA8qzXaY1Tjm1mp8VW9DU24zXaUheG+FEC0k0c
 tlwblQjPzdXvlsgUku9P/NKtVXWqznEe1+a9PujHoXItR/pxaUgpA0++3mdYp4xSza
 nDQQBF/dpmSJcVgdlm+pKvKwzmxRXWWv36T0znSxjlvgg8w9sAXOg6Ou36Ks7h9iVb
 YJVT9eXa4Yt96SfVsHe1O1po5Oc9oDs2Pijl7bub2ta8Vn+s6xaujUuTC4GNxaNXvD
 WaSp2fEyAdp2g==
From: Lee Jones <lee@kernel.org>
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, 
 sre@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
 alexandre.belloni@bootlin.com, danielt@kernel.org, jingoohan1@gmail.com, 
 deller@gmx.de, linus.walleij@linaro.org, brgl@bgdev.pl, 
 tsbogend@alpha.franken.de, linux@treblig.org
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250311014959.743322-8-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
 <20250311014959.743322-8-linux@treblig.org>
Subject: Re: (subset) [PATCH v2 7/9] backlight: pcf50633-backlight: Remove
Message-Id: <174195221155.4008217.14149921373468540055.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 11:36:51 +0000
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

On Tue, 11 Mar 2025 01:49:57 +0000, linux@treblig.org wrote:
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> [...]

Applied, thanks!

[7/9] backlight: pcf50633-backlight: Remove
      commit: dfc034a0494b8fb8ea881aeb41a0c4e2619ff1e4

--
Lee Jones [李琼斯]

