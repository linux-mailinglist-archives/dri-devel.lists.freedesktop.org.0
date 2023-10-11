Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D247C52D3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4865410E75B;
	Wed, 11 Oct 2023 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35C710E4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 12:03:33 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 15D2D660730F;
 Wed, 11 Oct 2023 13:03:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697025812;
 bh=pBnsDRCTvondK1vQ/ZQwAvzSnrXdcCfZfKFlE3k1o/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y9Whm5n3U6OBiceljZ5rlLubLH+q0EThM8/jsyTl/DKhjRqjqj9+eGuhTX14ALTWt
 PB3B6c2E5sbqAeRSlBBwuDbGeIj4RmaA8IoHVU03ecqjiEbg9vmhWpt6lPtASqUuuy
 p17toA02t4Fk7eakdZKaR1EHn7zUvMfpvCiyLAjY0DMELuDPgNXRcZCK8yxF8Ejdd1
 KMjRTgZU6DiuBDGX9cwJ81foti/L4NyspdZgiNHSEofTJpfw0rRiYeIE6kpOjicvL5
 0oNtZwctxaCMF2B+mlHQ0Fl78dhEAaRXbud73VYdYNpB2vMlf01yiiSmNzyja30r53
 FgGlSf2xbQUsg==
Message-ID: <c0f1fc11-8550-13fb-1457-408c87f57e4f@collabora.com>
Date: Wed, 11 Oct 2023 14:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 00/16] MediaTek DDP GAMMA - 12-bit LUT support
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
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
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/08/23 09:28, AngeloGioacchino Del Regno ha scritto:
> Changes in v10:
>   - Moved snippet from patch [7/15] to patch [6/15] as that was
>     intended to be there instead; fixes build issue for patch [6/15]
>     as pointed out by the kernel text robot (oops, sorry!)
> 

Hello CK,

is there anything wrong about this series?

All commits do work on their own, there are no regressions as we tested this
on multiple Chromebooks (MT8173, MT8183, MT8192, MT8195) and a MT6795 Helio
X10 smartphone, and kept testing for months now.

Can you please pick it?

Thanks,
Angelo

> Changes in v9:
>   - As per previous conversation with CK Hu, added a commit that
>     de-commonizes the gamma setting function that was used in
>     both DISP_AAL and DISP_GAMMA, now each of them have their
>     own .gamma_set() callback (mtk_disp_gamma_set_common() has
>     been removed).
>   - Added a change to use bitfield macros in mtk_disp_aal.c
>   - Added a change to compress of_device_id entries in mtk_disp_aal.c
>   - Tested again on MT6795, MT8173, MT8186, MT8192, MT8195
> 
> Changes in v8:
>   - Changed lut_size to be a mtk_disp_gamma_set_common() function
>     parameter to pass lut size from AAL
> 
> Changes in v7:
>   - Added check for NULL dev for AAL-gamma case
>   - Added get_lut_size callback for AAL-gamma
>   - Added comment to clarify SoC 10/12 bits support and old vs new
>     register layout as suggested by Alexandre M.
> 
> Changes in v6:
>   - Fixed smatch warning in patch 11/11, ref.:
>     https://lore.kernel.org/all/202306101458.lRXHEE0Z-lkp@intel.com/
> 
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
> AngeloGioacchino Del Regno (15):
>    drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
>    drm/mediatek: gamma: Support SoC specific LUT size
>    drm/mediatek: gamma: Improve and simplify HW LUT calculation
>    drm/mediatek: gamma: Enable the Gamma LUT table only after programming
>    drm/mediatek: gamma: Use bitfield macros
>    drm/mediatek: aal: Use bitfield macros
>    drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
>    drm/mediatek: gamma: Support specifying number of bits per LUT
>      component
>    drm/mediatek: gamma: Support multi-bank gamma LUT
>    drm/mediatek: gamma: Add support for 12-bit LUT and MT8195
>    drm/mediatek: gamma: Make sure relay mode is disabled
>    drm/mediatek: gamma: Program gamma LUT type for descending or rising
>    drm/mediatek: aal: Rewrite kerneldoc for struct mtk_disp_aal
>    drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
>    drm/mediatek: aal: Compress of_device_id entries and add sentinel
> 
> Jason-JH.Lin (1):
>    drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  84 ++++++--
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 203 ++++++++++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   8 +-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   9 +
>   7 files changed, 256 insertions(+), 54 deletions(-)
> 

