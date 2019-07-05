Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A766606A6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 15:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF36E4BE;
	Fri,  5 Jul 2019 13:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CB46E4BE;
 Fri,  5 Jul 2019 13:36:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v85so3412516lfa.6;
 Fri, 05 Jul 2019 06:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=FMvxkTd3sE67r00o3E2/akMNCYLR9oIIOHcz9XnpDnc=;
 b=m6TPMIZ0RQmtH38WmumA2UaTGlu2CiCe34y5pqQ5cWmyF9cxnwZ3jUxl78Nid/Pjwl
 0WUHV4vurqjxwX5y1AY6fSi0NN3ZWgcyU//h4oT+Q4F1ScqYIX7c4C/ALagbF6pQbV8n
 7ORFrPxchb75zyysDqrZLOCP5zNVenrN3OrJhu3ZtEaDmWGHyEAqivn3nYzpPJJVdOe2
 lDhBx1Sb6XW01etD32j9z3hVVF5TRuNeEb/eyaUqhsn15l9VU361M8BU9Q8ak7YqCqk/
 wy2h17lVJaC4X4mNwDP9rDvX6zrTbQV5qtM1xvYyJV+KEHWEJ2WyYyzN3cyLEXg0l2Tj
 FHRw==
X-Gm-Message-State: APjAAAVte1tEK7YrcmBw0Ka9eobu9alycGKqkWxNf1H69pE5Z0mq+0Cp
 TkOxVWWJYo342cyzZR4Bwv3xUXDR
X-Google-Smtp-Source: APXvYqxoL62wkhiidpSQ/SjKkRpVAR/7NBShy6/0zXyQ8BraDZaLS12B4ww/QnmFSVX0kQ7NT3v0KQ==
X-Received: by 2002:ac2:4565:: with SMTP id k5mr2077671lfm.170.1562333802422; 
 Fri, 05 Jul 2019 06:36:42 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h10sm456281lfp.33.2019.07.05.06.36.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 06:36:42 -0700 (PDT)
Date: Fri, 5 Jul 2019 16:36:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190705163638.0d39cb93@eldfell.localdomain>
In-Reply-To: <20190704104210.GB27121@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
 <20190704141227.048bbef5@eldfell.localdomain>
 <20190704104210.GB27121@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=FMvxkTd3sE67r00o3E2/akMNCYLR9oIIOHcz9XnpDnc=;
 b=KS8RDX6Ove/Tkzn2A0t5sYUCz+pRuTyVN9doze5dDZkYU5cXsyAJHMKh9zxqa+e8dU
 ybzinqeUFojUrJexnaJwvp+UaIrfJAVdbdpQjB9/DI4BzHVOJzSPHqnBGv+x0E4Lef0t
 PJ7AZR3jjBSvsNj75CqfZfglnU2yGnwEpznyQHnUemDl9QAEdHmMJfBOXlTtTb/NfosG
 ZeL1v/HK3GNPCnLKzHTcW/kE2x2aS5jQnvjz5amq7g/qyWj4vUk09kn/vf8EHwAXKmX9
 jCOYcHa4CWAi+jeVSDcloFDtG4bxr4+BD2b7nb9K1hLICU1uMoQSAjdOUmrZgi8NKwB6
 +x8w==
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com
Content-Type: multipart/mixed; boundary="===============0735887575=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0735887575==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V_tjm1j=nnkM6ArUxmuS7u8"; protocol="application/pgp-signature"

--Sig_/V_tjm1j=nnkM6ArUxmuS7u8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jul 2019 16:12:10 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-04 at 14:12:27 +0300, Pekka Paalanen wrote:
> > On Tue,  7 May 2019 21:57:43 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > DRM API for generating uevent for a status changes of connector's
> > > property.
> > >=20
> > > This uevent will have following details related to the status change:
> > >=20
> > >   HOTPLUG=3D1, CONNECTOR=3D<connector_id> and PROPERTY=3D<property_id>
> > >=20
> > > Need ACK from this uevent from userspace consumer.
> > >=20
> > > v2:
> > >   Minor fixes at KDoc comments [Daniel]
> > > v3:
> > >   Check the property is really attached with connector [Daniel]
> > >=20
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_sysfs.c | 35 +++++++++++++++++++++++++++++++++++
> > >  include/drm/drm_sysfs.h     |  5 ++++-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > > index 18b1ac442997..63fa951a20db 100644
> > > --- a/drivers/gpu/drm/drm_sysfs.c
> > > +++ b/drivers/gpu/drm/drm_sysfs.c
> > > @@ -21,6 +21,7 @@
> > >  #include <drm/drm_sysfs.h>
> > >  #include <drm/drmP.h>
> > >  #include "drm_internal.h"
> > > +#include "drm_crtc_internal.h"
> > > =20
> > >  #define to_drm_minor(d) dev_get_drvdata(d)
> > >  #define to_drm_connector(d) dev_get_drvdata(d)
> > > @@ -320,6 +321,9 @@ void drm_sysfs_lease_event(struct drm_device *dev)
> > >   * Send a uevent for the DRM device specified by @dev.  Currently we=
 only
