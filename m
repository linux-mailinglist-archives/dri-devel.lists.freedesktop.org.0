Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3F5BC3E6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 10:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C51410E564;
	Mon, 19 Sep 2022 08:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666010E564
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:04:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D13F6601AAA;
 Mon, 19 Sep 2022 09:04:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663574691;
 bh=AxmpGgtft9fTu7bm6VSK/NdXOjH/7AO58c7gygKahWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mT/ZoHOtPw16Hdhvw+HFPR3L1c7Q/vmd8/ck+evhjxIRCTFttlLxjm/i2pBa0XOgq
 fjsbHOy2Ou+KhIpaSxoCU4o0Jp3CDH/jT4/0+P8dif7+2w0PopCKoFA8E2r5tx91ch
 cPebNjiHhEMFYoGoVusYcDC89SSmslLR+GzkY3GiIKjAAJ8/siqgJTXHTcrD9j2Oj0
 vMMe2SFGvqwLswUK6m2MQMziKdY21kdjGHWgAtZJ0KQUbbiAo9V6ftxZocCjbwX8A3
 PVYiLr3uOe+Es6PxcC/0CxyKjWjiAqBtQxEnuuW03rxnjQ/4oqk7awac1dAuS5VDJK
 NV1Qm0c+YV9ww==
Message-ID: <2a394e37-ac3c-77ad-d482-e36bd1ab3346@collabora.com>
Date: Mon, 19 Sep 2022 10:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in
 mtk_dp_bdg_detect()
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <20220916133821.27980-2-rex-bc.chen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/09/22 15:38, Bo-Chen Chen ha scritto:
> In order to improve human readability, reduce the indentation by
> returning early if the dp/edp cable is not plugged in.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


