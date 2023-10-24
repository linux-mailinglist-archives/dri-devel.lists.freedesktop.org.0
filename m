Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13567D4A79
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2C10E2FA;
	Tue, 24 Oct 2023 08:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199010E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D30766072F1;
 Tue, 24 Oct 2023 09:37:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698136673;
 bh=zP6vOilkZ0sm+tw53oGfhBi7YFiKClwvxIzUr5yGLpI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=LGQgRQS/VTjZqKg/j9fomOFt2RWMhGEpZj0kzuxJI55ULzIweIUjZP5mnTXgqDeZX
 Ej/PRdJpmMO3gkPKa6lcfdmKxDHBGwpXvSW+482Kd5mNonPFPeXMq/sT+/+tz8C8YN
 /AsrD2dDo08jvpbXFgBIUGsa5P8OqbmnLVC5SpqAS7E+s9imGhmIlYS2ve205xKoK1
 ICMBBSUe4Bk31NVDn0LBa6/jMlBu8LZGHTNAxodVafW2gRHiIfzGHDJVFbiLVUzXO1
 0wkLr8OpBYK6Fe9FisOI2qsEgdmCFfPIjnw/xmI69sV3QmKVCa7x/yKZHlMAJxOkQH
 eU46ccydvDnMA==
Message-ID: <f7fa1c3c-8233-40ab-858a-fdf8a2117a04@collabora.com>
Date: Tue, 24 Oct 2023 10:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 02/11] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATED_ENCRYPTTED flag
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-3-jason-jh.lin@mediatek.com>
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add DRM_MTK_GEM_CREATED_ENCRYPTTED flag to allocate a secure buffer
> to support secure video path feature.
> 

You have a typo in both the commit description and the title. Please fix.

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   include/uapi/drm/mediatek_drm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
> index c050de320a84..93f25e0c21d7 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -48,6 +48,7 @@ struct drm_mtk_gem_map_off {
>   
>   #define DRM_MTK_GEM_CREATE		0x00
>   #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
>   
>   #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>   		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)

