Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54483766682
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780C10E68C;
	Fri, 28 Jul 2023 08:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1410E687
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:11:10 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0BA0F6607166;
 Fri, 28 Jul 2023 09:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690531869;
 bh=yYvD8O4U9F8BRRQYpZMS0nxYKjHuhUsKk66nJf/o4K4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PHxGpKjauUYQ+IRh+pFphVXTu+e4qLGhqkzO9B9n72R7UWmSP7Ty3QtoQjBnur7Xm
 4qDtxsdoAXvlXlqDQ/Zp5MCgFlqIBEDorPx0iNGIguKfoYgn34i9EggXOSzD3ZWHWz
 Qd2CBe/ojBoYPn24B1e9qga4uj+kM7qJGlxu7tNY4W4jNDULZpT5FeuOtmgCqNwNcn
 V7DSZ5Coz8ukTktW/KI0r3yoTc9eBbMMuPTGIgOz+ENl3MnVM1kp1iaTkuysjQtaBm
 563yHj5s8r1pxW+0TAE/VycPajQqcuGlAEdz64BsW1EJADolN323rlgmkInxvc3CPb
 D0Kgh27k4JCNQ==
Message-ID: <8c18da20-87cb-4125-c93a-c6750fd02b7d@collabora.com>
Date: Fri, 28 Jul 2023 10:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 2/4] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-3-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> Add checking the length of each data path before assigning drm private
> data into all_drm_priv array.
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

