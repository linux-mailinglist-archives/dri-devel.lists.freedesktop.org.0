Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A219490F1E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0C210ECFC;
	Wed, 19 Jun 2024 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="nneJCx64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC50510ECFC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:14:47 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5b97539a4a5so3666472eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718810087; x=1719414887; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
 b=nneJCx64RM2EOjtvdwMZQmUN3RGmsf/+b8OrQ59Y1x893IahFRDyz+VmEgdJF8XGuS
 rol3Ea1wVhr6E4E2q57iAq+L710K3p1pLtCgf111Hje2ZqGZ/QbdnzZF+eddURJAOKnH
 4vXZlwMdl4jYnGAOFvnhcN8kP1DOzFNYfalpKISFJ9tvoDXG3kyPYZdN204cjpop/Kge
 Dsv1VM5PpsVSBbvzPiew8SPJ4asUh+SwsLIErmSCn6kKc6CHnmzMu3c/WZ8jo/Yj7QCM
 4TpqGOSADleRSkabYZFfkNIDhiM3SzFSGl3xQ6lbuDaiCmZxqOHQxJgiN3jJJBdYjA7A
 33Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718810087; x=1719414887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
 b=WztfEgiTLy/OMB4c0XHBx8nHVdlWuUxa1HucUTmzWAUb9whURGhZLT14kVZUx6dUoU
 z/aKrkuuYj3f3sSSQF2HmNg3rv9/YAepY0PMRyxTTRq0KgJxWDzl6151AH1eh+3wkKMH
 Ft4LXZ01Wr+h45hhk7Zm7bkFVK2nJJ5BVX5cJUmbRsEFnZsnbzWlWxzx14EoTxjZCEUa
 HJysUBuQHXXiv/qe1DhPOlt5uswAjbXspcGg8N9TfUv3+ONlNyHjoOU7+2KMWWg4v3Nj
 2MVC4SYFjrcbIO6sUUxbuaVnLzNwcwlYIZpF59ymtBF4al9fCd3hJ7il3qbNA17BOszf
 eRxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlmkOrKCm7xn/mtb3tO8BG+v57r1S6hnlkj2Me8ZnZSEeYap+jqrcghm7zWXXwR4Ykc76UwntC+xUZwFFNO6nQd3mZOp+EyZprJNOJoC/Y
X-Gm-Message-State: AOJu0YzMsw4VbM6Wofoxsg5+GyTV3LUrJsvxC6Z+wfigMLk4Ckjzvm1A
 OZKB8gP+Oj9tThZb/ptJLUlRFqnPMPsH9NQLSLhREV0weLgABR9bDSurWgCiao8=
X-Google-Smtp-Source: AGHT+IFVFHsVlQMiH0Fbhd4tc40tCEx10K+gMkRqXAjqGDO2L2x5wkknywHxXN6ff9bLZXfNrK0Jmg==
X-Received: by 2002:a05:6358:9886:b0:19f:1644:d45e with SMTP id
 e5c5f4694b2df-1a1fd470d73mr300419055d.8.1718810086999; 
 Wed, 19 Jun 2024 08:14:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe47ce5sm614900285a.103.2024.06.19.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:14:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJx1I-004nmY-NX;
 Wed, 19 Jun 2024 12:14:44 -0300
Date: Wed, 19 Jun 2024 12:14:44 -0300
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
Subject: Re: [PATCH v3 21/21] iommu: Remove iommu_domain_alloc()
Message-ID: <20240619151444.GM1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-22-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-22-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:55PM +0800, Lu Baolu wrote:
> The iommu_domain_alloc() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> There is increasing demand for supporting multiple IOMMU drivers, and this
> is the last bus-based thing standing in the way of that.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 36 ------------------------------------
>  2 files changed, 42 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
