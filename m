Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC538FCB85
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B210E2CE;
	Wed,  5 Jun 2024 12:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="b7DJr1fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD110E332
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 12:02:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70260814b2dso743585b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717588946; x=1718193746; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EBzQyRtg9eqUOlOjbmDo1iz6ws2MaRBxmM5VGftOF3Y=;
 b=b7DJr1fmFbSKr2xPktGgPT3W1krgewAY67WN4KcnnDFYcMztNTZiceXMfoj7lhns2l
 Pgy7d6tXh57gdnmPlgUgtpEpv+8m2tRI68mBzt6nWN0denPmXRYzbPg+K9jPcmNsxFKv
 8oMC4O39bL6nJvYo40NWJISdQdEmT+BlqVuDCbP+E+Vuty7oI7jbA+v3IGntCTQBQ00Y
 SigqyR+aocJFpr5xjInP0WMCFp/m0T8lY78/iqD+7zhb7MQk9b+a9ymSx8WQQgAshaeD
 M2i2FH6IqPzHlHefzGypBvUeIVx3CKToY/nSh9QfhowvJo2JKDSf6JzafuJwqHYIA/Uq
 qB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717588946; x=1718193746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBzQyRtg9eqUOlOjbmDo1iz6ws2MaRBxmM5VGftOF3Y=;
 b=G/HivWhcLu0bamJWlYoaVrPMmipFNVcysFV0LTrYPGw39K0F1I1D2oTLM+N+HUiVmC
 fW224lx8d08Ivo6Ntd2aYHQ3AG7tYKelrCPdP6oR5NtLgMSlbQMpsp5PynPdVSRScOeq
 EnCkqezsfjpvE5sf/f+aaQrytaAi0CPbdVsyCeqUKVK/vd1C3hmzbPOimleCd7F5xhFo
 6wO6FHB0fbdfMMKlR75Z7RH3FuhZJBz/irCIlS82oPpR2Kg3rfr24VE+2EdTfL3fHyle
 AjS4GEj9mmvYk2gQR/soqwx6WFefsELVmPcaCdxxZf0JhOS4pjfTiTe9GCaUjQsfRyg6
 gcrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoMnzlrX5PwZjfx/E83NLq5dlyg+Tl6pToS6PzEiyJ+ESgW83UF5FVMVqP2alKiKfuw11QVQLBvtJh0ePpQLnJtoJm9GQ8Pc3+22Y3hyBG
X-Gm-Message-State: AOJu0YwKNC2YFUSr3UEhEysb9MTF9+TzmAj5EzfD1RDi4rRkSNqbnBQ9
 1rFQr87S4CFHLl8gNYmHInZPkJ9UxQ1YajTf+atuUDjijF7vgweYzV8sv/C8Plw=
X-Google-Smtp-Source: AGHT+IEFWklTwr0BdToe8q8Dyd2LsVYpzcq9B49hIrgHsM+qLI6lea7XfCdpTPFEyRoPcTJhgDV8SQ==
X-Received: by 2002:a05:6a00:2393:b0:702:683c:4aea with SMTP id
 d2e1a72fcca58-7027fbe118emr8967854b3a.5.1717588945595; 
 Wed, 05 Jun 2024 05:02:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70264ec3d8csm5443733b3a.176.2024.06.05.05.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 05:02:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sEpLT-006aZU-Qp;
 Wed, 05 Jun 2024 09:02:23 -0300
Date: Wed, 5 Jun 2024 09:02:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/22] iommufd: Use iommu_user_domain_alloc()
Message-ID: <20240605120223.GD791043@ziepe.ca>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-3-baolu.lu@linux.intel.com>
 <20240604165145.GD21513@ziepe.ca>
 <02e88f89-a277-433d-9ccc-af4318a8e80f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02e88f89-a277-433d-9ccc-af4318a8e80f@linux.intel.com>
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

On Wed, Jun 05, 2024 at 10:17:07AM +0800, Baolu Lu wrote:
> On 6/5/24 12:51 AM, Jason Gunthorpe wrote:
> > On Tue, Jun 04, 2024 at 09:51:14AM +0800, Lu Baolu wrote:
> > > Replace iommu_domain_alloc() with iommu_user_domain_alloc().
> > > 
> > > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> > > ---
> > >   drivers/iommu/iommufd/hw_pagetable.c | 20 +++++---------------
> > >   1 file changed, 5 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> > > index 33d142f8057d..ada05fccb36a 100644
> > > --- a/drivers/iommu/iommufd/hw_pagetable.c
> > > +++ b/drivers/iommu/iommufd/hw_pagetable.c
> > > @@ -127,21 +127,11 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
> > >   	hwpt_paging->ioas = ioas;
> > >   	hwpt_paging->nest_parent = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
> > > -	if (ops->domain_alloc_user) {
> > > -		hwpt->domain = ops->domain_alloc_user(idev->dev, flags, NULL,
> > > -						      user_data);
> >                                                       ^^^^^^^^^^^^
> > 
> > > -		if (IS_ERR(hwpt->domain)) {
> > > -			rc = PTR_ERR(hwpt->domain);
> > > -			hwpt->domain = NULL;
> > > -			goto out_abort;
> > > -		}
> > > -		hwpt->domain->owner = ops;
> > > -	} else {
> > > -		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
> > > -		if (!hwpt->domain) {
> > > -			rc = -ENOMEM;
> > > -			goto out_abort;
> > > -		}
> > > +	hwpt->domain = iommu_user_domain_alloc(idev->dev, flags);
> > > +	if (IS_ERR(hwpt->domain)) {
> > 
> > Where did the user_data go???
> 
> The user_data is not used in allocating a paging user domain, so I
> skipped it.

That's not true.. We have no driver using it right now, but it is
definately part of the uAPI and a driver could start using it. That is
why it was hooked up in the first place.

> In my first try, I simply replaced iommu_domain_alloc() with a new
> paging domain allocation interface. On second thought, it occurred to me
> why not use separate interfaces for different purposes? Even though from
> an iommu perspective, they both use paging domains.

If we want to do that then it needs to forward all the args

> The @flags and @user_data are defined in uapi/linux/iommufd.h, which is
> specific to iommufd. Wrapping them in a common interface for broader use
> seems awkward.

Right, you'd have to forward declare the struct and just let it
be. Really nothing but iommufd could call this API.
 
> So, perhaps we could return to my original idea? Let's just expose one
> interface, iommu_paging_domain_alloc(), and replace iommu_domain_alloc()
> with it everywhere?

That's OK too, this above doesn't really need to be changed, some of
the concept here was that iommufd-only ops would just be directly
called by iommufd itself, to discourage future abuse.

Jason
