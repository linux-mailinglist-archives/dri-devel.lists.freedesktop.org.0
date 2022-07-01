Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AD563169
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 12:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168310EDCC;
	Fri,  1 Jul 2022 10:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE9410EDCC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 10:31:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8EBD623F0;
 Fri,  1 Jul 2022 10:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58122C3411E;
 Fri,  1 Jul 2022 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656671480;
 bh=PzSQe20vyGgKjj7bh4FY+eUYxZ15YBI0Skb7DjyLz/8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kwBlRyc/+7zHK/+D1Orop4T33zg2uPrmUjsGkNZAU52FjlKmpsb++xU1wPmV1Sdrw
 k4lB1lGBPqolSXmaVZcNAGFjgST13USJwcNorRHO0OGx/hzi0VABG7ZTo8N7/TuHE2
 HxaECpn986NnZFTn1yzoeBsf+ZI4OSJnoey0UsvUno7oDZ+pMXkeNnXKR1PwQQv7H/
 N9kuWrxo5c2iCitQqKmW068YiY9uPx4FEOea91RPuRZGwW8oY4qU7G4DXYqbe8FC8m
 c/Z3X/cBEeVfPh/ZqshT/s0Jav6xLxcoMGxNTeEs/B5Wuklqf7C6n5RtWyUg6RAJla
 6Gx1v1dJgB63g==
From: Mark Brown <broonie@kernel.org>
To: mail@conchuod.ie, palmer@dabbelt.com, palmer@rivosinc.com,
 lgirdwood@gmail.com, thierry.reding@gmail.com, fancer.lancer@gmail.com,
 daniel.lezcano@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, daniel@ffwll.ch, sam@ravnborg.org, vkoul@kernel.org,
 airlied@linux.ie, Eugeniy.Paltsev@synopsys.com
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
Subject: Re: (subset) [PATCH v3 00/15] Canaan devicetree fixes
Message-Id: <165667147407.1756128.12037224598634241859.b4-ty@kernel.org>
Date: Fri, 01 Jul 2022 11:31:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, conor.dooley@microchip.com, joabreu@synopsys.com,
 geert@linux-m68k.org, paul.walmsley@sifive.com, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, masahiroy@kernel.org, dillon.minfei@gmail.com,
 tglx@linutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022 19:43:29 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/15] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
        commit: 8b037cabc4966b010c44a76e05a43d276318bc49

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
