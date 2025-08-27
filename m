Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D7B37F3F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 11:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7810E795;
	Wed, 27 Aug 2025 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TgVKXSLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1013510E795
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 09:51:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B9E0943D5E;
 Wed, 27 Aug 2025 09:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98173C4CEEB;
 Wed, 27 Aug 2025 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756288277;
 bh=D1p7DvGbiFBfaeO1vt0gRq3Y5mYuYPgPSQ3cdG7XHY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgVKXSLiK7hhnCMIXJzEVcBtEe3aiX0qjTk1xb2DobiK+GD7gPbjx01v7uScAWk6T
 hS+M4Z3Pl2JwJlFCBhlaPHKrSArciSnQaDIdyrVqQsuDLR30xVR/7Z6WhbzbXTVMjU
 dzhLO42XIAIJVAqIaWUUksN9SVeczIOXITfD+HOfrf/Sgc1Qu3iRh2CnzjY+baJy2z
 DnaogPyOeHTukqUIGveVYiav/q6q7jxJg/uYtYfjvA0+Wa8FkjLRLQFaKPYmcf+YRn
 RkUm9o0DLf4gsv+l/eNRZIsmy7Ij3lEP5gATSSWN221e6bgLvwzxhQGW9+xB4UVmkP
 JxtD43Q5TjtXg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urCo4-000000002LW-3dx2;
 Wed, 27 Aug 2025 11:51:04 +0200
Date: Wed, 27 Aug 2025 11:51:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
Message-ID: <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722092722.425-1-johan@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> Make sure to drop the references to the sibling platform devices and
> their child drm devices taken by of_find_device_by_node() and
> device_find_child() when initialising the driver data during bind().
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Cc: stable@vger.kernel.org	# 6.4
> Cc: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up?

Johan
