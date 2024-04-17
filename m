Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732F8A8552
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB42711354B;
	Wed, 17 Apr 2024 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Mykj5nAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6CE113556
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713361942;
 bh=VxunfktQMOjppOCQpES9K8zlG6woQD+gav0HVLUYdWw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Mykj5nAq4uZmDGUy8aeGxuqe1I9F/q86kU0nNQ1xVNXcg8XVae31Bm2y0lTzMLRxz
 sCbBts3Q1SnTtyf+WFufvN7v6WNYpJwBUoN1k7kZTBFXzQr3V5p5NWX3Od/aVo/z13
 dcyJZqtU2prWJkdPjLYZkRNp7EoJzGjc7SHTX5MKlH0rQh2+K9hh1JGB/+PJkfi8iK
 58QYY/y1ZXU2KXl29NUD5sHJrhTDD3on7edMTS7rVk+37dU6erHEzcqvjviarUFc6h
 M0BkSzY5TVdDI0g1canrfGMTmTSWsLkVVnnRDYmVwIiYpaCBC2x2gaSqy9+8cL/6e8
 jsIu2PVVQMrHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EB49378001E;
 Wed, 17 Apr 2024 13:52:21 +0000 (UTC)
Message-ID: <275e760d-e4e2-4a6b-88f7-9a8590b0773b@collabora.com>
Date: Wed, 17 Apr 2024 15:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
To: Wojciech Macek <wmacek@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <20240417103819.990512-1-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
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

Il 17/04/24 12:38, Wojciech Macek ha scritto:
> In case there is no DP device attached to the port the
> transfer function should return IO error, similar to what
> other drivers do.
> In case EAGAIN is returned then any read from /dev/drm_dp_aux
> device ends up in an infinite loop as the upper layers
> constantly repeats the transfer request.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


