Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0A04CA1BF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5D010EEBC;
	Wed,  2 Mar 2022 10:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AC710EEBE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:05:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B87CD1F44C4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646215532;
 bh=Px5GBQ7EElBGp4NHQzwbv9Xg/hWCIXOMw+5mUBSPG2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KgVMT15N2sjROZubbpp8d8WeavE8c+WnOJo8lSV3mcp4FWNTN5a0E1n5mF7b8L2r/
 WBE0z93+LCWoewqdEpB12TDge0xCWcKwvbZtpFAOTSSain4IsLWu1S6eiEObc7X7LC
 D8ds76/q5vrK87/dBQI5610sq0VcTAjTsTh+v30++rpJfKJjklLZaI+T22koGpxcZU
 mJER3zD0mRXJJK/xQPzmpCkCBhdwUmcvaHBAbp+J4Q8ddQiT9GltvlfDJQPUiZMB9k
 JyEax3kaPE2xHPgwtsAwj6mS1Im+5HB+hlOopN2wSE0dfgxBb2uTrffMiycESfJaD4
 oIaoCuVA9OlHQ==
Message-ID: <0b7ec857-2dd7-1037-2896-07103506ce17@collabora.com>
Date: Wed, 2 Mar 2022 11:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 19/23] drm/mediatek: add dma dev get function
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-20-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-20-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> This is a preparation for adding support for the ovl_adaptor sub driver
> Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
> dma_dev_get function for getting representative dma dev in ovl_adaptor.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>
