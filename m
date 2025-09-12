Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF3B54655
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 11:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D320110EBE3;
	Fri, 12 Sep 2025 09:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e3NUhl7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12B10EBE3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757667644;
 bh=I8lnMndXG8pdCIl26nEFltqvWn8FNn3OcwqWnXiwNbY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=e3NUhl7PV7etZf6rkduBXP9LFytOiLRWRVHpQQi34pLQH2vmBc4DiFZqBhkEoahk+
 5lqCt82nU8wxCLKpQoITHdJ8Z0JsAUN8gOiCPGkt/3l4KRabrWgd5GMXOYQR7MNjEN
 w8GljBH0yMYh7X4ylpEAJ7M3LR9VBwXXRQIkre1CLWp79yxx662xYoLeF+NA97Tx9n
 BwwzxDPf26QjC+A4fKFR3wlu0CKWesFtQY6iOeUPiM6YJbLuMgtk36+zTtoNy9JK3J
 z2oi2V/9DNedgWdar2swblhT1SWvuu35nFikjvuz8hxt/bUi712fqQesF/nE5n4J3I
 4es+30UGJcTSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F6A17E07EE;
 Fri, 12 Sep 2025 11:00:42 +0200 (CEST)
Message-ID: <56380fe5-8358-4341-9478-ba4ce52daeed@collabora.com>
Date: Fri, 12 Sep 2025 11:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow
 range number in node address
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
 <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
 <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Content-Language: en-US
In-Reply-To: <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
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

Il 04/08/25 11:02, AngeloGioacchino Del Regno ha scritto:
> Il 24/07/25 11:14, Krzysztof Kozlowski ha scritto:
>> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>>> The dual and triple core jpeg encoder and decoder (respectively)
>>> on MT8195 are far apart: the only way to have this to make sense
>>> is to split those in multiple address ranges in device trees as
>>> one big range would overlap with other IP in at least the MT8195
>>> SoC.
>>>
>>> Change both the jpegdec and jpegenc bindings to allow specifying
>>> children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
>>> encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.
>>
>>
>> This should not be needed for standard MMIO/simple-bus nodes. I think
>> DTS is wrong here.
>>
>> Which cases really need the ','?
>>
> 
> All of the multi-core JPEG enc/decoders on MT8195 (and newer).
> 
> The DT changes are included in the same series as this commit; check:
> 
> 20250724083914.61351-35-angelogioacchino.delregno@collabora.com
> 
> Cheers,
> Angelo
> 

Any further comments on this?

Regards,
Angelo
