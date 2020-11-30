Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81A2C8242
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3089CF8;
	Mon, 30 Nov 2020 10:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93B389CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:34:26 +0000 (UTC)
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C1B320708;
 Mon, 30 Nov 2020 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606732466;
 bh=cd7xzSNXU4GZ6Gqay09NnkHkMf3Per69FTphsUamKNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gL41pa0T8tfuA6jEkcmcf5863usEzbgjoNyoy4QCfSPq8IlTI1eLuYGWBunii+YN7
 CX+JJOiUPFp8h9TrFoo5HvK4bebXJz86csJ9pzAMgRAOXRcFz0u0T5M9NH3j2jUmhJ
 DxnGMXjGqekR98uLejLgbmBsdaNspMLdATJYPgIs=
Date: Mon, 30 Nov 2020 16:04:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
Message-ID: <20201130103411.GN8403@vkoul-mobl>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116231407.94-3-chunkuang.hu@kernel.org>
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
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-11-20, 07:14, Chun-Kuang Hu wrote:
> mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_mipi_dsi_phy driver into phy driver folder.

Acked-By: Vinod Koul <vkoul@kernel.org>

I am thinking this would go thru drm-tree, if not let me know I would
apply this

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
