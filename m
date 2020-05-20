Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8D1DA6F6
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 03:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C346E3BC;
	Wed, 20 May 2020 01:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2819B6E3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 01:08:02 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55AA920829;
 Wed, 20 May 2020 01:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589936881;
 bh=b1m2H/qspG4/kk7t+fgNctP8zL54Vuj9IU/1FvM90+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVU2J3ujhHu3+vxfjxo+AzVJ7w7oEHdUsXWm/3bbT3pBhdwOoeDHd6rRogrzIwDAJ
 pqXiWnS22c6QtGq72UW5y47uiSFV6xt74+xeyZW0PykGkB+/FGVUTzsJdgJxPB8P36
 l6oU328dkaq3KHBa755CNNA+UKvTmAyP3fP/X+IU=
Date: Wed, 20 May 2020 09:07:57 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/zte: remove unneeded semicolon
Message-ID: <20200520010756.GG11739@dragon>
References: <20200504113230.40588-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504113230.40588-1-yanaijie@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 07:32:30PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/gpu/drm/zte/zx_vga.c:158:2-3: Unneeded semicolon
> drivers/gpu/drm/zte/zx_vga.c:171:2-3: Unneeded semicolon
> drivers/gpu/drm/zte/zx_vga.c:179:2-3: Unneeded semicolon
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
