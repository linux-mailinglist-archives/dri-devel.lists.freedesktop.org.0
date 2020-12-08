Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41712D242E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311F6E94A;
	Tue,  8 Dec 2020 07:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461806E94A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 07:18:46 +0000 (UTC)
Date: Tue, 8 Dec 2020 09:12:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607411582;
 bh=Dxo9KLQf3IDQN19iF5kON3PE44p43pZHxo/mOBqDtgE=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=chFDwlWmtN+dDIVtBWqHHDNPcZllPQ5/kudOA3Yn94SyohWYtX3wb+zxPHbQ3Phup
 Ra0h5zUQZhFFd+6It0T2YZtAD9Fia5iEQ0WSdGEUm8FaSC2d0LN10cWpJKFC3h+9SG
 w9rs24blp+Sl1c25Z96/avttC0buons/D45EARgU+vS0lPREo91hnPo0tSHNVRJ2/g
 8OtoKN/X430E1I6tauP2ua8cM8h5VDZ/v5qYHqoY1zQ6jm2Y4fgZzKUgr2Zb+1PdW1
 bWFF9/2mwMG3Zm9OnZ/SlRk6QdIu6XM2Aa6jXVdBs+xQZoFggo9pVvSNl4a7wNhWmm
 o1/XqC/F4WJXw==
From: Leon Romanovsky <leon@kernel.org>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v13 2/4] RDMA/core: Add device method for registering
 dma-buf based memory region
Message-ID: <20201208071255.GF4430@unreal>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-3-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607379353-116215-3-git-send-email-jianxin.xiong@intel.com>
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
Cc: linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 02:15:51PM -0800, Jianxin Xiong wrote:
> Dma-buf based memory region requires one extra parameter and is processed
> quite differently. Adding a separate method allows clean separation from
> regular memory regions.
>
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/infiniband/core/device.c | 1 +
>  include/rdma/ib_verbs.h          | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
