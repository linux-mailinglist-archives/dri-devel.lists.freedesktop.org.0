Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3DC7B1735
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C17210E5D8;
	Thu, 28 Sep 2023 09:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3A10E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:24:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CED2066072A2;
 Thu, 28 Sep 2023 10:24:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695893076;
 bh=x3Cm7auwoIUOgII2Rhz2cmoHlHW0TwBSCVD6n8f4Ti0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gAFRz6577QKM0TiVZIYzURalkWB2wB9rmZz5P3oJ8KGDq9SDbEh4qWQ/io9xhmUoN
 AMUCxoSQSzKHqHpI9HddTH7+x87og6VlNm1mqYph4igIJ8oI5JX6JITH8TpyZnhTCv
 /XU+SrOfhJTJibc/sMrh3A0VFP8evZwy+gWyDQJKYWvsVutKloua4dTXBYD8ziJ5zJ
 VDLkwStCZEZkWh+DgNY0E1LWma4P/KvwiMxiUhLlfsGXnJpCfgIPFJW/dNWbqJMz1n
 tPLTPkwQPUuKJRB44MbOVRZhSN94EacH3hEUCphe9ajT8F/6VVtZcJBHtpMssDSzgX
 wigu6rIIlsgIA==
Message-ID: <dde725f0-2e9f-f506-7a7d-d5ca4797f1cb@collabora.com>
Date: Thu, 28 Sep 2023 11:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-8-jason-jh.lin@mediatek.com>
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
> Move DDP_COMPONENT_DP_INTF0 from mt8188_mtk_ddp_main array to a
> connector routes array called mt8188_mtk_ddp_main_routes to support
> dynamic selection capability for mt8188.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

