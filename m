Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD588562E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C234510E3D9;
	Thu, 21 Mar 2024 09:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="goNJS3Wn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF210E3D9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711011935;
 bh=P7V6XrgrAvBiW0OBljHuvrds54kBtngXw5oTsR9kvH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=goNJS3Wn3dSJV2hDjj9YbzzI1Jm+6I/kMWzCxNY/Wck4qeIcAYbE56BW3QkgcCiMx
 3D9VOn/bwj3fN71Eb/zuMV5s0ayp5ptj7AYLZBs05pi7yyrkgV26x/iZt2k/yqSBRm
 PDGdiJa0rGltJaoEf1t9gttrhV6FEuPuOih2qNuAWhw6sl5YyGI7FNfCBCZIEGQVS/
 xOBC0YGUOzuHFNt/njecwHdOYoh+q2kUgHiSzsE/jFwLVSLnxMbynP9lLb5K8K14tE
 jJN3iVa0oYLdQ9Q/hq9eYBCp+wNjOH2UQJ369KWnIlhc/xZ8pvjy9RWyf1ApQFyuJz
 sjVHBtPWUZx/Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 55B0737813E1;
 Thu, 21 Mar 2024 09:05:34 +0000 (UTC)
Message-ID: <b1ff4130-8e84-478a-a6b3-1cac677d8cbd@collabora.com>
Date: Thu, 21 Mar 2024 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/mediatek: Fixes for DDP component search/destroy
Content-Language: en-US
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, nancy.lin@mediatek.com,
 nathan.lu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
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

Il 01/02/24 13:53, AngeloGioacchino Del Regno ha scritto:
> This series performs some cleanups for DDP component CRTC search and
> correctly iounmaps the previously of_iomap() calls from drm_ddp_comp.
> 
> Tested on MT8195 Cherry Tomato
> 

Hello CK,
gentle ping for this series.

Cheers,
Angelo

> AngeloGioacchino Del Regno (3):
>    drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
>    drm/mediatek: Perform iounmap on simple DDP component destruction
>    drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal
>      helper
> 
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 113 +++++++++++++-------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
>   3 files changed, 80 insertions(+), 38 deletions(-)
> 

