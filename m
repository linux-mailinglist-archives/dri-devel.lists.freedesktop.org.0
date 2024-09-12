Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BB976CAD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606810EBC0;
	Thu, 12 Sep 2024 14:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HrxG7s+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7E10EBC0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:51:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 60A815C5B77;
 Thu, 12 Sep 2024 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84085C4CEC3;
 Thu, 12 Sep 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726152668;
 bh=YzlriyEKn+i3JtEOOQGPkP98c79C4k//CQThjLlVVc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HrxG7s+4gt4QkbKM94COqUg/lsJfAnNxvZG4sakPtakRVd8xz6ynsRhLd72JCnXPg
 QAzGWtP+eCsqYPIzj1wR02E4WW9qULYbKYk0+WGJ2u6/fe/JHnp/VOVtXzohpkQn4h
 oa/Du/8mrhank/o0dL7v71V05rNZvL+1swetRDqm18bfFB2dfPuaEVuADcW2uOO7+v
 IZiwkqPeN1hPhQRce4OF5+y3kjru3mbfQY0tleSF0kq/09kfYfowjzt+IPiGVxWtmw
 CXYmCQ7oJGZ58rITCVxchFy4RaxlEEOwJZz2bLV6SqlkJOpJo84iIFqAoibzyjo5bA
 MapFVCGcHYUkw==
Date: Thu, 12 Sep 2024 15:51:00 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240912145100.GE24460@google.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
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

On Wed, 04 Sep 2024, Mark Brown wrote:

> On Mon, 22 Jul 2024 08:53:29 +0200, Alexandre Mergnat wrote:
> > This serie aim to add the following audio support for the Genio 350-evk:
> > - Playback
> >   - 2ch Headset Jack (Earphone)
> >   - 1ch Line-out Jack (Speaker)
> >   - 8ch HDMI Tx
> > - Capture
> >   - 1ch DMIC (On-board Digital Microphone)
> >   - 1ch AMIC (On-board Analogic Microphone)
> >   - 1ch Headset Jack (External Analogic Microphone)
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
>         commit: ceb3ca2876243e3ea02f78b3d488b1f2d734de49
> [02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
>         commit: 76d80dcdd55f70b28930edb97b96ee375e1cce5a
> [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
>         commit: 761cab667898d86c04867948f1b7aec1090be796

Did you mean to hoover this up?

> [04/16] ASoC: mediatek: mt8365: Add common header
>         commit: 38c7c9ddc74033406461d64e541bbc8268e77f73
> [05/16] ASoC: mediatek: mt8365: Add audio clock control support
>         commit: ef307b40b7f0042d54f020bccb3e728ced292282
> [06/16] ASoC: mediatek: mt8365: Add I2S DAI support
>         commit: 402bbb13a195caa83b3279ebecdabfb11ddee084
> [07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
>         commit: 7c58c88e524180e8439acdfc44872325e7f6d33d
> [08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
>         commit: 1c50ec75ce6c0c6b5736499393e522f73e19d0cf
> [09/16] ASoC: mediatek: mt8365: Add PCM DAI support
>         commit: 5097c0c8634d703e3c59cfb89831b7db9dc46339
> [10/16] ASoc: mediatek: mt8365: Add a specific soundcard for EVK
>         commit: 1bf6dbd75f7603dd026660bebf324f812200dc1b
> [11/16] ASoC: mediatek: mt8365: Add the AFE driver support
>         commit: e1991d102bc2abb32331c462f8f3e77059c69578
> [12/16] ASoC: codecs: add MT6357 support
>         (no commit info)
> [13/16] ASoC: mediatek: Add MT8365 support
>         (no commit info)
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

-- 
Lee Jones [李琼斯]
