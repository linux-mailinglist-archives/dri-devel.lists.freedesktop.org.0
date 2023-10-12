Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453A7C6ACC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 12:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0410E49C;
	Thu, 12 Oct 2023 10:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADEE10E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 10:17:42 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F39E660730F;
 Thu, 12 Oct 2023 11:17:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697105861;
 bh=g3ns2c4RoQU8nzXEQ8VUyBiWwm9Ooa52x4tpLHq9B+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fC555cNGl+Ly1HW1tK2ksVyK0MG/FjTo1j7THokikv5Pi+FlMYaEBcFRQIq/sOJPq
 gG8CzEadDaVkkrjxrtNyi12WdRGBXqVWmTcsB0emaDAOaTXsv4J1cbYFWlurVuC8Tr
 6CgODM0m3/HeVgY6dTl+qoBlhstBeHXlbkLdQqX0CxnDpSJzWb/V6VQ0ZTupzKmH7c
 LVaIRests9W7dMrsDPtZmcD4iplXgD0o2NbQrBB2sDIOxYVMqFd/6Yl9eIQHcTx6OY
 mwSwZBOOJSCir8hJTx0yTTvX2jIWRnD8CiwjAJTPDpoG5txZRgj+VsbFf36wXe0beU
 66/Mjz8eo1p+w==
Message-ID: <bf2cf999-7a1a-df14-7ba9-ac5047c998c0@collabora.com>
Date: Thu, 12 Oct 2023 12:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 09/16] dt-bindings: media: mediatek: mdp3: add
 component TCC for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-10-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-10-moudy.ho@mediatek.com>
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add the fundamental hardware configuration of component TCC,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> new file mode 100644
> index 000000000000..f134160f85b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TCC

MediaTek Media Data Path 3 Tone Curve Conversion


after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
