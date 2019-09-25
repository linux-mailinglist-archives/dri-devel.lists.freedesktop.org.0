Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB3BECB9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01566EDE7;
	Thu, 26 Sep 2019 07:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4DD6E062
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 14:11:28 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w6so4983931oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 07:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCFv6ltLWSQzmHGdHvs8M0P8BksuUC+ppYnTBTC/vr4=;
 b=sC63bzWxmj0HWSDDNp/HuFkwQXemHIqkyCgG20l6wh9G+2nnIboPBo030bUiil5jWY
 NQiBzQHKi2Y2GK8F0m4wnoQ7wYYlGPWmqnrt5X+b1qKDmWCnr04/yX4/schgGqogp5qF
 3duR5sCKXvv/VKvPPPyfNuolfo718x5cVGoU5pJGj4GwkJEq4Tn+wPO2hL83Ffhu+xF0
 qAV4Ccp9jZyV4QxxrkCkSa9iU0sQBMCJZhgBuNXFydKKb9Vbb/zOoFMLdIvPrhC27Q4S
 MNk/3XMHfpCdzvSP44A7jvs8g31/JFvckhbzZAF9D6rhTgKQU9HnH0hUw4cr7FoH2bwg
 MPlw==
X-Gm-Message-State: APjAAAVdKEIG11pVwBXfQ0B4XqPrbUn02Ggv6jNawNT2mfCT9v6O53gM
 bhnTth6bu0bwS2nYQ+4I1dCJeL7q0zZyXeugDof4bA==
X-Google-Smtp-Source: APXvYqyV/4cZvoKC2HhjWlGKP7xDgqZjndigGIfs2bBy1ypFIFAOSfEkmeqobpdxaWmWIM0xsFtbJjFgzbd55NdV2II=
X-Received: by 2002:aca:c550:: with SMTP id v77mr4451629oif.93.1569420687163; 
 Wed, 25 Sep 2019 07:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
From: Rob Miller <rob.miller@broadcom.com>
Date: Wed, 25 Sep 2019 10:11:00 -0400
Message-ID: <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
To: "Tian, Kevin" <kevin.tian@intel.com>
X-Mailman-Approved-At: Thu, 26 Sep 2019 07:42:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uCFv6ltLWSQzmHGdHvs8M0P8BksuUC+ppYnTBTC/vr4=;
 b=TAwOctHJ53aYmiCjNNGbQfeF0K0rrXjv1jeLKdFFKwfapoIwBbQP4VC6YHUg5Voavi
 mNwG9UcHY/R8B2UKLgPBhTy+bKWcUmpu2j/9TURRe3g+NdHzXzI3eZwSfUY2y60SNg5k
 4ENioNhcyPeUb6E3VL0PCjYNUtVr4zgAdpgDA=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1584584467=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1584584467==
Content-Type: multipart/alternative; boundary="0000000000008ffb650593613ae5"

--0000000000008ffb650593613ae5
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 4:52 AM Tian, Kevin <kevin.tian@intel.com> wrote:

