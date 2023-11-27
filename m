Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933487F9C23
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53410E1EC;
	Mon, 27 Nov 2023 08:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A010E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:56:12 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E521966022D0;
 Mon, 27 Nov 2023 08:56:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701075370;
 bh=fKSt+XksJqIiecFB+CQMWNDKTfIu4Hg/jTOPgw8XfVY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=B0oJjF72hdrRtqdzKhniJ2XPoIDVmu/Ct89zH+pzXk5L6e+j06uxaaG5o4YJejF9O
 r3Tyq+dU2DPilARiUh1AwzSNm0g0SvTRv6N3VqOc3TsGVIQrNy/AEaYEdNQ4ApqJPc
 R/vXa8OEV5J4JeW9/Z5bAOvIiLomqGPUtsHJiHifb2E2yMiXyqOZ2Lo+VXfxAiykuo
 c+h1OtKMIOV+iGodbuuPAinhaEc65or9/zWhtBBhnHVDd53MwGCqbX9Lnn8FPiBD3p
 KxA1sXJizwcQnoah0OshdrjWCZcSBxybCAARJ7Lp1j5tdFULSjskp2bDuBtf/7zVlX
 rT6m9z+E/yKoA==
Message-ID: <c823cde4-5b64-4144-87b8-7d6c847d1eb3@collabora.com>
Date: Mon, 27 Nov 2023 09:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] drm/mediatek: Stop using iommu_present()
To: Robin Murphy <robin.murphy@arm.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
Content-Language: en-US
In-Reply-To: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 yong.wu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 14:41, Robin Murphy ha scritto:
> Remove the pointless check. If an IOMMU is providing transparent DMA API
> ops for any device(s) we care about, the DT code will have enforced the
> appropriate probe ordering already. And if the IOMMU *is* entirely
> absent, then attempting to go ahead with CMA and either suceeding or
> failing decisively seems more useful than deferring forever.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


