Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F8533D2F
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1D310F5A7;
	Wed, 25 May 2022 13:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95CD10F59E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:05:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 098BF1F44E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653483902;
 bh=gViAEDYmrng0CSzEk780jnUimbEF/5qLDHyneG+N2y0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l1YD1DbCcvxx0b2C9BAQPdR3sMaZT6pjm6m0/b9f9Z53w11xMF/QGKDJdQu4/dO+8
 Ddj4Wvok1u9FMBprtouSjtEb1qRwZo3tKrnTgJ9ZJG6+bbPtQsrmOnyRs61TuCcFtA
 JPe3ei96GsuPKoIr9igulzhrqsJCh9+Ie3I5+qTVA8As9U+HjdJpPmu3KPGfmyuFxC
 NtVRDyRnENOxfwqvpxkopl+p4LDlvsUaQHCnSSsp0iR0FHweY9ZaqME94NXDUQidC8
 jnUp6b2Wankw5/iPlTSEleo90ERD5EpGQpw0pKy2k2TtVBUyYcdsgidMzBiqLRS6No
 4OJr/vKoGaM/Q==
Message-ID: <5cc99fd7-1401-511d-37c3-77f18b08e597@collabora.com>
Date: Wed, 25 May 2022 15:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 19/21] drm/mediatek: Add mt8195 External DisplayPort
 support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-20-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-20-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> This patch adds External DisplayPort support to the mt8195 eDP driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 104 +++++++++++++++++++++++-------
>   1 file changed, 81 insertions(+), 23 deletions(-)
> 

Your patch [18/21], contained in this series, introduces mtk_dp.c.
This patch [19/21] cannot be applied cleanly on top of 18/21.

What happened here?!?
