Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875735A5D4E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B9E10EA15;
	Tue, 30 Aug 2022 07:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5B10E97B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:49:00 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 236936601F01;
 Tue, 30 Aug 2022 08:48:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661845738;
 bh=fT0227eahgGco+B/fdgFL8+iaRaRPcPQTjtJP9VXwnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FrP3J6DFJ28dD3nRVTgN3pEQFXmoKE/0F+ZHVNW5n1268kyqEOkIFGJrfOjT45Zvm
 Q4Rym35OPq/fjjud6jAA2JXepW0KcjWigcmDBCOUpjmoTJawQy45gptQjOAl+59Fop
 3AR72y+MQmDowAOGLuQJd77CD0EpIwKTPoaH0ywXKu8lY7FSLrTnrlDraKR3TThVLP
 +kJIVNT59bXhINlVZ6ay09saAZn93WR4VcfIrx0DLiDX2zEmeYXBl/xnF5qXCUJLTv
 1u6jTytkku9ZL7kLBaC/UXkgbVJEBjDFK5U4BtLtfsNJTuyNT7v4l2X/HJcca3Y0if
 L2NsGik/4h6bw==
Message-ID: <e3aa38cf-5779-eb56-83aa-d3089f17ff79@collabora.com>
Date: Tue, 30 Aug 2022 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/08/22 08:39, zheng-yan.chen ha scritto:
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

