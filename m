Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804151993C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D4810F4DC;
	Wed,  4 May 2022 08:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321A10F50A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:06:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2BA181F43E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651651606;
 bh=g4o2JNm4Ctpm5k1rvLgGc8KPep2McYePUQzlec3QBWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b/wlNUz6s3DO+++GsE2ms8gl75kjfDcHwqg0VE1PAi8+0eGfY9Hgd+U3h0xCQexaw
 onor0VkEbaFunBBtN0TyEFGreN1HUquBgcnuphdhihUaG2/gFDLi+ygm/T+Hdm7qsF
 Q8L0HyrMwPuC6TtwBQgOd8Yf/yESF3rkq+9+w4mebNjM9RHr2DTlT3pHLCrE8mJsTV
 E5aP3PfpTUcIRjN5mET63+Lb44KYzvrSkizpzqPphT13AWjMJjGm8q/psEcy5P25G1
 QDvWmIrpGxqdYpADcFcwY5F8oDdedjsnxnNOGL4l+qPaD3bMNF9qjK1egW74egsodG
 kTQkLFtbDO3TQ==
Message-ID: <a387728e-94f0-ccd0-3936-977db545efb7@collabora.com>
Date: Wed, 4 May 2022 10:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/4] drm/mediatek: Add MT8186 DSI compatible for
 mtk_drm_drv.c
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428133753.8348-5-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/04/22 15:37, Rex-BC Chen ha scritto:
> The compatible "mediatek,mt8186-dsi" is used by MT8186 DSI, so
> add it to mtk_ddp_comp_dt_ids in mtk_drm_drv.c.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

