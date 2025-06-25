Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60BAE8E2C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 21:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89110E7DA;
	Wed, 25 Jun 2025 19:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jQXCQmT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD0F10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 19:12:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFDBE4B26A;
 Wed, 25 Jun 2025 19:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC099C4CEEE;
 Wed, 25 Jun 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750878747;
 bh=+qriwj9qU4FY/kuIp4wDLlM/t8OqijQo1R2YW3zdLuU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jQXCQmT8D2h0EMiy0LeKaMVgq4MMLwiB5Ojl9jxZUv3lfWTMXOdg/Ik0UrDQyUSjL
 4MyfWPrrhsFgzVudtvHgpM62ZTCCpPxy35fmIvUUFQNGqTyaa+MlvHiuIsfLG1LPq7
 DqO/X6euoQBAnIVWUFCtnMvL/ngetC26Gn7NfJVTg6zqih6MrgmXqtLPNUAMhF8Dyl
 MqUCjuQmArTDzS7IxOthC7s73wiH1W/851Whej89BlsJAhXIvMsYOcLLDNVEoVpD4k
 IO0k5pr5rxMRmHCfbJBy4JwocPtv2E4fPF/CDD2INuRNUBPSpXrHi/aKwXrLqj48Gf
 MZhLmOg8QqPSA==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
Subject: Re: [PATCH 0/6] Add few updates to the STM32 SPI driver
Message-Id: <175087874236.261602.8727707950137724434.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 20:12:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-08c49
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

On Mon, 16 Jun 2025 11:21:01 +0200, Clément Le Goffic wrote:
> This series aims to improve the STM32 SPI driver in different areas.
> It adds SPI_READY mode, fixes an issue raised by a kernel bot,
> add the ability to use DMA-MDMA chaining for RX and deprecate an ST bindings
> vendor property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: stm32: Add SPI_READY mode to spi controller
      commit: e4feefa5c71912ebfcb97a3dbe2b021fd1cea9d1
[2/6] spi: stm32: Check for cfg availability in stm32_spi_probe
      commit: 21f1c800f6620e43f31dfd76709dbac8ebaa5a16
[3/6] dt-bindings: spi: stm32: update bindings with SPI Rx DMA-MDMA chaining
      commit: bd60f94a3eb4f80cb66c9687d640554fd0c579d0
[4/6] spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use
      commit: d17dd2f1d8a1d919e39c6302b024f135a2f90773
[5/6] spi: stm32: deprecate `st,spi-midi-ns` property
      commit: 4956bf44524394211ca80aa04d0c9e1e9bb0219d
[6/6] dt-bindings: spi: stm32: deprecate `st,spi-midi-ns` property
      commit: 9a944494c299fabf3cc781798eb7c02a0bece364

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

