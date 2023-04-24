Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17486EC6C0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59610E432;
	Mon, 24 Apr 2023 07:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506AE10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 07:04:07 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D424660328C;
 Mon, 24 Apr 2023 08:04:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682319844;
 bh=mskX6naApSKUTuukB7KjqdlVaiylD+YEVsQ3J6mTGHQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mv0Y1ohOHFIqZuph5cw9Feikq/MI/eSnnWOAY6ZUUrYQZQ6jLR4ZZGBAblYzg6yqt
 xEV1s6vYNRvk0U+8U2Ec+afT/Es+Hu7yQpbEyKHQhXIUuyiFY2B4BOTvoV7XTqQK9x
 H03mBjXpuDZuBm4QaeJfhIFps87KCEjNSVU3VXooVqpNh4gRseCAhjvl1bS//v+BuU
 vx1CCnbUyMAcwOvnfB58nHSI8qETv7fI60lICk3aRTFTsN76qLUuJJW77txNupPSzq
 MVXjvKOqTLZVqv39V6MGHg4QAfDz8KsD/7KKwkvoGdsLu2VgKguE6uNRR7suA0fkbX
 OPeOXfwgMKZcg==
Message-ID: <9b26f3e4-fcef-0e51-3443-78624e96fe8c@collabora.com>
Date: Mon, 24 Apr 2023 09:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230421021609.7730-1-nancy.lin@mediatek.com>
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
Cc: singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/04/23 04:16, Nancy.Lin ha scritto:
> fix Smatch static checker warning
>    - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


