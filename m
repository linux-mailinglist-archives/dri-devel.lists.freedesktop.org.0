Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122DC57849C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8AB8B09E;
	Mon, 18 Jul 2022 13:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDAB8B0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 13:59:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 04C2466015B2;
 Mon, 18 Jul 2022 14:59:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658152775;
 bh=k4xbc/KxSu0t1ZuCXLylgktrPrf4etvCU4uHHfVpdvo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MSQPo+QJyrJGPQjPwq4PVuS8usKOjr0hRhGugecZWIPQD4L6WP6UFPX1u7R6MyM0s
 5a/lfRMZJBPiHj4UX2fDddUh/ZHOQuXBntdyOCBk+022s/FvtuzabMr0Aq7TYefGGj
 +HuXnJyaotczIGt4rYxWtkEm8AXuktNB+5ro0QFHTyYLqkM3MbpluhVsz5QnMr/xU/
 4oZtGAZjd7DLELZhXCjXy+PI/8i/r9faWKTV01ZZ9gWkfGwT20+IC0lkyXug5czaLI
 0m7vZZmTSLQe26iSolOJMnjqMntteCkxFk26LPF/poT/Rv8opk3mMV0cUkVHiMq2Z5
 7+5grMXlQU+ow==
Message-ID: <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
Date: Mon, 18 Jul 2022 15:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: add power-domains
 property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
References: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/07/22 07:22, Allen-KH Cheng ha scritto:
> DPI is part of the display / multimedia block in MediaTek SoCs
> and is managed using power controller in some platforms. We add
> the power-domains property to the binding documentation.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

For the contents of this commit:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


...but I'm not sure whether this one requires a Fixes tag (because, effectively,
the DPI hardware *requires* that power domain to get up) - and if it does,
which commit to reference: the first commit for this file is a TXT->schema
conversion, but the TXT didn't have power-domains as well.



Regards,
Angelo
