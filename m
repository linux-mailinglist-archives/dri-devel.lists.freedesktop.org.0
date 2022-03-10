Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959E4D4506
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E373910EC49;
	Thu, 10 Mar 2022 10:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9670810EC49
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 31F9C1F454C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909561;
 bh=dwruVMKHe8Hzj+ZT1aHSQLRWF4u7URdyyePyiB1hmoY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j1F3PRLNQcQHEhimDXLzLRdU3QZPcoDHEIJoD4/sNChZVlNtrCCWY/wxyDDgvu3eQ
 uBIvRR0rBev+Jtv+Eb7Y+3hymYU+A9gnIp7lIkYnjrf8dHWrtOSfHwqs/gKtynbQTu
 Rnt5OfPv+U5hOqdt5QWKflQSciv/oSNpxmtOATeTFXC7/YtB40ZojqoDimsAptZsiU
 3Vt6eSmYBMotYjQPuRSNJqYoGLg0ThkzOM+qdvARgqdLE7yvejVp4ejoKfFZOK8IBS
 8SCp7Z3Om5TFdBvnUw9hQYcsExVV4TkuWsTEBY96mLOtLxvbJkJUEk2yJHI/TJZMJy
 ojQE0jCXKYGfg==
Message-ID: <3fa9546b-2331-e25e-7768-4bb56753ee4d@collabora.com>
Date: Thu, 10 Mar 2022 11:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 11/22] drm/mediatek: add display merge advance config
 API for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-12-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-12-nancy.lin@mediatek.com>
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
> Add merge new advance config API. The original merge API is
> mtk_ddp_comp_funcs function prototype. The API interface parameters
> cannot be modified, so add a new config API for extension. This is
> the preparation for ovl_adaptor merge control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
>   2 files changed, 48 insertions(+), 7 deletions(-)
> 
