Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986D72F7D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B112E10E431;
	Wed, 14 Jun 2023 08:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725710E430
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:29:26 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A5286606F44;
 Wed, 14 Jun 2023 09:29:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686731364;
 bh=2niJzmipKOxVV8fdLvd5hVEPIw4OFkdEI+nWQyQP7N8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hmDd/wWky5vqJoLCfHb9uyzE+9G4PiwtGe88deFCFC8MVeiqFbbgmxyM4wzX1LEKf
 8ZDkiVwjoifyhrG+ug6Z9RnmS+dRTgstvuP7cwapGQPfkJHCMGCHJMQdbU1HWZfL2l
 V2EaI3WTo0QcrttxzWLbNtnFG0Bq9YKldHJThEtfR/lmCZE8a4xBw1MGmFWGlcTOim
 QaWrGHRRZTzqX6RCnzT3Cz95AYpT2JydcB+XF1F0bNX9gvqU0PpMPqjfhmEtEyoCWZ
 0Bo/FTdaYjJ1aUwKGgwXDoVdp/dPBisuKw6R2b79l+Nz0y7BjW0YZsbmKxVYFaoZjc
 /IEAEh14g0Mow==
Message-ID: <33affcd4-3fb3-e293-7ff8-3b15132fd8d8@collabora.com>
Date: Wed, 14 Jun 2023 10:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 00/11] MediaTek DDP GAMMA - 12-bit LUT support
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230612090157.68205-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230612090157.68205-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/06/23 11:01, AngeloGioacchino Del Regno ha scritto:
> Changes in v6:
>   - Fixed smatch warning in patch 11/11, ref.:
>     https://lore.kernel.org/all/202306101458.lRXHEE0Z-lkp@intel.com/
> 

This series is fully ready. CK, can we get this one and the mtk-dp series [1]
in -next for this cycle please?

Those are the last pieces that would allow enabling display on MT8195 Chromebooks.

[1]: 
https://lore.kernel.org/lkml/20230404104800.301150-1-angelogioacchino.delregno@collabora.com/

Thanks,
Angelo

> Changes in v5:
>   - Removed incorrect comment on default LUT size and bits
>   - Removed useless check for num_lut_banks
>   - Added comment about CMDQ implementation on patch 5
>   - Evaluated passing lut size/bits from AAL, idea discarded as
>     the implementation would be rather tricky while bringing no
>     benefits.
> 
> Changes in v4:
>   - Fixed assignment typo appeared in v3
> 
> Changes in v3:
>   - Fixed issues due to variables renaming during cleanup (oops)
>   - This is actually the right series, since v2 was taken from the
>     wrong kernel tree.... :-)
> 
> Changes in v2:
>   - Added explicit inclusion of linux/bitfield.h in patch [06/11]
> 
> This series adds support for GAMMA IP requiring and/or supporting
> a 12-bits LUT using a slightly different register layout and programming
> sequence for multiple LUT banks: this IP version is currently found
> on a number of SoCs, not only including the Chromebook/IoT oriented
> Kompanio 1200/1380 MT8195/MT8195T, but also Smartphone chips such as
> the Dimensity 9200 (MT6985) and others.
> 
> This series was tested on MT8195, MT8192, MT8173, MT6795:
>   * MT6795, MT8192, MT8173: No regression, works fine.
>   * MT8195: Color correction is finally working!
> 
> AngeloGioacchino Del Regno (10):
>    drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
>    drm/mediatek: gamma: Support SoC specific LUT size
>    drm/mediatek: gamma: Improve and simplify HW LUT calculation
>    drm/mediatek: gamma: Enable the Gamma LUT table only after programming
>    drm/mediatek: gamma: Use bitfield macros
>    drm/mediatek: gamma: Support specifying number of bits per LUT
>      component
>    drm/mediatek: gamma: Support multi-bank gamma LUT
>    drm/mediatek: gamma: Add support for 12-bit LUT and MT8195
>    drm/mediatek: gamma: Make sure relay mode is disabled
>    drm/mediatek: gamma: Program gamma LUT type for descending or rising
> 
> Jason-JH.Lin (1):
>    drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c     |   2 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 193 ++++++++++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   9 +
>   7 files changed, 177 insertions(+), 36 deletions(-)
> 

