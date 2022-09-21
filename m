Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06365BF8B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49110E849;
	Wed, 21 Sep 2022 08:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341F610E087
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:13:39 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E9AB66601FFE;
 Wed, 21 Sep 2022 09:13:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748017;
 bh=WLqZP3N3+oO0SeFHdjpc9691Pmoj6eYkynhYtlA5BnY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N8ZoMb/b35w+FU+WH0DdUj1pOfuUCbBeMpSgPG7VeDnqyRfQzeHOlVxrX+D6QvimF
 xyAlqxdKXK+q0VJAz/O++Y45yHzacXjUDevaTTHAMpqBahg3yJw7GeuJvwy8SkcDQi
 nHFQD2fOByBRVbZJlglaj97nCGn3XWlF5d/e796kA+1U6v22qk0seiGYme8L+b1dJN
 jsRKK/l+ni1d/x3gd62NLNOsBr9lftxPjkQbv7rN7dK8TDGNoKLL/GbfBvPP5qlzYt
 qJgwsVryoFKLiVJ50VQDk80mUy2/miOAnXl4RKjbcvEeG6crOR/ZXadsU2hjYdi5+Z
 TjdziTCw43xDA==
Message-ID: <1066dde3-74e0-57b2-464f-23fd0a5a38d8@collabora.com>
Date: Wed, 21 Sep 2022 10:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 05/18] phy: mediatek: pcie: use new helper to update
 register bits
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-6-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-6-chunfeng.yun@mediatek.com>
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
> The new helper will use FIELD_PREP() macro to prepare bits value
> according to mask, then we no need do it anymore.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


