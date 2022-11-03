Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630D617DF4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1425110E29B;
	Thu,  3 Nov 2022 13:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953CD10E297
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:32:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06FD9B827D0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9008AC4314B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667482333;
 bh=UoFLX0FinbIoJbNaDjFI2Coj6yGat/OIbklXhnthpyk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vKkeMd8j95YWAZVmGgdyI8W+j+0b2VEYEgLxGUvGubJ314BfNOvk4qui9T5wGcywK
 uyWRkcImlwrivJhO67RsQOD0Atj34wn+YM136ByI9Ot30YVeT2hZxvRVF+M6fn7457
 iibVbRTsnd17CpOZF7u0xDyHqn5ZQF2uQHHsuTTJk4s94+wtEHVs8uxqIOzuI1eepf
 3tNGwsXN5CPi2QHVdNDfaYoVv23+hoLs18i5cg14WIPB8HmbSc1jURIl9YxL3bwewo
 BXs0P39BCc7ee09cyJnAlbyRHyGiJEByRuAyyswTKfS8XnrRB2xpRW8+AWb3GYP4Z2
 UhEKlVrDx4kog==
Received: by mail-yb1-f179.google.com with SMTP id 185so2222690ybc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:32:13 -0700 (PDT)
X-Gm-Message-State: ACrzQf3sz6dZsqx7vybIeSO3+wgPLhlyLV6/y8syxRFkbP/IcGYYBXwy
 rOforL8o0Lf6AjMXjUsgLbkdPPPhxV54a3HNVeM=
X-Google-Smtp-Source: AMsMyM5bftAXtLLuov90T8bioufKoJDjG80R/SQTYWAHpH5Es5NQXy6d7SdXW3iWu1zfuRa0tBD2ngyDJnBqyHQGC3k=
X-Received: by 2002:a25:9102:0:b0:6cc:9093:c8bf with SMTP id
 v2-20020a259102000000b006cc9093c8bfmr23856507ybl.197.1667482332482; Thu, 03
 Nov 2022 06:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
In-Reply-To: <Y2MMCIe5wND2XPqE@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 3 Nov 2022 15:31:45 +0200
X-Gmail-Original-Message-ID: <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
Message-ID: <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 3, 2022 at 2:31 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 02, 2022 at 10:34:03PM +0200, Oded Gabbay wrote:
> > --- /dev/null
> > +++ b/drivers/accel/Kconfig
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Compute Acceleration device configuration
> > +#
> > +# This framework provides support for compute acceleration devices, such
> > +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> > +# devices
> > +#
> > +menuconfig ACCEL
> > +     tristate "Compute Acceleration Framework"
> > +     depends on DRM
> > +     help
> > +       Framework for device drivers of compute acceleration devices, such
> > +       as, but not limited to, Machine-Learning and Deep-Learning
> > +       acceleration devices.
> > +       If you say Y here, you need to select the module that's right for
> > +       your acceleration device from the list below.
> > +       This framework is integrated with the DRM subsystem as compute
> > +       accelerators and GPUs share a lot in common and can use almost the
> > +       same infrastructure code.
> > +       Having said that, acceleration devices will have a different
> > +       major number than GPUs, and will be exposed to user-space using
> > +       different device files, called accel/accel* (in /dev, sysfs
> > +       and debugfs)
>
> Module name if "M" is chosen?
Will add
>
>
> > +static char *accel_devnode(struct device *dev, umode_t *mode)
> > +{
> > +     return kasprintf(GFP_KERNEL, "accel/%s", dev_name(dev));
> > +}
> > +
> > +static CLASS_ATTR_STRING(accel_version, 0444, "accel 1.0.0 20221018");
>
> What is a version number doing here?
>
> Please no, I understand that DRM has this, but it really does not make
> sense for any in-kernel code.  And that's not how sysfs is supposed to
> work anyway (if a file is present, the value is documented, if the file
> is not present, the value is just not there, userspace has to handle
> it all.)
Actually I don't know if drm even uses that. I just copied it to be
identical to drm's sysfs, but
as accel doesn't have any history, I can remove it.
>
> > +
> > +/**
> > + * accel_sysfs_init - initialize sysfs helpers
> > + *
> > + * This is used to create the ACCEL class, which is the implicit parent of any
> > + * other top-level ACCEL sysfs objects.
> > + *
> > + * You must call accel_sysfs_destroy() to release the allocated resources.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +static int accel_sysfs_init(void)
> > +{
> > +     int err;
> > +
> > +     accel_class = class_create(THIS_MODULE, "accel");
> > +     if (IS_ERR(accel_class))
> > +             return PTR_ERR(accel_class);
> > +
> > +     err = class_create_file(accel_class, &class_attr_accel_version.attr);
>
> Hint, if you ever find yourself adding sysfs files "by hand" like this,
> you are doing something wrong.  The driver code should create them
> automatically for you by setting up default groups, _OR_ as in this
> case, you shouldn't be adding the file at all :)
ok, removed.

>
> > +static void accel_sysfs_destroy(void)
> > +{
> > +     if (IS_ERR_OR_NULL(accel_class))
> > +             return;
> > +     class_remove_file(accel_class, &class_attr_accel_version.attr);
>
> No need to manually destroy files when you remove a device.  But you
> will remove this file anyway for the next version of this patch, so it's
> not a big deal :)
:)
>
> > +     class_destroy(accel_class);
> > +     accel_class = NULL;
> > +}
> > +
> > +static int accel_stub_open(struct inode *inode, struct file *filp)
> > +{
> > +     DRM_DEBUG("Operation not supported");
>
> ftrace is wonderful, please use that and not hand-rolled custom "I am
> here!" type messages like this.
I'll just remove it as this line is being replaced anyway in the next patch.
Thanks,
Oded
>
> thanks,
>
> greg k-h
