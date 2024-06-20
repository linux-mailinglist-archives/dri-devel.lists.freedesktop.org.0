Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF859111EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 21:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EC710E26A;
	Thu, 20 Jun 2024 19:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZYUPkiBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951F10E161
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7EB8CE28C0;
 Thu, 20 Jun 2024 19:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9539AC4AF10;
 Thu, 20 Jun 2024 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718910872;
 bh=bjhFvNWi5TsvQnfmtqUqpLdLlMq0YUpUWHuLtvckbn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYUPkiBRn0UHJaSaMjoznC1HWpr24AlPSJPIZygqUCrs1sksNt6azm8wGush54FXl
 MmlS8JJP2e+UmdBUqrKYrQdaL05dTbjCcDloZ6h7gK08fEnVCVbLuzVabF8Nw5Zcyl
 tWJGZde5J5KZkIEEPIHKOdpNkfvz2Vz4ncziWv4FfWDVrzfuwiSfd3MR3RprjWR7VI
 iMhGn/vljPQvtF0zSl+s5aV+hXn1DMFKvP2PO+DyAL19sI0UUXMLq68be52bo8FKWI
 ms0zxNnhUxdAhcyv8XD3lNzT8tgZzWG3R2RfF+EfzuyuYoUyW02Fj5XD0z2JHWuNeI
 I2OEpzrkVVe7Q==
Date: Thu, 20 Jun 2024 20:14:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Lars-Peter Clausen
 <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jonathan Corbet
 <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <20240620201425.1cbcb5f1@jic23-huawei>
In-Reply-To: <20240620201150.72c11599@jic23-huawei>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <ZnRW2axOg7gtKzz0@matsya> <20240620201150.72c11599@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jun 2024 20:11:50 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 20 Jun 2024 21:50:41 +0530
> Vinod Koul <vkoul@kernel.org> wrote:
> 
> > On 20-06-24, 14:27, Paul Cercueil wrote:  
> > > Hi Jonathan,    
> > 
> > Hey Jonathan,
> > 
> > Assuming we are fine with this series, how would you like to proceed.
> > Would you be fine with me picking the dmaengine bits and providing a
> > signed tag for you to pull?
> >   
> 
> Hi Vinod,
> 
> Yes. That will work nicely.
> From my side it all looks good.

Just to make sure we are on the same page, based on a clean rc1
so I just get the parts of this series (hopefully there aren't
an necessary precursors!) 

J
> 
> Thanks,
> 
> Jonathan
> 
> 

