Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F090F03A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F9510E55B;
	Wed, 19 Jun 2024 14:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="S9TrdMhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7888910E55B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:20:53 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6b4fec3a1a7so6121796d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718806852; x=1719411652; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7yoE1PBMeOt8AWWOCfirQIQiAXfywLWQ1wTXnwAB5no=;
 b=S9TrdMhSf/XfKKNW7a9YqP7zUQOawUbqBRO8DWzSmnGyOsSwekRR3QsvHQ5stLo5N+
 yRhdtaH7g9wRJUUjRGdWaZsempDjBeTZial+5Y/s4uoZzRR6JS4vBRuMELz+YEZ5Po2t
 sJIk6Gbkg4DByvohYZh1oeAR0zTFOLwiOKJMdOGRYualG5jCNak7Pyu6/bVT5gPZr12Q
 dGtTPbaFyEiYHUnSpCPzd/TwHJZigGv3PjEyq9XFKVxL4mI39yKXqH5OqmHnxPmg1uT9
 0UpziefskG/m2C/7RZFXJruG1nOUd5bPGNysAxqcnelCWGzJd467fQbcCy6LuRClba32
 hHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718806852; x=1719411652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yoE1PBMeOt8AWWOCfirQIQiAXfywLWQ1wTXnwAB5no=;
 b=WUkV1VI24er2rWWqhpr+ii1u7yee2NfDlAktGAfjOrDGvIlZ+4tJZTjJxpGgqZU45u
 9Dfc7J01VzsKk5i7Pr1btocdHUqlWCCejtoJvOvdL3FceM8/0Uh9S2o3Aeg3f/podlgf
 EbcQtQQtHPPLZ9YF7apsVQNRzbsQh5rGpD5+acvfAd1ZH8V732cJ0xcolMh+9f0ywJwZ
 Ctk8Hssv2YOffbK25u9BrQgvrP0HULWqiWiX1NZBPKrxubtcdpWRNIwzIv4zdH3e9jKB
 2o3/yR/blFghvkn8t0Ry3V/mc2wGTen22YG4twT7u4yTGtvDwpftDiibfD98VZCBUZaa
 7Uvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSn2DSoPOgIrtmrA8mIuwMfKdlo5DHCWqpOqOwZhrBLu98am8bLKCKF3Wpvnc0nWfoTcO051rKOPqBliF+EwebnmclnY1hlc+IHANRr+nw
X-Gm-Message-State: AOJu0YxwawzUAWsJVU75/dwC+9ZBTOLm0FzmDNnDLFGcXVZ0eaWrrZe1
 y+kVZLog2s3rYXaEmt1SoERyK9R3k6YzEMkCl4OkXagY31M20fJJR5NSy/txubk=
X-Google-Smtp-Source: AGHT+IHRnNfM3kpcWftEa4vzfduj3t2OxKbu1f062TE8ncSp4oMlwh+It4VOxlc2xlXVn+nW/690wQ==
X-Received: by 2002:a0c:f093:0:b0:6b5:a5:f5f2 with SMTP id
 6a1803df08f44-6b501eabd0emr29525536d6.55.1718806852061; 
 Wed, 19 Jun 2024 07:20:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b503445091sm9427136d6.101.2024.06.19.07.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:20:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwB8-004YTZ-Pt;
 Wed, 19 Jun 2024 11:20:50 -0300
Date: Wed, 19 Jun 2024 11:20:50 -0300
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
Subject: Re: [PATCH v3 01/21] iommu: Add iommu_paging_domain_alloc() interface
Message-ID: <20240619142050.GG791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-2-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:35PM +0800, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> bus. The iommu subsystem no longer relies on bus for operations. So the
> bus parameter in iommu_domain_alloc() is no longer relevant.
> 
> Add a new interface named iommu_paging_domain_alloc(), which explicitly
> indicates the allocation of a paging domain for DMA managed by a kernel
> driver. The new interface takes a device pointer as its parameter, that
> better aligns with the current iommu subsystem.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ++++++
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
