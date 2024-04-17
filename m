Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9D8A853C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41083113543;
	Wed, 17 Apr 2024 13:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3DctJJn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3C9113540
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713361823;
 bh=C10c0j9rUMDZTqWWXJ3mbmlN530Uqy2jVku/X9owZB8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3DctJJn9xKbax1ctnQtqhoj9wcBbyIUez6JUTeoNeiXYXKeXFwscqwquGvopFS5jA
 CeORZDrLvUxoswS0xOUrRoLOcPBLraDXfh7T4HIYsNeWKadYqaczN33+x4nULqlZjK
 cMSyoGf+ZioBTkqU0wU8w8c+RuKiraubHBkxak7Zd1rpGMXDCI0cOPJDG8ZFTMKyQP
 U460A1XGEFyOVbHHnNywDb6ziDstMz8qm+lN/q10nmT/B5YT0SFZB2LVTL2syaaSb8
 LqphPFRNZj0iqJ94rBaNzFcMYJSYt5M5QrVsNCPAkJBA1ZDitl9IRpRN1hBfuW3jAG
 jZnXF9/LhltFA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 62DA3378001E;
 Wed, 17 Apr 2024 13:50:21 +0000 (UTC)
Message-ID: <f04ac76d-4348-4b79-890d-829114921299@collabora.com>
Date: Wed, 17 Apr 2024 15:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
 <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5vqnkgp77tir5j5cumo62pm2cw4xjabexu7nk3kze4gk4ri5dn@g3pee2beuuco>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/04/24 15:25, Uwe Kleine-König ha scritto:
> Hello,
> 
> On Wed, Apr 17, 2024 at 12:19:19PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
>>> According to the Mediatek MT8365 datasheet, the display PWM block has
>>> a power domain.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
>> It's the same for at least MT8195, MT8183 and I think MT8192 as well... so
>> not having that from the beginning is actually a mistake.
>>
>> Please add a Fixes tag and resend, after which:
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> You mean similar to:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fb7c3d8ba039df877886fd457538d8b24ca9c84b
> 
> ? It seems someone you know well was quicker :-)
> 
> Best regards
> Uwe
> 

LOL! I totally forgot that I fixed that already :-D

I need more coffee!

Cheers,
Angelo
