Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C848DB47
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E9710E37A;
	Thu, 13 Jan 2022 16:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4B210E37A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:08:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 016CD1F45F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090084;
 bh=grp7me+DC1tymcFVDuQBF2qCAT4WsTSUuXfAL8gosJQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ny+rEgZVHPJRlCPgjIkYrm37bk9oR+IaeqZkOkNA7ocvkFNuWpNDquYxbvEgxmKSO
 wcBUO8MmtQL4GN8n3BPbq3YUBSgY8Y43xXxiRkjsELV0duTm9RpOFOs/7kWmt1847d
 xbbloF7jq27G+OqEX96pX6Atl1cZl+AYYz5pueuWOc64ER1CcEcikvRt5q5n3WjY3F
 sZ7E9oNnVd7PWOMxrxgDQ8vFb4BCdLJ1DotUdOlZ0zjs2qDX3QuyTKF+5+kMbRXZet
 hGGEvST0bK0Xi4Yv5gpmvqTKHnwSGEhvHTIsr78s4AM28PWx/92ZA5T4ERyn+01urw
 wZU4qNTpsw+EQ==
Subject: Re: [PATCH v11 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-20-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d50c21ea-c62f-7d47-80e7-1db8522b2d38@collabora.com>
Date: Thu, 13 Jan 2022 17:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-20-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

