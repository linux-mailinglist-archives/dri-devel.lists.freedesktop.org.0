Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1425BF8BD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04C10E8CD;
	Wed, 21 Sep 2022 08:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7598210E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:14:05 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4864B6602002;
 Wed, 21 Sep 2022 09:14:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663748044;
 bh=SRIF+BE4y6ayL9qbaLOyz0oXw3nZG/Mv2C9ZyzBP8/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CMcw+0SDi9/7dOzSrbr2XIqpu038PEVNgTFh0iWDLLkKgGH4JCEOij6lGo/8l5CXn
 Tz+iNDggAu2sgJUhHfskNnCg82qjdCLtyQB7LhjYlkGGew4hzJROuGLpn9fPpHZDzx
 hHIASo2FTWUA8ZdIBlSVHy13qNMjmS3eDlBzzPF7Ldhyz+fPcg2bIL8/6O5vC1QnzJ
 8h55CCoKzH5MCJ2lf84iOGHfKQ/h5x3dunBYnJyTwW9CmzVd+CWvlmmAfQwKycxalr
 PVBqwm1nSgK4lv/lejWR6KGqjmaZ3atuRa1QY5e0mTmn6AoiNxFaflelUtj6Jgxl/3
 uB/HPRxPXM75A==
Message-ID: <18e220f0-885c-97cf-38e0-dfd16c807be6@collabora.com>
Date: Wed, 21 Sep 2022 10:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 11/18] phy: mediatek: hdmi: mt8173: use common helper to
 access registers
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-12-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-12-chunfeng.yun@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Use MediaTek phy's common helper to access registers, then we can remove
> hdmi's I/O helpers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


