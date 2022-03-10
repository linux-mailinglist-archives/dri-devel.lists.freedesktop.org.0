Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D34D4505
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CB10EC30;
	Thu, 10 Mar 2022 10:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DB410EC49
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 548481F454C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909557;
 bh=9aUbcW04U/4ptYzSIBnfoM+hXNE0ptVvNH6aQoyUu9Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=igI/BZK/FA9bN67UwQfOCHAz40Bvc+sn142E6OatI1gORrtDMHcmx5GF3v8WZv91W
 vPZERPUOJmWusSETIeJmIap+chaysvjB9mHy12BGGcAmNdiX04hWKNfZUYRJ8fkYF+
 3wlQvzgxLYKDFOXLNUwTcP1HEpAoqGRxwZm8W+wRCz80KfFZhdZFuUMBgEZAk5lfIL
 wBGH62C+lCVSyEpk/SjXWceXCuMjkv98X7YvpSQ5HpV+maoybrw/e9XDrbZhygD/Vn
 ktDhfvRlenO3eZv2Hua4o/4TCCr5Q+tc7I5uaBVrV9moXNPkeG/3NoBx6BxrWKNV7k
 rA2ucxVfYlTOA==
Message-ID: <fba2646a-6eb6-eabe-538f-ed54bfd60c14@collabora.com>
Date: Thu, 10 Mar 2022 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 10/22] drm/mediatek: add display MDP RDMA support for
 MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-11-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-11-nancy.lin@mediatek.com>
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
> Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
> the ovl_adaptor component.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/Makefile       |   3 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h |   7 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 315 ++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.h |  20 ++
>   6 files changed, 346 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> 

