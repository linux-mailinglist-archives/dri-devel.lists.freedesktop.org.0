Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E6624ABA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 20:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F49910E00B;
	Thu, 10 Nov 2022 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2BA10E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 19:33:24 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id g26so862210vkm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1mjzNlLKV00wAejlrGpYpWx+GoLAczT/64NECIMUIDM=;
 b=aoEt5ZS2hmamkEEdznG0JW3rCaz4o/KQrYYJiscgH5zARbhvzCtOKgggYYLyYfADY3
 KgA+n7l4CeRNWu8/zdTjBK3vfyhApUmRfCw7dJTlPS5lZliBWLkUyTvAKVbc28DubugT
 CQA7IpuLlCH8di9kT8DQH+5Sy0hnufM9UkNRYsrab7dn0odd4VV4udddgG8OyvrrNwUq
 3Nd5qLhc36eC2B/BCkhFaNOj6aesEsoxvD1GaowOt3w2xctRSJnsNTnI1sFZlxjLzww0
 t0Ac8vqyeW83xzSrUY67X1rhQad9QS30kndypfHAq81ZDDK004oiXRrSuRfZ7Qzax6MV
 U9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mjzNlLKV00wAejlrGpYpWx+GoLAczT/64NECIMUIDM=;
 b=30XNWKGRr9PESWu+gfkl8d7YAE86kG7ozGglwq16DbVOWiAvlzBDNDjObOtGIt8mbI
 8JhT7D8oI16PGbNuW01SnyAlyMvF3c91vjzmSROY+GP6MGXP0TFVqlZ4AJcoiuHEVSsF
 se1+i4bz+eY1Ij7infWBa5aqoIU9DksCqHFX+ivBhP/TbdN9sgcvbBhoOVaoumag+d8u
 SJIJHAFofttn+EJW9e9E24PTBNgL59SExCScAAO8Xq+jHs/ZCDD4bSlWseGtKksU0iLc
 hYuQHJQPMeazy6My1KXUj1RA28vtKsUoBuH0zyJd81a1BoWRc3XzwAnJ6T0MP888AvW8
 Dg6Q==
X-Gm-Message-State: ACrzQf308CMP1x9IzhDx0qzCkN9PPYZK/UpZaMQCLCEMPqhk6UFIW/P+
 s5qhqELfa7wlbjKNzQzO/DFb7kwHHkyc0MJZM+YC1w==
X-Google-Smtp-Source: AMsMyM4+8ZvhzaWbwPXyT3gF81QLwL07c00xUQCWco8DBFg3LZsDPg1u5xljP6hGLEn4NA997N1oILhhjzSL+yqFoo4=
X-Received: by 2002:a1f:19d6:0:b0:3b8:7561:c90d with SMTP id
 205-20020a1f19d6000000b003b87561c90dmr13551483vkz.32.1668108803341; Thu, 10
 Nov 2022 11:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20221108185004.2263578-1-wonchung@google.com>
 <Y2uU9YUZYqbL4uB7@phenom.ffwll.local>
In-Reply-To: <Y2uU9YUZYqbL4uB7@phenom.ffwll.local>
From: Won Chung <wonchung@google.com>
Date: Thu, 10 Nov 2022 11:33:11 -0800
Message-ID: <CAOvb9yh9e0ue+=gtsy1tq306vdyRfKwmmXQ9WGRjeMDnM2XjQw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
To: Won Chung <wonchung@google.com>, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, jani.nikula@linux.intel.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you very much for a review.

On Wed, Nov 9, 2022 at 3:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Nov 08, 2022 at 06:50:04PM +0000, Won Chung wrote:
> > Create a symlink pointing to USB Type-C connector for DRM connectors
> > when they are created. The link will be created only if the firmware is
> > able to describe the connection beween the two connectors.
> >
> > Currently, even if a display uses a USB Type-C port, there is no way for
> > the userspace to find which port is used for which display. With the
> > symlink, display information would be accessible from Type-C connectors
> > and port information would be accessible from DRM connectors.
> > Associating the two subsystems, userspace would have potential to expose
> > and utilize more complex information, such as bandwidth used for a
> > specific USB Type-C port.
> >
> > Signed-off-by: Won Chung <wonchung@google.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > Changes from v3:
> > - Append to the commit message on why this patch is needed
> >
> > Changes from v2:
> > - Resend the patch to dri-devel list
> >
> > Changes from v1:
> > - Fix multiple lines to single line
>
> We seem to be spinning wheels a bit here (or at least I'm missing a lot of
> important information from this series alone) with already at v4 but the
> fundamentals not answered:
>
> - where's the usb side of this, and anything we need to do in drivers?
>   This should all be one series, or if that's too big, then a link in the
>   cover letter for where to find all the other pieces

We already have a framework in typec port-mapper.c where it goes
through component devices and runs the bind functions for those with
matching _PLD (physical location of device).
https://elixir.bootlin.com/linux/v5.18.1/source/drivers/usb/typec/port-mapper.c

