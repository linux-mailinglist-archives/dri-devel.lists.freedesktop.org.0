Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B624D4507
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E024110EE1C;
	Thu, 10 Mar 2022 10:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DE310EE1A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D1F101F454CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909564;
 bh=iaPl/wBMV7VEkkcx27N58lqaWdw70k/KuIUFajX1kAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RILJR2YqXjGkvpAHxHrr3jwAbnum4SVrq42QjIyfd/U6mzmjVmXEwJGA3GDPB3DO4
 Jfb1HW8xJ6A3wl7fHbqrEm7YD2TsgEnlZGBjSNeyfjaHLlf29Yu4AYdPtPL73kEBPH
 +AFNY5/CqC0Ye48VGs4aa8KRAfYFVqmahs8rP9TQSzuJ9TXA8MCMqjMKGQ1Mx/K9lU
 bh+pbHvJIBw1NQQ6aZSkEd74YAket+2FFoq2/OYhuXB3zT/unQkyXk+MI261elMb9T
 1angw0DoqnGORe/su+wRIb94Pt30V/6rjLwS7lueq2PJKZ/t7nKfw4jkU1h5F5SuN+
 w4EuDulUnha8g==
Message-ID: <ab0dd83f-7630-4c2a-2d7e-14b4d7399736@collabora.com>
Date: Thu, 10 Mar 2022 11:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 12/22] drm/mediatek: add display merge start/stop API
 for cmdq support
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-13-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-13-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
>   2 files changed, 19 insertions(+), 3 deletions(-)
> 
