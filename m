Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1097C90E770
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C76E10EBD1;
	Wed, 19 Jun 2024 09:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OTUCVd1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87810EBB2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718790934;
 bh=RgR7pL3q6FdzPNPxMoHYHj3+d6yEDIjf4KWYmXODHlY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OTUCVd1SLJQ05t+OduwXHaRfIRbVoR5/XhgVJb9HsZShVz1HbDbckPUqXRF+PN2bM
 XmZAq3vM/JSReGHz0ARFMXKO0Al8gXt9Neo6lckyi6icceTkt0bdoEPJIP3gwoBH7Z
 J7tn0XyQinzdIGi3KEuYvZwt9A+byQtNSDm8jUPNxeVbBtITfnSPEl3NmrqapokyqH
 g1EycX1z3VbO0s2EJbt/n4Fw4dLip+Ff9EB3lwQP7TJX0ROqfxw+bcurna5Ey6MQVk
 Si1ZrDtvbPetpAPc8neh+R8Xr9YSigY3AKlcc+8MLiaem81Gf6dI5ufk/5rsexYzaE
 1uCvV+6kWR2sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CFF413782163;
 Wed, 19 Jun 2024 09:55:32 +0000 (UTC)
Message-ID: <0942a9d3-fca4-4c59-9a3a-47717111233a@collabora.com>
Date: Wed, 19 Jun 2024 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 08/16] ASoC: mediatek: mt8365: Add DMIC DAI
 support
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
 <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-8-54827318b453@baylibre.com>
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
> Add Digital Micro Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

