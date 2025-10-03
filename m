Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE5BB63B2
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 10:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29910E087;
	Fri,  3 Oct 2025 08:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O9dz+Yxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6A10E087
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759479603;
 bh=ITjlkM0aGbos1XSt8ueuI2NEXdJ0dWrdlYRm6k9TIrk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O9dz+Yxq50GBeUPj/rHINpU4WkHjjZFDuyxvTgrx3OVsWKoiEnfxmAR0+VIOIzxAP
 rLVYoNKtfhFJWcSoAxaq5kAuUjxHt5SebW5fxERuO73qn0yF2ko84OIBIFdV7idXyx
 23ncQAwcVx6CXmV8k7qy6hodmoDpBKGw75yvdhV4z8jlExPfcc8g+dykS08bZiXtVg
 4hKHTicInZfc6yYalFDczTANuxVmPOs0Rt3Io/ZJqmPe1riuA3/pnjY7JCoXJqt5by
 s/VIXnI9c2Bk2G9ZfHHUcbKv2iHZ78FDl9QWT+rf/x8GVLe6kpgi9JvhwzSy08YoDN
 h2ZQqrQgka7/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE23D17E129E;
 Fri,  3 Oct 2025 10:20:02 +0200 (CEST)
Message-ID: <6ad27d61-5907-437b-afda-6e1453a19f88@collabora.com>
Date: Fri, 3 Oct 2025 10:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix refcounting in mtk_drm_get_all_drm_priv
To: Sjoerd Simons <sjoerd@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Johan Hovold <johan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, stable@vger.kernel.org
References: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
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

Il 03/10/25 10:08, Sjoerd Simons ha scritto:
> dev_get_drvdata simply returns the driver data part of drm_dev, which
> has its lifetime bound to the drm_dev. So only drop the reference in the
> error paths, on success they will get dropped later.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9ba2556cef1df ("drm/mediatek: clean up driver data initialisation")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


