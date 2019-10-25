Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85FE4A12
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8A6E9B2;
	Fri, 25 Oct 2019 11:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19456E9AB;
 Fri, 25 Oct 2019 11:36:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 11so1764066wmk.0;
 Fri, 25 Oct 2019 04:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6PgIolchH715cVQ72lkVwTrIjfj0AFZA+t7ShQjSlS0=;
 b=PY+4W+oclhkB+dJxFM6ORvVN6x4We8/NeuD7i294/AgmIOjHBJZ0Nr+/ap+7B4N8gL
 7H9vQTTGLGlkO/Khu6uYndTJVFXK7kVUuxVZd7cpPef+1/by44Fuocc8lrcaZWWGO39M
 L4IoYCWM9dqbcZ6TAfkN8aE/0ay+ko5DigAzmKkt3zwuVXm7JoiDK2POY6wjkojReGym
 q+4x9ISiVeX0zAUH0JgJuXS0fhC4yj1K+JUXl5Ftrn/NBoQcePK0/6b+y325Gbq8b1O7
 s3abm9fts10AleM/ofUrarhg5ceNU1DPB6Ck3tkxn1hCRgxlDVQOvi0xqsVKyyhEk/3T
 XW9A==
X-Gm-Message-State: APjAAAWmgqGpcu7DTsMfw7b3wnpco7cXsXO+UiNJBQr/0fbUhUpS91kX
 8LVMBCxqf00hPppvD+ul9/0=
X-Google-Smtp-Source: APXvYqxAUwt6LFmbo7kFYtXU9wy8u+sw3vQAV5u5nznQNNodkr7EUPeoFw47o0D6s/VFpClxQ2m0uw==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr3360819wme.80.1572003373704; 
 Fri, 25 Oct 2019 04:36:13 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o73sm1700387wme.34.2019.10.25.04.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 04:36:10 -0700 (PDT)