> > From: Alex Williamson
> > Sent: Wednesday, September 25, 2019 7:07 AM
> >
> > On Tue, 24 Sep 2019 21:53:29 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> >
> > > Currently, except for the create and remove, the rest of
> > > mdev_parent_ops is designed for vfio-mdev driver only and may not help
> > > for kernel mdev driver. With the help of class id, this patch
> > > introduces device specific callbacks inside mdev_device
> > > structure. This allows different set of callback to be used by
> > > vfio-mdev and virtio-mdev.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  .../driver-api/vfio-mediated-device.rst       |  4 +-
> > >  MAINTAINERS                                   |  1 +
> > >  drivers/gpu/drm/i915/gvt/kvmgt.c              | 17 +++---
> > >  drivers/s390/cio/vfio_ccw_ops.c               | 17 ++++--
> > >  drivers/s390/crypto/vfio_ap_ops.c             | 13 +++--
> > >  drivers/vfio/mdev/mdev_core.c                 | 12 +++++
> > >  drivers/vfio/mdev/mdev_private.h              |  1 +
> > >  drivers/vfio/mdev/vfio_mdev.c                 | 37 ++++++-------
> > >  include/linux/mdev.h                          | 42 ++++-----------
> > >  include/linux/vfio_mdev.h                     | 52 +++++++++++++++++++
> > >  samples/vfio-mdev/mbochs.c                    | 19 ++++---
> > >  samples/vfio-mdev/mdpy.c                      | 19 ++++---
> > >  samples/vfio-mdev/mtty.c                      | 17 ++++--
> > >  13 files changed, 168 insertions(+), 83 deletions(-)
> > >  create mode 100644 include/linux/vfio_mdev.h
> > >
> > > diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> > b/Documentation/driver-api/vfio-mediated-device.rst
> > > index a5bdc60d62a1..d50425b368bb 100644
> > > --- a/Documentation/driver-api/vfio-mediated-device.rst
> > > +++ b/Documentation/driver-api/vfio-mediated-device.rst
> > > @@ -152,7 +152,9 @@ callbacks per mdev parent device, per mdev type,
> > or any other categorization.
> > >  Vendor drivers are expected to be fully asynchronous in this respect
> or
> > >  provide their own internal resource protection.)
> > >
> > > -The callbacks in the mdev_parent_ops structure are as follows:
> > > +The device specific callbacks are referred through device_ops pointer
> > > +in mdev_parent_ops. For vfio-mdev device, its callbacks in device_ops
> > > +are as follows:
> >
> > This is not accurate.  device_ops is now on the mdev_device and is an
> > mdev bus driver specific structure of callbacks that must be registered
> > for each mdev device by the parent driver during the create callback.
> > There's a one to one mapping of class_id to mdev_device_ops callbacks.
>
> there is also a mistake in include/Linux/mdev.h, where device_ops is
> still part of mdev_parent_ops in the comment line.
>
> >
> > That also suggests to me that we could be more clever in registering
> > both of these with mdev-core.  Can we embed the class_id in the ops
> > structure in a common way so that the core can extract it and the bus
> > drivers can access their specific callbacks?
> >
> > >  * open: open callback of mediated device
> > >  * close: close callback of mediated device
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b2326dece28e..89832b316500 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17075,6 +17075,7 @@ S:  Maintained
> > >  F: Documentation/driver-api/vfio-mediated-device.rst
> > >  F: drivers/vfio/mdev/
> > >  F: include/linux/mdev.h
> > > +F: include/linux/vfio_mdev.h
> > >  F: samples/vfio-mdev/
> > >
> > >  VFIO PLATFORM DRIVER
> > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > index f793252a3d2a..b274f5ee481f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > @@ -42,6 +42,7 @@
> > >  #include <linux/kvm_host.h>
> > >  #include <linux/vfio.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <linux/debugfs.h>
> > >
> > >  #include <linux/nospec.h>
> > > @@ -643,6 +644,8 @@ static void kvmgt_put_vfio_device(void *vgpu)
> > >     vfio_device_put(((struct intel_vgpu *)vgpu)->vdev.vfio_device);
> > >  }
> > >
> > > +static struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops;
> > > +
> > >  static int intel_vgpu_create(struct kobject *kobj, struct mdev_device
> > *mdev)
> > >  {
> > >     struct intel_vgpu *vgpu = NULL;
> > > @@ -679,6 +682,7 @@ static int intel_vgpu_create(struct kobject *kobj,
> > struct mdev_device *mdev)
> > >     ret = 0;
> > >
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &intel_vfio_vgpu_dev_ops);
> >
> > This seems rather unrefined.  We're registering interdependent data in
> > separate calls.  All drivers need to make both of these calls.  I'm not
> > sure if this is a good idea, but what if we had:
> >
> > static const struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops = {
> >       .id                     = MDEV_ID_VFIO,
> >       .open                   = intel_vgpu_open,
> >       .release                = intel_vgpu_release,
> >         ...
> >
> > And the set function passed &intel_vfio_vgpu_dev_ops.id and the mdev
> > bus drivers used container_of to get to their callbacks?
>
> or just make it explicit? e.g.
>
> mdev_set_class(mdev, MDEV_ID_VFIO, &intel_vfio_vgpu_dev_ops);
>
> >
> > >  out:
> > >     return ret;
> > >  }
> > > @@ -1601,20 +1605,21 @@ static const struct attribute_group
> > *intel_vgpu_groups[] = {
> > >     NULL,
> > >  };
> > >
> > > -static struct mdev_parent_ops intel_vgpu_ops = {
> > > -   .mdev_attr_groups       = intel_vgpu_groups,
> > > -   .create                 = intel_vgpu_create,
> > > -   .remove                 = intel_vgpu_remove,
> > > -
> > > +static struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops = {
> > >     .open                   = intel_vgpu_open,
> > >     .release                = intel_vgpu_release,
> > > -
> > >     .read                   = intel_vgpu_read,
> > >     .write                  = intel_vgpu_write,
> > >     .mmap                   = intel_vgpu_mmap,
> > >     .ioctl                  = intel_vgpu_ioctl,
> > >  };
> > >
> > > +static struct mdev_parent_ops intel_vgpu_ops = {
> >
> > These could maybe be made const at the same time.  Thanks,
> >
> > Alex
> >
> > > +   .mdev_attr_groups       = intel_vgpu_groups,
> > > +   .create                 = intel_vgpu_create,
> > > +   .remove                 = intel_vgpu_remove,
> > > +};
> > > +
> > >  static int kvmgt_host_init(struct device *dev, void *gvt, const void
> *ops)
> > >  {
> > >     struct attribute **kvm_type_attrs;
> > > diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> > b/drivers/s390/cio/vfio_ccw_ops.c
> > > index d258ef1fedb9..329d53c1f46b 100644
> > > --- a/drivers/s390/cio/vfio_ccw_ops.c
> > > +++ b/drivers/s390/cio/vfio_ccw_ops.c
> > > @@ -12,6 +12,7 @@
> > >
> > >  #include <linux/vfio.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/slab.h>
> > >
> > > @@ -110,6 +111,8 @@ static struct attribute_group *mdev_type_groups[]
> > = {
> > >     NULL,
> > >  };
> > >
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops;
> > > +
> > >  static int vfio_ccw_mdev_create(struct kobject *kobj, struct
> mdev_device
> > *mdev)
> > >  {
> > >     struct vfio_ccw_private *private =
> > > @@ -130,6 +133,7 @@ static int vfio_ccw_mdev_create(struct kobject
> > *kobj, struct mdev_device *mdev)
> > >                        private->sch->schid.sch_no);
> > >
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &vfio_mdev_ops);
> > >     return 0;
> > >  }
> > >
> > > @@ -575,11 +579,7 @@ static ssize_t vfio_ccw_mdev_ioctl(struct
> > mdev_device *mdev,
> > >     }
> > >  }
> > >
> > > -static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
> > > -   .owner                  = THIS_MODULE,
> > > -   .supported_type_groups  = mdev_type_groups,
> > > -   .create                 = vfio_ccw_mdev_create,
> > > -   .remove                 = vfio_ccw_mdev_remove,
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops = {
> > >     .open                   = vfio_ccw_mdev_open,
> > >     .release                = vfio_ccw_mdev_release,
> > >     .read                   = vfio_ccw_mdev_read,
> > > @@ -587,6 +587,13 @@ static const struct mdev_parent_ops
> > vfio_ccw_mdev_ops = {
> > >     .ioctl                  = vfio_ccw_mdev_ioctl,
> > >  };
> > >
> > > +static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
> > > +   .owner                  = THIS_MODULE,
> > > +   .supported_type_groups  = mdev_type_groups,
> > > +   .create                 = vfio_ccw_mdev_create,
> > > +   .remove                 = vfio_ccw_mdev_remove,
> > > +};
> > > +
> > >  int vfio_ccw_mdev_reg(struct subchannel *sch)
> > >  {
> > >     return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
> > > diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> > b/drivers/s390/crypto/vfio_ap_ops.c
> > > index 2cfd96112aa0..3a89933f0d3e 100644
> > > --- a/drivers/s390/crypto/vfio_ap_ops.c
> > > +++ b/drivers/s390/crypto/vfio_ap_ops.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/bitops.h>
> > >  #include <linux/kvm_host.h>
> > >  #include <linux/module.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <asm/kvm.h>
> > >  #include <asm/zcrypt.h>
> > >
> > > @@ -321,6 +322,8 @@ static void vfio_ap_matrix_init(struct
> > ap_config_info *info,
> > >     matrix->adm_max = info->apxa ? info->Nd : 15;
> > >  }
> > >
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops;
> > > +
> > >  static int vfio_ap_mdev_create(struct kobject *kobj, struct
> mdev_device
> > *mdev)
> > >  {
> > >     struct ap_matrix_mdev *matrix_mdev;
> > > @@ -344,6 +347,7 @@ static int vfio_ap_mdev_create(struct kobject
> > *kobj, struct mdev_device *mdev)
> > >     mutex_unlock(&matrix_dev->lock);
> > >
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &vfio_mdev_ops);
> > >     return 0;
> > >  }
> > >
> > > @@ -1281,15 +1285,18 @@ static ssize_t vfio_ap_mdev_ioctl(struct
> > mdev_device *mdev,
> > >     return ret;
> > >  }
> > >
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops = {
> > > +   .open                   = vfio_ap_mdev_open,
> > > +   .release                = vfio_ap_mdev_release,
> > > +   .ioctl                  = vfio_ap_mdev_ioctl,
> > > +};
> > > +
> > >  static const struct mdev_parent_ops vfio_ap_matrix_ops = {
> > >     .owner                  = THIS_MODULE,
> > >     .supported_type_groups  = vfio_ap_mdev_type_groups,
> > >     .mdev_attr_groups       = vfio_ap_mdev_attr_groups,
> > >     .create                 = vfio_ap_mdev_create,
> > >     .remove                 = vfio_ap_mdev_remove,
> > > -   .open                   = vfio_ap_mdev_open,
> > > -   .release                = vfio_ap_mdev_release,
> > > -   .ioctl                  = vfio_ap_mdev_ioctl,
> > >  };
> > >
> > >  int vfio_ap_mdev_register(void)
> > > diff --git a/drivers/vfio/mdev/mdev_core.c
> > b/drivers/vfio/mdev/mdev_core.c
> > > index 8764cf4a276d..6f35f2ced2c9 100644
> > > --- a/drivers/vfio/mdev/mdev_core.c
> > > +++ b/drivers/vfio/mdev/mdev_core.c
> > > @@ -51,6 +51,18 @@ void mdev_set_class_id(struct mdev_device *mdev,
> > u16 id)
> > >  }
> > >  EXPORT_SYMBOL(mdev_set_class_id);
> > >
> > > +const void *mdev_get_dev_ops(struct mdev_device *mdev)
> > > +{
> > > +   return mdev->device_ops;
> > > +}
> > > +EXPORT_SYMBOL(mdev_get_dev_ops);
> > > +
> > > +void mdev_set_dev_ops(struct mdev_device *mdev, const void *ops)
> > > +{
> > > +   mdev->device_ops = ops;
> > > +}
> > > +EXPORT_SYMBOL(mdev_set_dev_ops);
> > > +
> > >  struct device *mdev_dev(struct mdev_device *mdev)
> > >  {
> > >     return &mdev->dev;
> > > diff --git a/drivers/vfio/mdev/mdev_private.h
> > b/drivers/vfio/mdev/mdev_private.h
> > > index c65f436c1869..b666805f0b1f 100644
> > > --- a/drivers/vfio/mdev/mdev_private.h
> > > +++ b/drivers/vfio/mdev/mdev_private.h
> > > @@ -34,6 +34,7 @@ struct mdev_device {
> > >     struct device *iommu_device;
> > >     bool active;
> > >     u16 class_id;
> > > +   const void *device_ops;
> > >  };
> > >
> > >  #define to_mdev_device(dev)        container_of(dev, struct
> > mdev_device, dev)
> > > diff --git a/drivers/vfio/mdev/vfio_mdev.c
> > b/drivers/vfio/mdev/vfio_mdev.c
> > > index 891cf83a2d9a..95efa054442f 100644
> > > --- a/drivers/vfio/mdev/vfio_mdev.c
> > > +++ b/drivers/vfio/mdev/vfio_mdev.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/vfio.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >
> > >  #include "mdev_private.h"
> > >
> > > @@ -24,16 +25,16 @@
> > >  static int vfio_mdev_open(void *device_data)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >     int ret;
> > >
> > > -   if (unlikely(!parent->ops->open))
> > > +   if (unlikely(!ops->open))
> > >             return -EINVAL;
> > >
> > >     if (!try_module_get(THIS_MODULE))
> > >             return -ENODEV;
>

