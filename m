Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4EE6DD9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D16E427;
	Mon, 28 Oct 2019 08:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9B6E427;
 Mon, 28 Oct 2019 08:12:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w8so5734142lji.13;
 Mon, 28 Oct 2019 01:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=y9n19K1xlV5enJDy0H24XnRHBlz5CW4iW6a5+UW1oQI=;
 b=CkeysOA3tontJg0NXPhEQrVTz/U7l4ZiTRvu18lgwUcESZ9IJupAdJd19fUyl8iEBR
 P3hddfOf2Jjpg9IIx/iSrz3IHoW4AJoSiO4smY7p6nYajMrVFNJ/KaJFslm9jvYFKrGE
 9As3JdOF5bmP49X4Vjf6a+POvbvZ/8tmdqiE1f/pPCxIebIBcuDJOIWfGEBhGK8lP8DE
 ULh+mTaa5BnaJpvzrC5pwefpEMcjGC8nPEjlWilYnRD234a1vt0ytAHR9WH6ZxA1S4Iz
 X0ScaPMLdEFk6I5ei/R+AgW6OnbZr3dWy5O3hHmsAyiBr0Ydw67jhcRSl1cVh+yght5p
 lkdg==
X-Gm-Message-State: APjAAAUyt5ECp5X68gEWsYSQHg9BZLp3eq6K3PzxH0WQA+Aa398n6UdC
 mT1ZTRoVK1x4pVHztKjRR7s=
X-Google-Smtp-Source: APXvYqx3skaCDCIGf5cnNnUiVCp3YbJVzJImIr09dDuWuqgsIUBNjB23dj1O+L8/GwvM2z81i0o+Pg==
X-Received: by 2002:a05:651c:154:: with SMTP id
 c20mr3976997ljd.1.1572250360624; 
 Mon, 28 Oct 2019 01:12:40 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u4sm806646lfg.5.2019.10.28.01.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 01:12:39 -0700 (PDT)
Date: Mon, 28 Oct 2019 10:12:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] drm: Add support for integrated privacy screens
Message-ID: <20191028101223.24da4d78@eldfell.localdomain>
In-Reply-To: <CAKMK7uGscg0YDgNZh61PAhnkF8xnASepo2HK2Y51wROPSkqJLA@mail.gmail.com>
References: <20191023001206.15741-1-rajatja@google.com>
 <20191024112040.GE2825247@ulmo>
 <CAA93t1ozojwgVoLCZ=AWx72yddQoiaZCMFG35gQg3mQL9n9Z2w@mail.gmail.com>
 <20191025113609.GB928835@ulmo>
 <CAKMK7uGscg0YDgNZh61PAhnkF8xnASepo2HK2Y51wROPSkqJLA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=y9n19K1xlV5enJDy0H24XnRHBlz5CW4iW6a5+UW1oQI=;
 b=OucuQ8LsIjGhUZa9cpLLPoXECXjYdQ71vk+6N6s6lvHI+GooBnSQ1lUvmWkS1ZRtaZ
 wzc5U6k92KTTI/m9em8Z5uDhNMkIlDbmDn93IBiQfH1L3wcD7m2Jpv4buwCTZvuJ4579
 /QoRaxl0c4RQTBQ8YBdEmIrpLtuyete2InHhPKDJQAmKnK42EAGzV21HZyatiCGya5Wz
 nrlLXSyZ3V70JKmmCNeq/VuDuN71kd4hx+I8lGBgFRYbPDybAvnfAh0f96Slqe0hCdnm
 jgZbEzYdD21Pwf2Vh+hVaYSHKRgQSwdlPBvBhzfZQq5KiPxnN9GVzUO6BgkkLc9YpxGH
 Xj8g==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Duncan Laurie <dlaurie@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 Sean Paul <seanpaul@google.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@denx.de>,
 Mat King <mathewk@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Jesse Barnes <jsbarnes@google.com>
Content-Type: multipart/mixed; boundary="===============0549178779=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0549178779==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NJcM6CAa7BRFczfzsRNLDUV"; protocol="application/pgp-signature"

