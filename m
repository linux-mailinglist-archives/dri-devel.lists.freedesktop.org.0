Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE67880E53
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E199310F242;
	Wed, 20 Mar 2024 09:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1cicMcx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB3710F25B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710925748;
 bh=WL++lSiQWnN695SrxzJhseXDuycH02PQhHRdBX9Zm3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=1cicMcx3GHSFdlgc4r0/Nix5DLRLaFVACMk05mRRdZKAbxS5nSRXiKiGA4MG7Lp4b
 Er4sL+Jpu1KpJtf0c3OHDrZdiVuUuK/I0sADlM1/2KSvy9g1HQq53bTpEoxmUaxcF4
 qDTT9gfNWqpFLlX4fwyKOJW9dgP5VsvMhEAmcvgpt8UvOeNDxKWiOSbMTGLzgzu7N3
 az+QNeyMsn2HJbWgA9TS/skPXJhDSJ/V6qtL8WTipHpawktrmzwtgVH8TdgeUp3qpq
 iDfihMUMIIMJk4LqJ8KB1pwH4sUO9X0fhyPCxTuFCc0DPzrHKjXKNzsmMf1BIdbSB0
 aiRpukMe0KDzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A713D37813C4;
 Wed, 20 Mar 2024 09:09:07 +0000 (UTC)
Message-ID: <1bc3e804-50c4-45b4-b227-1099e50f4fc6@collabora.com>
Date: Wed, 20 Mar 2024 10:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.c"
 to "mtk_ddp_comp.c"
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
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
 <20240320024222.14234-10-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240320024222.14234-10-shawn.sung@mediatek.com>
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

Il 20/03/24 03:42, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename files mtk_drm_ddp_comp.c to mtk_ddp_comp.c and
> modify the Makefile accordingly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

