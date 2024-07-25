Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B193C728
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DCF10E2C8;
	Thu, 25 Jul 2024 16:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T8eboKwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30E10E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 16:29:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F1B84CE13CE;
 Thu, 25 Jul 2024 16:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E65C4AF07;
 Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721924946;
 bh=6M9VEwQ0bCBbEukoo/UWmk3UpgsSaKDRg0kAVMformg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T8eboKwt63bDwOUKiZpVQxR38fh1QOLlVI2F7pPUT9mbxxqyWa4EvKAxGnXp3/CbV
 n/Scg7QCtvteXcE5w/IHr87pLi4oVXk/ngNMgo0Rn4fYa8bj81/xOVUcM0IT+DRUIM
 0nNQ/NJZ628zHQdrwnbQ8mbRYdMwG+EirQiVeVKitq/yRyPjpXoYPeDQhJ89JxLpUD
 Kl6l+btIgr5OZZ6WKKpslw1c9LKaB/IC+xrnw5IQM8cgW1zGqsf56I+FEqfVhhRls5
 QhGGBlKzaxr2E2O/wRrA45cbF6fCq+rT2KQhAjP80z/YOMguStbJz3vP7RbvfbBEsQ
 g9db7e7JW4xew==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
In-Reply-To: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
Subject: Re: (subset) [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add
 codec property for MT6357 PMIC
Message-Id: <172192494107.1054722.15668367028139729556.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:29:01 +0100
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

On Mon, 22 Jul 2024 08:53:32 +0200, Alexandre Mergnat wrote:
> Add the audio codec sub-device. This sub-device is used to set the
> optional voltage values according to the hardware.
> The properties are:
>   - Setup of microphone bias voltage.
>   - Setup of the speaker pin pull-down.
> 
> Also, add the audio power supply property which is dedicated for
> the audio codec sub-device.
> 
> [...]

Applied, thanks!

[03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
        commit: 3821149eb101fe2d45a4697659e60930828400d8

--
Lee Jones [李琼斯]