--Sig_/NJcM6CAa7BRFczfzsRNLDUV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Oct 2019 21:03:12 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Oct 25, 2019 at 1:36 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Thu, Oct 24, 2019 at 01:45:16PM -0700, Rajat Jain wrote: =20
> > > Hi,
> > >
> > > Thanks for your review and comments. Please see inline below.
> > >
> > > On Thu, Oct 24, 2019 at 4:20 AM Thierry Reding <thierry.reding@gmail.=
com> wrote: =20
> > > >
> > > > On Tue, Oct 22, 2019 at 05:12:06PM -0700, Rajat Jain wrote: =20
> > > > > Certain laptops now come with panels that have integrated privacy
> > > > > screens on them. This patch adds support for such panels by adding
> > > > > a privacy-screen property to the drm_connector for the panel, that
> > > > > the userspace can then use to control and check the status. The i=
dea
> > > > > was discussed here:
> > > > >
> > > > > https://lkml.org/lkml/2019/10/1/786
> > > > >
> > > > > ACPI methods are used to identify, query and control privacy scre=
en:
> > > > >
> > > > > * Identifying an ACPI object corresponding to the panel: The patch
> > > > > follows ACPI Spec 6.3 (available at
> > > > > https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan=
30.pdf).
> > > > > Pages 1119 - 1123 describe what I believe, is a standard way of
> > > > > identifying / addressing "display panels" in the ACPI tables, thus
> > > > > allowing kernel to attach ACPI nodes to the panel. IMHO, this abi=
lity
> > > > > to identify and attach ACPI nodes to drm connectors may be useful=
 for
> > > > > reasons other privacy-screens, in future.
> > > > >
> > > > > * Identifying the presence of privacy screen, and controlling it,=
 is done
> > > > > via ACPI _DSM methods.
> > > > >
> > > > > Currently, this is done only for the Intel display ports. But in =
future,
> > > > > this can be done for any other ports if the hardware becomes avai=
lable
> > > > > (e.g. external monitors supporting integrated privacy screens?).
> > > > >
> > > > > Also, this code can be extended in future to support non-ACPI met=
hods
> > > > > (e.g. using a kernel GPIO driver to toggle a gpio that controls t=
he
> > > > > privacy-screen).
> > > > >
> > > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/Makefile                |   1 +
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c       |   5 +
> > > > >  drivers/gpu/drm/drm_connector.c         |  38 +++++
> > > > >  drivers/gpu/drm/drm_privacy_screen.c    | 176 ++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/i915/display/intel_dp.c |   3 +
> > > > >  include/drm/drm_connector.h             |  18 +++
> > > > >  include/drm/drm_mode_config.h           |   7 +
> > > > >  include/drm/drm_privacy_screen.h        |  33 +++++
> > > > >  8 files changed, 281 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
> > > > >  create mode 100644 include/drm/drm_privacy_screen.h =20
> > > >
> > > > I like this much better than the prior proposal to use sysfs. Howev=
er
> > > > the support currently looks a bit tangled. I realize that we only h=
ave a
> > > > single implementation for this in hardware right now, so there's no=
 use
> > > > in over-engineering things, but I think we can do a better job from=
 the
