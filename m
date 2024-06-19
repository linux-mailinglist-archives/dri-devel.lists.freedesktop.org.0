Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF290F183
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5807D10ECFA;
	Wed, 19 Jun 2024 15:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dAXHebve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36710ECFA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718809277;
 bh=SmW8jSoigqN6cXoH7/DH+OEqxD9eVzAWpC7UQd+YfOw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dAXHebveT8Z0LIwwrZndAskYgi/KtH9bd+ORG3mdL1fEJCpMndK4S/UwvEFgrUVYA
 sbWfxMS9jtr9gPUy9ZCz8bBypgNp5+H4wB1mrWyAq5Ra7A5WeDMUBbn07SVUsxoeL0
 OuDkCK6wv8xelfg8wY2ehNC2OMQmBk6mlrM4P+uV0xzm+1dFYbFSjGAAl5htKAuTwt
 z6f+QHvb+dw5z43BEaW7C9YTl3cNrqQst+kTNHrz8zuB8Q/qhKFUu6loz6sIg+JaFU
 +ygZomYwr34YzE3gyG3odXSObZqVqQQXJuVZdXuhjN54/q2HM/lbD+CBDBsdtjdBNB
 /antbN/BpvPmw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5526E37821D3;
 Wed, 19 Jun 2024 15:01:15 +0000 (UTC)
Message-ID: <27eefef0-4485-4db4-9336-2f01b9187362@collabora.com>
Date: Wed, 19 Jun 2024 17:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
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

Il 19/06/24 16:46, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add the support of MT6357 PMIC audio codec.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


