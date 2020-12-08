Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEE2D2419
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790366E95D;
	Tue,  8 Dec 2020 07:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A29D6E954
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 07:15:23 +0000 (UTC)
Date: Tue, 8 Dec 2020 09:15:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607411722;
 bh=JyUtaj5Qbk6CIHZubXUlWVSbjf3SZBEnZ3kd6IWCKko=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=GT89sFC/vmEZNUb87GI7AXuj+RmckLUp+EjZq60hqgGjbycwS8nx6l/NMCdtW5lSN
 m8qBwWqZwVGhiv7vescdlniX0mqr27FIv0wcy5oZjF/LWVQHGjfJj6ccQdFj2WnvfT
 MmUSUw3PhNX987YQQX7Pbl0Dqii+3fMywKB9+WBEDhT0LvMlsz8Wve4aaFRChPN68P
 EixwkflRNuQKj56zonKLzJn+1YWAYJo5KQWbIZ72Pk/R79jPWBMlG1OxeIm+GyfMJP
 7ShN+WkwPYOldPE0nqCkR1A0/2eSwwLs1MQGGqur0tfe1CChp87HCO6AJ72pzroOSr
 xvlBEX6pceTFQ==
From: Leon Romanovsky <leon@kernel.org>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v13 3/4] RDMA/uverbs: Add uverbs command for dma-buf
 based MR registration
Message-ID: <20201208071516.GG4430@unreal>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-4-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607379353-116215-4-git-send-email-jianxin.xiong@intel.com>
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

On Mon, Dec 07, 2020 at 02:15:52PM -0800, Jianxin Xiong wrote:
> Implement a new uverbs ioctl method for memory registration with file
> descriptor as an extra parameter.
>
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/infiniband/core/uverbs_std_types_mr.c | 117 +++++++++++++++++++++++++-
>  include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 +++
>  2 files changed, 129 insertions(+), 2 deletions(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
