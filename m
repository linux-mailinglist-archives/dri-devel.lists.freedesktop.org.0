Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B7633ACB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 12:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79310E3C6;
	Tue, 22 Nov 2022 11:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB2310E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9JZdqk1OkpnE+3W0SvnflyFye5FL3u60bamjx34/b78=; b=LUX2HKqVNknim6KiolqvbXkiuY
 BvCl1E+G0VASEycpMAoidS03bREnJWwdX08d0UpYBBdVGcQJ6X56MpjX7E2TG+6n316X6zjbRspnP
 m6XE9+42gI4faYu59uOmc62Vr9VNar1mv9IIW59BCZgy14DEHEHC5bTyCBDnoPzcoRbjnPo/2uwbc
 nHtkhAl9Nakf6X9aJNwZi82UGvJS542J8X9p7cCDyqNYFHAIPFEmNuxycDE4cg45aQrxFFRQjPzRs
 4dS5NWo6TCE51Z2799DsAoDPI+kwTttWoRW6zym4hKsHkt+3DstJA0C6PHA8ES8Y78127NHeRIk61
 Ii59ihvg==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxRBH-006rnX-5W; Tue, 22 Nov 2022 12:11:11 +0100
Date: Tue, 22 Nov 2022 10:11:03 -0100
From: Melissa Wen <mwen@igalia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v4 3/4] drm: initialize accel framework
Message-ID: <20221122111103.h37v6n7uw44tqmdl@mail.igalia.com>
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <20221119204435.97113-4-ogabbay@kernel.org>
 <20221122105552.edse4v3zb5q23e3k@mail.igalia.com>
 <CAFCwf128w3yAJVKAL+YrqLLSC6JGOWoEqqNipigcWruNBo30oQ@mail.gmail.com>
 <CAFCwf11YaE5Euh0_zebbXYQZUuHb7K85b28XBdS5LLEqxLeNWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x3d3yt7bb3opu5vr"
Content-Disposition: inline
In-Reply-To: <CAFCwf11YaE5Euh0_zebbXYQZUuHb7K85b28XBdS5LLEqxLeNWg@mail.gmail.com>
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
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x3d3yt7bb3opu5vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

11/22, Oded Gabbay wrote:
> On Tue, Nov 22, 2022 at 12:59 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > On Tue, Nov 22, 2022 at 12:56 PM Melissa Wen <mwen@igalia.com> wrote:
> > >
> > > On 11/19, Oded Gabbay wrote:
> > > > Now that we have the accel framework code ready, let's call the
> > > > accel functions from all the appropriate places. These places are t=
he
> > > > drm module init/exit functions, and all the drm_minor handling
> > > > functions.
> > >
> > > Hi Oded,
> > >
> > > The proposal overall LGTM, but I didn't manage to compile the kernel
> > > with your patch series when DRM is enabled but accel support doesn't.
> > > Multiple missing link errors...
> > >
> > > Am I missing something? Can you take a look at it from this patch 3/4?
> > >
> > > Thanks,
> > >
> > > Melissa
> > Looking at it now, thanks for letting me know.
> > Oded
> Found the issue, missing } at end of accel_debugfs_init() in
> drm_accel.h. Only compiles when accel support isn't compiled in.
> I'll fix it before sending the PR to Dave.
> Much appreciated :)
> Oded

Oh, great! Just checked here and everything is fine now.
With that, you can add my r-b for the entire series too

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks for working on it,

Melissa

