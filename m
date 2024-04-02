Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838E7894F82
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EB910FBF9;
	Tue,  2 Apr 2024 10:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hzKk9Yxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8D310FBF9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712052393;
 bh=KTT/8Mc/chtrCVxYE332MN7zGpT28w7lyGm0suaoo9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hzKk9Yxgn4OFOjI9VmZMJ6NAkp+4mRgZ1Q4tp3mH3k+M/mKPcpp+H648oh0a1z4iY
 2Uln6C0iJPGfoKD+BDn4HJpsp+sThjZIBf+uD1apTuLcJXcWmcztPx0pbKmp9ipNHR
 d7Qzh9Dj2+HiXDhNC50bvdV77dA2fc1iD83i3WH03NG5OWf1Gug6Z9cqiud+1JvlCG
 c+f+WDjz/zW7YBGwgmEBk80BZ028mQy6jWO7nncMoZ8xTp/xSpabJiZ74kMT5Nahi7
 BIGBOX48YQ62bFRtxa0vBglJrbXLwAvvsstBpvCzVCXtn6fnwbc3YMDD5dpXlr55wd
 lv42GNZXVHH0w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06D8A37820EE;
 Tue,  2 Apr 2024 10:06:32 +0000 (UTC)
Message-ID: <53c08ee3-51d7-43d9-a643-91c76b853c43@collabora.com>
Date: Tue, 2 Apr 2024 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] drm/mediatek: drop driver owner initialization
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
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

Il 30/03/24 21:43, Krzysztof Kozlowski ha scritto:
> Simplify the code by dropping unnecessary .owner initialization in the
> driver.
> 

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>        drm/mediatek: aal: drop driver owner initialization
>        drm/mediatek: ccorr: drop driver owner initialization
>        drm/mediatek: color: drop driver owner initialization
>        drm/mediatek: gamma: drop driver owner initialization
>        drm/mediatek: merge: drop driver owner initialization
>        drm/mediatek: ovl: drop driver owner initialization
>        drm/mediatek: ovl_adaptor: drop driver owner initialization
>        drm/mediatek: rdma: drop driver owner initialization
>        drm/mediatek: ethdr: drop driver owner initialization
>        drm/mediatek: mdp_rdma: drop driver owner initialization
>        drm/mediatek: padding: drop driver owner initialization
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_color.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 1 -
>   drivers/gpu/drm/mediatek/mtk_ethdr.c            | 1 -
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_padding.c          | 1 -
>   11 files changed, 11 deletions(-)
> ---
> base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
> change-id: 20240330-b4-module-owner-drm-mediatek-aa525b70f033
> 
> Best regards,


