Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D81A10B5B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717D10E3B3;
	Tue, 14 Jan 2025 15:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DXpj6b4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD94510E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:45:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83BD45C4C8F;
 Tue, 14 Jan 2025 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7956EC4CEE3;
 Tue, 14 Jan 2025 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736869512;
 bh=7KsIiV/qLedMQq1VJcBZqRlB1yQhBgZvgW69zceiEbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXpj6b4cmKF+Q6T4gxkM3tgQk/3EFW/ypRFg6Cfkylq1iNYh4aTmhRFSU2/zCxtcw
 +7L6aPmyFVkZogwUs+CLuCB6n1vPJRcxrZVqXyuMl+F+fURdMbFw1tRC8Qw4MJMMeg
 ggCJWhn+1FPguv82o4nz9xH/2LBmdUaf/QPcxYCRcRozwTgQ/rddHrapzVGj5/jF+J
 dGKpRZBEILt5lwT4eTa3yWwUi1tFgJkAuRu/FEu2V16KTinWCP8K/53GrlWBhSnu+g
 Etc4twIzlMzu5vglX1wllJlxU/4DqGqucKDv6iuRbE5npNBs3LG3+SYdUf+SU+oI7Q
 L8lek1jDj8tZA==
Date: Tue, 14 Jan 2025 16:45:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
Message-ID: <20250114-wandering-curly-manul-67ced4@houat>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
 <20250107-psychedelic-earthworm-of-action-cf5ceb@houat>
 <CAA8EJppxnVuVL9LH1Ars0=SKBM1L05Z5KwA_z1_+=dBugfrL-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sc6j53lo7pqlq2st"
Content-Disposition: inline
In-Reply-To: <CAA8EJppxnVuVL9LH1Ars0=SKBM1L05Z5KwA_z1_+=dBugfrL-g@mail.gmail.com>
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


--sc6j53lo7pqlq2st
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 06:18:07PM +0200, Dmitry Baryshkov wrote:
> On Tue, 7 Jan 2025 at 16:32, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Wed, Dec 25, 2024 at 01:10:10AM +0200, Dmitry Baryshkov wrote:
> > > Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> > > and adapter are supported for registration. Once registered, the driv=
er
> > > can call common set of functions to update physical address, to
> > > invalidate it or to unregister CEC data.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/display/Kconfig               |   5 +
> > >  drivers/gpu/drm/display/Makefile              |   2 +
> > >  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 145 ++++++++++++++++=
++++++++++
> > >  include/drm/display/drm_hdmi_cec_helper.h     |  38 +++++++
> > >  4 files changed, 190 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/displa=
y/Kconfig
> > > index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2c=
efae4bb042cfd57a50c 100644
> > > --- a/drivers/gpu/drm/display/Kconfig
> > > +++ b/drivers/gpu/drm/display/Kconfig
> > > @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
> > >         DRM display helpers for HDMI Audio functionality (generic HDM=
I Codec
> > >         implementation).
> > >
> > > +config DRM_DISPLAY_HDMI_CEC_HELPER
> > > +     bool
> > > +     help
> > > +       DRM display helpers for HDMI CEC implementation.
> > > +
> > >  config DRM_DISPLAY_HDMI_HELPER
> > >       bool
> > >       help
> > > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/displ=
ay/Makefile
> > > index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336=
c4187b444bcb8a50e51 100644
> > > --- a/drivers/gpu/drm/display/Makefile
> > > +++ b/drivers/gpu/drm/display/Makefile
> > > @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER)=
 +=3D \
> > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) +=3D drm_hdcp_h=
elper.o
> > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) +=3D \
> > >       drm_hdmi_audio_helper.o
> > > +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) +=3D \
> > > +     drm_hdmi_cec_helper.o
> > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) +=3D \
> > >       drm_hdmi_helper.o \
> > >       drm_scdc_helper.o
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/=
gpu/drm/display/drm_hdmi_cec_helper.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..2a3832e68232fa3b839a3=
c7457b2013779cada86
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > > @@ -0,0 +1,145 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright (c) 2024 Linaro Ltd
> > > + */
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/display/drm_hdmi_cec_helper.h>
> > > +
> > > +#include <linux/mutex.h>
> > > +
> > > +#include <media/cec.h>
> > > +#include <media/cec-notifier.h>
> > > +
> > > +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_con=
nector *connector)
> > > +{
> > > +     cec_unregister_adapter(connector->cec.adapter);
> > > +     connector->cec.adapter =3D NULL;
> > > +     connector->cec.unregister =3D NULL;
> > > +}
> > > +
> > > +int drm_connector_hdmi_cec_adapter_register(struct drm_connector *co=
nnector,
> > > +                                         const struct cec_adap_ops *=
ops,
> > > +                                         const char *name,
> > > +                                         u8 available_las,
> > > +                                         int (*init_cec)(struct drm_=
connector *connector),
> > > +                                         void (*uninit_cec)(struct d=
rm_connector *connector),
> > > +                                         struct device *dev)
> >
> > We're missing a documentation here. Why do we need drivers to pass both
> > a set of cec_adap_ops and a bunch of extra functions? Shouldn't we make
> > this a single structure like we did for audio?
>=20
> Also might be an option, I didn't want to add extra wrappers in the
> first place, but I can add them.
>=20
> >
> > Also, to remain consistent, we should call that function drm_connector_=
hdmi_cec_register
>=20
> I wanted to point out the _adapter_ part, because we also have
> whatever_cec_notifier_register() and at some point we might also get
> whatever_cec_pin_register() if we wrap sun4i implementation too.

I think we can get away with drm_connector_hdmi_cec_register,
drm_connector_hdmi_cec_pin_register (or bitbanged, or polled, or gpio,
or whatever), and drm_connector_hdmi_cec_notifier_register

Maxime

--sc6j53lo7pqlq2st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4aGhAAKCRAnX84Zoj2+
dlPSAYD3RMSZf+1hDLxquBvUR8O4P85YimR7y6exeBbP9opybZ1OEhdhXoX21FwH
q67pbnwBgJoqDpVoXOAsQzhvSxDzmOV+OKeVlvs1H86r5QxQ3UQuiXdXCmzHzmy2
R0MsgwBiaQ==
=8edy
-----END PGP SIGNATURE-----

--sc6j53lo7pqlq2st--