>=20
> >
> > > >
> > > > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_drv.c   | 102 ++++++++++++++++++++++++++------=
----
> > > >  drivers/gpu/drm/drm_sysfs.c |  24 ++++++---
> > > >  2 files changed, 91 insertions(+), 35 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > > index 8214a0b1ab7f..1aec019f6389 100644
> > > > --- a/drivers/gpu/drm/drm_drv.c
> > > > +++ b/drivers/gpu/drm/drm_drv.c
> > > > @@ -35,6 +35,7 @@
> > > >  #include <linux/slab.h>
> > > >  #include <linux/srcu.h>
> > > >
> > > > +#include <drm/drm_accel.h>
> > > >  #include <drm/drm_cache.h>
> > > >  #include <drm/drm_client.h>
> > > >  #include <drm/drm_color_mgmt.h>
> > > > @@ -90,6 +91,8 @@ static struct drm_minor **drm_minor_get_slot(stru=
ct drm_device *dev,
> > > >               return &dev->primary;
> > > >       case DRM_MINOR_RENDER:
> > > >               return &dev->render;
> > > > +     case DRM_MINOR_ACCEL:
> > > > +             return &dev->accel;
> > > >       default:
> > > >               BUG();
> > > >       }
> > > > @@ -104,9 +107,13 @@ static void drm_minor_alloc_release(struct drm=
_device *dev, void *data)
> > > >
> > > >       put_device(minor->kdev);
> > > >
> > > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > > -     idr_remove(&drm_minors_idr, minor->index);
> > > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     if (minor->type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             accel_minor_remove(minor->index);
> > > > +     } else {
> > > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > > +             idr_remove(&drm_minors_idr, minor->index);
> > > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     }
> > > >  }
> > > >
> > > >  static int drm_minor_alloc(struct drm_device *dev, unsigned int ty=
pe)
> > > > @@ -123,13 +130,17 @@ static int drm_minor_alloc(struct drm_device =
*dev, unsigned int type)
> > > >       minor->dev =3D dev;
> > > >
> > > >       idr_preload(GFP_KERNEL);
> > > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > > -     r =3D idr_alloc(&drm_minors_idr,
> > > > -                   NULL,
> > > > -                   64 * type,
> > > > -                   64 * (type + 1),
> > > > -                   GFP_NOWAIT);
> > > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     if (type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             r =3D accel_minor_alloc();
> > > > +     } else {
> > > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > > +             r =3D idr_alloc(&drm_minors_idr,
> > > > +                     NULL,
> > > > +                     64 * type,
> > > > +                     64 * (type + 1),
> > > > +                     GFP_NOWAIT);
> > > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     }
> > > >       idr_preload_end();
> > > >
> > > >       if (r < 0)
> > > > @@ -161,10 +172,14 @@ static int drm_minor_register(struct drm_devi=
ce *dev, unsigned int type)
> > > >       if (!minor)
> > > >               return 0;
> > > >
> > > > -     ret =3D drm_debugfs_init(minor, minor->index, drm_debugfs_roo=
t);
> > > > -     if (ret) {
> > > > -             DRM_ERROR("DRM: Failed to initialize /sys/kernel/debu=
g/dri.\n");
> > > > -             goto err_debugfs;
> > > > +     if (minor->type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             accel_debugfs_init(minor, minor->index);
> > > > +     } else {
> > > > +             ret =3D drm_debugfs_init(minor, minor->index, drm_deb=
ugfs_root);
> > > > +             if (ret) {
> > > > +                     DRM_ERROR("DRM: Failed to initialize /sys/ker=
nel/debug/dri.\n");
> > > > +                     goto err_debugfs;
> > > > +             }
> > > >       }
> > > >
> > > >       ret =3D device_add(minor->kdev);
> > > > @@ -172,9 +187,13 @@ static int drm_minor_register(struct drm_devic=
e *dev, unsigned int type)
> > > >               goto err_debugfs;
> > > >
> > > >       /* replace NULL with @minor so lookups will succeed from now =
on */
> > > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > > -     idr_replace(&drm_minors_idr, minor, minor->index);
> > > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     if (minor->type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             accel_minor_replace(minor, minor->index);
> > > > +     } else {
> > > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > > +             idr_replace(&drm_minors_idr, minor, minor->index);
> > > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     }
> > > >
> > > >       DRM_DEBUG("new minor registered %d\n", minor->index);
> > > >       return 0;
> > > > @@ -194,9 +213,13 @@ static void drm_minor_unregister(struct drm_de=
vice *dev, unsigned int type)
> > > >               return;
> > > >
> > > >       /* replace @minor with NULL so lookups will fail from now on =
*/
> > > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > > -     idr_replace(&drm_minors_idr, NULL, minor->index);
> > > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     if (minor->type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             accel_minor_replace(NULL, minor->index);
> > > > +     } else {
> > > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > > +             idr_replace(&drm_minors_idr, NULL, minor->index);
> > > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > > +     }
> > > >
> > > >       device_del(minor->kdev);
> > > >       dev_set_drvdata(minor->kdev, NULL); /* safety belt */
> > > > @@ -603,6 +626,14 @@ static int drm_dev_init(struct drm_device *dev,
> > > >       /* no per-device feature limits by default */
> > > >       dev->driver_features =3D ~0u;
> > > >
> > > > +     if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> > > > +                             (drm_core_check_feature(dev, DRIVER_R=
ENDER) ||
> > > > +                             drm_core_check_feature(dev, DRIVER_MO=
DESET))) {
> > > > +
> > > > +             DRM_ERROR("DRM driver can't be both a compute acceler=
ation and graphics driver\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > >       drm_legacy_init_members(dev);
> > > >       INIT_LIST_HEAD(&dev->filelist);
> > > >       INIT_LIST_HEAD(&dev->filelist_internal);
> > > > @@ -628,15 +659,21 @@ static int drm_dev_init(struct drm_device *de=
v,
> > > >
> > > >       dev->anon_inode =3D inode;
> > > >
> > > > -     if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> > > > -             ret =3D drm_minor_alloc(dev, DRM_MINOR_RENDER);
> > > > +     if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL)) {
> > > > +             ret =3D drm_minor_alloc(dev, DRM_MINOR_ACCEL);
> > > >               if (ret)
> > > >                       goto err;
> > > > -     }
> > > > +     } else {
> > > > +             if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> > > > +                     ret =3D drm_minor_alloc(dev, DRM_MINOR_RENDER=
);
> > > > +                     if (ret)
> > > > +                             goto err;
> > > > +             }
> > > >
> > > > -     ret =3D drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
> > > > -     if (ret)
> > > > -             goto err;
> > > > +             ret =3D drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
> > > > +             if (ret)
> > > > +                     goto err;
> > > > +     }
> > > >
> > > >       ret =3D drm_legacy_create_map_hash(dev);
> > > >       if (ret)
> > > > @@ -883,6 +920,10 @@ int drm_dev_register(struct drm_device *dev, u=
nsigned long flags)
> > > >       if (ret)
> > > >               goto err_minors;
> > > >
> > > > +     ret =3D drm_minor_register(dev, DRM_MINOR_ACCEL);
> > > > +     if (ret)
> > > > +             goto err_minors;
> > > > +
> > > >       ret =3D create_compat_control_link(dev);
> > > >       if (ret)
> > > >               goto err_minors;
> > > > @@ -902,12 +943,13 @@ int drm_dev_register(struct drm_device *dev, =
unsigned long flags)
> > > >                driver->name, driver->major, driver->minor,
> > > >                driver->patchlevel, driver->date,
> > > >                dev->dev ? dev_name(dev->dev) : "virtual device",
> > > > -              dev->primary->index);
> > > > +              dev->primary ? dev->primary->index : dev->accel->ind=
ex);
> > > >
> > > >       goto out_unlock;
> > > >
> > > >  err_minors:
> > > >       remove_compat_control_link(dev);
> > > > +     drm_minor_unregister(dev, DRM_MINOR_ACCEL);
> > > >       drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
> > > >       drm_minor_unregister(dev, DRM_MINOR_RENDER);
> > > >  out_unlock:
> > > > @@ -950,6 +992,7 @@ void drm_dev_unregister(struct drm_device *dev)
> > > >       drm_legacy_rmmaps(dev);
> > > >
> > > >       remove_compat_control_link(dev);
> > > > +     drm_minor_unregister(dev, DRM_MINOR_ACCEL);
> > > >       drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
> > > >       drm_minor_unregister(dev, DRM_MINOR_RENDER);
> > > >  }
> > > > @@ -1034,6 +1077,7 @@ static const struct file_operations drm_stub_=
fops =3D {
> > > >  static void drm_core_exit(void)
> > > >  {
> > > >       drm_privacy_screen_lookup_exit();
> > > > +     accel_core_exit();
> > > >       unregister_chrdev(DRM_MAJOR, "drm");
> > > >       debugfs_remove(drm_debugfs_root);
> > > >       drm_sysfs_destroy();
> > > > @@ -1061,6 +1105,10 @@ static int __init drm_core_init(void)
> > > >       if (ret < 0)
> > > >               goto error;
> > > >
> > > > +     ret =3D accel_core_init();
> > > > +     if (ret < 0)
> > > > +             goto error;
> > > > +
> > > >       drm_privacy_screen_lookup_init();
> > > >
> > > >       drm_core_init_complete =3D true;
> > > > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysf=
s.c
> > > > index 430e00b16eec..b8da978d85bb 100644
> > > > --- a/drivers/gpu/drm/drm_sysfs.c
> > > > +++ b/drivers/gpu/drm/drm_sysfs.c
> > > > @@ -19,6 +19,7 @@
> > > >  #include <linux/kdev_t.h>
> > > >  #include <linux/slab.h>
> > > >
> > > > +#include <drm/drm_accel.h>
> > > >  #include <drm/drm_connector.h>
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_file.h>
> > > > @@ -471,19 +472,26 @@ struct device *drm_sysfs_minor_alloc(struct d=
rm_minor *minor)
> > > >       struct device *kdev;
> > > >       int r;
> > > >
> > > > -     if (minor->type =3D=3D DRM_MINOR_RENDER)
> > > > -             minor_str =3D "renderD%d";
> > > > -     else
> > > > -             minor_str =3D "card%d";
> > > > -
> > > >       kdev =3D kzalloc(sizeof(*kdev), GFP_KERNEL);
> > > >       if (!kdev)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > >       device_initialize(kdev);
> > > > -     kdev->devt =3D MKDEV(DRM_MAJOR, minor->index);
> > > > -     kdev->class =3D drm_class;
> > > > -     kdev->type =3D &drm_sysfs_device_minor;
> > > > +
> > > > +     if (minor->type =3D=3D DRM_MINOR_ACCEL) {
> > > > +             minor_str =3D "accel%d";
> > > > +             accel_set_device_instance_params(kdev, minor->index);
> > > > +     } else {
> > > > +             if (minor->type =3D=3D DRM_MINOR_RENDER)
> > > > +                     minor_str =3D "renderD%d";
> > > > +             else
> > > > +                     minor_str =3D "card%d";
> > > > +
> > > > +             kdev->devt =3D MKDEV(DRM_MAJOR, minor->index);
> > > > +             kdev->class =3D drm_class;
> > > > +             kdev->type =3D &drm_sysfs_device_minor;
> > > > +     }
> > > > +
> > > >       kdev->parent =3D minor->dev->dev;
> > > >       kdev->release =3D drm_sysfs_release;
> > > >       dev_set_drvdata(kdev, minor);
> > > > --
> > > > 2.25.1
> > > >

--x3d3yt7bb3opu5vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmN8rjEACgkQwqF3j0dL
ehwWmg//VFJxGqBipB8Ez+XYyVCP+EzfZen6lRHEMXByxy5Y881/M3Gido4aAImv
moFKRa0FZaMhlatjcBNQF2p4K1Ei6T7ITXyeDjS6HNJU+Ftme8C2KR29M5EuYZtH
pTKoL2PLzYIEym+7hJmJ8+SiWBDyW2da0MQCV7+KamQwSwK0v3B9kK/mRQYjJvPO
wkkfgnMoPcW0yjcHBtp4FwXpvwk9FJiz7wAUedncMa4+jjeH3YDlVE3/wvXO7ZD2
XAgiTsjblnjFkVhEGvf9A5MDq+DIiQFw3doljAlyyxORaVQti3bkJEWI/T4Mp9ZT
aqtP9rYA3qVeIR1YOnMMp8TPSgoxtjFhvPhNRdeJWse1mnJ7gLfHOUn2ctcRr91W
XudgW4V2LbLNZSIoCnWSaNe0dHYRw2yUi/0vM2dGRrtmzn/coeyDOWM0GAl+N0A2
4t95VQlSgSTiXX+ZOBUGyy9UxVzDShSxf3GMwmOsnPhtq0whG5fB1ovK+IU6eewm
uzEa7F6OF2UAiWu4f47OQHicHVJKHmz4Gl9mTMoBRNpgYaC1KgN+QSN4PbI9536n
C4Vm7hrARRTeS09RHqQJQKqRFKgOogEsdV8Rcc229lFdBTO5wUSpWnoYlJgh3QfD
C6UJsTRKSYYrTd3m41nrZqdMHYMTpyaCFmz51LrJs2RwWfaws2I=
=f8JT
-----END PGP SIGNATURE-----

--x3d3yt7bb3opu5vr--