Date: Fri, 25 Oct 2019 13:36:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rajat Jain <rajatxjain@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Add support for integrated privacy screens
Message-ID: <20191025113609.GB928835@ulmo>
References: <20191023001206.15741-1-rajatja@google.com>
 <20191024112040.GE2825247@ulmo>
 <CAA93t1ozojwgVoLCZ=AWx72yddQoiaZCMFG35gQg3mQL9n9Z2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA93t1ozojwgVoLCZ=AWx72yddQoiaZCMFG35gQg3mQL9n9Z2w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6PgIolchH715cVQ72lkVwTrIjfj0AFZA+t7ShQjSlS0=;
 b=DkBpFnJupcU0Tt1HeYQUGGcUrE1FSHSeXK1nv2neEKphQlFhnSMvo7IdWx/dHhG8zJ
 a6vARsUd7eqBc5pk9hs3xZ0VzHdKxyOHcHvvWCviZTAoT1Vy39GULayd+4b7jgsz8QQe
 91eff7jK/wuxCqtiq4dkGQu0QDlWTe/k3rvkLCv8iYnqsUJIhFR1v+pc4Re7DgwkWKTS
 RsNI5oDafPSo5Rfj6XCvp2Pz5Xmc7PnpoIOL7rApU+yOBPXl7Jo41iBmxIZnVRwKvQ4G
 BtNJf/iNOIek08xegWen8bisnXRcNSykhGB/QSAMIxu9K/Pfzn0r0MzY+kVG+DVX8y+B
 9DJA==
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
Cc: seanpaul@google.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rajat Jain <rajatja@google.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 jsbarnes@google.com, intel-gfx@lists.freedesktop.org, mathewk@google.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>, Duncan Laurie <dlaurie@google.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>
Content-Type: multipart/mixed; boundary="===============1516204577=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1516204577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 01:45:16PM -0700, Rajat Jain wrote:
> Hi,
>=20
> Thanks for your review and comments. Please see inline below.
>=20
> On Thu, Oct 24, 2019 at 4:20 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Tue, Oct 22, 2019 at 05:12:06PM -0700, Rajat Jain wrote:
> > > Certain laptops now come with panels that have integrated privacy
> > > screens on them. This patch adds support for such panels by adding
> > > a privacy-screen property to the drm_connector for the panel, that
> > > the userspace can then use to control and check the status. The idea
> > > was discussed here:
> > >
> > > https://lkml.org/lkml/2019/10/1/786
> > >
> > > ACPI methods are used to identify, query and control privacy screen:
> > >
> > > * Identifying an ACPI object corresponding to the panel: The patch
> > > follows ACPI Spec 6.3 (available at
> > > https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.p=
df).
> > > Pages 1119 - 1123 describe what I believe, is a standard way of
> > > identifying / addressing "display panels" in the ACPI tables, thus
> > > allowing kernel to attach ACPI nodes to the panel. IMHO, this ability
> > > to identify and attach ACPI nodes to drm connectors may be useful for
> > > reasons other privacy-screens, in future.
> > >
> > > * Identifying the presence of privacy screen, and controlling it, is =
done
> > > via ACPI _DSM methods.
> > >
> > > Currently, this is done only for the Intel display ports. But in futu=
re,
> > > this can be done for any other ports if the hardware becomes available
> > > (e.g. external monitors supporting integrated privacy screens?).
> > >
> > > Also, this code can be extended in future to support non-ACPI methods
> > > (e.g. using a kernel GPIO driver to toggle a gpio that controls the
> > > privacy-screen).
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > ---
> > >  drivers/gpu/drm/Makefile                |   1 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c       |   5 +
> > >  drivers/gpu/drm/drm_connector.c         |  38 +++++
> > >  drivers/gpu/drm/drm_privacy_screen.c    | 176 ++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/i915/display/intel_dp.c |   3 +
> > >  include/drm/drm_connector.h             |  18 +++
> > >  include/drm/drm_mode_config.h           |   7 +
> > >  include/drm/drm_privacy_screen.h        |  33 +++++
> > >  8 files changed, 281 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
> > >  create mode 100644 include/drm/drm_privacy_screen.h
> >
> > I like this much better than the prior proposal to use sysfs. However
> > the support currently looks a bit tangled. I realize that we only have a
> > single implementation for this in hardware right now, so there's no use
> > in over-engineering things, but I think we can do a better job from the
> > start without getting into too many abstractions. See below.
> >
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 82ff826b33cc..e1fc33d69bb7 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -19,6 +19,7 @@ drm-y       :=3D      drm_auth.o drm_cache.o \
> > >               drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> > >               drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> > >
> > > +drm-$(CONFIG_ACPI) +=3D drm_privacy_screen.o
> > >  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_conte=
xt.o drm_dma.o drm_scatter.o drm_lock.o
> > >  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
> > >  drm-$(CONFIG_DRM_VM) +=3D drm_vm.o
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index 7a26bfb5329c..44131165e4ea 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -30,6 +30,7 @@
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_print.h>
> > >  #include <drm/drm_drv.h>
> > > +#include <drm/drm_privacy_screen.h>
> > >  #include <drm/drm_writeback.h>
> > >  #include <drm/drm_vblank.h>
> > >
> > > @@ -766,6 +767,8 @@ static int drm_atomic_connector_set_property(stru=
ct drm_connector *connector,
> > >                                                  fence_ptr);
> > >       } else if (property =3D=3D connector->max_bpc_property) {
> > >               state->max_requested_bpc =3D val;
> > > +     } else if (property =3D=3D config->privacy_screen_property) {
> > > +             drm_privacy_screen_set_val(connector, val);
> >
> > This doesn't look right. Shouldn't you store the value in the connector
> > state and then leave it up to the connector driver to set it
> > appropriately? I think that also has the advantage of untangling this
> > support a little.
>=20
> Hopefully this gets answered in my explanations below.
>=20
> >
> > >       } else if (connector->funcs->atomic_set_property) {
> > >               return connector->funcs->atomic_set_property(connector,
> > >                               state, property, val);
> > > @@ -842,6 +845,8 @@ drm_atomic_connector_get_property(struct drm_conn=
ector *connector,
> > >               *val =3D 0;
> > >       } else if (property =3D=3D connector->max_bpc_property) {
> > >               *val =3D state->max_requested_bpc;
> > > +     } else if (property =3D=3D config->privacy_screen_property) {
> > > +             *val =3D drm_privacy_screen_get_val(connector);
> >
> > Similarly, I think this can just return the atomic state's value for
> > this.
>=20
> I did think about having a state variable in software to get and set
> this. However, I think it is not very far fetched that some platforms
> may have "hardware kill" switches that allow hardware to switch
> privacy-screen on and off directly, in addition to the software
> control that we are implementing. Privacy is a touchy subject in
> enterprise, and anything that reduces the possibility of having any
> inconsistency between software state and hardware state is desirable.
> So in this case, I chose to not have a state in software about this -
> we just report the hardware state everytime we are asked for it.

So this doesn't really work with atomic KMS, then. The main idea behind
atomic KMS is that you apply a configuration either completely or not at
all. So at least for setting this property you'd have to go through the
state object.

Now, for reading out the property you might be able to get away with the
above. I'm not sure if that's enough to keep the state up-to-date,
though. Is there some way for a kill switch to trigger an interrupt or
other event of some sort so that the state could be kept up-to-date?

Daniel (or anyone else), do you know of any precedent for state that
might get modified behind the atomic helpers' back? Seems to me like we
need to find some point where we can actually read back the current
"hardware value" of this privacy screen property and store that back
into the state.

>=20
> >
> > >       } else if (connector->funcs->atomic_get_property) {
> > >               return connector->funcs->atomic_get_property(connector,
> > >                               state, property, val);
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 4c766624b20d..a31e0382132b 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -821,6 +821,11 @@ static const struct drm_prop_enum_list drm_panel=
_orientation_enum_list[] =3D {
> > >       { DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,  "Right Side Up" },
> > >  };
> > >
> > > +static const struct drm_prop_enum_list drm_privacy_screen_enum_list[=
] =3D {
> > > +     { DRM_PRIVACY_SCREEN_DISABLED, "Disabled" },
> > > +     { DRM_PRIVACY_SCREEN_ENABLED, "Enabled" },
> > > +};
> > > +
> > >  static const struct drm_prop_enum_list drm_dvi_i_select_enum_list[] =
=3D {
> > >       { DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and =
TV-out */
> > >       { DRM_MODE_SUBCONNECTOR_DVID,      "DVI-D"     }, /* DVI-I  */
> > > @@ -2253,6 +2258,39 @@ static void drm_tile_group_free(struct kref *k=
ref)
> > >       kfree(tg);
> > >  }
> > >
> > > +/**
> > > + * drm_connector_init_privacy_screen_property -
> > > + *   create and attach the connecter's privacy-screen property.
> > > + * @connector: connector for which to init the privacy-screen proper=
ty.
> > > + *
> > > + * This function creates and attaches the "privacy-screen" property =
to the
> > > + * connector. Initial state of privacy-screen is set to disabled.
> > > + *
> > > + * Returns:
> > > + * Zero on success, negative errno on failure.
> > > + */
> > > +int drm_connector_init_privacy_screen_property(struct drm_connector =
*connector)
> > > +{
> > > +     struct drm_device *dev =3D connector->dev;
> > > +     struct drm_property *prop;
> > > +
> > > +     prop =3D dev->mode_config.privacy_screen_property;
> > > +     if (!prop) {
> > > +             prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_EN=
UM,
> > > +                             "privacy-screen", drm_privacy_screen_en=
um_list,
> >
> > Seems to me like the -screen suffix here is somewhat redundant. Yes, the
> > thing that we enable/disable may be called a "privacy screen", but the
> > property that we enable/disable on the connector is the "privacy" of the
> > user. I'd reflect that in all the related variable names and so on as
> > well.
>=20
> IMHO a property called "privacy" may be a little generic for the users
> to understand what it is. For e.g. when I started looking at code, I
> found the "Content Protection" property and I got confused thinking
> may be it provides something similar to what I'm trying to do. I think
> "privacy-screen" conveys the complete context without being long, so
> there is no confusion or ambiguity. But I don't mind changing it if a
> property "privacy" is what people think is better to convey what it
> is, as long as it is clear to user.

This being a property of a display connector it doesn't seem very
ambiguous to me what this is. How this ends up being presented to the
users is mostly orthogonal anyway. We've got a bunch of properties whose
purpose may not be clear to the average user. The properties, while they
are UABI, don't typically face the user directly. They're still part of
an API, so as long as they are properly documented there shouldn't be
any ambiguities.

> >
> > > +                             ARRAY_SIZE(drm_privacy_screen_enum_list=
));
> > > +             if (!prop)
> > > +                     return -ENOMEM;
> > > +
> > > +             dev->mode_config.privacy_screen_property =3D prop;
> > > +     }
> > > +
> > > +     drm_object_attach_property(&connector->base, prop,
> > > +                                DRM_PRIVACY_SCREEN_DISABLED);
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_connector_init_privacy_screen_property);
> > > +
> > >  /**
> > >   * drm_mode_put_tile_group - drop a reference to a tile group.
> > >   * @dev: DRM device
> > > diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/d=
rm_privacy_screen.c
> > > new file mode 100644
> > > index 000000000000..1d68e8aa6c5f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_privacy_screen.c
> > > @@ -0,0 +1,176 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * DRM privacy Screen code
> > > + *
> > > + * Copyright =C2=A9 2019 Google Inc.
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/pci.h>
> > > +
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +#define DRM_CONN_DSM_REVID 1
> > > +
> > > +#define DRM_CONN_DSM_FN_PRIVACY_GET_STATUS   1
> > > +#define DRM_CONN_DSM_FN_PRIVACY_ENABLE               2
> > > +#define DRM_CONN_DSM_FN_PRIVACY_DISABLE              3
> > > +
> > > +static const guid_t drm_conn_dsm_guid =3D
> > > +     GUID_INIT(0xC7033113, 0x8720, 0x4CEB,
> > > +               0x90, 0x90, 0x9D, 0x52, 0xB3, 0xE5, 0x2D, 0x73);
> > > +
> > > +/*
> > > + * Makes _DSM call to set privacy screen status or get privacy scree=
n. Return
> > > + * value matters only for PRIVACY_GET_STATUS case. Returns 0 if disa=
bled, 1 if
> > > + * enabled.
> > > + */
> > > +static int acpi_privacy_screen_call_dsm(acpi_handle conn_handle, u64=
 func)
> > > +{
> > > +     union acpi_object *obj;
> > > +     int ret =3D 0;
> > > +
> > > +     obj =3D acpi_evaluate_dsm(conn_handle, &drm_conn_dsm_guid,
> > > +                             DRM_CONN_DSM_REVID, func, NULL);
> > > +     if (!obj) {
> > > +             DRM_DEBUG_DRIVER("failed to evaluate _DSM for fn %llx\n=
", func);
> > > +             /* Can't do much. For get_val, assume privacy_screen di=
sabled */
> > > +             goto done;
> > > +     }
> > > +
> > > +     if (func =3D=3D DRM_CONN_DSM_FN_PRIVACY_GET_STATUS &&
> > > +         obj->type =3D=3D ACPI_TYPE_INTEGER)
> > > +             ret =3D !!obj->integer.value;
> > > +done:
> > > +     ACPI_FREE(obj);
> > > +     return ret;
> > > +}
> > > +
> > > +void drm_privacy_screen_set_val(struct drm_connector *connector,
> > > +                              enum drm_privacy_screen val)
> > > +{
> > > +     acpi_handle acpi_handle =3D connector->privacy_screen_handle;
> > > +
> > > +     if (!acpi_handle)
> > > +             return;
> > > +
> > > +     if (val =3D=3D DRM_PRIVACY_SCREEN_DISABLED)
> > > +             acpi_privacy_screen_call_dsm(acpi_handle,
> > > +                                          DRM_CONN_DSM_FN_PRIVACY_DI=
SABLE);
> > > +     else if (val =3D=3D DRM_PRIVACY_SCREEN_ENABLED)
> > > +             acpi_privacy_screen_call_dsm(acpi_handle,
> > > +                                          DRM_CONN_DSM_FN_PRIVACY_EN=
ABLE);
> > > +}
> > > +
> > > +enum drm_privacy_screen drm_privacy_screen_get_val(struct drm_connec=
tor
> > > +                                                *connector)
> > > +{
> > > +     acpi_handle acpi_handle =3D connector->privacy_screen_handle;
> > > +
> > > +     if (acpi_handle &&
> > > +         acpi_privacy_screen_call_dsm(acpi_handle,
> > > +                                      DRM_CONN_DSM_FN_PRIVACY_GET_ST=
ATUS))
> > > +             return DRM_PRIVACY_SCREEN_ENABLED;
> > > +
> > > +     return DRM_PRIVACY_SCREEN_DISABLED;
> > > +}
> > > +
> > > +/*
> > > + * See ACPI Spec v6.3, Table B-2, "Display Type" for details.
> > > + * In short, these macros define the base _ADR values for ACPI nodes
> > > + */
> > > +#define ACPI_BASE_ADR_FOR_OTHERS     (0ULL << 8)
> > > +#define ACPI_BASE_ADR_FOR_VGA                (1ULL << 8)
> > > +#define ACPI_BASE_ADR_FOR_TV         (2ULL << 8)
> > > +#define ACPI_BASE_ADR_FOR_EXT_MON    (3ULL << 8)
> > > +#define ACPI_BASE_ADR_FOR_INTEGRATED (4ULL << 8)
> > > +
> > > +#define ACPI_DEVICE_ID_SCHEME                (1ULL << 31)
> > > +#define ACPI_FIRMWARE_CAN_DETECT     (1ULL << 16)
> > > +
> > > +/*
> > > + * Ref: ACPI Spec 6.3
> > > + * https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan=
30.pdf
> > > + * Pages 1119 - 1123 describe, what I believe, a standard way of
> > > + * identifying / addressing "display panels" in the ACPI. Thus it pr=
ovides
> > > + * a way for the ACPI to define devices for the display panels attac=
hed
> > > + * to the system. It thus provides a way for the BIOS to export any =
panel
> > > + * specific properties to the system via ACPI (like device trees).
> > > + *
> > > + * The following function looks up the ACPI node for a connector and=
 links
> > > + * to it. Technically it is independent from the privacy_screen code=
, and
> > > + * ideally may be called for all connectors. It is generally a good =
idea to
> > > + * be able to attach an ACPI node to describe anything if needed. (T=
his can
> > > + * help in future for other panel specific features maybe). However,=
 it
> > > + * needs a "port index" which I believe is the index within a partic=
ular
> > > + * type of port (Ref to the pages of spec mentioned above). This por=
t index
> > > + * unfortunately is not available in DRM code, so currently its call=
 is
> > > + * originated from i915 driver.
> > > + */
> > > +static int drm_connector_attach_acpi_node(struct drm_connector *conn=
ector,
> > > +                                       u8 port_index)
> > > +{
> > > +     struct device *dev =3D &connector->dev->pdev->dev;
> > > +     struct acpi_device *conn_dev;
> > > +     u64 conn_addr;
> > > +
> > > +     /*
> > > +      * Determine what _ADR to look for, depending on device type and
> > > +      * port number. Potentially we only care about the
> > > +      * eDP / integrated displays?
> > > +      */
> > > +     switch (connector->connector_type) {
> > > +     case DRM_MODE_CONNECTOR_eDP:
> > > +             conn_addr =3D ACPI_BASE_ADR_FOR_INTEGRATED + port_index;
> > > +             break;
> > > +     case DRM_MODE_CONNECTOR_VGA:
> > > +             conn_addr =3D ACPI_BASE_ADR_FOR_VGA + port_index;
> > > +             break;
> > > +     case DRM_MODE_CONNECTOR_TV:
> > > +             conn_addr =3D ACPI_BASE_ADR_FOR_TV + port_index;
> > > +             break;
> > > +     case DRM_MODE_CONNECTOR_DisplayPort:
> > > +             conn_addr =3D ACPI_BASE_ADR_FOR_EXT_MON + port_index;
> > > +             break;
> > > +     default:
> > > +             return -ENOTSUPP;
> > > +     }
> > > +
> > > +     conn_addr |=3D ACPI_DEVICE_ID_SCHEME;
> > > +     conn_addr |=3D ACPI_FIRMWARE_CAN_DETECT;
> > > +
> > > +     DRM_DEV_DEBUG(dev, "%s: Finding drm_connector ACPI node at _ADR=
=3D%llX\n",
> > > +                   __func__, conn_addr);
> > > +
> > > +     /* Look up the connector device, under the PCI device */
> > > +     conn_dev =3D acpi_find_child_device(ACPI_COMPANION(dev),
> > > +                                       conn_addr, false);
> > > +     if (!conn_dev)
> > > +             return -ENODEV;
> > > +
> > > +     connector->privacy_screen_handle =3D conn_dev->handle;
> > > +     return 0;
> > > +}
> > > +
> > > +bool drm_privacy_screen_present(struct drm_connector *connector, u8 =
port_index)
> >
> > This is the main part that I think is a little tangled. This is a very
> > specific implementation that hides in a generic API.
>=20
> I agree that this is an ACPI specific implementation, but other than
> that, I think it does not have any driver specific details. More
> detailed thoughts on this below.

Well, the port_index kind of ties this to i915 because that uses this
concept. Other drivers may not.

Also, I'm wondering if you couldn't somehow derive the port_index from
the connector. If all this does is to find an ACPI node corresponding to
a connector, shouldn't the connector really be all that you need?

> > I we store the privacy setting in the atomic state, there isn't really a
> > reason to store the privacy handle in the connector. Instead it could be
> > simply stored in the driver that supports this.
> >
> > Ideally I think we'd have a very small drm_privacy_screen object type
> > that would just wrap this, but perhaps we don't need that right away,
> > given that we only have a single implementation so far.
>=20
> Yes, agreed.
>=20
> >
> > However, I think if we just pushed this specific implementation into the
> > drivers that'd help pave the way for something more generic later on
> > without a lot of extra work up front.
> >
> > For example you could turn the drm_connector_attach_acpi_node() into a
> > helper that simply returns the ACPI handle, something like this perhaps:
> >
> >         struct acpi_handle *drm_acpi_find_privacy_screen(struct drm_con=
nector *connector,
> >                                                          unsigned int p=
ort)
> >         {
> >                 ...
> >         }
>=20
> Yes, I like that idea of making it a helper function. In fact, finding
> an ACPI node for the connector doesn't have to do anything with
> privacy screen (so it can be used for other purposes also, in future).

Looks like I misunderstood the purpose of that function. You store the
ACPI handle as connector->privacy_screen_handle, so I was assuming that
it was getting an ACPI handle for some privacy screen subdevice.

> > That the i915 driver would then call and store the returned value
> > internally. When it commits the atomic state for the connector it can
> > then call the drm_acpi_set_privacy() (I think that'd be a better name
> > for your drm_privacy_screen_set_val()) by passing that handle and the
> > value from the atomic state.
> >
> > The above has the advantage that we don't clutter the generic core with
> > something that's not at all generic. If eventually we see that these
> > types of privacy screens are implemented in more device we can always
> > refactor this into something really generic and maybe even decide to put
> > it into the drm_connector directly.
>=20
> This is where I think I'm in slight disagreement. I think the
> functionality we're adding is still "generic", just that the only
> hardware *I have today* to test is using Intel eDP ports. But I don't
> see why AMD CPU laptops can't have it (For E.g. HP's Elitebook 745 G5
> seems to use AMD and has integrated privacy screen feature
> http://www8.hp.com/h20195/V2/GetPDF.aspx/4aa7-2802eee) .
> My worry is that if we don't make it generic today, we might see
> duplicate / similar-but-different / different ways of this in other
> places (e.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D110ea1d833ad)
> because unless it is generic to start with, it is difficult for some
> one to change later for the fear of breaking hardware that is already
> in market given that
>  * hardware may not be available to new developer to test for
> regressions (also there is very little motivation to check any
> hardware other than your own).
>  * specially for a code that relies on firmware ACPI (firmware
> upgrades in field are always costly).
>=20
> My understanding is that we're adding 2 functionalities here:
>=20
> 1) Identify and Attach ACPI node to DRM connector. Since this is
> following ACPI spec, I think this is  generic enough.

It's probably worth making this a separate patch in that case. If the
ACPI handle really represents the connector itself, then it seems fine
to store it in the connector. But it shouldn't be called privacy_screen
in that case.

> 2) Use ACPI _DSM mthods to identify screen, set and get values. This
> is where I think we're setting (generic) expectations for the ACPI
> methods in how they should behave if ACPI is to be used to control
> privacy screen. If we put this in generic code today, future
> developers can look at this to understand how their ACPI for new
> platforms is to behave if they want to use this generic code. If we
> put it in i915 specific code, this will be seen as driver specific
> behavior and developers may choose some other behavior in their
> driver.

I think it's fine to put this functionality into generic code. What I
don't think is good to do is to have this code called from generic code.
It's opt-in functionality that drivers should call if they know that the
connector has an associated ACPI handle that can be used for privacy
screen control.

After reading the patch again and realizing that you're not actually
dealing with an ACPI handle to the privacy screen directly but one for
the connector, I think this is okay. You do in fact call into this from
the i915 only. I still don't think the naming is great, and it'd be nice
to see ACPI as part of the function name to make that explicit. We could
always address that at a later point, but may as well do it right from
the start.

> I agree that the functionality we're adding is ACPI specific (today -
> but can be extended to gpio in future for non x86 platforms), but not
> necessarily driver specific. Actually the only reason, I had to call
> the drm_privacy_screen_present() (and the
> drm_init_privacy_screen_property()) function from i915 code is because
> we need a port_index to lookup ACPI node. If we had that available in
> drm code, we wouldn't need to call anything from i915 at all.

