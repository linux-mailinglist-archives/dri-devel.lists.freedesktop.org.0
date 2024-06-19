Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFB290F1E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E156A10ECF6;
	Wed, 19 Jun 2024 15:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="a1UD+ZL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C967F10ECF6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:14:19 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6b501a4344bso5737326d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718810059; x=1719414859; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
 b=a1UD+ZL3vvB7gpaE/GfStJc7tH/Y61uVI30dwr9xhpZ9PvavNE2fwU8scdRS29g4nw
 Ld916DUUmxa3BnISkNcToyztYU5yb4dSk9JNsiNhIb8cf9zlBaEp3V8XvsoHAJ25ow2h
 j36BJCNXfcekBcccra5YjUh0eGXNQahuqh4Z2r6FozYrJhARON6u0oqyCapjbYKKKjLa
 7iokVDRgcxgX8c5lRLgwkXI0yPBDrj1oNV4iaxhfD1666j09lg8mfECcM6o38uMNWBGg
 bGjQtKcRyP2oOiXg6jhfnkuC4ap2um2EEHJctrYJPaWGDwJEzJQmbtGASaSDGm1B5h2s
 KJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718810059; x=1719414859;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
 b=C/SBxTHAntTovbn0m7PftoLdnwDwYUNEH65C45BW2Xs6w7HiKZ3lKe3v1X5Ir8wvXn
 rXtRygbbJ7lbphD3tZQcXfOAUVxLPpFw1TzBjKIz4zUapGWN/qvzIdgNmcbC/VDhBn5H
 xES4Js3z09gxoeFN1A319TlFXPYtjGC9XEMXT3Qa9rjMsloBH4uHYrxzJQ248TbdXyXi
 2bRLBaOKp+4e0xxWaqF2cSBYk0BNDiceUyBCL/SSQgm+KxSTdYVlI7wXxD3uECJwjp+J
 RQ8lLuE/JQp558V1sByOdSI73kfDq9B3ZEHIEct3MkfFizybqhF4MI/8N9aRMkvkuxmV
 lXZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBnmmSUQ2GhYBRwlMKLmrOOwpSH7QVHSx6tpghSrvBFScklRELBpq6XNpw92zWizJsX7YS6s6XRBX5dB1ykcWT7tVknUZr+5nedFOVGh2X
X-Gm-Message-State: AOJu0Yzh9pfEj8em5FiH/4qTkNBD/I4ypwdC2t6FtwlVM0XX0NzIBxyB
 UDFbx8Ec2BMdnv4tUtBabQNHo1RqWhleBK8oyGRdafzqpnBpVPWxmN43BOoVhlI=
X-Google-Smtp-Source: AGHT+IEOeuPwNQG30sVHkXguHikBPl0Zz6A9LkZtMX2PCT+BlXopyE8xiWNkdljzVxC2GPEBoe42EQ==
X-Received: by 2002:ad4:4bb0:0:b0:6b4:ee84:905e with SMTP id
 6a1803df08f44-6b501ea4245mr25964686d6.43.1718810058700; 
 Wed, 19 Jun 2024 08:14:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c113b3sm78372256d6.34.2024.06.19.08.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:14:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJx0r-004ne0-3e;
 Wed, 19 Jun 2024 12:14:17 -0300
Date: Wed, 19 Jun 2024 12:14:17 -0300
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
Subject: Re: [PATCH v3 18/21] drm/rockchip: Use iommu_paging_domain_alloc()
Message-ID: <20240619151417.GK1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-19-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-19-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:52PM +0800, Lu Baolu wrote:
> Commit <421be3ee36a4> ("drm/rockchip: Refactor IOMMU initialisation") has
> refactored rockchip_drm_init_iommu() to pass a device that the domain is
> allocated for. Replace iommu_domain_alloc() with
> iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
