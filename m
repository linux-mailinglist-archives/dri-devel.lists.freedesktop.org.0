Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865A5BF8C2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA610E8D3;
	Wed, 21 Sep 2022 08:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAB610E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:14:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FE7D6601F3F;
 Wed, 21 Sep 2022 09:14:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748076;
 bh=EvBcI/f2WzXPlPeLEVNaBfs+pUmwiWS3guPeTWdGL3s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PZDtwxI8B+LUgkMD25Wb9IKBU3ZQxrXxvvQNoMSPSgsIqpkmKYhEaHN+uot8kO8vJ
 gVbv+8aTR+Z6xKGVq2WcsLk1viiEYTPEVqurc2rQ0bsnhTLAEffvEhjxB86k1KVwH9
 jrcRasvLyV1bFScZQIf6JL7+VN0jr631BV+ygdXBUQIGXPyllyKbi9lsG2nte3CFZe
 rvyGml9ohUGzOz8QHhKW7D39yoLqSQ6xjJycsvKF+6LqhNp1AuXdzpBt4oMPg1cEtQ
 ktzYcNCozKEc+tQChLbLISf/EmaTcSaeHpqp/lCGosED0FUQNS5Fbi+Hw0akD85Vek
 QyxUEwUz33VQA==
Message-ID: <0e734f18-423f-72f4-efb7-07bddeab8674@collabora.com>
Date: Wed, 21 Sep 2022 10:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 15/18] phy: mediatek: mipi: mt8173: use common helper to
 access registers
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-16-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-16-chunfeng.yun@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Use MediaTek phy's common helper to access registers, then we can remove
> mipi-dsi's I/O helpers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