You're kind of proving my point about this API being driver-specific, or
at least ACPI specific. Non-ACPI devices (maybe even non-i915 devices?)
may not have a concept of a port index. Encoding this in the API makes
the API non-generic.

As I mentioned above, if we could derive the port index from the
connector, that'd be much better. Could you perhaps use drm_connector's
index field?

Unless there's a way to reliably detect this type of functionality from
generic code, I think it should always be called from the driver.

> So, for the reasons stated above, IMHO it is better to retain this
> functionality in drm code instead of i915 driver. But I'm new to the
> drm / i915 code, and would be happy to change my code if people have
> strong opinions about this. Let me know.

Maybe I was being unclear. I wasn't arguing that all the code should be
moved into the i915 driver. All I was saying that instead of storing the
ACPI handle inside struct drm_connector, we should maybe store it inside
the i915 driver's connector structure. struct drm_connector is a very
generic concept and each and every connector object on every platform
will get that ACPI handle pointer if you add it there. I don't think an
ACPI handle belongs there. For example, on ARM SoCs it's common to have
connectors be backed by a struct device (or struct platform_device more
specifically). But we don't put that information into drm_connector
because PCI graphics adapters don't have a struct device that represents
the connector.

Thierry

>=20
> Thanks & Best Regards,
>=20
> Rajat
>=20
> >
> > > +{
> > > +     acpi_handle handle;
> > > +
> > > +     if (drm_connector_attach_acpi_node(connector, port_index))
> > > +             return false;
> > > +
> > > +     handle =3D connector->privacy_screen_handle;
> > > +     if (!acpi_check_dsm(handle, &drm_conn_dsm_guid,
> > > +                         DRM_CONN_DSM_REVID,
> > > +                         1 << DRM_CONN_DSM_FN_PRIVACY_GET_STATUS |
> > > +                         1 << DRM_CONN_DSM_FN_PRIVACY_ENABLE |
> > > +                         1 << DRM_CONN_DSM_FN_PRIVACY_DISABLE)) {
> > > +             DRM_WARN("%s: Odd, connector ACPI node but no privacy s=
crn?\n",
> > > +                      connector->dev->dev);
> > > +             return false;
> > > +     }
> > > +     DRM_DEV_INFO(connector->dev->dev, "supports privacy screen\n");
> > > +     return true;
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/dr=
m/i915/display/intel_dp.c
> > > index 57e9f0ba331b..3ff3962d27db 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -39,6 +39,7 @@
> > >  #include <drm/drm_dp_helper.h>
> > >  #include <drm/drm_edid.h>
> > >  #include <drm/drm_hdcp.h>
> > > +#include <drm/drm_privacy_screen.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/i915_drm.h>
> > >
> > > @@ -6354,6 +6355,8 @@ intel_dp_add_properties(struct intel_dp *intel_=
dp, struct drm_connector *connect
> > >
> > >               connector->state->scaling_mode =3D DRM_MODE_SCALE_ASPEC=
T;
> > >
> > > +             if (drm_privacy_screen_present(connector, port - PORT_A=
))
> > > +                     drm_connector_init_privacy_screen_property(conn=
ector);
> > >       }
> > >  }
> > >
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 681cb590f952..63b8318bd68c 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -225,6 +225,20 @@ enum drm_link_status {
> > >       DRM_LINK_STATUS_BAD =3D DRM_MODE_LINK_STATUS_BAD,
> > >  };
> > >
> > > +/**
> > > + * enum drm_privacy_screen - privacy_screen status
> > > + *
> > > + * This enum is used to track and control the state of the privacy s=
creen.
> > > + * There are no separate #defines for the uapi!
> > > + *
> > > + * @DRM_PRIVACY_SCREEN_DISABLED: The privacy-screen on the panel is =
disabled
> > > + * @DRM_PRIVACY_SCREEN_ENABLED:  The privacy-screen on the panel is =
enabled
> > > + */
> > > +enum drm_privacy_screen {
> > > +     DRM_PRIVACY_SCREEN_DISABLED =3D 0,
> > > +     DRM_PRIVACY_SCREEN_ENABLED =3D 1,
> > > +};
> > > +
> >
> > Shouldn't this go into include/uapi/drm/drm_mode.h? That would have the
> > advantage of giving userspace symbolic names to use when setting the
> > property.
> >
> > Maybe also rename these to something like:
> >
> >         #define DRM_MODE_PRIVACY_DISABLED 0
> >         #define DRM_MODE_PRIVACY_ENABLED 1
> >
> > for consistency with other properties.
> >
> > Thierry
> >
> > >  /**
> > >   * enum drm_panel_orientation - panel_orientation info for &drm_disp=
lay_info
> > >   *
> > > @@ -1410,6 +1424,9 @@ struct drm_connector {
> > >
> > >       /** @hdr_sink_metadata: HDR Metadata Information read from sink=
 */
