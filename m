Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281E90F068
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC4A10E04E;
	Wed, 19 Jun 2024 14:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="N/j4Do0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E60F10E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:27:43 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7953f1dcb01so565426085a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807262; x=1719412062; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
 b=N/j4Do0iDFxD8AFr9I2uPBK6Q1Hi97+1dxwl8CUnHwql7w2gNAPbn4XijkTpBjOA2r
 lqNjhDCMat0l5yRflFGBzZOq+DhG3yBk54YexlRkfpRxFPEb5NhSAAIlqZebnHVfQTDo
 s/gOkiq7dso3F7xZntEpinyrBi5JWR83nmWYC6zPjpngjNcI4pYe+2WxU2vsiJwuZbAC
 PzhmKg+gVAjTtv7SVkyJkhjALa6/48u6tCAeH9Bz8+mW4/UoXhpWDB3cfD/WHSfLnpvX
 hqJ2+Zvi9biz6NT7erJcRM1bqThgqVJFOqGvUb7U7yKLB7EEd91D3ROymkY8jjXLJYUu
 tqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807262; x=1719412062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
 b=SutxKDXgBmqNbLpZMd2/P949OeUso/ItoPdBcdxQBpUs3GdKSUJmdCIXt55sLuGoJm
 s6QmWHeuokYIiJJ8oVROWPSk8V0lmsBrX7YOQdHhGB1lGoXJBvR05XbtPlMKW119l5wC
 xE8RB+R54esiAPO10uo1kvXpKNZBbFKzbm8YNgmPJt/r3QpRP1s/uMTi39OSIuBh0J8J
 p4hz0tFrNWB4dnjR7coGVjuv5H+f041HkIagcAgcdMe7yFN/gK9bCCpvmz2S1v1oTWS+
 KKDdMoife60DOL2693YP70W8sPzvZBKmTlSt6Kudc1bQV6if3taAD0TqBGm2p5BpAksx
 NwBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyMkvvteIRvGCDLSTS1kREdr3FLkgBdn5DfYLjgCmKBc/G6N3pkztokyGjQDBdNwsPaEroNfanNozs7DB3M7dtfr6ceQq/OFkvr3ZMUun0
X-Gm-Message-State: AOJu0YzpD0ZR8MqpFn6nQ6PITAOTvKWH2q0as70nyBcpAa87zHxmAgtD
 6i1MYhEEJr63+1zaYB13QvnAiihgRlNPFqK7XEhm1Y0YBgduGjoI+0xvnwGStGc=
X-Google-Smtp-Source: AGHT+IEeEBRvNzwpSD8Fs1Imp5pVXlsQQfg/ZiA1zsRiN4FF/aYn4Gxlj7EWTGzB/0ufExiA5d7ZKQ==
X-Received: by 2002:a05:620a:4450:b0:795:507b:6dac with SMTP id
 af79cd13be357-79bb3ee2f81mr279621685a.75.1718807262304; 
 Wed, 19 Jun 2024 07:27:42 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abe279a8sm609903885a.106.2024.06.19.07.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:27:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwHk-004aSD-L0;
 Wed, 19 Jun 2024 11:27:40 -0300
Date: Wed, 19 Jun 2024 11:27:40 -0300
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
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240619142740.GA1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
