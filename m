Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82992D136
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E0710E767;
	Wed, 10 Jul 2024 12:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kDvMJCWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C7710E767
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720612959;
 bh=pFQg0rL5fW1I1UxMVag+VV2uAJKmlYifpfa47HjQArE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kDvMJCWznATjN6tDrmVdtB8IImSF/hyQOdgm91XxNthE6zADEGRk1uCsdsc+FKYv8
 w3HUrcwzU3Dep2bXtBHVesuS/q23vaD6tOcrUTkaU7I51LLGWtXZxgGPplbIUyGVQ8
 o9eBnEXsd0Z673LdYtvFbhTm9Q/yFIWK98JA8sD+v24IERGrro1egsa5bgXQZsypR/
 oaxSr5bVOGI6pVLfxJ3OfCYZ/3vd0PWMJrf64CAjkRTXx9TzmS1LqIyU5KBtuUdkkh
 /FqJZQD6E9GsEoR7kJfXCaemIMt59OF95d5RLhZ8C0ZNW/4yizAyLV56N0KXNm60C2
 wRq1Ae490MaAQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C74263781185;
 Wed, 10 Jul 2024 12:02:38 +0000 (UTC)
Message-ID: <0479483e-c6f5-4427-83c4-7fcf48ac76ce@collabora.com>
Date: Wed, 10 Jul 2024 14:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/mediatek: Support "None" blending in Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-2-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-2-289c187f9c6f@mediatek.com>
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "None" alpha blending mode on MediaTek's chips.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


