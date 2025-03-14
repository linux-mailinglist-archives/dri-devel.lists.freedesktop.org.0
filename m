Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE585A61037
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E244610E981;
	Fri, 14 Mar 2025 11:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rUqIMvDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9243410E981
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:43:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1AA5A4532A;
 Fri, 14 Mar 2025 11:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9191EC4CEE3;
 Fri, 14 Mar 2025 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741952605;
 bh=HhnRgeIRMl8/ytxbRB5L7HJeFXLaGEfrKsFgITuJCvI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rUqIMvDkJPFPCIq8jp3YHiYV3Gkj0ISBfNfEhyGb/UYdeNZ9wvPqnfLIeTOkKFmYV
 dFNxLMNyjlpZZgoLlmVRwNAvDXLl+UYC1i5hq6DBp6/Im/fXKy+DukkMRx5nJmMupM
 LjNMv+Y0nvOFd9gjlJidoByXiu2ub1uT5UW/KW5Xvvama+/3ffoD72FyGdBom6UsQY
 h6h3ReIQtoB/BqwnOgT4gfBoUp0sTLFs7JlDIhBses8n7h+fsiqHNHPgbqAK+e6L0h
 CaX0FIPH5AWPOKRsb+OOJxnXh+HkCy4HvK+lWQz4dKqVe6gt7eCFW+fNvtTWh3H6RH
 I1lEigMyHyA+g==
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
In-Reply-To: <20250311014959.743322-1-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
Subject: Re: (subset) [PATCH v2 0/9] Remove pcf50633
Message-Id: <174195260130.4016186.12257329269298391220.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 11:43:21 +0000
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

On Tue, 11 Mar 2025 01:49:50 +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> [...]

Applied, thanks!

[1/9] mfd: pcf50633-adc: Remove
      commit: 0d0e54953805af76f0022df39602f5668145f747
[3/9] mfd: pcF50633-gpio: Remove
      commit: 8559602247d0d054451c7a755942588d2c0de85d
[8/9] mfd: pcf50633: Remove irq code
      commit: 786ad21f4350601c9d118ddbd19b7b830c04ece6
[9/9] mfd: pcf50633: Remove remains
      commit: 44356090d59efd8db152e9eecb8e7f843be319f0

--
Lee Jones [李琼斯]

