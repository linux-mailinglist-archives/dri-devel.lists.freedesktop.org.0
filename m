Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0690F0D8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6610ECDA;
	Wed, 19 Jun 2024 14:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="U+NNPjPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B885910ECDF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:38:02 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4411fc45fbcso29222551cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807882; x=1719412682; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
 b=U+NNPjPXUeeJ7Fl2sK2GH4uSz6Cm/pg7FEZ06FaQMP5VbD+dT6Xeii1resCMiiWE4E
 DuXShNI8hri5GREXkImTmeMEL68qxQ/StB8Um1WvRRMIkdcUXJhvCXsdPoxuDsVaFi94
 ZU8QClGDYs9lHGyiLlhy1oazyUTUl6AnAr95xYLrM3382MutedIAtKk9U978doXOYAz8
 fvOSKlaOxKORg3pzUy4LeeTOGaMeUweokdsSNnP0qTUFyFxZHYIdPeufddPKEVzMZjN2
 vzTSM6Jg/YXD+T1MX4e59/RLC7HznIUAFUQB0hiGZyJwKLZaUj7GhLB9rUEHtyCo5KFx
 k2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807882; x=1719412682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
 b=F8a5RVLdLz+Ux8RwHgILgec+oZ763AeagAPGYIGM6I3U9Yr/ph0UmIOjUtn9Yl08pT
 d2JX5+rYR1C9vPPxbQKxVOIKr9Zv9hJUCHenWvY24jEm/1Vj4Efel59urfWNJ62RQ4/o
 86P11+RdGbty7aXG8NxJXXxgpj1fRps1LPbkHBvoec9rNXIpmmNxeH8hq7I9tKCF9pA3
 CgEer1qrAGdYumjuTaS3kvelasCvgC81wIKJ5Gq8wnBUlPkn6QicQ7rtFv49DpMBCJ5+
 99sQp4ppQrbh4UJbMQN4/q2xLUh6yith0FROnuD0Vwkq7Vc6DPeqml7V/QgwSnZ/lEn9
 Cw8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLRNCcqSl8Zt+HbL+MqzUS/HRnA/SS+SMjLMji0B2VsacfhkipZ3lFB/KxPpRnlMiPXcfDKfFU6sQJVi8boHKj14hjtakdmdpfN/uutXTb
X-Gm-Message-State: AOJu0Ywh1tD8+si4GIp6bYtilDygdwGfPkFW46+w7lpihpsanJOw9Cvc
 yPtPbnlxEF00NUAXTR1YTXSfYSx6Ep+eOI8xMuzaae2d1l0GA6dxsP1mskfMMkk=
X-Google-Smtp-Source: AGHT+IHTB/lZ0M/byP4dE3kOpURatwyTsEaDzd7ugkc+m0b4VPnnl9e+XLcLWm6PxgGLzUpaixUT/Q==
X-Received: by 2002:ac8:5896:0:b0:440:645a:a209 with SMTP id
 d75a77b69052e-444a7a49c90mr31210081cf.49.1718807881767; 
 Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441ef3d89c7sm65749961cf.20.2024.06.19.07.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwRk-004dPo-Se;
 Wed, 19 Jun 2024 11:38:00 -0300
Date: Wed, 19 Jun 2024 11:38:00 -0300
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
Subject: Re: [PATCH v3 11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143800.GF1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-12-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-12-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:45PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
