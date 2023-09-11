Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99179A780
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483A310E2B9;
	Mon, 11 Sep 2023 11:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E6510E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:03:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E13E766072FB;
 Mon, 11 Sep 2023 12:03:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694430206;
 bh=zmb+Vwx3zjcTB7L6BKrvzaQiOZSxQ6E/vnSkZ2DiCq4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cCZqKCBVkOog8hAbHsgre8yoWn74wPQJj+QfLg3llNJzJDzvpA5R3S6Rer3UpEruk
 06whb9815zOW1xGXt70FlP7DCVbmFG5OFpUb9VKuNOlgl9bOnAe95SDAxWHXNuw4Yq
 N+DyHTgDL2Pn0rO0xHrg2RmJ5F2ooGxn15gS1qqaBvP/gARJkh500q/dlddC/8pYHs
 hrr52tzYnUer97xKyn5XlD6TWhagYd6TDL77a+i+uRFXNuj1PpS+Who//BmHftnxjw
 Fs6B7AHXDNle/5QHB7HtzTi7np4kMJptNkfKXnaMFZWqV8Ol5qQONCe9mC0zdXaLnB
 QKZoI2FJrTWRQ==
Message-ID: <d7f80d00-a1cf-d7c4-9afe-62f4e59070b6@collabora.com>
Date: Mon, 11 Sep 2023 13:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: Add mt8188 dsi compatible to
 mtk_dsi.c
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
 <20230911105736.11752-4-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911105736.11752-4-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/23 12:57, Shuijing Li ha scritto:
> Add the compatible because there are different definitions for cmdq
> register bit control in mt8188.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


