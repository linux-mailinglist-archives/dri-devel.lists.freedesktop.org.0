Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB6986EF4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6666E10EB10;
	Thu, 26 Sep 2024 08:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X653y6rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BDD10EB10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727339857;
 bh=1P1r8VZxe/zn+c9DOqxIXnq8EBkiT30JweUnMt9tvdE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X653y6rvkSthS/5duP//v09NQJeY6fLxTzrkLJ54ExRu5LUNgWu5ZPg/d4R8/qHeO
 tJuDXJ1zd7uu5w5/eJYxUuKwy6UKXq4aIX6fq+XYNzmIKp9gsYkBt6+rdot0aPJp6a
 P1tV1F3hhwtDbmLzhlM6IXAXsnJMRyv57FGd+mEReCQAMh0wP99v4vGqwgaWOvvuDV
 VT+/Kcpry07mr03LjUNEs0ejNdzh5/T1eydsQHRaDSW2aEobN+Rl/ertu/KfLU+BjU
 8+lT/hf65O1R6YgETw/C+AyFi9B7l5SapIU59nOBxV9b12+Q6jAEXk0V5957cApCXG
 jSlmt2t00irmA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B20217E0FC2;
 Thu, 26 Sep 2024 10:37:37 +0200 (CEST)
Message-ID: <64b96ec0-1264-4a3c-a26d-f8a0c3375d79@collabora.com>
Date: Thu, 26 Sep 2024 10:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
 <20240925101927.17042-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
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

Il 25/09/24 12:19, Jason-JH.Lin ha scritto:
> Since some SoCs support premultiplied pixel formats but some do not,
> the blend_modes parameter is added to mtk_plane_init(), which is
> obtained from the mtk_ddp_comp_get_blend_modes function implemented
> in different OVL components.
> 
> The OVL component can use driver data to set the blend mode
> capabilities for different SoCs.
> 
> Fixes: 4225d5d5e779 ("drm/mediatek: Support alpha blending in display driver")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Just perfect.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

