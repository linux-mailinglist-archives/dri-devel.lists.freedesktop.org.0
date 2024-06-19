Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636590F040
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781A210ECB9;
	Wed, 19 Jun 2024 14:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="e/7w7kHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE85A10ECB9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:21:28 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3c9c36db8eeso3546105b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718806888; x=1719411688; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oXd93FB8mW37LRaoaeih1f4UeSXMaaR0S6po9oPAKCU=;
 b=e/7w7kHNUYXBGdP0eBMSqTXUh6gy3fOZ4u8IrQQi7yWnV+wkGhVlggX0/FwvZkUlEN
 h19W812EQn4H8JNRCNPkfyKi3+WbklJJqhsOd+iy6ydiClOMpOqTmr/LzFsLo1OQ/z6f
 zgJBOApZ3HPZvQfZc1J9WAMcwO1s37dfv9LGcsRT3xJ4k/qp58sipwyDFP1NmxUtVvm5
 il3QRv00EaaQNukXudHFJ2xnIC4HcDjRq5uhflEVcaoW9bB9f7ZOvUXajH6SjDmqo+IL
 JD6oT7AwH4AU608DUUzIpnURRd2htqJbI14iqWBbDOQ0IS59OiB2ioaq2Dzg+Wnp8T7i
 vkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718806888; x=1719411688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oXd93FB8mW37LRaoaeih1f4UeSXMaaR0S6po9oPAKCU=;
 b=O4TXAr8x+I/UfidSdxI33labRyf3SJpzoJUKmHMr3lPyMlDusT3LCsbx8UCxaAlttz
 m+lPELuPAFyMWb4MtzaiLSN+p17htRfl5q1KlCkHdoalIHU5VuvdAbg9s9iZZRodp7mB
 SnsMGJ7UWl083kn4ReWTn5va/aiuKxUY3uLjiC1UHYtjpKwHnIKpId6lYYbtzgW4Rd+g
 dES4sqGXLLiZCFIIXOoxriNviGMBPWGDZvt3D445sRFuyWVriX2zCUiJdSGxNTGrC37t
 DkexQPfkv9/+OOHGju8ag4Rh90qJcZ64ECjV4Xvfbu13eB82vn7V1inMl7hNERseWlL/
 tdUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9jiW9Io/b9IZKOPS/9mPwLooTFxPAffAj7SpKOL6/XNh4a2w/NX40RzEeqvKbiITtyLXWFY68LzIy8PPBv37Hep4r12CojcEFW3xeRSHC
X-Gm-Message-State: AOJu0YwSsm33LYpSHrYRLcCmB5TU2XiVWzmewXN1qZK1mZE5jx0T3SU8
 AXJDvZdIuTBmyPBL0MwP+6urOlg+zAd7vx57BXwrSnwFASW5fLNkp064w1QM1rs=
X-Google-Smtp-Source: AGHT+IGeUQCBPT+VgM+BpkPpQTiytNsNv7t22Ffuk+cASd5EIDo/hVSa+fwqc195JPldb8qsFYSfsg==
X-Received: by 2002:a05:6808:188f:b0:3d2:29d6:fe8e with SMTP id
 5614622812f47-3d51b962118mr3218240b6e.8.1718806887789; 
 Wed, 19 Jun 2024 07:21:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444b3aec088sm454201cf.62.2024.06.19.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:21:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwBh-004YeT-Jx;
 Wed, 19 Jun 2024 11:21:25 -0300
Date: Wed, 19 Jun 2024 11:21:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
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
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/21] vfio/type1: Use iommu_paging_domain_alloc()
Message-ID: <20240619142125.GI791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-4-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:37PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
