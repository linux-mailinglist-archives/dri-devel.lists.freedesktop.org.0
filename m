Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE734EDFE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 18:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06E6E943;
	Tue, 30 Mar 2021 16:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56C66E945
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617122139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqtWosuqNKDa02gZMmemB9CDs97xM6L47pP8D8NZrVU=;
 b=dDL8kU5ebES4Ubck0bIexyzj7SP1NUbFJntMphFmpUeAyoviizenPPCUCJzCfXhafYoRsH
 NnH9nqLTdGWB4YSIdJC5ZnTo7c22ffwlHV2d5Q4/Mm3kon+mYvbImBtNwe9Lxu8zAI3cWC
 1w65eJ8Favirrz0zJgsrBwAF3+f0yNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-G-wn3Ys_OA2Fmo20TxtE-w-1; Tue, 30 Mar 2021 12:35:34 -0400
X-MC-Unique: G-wn3Ys_OA2Fmo20TxtE-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67BA18C89DD;
 Tue, 30 Mar 2021 16:35:31 +0000 (UTC)
Received: from gondolin (ovpn-113-155.ams2.redhat.com [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 141165D740;
 Tue, 30 Mar 2021 16:35:22 +0000 (UTC)
Date: Tue, 30 Mar 2021 18:35:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 18/18] vfio/mdev: Correct the function signatures for
 the mdev_type_attributes
Message-ID: <20210330183520.07c8aa47.cohuck@redhat.com>
In-Reply-To: <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, "Raj,
 Ashok" <ashok.raj@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Mar 2021 14:55:35 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The driver core standard is to pass in the properly typed object, the
> properly typed attribute and the buffer data. It stems from the root
> kobject method:
> 
>   ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,..)
> 
> Each subclass of kobject should provide their own function with the same
> signature but more specific types, eg struct device uses:
> 
>   ssize_t (*show)(struct device *dev, struct device_attribute *attr,..)
> 
> In this case the existing signature is:
> 
>   ssize_t (*show)(struct kobject *kobj, struct device *dev,..)
> 
> Where kobj is a 'struct mdev_type *' and dev is 'mdev_type->parent->dev'.
> 
> Change the mdev_type related sysfs attribute functions to:
> 
>   ssize_t (*show)(struct mdev_type *mtype, struct mdev_type_attribute *attr,..)
> 
> In order to restore type safety and match the driver core standard
> 
> There are no current users of 'attr', but if it is ever needed it would be
> hard to add in retroactively, so do it now.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c    | 21 +++++++++++----------
>  drivers/s390/cio/vfio_ccw_ops.c   | 15 +++++++++------
>  drivers/s390/crypto/vfio_ap_ops.c | 12 +++++++-----
>  drivers/vfio/mdev/mdev_core.c     | 14 ++++++++++++--
>  drivers/vfio/mdev/mdev_sysfs.c    | 11 ++++++-----
>  include/linux/mdev.h              | 11 +++++++----
>  samples/vfio-mdev/mbochs.c        | 26 +++++++++++++++-----------
>  samples/vfio-mdev/mdpy.c          | 24 ++++++++++++++----------
>  samples/vfio-mdev/mtty.c          | 18 +++++++++---------
>  9 files changed, 90 insertions(+), 62 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
