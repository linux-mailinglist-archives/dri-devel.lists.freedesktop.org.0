Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804433D1365
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650606E871;
	Wed, 21 Jul 2021 16:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDAF6E871;
 Wed, 21 Jul 2021 16:10:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7676100C;
 Wed, 21 Jul 2021 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626883850;
 bh=ATbjR5e/Nku6Q63BGC31Ok9sISkS6hGpkLuuBaaVK0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dol824DpEIFytbAdGqq/PDZ6qvwrlmYA0/I30RpnGDx5eI1H5r7mz2Uluikvk6H2b
 94y/V0u2mQAFGKQ6f8OxAlL7CDOfKQs/DfLYglF814izLaj2QLlHqxB3qeE/eKzEl6
 fpglALaLsBsDYft2N5h9wHE2RAdXUrDlisT8dtsA=
Date: Wed, 21 Jul 2021 18:10:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v5 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YPhHCIoHzMnbIfeF@kroah.com>
References: <20210711140601.7472-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210711140601.7472-1-ogabbay@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, daniel.vetter@ffwll.ch, sleybo@amazon.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 galpress@amazon.com, linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca,
 dledford@redhat.com, hch@lst.de, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, leonro@nvidia.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 11, 2021 at 05:05:59PM +0300, Oded Gabbay wrote:
> Hi,
> This is v5 of this patch-set following again a long email thread.
> 
> It contains fixes to the implementation according to the review that Jason
> did on v4. Jason, I appreciate your feedback. If you can take another look
> to see I didn't miss anything that would be great.
> 
> The details of the fixes are in the changelog in the commit message of
> the second patch.
> 
> There was one issue with your proposal to set the orig_nents to 0. I did
> that, but I also had to restore it to nents before calling sg_free_table
> because that function uses orig_nents to iterate.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
