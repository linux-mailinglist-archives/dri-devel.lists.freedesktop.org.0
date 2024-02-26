Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677C86753A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1306310E71A;
	Mon, 26 Feb 2024 12:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hruwiW9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2910E54B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708951169;
 bh=WuE4kCD97wZ9bNjHBG7YNNj1l3uPwjiVFXgZ1NInp4w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hruwiW9pNWUrPMI0AD9IZzA/Y9miBS1AqGYeG1A93mG9LQcQ10Ia9jew8ZNEcDawX
 z2OBZElqRRK3DCorbhKBZoyHyjBIwBA/RxUar/Yj3jUrxr5yPQTsqVoA9ZJsyqBCfO
 ZZHSzru6f0uYG+SaC3GO+7DoPUxMliKkt+/iWBNtLejHWATUq1lIpomysLNwyhKKQC
 EIDI/5VBBFNI/7V17e1FzY0YgdFt2y4Vn8VxTTuE0glp/eUpn4mzPFVqSaOyu0XgQq
 COC7lTErNp+kg4igLcu882DuuMGyfXjVUNGZPxRgNh+yjGuhSWHNC9clYphHHXteDs
 hmtw0XcRhVcJQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD07B37820CF;
 Mon, 26 Feb 2024 12:39:28 +0000 (UTC)
Message-ID: <e2f901aa-9d1b-4de9-ac18-7cfb57adb587@collabora.com>
Date: Mon, 26 Feb 2024 13:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/mediatek: Rename "pending_needs_vblank" to
 "needs_vblank"
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
 <20240226085059.26850-12-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226085059.26850-12-shawn.sung@mediatek.com>
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
> Rename "pending_needs_vblank" to "needs_vblank" to reduce the code size.
> 

This decreases human readability though, so I would prefer that we omit this one.

Regards,
Angelo

> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
> index 7fe234de83a3..a1fb6c67681d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -42,7 +42,7 @@ struct mtk_crtc {
>   	struct drm_crtc			base;
>   	bool				enabled;
>   
> -	bool				pending_needs_vblank;
> +	bool				needs_vblank;
>   	struct drm_pending_vblank_event	*event;
>   
>   	struct drm_plane		*planes;
> @@ -105,9 +105,9 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
>   {
>   	drm_crtc_handle_vblank(&mtk_crtc->base);
> -	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
> +	if (!mtk_crtc->config_updating && mtk_crtc->needs_vblank) {
>   		mtk_crtc_finish_page_flip(mtk_crtc);
> -		mtk_crtc->pending_needs_vblank = false;
> +		mtk_crtc->needs_vblank = false;
>   	}
>   }
>   
> @@ -571,7 +571,7 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
>   	mutex_lock(&mtk_crtc->hw_lock);
>   	mtk_crtc->config_updating = true;
>   	if (needs_vblank)
> -		mtk_crtc->pending_needs_vblank = true;
> +		mtk_crtc->needs_vblank = true;
>   
>   	for (i = 0; i < mtk_crtc->layer_nr; i++) {
>   		struct drm_plane *plane = &mtk_crtc->planes[i];


