Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF457EA10
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 00:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96B189690;
	Fri, 22 Jul 2022 22:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7994759
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658530231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CK6lmXhfwHfiatVMUw8JndR4RA0GTNn0tRqyQRH49OE=;
 b=BCf78VJpHcoXvQutiAYLqI+ItJUiIB9eJSI3AzDzj2FjU7DRK6RdOG1bMy/ResDU2Y86gI
 GSocW9lE0JJ3uubszuv5EutOkh4/u6SKNOP/6FzF07F6xo5J3x02M+CN3cao7OZkNULC5k
 sMWimHaAvuGaebJghi8TW3NwmpdPMyQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-QaWoB6feMpqsHTR_5QucfQ-1; Fri, 22 Jul 2022 18:50:28 -0400
X-MC-Unique: QaWoB6feMpqsHTR_5QucfQ-1
Received: by mail-il1-f199.google.com with SMTP id
 i9-20020a056e021b0900b002dd12dfd5b6so3434476ilv.16
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 15:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=CK6lmXhfwHfiatVMUw8JndR4RA0GTNn0tRqyQRH49OE=;
 b=0Eu+nQsY6dAUL3dgiY7Ob0XF99fJGKMBEmrbPhNDAFiX7EC7IdPUnEURb4o1jEttVy
 7juk+HavcDUgRne0X4hC9/+DCDpRFg9aZK/0Fg6k5yj9caPKw6FoD9RvojskojqYND8U
 xl8PyiEhNL5gS5f0Bq1CPshNmXxj5kLH34LS4rmvvTcMOa1YLeOVh2gHRg0CFt0oNIGd
 24CntDWjwTI95D61lKi8bosr7oLV10vwUiV2Iq5YPqjhc3ZddxYG1zwK5xu4plD4ggYL
 ibRM12TXSvXeAX7xOB6b8PKyPNduewV0MAdrfPB7xHKkz97inBiT/0wddECxp65JWvDi
 xN3w==
X-Gm-Message-State: AJIora+1GNxJ7FG1jIlxhvc03SEWINVoTLzi3vRbOKD6lR22xD3GZMXV
 DR7IPT+nk7+qmWZSvHd2E5HAdxw0gWtALDE49FBrHasA57YUNNAG3GoxLAB/nZU0VnJ7cg01xfZ
 h4Gzy7mRPyunGTJk2q1MYazMzWQl9
X-Received: by 2002:a05:6638:3181:b0:32a:eb54:1152 with SMTP id
 z1-20020a056638318100b0032aeb541152mr951291jak.120.1658530227581; 
 Fri, 22 Jul 2022 15:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5wn4lDkAQ/yj/kizLiq+//m5jdlQMu2EqfOktCU40xQgJvUisSso9AjpCLGmeYpAf31sEIQ==
X-Received: by 2002:a05:6638:3181:b0:32a:eb54:1152 with SMTP id
 z1-20020a056638318100b0032aeb541152mr951286jak.120.1658530227371; 
 Fri, 22 Jul 2022 15:50:27 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f41-20020a0284ac000000b0033f3fcba96bsm2532614jai.100.2022.07.22.15.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 15:50:26 -0700 (PDT)
Date: Fri, 22 Jul 2022 16:50:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 0/2] Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier
Message-ID: <20220722165024.7a41778f.alex.williamson@redhat.com>
In-Reply-To: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022 21:02:47 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> This is the last notifier toward the drivers, replace it with a simple op
> callback in the vfio_device_ops.
> 
> v4:
>  - Rebase over the CCW series
> v3: https://lore.kernel.org/r/0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com
>  - Remove 'nb' doc string from ccw
>  - Rebase on extern removal patch
>  - Check that register_device/unregister_device are either both defined or
>    not
>  - Remove check of dma_unmap during vfio_register_iommu_driver() as it
>    would break the drivers that don't use pin_pages
>  - Don't change VFIO_IOMMU_NOTIFY_DMA_UNMAP to an enum since we are not
>    keeping it anyhow
> v2: https://lore.kernel.org/r/0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com
>  - Declare and initialize variables in intel_vgpu_dma_unmap()
>  - Remove 'vendor' when touching comments
>  - Remove kdoc for vfio dma_unmap notifier
>  - Add WARN_ON to vfio_register_emulated_iommu_dev() since dma_unmap is
>    mandatory
>  - Move dma_unmap call loop to vfio_notify_dma_unmap()
>  - Document why the double mutex is being used and why the mutex lock is
>    dropped when calling dma_unmap
> v1: https://lore.kernel.org/r/0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason Gunthorpe (2):
>   vfio: Replace the DMA unmapping notifier with a callback
>   vfio: Replace the iommu notifier with a device list
> 
>  drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 +++++-------------
>  drivers/s390/cio/vfio_ccw_ops.c       |  39 ++--------
>  drivers/s390/cio/vfio_ccw_private.h   |   2 -
>  drivers/s390/crypto/vfio_ap_ops.c     |  53 ++-----------
>  drivers/s390/crypto/vfio_ap_private.h |   3 -
>  drivers/vfio/vfio.c                   | 108 ++++++--------------------
>  drivers/vfio/vfio.h                   |   9 +--
>  drivers/vfio/vfio_iommu_type1.c       | 103 +++++++++++++++---------
>  include/linux/vfio.h                  |  21 +----
>  10 files changed, 132 insertions(+), 282 deletions(-)
> 
> 
> base-commit: 2a8ed7ef00b939fbcc98b948f780bd03bafed227

Applied to vfio next branch for v5.20.  Applied as posted since
Nicolin's series regressed GVT-g support.  Thanks,

Alex

