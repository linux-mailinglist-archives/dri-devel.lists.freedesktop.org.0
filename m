Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72B25763B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742B89D4D;
	Mon, 31 Aug 2020 09:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 31 Aug 2020 01:55:41 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3089289C27
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 01:55:40 +0000 (UTC)
X-UUID: d8fa7b74a7b744ad955a77d5ff1ffc1e-20200831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s+O33/eGp7dWd0QU6yX77AekPJjIOCIf4Necc446y1c=; 
 b=k8jguoJzrw39NfQqGy5IijQ8DDU073rlaB6CjvuclozdQeecUCgScz1jFckhTZF2sWjT97JlDzx/prAXHbfv0u1YyeX642O3Y3+RpfUXveplfvUmP/NNKxz9YEc0HdH6VkV0E61ziU5fTg1OgksZG4OqCK3fX5NccqxU0sgLcW0=;
X-UUID: d8fa7b74a7b744ad955a77d5ff1ffc1e-20200831
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1613170683; Mon, 31 Aug 2020 09:50:34 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 31 Aug 2020 09:50:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 Aug 2020 09:50:33 +0800
Message-ID: <1598838539.7054.9.camel@mhfsdcap03>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 31 Aug 2020 09:48:59 +0800
In-Reply-To: <20200823014830.15962-5-chunkuang.hu@kernel.org>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D668365A83D97117FF652764C1C8C4D5D5E78AECFE5584A33530F1932BFEA8AE2000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-08-23 at 09:48 +0800, Chun-Kuang Hu wrote:
> Mediatek HDMI phy driver is moved from drivers/gpu/drm/mediatek to
> drivers/phy/mediatek, so add the new folder to the Mediatek DRM drivers'
> information.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb617361..191bacf02209 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5793,6 +5793,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/mediatek/
>  F:	drivers/gpu/drm/mediatek/
> +F:	drivers/phy/mediatek/phy-mtk-hdmi*
>  
>  DRM DRIVERS FOR NVIDIA TEGRA
>  M:	Thierry Reding <thierry.reding@gmail.com>

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
