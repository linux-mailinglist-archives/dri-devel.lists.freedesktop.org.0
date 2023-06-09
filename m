Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B484C7293B2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5B910E65B;
	Fri,  9 Jun 2023 08:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9110E662
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 08:51:35 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F29006606F1F;
 Fri,  9 Jun 2023 09:51:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686300693;
 bh=Wdu+yBgCeY5kuNWz5xFrh3Q2gh716zg49+//o0kY58U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ejXek67ZNP9F9onzO48nu3+irUMyPfJ8A4rhjGB5IrrVBNM9AQYwr3oXNYcDeaHOb
 aHu2q2NVbP7eb/pwtUE3BvmUp8uO5mzYnZCyv1Fi1W5mWv2Jc78aJdp1d1eM/nefYP
 N6Zlc6Xp5Kd2dLsDrZMESFI0nPsO/WvZP4WBXnuweNtVHY1NZpSK5WhsC/9uH6rOxg
 PNP+04BnDN2TKZI4OgKNw6JkGSWgLvTVREQIHIBCJamflD+m/2+E517S1LagKqy+7H
 oZblO4NI7923z8Tcgpa3n0UAU4POarywWPr+AArS72NM2jwE76LEibqMpwu2TuCDAv
 fsTbvJz7qS3hQ==
Message-ID: <9f5fd592-cb46-d962-ee53-0e039b8f823f@collabora.com>
Date: Fri, 9 Jun 2023 10:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND 04/15] drm/mediatek/mtk_disp_aal: Remove half completed
 incorrect struct header
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-5-lee@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230609081732.3842341-5-lee@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/06/23 10:17, Lee Jones ha scritto:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'clk' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'regs' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_aal'
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'data' not described in 'mtk_disp_aal'
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


