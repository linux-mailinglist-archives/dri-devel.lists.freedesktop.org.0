Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15DD9121BE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEE610E0A5;
	Fri, 21 Jun 2024 10:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rzIJDagQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588910E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:10:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF01062500;
 Fri, 21 Jun 2024 10:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C6EC2BBFC;
 Fri, 21 Jun 2024 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718964638;
 bh=2Yi3+MeiUnusqowgqbAbrIq7kxVvPD51ALy39yD86vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzIJDagQIE3R0pU/M5rskebUl+aHYaBSrmr01jiLJIdPDlgvbckNiO3dFm6IhwojN
 uMYXnAKl9oYrkuIGmRpw0ZFU+FV0iySCwweJFML6f3bixkiRYQpPyjju8F9tiTV7u/
 pAyJM2ygE3B6wFb3jX+tX34lLsCQIz6ReZ7BiTnbnYm0RDMYx2WgTNy8B4/sX5jR/o
 QMqbhmXRKn1bA/7juRNzlrGWHRf8fehuu5CMAO2syECbcLSsB+act95iLPDJIIV8qr
 vqp5zf5A0Pawcg5ctPVk7qVJdwnZxHHviCiFxQhzSVXMdKlqyfyL98vn+RE7A96gjH
 cBMT08hOiNM6w==
Date: Fri, 21 Jun 2024 15:40:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <ZnVRmsziiGxOVq-4@matsya>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <ZnRW2axOg7gtKzz0@matsya> <20240620201150.72c11599@jic23-huawei>
 <ZnVRCY3PGPag0fSj@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnVRCY3PGPag0fSj@matsya>
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

On 21-06-24, 15:38, Vinod Koul wrote:
> On 20-06-24, 20:11, Jonathan Cameron wrote:
> > On Thu, 20 Jun 2024 21:50:41 +0530
> > Vinod Koul <vkoul@kernel.org> wrote:
> > 
> > > On 20-06-24, 14:27, Paul Cercueil wrote:
> > > > Hi Jonathan,  
> > > 
> > > Hey Jonathan,
> > > 
> > > Assuming we are fine with this series, how would you like to proceed.
> > > Would you be fine with me picking the dmaengine bits and providing a
> > > signed tag for you to pull?
> > > 
> > 
> > Hi Vinod,
> > 
> > Yes. That will work nicely.
> > From my side it all looks good.
> 
> Great, here it is:
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git topic/dma_vec_api

Sorry, sent branch instead of signed tag: here is the signed tag

    git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git dmaengine_topic_dma_vec

> for you to fetch changes up to 380afccc2a55e8015adae4266e8beff96ab620be:
> 
>   Documentation: dmaengine: Document new dma_vec API (2024-06-21 15:31:57 +0530)
> 
> ----------------------------------------------------------------
> Paul Cercueil (3):
>       dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
>       dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
>       Documentation: dmaengine: Document new dma_vec API
> 
>  Documentation/driver-api/dmaengine/client.rst   |  9 ++++++
>  Documentation/driver-api/dmaengine/provider.rst | 10 +++++++
>  drivers/dma/dma-axi-dmac.c                      | 40 +++++++++++++++++++++++++
>  include/linux/dmaengine.h                       | 33 ++++++++++++++++++++
>  4 files changed, 92 insertions(+)
> 
> 
> Thanks
> -- 
> ~Vinod



-- 
~Vinod
