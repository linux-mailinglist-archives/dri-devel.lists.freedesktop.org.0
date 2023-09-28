Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B37B173A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9EF10E5F6;
	Thu, 28 Sep 2023 09:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB8610E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:24:42 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 419E36607337;
 Thu, 28 Sep 2023 10:24:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695893081;
 bh=1WGLRjymulCLCFymdJ9ODG1eFxBIyORpEF5CM37iKgo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MLcVO2z+5Sviv68ibre0mKiLk+ESUDaT0tswsvokTHDG5+jrn0h7mpzR/ClfoGESK
 8zFS1UdqDekgoUnbedcgWC/ndNK5tVToQPl54AXL4LRyxNdQGKO7SmkTwvj2NF4AoT
 xQizajm54kWM2SOkTri56GHunJ4yYBLZTJZhN2OwoxO3JYW9+guslh8ZwxD++P1OVp
 UvOiWAvyQpKCboaw5iIhFLZblg/L8QaiKphF1IflKA/IXHIPcK39CgLy8syUt3RI2L
 mvJ6iPNLfDyGtJ0kp5W23sskEh5mnUAuFT1jKCBDsPjmYPA62vwWArDJON+3LX+dC6
 cVXgwtictt1Xw==
Message-ID: <fe510f2c-651f-1456-bce0-034caae143e8@collabora.com>
Date: Thu, 28 Sep 2023 11:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 6/9] drm/mediatek: dpi: Support dynamic connector
 selection
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-7-jason-jh.lin@mediatek.com>
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add implementation of mtk_dpi_encoder_index to mtk_ddp_comp_func
> to make mtk_dpi support dynamic connector selection.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

