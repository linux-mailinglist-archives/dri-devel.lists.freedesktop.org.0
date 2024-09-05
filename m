Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1D96DA38
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4002C10E8AD;
	Thu,  5 Sep 2024 13:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BMqmq2b8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E013A10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 13:25:01 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6c35b72f943so6729706d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1725542701; x=1726147501; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
 b=BMqmq2b8sdtq9wzbjPAcb3GldvCKqNCA9P4F/1MZDba4sfXTWNYvFkWa0f+JhIKDNk
 3QfG4S05jp2g81TR+mCB1we/pE2jCk8uQ+2iFqJhXsy8fBWCitlttQhQG8u3UIV8Aq6P
 9SAVPmPGmpf1I9eSVC6gkOxIplNGl6eT6FemQzSuiM+Td0TBpVjqdLbAY/m/5QnAH9a2
 fMng89+pYtMRL28uLUM38GaCBa4wi58gzZAmLy9Zy5G1Im0vFLjO6Y56N5fPN7sE/5k/
 xi/tCwx97zRG7KgTs/gSYJcsdmsCNNOrv4hLa+Sp2EB/9g8Yr2aUJHW8g1bVWX88rL6R
 K87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725542701; x=1726147501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
 b=q1gJDSgaaF3GFQNW4znilYS2ba0xLRtjTXea5VbApGO65zOMd1XHOtG1+I1q2ftdbP
 P4DnD5QYkipEJZDNLWHpIbUOcah6jmZv+pJ+40rb+kdkbQWGX1IcquvkqmCk1acO37dI
 rxWCslzw0ZVBQfVbbAaXPJqTE/kDwcAZ5k8Ug0MS2ZTiVd4FT82588ejwrpYyh/VzcWX
 bjwH2Zh11idZ3mxZkP4+I1qmpdAi+yFAK0YSMW6iNPAZHmODN+xpXRoAUr6StPpUtI0U
 eA/vxVomcIe+Jzm5pVZBFS1zAddLDXP7eHoAWpM5hMj4VtqVzDnugxG0WIyWdvSAJUHF
 UhOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXKjnzC50gVmQPDuaHxjNztsriRehTAG6Kdu1Z8uNYE/lFpCMLSJOa6WUOyeXWqLB+QamNw9rTJxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR08NEe6xXXkhBweStfMDsklRGpb0UkPTZapVK3PQAzD/OHfSM
 i//UP45LfvXKU3MOOtgCK+xu4IxpX9sv5LWz0E/tQ0eatwNX6WAySdi0o8+BQ8Q=
X-Google-Smtp-Source: AGHT+IEDu6pY51+TBXvcoJ6tFwe8exqs/WY3csyGmyVmQ8kYoFXlzHQS0zH+YsMUz1IR39QgtqrhaA==
X-Received: by 2002:ad4:44a8:0:b0:6c3:6799:dde3 with SMTP id
 6a1803df08f44-6c5191197b4mr91124026d6.23.1725542700794; 
 Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201dff49sm7525176d6.15.2024.09.05.06.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1smCTr-00CTrV-Rv;
 Thu, 05 Sep 2024 10:24:59 -0300
Date: Thu, 5 Sep 2024 10:24:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240905132459.GG1909087@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
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

On Wed, Sep 04, 2024 at 03:06:07PM -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will handle pushing it to drm-misc in just a moment

Did you just take this one patch? 

Who will take the rest of the series for DRM?

Jason
