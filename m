Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E47519F8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D510E60D;
	Thu, 13 Jul 2023 07:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5873410E60D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:31:17 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CC0DC6607035;
 Thu, 13 Jul 2023 08:31:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689233474;
 bh=H+CV57KKU5YOchvpQhf4UeBBdOfwLF5gSkEruFhwdhg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Twd83G8qfsh7ml3i8rQVN+4JuNr7fJZYwviEPXRVYzYfgx2PcRNRJS2cpDpnjx2er
 pfidQLHN5H0i0Gxyb4TcXW2pEcVYXvWto7ANtJRM2s19jtdRIsFh1+eMJTotYaz2XM
 aL4CR/igU0n3rFXBZAkES11bWUXmovpFsMHne1QLTIq6K4u/hoLU5iaNx24f7Ncnms
 0SOy0U7a4DgLXVJynZhnSvcmzxt6E073X/hCDwnawfMIB5DAq3SlrckHi/EghDSIUX
 ObqeUkNuHdsIGFZXXr43YGsefoQZ/Vxd3oSqwWREN1uIXDomrz8ZQESPLnYumIlQ+Y
 omNfxT5Q0XDBw==
Message-ID: <52970189-dcb1-e48c-578b-4cd0679e56ab@collabora.com>
Date: Thu, 13 Jul 2023 09:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/4] drm/mediatek: Small mtk-dpi cleanups
To: chunkuang.hu@kernel.org
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/04/23 13:52, AngeloGioacchino Del Regno ha scritto:
> This is a small cleanup of the mtk-dpi driver, switching it to devm
> variants where possible and where it made sense, and reducing lines
> while retaining and improving human readability.
> 
> AngeloGioacchino Del Regno (4):
>    drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
>    drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
>    drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
>    drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()
> 
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 59 +++++++++++-------------------
>   1 file changed, 21 insertions(+), 38 deletions(-)
> 

Ping for a fully ready and well tested series that I've sent *3 months* ago.

Thanks,
Angelo
