Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988F90F0D6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEFF10ECDE;
	Wed, 19 Jun 2024 14:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VxPKjYkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A210ECDD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:37:47 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-795569eedcaso333181285a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807866; x=1719412666; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
 b=VxPKjYkFaiTthWROdzHFrpe0kqg40mJxy+1lpj/x3bjNSbXiXVj2dXryVSan4C9X3o
 33z+ibLUqayoSjNuT3oGw0SYXlMDgoRZ3bTDv4JKDVBQDWk4jEuUadKrg1gVwe6k1U0f
 7aJMtx043tbEMFq3/DmoBokRAMFFUeGVMbE2daVxX+LcIC+RW+MUd6KKpQOw2/sOtmxm
 KUIAyTUX86rlN5myo7jRsj8MWVA3PgCVcXKA1hBZc7r2jFml09Bon6eqSmdQfXsbdBt5
 8YXbD3OhUAOf769vNVxxZgG6roV1eFQLYWSeSeiFHdZFjVa6Vjn2SCnrunaL8XL/nPUC
 hj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807866; x=1719412666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
 b=GawHB1kb8QCyySMx0JCHe+BxeiLq+6QhqgMuCEA1xxK2gfqDek81dOReaDzjm4iWR3
 uTEgB8IBWfE047hpNm75+qpXqE5E1ZC/DibiqcDyTPwZ/s+yUmPt6PLElh3MUWF/ynd6
 iD6fZaDR7iLYqDEIkUkGcwqluJ/P//KoEzaOVkZld8R12jcZFfL4F6xIs+lN5Ttzsqug
 Es7rx5CFmjTUhrQo4IPvlXUd+m2PBgMa0SHYRPqRGbgiPXJejI6v+VUy+yx6RLxI4Bnw
 wW7tRdbZ8+Dn3ucPoDFPIF5/AbhM7hOSG+d9V49H46FhVJ6j/tULv9ORryfC6xTF44/d
 QFmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx+Ig6Fwf3i4qSgOLr8eafhUyCm18xZAOyKx2EdAV57dWXD+JmZWb2fkndtIiSQCm+AzXLEEZL1OqAkc+EumCBs/LmQcjUobf9Ovcveh/c
X-Gm-Message-State: AOJu0YwlGe8uqfRrmklx5vzqukMFVdX3/irX0NSfWkk+B8cOES6c7PJY
 51qqBqS3A1Q/tCPWl38PoYFvR9zzgXGzMG7ZS4+2llh9ybCAM+Equaz+mdV7Ps0=
X-Google-Smtp-Source: AGHT+IEcJxNrliYdvuzlpiDb78QsThSHkvJcrlo7MFvwHxPiUc2KNP4DZqSrOqcyX1HTz8934IoI+w==
X-Received: by 2002:a05:620a:4044:b0:79b:b8ef:160d with SMTP id
 af79cd13be357-79bb8ef1b2fmr197306985a.32.1718807866220; 
 Wed, 19 Jun 2024 07:37:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0719fsm611398185a.83.2024.06.19.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:37:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwRV-004dKe-BM;
 Wed, 19 Jun 2024 11:37:45 -0300
Date: Wed, 19 Jun 2024 11:37:45 -0300
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
Subject: Re: [PATCH v3 10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143745.GE1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-11-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-11-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:44PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath10k_fw_init() and is attached to
> ar_snoc->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
