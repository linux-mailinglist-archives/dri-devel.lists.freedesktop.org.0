Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0E4D4513
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08810EE48;
	Thu, 10 Mar 2022 10:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8045410EE2C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:53:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 632831F454C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909583;
 bh=b5fO4fdPwqMD/A4ZKgLYPaoafwQC/kfyVNYY7yRZujc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QSZ+LicgTc1UcXGgL1fUBKGpz0s0bYSJBAD+q3prTF1q3EWfSR74S/MNIWtF19g7m
 bxZFdEwCn5nMbvc9Ib1UFxuQ9VvWc00O4JBIsfGqtc7Zo/mOFw1D2paRguGyn2fE/L
 FBkh+aAJq74R+zhA0ZD/wP+2GXFfz6m77mHLZLHgiBATvIbIL4TI2r8rxOUoTxP4xs
 cvsglk2t9e3dcpiIpSWjYV0aPfye0X7yMq1dTbPcV86+gFml3IjQN0S9qCUTU7bAr/
 CKGEdXftMgrpCz+STXAWEuMEveoxuJC6zKjcbZScNRwOy5vXmhAiaKlD6PnAocuoTD
 Im1XaYFKb4AHA==
Message-ID: <8fb8fd0d-3ead-e918-bcbb-9b1dd45df22e@collabora.com>
Date: Thu, 10 Mar 2022 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 17/22] drm/mediatek: add ovl_adaptor support for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-18-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-18-nancy.lin@mediatek.com>
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
> Add ovl_adaptor driver for MT8195.
> Ovl_adaptor is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/Makefile             |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  17 +
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 443 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>   4 files changed, 462 insertions(+)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> 
