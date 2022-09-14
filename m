Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333405B82C9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 10:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9010E8B0;
	Wed, 14 Sep 2022 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF29710E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 08:17:41 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AF0AD660037C;
 Wed, 14 Sep 2022 09:17:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663143460;
 bh=HFEQ65O/mE3evHovBKdThpzSRkNG08TXQRM2aECKklU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H9hmToNizNS8Y2APOOTL4yzGIZXc7SvGyz/ZEea1Gh13MMaV/Q7RJkW7sb0ZQLExj
 ip5wP8rDIFMeAp1h7Tun+ZDVrrkgFD/nAI7GSKh3bjIkQbk3T8jLENTml9qog51tDC
 g9yemHzg37bQhBC/1mLsu1B1pk6BzPTXi9dfkALIQ+guZmvJs7KneFATdCFOGHyD72
 8+H4GU+HXaB6M4PdxVUawUeIjEW7okQnIRTyHN0vN4faOOtglAoEZnFoBW/GGV4KUN
 RAqxeqQT/kUe/SHR/GJy+QJBrKgrELz/5g2zupAncqJnq6wz0yXnQzy+2M9z4MAaNE
 +weBYv+DU3GFg==
Message-ID: <0723c329-475c-42a1-f6d5-f478d649aef1@collabora.com>
Date: Wed, 14 Sep 2022 10:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm: mediatek: Fix display vblank timeout when disable dsi
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
References: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/09/22 08:18, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dsi is turned off at bridge.disable, causing crtc to wait for vblank timeout.
> It is necessary to add count protection to turn off dsi, and turn off at post_disable.
> 
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Hello Xinlei,
which machine is this commit targeting?

Can you please try to reproduce again the issue that you're seeing with my
mtk_dsi fix [1], but without this commit?

Thanks,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/