> > >       struct hdr_sink_metadata hdr_sink_metadata;
> > > +
> > > +     /* Handle used by privacy screen code */
> > > +     void *privacy_screen_handle;
> > >  };
> > >
> > >  #define obj_to_connector(x) container_of(x, struct drm_connector, ba=
se)
> > > @@ -1543,6 +1560,7 @@ int drm_connector_init_panel_orientation_proper=
ty(
> > >       struct drm_connector *connector, int width, int height);
> > >  int drm_connector_attach_max_bpc_property(struct drm_connector *conn=
ector,
> > >                                         int min, int max);
> > > +int drm_connector_init_privacy_screen_property(struct drm_connector =
*connector);
> > >
> > >  /**
> > >   * struct drm_tile_group - Tile group metadata
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_con=
fig.h
> > > index 3bcbe30339f0..6d5d23da90d4 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -813,6 +813,13 @@ struct drm_mode_config {
> > >        */
> > >       struct drm_property *panel_orientation_property;
> > >
> > > +     /**
> > > +      * @privacy_screen_property: Optional connector property to ind=
icate
> > > +      * and control the state (enabled / disabled) of privacy-screen=
 on the
> > > +      * panel, if present.
> > > +      */
> > > +     struct drm_property *privacy_screen_property;
> > > +
> > >       /**
> > >        * @writeback_fb_id_property: Property for writeback connectors=
, storing
> > >        * the ID of the output framebuffer.
> > > diff --git a/include/drm/drm_privacy_screen.h b/include/drm/drm_priva=
cy_screen.h
> > > new file mode 100644
> > > index 000000000000..c589bbc47656
> > > --- /dev/null
> > > +++ b/include/drm/drm_privacy_screen.h
> > > @@ -0,0 +1,33 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > +/*
> > > + * Copyright =C2=A9 2019 Google Inc.
> > > + */
> > > +
> > > +#ifndef __DRM_PRIVACY_SCREEN_H__
> > > +#define __DRM_PRIVACY_SCREEN_H__
> > > +
> > > +#ifdef CONFIG_ACPI
> > > +bool drm_privacy_screen_present(struct drm_connector *connector, u8 =
port);
> > > +void drm_privacy_screen_set_val(struct drm_connector *connector,
> > > +                             enum drm_privacy_screen val);
> > > +enum drm_privacy_screen drm_privacy_screen_get_val(struct drm_connec=
tor
> > > +                                                *connector);
> > > +#else
> > > +static inline bool drm_privacy_screen_present(struct drm_connector *=
connector,
> > > +                                           u8 port)
> > > +{
> > > +     return false;
> > > +}
> > > +
> > > +void drm_privacy_screen_set_val(struct drm_connector *connector,
> > > +                             enum drm_privacy_screen val)
> > > +{ }
> > > +
> > > +enum drm_privacy_screen drm_privacy_screen_get_val(
> > > +                                     struct drm_connector *connector)
> > > +{
> > > +     return DRM_PRIVACY_SCREEN_DISABLED;
> > > +}
> > > +#endif /* CONFIG_ACPI */
> > > +
> > > +#endif /* __DRM_PRIVACY_SCREEN_H__ */
> > > --
> > > 2.23.0.866.gb869b98d4c-goog
> > >

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2y3iYACgkQ3SOs138+
s6EmkhAAuJSOM7GO5u7RaQ3rnTFZlrkLCN85LRx1P8P6Crflg+ADlg7d7v5Q3HZ3
I4uwD5KquKoj0HvaqJ4FSXJvJUISRA8CnFQdEG+rOXXLwRrExoh5EpGTxxa1rt0A
tQECVkQ5H8YnSjNMyWKU1ruIQW31bMdmi68j1s6Gxx5IJg8pkzTeLdO1qE97L1Y1
DHvJQUJ/OPJ+eSrVp4Y7Uujv6jXtK9KrjtNSChEV3IcYiwv5LCZ0oeEL9JhHdsBa
uvNoVCR45lSZJONj6aHqGuIeX2NWaIBVUAj5znZbHwIZXWypSLpnbQtUBdQTDh+v
AYPUmI7FXBDGWW3AGYNdRjqHoTLB7865u+gCNhTYoEw2fFRcVaz3X0hSCt4gGyQI
u6v9Y7uf/oA/ADzTh+mQ4ms+iQrZRIO6NrCnISYcoaiGzvstO0t4zk1IIFMRuBmz
/CSsFwuM11vbFaRmbiWtvtV8Az+hYIFYNWhmLO2cuCHQ8VU8DTVCo73jn2XrbWj8
GTeA2d/B7ko9yn3DThknHfgX9VEv5m0oPKvD50ll3+85DA+endi/8UJ82zdKLgJd
SOti116yIDsiv31o8oevtD56T4F6FB80arYHD49zIN7QN5Mk3hboeNlfvDtSN5Oe
y/JC5J+T5uNoMkJe8z5tMRGFgWFt9P5vGelGEvn+LgXXIgHzbC0=
=x6+l
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--

--===============1516204577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1516204577==--
