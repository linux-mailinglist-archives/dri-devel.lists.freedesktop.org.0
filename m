Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BAC4FB6EA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09BE10F35C;
	Mon, 11 Apr 2022 09:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4B10F355
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 09:07:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6AB831F43463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649668056;
 bh=ZiY1smplfC8Q/27VCH66ZDkjUfbqOxGVogTWZECGfIM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5pDyBHW7uzDcMd299MPjxd0ZepU4WVJX6o8/EW2tAPqu6wgHvf+Dr64HsObiTitt
 300hqHzv7AehGss5J8ERbQAQiTLw3Y786e97s2rswwr+foIEw1q0m0n87JQJMi9ANY
 vg1d4eLj3k3lRSy5R5CfwzuE6G2GlCab0dsmhLN6YTDtZEo6Khk9XA0bNoxtzqr6Pi
 W5O9j5rQG3rVqui1eGZhSQ08a1s5Z4fdr6t4Xctcy32hFoeCa7KhuMCJdwTeCPXtTY
 uzohXaYwjvke9VbwyftEkH0zO14Uu8DhMLgqs9Sa8tONHiUWbt1IMJ6kbSBLxnrnRd
 BxsDRcJow0B3g==
Message-ID: <914baf06-0fe9-0802-26a5-71e5a0715ce3@collabora.com>
Date: Mon, 11 Apr 2022 11:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (pre_enable/post_disable).
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

