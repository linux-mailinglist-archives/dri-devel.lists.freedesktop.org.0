Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA0E8D840E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0A10E02F;
	Mon,  3 Jun 2024 13:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="WXBHt8he";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640110E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:35:52 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-24c9f892aeaso2450566fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717421752; x=1718026552; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dpQgkoNkKgb0seCNmhxhfzV1gHyMbT/I1OQXluiQxwc=;
 b=WXBHt8heAC1Y+BwLvchMRu9fpvtelCfXWgZNlBY0vTqcqZRwDLh23w7DZJaYXOvAnw
 IaZrpCcwqhVqJd9T+c0JJXNdFYxiPUZnbRFrS/8DR1LAO5pL+0xeIxKLbTwFwQyIw6mc
 aFhfDfdE7fA7TjskbXz7BSvvVXlWqOGztSldDSiqumOfglKmVX9VCLx6dFdSDwtNaadw
 Ot3/cMHDWRfc6JRm2rcyVh5GCuPlIoVxuhLNKNspbQT7vZ4XJqWfPAi9VuJceyArCjdM
 8/Pypd/psqgIow7j9qarOxvWJba8y2LvmtF5AkAbAfnwGmok7n2Srgswd6BOqOet4bI2
 w/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717421752; x=1718026552;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dpQgkoNkKgb0seCNmhxhfzV1gHyMbT/I1OQXluiQxwc=;
 b=w27zf+GBs2+HhwUm+lDua/FfGgH1dAEpg1Mw/p8RXtGmdl/F48vSSuuMgi0sRjdjf4
 XRiij2GAJMM0lkLRnITFhDStKRmLIhknwHBwpH7B7eS/SRyZVZlHNztfbwOqChLrXq4b
 DEWb5lhEpfeykaeSr1gPMZ0u16iuSosAE6anL30jGQo/WxW918RlK1XDfvVM5+qqMaiH
 aoMqIb0/v9qBn1trf8zq5OasB0B7YybzLGFBFa67X0QNScQMD8nLJKHYWM/CAiF1+u2s
 fvYrP1emeh/2cmYEo+hDVG8Cgs9TsH5g+GtM4zGolU0gK/WPIpatyETBVGpBTof377d9
 OItA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXA6cDHxnII0O8A2Z7MF3zWyTk0h/awqmMRodmGUHhMlYWe3vh5q7etKmv9uapK1gwhhwGwQrnJqHt6k0PVOj9Cmgh+D8oif37niI4MSiC
X-Gm-Message-State: AOJu0YwF0Ya5TkBavrHYNyaShbjmfgx2x5BVxGxJmaz0HHSW6rbZJWkW
 VQm+HYmk2FJDL0Ayk0IeV1S4aEVK8Xi+2k6q5T3qk72zAWiErtscppNCnyKsyFQ=
X-Google-Smtp-Source: AGHT+IFk+PIg9jr3UzWb/ecm5ANWBtqD6TQzpjGRhkl/ZcSOByIZ3UxqiIS2caCT2io9CTuWhRCjQQ==
X-Received: by 2002:a05:6870:c1cc:b0:24c:ae57:b4b9 with SMTP id
 586e51a60fabf-2508b7e469cmr11967214fac.14.1717421751641; 
 Mon, 03 Jun 2024 06:35:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f3172d05sm283188385a.113.2024.06.03.06.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 06:35:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sE7qo-000Eba-Az;
 Mon, 03 Jun 2024 10:35:50 -0300
Date: Mon, 3 Jun 2024 10:35:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
Message-ID: <20240603133550.GA21513@ziepe.ca>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
 <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
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

On Wed, May 29, 2024 at 08:02:12PM +0800, Baolu Lu wrote:
> > > drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain
> > > = iommu_domain_alloc(dev->bus);
> > > 
> > > This series leave those cases unchanged and keep iommu_domain_alloc()
> > > for their usage. But new drivers should not use it anymore.
> > 
> > does it mean there is still domains allocated via iommu_domain_alloc()
> > on VT-d platform?
> 
> I think the drivers mentioned above do not run on x86 platforms, or do
> they?

usnic does.. What was preventing converting it?

Jason
