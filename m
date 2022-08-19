Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4B959A5A9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCD410EC02;
	Fri, 19 Aug 2022 18:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8F410F5C2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:43:18 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C89A6601DC8;
 Fri, 19 Aug 2022 19:43:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660934597;
 bh=ILaOGVh98GDP5+WP//VmaaaeeN+NdUHFMp8L/cMJ5N8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lH9AI9hI05AHE6WW4SzFYv4TAgWaES0kDR13kjkSxM1QozCHO3NlvGg94EZQK0/Ml
 Z6r4sRJ1rHw9aSqfVYt/CDSaeLcFjjz57YkuosP4VP2WyW9tODcPE8bpewMO3ykOmC
 Da4DKqfgfQITTEM1iBSJviPoT21mGxtQZ26YXr93ufEUuuHP4y0tsrNJCFzbs0Z548
 OWnokVbyNkXP8FAb6VhG83aZKDxeS2gnLvHjMFRw2x6cYc5T7pLupE93M9+pE1et+m
 6FbAvTmED0dfwLwQ4a8kyuxRQn8wLeMT00o4D88gVHY2q6AVooxcOgZmTisbXxuh94
 ZM3Mo+4wsnzSw==
Date: Fri, 19 Aug 2022 14:43:11 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v2,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Message-ID: <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xinlei,

On Fri, Aug 05, 2022 at 05:57:41PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.

Could you explain a bit more why this is needed? What does this configuration
do? And why is MMSYS involved in a DPI configuration?

Also, is this a configuration specific to MT8186? I enabled the flag on MT8192
just to test and didn't see any difference in behavior.

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

If Jitao also helped in the writing of this code, then there should also be a
co-developed-by tag for Jitao before the Signed-off-by [1].

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
[..]
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
[..]
> @@ -151,6 +154,7 @@ struct mtk_dpi_conf {
>  	u32 yuv422_en_bit;
>  	u32 csc_enable_bit;
>  	u32 pixels_per_iter;
> +	bool rgb888_dual_enable;

You're missing a description of this property in the struct's comment above:

drivers/gpu/drm/mediatek/mtk_dpi.c:160: warning: Function parameter or member 'rgb888_dual_enable' not described in 'mtk_dpi_conf'

Thanks,
Nícolas