RJM>] My understanding lately is that this call to
try_module_get(THIS_MODULE) is no longer needed as is considered as a
latent bug.
Quote from
https://stackoverflow.com/questions/1741415/linux-kernel-modules-when-to-use-try-module-get-module-put
 :
There are a number of uses of try_module_get(THIS_MODULE) in the kernel
source but most if not all of them are latent bugs that should be cleaned
up.

> >
> > > -   ret = parent->ops->open(mdev);
> > > +   ret = ops->open(mdev);
> > >     if (ret)
> > >             module_put(THIS_MODULE);
> > >
> > > @@ -43,10 +44,10 @@ static int vfio_mdev_open(void *device_data)
> > >  static void vfio_mdev_release(void *device_data)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >
> > > -   if (likely(parent->ops->release))
> > > -           parent->ops->release(mdev);
> > > +   if (likely(ops->release))
> > > +           ops->release(mdev);
> > >
> > >     module_put(THIS_MODULE);
> > >  }
> > > @@ -55,47 +56,47 @@ static long vfio_mdev_unlocked_ioctl(void
> > *device_data,
> > >                                  unsigned int cmd, unsigned long arg)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >
> > > -   if (unlikely(!parent->ops->ioctl))
> > > +   if (unlikely(!ops->ioctl))
> > >             return -EINVAL;
> > >
> > > -   return parent->ops->ioctl(mdev, cmd, arg);
> > > +   return ops->ioctl(mdev, cmd, arg);
> > >  }
> > >
> > >  static ssize_t vfio_mdev_read(void *device_data, char __user *buf,
> > >                           size_t count, loff_t *ppos)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >
> > > -   if (unlikely(!parent->ops->read))
> > > +   if (unlikely(!ops->read))
> > >             return -EINVAL;
> > >
> > > -   return parent->ops->read(mdev, buf, count, ppos);
> > > +   return ops->read(mdev, buf, count, ppos);
> > >  }
> > >
> > >  static ssize_t vfio_mdev_write(void *device_data, const char __user
> *buf,
> > >                            size_t count, loff_t *ppos)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >
> > > -   if (unlikely(!parent->ops->write))
> > > +   if (unlikely(!ops->write))
> > >             return -EINVAL;
> > >
> > > -   return parent->ops->write(mdev, buf, count, ppos);
> > > +   return ops->write(mdev, buf, count, ppos);
> > >  }
> > >
> > >  static int vfio_mdev_mmap(void *device_data, struct vm_area_struct
> > *vma)
> > >  {
> > >     struct mdev_device *mdev = device_data;
> > > -   struct mdev_parent *parent = mdev->parent;
> > > +   const struct vfio_mdev_device_ops *ops =
> > mdev_get_dev_ops(mdev);
> > >
> > > -   if (unlikely(!parent->ops->mmap))
> > > +   if (unlikely(!ops->mmap))
> > >             return -EINVAL;
> > >
> > > -   return parent->ops->mmap(mdev, vma);
> > > +   return ops->mmap(mdev, vma);
> > >  }
> > >
> > >  static const struct vfio_device_ops vfio_mdev_dev_ops = {
> > > diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> > > index 3974650c074f..3414307311f1 100644
> > > --- a/include/linux/mdev.h
> > > +++ b/include/linux/mdev.h
> > > @@ -10,6 +10,11 @@
> > >  #ifndef MDEV_H
> > >  #define MDEV_H
> > >
> > > +#include <linux/types.h>
> > > +#include <linux/device.h>
> > > +#include <linux/mdev.h>
> > > +#include <uapi/linux/uuid.h>
> > > +
> > >  struct mdev_device;
> > >
> > >  /*
> > > @@ -48,30 +53,8 @@ struct device *mdev_get_iommu_device(struct
> > device *dev);
> > >   *                 @mdev: mdev_device device structure which is
> > being
> > >   *                        destroyed
> > >   *                 Returns integer: success (0) or error (< 0)
> > > - * @open:          Open mediated device.
> > > - *                 @mdev: mediated device.
> > > - *                 Returns integer: success (0) or error (< 0)
> > > - * @release:               release mediated device
> > > - *                 @mdev: mediated device.
> > > - * @read:          Read emulation callback
> > > - *                 @mdev: mediated device structure
> > > - *                 @buf: read buffer
> > > - *                 @count: number of bytes to read
> > > - *                 @ppos: address.
> > > - *                 Retuns number on bytes read on success or error.
> > > - * @write:         Write emulation callback
> > > - *                 @mdev: mediated device structure
> > > - *                 @buf: write buffer
> > > - *                 @count: number of bytes to be written
> > > - *                 @ppos: address.
> > > - *                 Retuns number on bytes written on success or error.
> > > - * @ioctl:         IOCTL callback
> > > - *                 @mdev: mediated device structure
> > > - *                 @cmd: ioctl command
> > > - *                 @arg: arguments to ioctl
> > > - * @mmap:          mmap callback
> > > - *                 @mdev: mediated device structure
> > > - *                 @vma: vma structure
> > > + * @device_ops:         Device specific emulation callback.
> > > + *
> > >   * Parent device that support mediated device should be registered
> with
> > mdev
> > >   * module with mdev_parent_ops structure.
> > >   **/
> > > @@ -83,15 +66,6 @@ struct mdev_parent_ops {
> > >
> > >     int     (*create)(struct kobject *kobj, struct mdev_device *mdev);
> > >     int     (*remove)(struct mdev_device *mdev);
> > > -   int     (*open)(struct mdev_device *mdev);
> > > -   void    (*release)(struct mdev_device *mdev);
> > > -   ssize_t (*read)(struct mdev_device *mdev, char __user *buf,
> > > -                   size_t count, loff_t *ppos);
> > > -   ssize_t (*write)(struct mdev_device *mdev, const char __user *buf,
> > > -                    size_t count, loff_t *ppos);
> > > -   long    (*ioctl)(struct mdev_device *mdev, unsigned int cmd,
> > > -                    unsigned long arg);
> > > -   int     (*mmap)(struct mdev_device *mdev, struct vm_area_struct
> > *vma);
> > >  };
> > >
> > >  /* interface for exporting mdev supported type attributes */
> > > @@ -133,6 +107,8 @@ struct mdev_driver {
> > >
> > >  void *mdev_get_drvdata(struct mdev_device *mdev);
> > >  void mdev_set_drvdata(struct mdev_device *mdev, void *data);
> > > +const void *mdev_get_dev_ops(struct mdev_device *mdev);
> > > +void mdev_set_dev_ops(struct mdev_device *mdev, const void *ops);
> > >  void mdev_set_class_id(struct mdev_device *mdev, u16 id);
> > >  const guid_t *mdev_uuid(struct mdev_device *mdev);
> > >
> > > diff --git a/include/linux/vfio_mdev.h b/include/linux/vfio_mdev.h
> > > new file mode 100644
> > > index 000000000000..3907c5371c2b
> > > --- /dev/null
> > > +++ b/include/linux/vfio_mdev.h
> > > @@ -0,0 +1,52 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * VFIO Mediated device definition
> > > + */
> > > +
> > > +#ifndef VFIO_MDEV_H
> > > +#define VFIO_MDEV_H
> > > +
> > > +#include <linux/mdev.h>
> > > +
> > > +/**
> > > + * struct vfio_mdev_device_ops - Structure to be registered for each
> > > + * mdev device to register the device to vfio-mdev module.
> > > + *
> > > + * @open:          Open mediated device.
> > > + *                 @mdev: mediated device.
> > > + *                 Returns integer: success (0) or error (< 0)
> > > + * @release:               release mediated device
> > > + *                 @mdev: mediated device.
> > > + * @read:          Read emulation callback
> > > + *                 @mdev: mediated device structure
> > > + *                 @buf: read buffer
> > > + *                 @count: number of bytes to read
> > > + *                 @ppos: address.
> > > + *                 Retuns number on bytes read on success or error.
> > > + * @write:         Write emulation callback
> > > + *                 @mdev: mediated device structure
> > > + *                 @buf: write buffer
> > > + *                 @count: number of bytes to be written
> > > + *                 @ppos: address.
> > > + *                 Retuns number on bytes written on success or error.
> > > + * @ioctl:         IOCTL callback
> > > + *                 @mdev: mediated device structure
> > > + *                 @cmd: ioctl command
> > > + *                 @arg: arguments to ioctl
> > > + * @mmap:          mmap callback
> > > + *                 @mdev: mediated device structure
> > > + *                 @vma: vma structure
> > > + */
> > > +struct vfio_mdev_device_ops {
> > > +   int     (*open)(struct mdev_device *mdev);
> > > +   void    (*release)(struct mdev_device *mdev);
> > > +   ssize_t (*read)(struct mdev_device *mdev, char __user *buf,
> > > +                   size_t count, loff_t *ppos);
> > > +   ssize_t (*write)(struct mdev_device *mdev, const char __user *buf,
> > > +                    size_t count, loff_t *ppos);
> > > +   long    (*ioctl)(struct mdev_device *mdev, unsigned int cmd,
> > > +                    unsigned long arg);
> > > +   int     (*mmap)(struct mdev_device *mdev, struct vm_area_struct
> > *vma);
> > > +};
> > > +
> > > +#endif
> > > diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> > > index 8a8583c892b2..b4bf29c6136c 100644
> > > --- a/samples/vfio-mdev/mbochs.c
> > > +++ b/samples/vfio-mdev/mbochs.c
> > > @@ -30,6 +30,7 @@
> > >  #include <linux/iommu.h>
> > >  #include <linux/sysfs.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/highmem.h>
> > > @@ -516,6 +517,8 @@ static int mbochs_reset(struct mdev_device
> > *mdev)
> > >     return 0;
> > >  }
> > >
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops;
> > > +
> > >  static int mbochs_create(struct kobject *kobj, struct mdev_device
> *mdev)
> > >  {
> > >     const struct mbochs_type *type = mbochs_find_type(kobj);
> > > @@ -562,6 +565,7 @@ static int mbochs_create(struct kobject *kobj,
> > struct mdev_device *mdev)
> > >
> > >     mbochs_used_mbytes += type->mbytes;
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &vfio_mdev_ops);
> > >     return 0;
> > >
> > >  err_mem:
> > > @@ -1419,12 +1423,7 @@ static struct attribute_group
> > *mdev_type_groups[] = {
> > >     NULL,
> > >  };
> > >
> > > -static const struct mdev_parent_ops mdev_fops = {
> > > -   .owner                  = THIS_MODULE,
> > > -   .mdev_attr_groups       = mdev_dev_groups,
> > > -   .supported_type_groups  = mdev_type_groups,
> > > -   .create                 = mbochs_create,
> > > -   .remove                 = mbochs_remove,
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops = {
> > >     .open                   = mbochs_open,
> > >     .release                = mbochs_close,
> > >     .read                   = mbochs_read,
> > > @@ -1433,6 +1432,14 @@ static const struct mdev_parent_ops
> > mdev_fops = {
> > >     .mmap                   = mbochs_mmap,
> > >  };
> > >
> > > +static const struct mdev_parent_ops mdev_fops = {
> > > +   .owner                  = THIS_MODULE,
> > > +   .mdev_attr_groups       = mdev_dev_groups,
> > > +   .supported_type_groups  = mdev_type_groups,
> > > +   .create                 = mbochs_create,
> > > +   .remove                 = mbochs_remove,
> > > +};
> > > +
> > >  static const struct file_operations vd_fops = {
> > >     .owner          = THIS_MODULE,
> > >  };
> > > diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> > > index 88d7e76f3836..80c2df531326 100644
> > > --- a/samples/vfio-mdev/mdpy.c
> > > +++ b/samples/vfio-mdev/mdpy.c
> > > @@ -26,6 +26,7 @@
> > >  #include <linux/iommu.h>
> > >  #include <linux/sysfs.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <linux/pci.h>
> > >  #include <drm/drm_fourcc.h>
> > >  #include "mdpy-defs.h"
> > > @@ -226,6 +227,8 @@ static int mdpy_reset(struct mdev_device *mdev)
> > >     return 0;
> > >  }
> > >
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops;
> > > +
> > >  static int mdpy_create(struct kobject *kobj, struct mdev_device *mdev)
> > >  {
> > >     const struct mdpy_type *type = mdpy_find_type(kobj);
> > > @@ -270,6 +273,7 @@ static int mdpy_create(struct kobject *kobj, struct
> > mdev_device *mdev)
> > >
> > >     mdpy_count++;
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &vfio_mdev_ops);
> > >     return 0;
> > >  }
> > >
> > > @@ -726,12 +730,7 @@ static struct attribute_group
> > *mdev_type_groups[] = {
> > >     NULL,
> > >  };
> > >
> > > -static const struct mdev_parent_ops mdev_fops = {
> > > -   .owner                  = THIS_MODULE,
> > > -   .mdev_attr_groups       = mdev_dev_groups,
> > > -   .supported_type_groups  = mdev_type_groups,
> > > -   .create                 = mdpy_create,
> > > -   .remove                 = mdpy_remove,
> > > +static const struct vfio_mdev_device_ops vfio_mdev_ops = {
> > >     .open                   = mdpy_open,
> > >     .release                = mdpy_close,
> > >     .read                   = mdpy_read,
> > > @@ -740,6 +739,14 @@ static const struct mdev_parent_ops mdev_fops
> > = {
> > >     .mmap                   = mdpy_mmap,
> > >  };
> > >
> > > +static const struct mdev_parent_ops mdev_fops = {
> > > +   .owner                  = THIS_MODULE,
> > > +   .mdev_attr_groups       = mdev_dev_groups,
> > > +   .supported_type_groups  = mdev_type_groups,
> > > +   .create                 = mdpy_create,
> > > +   .remove                 = mdpy_remove,
> > > +};
> > > +
> > >  static const struct file_operations vd_fops = {
> > >     .owner          = THIS_MODULE,
> > >  };
> > > diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> > > index 4e0735143b69..2db860ccb02c 100644
> > > --- a/samples/vfio-mdev/mtty.c
> > > +++ b/samples/vfio-mdev/mtty.c
> > > @@ -27,6 +27,7 @@
> > >  #include <linux/ctype.h>
> > >  #include <linux/file.h>
> > >  #include <linux/mdev.h>
> > > +#include <linux/vfio_mdev.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/serial.h>
> > >  #include <uapi/linux/serial_reg.h>
> > > @@ -723,6 +724,8 @@ static ssize_t mdev_access(struct mdev_device
> > *mdev, u8 *buf, size_t count,
> > >     return ret;
> > >  }
> > >
> > > +static const struct vfio_mdev_device_ops vfio_dev_ops;
> > > +
> > >  static int mtty_create(struct kobject *kobj, struct mdev_device *mdev)
> > >  {
> > >     struct mdev_state *mdev_state;
> > > @@ -771,6 +774,7 @@ static int mtty_create(struct kobject *kobj, struct
> > mdev_device *mdev)
> > >     mutex_unlock(&mdev_list_lock);
> > >
> > >     mdev_set_class_id(mdev, MDEV_ID_VFIO);
> > > +   mdev_set_dev_ops(mdev, &vfio_dev_ops);
> > >     return 0;
> > >  }
> > >
> > > @@ -1411,6 +1415,14 @@ static struct attribute_group
> > *mdev_type_groups[] = {
> > >     NULL,
> > >  };
> > >
> > > +static const struct vfio_mdev_device_ops vfio_dev_ops = {
> > > +   .open                   = mtty_open,
> > > +   .release                = mtty_close,
> > > +   .read                   = mtty_read,
> > > +   .write                  = mtty_write,
> > > +   .ioctl                  = mtty_ioctl,
> > > +};
> > > +
> > >  static const struct mdev_parent_ops mdev_fops = {
> > >     .owner                  = THIS_MODULE,
> > >     .dev_attr_groups        = mtty_dev_groups,
> > > @@ -1418,11 +1430,6 @@ static const struct mdev_parent_ops
> > mdev_fops = {
> > >     .supported_type_groups  = mdev_type_groups,
> > >     .create                 = mtty_create,
> > >     .remove                 = mtty_remove,
> > > -   .open                   = mtty_open,
> > > -   .release                = mtty_close,
> > > -   .read                   = mtty_read,
> > > -   .write                  = mtty_write,
> > > -   .ioctl                  = mtty_ioctl,
> > >  };
> > >
> > >  static void mtty_device_release(struct device *dev)
> >
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>

--0000000000008ffb650593613ae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 25, 2019 at 4:52 AM Tian, Kev=
in &lt;<a href=3D"mailto:kevin.tian@intel.com">kevin.tian@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; From: Alex Williamson<br>
&gt; Sent: Wednesday, September 25, 2019 7:07 AM<br>
&gt; <br>
&gt; On Tue, 24 Sep 2019 21:53:29 +0800<br>
&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank=
">jasowang@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Currently, except for the create and remove, the rest of<br>
&gt; &gt; mdev_parent_ops is designed for vfio-mdev driver only and may not=
 help<br>
&gt; &gt; for kernel mdev driver. With the help of class id, this patch<br>
&gt; &gt; introduces device specific callbacks inside mdev_device<br>
&gt; &gt; structure. This allows different set of callback to be used by<br=
>
&gt; &gt; vfio-mdev and virtio-mdev.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.c=
om" target=3D"_blank">jasowang@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../driver-api/vfio-mediated-device.rst=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/i915/gvt/kvmgt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 17 +++---<br>
&gt; &gt;=C2=A0 drivers/s390/cio/vfio_ccw_ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++--<br>
&gt; &gt;=C2=A0 drivers/s390/crypto/vfio_ap_ops.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++--<br>
&gt; &gt;=C2=A0 drivers/vfio/mdev/mdev_core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
&gt; &gt;=C2=A0 drivers/vfio/mdev/mdev_private.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 drivers/vfio/mdev/vfio_mdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 ++++++-------<br>
&gt; &gt;=C2=A0 include/linux/mdev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 42 ++++-----------<b=
r>
&gt; &gt;=C2=A0 include/linux/vfio_mdev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 52 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 samples/vfio-mdev/mbochs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++---<br>
&gt; &gt;=C2=A0 samples/vfio-mdev/mdpy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++---<br>
&gt; &gt;=C2=A0 samples/vfio-mdev/mtty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 ++++--<br>
&gt; &gt;=C2=A0 13 files changed, 168 insertions(+), 83 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 include/linux/vfio_mdev.h<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/Documentation/driver-api/vfio-mediated-device.rst<br=
>
&gt; b/Documentation/driver-api/vfio-mediated-device.rst<br>
&gt; &gt; index a5bdc60d62a1..d50425b368bb 100644<br>
&gt; &gt; --- a/Documentation/driver-api/vfio-mediated-device.rst<br>
&gt; &gt; +++ b/Documentation/driver-api/vfio-mediated-device.rst<br>
&gt; &gt; @@ -152,7 +152,9 @@ callbacks per mdev parent device, per mdev ty=
pe,<br>
&gt; or any other categorization.<br>
&gt; &gt;=C2=A0 Vendor drivers are expected to be fully asynchronous in thi=
s respect or<br>
&gt; &gt;=C2=A0 provide their own internal resource protection.)<br>
&gt; &gt;<br>
&gt; &gt; -The callbacks in the mdev_parent_ops structure are as follows:<b=
r>
&gt; &gt; +The device specific callbacks are referred through device_ops po=
inter<br>
&gt; &gt; +in mdev_parent_ops. For vfio-mdev device, its callbacks in devic=
e_ops<br>
&gt; &gt; +are as follows:<br>
&gt; <br>
&gt; This is not accurate.=C2=A0 device_ops is now on the mdev_device and i=
s an<br>
&gt; mdev bus driver specific structure of callbacks that must be registere=
d<br>
&gt; for each mdev device by the parent driver during the create callback.<=
br>
&gt; There&#39;s a one to one mapping of class_id to mdev_device_ops callba=
cks.<br>
<br>
there is also a mistake in include/Linux/mdev.h, where device_ops is<br>
still part of mdev_parent_ops in the comment line.<br>
<br>
&gt; <br>
&gt; That also suggests to me that we could be more clever in registering<b=
r>
&gt; both of these with mdev-core.=C2=A0 Can we embed the class_id in the o=
ps<br>
&gt; structure in a common way so that the core can extract it and the bus<=
br>
&gt; drivers can access their specific callbacks?<br>
&gt; <br>
&gt; &gt;=C2=A0 * open: open callback of mediated device<br>
&gt; &gt;=C2=A0 * close: close callback of mediated device<br>
&gt; &gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; &gt; index b2326dece28e..89832b316500 100644<br>
&gt; &gt; --- a/MAINTAINERS<br>
&gt; &gt; +++ b/MAINTAINERS<br>
&gt; &gt; @@ -17075,6 +17075,7 @@ S:=C2=A0 Maintained<br>
&gt; &gt;=C2=A0 F: Documentation/driver-api/vfio-mediated-device.rst<br>
&gt; &gt;=C2=A0 F: drivers/vfio/mdev/<br>
&gt; &gt;=C2=A0 F: include/linux/mdev.h<br>
&gt; &gt; +F: include/linux/vfio_mdev.h<br>
&gt; &gt;=C2=A0 F: samples/vfio-mdev/<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 VFIO PLATFORM DRIVER<br>
&gt; &gt; diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c<br>
&gt; b/drivers/gpu/drm/i915/gvt/kvmgt.c<br>
&gt; &gt; index f793252a3d2a..b274f5ee481f 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/i915/gvt/kvmgt.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c<br>
&gt; &gt; @@ -42,6 +42,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/kvm_host.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/vfio.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/debugfs.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/nospec.h&gt;<br>
&gt; &gt; @@ -643,6 +644,8 @@ static void kvmgt_put_vfio_device(void *vgpu)=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0vfio_device_put(((struct intel_vgpu *)vgpu)-&g=
t;vdev.vfio_device);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int intel_vgpu_create(struct kobject *kobj, struct m=
dev_device<br>
&gt; *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct intel_vgpu *vgpu =3D NULL;<br>
&gt; &gt; @@ -679,6 +682,7 @@ static int intel_vgpu_create(struct kobject *=
kobj,<br>
&gt; struct mdev_device *mdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;intel_vfio_vgpu_dev_ops=
);<br>
&gt; <br>
&gt; This seems rather unrefined.=C2=A0 We&#39;re registering interdependen=
t data in<br>
&gt; separate calls.=C2=A0 All drivers need to make both of these calls.=C2=
=A0 I&#39;m not<br>
&gt; sure if this is a good idea, but what if we had:<br>
&gt; <br>
&gt; static const struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops =3D {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D MDEV_ID_VFIO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_open,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D intel_vgpu_release,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; <br>
&gt; And the set function passed &amp;<a href=3D"http://intel_vfio_vgpu_dev=
_ops.id" rel=3D"noreferrer" target=3D"_blank">intel_vfio_vgpu_dev_ops.id</a=
> and the mdev<br>
&gt; bus drivers used container_of to get to their callbacks?<br>
<br>
or just make it explicit? e.g.<br>
<br>
mdev_set_class(mdev, MDEV_ID_VFIO, &amp;intel_vfio_vgpu_dev_ops);<br>
<br>
&gt; <br>
&gt; &gt;=C2=A0 out:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -1601,20 +1605,21 @@ static const struct attribute_group<br>
&gt; *intel_vgpu_groups[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; -static struct mdev_parent_ops intel_vgpu_ops =3D {<br>
&gt; &gt; -=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D int=
el_vgpu_groups,<br>
&gt; &gt; -=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_create,<br>
&gt; &gt; -=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_remove,<br>
&gt; &gt; -<br>
&gt; &gt; +static struct vfio_mdev_device_ops intel_vfio_vgpu_dev_ops =3D {=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_open,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D intel_vgpu_release,<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_read,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D intel_vgpu_write,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_mmap,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D intel_vgpu_ioctl,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static struct mdev_parent_ops intel_vgpu_ops =3D {<br>
&gt; <br>
&gt; These could maybe be made const at the same time.=C2=A0 Thanks,<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D int=
el_vgpu_groups,<br>
&gt; &gt; +=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_create,<br>
&gt; &gt; +=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D intel_vgpu_remove,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int kvmgt_host_init(struct device *dev, void *gvt, c=
onst void *ops)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct attribute **kvm_type_attrs;<br>
&gt; &gt; diff --git a/drivers/s390/cio/vfio_ccw_ops.c<br>
&gt; b/drivers/s390/cio/vfio_ccw_ops.c<br>
&gt; &gt; index d258ef1fedb9..329d53c1f46b 100644<br>
&gt; &gt; --- a/drivers/s390/cio/vfio_ccw_ops.c<br>
&gt; &gt; +++ b/drivers/s390/cio/vfio_ccw_ops.c<br>
&gt; &gt; @@ -12,6 +12,7 @@<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/vfio.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/nospec.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; @@ -110,6 +111,8 @@ static struct attribute_group *mdev_type_grou=
ps[]<br>
&gt; =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int vfio_ccw_mdev_create(struct kobject *kobj, struc=
t mdev_device<br>
&gt; *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct vfio_ccw_private *private =3D<br>
&gt; &gt; @@ -130,6 +133,7 @@ static int vfio_ccw_mdev_create(struct kobjec=
t<br>
&gt; *kobj, struct mdev_device *mdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 private-&gt;sch-&gt;schid.sch_no);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;vfio_mdev_ops);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -575,11 +579,7 @@ static ssize_t vfio_ccw_mdev_ioctl(struct<br=
>
&gt; mdev_device *mdev,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -static const struct mdev_parent_ops vfio_ccw_mdev_ops =3D {<br>
&gt; &gt; -=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; -=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; -=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_create,<br>
&gt; &gt; -=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_remove,<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_open,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D vfio_ccw_mdev_release,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_read,<br>
&gt; &gt; @@ -587,6 +587,13 @@ static const struct mdev_parent_ops<br>
&gt; vfio_ccw_mdev_ops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D vfio_ccw_mdev_ioctl,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct mdev_parent_ops vfio_ccw_mdev_ops =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; +=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; +=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_create,<br>
&gt; &gt; +=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D vfio_ccw_mdev_remove,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 int vfio_ccw_mdev_reg(struct subchannel *sch)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return mdev_register_device(&amp;sch-&gt;dev, =
&amp;vfio_ccw_mdev_ops);<br>
&gt; &gt; diff --git a/drivers/s390/crypto/vfio_ap_ops.c<br>
&gt; b/drivers/s390/crypto/vfio_ap_ops.c<br>
&gt; &gt; index 2cfd96112aa0..3a89933f0d3e 100644<br>
&gt; &gt; --- a/drivers/s390/crypto/vfio_ap_ops.c<br>
&gt; &gt; +++ b/drivers/s390/crypto/vfio_ap_ops.c<br>
&gt; &gt; @@ -16,6 +16,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/bitops.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/kvm_host.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/module.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;asm/kvm.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;asm/zcrypt.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; @@ -321,6 +322,8 @@ static void vfio_ap_matrix_init(struct<br>
&gt; ap_config_info *info,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0matrix-&gt;adm_max =3D info-&gt;apxa ? info-&g=
t;Nd : 15;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int vfio_ap_mdev_create(struct kobject *kobj, struct=
 mdev_device<br>
&gt; *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct ap_matrix_mdev *matrix_mdev;<br>
&gt; &gt; @@ -344,6 +347,7 @@ static int vfio_ap_mdev_create(struct kobject=
<br>
&gt; *kobj, struct mdev_device *mdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;matrix_dev-&gt;lock);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;vfio_mdev_ops);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -1281,15 +1285,18 @@ static ssize_t vfio_ap_mdev_ioctl(struct<=
br>
&gt; mdev_device *mdev,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ap_mdev_open,<br>
&gt; &gt; +=C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D vfio_ap_mdev_release,<br>
&gt; &gt; +=C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D vfio_ap_mdev_ioctl,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static const struct mdev_parent_ops vfio_ap_matrix_ops =3D =
{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D vfio_ap_mdev_=
type_groups,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D vfio_ap_mdev_attr_groups,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ap_mdev_create,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ap_mdev_remove,<br>
&gt; &gt; -=C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D vfio_ap_mdev_open,<br>
&gt; &gt; -=C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D vfio_ap_mdev_release,<br>
&gt; &gt; -=C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D vfio_ap_mdev_ioctl,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 int vfio_ap_mdev_register(void)<br>
&gt; &gt; diff --git a/drivers/vfio/mdev/mdev_core.c<br>
&gt; b/drivers/vfio/mdev/mdev_core.c<br>
&gt; &gt; index 8764cf4a276d..6f35f2ced2c9 100644<br>
&gt; &gt; --- a/drivers/vfio/mdev/mdev_core.c<br>
&gt; &gt; +++ b/drivers/vfio/mdev/mdev_core.c<br>
&gt; &gt; @@ -51,6 +51,18 @@ void mdev_set_class_id(struct mdev_device *mde=
v,<br>
&gt; u16 id)<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 EXPORT_SYMBOL(mdev_set_class_id);<br>
&gt; &gt;<br>
&gt; &gt; +const void *mdev_get_dev_ops(struct mdev_device *mdev)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0return mdev-&gt;device_ops;<br>
&gt; &gt; +}<br>
&gt; &gt; +EXPORT_SYMBOL(mdev_get_dev_ops);<br>
&gt; &gt; +<br>
&gt; &gt; +void mdev_set_dev_ops(struct mdev_device *mdev, const void *ops)=
<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0mdev-&gt;device_ops =3D ops;<br>
&gt; &gt; +}<br>
&gt; &gt; +EXPORT_SYMBOL(mdev_set_dev_ops);<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 struct device *mdev_dev(struct mdev_device *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return &amp;mdev-&gt;dev;<br>
&gt; &gt; diff --git a/drivers/vfio/mdev/mdev_private.h<br>
&gt; b/drivers/vfio/mdev/mdev_private.h<br>
&gt; &gt; index c65f436c1869..b666805f0b1f 100644<br>
&gt; &gt; --- a/drivers/vfio/mdev/mdev_private.h<br>
&gt; &gt; +++ b/drivers/vfio/mdev/mdev_private.h<br>
&gt; &gt; @@ -34,6 +34,7 @@ struct mdev_device {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct device *iommu_device;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bool active;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0u16 class_id;<br>
&gt; &gt; +=C2=A0 =C2=A0const void *device_ops;<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define to_mdev_device(dev)=C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
ainer_of(dev, struct<br>
&gt; mdev_device, dev)<br>
&gt; &gt; diff --git a/drivers/vfio/mdev/vfio_mdev.c<br>
&gt; b/drivers/vfio/mdev/vfio_mdev.c<br>
&gt; &gt; index 891cf83a2d9a..95efa054442f 100644<br>
&gt; &gt; --- a/drivers/vfio/mdev/vfio_mdev.c<br>
&gt; &gt; +++ b/drivers/vfio/mdev/vfio_mdev.c<br>
&gt; &gt; @@ -14,6 +14,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/vfio.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #include &quot;mdev_private.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -24,16 +25,16 @@<br>
&gt; &gt;=C2=A0 static int vfio_mdev_open(void *device_data)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (unlikely(!parent-&gt;ops-&gt;open))<br>
&gt; &gt; +=C2=A0 =C2=A0if (unlikely(!ops-&gt;open))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!try_module_get(THIS_MODULE))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br=
></blockquote><div><br></div><div>RJM&gt;] My understanding lately is that =
this call to try_module_get(THIS_MODULE) is no longer needed as is consider=
ed as a latent bug.</div><div><span style=3D"color:rgb(36,39,41);font-famil=
y:Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px">Quo=
te from=C2=A0</span><a href=3D"https://stackoverflow.com/questions/1741415/=
linux-kernel-modules-when-to-use-try-module-get-module-put">https://stackov=
erflow.com/questions/1741415/linux-kernel-modules-when-to-use-try-module-ge=
t-module-put</a><span style=3D"color:rgb(36,39,41);font-family:Arial,&quot;=
Helvetica Neue&quot;,Helvetica,sans-serif;font-size:15px">=C2=A0:</span></d=
iv><div><span style=3D"color:rgb(36,39,41);font-family:Arial,&quot;Helvetic=
a Neue&quot;,Helvetica,sans-serif;font-size:15px">There are a number of use=
s of try_module_get(THIS_MODULE) in the kernel source but most if not all o=
f them are latent bugs that should be cleaned up.</span>=C2=A0</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0ret =3D parent-&gt;ops-&gt;open(mdev);<br>
&gt; &gt; +=C2=A0 =C2=A0ret =3D ops-&gt;open(mdev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module_put(THIS_MO=
DULE);<br>
&gt; &gt;<br>
&gt; &gt; @@ -43,10 +44,10 @@ static int vfio_mdev_open(void *device_data)<=
br>
&gt; &gt;=C2=A0 static void vfio_mdev_release(void *device_data)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (likely(parent-&gt;ops-&gt;release))<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;ops-&gt;rele=
ase(mdev);<br>
&gt; &gt; +=C2=A0 =C2=A0if (likely(ops-&gt;release))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ops-&gt;release(mdev);<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0module_put(THIS_MODULE);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -55,47 +56,47 @@ static long vfio_mdev_unlocked_ioctl(void<br>
&gt; *device_data,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cmd, unsi=
gned long arg)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (unlikely(!parent-&gt;ops-&gt;ioctl))<br>
&gt; &gt; +=C2=A0 =C2=A0if (unlikely(!ops-&gt;ioctl))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br=
>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0return parent-&gt;ops-&gt;ioctl(mdev, cmd, arg);<br=
>
&gt; &gt; +=C2=A0 =C2=A0return ops-&gt;ioctl(mdev, cmd, arg);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static ssize_t vfio_mdev_read(void *device_data, char __use=
r *buf,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count, loff_t *ppos)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (unlikely(!parent-&gt;ops-&gt;read))<br>
&gt; &gt; +=C2=A0 =C2=A0if (unlikely(!ops-&gt;read))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br=
>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0return parent-&gt;ops-&gt;read(mdev, buf, count, pp=
os);<br>
&gt; &gt; +=C2=A0 =C2=A0return ops-&gt;read(mdev, buf, count, ppos);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static ssize_t vfio_mdev_write(void *device_data, const cha=
r __user *buf,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t count, loff_t *ppos)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (unlikely(!parent-&gt;ops-&gt;write))<br>
&gt; &gt; +=C2=A0 =C2=A0if (unlikely(!ops-&gt;write))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br=
>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0return parent-&gt;ops-&gt;write(mdev, buf, count, p=
pos);<br>
&gt; &gt; +=C2=A0 =C2=A0return ops-&gt;write(mdev, buf, count, ppos);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static int vfio_mdev_mmap(void *device_data, struct vm_area=
_struct<br>
&gt; *vma)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_device *mdev =3D device_data;<br>
&gt; &gt; -=C2=A0 =C2=A0struct mdev_parent *parent =3D mdev-&gt;parent;<br>
&gt; &gt; +=C2=A0 =C2=A0const struct vfio_mdev_device_ops *ops =3D<br>
&gt; mdev_get_dev_ops(mdev);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0if (unlikely(!parent-&gt;ops-&gt;mmap))<br>
&gt; &gt; +=C2=A0 =C2=A0if (unlikely(!ops-&gt;mmap))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br=
>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0return parent-&gt;ops-&gt;mmap(mdev, vma);<br>
&gt; &gt; +=C2=A0 =C2=A0return ops-&gt;mmap(mdev, vma);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static const struct vfio_device_ops vfio_mdev_dev_ops =3D {=
<br>
&gt; &gt; diff --git a/include/linux/mdev.h b/include/linux/mdev.h<br>
&gt; &gt; index 3974650c074f..3414307311f1 100644<br>
&gt; &gt; --- a/include/linux/mdev.h<br>
&gt; &gt; +++ b/include/linux/mdev.h<br>
&gt; &gt; @@ -10,6 +10,11 @@<br>
&gt; &gt;=C2=A0 #ifndef MDEV_H<br>
&gt; &gt;=C2=A0 #define MDEV_H<br>
&gt; &gt;<br>
&gt; &gt; +#include &lt;linux/types.h&gt;<br>
&gt; &gt; +#include &lt;linux/device.h&gt;<br>
&gt; &gt; +#include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;uapi/linux/uuid.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 struct mdev_device;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /*<br>
&gt; &gt; @@ -48,30 +53,8 @@ struct device *mdev_get_iommu_device(struct<br=
>
&gt; device *dev);<br>
&gt; &gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0@mdev: mdev_device device structure which is<br>
&gt; being<br>
&gt; &gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destroyed<br>
&gt; &gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Returns integer: success (0) or error (&lt; 0)<br>
&gt; &gt; - * @open:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Open mediated device=
.<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device.<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Returns integer: success (0) or error (&lt; 0)<br>
&gt; &gt; - * @release:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0release mediated device<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device.<br>
&gt; &gt; - * @read:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Read emulation callb=
ack<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@buf: read buffer<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@count: number of bytes to read<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@ppos: address.<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Retuns number on bytes read on success or error.<br>
&gt; &gt; - * @write:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Write emulation call=
back<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@buf: write buffer<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@count: number of bytes to be written<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@ppos: address.<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Retuns number on bytes written on success or error.<br>
&gt; &gt; - * @ioctl:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOCTL callback<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@cmd: ioctl command<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@arg: arguments to ioctl<br>
&gt; &gt; - * @mmap:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap callback<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@vma: vma structure<br>
&gt; &gt; + * @device_ops:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Device specific=
 emulation callback.<br>
&gt; &gt; + *<br>
&gt; &gt;=C2=A0 =C2=A0* Parent device that support mediated device should b=
e registered with<br>
&gt; mdev<br>
&gt; &gt;=C2=A0 =C2=A0* module with mdev_parent_ops structure.<br>
&gt; &gt;=C2=A0 =C2=A0**/<br>
&gt; &gt; @@ -83,15 +66,6 @@ struct mdev_parent_ops {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*create)(struct kobjec=
t *kobj, struct mdev_device *mdev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*remove)(struct mdev_d=
evice *mdev);<br>
&gt; &gt; -=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*open)(struct mdev_device *=
mdev);<br>
&gt; &gt; -=C2=A0 =C2=A0void=C2=A0 =C2=A0 (*release)(struct mdev_device *md=
ev);<br>
&gt; &gt; -=C2=A0 =C2=A0ssize_t (*read)(struct mdev_device *mdev, char __us=
er *buf,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t count, loff_t *ppos);<br>
&gt; &gt; -=C2=A0 =C2=A0ssize_t (*write)(struct mdev_device *mdev, const ch=
ar __user *buf,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t count, loff_t *ppos);<br>
&gt; &gt; -=C2=A0 =C2=A0long=C2=A0 =C2=A0 (*ioctl)(struct mdev_device *mdev=
, unsigned int cmd,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unsigned long arg);<br>
&gt; &gt; -=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*mmap)(struct mdev_device *=
mdev, struct vm_area_struct<br>
&gt; *vma);<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /* interface for exporting mdev supported type attributes *=
/<br>
&gt; &gt; @@ -133,6 +107,8 @@ struct mdev_driver {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 void *mdev_get_drvdata(struct mdev_device *mdev);<br>
&gt; &gt;=C2=A0 void mdev_set_drvdata(struct mdev_device *mdev, void *data)=
;<br>
&gt; &gt; +const void *mdev_get_dev_ops(struct mdev_device *mdev);<br>
&gt; &gt; +void mdev_set_dev_ops(struct mdev_device *mdev, const void *ops)=
;<br>
&gt; &gt;=C2=A0 void mdev_set_class_id(struct mdev_device *mdev, u16 id);<b=
r>
&gt; &gt;=C2=A0 const guid_t *mdev_uuid(struct mdev_device *mdev);<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/include/linux/vfio_mdev.h b/include/linux/vfio_mdev.=
h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..3907c5371c2b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/include/linux/vfio_mdev.h<br>
&gt; &gt; @@ -0,0 +1,52 @@<br>
&gt; &gt; +/* SPDX-License-Identifier: GPL-2.0-only */<br>
&gt; &gt; +/*<br>
&gt; &gt; + * VFIO Mediated device definition<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef VFIO_MDEV_H<br>
&gt; &gt; +#define VFIO_MDEV_H<br>
&gt; &gt; +<br>
&gt; &gt; +#include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * struct vfio_mdev_device_ops - Structure to be registered for =
each<br>
&gt; &gt; + * mdev device to register the device to vfio-mdev module.<br>
&gt; &gt; + *<br>
&gt; &gt; + * @open:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Open mediated device=
.<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device.<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Returns integer: success (0) or error (&lt; 0)<br>
&gt; &gt; + * @release:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0release mediated device<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device.<br>
&gt; &gt; + * @read:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Read emulation callb=
ack<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@buf: read buffer<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@count: number of bytes to read<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@ppos: address.<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Retuns number on bytes read on success or error.<br>
&gt; &gt; + * @write:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Write emulation call=
back<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@buf: write buffer<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@count: number of bytes to be written<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@ppos: address.<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Retuns number on bytes written on success or error.<br>
&gt; &gt; + * @ioctl:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOCTL callback<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@cmd: ioctl command<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@arg: arguments to ioctl<br>
&gt; &gt; + * @mmap:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap callback<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@mdev: mediated device structure<br>
&gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
@vma: vma structure<br>
&gt; &gt; + */<br>
&gt; &gt; +struct vfio_mdev_device_ops {<br>
&gt; &gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*open)(struct mdev_device *=
mdev);<br>
&gt; &gt; +=C2=A0 =C2=A0void=C2=A0 =C2=A0 (*release)(struct mdev_device *md=
ev);<br>
&gt; &gt; +=C2=A0 =C2=A0ssize_t (*read)(struct mdev_device *mdev, char __us=
er *buf,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t count, loff_t *ppos);<br>
&gt; &gt; +=C2=A0 =C2=A0ssize_t (*write)(struct mdev_device *mdev, const ch=
ar __user *buf,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t count, loff_t *ppos);<br>
&gt; &gt; +=C2=A0 =C2=A0long=C2=A0 =C2=A0 (*ioctl)(struct mdev_device *mdev=
, unsigned int cmd,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unsigned long arg);<br>
&gt; &gt; +=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0(*mmap)(struct mdev_device *=
mdev, struct vm_area_struct<br>
&gt; *vma);<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +#endif<br>
&gt; &gt; diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mboch=
s.c<br>
&gt; &gt; index 8a8583c892b2..b4bf29c6136c 100644<br>
&gt; &gt; --- a/samples/vfio-mdev/mbochs.c<br>
&gt; &gt; +++ b/samples/vfio-mdev/mbochs.c<br>
&gt; &gt; @@ -30,6 +30,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/iommu.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/sysfs.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/pci.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/dma-buf.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/highmem.h&gt;<br>
&gt; &gt; @@ -516,6 +517,8 @@ static int mbochs_reset(struct mdev_device<br=
>
&gt; *mdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int mbochs_create(struct kobject *kobj, struct mdev_=
device *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0const struct mbochs_type *type =3D mbochs_find=
_type(kobj);<br>
&gt; &gt; @@ -562,6 +565,7 @@ static int mbochs_create(struct kobject *kobj=
,<br>
&gt; struct mdev_device *mdev)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mbochs_used_mbytes +=3D type-&gt;mbytes;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;vfio_mdev_ops);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 err_mem:<br>
&gt; &gt; @@ -1419,12 +1423,7 @@ static struct attribute_group<br>
&gt; *mdev_type_groups[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; -static const struct mdev_parent_ops mdev_fops =3D {<br>
&gt; &gt; -=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; -=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mde=
v_dev_groups,<br>
&gt; &gt; -=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; -=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mbochs_create,<br>
&gt; &gt; -=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mbochs_remove,<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mbochs_open,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mbochs_close,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mbochs_read,<br>
&gt; &gt; @@ -1433,6 +1432,14 @@ static const struct mdev_parent_ops<br>
&gt; mdev_fops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mbochs_mmap,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct mdev_parent_ops mdev_fops =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; +=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mde=
v_dev_groups,<br>
&gt; &gt; +=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; +=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mbochs_create,<br>
&gt; &gt; +=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mbochs_remove,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static const struct file_operations vd_fops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D T=
HIS_MODULE,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt; diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c<=
br>
&gt; &gt; index 88d7e76f3836..80c2df531326 100644<br>
&gt; &gt; --- a/samples/vfio-mdev/mdpy.c<br>
&gt; &gt; +++ b/samples/vfio-mdev/mdpy.c<br>
&gt; &gt; @@ -26,6 +26,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/iommu.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/sysfs.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/pci.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;drm/drm_fourcc.h&gt;<br>
&gt; &gt;=C2=A0 #include &quot;mdpy-defs.h&quot;<br>
&gt; &gt; @@ -226,6 +227,8 @@ static int mdpy_reset(struct mdev_device *mde=
v)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int mdpy_create(struct kobject *kobj, struct mdev_de=
vice *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0const struct mdpy_type *type =3D mdpy_find_typ=
e(kobj);<br>
&gt; &gt; @@ -270,6 +273,7 @@ static int mdpy_create(struct kobject *kobj, =
struct<br>
&gt; mdev_device *mdev)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdpy_count++;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;vfio_mdev_ops);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -726,12 +730,7 @@ static struct attribute_group<br>
&gt; *mdev_type_groups[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; -static const struct mdev_parent_ops mdev_fops =3D {<br>
&gt; &gt; -=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; -=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mde=
v_dev_groups,<br>
&gt; &gt; -=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; -=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mdpy_create,<br>
&gt; &gt; -=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mdpy_remove,<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_mdev_ops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mdpy_open,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mdpy_close,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mdpy_read,<br>
&gt; &gt; @@ -740,6 +739,14 @@ static const struct mdev_parent_ops mdev_fop=
s<br>
&gt; =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mdpy_mmap,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct mdev_parent_ops mdev_fops =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt; +=C2=A0 =C2=A0.mdev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mde=
v_dev_groups,<br>
&gt; &gt; +=C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_groups,<=
br>
&gt; &gt; +=C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mdpy_create,<br>
&gt; &gt; +=C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D mdpy_remove,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static const struct file_operations vd_fops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D T=
HIS_MODULE,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt; diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c<=
br>
&gt; &gt; index 4e0735143b69..2db860ccb02c 100644<br>
&gt; &gt; --- a/samples/vfio-mdev/mtty.c<br>
&gt; &gt; +++ b/samples/vfio-mdev/mtty.c<br>
&gt; &gt; @@ -27,6 +27,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;linux/ctype.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/file.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/mdev.h&gt;<br>
&gt; &gt; +#include &lt;linux/vfio_mdev.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/pci.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;linux/serial.h&gt;<br>
&gt; &gt;=C2=A0 #include &lt;uapi/linux/serial_reg.h&gt;<br>
&gt; &gt; @@ -723,6 +724,8 @@ static ssize_t mdev_access(struct mdev_device=
<br>
&gt; *mdev, u8 *buf, size_t count,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_dev_ops;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static int mtty_create(struct kobject *kobj, struct mdev_de=
vice *mdev)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct mdev_state *mdev_state;<br>
&gt; &gt; @@ -771,6 +774,7 @@ static int mtty_create(struct kobject *kobj, =
struct<br>
&gt; mdev_device *mdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mdev_list_lock);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mdev_set_class_id(mdev, MDEV_ID_VFIO);<br>
&gt; &gt; +=C2=A0 =C2=A0mdev_set_dev_ops(mdev, &amp;vfio_dev_ops);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -1411,6 +1415,14 @@ static struct attribute_group<br>
&gt; *mdev_type_groups[] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +static const struct vfio_mdev_device_ops vfio_dev_ops =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_open,<br>
&gt; &gt; +=C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D mtty_close,<br>
&gt; &gt; +=C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_read,<br>
&gt; &gt; +=C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mtty_write,<br>
&gt; &gt; +=C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mtty_ioctl,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static const struct mdev_parent_ops mdev_fops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.dev_attr_groups=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D mtty_dev_groups,<br>
&gt; &gt; @@ -1418,11 +1430,6 @@ static const struct mdev_parent_ops<br>
&gt; mdev_fops =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.supported_type_groups=C2=A0 =3D mdev_type_gro=
ups,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_create,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_remove,<br>
&gt; &gt; -=C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_open,<br>
&gt; &gt; -=C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D mtty_close,<br>
&gt; &gt; -=C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D mtty_read,<br>
&gt; &gt; -=C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mtty_write,<br>
&gt; &gt; -=C2=A0 =C2=A0.ioctl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D mtty_ioctl,<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static void mtty_device_release(struct device *dev)<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; intel-gvt-dev mailing list<br>
&gt; <a href=3D"mailto:intel-gvt-dev@lists.freedesktop.org" target=3D"_blan=
k">intel-gvt-dev@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/intel-gvt-de=
v" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/intel-gvt-dev</a><br>
</blockquote></div></div>

--0000000000008ffb650593613ae5--

--===============1584584467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1584584467==--
