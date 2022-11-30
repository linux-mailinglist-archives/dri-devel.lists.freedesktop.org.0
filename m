Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330863D192
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BC310E099;
	Wed, 30 Nov 2022 09:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B92C10E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:17:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 852496602B30;
 Wed, 30 Nov 2022 09:17:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669799872;
 bh=oJk0u1gvG6u0fT9jRnNEv5n4mqHGBTjbT57397eebF8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mMe6SC6y4lpt55TGa348e93vzjkCAwifANM0Yu8ItP0UmwwdsYsmts3ySRUblZUru
 gGDxZcTMkf8u7/IvPDjRqlS1yGWH2fm3bhpCTtfnXu/Cw1iLtI+l/lr8gZMMPKnUhd
 mxATiBmdOxu1idai30XIURtwvdLp51WDspFLBrkskKDIZcmpkbJua+OO76bs969g5n
 Q+gzbqxxyYcQnbGNzRS2IbBkKbN3k/Y58XjR++JqP23XbZclF6Wows0vL6rCTMhqVC
 5yT1aAFacOFylrgWtpktXOXaU6vvozgQSOKcTr9tB8e9AU4WVwu0BfM1uwbUZd/Uvo
 OiwWAL77RWYDA==
Message-ID: <88f21574-1a41-3231-3aa7-e6285ac14fc2@collabora.com>
Date: Wed, 30 Nov 2022 10:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 6/6] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-7-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-7-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/22 15:35, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>

Since series [1] was explicitly requested by maintainers...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386

