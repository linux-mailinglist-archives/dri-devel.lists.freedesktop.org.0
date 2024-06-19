Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6990F084
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAB210E203;
	Wed, 19 Jun 2024 14:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UpUgnIu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF8A10E203
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:30:18 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-795a4fde8bfso402372485a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807417; x=1719412217; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KkVwYQV/6jkEu0gAJvlVuepnjhHRXhEpVh+YOuYu3ZA=;
 b=UpUgnIu2HTQA9iA+aRYzNvYEvTSYAQoU3qqELpoGFqjARY5U8YMFi5+YBQ1ovtDPBd
 4SSUY4oxVuOh6k8vCOxpf9/VWUWbz7VLLl5cd5odagufsjTTTbiB6ELFdenGkisTGraD
 PcvLyGPK/LD7oADYXrH8PQpNtVGeOXXBZEESs4BT+OnxjiQlMQXTcEgvVxXuKSlAZyJf
 jZoRdTyDyHi4UHTRy0XaRzFFMvgKD9WZY0SirJ/vbS85UuWwjG49Hj/a3CHnDRQVOiGX
 xDCdv8IBNN70Gh6N7hR6uSWBT9GAOzkOWi2svs3XOj8ZfKmu5IGp3LnN0p1kXMTmLsx7
 9LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807417; x=1719412217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkVwYQV/6jkEu0gAJvlVuepnjhHRXhEpVh+YOuYu3ZA=;
 b=LwwPEUIrjzKeRfiPAfZzmnc9VDe5ZH7AOc2eTBfvAqqSK0YXCsJsXGHkjDq9S0JA4I
 3t9oQMQy4eL+4fuMD6lz/tM4Eyeqgq6gaQud502cPJbD4VV2iYxQs+3W4UdX1IM08zMU
 LrW1k+W7AP5qr5Rlwqs/TymqFjaK4Bw48trbxRjnu0IwLPH14HGbFDuJghMUVqNQ9pbo
 FUQA67NTTxRTckvrVyVpFbfTh239MAgHyl+53cq5K86m7WV6CLF+3DZyglubZHzY+13K
 rBJwz/SXMqh57vN1xBEM4r4qiAaPTHJhNSrqtjRNfcv0/f6h8uqR6zVL7UqhXZHtnf27
 p/qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVevMbDcAF3XwwQ7OrM4kEE7eGxsBLEO/jxbkF80bQ5Hpm0ql9WuoKi2xgqNM3BIng09Ivru53JQJp4IRBh5VNTofDjXCus+/o3gyR/o/FH
X-Gm-Message-State: AOJu0YwGep4/l+tbgScbQ12E0iC33Aw8UPk91hWR7lhHk9NH/medHgE8
 OaQoPRz2EO5OYyQW+/TO3D3lyLhB/A3ePXDgW5QHGd1YBcfhj2/nxOLjlM2e4x0=
X-Google-Smtp-Source: AGHT+IEtPhZvg8s2LGCIdwsd0X9DzLfBviQVD0T9AfPrmuxMxUw2V/bv52uCre/jcfSESaPOk4IESg==
X-Received: by 2002:a05:620a:4721:b0:795:4fee:81aa with SMTP id
 af79cd13be357-79bb3e55a93mr284092385a.33.1718807416680; 
 Wed, 19 Jun 2024 07:30:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bc1352ab4sm16883085a.70.2024.06.19.07.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:30:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwKF-004bBv-Kr;
 Wed, 19 Jun 2024 11:30:15 -0300
Date: Wed, 19 Jun 2024 11:30:15 -0300
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
Subject: Re: [PATCH v3 07/21] gpu: host1x: Use iommu_paging_domain_alloc()
Message-ID: <20240619143015.GB1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-8-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-8-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:41PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in host1x_iommu_attach() and is attached to
> host->dev. Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/host1x/dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
