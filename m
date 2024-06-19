Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DEC90F1E2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFD10ECFF;
	Wed, 19 Jun 2024 15:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="NWn57vwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2BF10ECFC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:14:34 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5b97a9a9b4bso3214540eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718810073; x=1719414873; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
 b=NWn57vwJxn1VvSvD/bK4UOD0rJBnu38X1L7mPxbQMqgDstWBH2X+xed9IY7ZNMa+EE
 j65yunUXUSTchkuIpq+TpVwuli4OZgZIbaiHFgwgkum4TtE2UGnnYex3D8tKbMSFgtaQ
 uJQuXBknmnhruB9eALUZoeQKgbktjkyMS+JZ4zQZzAn/cJXvLEiYVJzRDyGji8YUm6EF
 F5owphyhlBQc3Oe2gWhD18wuhUCwk029oZErIqVViCJkrtqkvV8XcSjT8c78gIg9xDiA
 VKsfb/OOjeRNGYuqx5BCyvUH8MMTAaba7VfvwDyudgrbpDItH+YNGhyU49WvUo7tJjss
 v7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718810073; x=1719414873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
 b=HHgQAkxhG4LZNu5C41V9Ui9+yBLkeOecQbve+63LO+4ZtXfibMWCmIQs3KCZai5BHt
 zfk+0bSPlhmtG0QJ55XhgcPKGCw+oHjYzpMITyxmFRJgc1RQgN8EMBMlze9sQ4lNgY4Z
 C3ic7+saq4PfLhXZ/+GMt4bFFd/Y2WXXGRrE7WKHpHo4XYpbaCq5JXAkKJpmwglsFaAz
 Lc65q27086lHdvi1Ue8Pcr3P7kkrkzTPIY28aEQazk+uVEK7HVG2rTMBu12GIz091lsD
 OH45HByrZyB1gb45M7NjSF2UkV4/V88d5uh7hcj2QSTBe+CpVFHws9sP5QOtpHyjZAAl
 3xKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr8QLTqKFTu/jKnB+O+3mzz9xqXMAZu2KzxG1/geklfvAjmBvX1sHRnPahWsNQxigIVJrrJe0Ht88pUsFsnJL11AP+kIerYS0q7dijsGHr
X-Gm-Message-State: AOJu0YwZgFRl+cL3Tl2Czv6Zsn7Io8LicsaOQSyd0jNsDK5Mm2/jK3ZV
 T212MHA4KFKdwXaa+uN+xaWQNtbEQbov2rt3sQ6SUB/+CVZ+vcQc2NyRZotySEQ=
X-Google-Smtp-Source: AGHT+IEfWtO517AiTmrP1W6dPNlAON8bn6xv/7Wv+S6voiPx4xyrmyITXKPZjbJGoypZCOWemcF1Kw==
X-Received: by 2002:a05:6358:6f11:b0:1a1:cb05:243c with SMTP id
 e5c5f4694b2df-1a1fd5cdffcmr360413155d.25.1718810073496; 
 Wed, 19 Jun 2024 08:14:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc068sm613342485a.34.2024.06.19.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:14:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJx15-004nig-UU;
 Wed, 19 Jun 2024 12:14:31 -0300
Date: Wed, 19 Jun 2024 12:14:31 -0300
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
Subject: Re: [PATCH v3 20/21] iommu: Remove iommu_present()
Message-ID: <20240619151431.GL1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-21-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-21-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:54PM +0800, Lu Baolu wrote:
> The iommu_present() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 25 -------------------------
>  2 files changed, 31 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
