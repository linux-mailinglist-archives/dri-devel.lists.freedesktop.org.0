Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9B87FC96
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 12:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A021810F9BE;
	Tue, 19 Mar 2024 11:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="rWyGfBz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3FB10F9C0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710846684;
 bh=XLZQhDlAD4mGZyqkQQ7Cw1CYIVAv0BwYXJwNdutyW+w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rWyGfBz6jTgE+fURzrNGsS7ysMw8I5U/In6BKGLLjVfYalulyLenSkuyYURO6jXeZ
 Ld7G5G2xqGjDDkj0tftXN0xBgjbBSeXAKLoO05hHh9HfPFzQU1t2KNSgvEHUzzhqLr
 Fm/PNlzxa5SxE+zmy6MH/nwlZ83U+G6KkX8E6P+G6GrpdRcS9JYGVIRYqwStOAFKBA
 7+aut8iY5HF4hkfuqXDka3I7f3n9XyjIFIllrrgyR0WQUJn3F85Pss0Fi7g13iGucJ
 TV7dmVB03XNM/AsfUL7Gbs8qKCO4vYLSMxOFl1AvDy9ZLtsQmAKio+rTKHye/NFfuP
 EQbHcSbOo5V1Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6F7E7378149B;
 Tue, 19 Mar 2024 11:11:23 +0000 (UTC)
Message-ID: <4c2ffd1c-d059-4448-9b2d-142ea87d6bd8@collabora.com>
Date: Tue, 19 Mar 2024 12:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to
 "mtk_ddp_comp"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-3-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240319070257.6443-3-shawn.sung@mediatek.com>
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

Il 19/03/24 08:02, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_ddp_comp" to "mtk_ddp_comp":
> - To align the naming rule
> - To reduce the code size
> 
> Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>

Shawn, I don't know if I typoed my own name (which is actually possible, since
I write the tags by hand), or what actually happened to my Reviewed-by tags on
the entire series.

Can you please fix the typo in the tag?

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Use this one, please.

Thanks,
Angelo


> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