> > >   * set HOTPLUG=3D1 in the uevent environment, but this could be expa=
nded to
> > >   * deal with other types of events.
> > > + *
> > > + * Any new uapi should be using the drm_sysfs_connector_status_event=
()
> > > + * for uevents on connector status change.
> > >   */
> > >  void drm_sysfs_hotplug_event(struct drm_device *dev)
> > >  {
> > > @@ -332,6 +336,37 @@ void drm_sysfs_hotplug_event(struct drm_device *=
dev)
> > >  }
> > >  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
> > > =20
> > > +/**
> > > + * drm_sysfs_connector_status_event - generate a DRM uevent for conn=
ector
> > > + * property status change
> > > + * @connector: connector on which property status changed
> > > + * @property: connector property whoes status changed.
> > > + *
> > > + * Send a uevent for the DRM device specified by @dev.  Currently we
> > > + * set HOTPLUG=3D1 and connector id along with the attached property=
 id
> > > + * related to the status change.
> > > + */ =20
> This is the kernel doc added for drm_sysfs_connector_status_event()
> similar to drm_sysfs_hotplug_event()

Hi,

yes, it is the kernel internal doc. An UAPI doc would spell out the
attributes "CONNECTOR" and "PROPERTY" and describe their values
explaining what they are, instead of decsribing a kernel-internal
function arguments.

However, as discussed, we cannot have UAPI docs at this time, so I
guess this is the best we can have.


Thanks,
pq


> > > +void drm_sysfs_connector_status_event(struct drm_connector *connecto=
r,
> > > +				      struct drm_property *property)
> > > +{
> > > +	struct drm_device *dev =3D connector->dev;
> > > +	char hotplug_str[] =3D "HOTPLUG=3D1", conn_id[30], prop_id[30];
> > > +	char *envp[4] =3D { hotplug_str, conn_id, prop_id, NULL };
> > > +
> > > +	WARN_ON(!drm_mode_obj_find_prop_id(&connector->base,
> > > +					   property->base.id));
> > > +
> > > +	snprintf(conn_id, ARRAY_SIZE(conn_id),
> > > +		 "CONNECTOR=3D%u", connector->base.id);
> > > +	snprintf(prop_id, ARRAY_SIZE(prop_id),
> > > +		 "PROPERTY=3D%u", property->base.id);
> > > +
> > > +	DRM_DEBUG("generating connector status event\n");
> > > +
> > > +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> > > +}
> > > +EXPORT_SYMBOL(drm_sysfs_connector_status_event);
> > > +
> > >  static void drm_sysfs_release(struct device *dev)
> > >  {
> > >  	kfree(dev);
> > > diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> > > index 4f311e836cdc..d454ef617b2c 100644
> > > --- a/include/drm/drm_sysfs.h
> > > +++ b/include/drm/drm_sysfs.h
> > > @@ -4,10 +4,13 @@
> > > =20
> > >  struct drm_device;
> > >  struct device;
> > > +struct drm_connector;
> > > +struct drm_property;
> > > =20
> > >  int drm_class_device_register(struct device *dev);
> > >  void drm_class_device_unregister(struct device *dev);
> > > =20
> > >  void drm_sysfs_hotplug_event(struct drm_device *dev);
> > > -
> > > +void drm_sysfs_connector_status_event(struct drm_connector *connecto=
r,
> > > +				      struct drm_property *property);
> > >  #endif =20
> >=20
> > Hi,
> >=20
> > this patch is completely missing the UAPI documentation.
> >=20
> > Weston in
> > https://gitlab.freedesktop.org/wayland/weston/merge_requests/48
> > does have good looking code to parse this event.
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20


--Sig_/V_tjm1j=nnkM6ArUxmuS7u8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0fUmYACgkQI1/ltBGq
qqcEgA/9HGeGt2CdU+zN+iluBDXnU+1mf2p+wBUycqYGRy1+O4laAsnzw9Qh64Sz
TmEURGUVDFW9Gkl1XSIzjdCWBBncUGgzqvSHgYrz6q2ZomxWOYhzbyFPapsxmXEu
IY1qsOVyROmONyhzPcyhmfMxD5JkpZJ2bpiGzBgXEQnWLj+0Q8FujuTgCMmuOSkb
TGyPfuDtP9bLerZOX20xw2T85m0cagAoPOhWb19FoaNA5wwwhxR85Vk9tKpgCDWw
tv0hF5sFc+yaxWhisTfu79rsFVoHfTm9Ipf3A27sqvrJi2gUtpQiVKLc/Kupl5tk
l86hUc3YZU2tEoOGqqapPEwXNtKDGkAN8KiZrocNPVn43QqP4CP07WfnKFIS+bU0
69Az41Vw+rgK8WzrfPwWjObQbbdJx3XaLErUanvJwyEGWBZ9SEdAo03GPPj6TqgH
kFNjZcmEwsoxBT6XUB481EQWRH19WmUflmQcRKF5JL6jSvNffIsMFzr0CgGjBB4P
AOGhXudK4L4/kFePkUzoAuhRnZ49tsyPdRs6ShZE804hyDq0oRGPFiYLWsC6+QFu
mBUSx8vofWShBEI5txdPpLgbomzaSwXTG5pYAB1ojDB9xojfmdskWIMpOsNo6PjM
GDOwn9gmQFpb01lBNjlZBMxbxlbopQK6YUQu4VBXIAC5P8058Jo=
=2PoW
-----END PGP SIGNATURE-----

--Sig_/V_tjm1j=nnkM6ArUxmuS7u8--

--===============0735887575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0735887575==--
