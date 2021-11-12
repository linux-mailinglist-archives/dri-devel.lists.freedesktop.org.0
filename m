Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3844E386
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 09:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8D6ECEB;
	Fri, 12 Nov 2021 08:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A446ECEB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 08:56:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id d11so17234147ljg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=cNgVZZKOCYjO8aZeMeqpgqX7WaeUWkekQxuJ4nUnitk=;
 b=n/q1LVVxcot3fRPvjszV3Dra1zjHj8g7nyiUf31WKYpdJnGrqPp7znRWGEeAK6P+zX
 msSQYBqbTo4gHYDrL/TQxP906VH4m3/iwBGyCpYBsx1iHWbAJjeWXYpXF88FMVMAQf4v
 uBZzzFsSd0P8m3gLPUjX9Qr3zI/6AF+5sk71wJdo0zMqIGCYmpp4ajJFz+trIOwy29LD
 pgSPqp4BGXyGCqwp0kz0GIDXK6D4WKdPAfvW7LYMxYSx4EOGB/6F05Xdf3/iYliIcu/I
 B51YZuhBty+0yrRGkC/kaewl6f4bL+62ETjga0+CDLjqwGe9KlIc6nezPZ152RSQHjM7
 eWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=cNgVZZKOCYjO8aZeMeqpgqX7WaeUWkekQxuJ4nUnitk=;
 b=Df989TOqtp4t2Qunp031814hu4Ji2x5xN0BRzc4MKneP/B3IQoBp/0M0qhvaSlYYS/
 PPP1CoD6pooES7/7NCdeGziic/+CYe9Ifv5AOY2u594UoIrn1ZtSnILP+g4BbAqBJLgD
 V9Ac6uZxG3bRp2T4XIM8ighEzO9Z2CbF1ceD5G4iFp/F4fOFban7AyHl5JLpOUPCjFi9
 rihZ7vR8hl2/30m4QEJYn31tgHQvJay/bVamUZcelOBqwlJHgeCJ0Wz7Wy34oCPzKpAj
 2cowCTWa4aijftL8FX/afjpUpdCK1lFeOsyUFKdVZ3yzgoqLJIkZJ4zmZADA+aqw7yK3
 EXRQ==
X-Gm-Message-State: AOAM533ut741uggyWKKsO12wpGzJjOzVFkX9lOw2bYklx3V7ScQ+z/H2
 1vwzNObv1nDg29iKlDznw7A=
X-Google-Smtp-Source: ABdhPJzcd3s+9vYrm35DotnNE5RhLld35PuxjHrn9/w6VRq3fuTs4/fBgQymTn0uTegb8obp9d29IA==
X-Received: by 2002:a2e:984f:: with SMTP id e15mr13609968ljj.427.1636707405277; 
 Fri, 12 Nov 2021 00:56:45 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h1sm503878lfp.249.2021.11.12.00.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 00:56:45 -0800 (PST)
Date: Fri, 12 Nov 2021 10:56:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Message-ID: <20211112105641.25a4e1a7@eldfell>
In-Reply-To: <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uDmoW7.odYc6tgDH2PISEz2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uDmoW7.odYc6tgDH2PISEz2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Nov 2021 15:17:13 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 08.11.21 um 15:06 schrieb Javier Martinez Canillas:
> > There is a lot of historical baggage on this parameter. It is defined in
> > the vgacon driver as nomodeset, but its set function is called text_mod=
e()
> > and the value queried with a function named vgacon_text_force().
> >=20
> > All this implies that it's about forcing text mode for VGA, yet it is n=
ot
> > used in neither vgacon nor other console driver. The only users for the=
se
> > are DRM drivers, that check for the vgacon_text_force() return value to
> > determine whether the driver should be loaded or not.
> >=20
> > That makes it quite confusing to read the code, because the variables a=
nd
> > function names don't reflect what they actually do and also are not in =
the
> > same subsystem as the drivers that make use of them.
> >=20
> > This patch-set attempts to cleanup the code by moving the nomodseset pa=
ram
> > to the DRM subsystem and do some renaming to make their intention clear=
er.
> >=20
> > This is a v4 of the patches, that address issues pointed out by Thomas
> > Zimmermann in v3: https://lkml.org/lkml/2021/11/8/384
> >=20
> > Patch #1 and #2 are just trivial cleanups.
> >=20
> > Patch #3 moves the nomodeset boot option to the DRM subsystem and renam=
es
> > the variables and functions names.
> >=20
> > Patch #4 removes the relationship between the nomodeset parameter and t=
he
> > CONFIG_VGA_CONSOLE Kconfig symbol.
> >=20
> > Patch #5 adds nomodeset to the kernel parameters documentation.
> >=20
> > Patch #6 improves the message when nomodeset is enabled to make it more
> > accurate and less sensational. =20
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Hi,

these ideas make sense to me, so FWIW,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

There is one nitpick I'd like to ask about:

+bool drm_get_modeset(void)
+{
+	return !drm_nomodeset;
+}
+EXPORT_SYMBOL(drm_get_modeset);

Doesn't "get" have a special meaning in the kernel land, like "take a
strong reference on an object and return it"?

As this is just returning bool without changing anything, the usual
word to use is "is". Since this function is also used at most once per
driver, which is rarely, it could have a long and descriptive name.