> > > > start without getting into too many abstractions. See below.
> > > > =20
> > > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > > index 82ff826b33cc..e1fc33d69bb7 100644
> > > > > --- a/drivers/gpu/drm/Makefile
> > > > > +++ b/drivers/gpu/drm/Makefile
> > > > > @@ -19,6 +19,7 @@ drm-y       :=3D      drm_auth.o drm_cache.o \
> > > > >               drm_syncobj.o drm_lease.o drm_writeback.o drm_clien=
t.o \
> > > > >               drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> > > > >
> > > > > +drm-$(CONFIG_ACPI) +=3D drm_privacy_screen.o
> > > > >  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_c=
ontext.o drm_dma.o drm_scatter.o drm_lock.o
> > > > >  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
> > > > >  drm-$(CONFIG_DRM_VM) +=3D drm_vm.o
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/=
drm_atomic_uapi.c
> > > > > index 7a26bfb5329c..44131165e4ea 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > @@ -30,6 +30,7 @@
> > > > >  #include <drm/drm_atomic.h>
> > > > >  #include <drm/drm_print.h>
> > > > >  #include <drm/drm_drv.h>
> > > > > +#include <drm/drm_privacy_screen.h>
> > > > >  #include <drm/drm_writeback.h>
> > > > >  #include <drm/drm_vblank.h>
> > > > >
> > > > > @@ -766,6 +767,8 @@ static int drm_atomic_connector_set_property(=
struct drm_connector *connector,
> > > > >                                                  fence_ptr);
> > > > >       } else if (property =3D=3D connector->max_bpc_property) {
> > > > >               state->max_requested_bpc =3D val;
> > > > > +     } else if (property =3D=3D config->privacy_screen_property)=
 {
> > > > > +             drm_privacy_screen_set_val(connector, val); =20
> > > >
> > > > This doesn't look right. Shouldn't you store the value in the conne=
ctor
> > > > state and then leave it up to the connector driver to set it
> > > > appropriately? I think that also has the advantage of untangling th=
is
> > > > support a little. =20
> > >
> > > Hopefully this gets answered in my explanations below.
> > > =20
> > > > =20
> > > > >       } else if (connector->funcs->atomic_set_property) {
> > > > >               return connector->funcs->atomic_set_property(connec=
tor,
> > > > >                               state, property, val);
> > > > > @@ -842,6 +845,8 @@ drm_atomic_connector_get_property(struct drm_=
connector *connector,
> > > > >               *val =3D 0;
> > > > >       } else if (property =3D=3D connector->max_bpc_property) {
> > > > >               *val =3D state->max_requested_bpc;
> > > > > +     } else if (property =3D=3D config->privacy_screen_property)=
 {
> > > > > +             *val =3D drm_privacy_screen_get_val(connector); =20
> > > >
> > > > Similarly, I think this can just return the atomic state's value for
> > > > this. =20
> > >
> > > I did think about having a state variable in software to get and set
> > > this. However, I think it is not very far fetched that some platforms
> > > may have "hardware kill" switches that allow hardware to switch
> > > privacy-screen on and off directly, in addition to the software
> > > control that we are implementing. Privacy is a touchy subject in
> > > enterprise, and anything that reduces the possibility of having any
> > > inconsistency between software state and hardware state is desirable.
> > > So in this case, I chose to not have a state in software about this -
> > > we just report the hardware state everytime we are asked for it. =20
> >
> > So this doesn't really work with atomic KMS, then. The main idea behind
> > atomic KMS is that you apply a configuration either completely or not at
> > all. So at least for setting this property you'd have to go through the
> > state object.
> >
> > Now, for reading out the property you might be able to get away with the
> > above. I'm not sure if that's enough to keep the state up-to-date,
> > though. Is there some way for a kill switch to trigger an interrupt or
> > other event of some sort so that the state could be kept up-to-date?
> >
> > Daniel (or anyone else), do you know of any precedent for state that
> > might get modified behind the atomic helpers' back? Seems to me like we
> > need to find some point where we can actually read back the current
> > "hardware value" of this privacy screen property and store that back
> > into the state. =20
>=20
> We have atomic properties that the driver also updates, not just userspac=
e:
> - link status
> - hdcp machinery

Hi,

just a note about properties. Please, do not use the HDCP "Content
Protection" as an example of a good property design. A property that is
writable by both userspace and kernel is a hard one to use right in my
opinion.

For privacy screens, I suggest defining two optional and separate
properties:

Software control on/off: userspace writable, kernel immutable

Hardware kill switch on/off: userspace immutable, kernel writable

The semantics of these should be fairly clear: if hardware kill switch
exists and is on, then the privacy screen is on. (Does this match
hardware and expected behaviour?) Otherwise, if the software control
exists, it can be used to control the privacy screen.

For delivering change events for the hardware kill switch, please
search for the proposal to enhance hotplug uevents with property ids.
This was discussed and implemented(?) for delivering HDCP "Content
Protection" changes to userspace when implementing the "HDCP Content
Type" property.


Thanks,
pq

--Sig_/NJcM6CAa7BRFczfzsRNLDUV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl22oucACgkQI1/ltBGq
qqdk0BAAh6bjj6VS7FwzG/UXCTEYTxnhogIOjkTbODjM2xFAH7RHyGev/3hxnJi+
eXQ2Xu+rFa4BLH5m4Jmu1BW9U3dyTrhJ5JT8me86JYFfP333VdIxS9GMkznTiBvT
hM0e4hyki5qQnxQhNmF/0puxe7yIn/r/WN+jZAACQScEoJCG3me07uemT7wEwsa6
n+ONF0Y/efWK3s2qL39pWfa2dw1Z1ZAaXbUqkumnfrNopjw1t7G6z2zuFoVnAyS3
93RjS5XE/xNEPK3TdHPICGy2vzU+PGSYYg4WSQWHSVNq8ciVSi+dVsAz24t7jagX
mSSAmTwQgT9LegzF/WQ/rwcPO7AXXmKyD6acJXRq2XJk8Z3skFDcKqmokRJqeTbM
5IV8WKRZeI0K9VU9bSrRpciD8gTx5yfNsMJDzFl5txymPrJ2bvBauTiSRKdRsfyt
5P3fbwnWCIPoX9TOWB8KC5UBpdZGrdC3XOe6+ltY4EDdUUcpA8esnn166dEXFGCo
hbKRAD/gQvoRQ98V0C/N9B300/Cmqi6jLPZW87QScl52NFgF7HvJNacovdITWZJm
XIsiAz/oTkHSu0+7d9kdyY4yIZdqyxskV1f89dmbNwE6XW7TwHwKIDRbNVFXwHH8
Jv3Vc/8AaxSXV73hrK2a7//+NUvA7mGx+gxgLv1UYmy2FILjlOY=
=KOpg
-----END PGP SIGNATURE-----

--Sig_/NJcM6CAa7BRFczfzsRNLDUV--

--===============0549178779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0549178779==--
