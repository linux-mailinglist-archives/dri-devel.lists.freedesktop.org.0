Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AE663D04
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F6110E579;
	Tue, 10 Jan 2023 09:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EEF10E576
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:36:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC0986602D6F;
 Tue, 10 Jan 2023 09:36:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673343399;
 bh=uSowM5jqFDNQiGdft8YboLtHI+wKc4mcCdsfgeYisSY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LVkIcqgcg4cglsYzP+u74GgzDzaOe8wq3tX8+hd3U8QPP+D/XCbKeHSAqyyMnCLRH
 kTjXiq4ucJcsbm+ax/Ym+2q6LWzmZNxdCVudO4709SoRzj64KInpgPQD+JCOprzEuL
 BlVTSb27mqnRCc5my75L49XZq3sX03RrY8QuBU4ZBVQTACqW/Bw+w1R1M6UwR0rlM8
 7Su62ObHNChFHgVx42DFQ0chsdkaNPSIOs0Bgs3lxjQuzPk/i+Vt8bIILiU6E8FP0/
 AcHRtiqnU5G6sNHHGYJ6UKH6p7JC2pmEX/hwdFgMmqnSbDR32sDSLmLxZ9DYupDp8B
 uHfgBbYVP9M5w==
Message-ID: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
Date: Tue, 10 Jan 2023 10:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/mediatek: stop using 0 as NULL pointer
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230110031223.4820-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110031223.4820-1-miles.chen@mediatek.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/01/23 04:12, Miles Chen ha scritto:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Please add the appropriate tag...

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


