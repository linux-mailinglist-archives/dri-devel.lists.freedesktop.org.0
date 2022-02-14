Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994914B48EA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302D10E49D;
	Mon, 14 Feb 2022 10:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859D610E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BD1B71F43426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644833412;
 bh=29qsQZwz4Yb/3pSTyMTim4dCk+vsaoydiBzpY/Zd12o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GsN2z3kF82gaI49FTrcAgoe+WQYzf2HMM47AgfbuPOK77RYECLv7r17iplEBXUzce
 GoZvRB+HpeSKS42RZicmAjhDgXSGNxmp/QO5WqMmv8ViTuuUJ6G4IuPXBIveelgdxn
 qcczwC9PZGEu6ZciyMVafKJnJ1PmV6RwXhSObW/MxiH0GKUTFi60O1FcRXi7JALcfp
 52sILPgY5otX0GgFPofs6++L6+lG5d/dgg89VUmdFrIi2gWD/Zc5bDl32K20gnP4p9
 rUWomhIhl+BBJA/MOx5Qzmbzmo2JxrRminfpsesIimzi26qW12rbSLGTWU/HTdULIw
 xZs8haxjkEBFQ==
Message-ID: <7efb2a87-1b8e-5bab-651f-ffa21ea8d716@collabora.com>
Date: Mon, 14 Feb 2022 11:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel
 driver
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20220213063151.3321331-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220213063151.3321331-1-hsinyi@chromium.org>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/02/22 07:31, Hsin-Yi Wang ha scritto:
> From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> 
> Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

I have no way of testing this driver but the code itself looks good to me,
so, strictly for the code:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v2->v3:
> rebase to next-20220211
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-innolux-himax8279d.c  | 515 ++++++++++++++++++
>   3 files changed, 525 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-innolux-himax8279d.c
> 
