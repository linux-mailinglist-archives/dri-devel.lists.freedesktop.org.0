Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053537F5DB9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E2210E71D;
	Thu, 23 Nov 2023 11:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8B10E71E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:22:49 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C56506607399;
 Thu, 23 Nov 2023 11:22:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700738568;
 bh=OkyzQvoiFclRgAoTM1AiGV82e8sHB39X1+ZjadvECzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R0khKwsWt3lwNKJWrAnDwzSZMGlJ2CZr1mfieF457KHg8M2u10AApdi7aCTdhWxia
 sR+b01+dEi4m335oJSFDxBu7pErCuPFIQJnd30nz2nQLH54PAv0TWSKcn5johqRKH/
 rjk7bFHkjlOoCKtDqj4ELeJFfXsXz0T72AO/VWIN4wboepHbx1yKLnOQGOWXhGrt7U
 0DbUgn9wZq4z0v8pDNFfkXJJjyOg638V6EogkEm5OlkB6X4qRgqxtJ+7E1DWh7hjR3
 2gr73sRiTiUMtH+aFOR0zobUbh64FMV1u4HljPYypautYh3aC/cHoW8Esh9mDbc19L
 og3Pr5e8WEf4w==
Message-ID: <e3262533-b181-4b3c-9ac7-71fc0438f6db@collabora.com>
Date: Thu, 23 Nov 2023 12:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: mediatek: mipi: mt8183: fix minimal supported
 frequency
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
References: <20231123110202.2025585-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123110202.2025585-1-mwalle@kernel.org>
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
Cc: linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 12:02, Michael Walle ha scritto:
> The lowest supported clock frequency of the PHY is 125MHz (see also
> mtk_mipi_tx_pll_enable()), but the clamping in .round_rate() has the
> wrong minimal value, which will make the .enable() op return -EINVAL on
> low frequencies. Fix the minimal clamping value.
> 
> Fixes: efda51a58b4a ("drm/mediatek: add mipi_tx driver for mt8183")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

