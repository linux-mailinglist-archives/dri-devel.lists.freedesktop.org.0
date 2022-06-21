Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BD5531AF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA4C10E3BE;
	Tue, 21 Jun 2022 12:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE3510E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:11:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DE0D660174F;
 Tue, 21 Jun 2022 13:11:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655813509;
 bh=4dKo2IiM8dMqUKO3vusJ/wPUf45Yv2wJJDuLGWQsK54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lk2wqiGpT/qzPK+uv4UVBx8k0Gz7XeYj6+S8nLVwSH8POYdwglytxepLAkLKXKwGe
 npz0as3cL21M+5MYDKtMgFIUr8Oae/PDUTL09fqo8gmAsa2ebx/Zx6dPU+ZxAkfVvQ
 +7AxfSXGCw6JTCo00gGDmyHryfY3QlqhM80uVgdb1/7mzIqrTX9ehc7ax0h7CbNitw
 pllIMpC/GnxWU8GUUVMBLgdrMiTJDhbOXyATb8Ig5jluMjTZcG1t7Cgl7AGZobRXcW
 qZC46mJ6QAalXgSvOjVFtQcKLSPM8eNDSgnx+NVM4O1SlJ5jbTPUqfqEGUu8xxzAuw
 ZwIziPjCGUMgg==
Message-ID: <a43ac9f0-5e21-edd3-a6d6-52a29f0b29bd@collabora.com>
Date: Tue, 21 Jun 2022 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 03/14] drm/mediatek: dpi: Add support for quantization
 range
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> For RGB colorimetry, CTA-861 support both limited and full range data
> when receiving video with RGB color space.
> We use drm_default_rgb_quant_range() to determine the correct setting.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

