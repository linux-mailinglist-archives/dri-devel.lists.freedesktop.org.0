Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39AE5ED75B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDFE10E33A;
	Wed, 28 Sep 2022 08:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3DC10E331
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 08:14:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 55ED26601FE2;
 Wed, 28 Sep 2022 09:14:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664352873;
 bh=ZTffMGvl6kR67yXKJkdyqTMDaVatMa+JdBfwAgN6EI4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dfS5YxyXVVsenZZOy7kWoQBL0sUwD6fKHrZtM2A0VmjyEqNPvds+qLvLtDQ8WWZw+
 xJ83tNNsHv7kTvK3fR8FraBdC/6c2Gj+Mm9bUvgK4ZAqqGVSJvi9VfhmP0desROXpl
 XU4cGlPjgDsMQAbJRbKBYkqNdxJXAlU2MxToFw3KHLIeXIY+R49H/rChA1/kZUCu4S
 F6l4aEuN9DvgJ4w8TTPIgrfsDJK0SE2YxyJCW2aVGLVJNKcinPV+3aZGcefrezWdjN
 yXMaTp9nr/4GzXnxZ69LIaIsiKlzNhw97lyNiELMxu7wCnwcd0iObyoDBz+9FQyidL
 CkwlmxNj3LKAA==
Message-ID: <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
Date: Wed, 28 Sep 2022 10:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927152704.12018-4-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
> 1. Add mt8195 driver data with compatible "mediatek-mt8195-vdosys0".
> 2. Add mt8195 routing table settings of vdosys0.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


