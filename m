Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA436867537
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E911810E70D;
	Mon, 26 Feb 2024 12:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DEFZ1HM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96D10E6F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708951164;
 bh=IJlVIU07O9fLX3cymIc5k0g8Lxcz/CNKc3JeVD5/Ojc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DEFZ1HM7x4+e9SmNiPfO+UoWp9syO9knHrUyp2BeC1aepXmQQawP4sHXyjHHjyp1n
 eWXlYD25UrSjt71NwLR8RA0yJpBK+j0NdIvZzs/nG9fV49CSSax7P+rxSzfZw38tuu
 Sofi0wOXTMPbIgkr8vG9K8TCXbjT4l3wFfBFqVGOb6jK8B6l0pjYzO2uDdSjUk03ZD
 muABdVjYdTBAyJvnoGfchrttABDY1rNUKagsxSD5y0l37wCCSSrzEF5sdpPH7bNZ4c
 HegyDX5PgH8zMXjr4EVDmB8CyaYX5s0rKfBHcR7fQ/10+cTi4AwWpY070UA5dwdCld
 dgfiQmjP6MCEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02F8637820C6;
 Mon, 26 Feb 2024 12:39:22 +0000 (UTC)
Message-ID: <89659b2c-5521-4328-86b0-1bcf967693ae@collabora.com>
Date: Mon, 26 Feb 2024 13:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/mediatek: Rename "mtk_drm_ddp_comp" to
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
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-3-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-3-shawn.sung@mediatek.com>
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

Il 26/02/24 09:50, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_ddp_comp" to "mtk_ddp_comp":
> - To align the naming rule
> - To reduce the code size
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>


