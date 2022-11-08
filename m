Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D4621931
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6A910E3CA;
	Tue,  8 Nov 2022 16:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F7A10E3CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:14:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6B14B81BA6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805FBC433B5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667924075;
 bh=joKDBdRcwU/4G60+U4O7ITiaDkaQ9x0N3nsp6pijk6M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DDI40uxjsBu8d5GUwg1vx30PqkA86UAj9fGTc5LhZDaVQ/2fGEVW+2Q9nemcr8XaO
 eH9rxmJCKBdL4D9BgSplufNrELgExX6pY6R69tLzZJokan0TnOYDfW7a4gfI1SF8qw
 2tnU4RWIQ0Z6L4h8D0KTmC2DgVwy+JxwiPdxaj4k0PzH4zJ/bc624xZWeXn4mhO9AJ
 02NPSG2Q+7Orf9LGuA23DAjfrOPX+rKENBa19+SkTzEPeillMEnRbXNUUKY/wm0GcC
 s/5H6KuLaeqDjR2fL9sp5zw9OcwB+TGdmLbo5v7t8CtyW6S/C09GqRV/DCMOa5slaI
 zvf1055PQ22aw==
Received: by mail-yb1-f178.google.com with SMTP id 129so17893753ybb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 08:14:35 -0800 (PST)
X-Gm-Message-State: ACrzQf38GhvzbBBqzcw9pyHJ4MSTc17WGmPt2+l4FeIDH64+cuh+KhsT
 JnXxnOy/lpv2a/Q5oPQ+9crGysC451vXCnOk+1Y=
X-Google-Smtp-Source: AMsMyM5aMBXulfSSUdeSMwaM++n3fPAtT+56HfhPJnlTX8/ewTelfXYhqcWvq74HSIgCvJ4fd13WQJOLenW7EOMFs6w=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr56017753ybe.642.1667924074309; Tue, 08
 Nov 2022 08:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-3-ogabbay@kernel.org>
 <222554f4-c3b0-8375-2ed6-175d4b2c52cb@linux.intel.com>
