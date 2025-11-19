Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB1C70DA0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5510E67E;
	Wed, 19 Nov 2025 19:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="XiLViIrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345910E665
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:41:22 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-88249766055so1403096d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763581282; x=1764186082; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1xvMcuBzJSIcfclCVWQ2hNnnKt+oezBHS+z89ygHsa4=;
 b=XiLViIrh4czZE/B95s5xUZH7qqzHWXcCJP/rNHdFHta8gnUXcDNWNtM5R1shIfSME0
 p1XfNnMJnC02iXPcUNGiJ3uSSocNXiOVDtwLNMBnSBTOFHUp1eo9Fp3uNA/LwqAmgPvm
 tUUsrUaA+Hkg6SaGfyGohy4fdPmtdaMr+qaSh0SPiqageQVSebLJJErJFzw8nwrM60f3
 +BGqRVOuCemu58q+ZzApcOMBNBAuCIDBcFHMIIHvUKu9a6SFygToCWm3mZmm+ZBcmOeH
 vxal9zZOlFv6n20K5JJpMkNOvGGA+IWqXCjD1IKpS5pSuxIwj6AHNqcI9jN6IwuELKLc
 YuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763581282; x=1764186082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xvMcuBzJSIcfclCVWQ2hNnnKt+oezBHS+z89ygHsa4=;
 b=E96IKx4IVAdj4eVsGGoLt4rgbiZ7vtNV+iQz7S41HCHXmteQEfFDsxxJfQirNGL4B1
 NvCG1ecFr1YRP7ZzLRoa+4RJ8FgP9xvmXIge+MbiRmcrFZC6FVazqdOiZ/v8SyDU+aTN
 HQmsi2WePk0+Bne4JjcO6FdEbiwtY43gaxwv6xlaHIuQ9RgjbXgCf+L0cm080hTeh/5z
 DS878FLQh4iNbY2s4cVG28WXI4MTiD/EOIwnRRIKPmqMv7J0a6XX5MkZgrrpHg7NOvv/
 DNAblGMhMz/KPlQWxsbA6KiO0+AAsFiaL5bZcKb5VKyx/rF5H/VEX+hkerjf+mfmszCm
 CeTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSrthSrXgKHPXNPXLYSOwCfGt4PttHS7vunVWbC7Giza5LhKVtx8LCZbxAJNq/0zENM23geazA2XM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRbEuGa3kFDZdatpq7zPnS/EiOyGrd+rYOEbhmdK8pDvTi3LIt
 LB6k6hg1tcgxXhIvAc61S9iMnlo5AEIia3N0u6BUlbOMl4XdDEu7qMejB5ZiJN8uhlU=
X-Gm-Gg: ASbGncs+P/s1ZeQndabLhUvqTiCDNgd09GfXjulzr7kOaUxU7TCFGFkbki5urIZoiCd
 hLGEONhPRoQxgGdEYsSCctirP4IkBzcifYDl2aOyC32mGhu7/balrfNb4KwPAo/+EhkN9IkhmXr
 IkYYq+n38LaZwY9xDwAt+OAPSGV2WyJoLe6GghGNkSoIHgTV8sYd/wKeeVzDugBg9spkmePelss
 LHeVY451LPg1R587iXZFvqb8oaHrO09cJj5avTU3tzB5nHXJw7sWYFKurq606afVL5csxkK7oDE
 RJz9xhPbhMyikXXMAd3WaigbkoQ6SnrJ6Somc7DxuzXbUwiKKmHxlz5C8rLgFpPYHcbHQ8DNauc
 x4Mmxw/DUDP5AUORLJmwBE6jS8lNjfQ95p2xvBlD2x7jggiIU3O3fWI+wmVIeUK3WuilEDbaZPB
 LiTLr9vo3VNsXURre2aiWLGx1FX346GlVSiJpq966nbi6WehHVB1kETywO
X-Google-Smtp-Source: AGHT+IEkkwKLlD7bgArhzanqcgyJXrNkTCLmX/zPs7UZp1FVMILPKD98FXvYwEVi1NAfBqdDip+8Dg==
X-Received: by 2002:a05:6214:4a84:b0:7d2:f787:1978 with SMTP id
 6a1803df08f44-8846ed7f961mr1725046d6.3.1763581281958; 
 Wed, 19 Nov 2025 11:41:21 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e47115bsm1948696d6.21.2025.11.19.11.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 11:41:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLo3M-00000000bbB-3imG;
 Wed, 19 Nov 2025 15:41:20 -0400
Date: Wed, 19 Nov 2025 15:41:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251119194120.GR17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
 <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251118142849.GG17968@ziepe.ca>
 <BN9PR11MB5276EF47D26AB55B2CD456EE8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276EF47D26AB55B2CD456EE8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Tue, Nov 18, 2025 at 11:56:14PM +0000, Tian, Kevin wrote:
> > > > +	down_write(&vdev->memory_lock);
> > > > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> > > > {
> > > > +		if (!get_file_active(&priv->dmabuf->file))
> > > > +			continue;
> > > > +
> > > > +		dma_resv_lock(priv->dmabuf->resv, NULL);
> > > > +		list_del_init(&priv->dmabufs_elm);
> > > > +		priv->vdev = NULL;
> > > > +		priv->revoked = true;
> > > > +		dma_buf_move_notify(priv->dmabuf);
> > > > +		dma_resv_unlock(priv->dmabuf->resv);
> > > > +		vfio_device_put_registration(&vdev->vdev);
> > > > +		fput(priv->dmabuf->file);
> > >
> > > dma_buf_put(priv->dmabuf), consistent with other places.
> > 
> > Someone else said this, I don't agree, the above got the get via
> > 
> > get_file_active() instead of a dma_buf version..
> > 
> > So we should pair with get_file_active() vs fput().
> > 
> > Christian rejected the idea of adding a dmabuf wrapper for
> > get_file_active(), oh well.
> 
> Okay then vfio_pci_dma_buf_move() should be changed. It uses
> get_file_active() to pair dma_buf_put().

Makes sense, Leon can you fix it?

Thanks,
Jason 
