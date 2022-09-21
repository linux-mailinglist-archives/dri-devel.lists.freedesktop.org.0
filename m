Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639905BF8AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382510E087;
	Wed, 21 Sep 2022 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5C10E087
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:13:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A7FD6601F3F;
 Wed, 21 Sep 2022 09:13:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748016;
 bh=wBx7986mU+G+SugkswF8Z+6DJvj3z5+Hro9nOPhryCM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dzcnoygl09pwDr0F5taS2UrE3awoptYPge6G0CfVcj59Mr/ngHJb1KfuaQ4rQkQa/
 oL16vza+M/IzfM4oPm7JJ9KbKQuLPyVmxn8pVaqsYbS/vwmrkx2aoaWqZrQR/QDoDm
 EAetPqludw89dLMn+uto2uz8jzqCL4LKWFUDp9AsQQGYD1upRSUdrbNyGqnM/FbmX7
 3goddrYE/tQMuVJW2ZZYaV7ljl8v/AIA8r9bcE/88SCyz81k1VLrlXDSq8i+e1hOp4
 uT5WQt5fwSGeg2gSlTmeDqeirtuMecM5rqM1HDR5Cv5zpDhvgOP8REvoqp7g/G7LIm
 ynICNLF/kanzA==
Message-ID: <70e361c7-a4ef-076a-8817-7d13d9785c5e@collabora.com>
Date: Wed, 21 Sep 2022 10:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/18] phy: mediatek: ufs: use common register access
 helpers
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-5-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-5-chunfeng.yun@mediatek.com>
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
> No need define private register access helpers, use common ones defined
> in phy-mtk-io.h
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


