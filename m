Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A0369DA3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 02:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728306ECBA;
	Sat, 24 Apr 2021 00:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503656E039;
 Sat, 24 Apr 2021 00:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=jZ0JGW4AdikCiQSQF+QylhizTZCJYUc5d0ULmwp16B8=; b=hzjWyBj0HLDPun/nggIhfnYrva
 W/nOYte1rH5HIK0GVaXIDplkgTTP+z5L2OMSQPJ3FYQg9YTi67XAq5s/zce8xIlPASCBA6njDVqQo
 rsLyEdPDXaS3DvrmupDDdXY2lBu7BEtQpGB3AKvCGimW9LPTQheJ9FtqGzLVBGrc5P83jJUj1BMhZ
 2YZbetvu7mDmgxxqbKtF7wpyAjHqnah8s8PVBQ90B6Vt7drof2FU+X53+cUeFfmBL8E2y/CeaMe2y
 n7luXklZgzHXVQRcvJIrL+bOpgye5LzxzoveUr3i14QYbH0J2Ks5WoAQHKaYke5eMOu/VmFoBMDw4
 hCPX7uMA==;
Received: from [2601:1c0:6280:3f0::df68]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1la5qK-002dNr-O1; Sat, 24 Apr 2021 00:08:17 +0000
Subject: Re: [PATCH 01/12] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <1-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d058f9ad-7ce1-c1b3-19cd-5f625ef4c670@infradead.org>
Date: Fri, 23 Apr 2021 17:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
Content-Language: en-US
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/23/21 4:02 PM, Jason Gunthorpe wrote:
> @@ -171,7 +171,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
>  
>  config SAMPLE_VFIO_MDEV_MBOCHS
>  	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"

You can drop the ending of the prompt string.

> -	depends on VFIO_MDEV_DEVICE && m
> +	depends on VFIO_MDEV
>  	select DMA_SHARED_BUFFER
>  	help
>  	  Build a virtual display sample driver for use as a VFIO


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
