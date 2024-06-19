Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1D90E7A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08610EBF5;
	Wed, 19 Jun 2024 09:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BgpkkD+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D3B10EBF5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718791125;
 bh=3DgwcQEpJg+efanAve5I4mMMZoiHaWnUZB/zpU57N9o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BgpkkD+zwBWb+KtGZW8JOKmhG6ZpcccQWu6eAPU6eRO9Pi6z4f3mDI8Y0Zm0IFiih
 QotGPFng1sbxYrqlgtu0MA9FIiNjbhqKyTcu0kC3Kcz9LZ1jG5TQS1buvZIXGD4UEF
 kLszpPyzgKOnATlbm8jy0Tb7Bm89D+3ua4/1F2Z5ZQCGrd6qTKZnPubS9NuFOlsMvO
 FtOVkJHbRW8jqWg3Qd4vXH0+MP26JIbeZSCsS/sywr5dqmBBmdwFno/HzkvViErNMz
 HX4rGVwUHmyVuaRSjHVHcqF1vPt6PzkynBZuYRSlINrg0/vyTMXkDwol29W2IcIDV6
 MDJbvV2I7q2bg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 985913782163;
 Wed, 19 Jun 2024 09:58:43 +0000 (UTC)
Message-ID: <6ba7aad1-0113-4e07-9420-18369ec6a79b@collabora.com>
Date: Wed, 19 Jun 2024 11:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> Add audio front end support of MT8365 SoC.
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


