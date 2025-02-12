Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB68A32450
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 12:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CAC10E858;
	Wed, 12 Feb 2025 11:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RQ294yJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9510E858
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739358544;
 bh=0WMcpkgL+kzI3wuew8Ndfo8EQnxAuf57HxbK5IfZrRY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RQ294yJNqb53NHibL46kTJCyFUsetkdQa7DtxTTTHDVuGx0/4KZsSMzsk99kedW5n
 m4eMWwwVGDraz6U+Qi/7/oOqSbweyl3dHK70ClKIByimu/QHsfZfSqxk7XSOC824wt
 Pppf0NTU5tnO8UFI207x3XF6TywPbJ6FaKhuNf3bPKE1QASHJrCbiOFtS/leBB1gJb
 KQrviYKDPTMo7revohw/yudk54gWnPaXiLtWqT1pQEf3L76HzYgav/kzFrhbYqfVz1
 5p+h7nY03xDZWEh0k22GXhm/NV3PTLUe7+ehX6nOt4ODo9NG7Ickcaz34n3XzOHHFs
 6eYmuA40vR0xQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EAFF717E0FBA;
 Wed, 12 Feb 2025 12:09:02 +0100 (CET)
Message-ID: <70436de1-7ad0-41f0-a101-7373662aa008@collabora.com>
Date: Wed, 12 Feb 2025 12:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
To: chunkuang.hu@kernel.org, mchehab@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/12/24 11:53, AngeloGioacchino Del Regno ha scritto:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>    dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>    dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3

CK, Mauro,

If it's okay for you, I'd like to take the display and media bindings
patches in the MediaTek trees, so that I can also safely take the DT patch
without immutable branching, etc.

It's a very old series, yes, but it's still applicable.

Can you please ack the display and media bindings so that I can safely pick?

For display: 20241218105320.38980-2-angelogioacchino.delregno@collabora.com
For media:   20241218105320.38980-3-angelogioacchino.delregno@collabora.com

Thanks!
Angelo

>    arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
>   .../display/mediatek/mediatek,aal.yaml        |   4 +
>   .../display/mediatek/mediatek,color.yaml      |   4 +
>   .../display/mediatek/mediatek,merge.yaml      |   4 +
>   .../display/mediatek/mediatek,padding.yaml    |  10 +-
>   .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
>   .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
>   .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
>   .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
>   .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
>   .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
>   12 files changed, 364 insertions(+), 13 deletions(-)
> 


