Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207E5BF8C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6C10E8D9;
	Wed, 21 Sep 2022 08:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82CA10E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:14:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 24D736601FFE;
 Wed, 21 Sep 2022 09:14:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748089;
 bh=Bjxfb672TwUm4EQlrnOmkCxSjzDBw2gi/aezKDDa3X0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LT/BRtLdgAo8Q3oWrVriswzGH/jwx0riHg6Zzk8CFjXlkEkxr00igdCkmy6J5YAFY
 B0KHR17cOl2cGlydsr46ISLROxMacuRAtS1q+4UnW6iMTVNRIVlvXehkG5JXLBiDNf
 qkznj/LM3/pjQl9N9+ScFuGxUF48Ro9IyLsNJ/fDCfwdHrBD34kIifQblPg++EVTOi
 8tNb3etpkuwWYWpZnyaoZN/RKj2HtGBkWHdSxvrpyysk4hGdhuOkgiMjMLHGU2vrqu
 ZN0t0Opr+P6GjH+1GyifAZyLh+iKnd9N/cFEz1zb8OSVPTj31zIQU1x7Tx7JjzAxlf
 deJvy7WAKcK1w==
Message-ID: <af244c30-326c-c762-5871-fe330384120b@collabora.com>
Date: Wed, 21 Sep 2022 10:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 16/18] phy: mediatek: mipi: mt8183: use GENMASK to
 generate bits mask
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-17-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-17-chunfeng.yun@mediatek.com>
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
> Use GENMASK() macro to generate bits mask
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


