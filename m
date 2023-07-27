Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBDA764F7D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E2E10E54E;
	Thu, 27 Jul 2023 09:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D729310E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:22:44 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DDFCB660702D;
 Thu, 27 Jul 2023 10:22:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690449763;
 bh=S/wbNwp3nrSfYIJnj3igDnsaM+YXoYwXtjo1HiG2GSY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UeHMww9WHVwfwzRWImHwPNMGzQT6w3uY4WUBl3itguPwaAsQyhCIkLVcsr6LNGUCM
 cq1yGASbKjo2bYM1LiERIssfgP8hq3Rnkk9eN+PkkH1jF+4uzTtwRcJhFvzPq/XI73
 68Ht18QlmtjF18Y9oFcW+6fnDtO2Qcb2N4IskV8NPybKToDPUa7xmZgmjkm9+AAbTP
 MP8lSR8AZnXzoMJ+ZbehchOXAn6ILdIo2KQN+XJCU8pT2F4ju7WbJd6dOeqifmBUvD
 KvZDPQldI8hpv+rgj4FjSui5VWU82WzqMP+tDhn1Pc5mFERcn5wTnHgKyr4dLyVKG1
 mZNkCK0gzT56Q==
Message-ID: <040c1db8-4ae1-2a6c-ff58-282ed938e565@collabora.com>
Date: Thu, 27 Jul 2023 11:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
References: <20230706134000.130098-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706134000.130098-1-suijingfeng@loongson.cn>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/07/23 15:40, Sui Jingfeng ha scritto:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


