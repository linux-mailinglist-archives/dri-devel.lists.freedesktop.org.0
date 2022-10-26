Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0860EACA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466810E365;
	Wed, 26 Oct 2022 21:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E897110E366
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666819498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ys5yrKnSWNrdXyOIt/+2hibuD6RgZdYjr5anEvm87I=;
 b=SWU8rY9dU+rv13ZhNBygJ6c8ulXbdc3Ezj704zKrk9vZ5ViztJg7gtlT6msKJz/vVAPYQm
 R5b2rIFA6WJHKkllZvL8sheDqsgg6AtKVuKcCoRJxZsoqL5VVhJvMgbhfHjiyqohnnqwIP
 x0WRE7oTGFzaA/lewn5lMKJJ+wW+VxE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-SlMuhVsuNgKrkcic-LgRaQ-1; Wed, 26 Oct 2022 17:24:57 -0400
X-MC-Unique: SlMuhVsuNgKrkcic-LgRaQ-1
Received: by mail-io1-f72.google.com with SMTP id
 i21-20020a6bf415000000b006bc987bf9faso11298618iog.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 14:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ys5yrKnSWNrdXyOIt/+2hibuD6RgZdYjr5anEvm87I=;
 b=GQXnhdqhzfrdAgfIbaxWbqalB5hwiGUu11pl9Q9rVkjCtq+en8Lwy6SLqv8uBQ/9iQ
 KsP7+Ve2imV8YVO7sKyekcHpldOwSWKz6RE9I51Oy50YYys1cJPOx6Jgdxn2TzfE7yZu
 acc/7xxjKc3d+k82OadmPBUWNxTdY4gFQzndQHIq3hnz6RsNUYzgjuVdGhFNI5FDEQAz
 uX+f4Yc4eH6TdFJ5Dg3U4clqrT87MG6nklAHD50nzO9+3W0E/qkxjZpW+sdfIgimor3y
 QtPRu2ynzuYCKRw1As8x7SBhXYp+PcEPa1Mh24B8yVtHXGUxDsyl43RxDVqy6Uukg0OY
 LuXg==
X-Gm-Message-State: ACrzQf0PF1YJm9t+c/WPh1wkYDAZJxfG3jo69HHmDNPmMmywl8iGhf8D
 PM485M5IOVYQCRerFLT+I/ZxcyncrElPESOqhjJHIsgCklTJAEK6bKqXJBfvIwRyyzJAgG5BQJA
 lGAR0tcOl/3hwUbTL72RDXD57oii6
X-Received: by 2002:a05:6e02:787:b0:300:4249:560f with SMTP id
 q7-20020a056e02078700b003004249560fmr6449856ils.79.1666819496584; 
 Wed, 26 Oct 2022 14:24:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78B1N1rhquL7I27LvLWaJii8bhooCw6yJ0rMTPt8axTAAIzjlyMmOikhzath1gqGNuTiEASg==
X-Received: by 2002:a05:6e02:1b08:b0:2fc:4df6:e468 with SMTP id
 i8-20020a056e021b0800b002fc4df6e468mr27916129ilv.148.1666819486067; 
 Wed, 26 Oct 2022 14:24:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x13-20020a02948d000000b0036c8a246f54sm2409348jah.142.2022.10.26.14.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:24:45 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:24:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221026152442.4855c5de.alex.williamson@redhat.com>
In-Reply-To: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Oct 2022 15:17:10 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> This legacy module knob has become uAPI, when set on the vfio_iommu_type1
> it disables some security protections in the iommu drivers. Move the
> storage for this knob to vfio_main.c so that iommufd can access it too.

I don't really understand this, we're changing the behavior of the
iommufd_device_attach() operation based on the modules options of
vfio_iommu_type1, which may not be loaded or even compiled into the
kernel.  Our compatibility story falls apart when VFIO_CONTAINER is not
set, iommufd sneaks in to usurp /dev/vfio/vfio, and the user's module
options for type1 go unprocessed.

I hate to suggest that type1 becomes a module that does nothing more
than maintain consistency of this variable when the full type1 isn't
available, but is that what we need to do?  Thanks,

Alex

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio.h             | 2 ++
>  drivers/vfio/vfio_iommu_type1.c | 5 ++---
>  drivers/vfio/vfio_main.c        | 3 +++
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index f95f4925b83bbd..54e5a8e0834ccb 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -130,4 +130,6 @@ extern bool vfio_noiommu __read_mostly;
>  enum { vfio_noiommu = false };
>  #endif
>  
> +extern bool vfio_allow_unsafe_interrupts;
> +
>  #endif
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 23c24fe98c00d4..186e33a006d314 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -44,9 +44,8 @@
>  #define DRIVER_AUTHOR   "Alex Williamson <alex.williamson@redhat.com>"
>  #define DRIVER_DESC     "Type1 IOMMU driver for VFIO"
>  
> -static bool allow_unsafe_interrupts;
>  module_param_named(allow_unsafe_interrupts,
> -		   allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> +		   vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(allow_unsafe_interrupts,
>  		 "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
>  
> @@ -2282,7 +2281,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  		    iommu_group_for_each_dev(iommu_group, (void *)IOMMU_CAP_INTR_REMAP,
>  					     vfio_iommu_device_capable);
>  
> -	if (!allow_unsafe_interrupts && !msi_remap) {
> +	if (!vfio_allow_unsafe_interrupts && !msi_remap) {
>  		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
>  		       __func__);
>  		ret = -EPERM;
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 8d809ecd982b39..1e414b2c48a511 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -51,6 +51,9 @@ static struct vfio {
>  	struct ida			device_ida;
>  } vfio;
>  
> +bool vfio_allow_unsafe_interrupts;
> +EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
> +
>  static DEFINE_XARRAY(vfio_device_set_xa);
>  static const struct file_operations vfio_group_fops;
>  