Currently, USB ports and USB4 ports are added as components to create
a symlink with Type C connector.
USB: https://lore.kernel.org/all/20211223082349.45616-1-heikki.krogerus@linux.intel.com/
USB4: https://lore.kernel.org/all/20220418175932.1809770-3-wonchung@google.com/

Since these are already submitted, do you think it would be a good
idea to add the links in the commit message?


>
> - since I'm guessing this is for cros, will this also work on standard
>   acpi x86 that are built for windows? arm with dt? Might be answered with
>   the full picture

Yes this is for cros, but it should work on any ACPI x86 as long as
_PLD field for Type C connectors and DRM connectors are correctly
added to the firmware.

Since _PLD is ACPI specific, we do not have ARM with DT supported at the moment.
In the future, if we find something similar to _PLD in DT, I think we
can also use that in typec port-mapper for component matching.

Heikki@ Can you correct me if I am incorrect or missing something?


>
> - you say this helps userspace, but how? Best way here is to just point at
>   the userspace change set that makes use of this link, code explains
>   concepts much more precisely than lots of words, and it's also easier to
>   review for corner cases that might be missed. That link also needs to be
>   in the commit message/cover letter somewhere, so people can find it.

I do not have working code in the userspace yet since there is no
symlink created between Type C connector and DRM connector at the
moment.
If this patch is to go through, ChromeOS will parse the symlink in DRM
to find which Type C port got displays connected.

First use case is metrics collection.
We would like to know which port at which location is most preferred
to be used for displays.
We also want to see how many users charge the system on the same Type
C port as displays.
To answer these types of questions, we need to know which specific
display uses which specific Type C connector.

Second use case is to get a better idea on USB-C pin assignments.
When a Type C port is in DP alt mode, there are some options on pin
assignments, whether to prioritize DP bandwidth vs USB Superspeed.
If we can find whether a display is actually being used by a Type C
port, we can check the cases where the port prioritizes DP bandwidth
over USB Superspeed while there is no display actually connected.

This symlink can also be useful in the future with USB4 that makes use
of DP tunnelling.

Benson@ Can you add on to the use cases above if something is missing?

I can try to create mock patches in ChromeOS to give an idea how
userspace can utilize this symlink.
Would this also work?
If it sounds okay, I can work on the userspace mock patches and resend
v5 with the links added to the commit message.


>
> In principle nothing against the idea, seems reasonable (but I'm also not
> sure what exact problem it's solving) - but all the detail work to make
> this work than an RFP to kick of some discussion is missing. And I think
> it's not even enough to really kick off a discussion as-is since there's
> really no user of this at all (in-kernel or userspace) linked.
>
> Cheers, Daniel
>
> >
> >
> >  drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index 430e00b16eec..6a9904fa9186 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -11,12 +11,14 @@
> >   */
> >
> >  #include <linux/acpi.h>
> > +#include <linux/component.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/export.h>
> >  #include <linux/gfp.h>
> >  #include <linux/i2c.h>
> >  #include <linux/kdev_t.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >
> >  #include <drm/drm_connector.h>
> > @@ -95,6 +97,34 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
> >       return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> >  }
> >
> > +static int typec_connector_bind(struct device *dev,
> > +     struct device *typec_connector, void *data)
> > +{
> > +     int ret;
> > +
> > +     ret = sysfs_create_link(&dev->kobj, &typec_connector->kobj, "typec_connector");
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = sysfs_create_link(&typec_connector->kobj, &dev->kobj, "drm_connector");
> > +     if (ret)
> > +             sysfs_remove_link(&dev->kobj, "typec_connector");
> > +
> > +     return ret;
> > +}
> > +
> > +static void typec_connector_unbind(struct device *dev,
> > +     struct device *typec_connector, void *data)
> > +{
> > +     sysfs_remove_link(&typec_connector->kobj, "drm_connector");
> > +     sysfs_remove_link(&dev->kobj, "typec_connector");
> > +}
> > +
> > +static const struct component_ops typec_connector_ops = {
> > +     .bind = typec_connector_bind,
> > +     .unbind = typec_connector_unbind,
> > +};
> > +
> >  static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
> >
> >  /**
> > @@ -355,6 +385,13 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
> >       if (connector->ddc)
> >               return sysfs_create_link(&connector->kdev->kobj,
> >                                &connector->ddc->dev.kobj, "ddc");
> > +
> > +     if (dev_fwnode(kdev)) {
> > +             r = component_add(kdev, &typec_connector_ops);
> > +             if (r)
> > +                     drm_err(dev, "failed to add component\n");
> > +     }
> > +
> >       return 0;
> >
> >  err_free:
> > @@ -367,6 +404,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
> >       if (!connector->kdev)
> >               return;
> >
> > +     if (dev_fwnode(connector->kdev))
> > +             component_del(connector->kdev, &typec_connector_ops);
> > +
> >       if (connector->ddc)
> >               sysfs_remove_link(&connector->kdev->kobj, "ddc");
> >
> > --
> > 2.37.3.998.g577e59143f-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Thank you,
Won
