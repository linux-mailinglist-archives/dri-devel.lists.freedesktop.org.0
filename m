Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD096CDA12
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1B10E15A;
	Wed, 29 Mar 2023 13:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1BF10E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:07:49 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D05BD660316A;
 Wed, 29 Mar 2023 14:07:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680095268;
 bh=yGfVILKe7laFu/2YHoRttqj8pGUwtwyR33Lg1kmR68E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WVKmbqI9f/tOjmJbTXVwE2UHiYR7vuFTBriH3zaFHfmMCj3jcP46Df1s8kR8nW078
 iVCesM5eN2gRh0baQ3glN8f3NMriMe7wuKiMbBeguEfnOkrI6mBOxOFfqI0xnUSvQ/
 r6KYUg3SfGZ6+U3BZnycavTk5iaG/tGltcf7Ef9XVRo64FLmDQDnD7ZWifnHhiKqnj
 Cs2TgTkRdk8qO3FZ7j/wbxp18FQRHxqaRm5TYhuBi64n5T2xRM1W7ofAOqxwcl7qFt
 dAkfaikA9m5N94lSkhsUvL0wi40cwAEgK6QZZmxB9f1sQSoexW+ccU+MkAKnz3Kfog
 AmoGp5x4E7BiQ==
Message-ID: <84dff623-c5e7-7f9f-19e1-54fb8c20d110@collabora.com>
Date: Wed, 29 Mar 2023 15:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/mediatek: Add ovl_adaptor get format function
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230329015916.21684-1-nancy.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230329015916.21684-1-nancy.lin@mediatek.com>
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
Cc: shawn.sung@mediatek.com, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/03/23 03:59, Nancy.Lin ha scritto:
> Add ovl_adaptor get_format and get_num_formats component function.
> The two functions are need for getting the supported format in
> mtk_plane_init().
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Small note:

This commit depends on
f287c66a6064 ("drm/mediatek: Refactor pixel format logic")

...that was already applied in the maintainer's tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[On MT8195 Cherry Tomato]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo
