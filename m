Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C990F09A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554EE10ECC9;
	Wed, 19 Jun 2024 14:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="LZt+yiRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF5910ECC9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:32:06 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6b505f11973so5033676d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807525; x=1719412325; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
 b=LZt+yiRjOSj5ap7TOzJjqD2LP5CP5L2u2fwNzpe/C+LVdWGHRqmEkn1qwrKMlPinl0
 H5dV5zGLmy10pB5IacJSEYooywHfk0DfpYRmMFdfd0Pq+lmhDkM+8zZcstd4vybC7KGz
 UPVBwNKtEQ7VrvYj9FU1uSpM45PDFUfBJfWEttS2eKdpGOxrRVrSw2TlPVucFM8DH6DW
 1zn/ZDf7ctI8NogstWvWcJQRg5j3WH70eNcHW2bjWN1TCn9tCPrwlX23cH/bnOZGR3ga
 IfJ5/p/wY4eZr5R45LtXFDLVL104VD61Emzc+BgO6Cw8vRYQyOfxH6k3dpgvxd6szMws
 Rqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807525; x=1719412325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
 b=dPkZ0VyzSFeSKXdc3ET5rGJ1pf3YGU0drOfhkxQ26AZtCZzy5K96KexsHcPbQY81FN
 Z4PkFMIzWVEHv3kiaaPCG/kH3dsn/jqm75OwbLj4RoL0cqbP3dG6V/HD+37Zjq+m0Ci8
 gjq/GTWX6SjtJClwHNRMsjoZUF/Qyem4iqZQs66q2/UjystbiOoHY25/s3wis4teVdAN
 8J6iNQp84KG39Pj1QskjAuRu4+kt4lkQ+OClxZkpQxSIRiwrmtHQxt9G+gvyAmOR6MmW
 +5XE+zacQVMVL4AzqhCZUqWtMkhe12J6EgZlLRdzLD3Czf7p5bV0tRgEvZNwefb85KvI
 g/Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK3YFmqE+a/8OTLhhDUO683CGbrJ0TwU/U9x/ZoJqxrpLBJ5esxcIw8mcwh8KU0xCiKAOOcIW6UWLAmN//RE4QXIMm0p7qERIlFa3tcF+u
X-Gm-Message-State: AOJu0YzLLzGVkOxc33ONnV09IWNrW3H7SjIC0X4WPvnFjfsX/GOUDqHX
 tiWgLnRTl4N/cUP9Ikxw7D6PH8hY6H9n2bdi5zDe5jHM6S2bDB+c6EmSmHVgfXk=
X-Google-Smtp-Source: AGHT+IGuQBogl5nnCa0xO+oPgBraH+EqrP6Ubhg3FSeuAcnXv1sZiKKYgQ7jm2DbFVYX9xP9hURczQ==
X-Received: by 2002:ad4:5f8b:0:b0:6b0:72ac:b306 with SMTP id
 6a1803df08f44-6b2e22d60bdmr86925786d6.1.1718807525299; 
 Wed, 19 Jun 2024 07:32:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb498bsm77913746d6.76.2024.06.19.07.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:32:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwM0-004bip-ET;
 Wed, 19 Jun 2024 11:32:04 -0300
Date: Wed, 19 Jun 2024 11:32:04 -0300
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
Subject: Re: [PATCH v3 09/21] media: venus: firmware: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143204.GD1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-10-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-10-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:43PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in venus_firmware_init() and is attached to
> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
