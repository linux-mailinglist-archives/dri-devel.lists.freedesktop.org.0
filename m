Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A860B61F1B8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4510E2E5;
	Mon,  7 Nov 2022 11:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64CC10E2E4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:20:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D343660283A;
 Mon,  7 Nov 2022 11:20:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667820026;
 bh=4GLK87T5vBSOqiSGloJWJSHYEYZ8q1Ph3WTRsU8DmKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b48ldE8vEdmB4cELPLhlq6/zg5UPab9Qz4/Xfxs+Vv2fyJEFUzO4H4B+cLiHeTSv7
 TRkgiPTGbxGoK4lOleFzzdyOq2O3guLGtKJlq2x3+VLRntrLNizVnYSOQbmWTZc0gB
 E3BRzEDA0+SSlB9e3nlag9iOGwyQWomlpdmfqp8Z5DFSX8vIAwzNFt8sGFLfS7mwhr
 JgEqp4K0BXNVqHzrI2BknmldG4vQ9yO1VSAwuoe6suqkozOBM5giMiGAnvNbqe9HwG
 aWr945ZoVmPM57JozrbJzg1sUkmNcOvP9n7fbCWwfKfrzlI6XW4Sk8G7t0YFuVDg/m
 k1nKr69ca5i1w==
Message-ID: <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
Date: Mon, 7 Nov 2022 12:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-1-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-1-a803f2660127@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add a compatible for the HDMI PHY on MT8195
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Ack and R-b tags go after your S-o-b.

Apart from that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




