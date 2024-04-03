Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EF8968A3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180D21122A0;
	Wed,  3 Apr 2024 08:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LkxXj4AB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A71122A0;
 Wed,  3 Apr 2024 08:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6D76CCE0B41;
 Wed,  3 Apr 2024 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1885CC433C7;
 Wed,  3 Apr 2024 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712133029;
 bh=kjqVQ6E3LGz0GgJpNmzzq9iKyJa7oFl6VehmuIK/HtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LkxXj4AB3ybXO0LR+NGpVlBB+kDGFlRF72bGs9vkfP4HGGLZxEwOxD9U6F28cjqOY
 RiNKp8BDBjQ80n8XEuYG8q3O7C2IZQT44SBdGWl7KrE4bHgFPIGdbLCoVW86m9sO0P
 aVnl3aDbCsex5TWqud/xBjGBs966IxfgtVsKL3dWTjv1btjykFVjr2jAZsg4dDw16x
 GNver1nnlp/7OTsB0ipqRWidTs4Jsz6NDxVRRwiRdygxd+zVARug5B617RefpVbP0t
 6IWSRkPdykyYh1lCk6yjDLqNOO7DV8b42TYN0QHcuCWv2lzbNovY9qkZrh/zfAr8kV
 s6scXTdj8lqAw==
Date: Wed, 3 Apr 2024 11:30:25 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more
 inclusive
Message-ID: <20240403083025.GT11187@unreal>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-2-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-2-eahariha@linux.microsoft.com>
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

On Fri, Mar 29, 2024 at 05:00:25PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's series
> to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
> the approved verbiage exists in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
>  drivers/infiniband/hw/hfi1/chip.h           |  2 +-
>  drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
>  drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
>  drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
>  drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
>  drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
>  drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
>  drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
>  9 files changed, 40 insertions(+), 40 deletions(-)

hfi1 and qib work perfectly fine with the current terminology. There is
no need to change old code just for the sake of change.

Let's drop this patch.

Thanks