In-Reply-To: <222554f4-c3b0-8375-2ed6-175d4b2c52cb@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 8 Nov 2022 18:14:07 +0200
X-Gmail-Original-Message-ID: <CAFCwf10=4i4asCmMP9O-Lk6mvgVt0p-_LWMau5tBaQ20aWn5Ag@mail.gmail.com>
Message-ID: <CAFCwf10=4i4asCmMP9O-Lk6mvgVt0p-_LWMau5tBaQ20aWn5Ag@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] accel: add dedicated minor for accelerator
 devices
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 3:13 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 06/11/2022 21:02, Oded Gabbay wrote:
> > The accelerator devices are exposed to user-space using a dedicated
> > major. In addition, they are represented in /dev with new, dedicated
> > device char names: /dev/accel/accel*. This is done to make sure any
> > user-space software that tries to open a graphic card won't open
> > the accelerator device by mistake.
> >
> > The above implies that the minor numbering should be separated from
> > the rest of the DRM devices. However, to avoid code duplication, we
> > want the drm_minor structure to be able to represent the accelerator
> > device.
> >
> > To achieve this, we add a new drm_minor* to drm_device that represents
> > the accelerator device. This pointer is initialized for drivers that
> > declare they handle compute accelerator, using a new driver feature
> > flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> > driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> > want to expose both graphics and compute device char files should be
> > handled by two drivers that are connected using the auxiliary bus
> > framework.
> >
> > In addition, we define a different IDR to handle the accelerators
> > minors. This is done to make the minor's index be identical to the
> > device index in /dev/. Any access to the IDR is done solely
> > by functions in accel_drv.c, as the IDR is define as static. The
> > DRM core functions call those functions in case they detect the minor's
> > type is DRM_MINOR_ACCEL.
> >
> > We define a separate accel_open function (from drm_open) that the
> > accel drivers should set as their open callback function. Both these
> > functions eventually call the same drm_open_helper(), which had to be
> > changed to be non-static so it can be called from accel_drv.c.
> > accel_open() only partially duplicates drm_open as I removed some code
> > from it that handles legacy devices.
> >
> > To help new drivers, I defined DEFINE_DRM_ACCEL_FOPS macro to easily
> > set the required function operations pointers structure.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> > Changes in v3:
> >   - Remove useless DRM_DEBUG("\n") at accel_stub_open()
> >   - Add function of accel_debugfs_init() as accel_debugfs_root is static
> >     member in drm_accel.c
> >   - Add DRM_ACCEL_FOPS and DEFINE_DRM_ACCEL_FOPS macros
> >   - Replace minor handling from xarray back to idr, as xarray doesn't handle
> >     well exchanging content of a NULL entry to non-NULL. This should be handled
> >     in a different patch that will either fix xarray code or change DRM minor
> >     init flow.
> >   - Make accel_minor_replace() to return void.
> >
> >   drivers/accel/drm_accel.c  | 242 ++++++++++++++++++++++++++++++++++++-
> >   drivers/gpu/drm/drm_file.c |   2 +-
> >   include/drm/drm_accel.h    |  68 ++++++++++-
> >   include/drm/drm_device.h   |   3 +
> >   include/drm/drm_drv.h      |   8 ++
> >   include/drm/drm_file.h     |  21 +++-
> >   6 files changed, 340 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> > index 943d960ddefc..05167c929866 100644
> > --- a/drivers/accel/drm_accel.c
> > +++ b/drivers/accel/drm_accel.c
> > @@ -8,14 +8,25 @@
> >
> >   #include <linux/debugfs.h>
> >   #include <linux/device.h>
> > +#include <linux/xarray.h>
> >
> >   #include <drm/drm_accel.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_file.h>
> >   #include <drm/drm_ioctl.h>
> >   #include <drm/drm_print.h>
> >
> > +static DEFINE_SPINLOCK(accel_minor_lock);
> > +static struct idr accel_minors_idr;
> > +
> >   static struct dentry *accel_debugfs_root;
> >   static struct class *accel_class;
> >
> > +static struct device_type accel_sysfs_device_minor = {
> > +     .name = "accel_minor"
> > +};
> > +
> >   static char *accel_devnode(struct device *dev, umode_t *mode)
> >   {
> >       return kasprintf(GFP_KERNEL, "accel/%s", dev_name(dev));
> > @@ -40,9 +51,235 @@ static void accel_sysfs_destroy(void)
> >       accel_class = NULL;
> >   }
> >
> > +static int accel_name_info(struct seq_file *m, void *data)
> > +{
> > +     struct drm_info_node *node = (struct drm_info_node *) m->private;
> > +     struct drm_minor *minor = node->minor;
> > +     struct drm_device *dev = minor->dev;
> > +     struct drm_master *master;
> > +
> > +     mutex_lock(&dev->master_mutex);
> > +     master = dev->master;
> > +     seq_printf(m, "%s", dev->driver->name);
> > +     if (dev->dev)
> > +             seq_printf(m, " dev=%s", dev_name(dev->dev));
> > +     if (master && master->unique)
> > +             seq_printf(m, " master=%s", master->unique);
>
> Does the all drm_master business apply with accel?
No, it was left by mistake, I'll remove it.

>
> > +     if (dev->unique)
> > +             seq_printf(m, " unique=%s", dev->unique);
> > +     seq_puts(m, "\n");
> > +     mutex_unlock(&dev->master_mutex);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_info_list accel_debugfs_list[] = {
> > +     {"name", accel_name_info, 0}
> > +};
> > +#define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
> > +
> > +/**
> > + * accel_debugfs_init() - Initialize debugfs for accel minor
> > + * @minor: Pointer to the drm_minor instance.
> > + * @minor_id: The minor's id
> > + *
> > + * This function initializes the drm minor's debugfs members and creates
> > + * a root directory for the minor in debugfs. It also creates common files
> > + * for accelerators and calls the driver's debugfs init callback.
> > + */
> > +void accel_debugfs_init(struct drm_minor *minor, int minor_id)
> > +{
> > +     struct drm_device *dev = minor->dev;
> > +     char name[64];
> > +
> > +     INIT_LIST_HEAD(&minor->debugfs_list);
> > +     mutex_init(&minor->debugfs_lock);
> > +     sprintf(name, "%d", minor_id);
> > +     minor->debugfs_root = debugfs_create_dir(name, accel_debugfs_root);
> > +
> > +     drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
> > +                              minor->debugfs_root, minor);
> > +
> > +     if (dev->driver->debugfs_init)
> > +             dev->driver->debugfs_init(minor);
> > +}
> > +
> > +/**
> > + * accel_set_device_instance_params() - Set some device parameters for accel device
> > + * @kdev: Pointer to the device instance.
> > + * @index: The minor's index
> > + *
> > + * This function creates the dev_t of the device using the accel major and
> > + * the device's minor number. In addition, it sets the class and type of the
> > + * device instance to the accel sysfs class and device type, respectively.
> > + */
> > +void accel_set_device_instance_params(struct device *kdev, int index)
> > +{
> > +     kdev->devt = MKDEV(ACCEL_MAJOR, index);
> > +     kdev->class = accel_class;
> > +     kdev->type = &accel_sysfs_device_minor;
> > +}
> > +
> > +/**
> > + * accel_minor_alloc() - Allocates a new accel minor
> > + *
> > + * This function access the accel minors idr and allocates from it
> > + * a new id to represent a new accel minor
> > + *
> > + * Return: A new id on success or error code in case idr_alloc failed
> > + */
> > +int accel_minor_alloc(void)
> > +{
> > +     unsigned long flags;
> > +     int r;
> > +
> > +     spin_lock_irqsave(&accel_minor_lock, flags);
> > +     r = idr_alloc(&accel_minors_idr, NULL, 0, ACCEL_MAX_MINORS, GFP_NOWAIT);
> > +     spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +
> > +     return r;
> > +}
> > +
> > +/**
> > + * accel_minor_remove() - Remove an accel minor
> > + * @index: The minor id to remove.
> > + *
> > + * This function access the accel minors idr and removes from
> > + * it the member with the id that is passed to this function.
> > + */
> > +void accel_minor_remove(int index)
> > +{
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&accel_minor_lock, flags);
> > +     idr_remove(&accel_minors_idr, index);
> > +     spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +}
> > +
> > +/**
> > + * accel_minor_replace() - Replace minor pointer in accel minors idr.
> > + * @minor: Pointer to the new minor.
> > + * @index: The minor id to replace.
> > + *
> > + * This function access the accel minors idr structure and replaces the pointer
> > + * that is associated with an existing id. Because the minor pointer can be
> > + * NULL, we need to explicitly pass the index.
> > + *
> > + * Return: 0 for success, negative value for error
> > + */
> > +void accel_minor_replace(struct drm_minor *minor, int index)
> > +{
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&accel_minor_lock, flags);
> > +     idr_replace(&accel_minors_idr, minor, index);
> > +     spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +}
> > +
> > +/*
> > + * Looks up the given minor-ID and returns the respective DRM-minor object. The
> > + * refence-count of the underlying device is increased so you must release this
> > + * object with accel_minor_release().
> > + *
> > + * The object can be only a drm_minor that represents an accel device.
> > + *
> > + * As long as you hold this minor, it is guaranteed that the object and the
> > + * minor->dev pointer will stay valid! However, the device may get unplugged and
> > + * unregistered while you hold the minor.
> > + */
> > +static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
> > +{
> > +     struct drm_minor *minor;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&accel_minor_lock, flags);
> > +     minor = idr_find(&accel_minors_idr, minor_id);
> > +     if (minor)
> > +             drm_dev_get(minor->dev);
> > +     spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +
> > +     if (!minor) {
> > +             return ERR_PTR(-ENODEV);
> > +     } else if (drm_dev_is_unplugged(minor->dev)) {
> > +             drm_dev_put(minor->dev);
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     return minor;
> > +}
> > +
> > +static void accel_minor_release(struct drm_minor *minor)
> > +{
> > +     drm_dev_put(minor->dev);
> > +}
> > +
> > +/**
> > + * accel_open - open method for ACCEL file
> > + * @inode: device inode
> > + * @filp: file pointer.
> > + *
> > + * This function must be used by drivers as their &file_operations.open method.
> > + * It looks up the correct ACCEL device and instantiates all the per-file
> > + * resources for it. It also calls the &drm_driver.open driver callback.
> > + *
> > + * Return: 0 on success or negative errno value on failure.
> > + */
> > +int accel_open(struct inode *inode, struct file *filp)
> > +{
> > +     struct drm_device *dev;
> > +     struct drm_minor *minor;
> > +     int retcode;
> > +
> > +     minor = accel_minor_acquire(iminor(inode));
> > +     if (IS_ERR(minor))
> > +             return PTR_ERR(minor);
> > +
> > +     dev = minor->dev;
> > +
> > +     atomic_fetch_inc(&dev->open_count);
>
> Why fetch and could you even only increment once everything worked (to
> avoid having to decrement on the error unwind)?
It was copied from drm_open. I tried to not do any changes that
weren't mandatory to make it work, to minimize the chance of me
breaking things.
I guess I can do what you suggested. From the drm code, doesn't seem
moving it will cause any harm.
>
> > +
> > +     /* share address_space across all char-devs of a single device */
> > +     filp->f_mapping = dev->anon_inode->i_mapping;
> > +
> > +     retcode = drm_open_helper(filp, minor);
> > +     if (retcode)
> > +             goto err_undo;
> > +
> > +     return 0;
> > +
> > +err_undo:
> > +     atomic_dec(&dev->open_count);
> > +     accel_minor_release(minor);
> > +     return retcode;
> > +}
> > +EXPORT_SYMBOL_GPL(accel_open);
> > +
> >   static int accel_stub_open(struct inode *inode, struct file *filp)
> >   {
> > -     return -EOPNOTSUPP;
> > +     const struct file_operations *new_fops;
> > +     struct drm_minor *minor;
> > +     int err;
> > +
> > +     minor = accel_minor_acquire(iminor(inode));
> > +     if (IS_ERR(minor))
> > +             return PTR_ERR(minor);
> > +
> > +     new_fops = fops_get(minor->dev->driver->fops);
> > +     if (!new_fops) {
> > +             err = -ENODEV;
> > +             goto out;
> > +     }
> > +
> > +     replace_fops(filp, new_fops);
> > +     if (filp->f_op->open)
> > +             err = filp->f_op->open(inode, filp);
> > +     else
> > +             err = 0;
> > +
> > +out:
> > +     accel_minor_release(minor);
> > +
> > +     return err;
> >   }
> >
> >   static const struct file_operations accel_stub_fops = {
> > @@ -56,12 +293,15 @@ void accel_core_exit(void)
> >       unregister_chrdev(ACCEL_MAJOR, "accel");
> >       debugfs_remove(accel_debugfs_root);
> >       accel_sysfs_destroy();
> > +     idr_destroy(&accel_minors_idr);
> >   }
> >
> >   int __init accel_core_init(void)
> >   {
> >       int ret;
> >
> > +     idr_init(&accel_minors_idr);
> > +
> >       ret = accel_sysfs_init();
> >       if (ret < 0) {
> >               DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index a8b4d918e9a3..64b4a3a87fbb 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -326,7 +326,7 @@ static int drm_cpu_valid(void)
> >    * Creates and initializes a drm_file structure for the file private data in \p
> >    * filp and add it into the double linked list in \p dev.
> >    */
> > -static int drm_open_helper(struct file *filp, struct drm_minor *minor)
> > +int drm_open_helper(struct file *filp, struct drm_minor *minor)
> >   {
> >       struct drm_device *dev = minor->dev;
> >       struct drm_file *priv;
> > diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> > index 31b42d3d6a15..b0c20367faad 100644
> > --- a/include/drm/drm_accel.h
> > +++ b/include/drm/drm_accel.h
> > @@ -8,12 +8,56 @@
> >   #ifndef DRM_ACCEL_H_
> >   #define DRM_ACCEL_H_
> >
> > -#define ACCEL_MAJOR     261
> > +#include <drm/drm_file.h>
> > +
> > +#define ACCEL_MAJOR          261
> > +#define ACCEL_MAX_MINORS     256
> > +
> > +/**
> > + * DRM_ACCEL_FOPS - Default drm accelerators file operations
> > + *
> > + * This macro provides a shorthand for setting the accelerator file ops in the
> > + * &file_operations structure.  If all you need are the default ops, use
> > + * DEFINE_DRM_ACCEL_FOPS instead.
> > + */
> > +#define DRM_ACCEL_FOPS \
> > +     .open           = accel_open,\
> > +     .release        = drm_release,\
> > +     .unlocked_ioctl = drm_ioctl,\
> > +     .compat_ioctl   = drm_compat_ioctl,\
> > +     .poll           = drm_poll,\
> > +     .read           = drm_read,\
> > +     .llseek         = noop_llseek
> > +
> > +/**
> > + * DEFINE_DRM_ACCEL_FOPS() - macro to generate file operations for accelerators drivers
> > + * @name: name for the generated structure
> > + *
> > + * This macro autogenerates a suitable &struct file_operations for accelerators based
> > + * drivers, which can be assigned to &drm_driver.fops. Note that this structure
> > + * cannot be shared between drivers, because it contains a reference to the
> > + * current module using THIS_MODULE.
> > + *
> > + * Note that the declaration is already marked as static - if you need a
> > + * non-static version of this you're probably doing it wrong and will break the
> > + * THIS_MODULE reference by accident.
> > + */
> > +#define DEFINE_DRM_ACCEL_FOPS(name) \
> > +     static const struct file_operations name = {\
> > +             .owner          = THIS_MODULE,\
> > +             DRM_ACCEL_FOPS,\
> > +     }
> >
> >   #if IS_ENABLED(CONFIG_DRM_ACCEL)
> >
> >   void accel_core_exit(void);
> >   int accel_core_init(void);
> > +void accel_minor_remove(int index);
> > +int accel_minor_alloc(void);
> > +void accel_minor_replace(struct drm_minor *minor, int index);
> > +void accel_set_device_instance_params(struct device *kdev, int index);
> > +int accel_open(struct inode *inode, struct file *filp);
> > +void accel_debugfs_init(struct drm_minor *minor, int minor_id);
> >
> >   #else
> >
> > @@ -23,9 +67,31 @@ static inline void accel_core_exit(void)
> >
> >   static inline int __init accel_core_init(void)
> >   {
> > +     /* Return 0 to allow drm_core_init to complete successfully */
> >       return 0;
> >   }
> >
> > +static inline void accel_minor_remove(int index)
> > +{
> > +}
> > +
> > +static inline int accel_minor_alloc(void)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline void accel_minor_replace(struct drm_minor *minor, int index)
> > +{
> > +}
> > +
> > +static inline void accel_set_device_instance_params(struct device *kdev, int index)
> > +{
> > +}
> > +
> > +static inline void accel_debugfs_init(struct drm_minor *minor, int minor_id)
> > +{
> > +
> > +
> >   #endif /* IS_ENABLED(CONFIG_DRM_ACCEL) */
> >
> >   #endif /* DRM_ACCEL_H_ */
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 9923c7a6885e..933ce2048e20 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -93,6 +93,9 @@ struct drm_device {
> >       /** @render: Render node */
> >       struct drm_minor *render;
> >
> > +     /** @accel: Compute Acceleration node */
> > +     struct drm_minor *accel;
> > +
> >       /**
> >        * @registered:
> >        *
> > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > index f6159acb8856..706e68ca5116 100644
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -94,6 +94,14 @@ enum drm_driver_feature {
> >        * synchronization of command submission.
> >        */
> >       DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
> > +     /**
> > +      * @DRIVER_COMPUTE_ACCEL:
> > +      *
> > +      * Driver supports compute acceleration devices. This flag is mutually exclusive with
> > +      * @DRIVER_RENDER and @DRIVER_MODESET. Devices that support both graphics and compute
> > +      * acceleration should be handled by two drivers that are connected using auxiliry bus.
> > +      */
> > +     DRIVER_COMPUTE_ACCEL            = BIT(7),
> >
> >       /* IMPORTANT: Below are all the legacy flags, add new ones above. */
> >
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index d780fd151789..0d1f853092ab 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -51,11 +51,15 @@ struct file;
> >
> >   /* Note that the order of this enum is ABI (it determines
> >    * /dev/dri/renderD* numbers).
> > + *
> > + * Setting DRM_MINOR_ACCEL to 32 gives enough space for more drm minors to
> > + * be implemented before we hit any future
> >    */
> >   enum drm_minor_type {
> >       DRM_MINOR_PRIMARY,
> >       DRM_MINOR_CONTROL,
> >       DRM_MINOR_RENDER,
> > +     DRM_MINOR_ACCEL = 32,
>
> Didn't patch 1/3 say it's a standalone character device major? Are there
> two ways to open the same thing?
>
We do use a new, dedicated major number. But one of the main points
that was agreed was we should leverage the drm code.
And from how I look at things, the best way to do that was to decide
that the accel device is just a new drm minor type.
This way, accel code will seamlessly integrate into the current drm core code.

> >   };
> >
> >   /**
> > @@ -70,7 +74,7 @@ enum drm_minor_type {
> >   struct drm_minor {
> >       /* private: */
> >       int index;                      /* Minor device number */
> > -     int type;                       /* Control or render */
> > +     int type;                       /* Control or render or accel */
>
> Could this be self documenting if type was enum drm_minor_type?
Again, I preferred to change as little as possible existing code in
drm, to make sure I don't do any regressions in this basic patch-set.
I really want to keep drm changes to an absolute minimum and any such
change should come in a separate patch.

Thanks,
Oded
>
> >       struct device *kdev;            /* Linux device */
> >       struct drm_device *dev;
> >
> > @@ -397,7 +401,22 @@ static inline bool drm_is_render_client(const struct drm_file *file_priv)
> >       return file_priv->minor->type == DRM_MINOR_RENDER;
> >   }
> >
> > +/**
> > + * drm_is_accel_client - is this an open file of the compute acceleration node
> > + * @file_priv: DRM file
> > + *
> > + * Returns true if this is an open file of the compute acceleration node, i.e.
> > + * &drm_file.minor of @file_priv is a accel minor.
> > + *
> > + * See also the :ref:`section on accel nodes <drm_accel_node>`.
> > + */
> > +static inline bool drm_is_accel_client(const struct drm_file *file_priv)
> > +{
> > +     return file_priv->minor->type == DRM_MINOR_ACCEL;
> > +}
> > +
> >   int drm_open(struct inode *inode, struct file *filp);
> > +int drm_open_helper(struct file *filp, struct drm_minor *minor);
> >   ssize_t drm_read(struct file *filp, char __user *buffer,
> >                size_t count, loff_t *offset);
> >   int drm_release(struct inode *inode, struct file *filp);
> > --
> > 2.25.1
> >
>
> Regards,
>
> Tvrtko
