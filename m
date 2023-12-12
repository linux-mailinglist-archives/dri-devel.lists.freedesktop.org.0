Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9480EDBD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3325F10E5DD;
	Tue, 12 Dec 2023 13:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Tue, 12 Dec 2023 13:33:35 UTC
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E91910E5DD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702387646;
 bh=rWUWqFii2qLJ/wFkk1X0U1NddSTTuFmDH1RdkO8pl70=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VcDJV83CJx62T0Er/BJFObiPtwNf7CDLhBv3PmPkjY2gn/0g0yX8GYBsf9XnQChXe
 7KV4OoxoWgkah35n3xF/AT80gvOt2ZxEqJNyYXVAPIj1r7Gj24Shi1hq8eU+5Hd/2Z
 P4OlLiYaxSrbtJNdgDoPgSyNMGbKqo2BhW+Phy1vhfMC/z3PUYt9Etj7yU1qAtDreW
 9KqcIXX3FcIKMvQ91WTeSrSVpbSSGk9CHOy5cq9APd32QHFc75QVX6Mx6luXCAqX4J
 FisH/Fakgsj7/9qjY2sYVDfULOH/G6YKVE0wePSG4YLzDOyqfwRgLymChOgXaVC2i1
 Fa1z4xfnZj9wg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D16963781464;
 Tue, 12 Dec 2023 13:27:25 +0000 (UTC)
Message-ID: <5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com>
Date: Tue, 12 Dec 2023 14:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] dt-bindings: display: mediatek: ovl: Modify
 rules for MT8195/MT8188
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-4-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


