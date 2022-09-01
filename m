Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9DF5A9535
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD2B10E66D;
	Thu,  1 Sep 2022 10:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BD10E66D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:58:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DBDD6601DF7;
 Thu,  1 Sep 2022 11:58:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662029912;
 bh=J0a7JIYzSfLJ+NmiuKc1E8YXYw0cLkKnM9rQliRatI8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vb4UzK09kZ2A61z7ufCdC23usamdiAglog33FnJ+oLYi3dkxmwmTiRvJlzII0IPS7
 2LH5JHyAmZE9ywWFhlGNnG5wNUZlRcAS2lEEL5xI7xiQ1Fi8IHDoqHhoBAs9qX9Hx7
 WmoGU9oPqgb1BR6+8fQQ1vKbqK44R317SHn3VUscV6y2NHCLmwpqQoCuuW0qShEHuB
 HcwocUN3tEsi9OY15U5kTscZYh7jR/DJMH2GuprZLRnAnnDgnzgcYLMSQ6/kINQ/Ai
 ucD97vXat0x9ga4eq5wv03AKtE0kj/oW6lSAFMy5pZc+nkZunGShzgl31OZW4rFdYn
 WHKCxAjQW5dEg==
Message-ID: <3ceeb700-4424-6182-6d14-60c569f7c59d@collabora.com>
Date: Thu, 1 Sep 2022 12:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/09/22 06:41, Bo-Chen Chen ha scritto:
> This patch is separated from v10 which is including dp driver, phy driver
> and dpintf driver. This series is only contained the DisplayPort driver.

For the entire series:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks!
Angelo

> 
> Bo-Chen Chen (4):
>    drm/mediatek: dp: Add multiple bridge types support
>    drm/mediatek: dp: Add multiple smc commands support
>    drm/mediatek: dp: Add multiple calibration data formats support
>    drm/mediatek: dp: Determine device of next_bridge
> 
> Guillaume Ranquet (2):
>    drm/mediatek: dp: Add MT8195 External DisplayPort support
>    drm/mediatek: dp: Audio support for MT8195
> 
> Jitao Shi (1):
>    drm/mediatek: dp: Add hpd debounce
> 
> Markus Schneider-Pargmann (3):
>    dt-bindings: mediatek,dp: Add Display Port binding
>    video/hdmi: Add audio_infoframe packing for DP
>    drm/mediatek: Add MT8195 Embedded DisplayPort driver
> 
>   .../display/mediatek/mediatek,dp.yaml         |  116 +
>   drivers/gpu/drm/mediatek/Kconfig              |    9 +
>   drivers/gpu/drm/mediatek/Makefile             |    2 +
>   drivers/gpu/drm/mediatek/mtk_dp.c             | 2661 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  356 +++
>   drivers/video/hdmi.c                          |   82 +-
>   include/drm/display/drm_dp.h                  |    2 +
>   include/linux/hdmi.h                          |    7 +-
>   8 files changed, 3215 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 