For example:

bool drm_is_modeset_driver_allowed(void);

- "drm" is the namespace
- "is" implies it is a read-only boolean inspection
- "modeset" is the feature being checked
- "driver" implies it is supposed gate driver loading or
  initialization, rather than modesets after drivers have loaded
- "allowed" says it is asking about general policy rather than what a
  driver does

Just a bikeshed, I'll leave it to actual kernel devs to say if this
would be more appropriate or worth it.


Thanks,
pq

>=20
> Best regards
> Thomas
>=20
> >=20
> > Changes in v4:
> > - Don't mention the simpledrm driver and instead explain in high level
> >    terms what the nomodeset option is about.
> > - Don't mention DRM drivers in the kernel message and instead explain
> >    that only the system framebuffer will be available.
> >=20
> > Changes in v3:
> > - Drop the drm_drv_enabled() function and just call to drm_get_modeset(=
).
> > - Make drm_get_modeset() just a getter function and don't return an err=
or.
> > - Move independent cleanups in drivers as separate preparatory patches.
> >=20
> > Changes in v2:
> > - Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
> > - Squash patches to move nomodeset logic to DRM and do the renaming.
> > - Name the function drm_check_modeset() and make it return -ENODEV.
> > - Squash patch to add drm_drv_enabled() and make drivers use it.
> > - Make the drivers changes before moving nomodeset logic to DRM.
> > - Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
> > - Remove debug and error messages in drivers.
> >=20
> > Javier Martinez Canillas (6):
> >    drm: Don't print messages if drivers are disabled due nomodeset
> >    drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call
> >      vgacon_text_force()
> >    drm: Move nomodeset kernel parameter to the DRM subsystem
> >    drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
> >    Documentation/admin-guide: Document nomodeset kernel parameter
> >    drm: Make the nomodeset message less sensational
> >=20
> >   .../admin-guide/kernel-parameters.txt         |  7 ++++++
> >   drivers/gpu/drm/Kconfig                       |  6 +++++
> >   drivers/gpu/drm/Makefile                      |  2 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 ++---
> >   drivers/gpu/drm/ast/ast_drv.c                 |  4 ++--
> >   drivers/gpu/drm/drm_nomodeset.c               | 24 +++++++++++++++++++
> >   drivers/gpu/drm/i915/i915_module.c            |  4 ++--
> >   drivers/gpu/drm/mgag200/mgag200_drv.c         |  4 ++--
> >   drivers/gpu/drm/nouveau/nouveau_drm.c         |  4 ++--
> >   drivers/gpu/drm/qxl/qxl_drv.c                 |  4 ++--
> >   drivers/gpu/drm/radeon/radeon_drv.c           | 10 +++-----
> >   drivers/gpu/drm/tiny/bochs.c                  |  4 ++--
> >   drivers/gpu/drm/tiny/cirrus.c                 |  5 ++--
> >   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  6 ++---
> >   drivers/gpu/drm/virtio/virtgpu_drv.c          |  4 ++--
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
> >   drivers/video/console/vgacon.c                | 21 ----------------
> >   include/drm/drm_mode_config.h                 |  2 ++
> >   include/linux/console.h                       |  6 -----
> >   19 files changed, 67 insertions(+), 60 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_nomodeset.c
> >  =20
>=20


--Sig_/uDmoW7.odYc6tgDH2PISEz2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGOLEkACgkQI1/ltBGq
qqeYCBAAjfpJUBiErXdArAOPClITMDPIkF6RinQevM2YjJX1nJIkCnSl24xjbu5Q
y5TJO5LQgt/uU4QWlJXcsgHUgh8xbj76D6mlab5cJdMMbNRc5FitUuHIwfxEcGY8
Rjr81VxhDBy7fPUX2SSdEgZfiChqw4OmaljsbqR/ewPmVrmDWui6Nsuqla4GYV/M
CRg4Sp0HsIO6b6l5dsuJdSNfq7YOQlQLf8/VEA+ttC4ZMlzZHPLnbe+o/DFHtQNl
gnrRB2+je5RhPLln+hx+m7THTef1Iog5jWTlENFbJ/Tza2WBWkRZZ15g84R74TrA
24PvqkP8s1wflfn9reQG/Z9Z6jKP8d1/4GFDto+tPbd4j3NqcO6D7TxmlWxrXvia
yIuXxH4Xwei4HFhU60pUs/NOFQsSG4Faqt7SzWPL4UaRdo+45IFkdTl6xlwLj45d
ELxok2mjF9jpXyQBkOF20y8NysSEAiUBGAwJF8EoE4Nb5uB3lPPvGJ3RGnGYSwHv
bixQd8YovE+VmYctKAyu7Q7H+m+6RDPrR2uaKGcZWXnC7gZK/ShTBQ51OVFHal7u
6cuASNf9LwpLdZmz9OibrKEQcR6qbBawoHXkbNo2Bn7EUz9Ns634AXU+U9L+g9Sz
oOHKxww3B7J0fB0jdIaA8AR0iN1oKJiIScFIvme2/9ONLpV5vzg=
=2BCR
-----END PGP SIGNATURE-----

--Sig_/uDmoW7.odYc6tgDH2PISEz2--
