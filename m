Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1A209CE6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 12:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909246EA44;
	Thu, 25 Jun 2020 10:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D046EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 10:32:10 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so2918513lfe.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 03:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+Z6VNGt9z3xv0ZcVCfN7KPrYK3I7z8tuTUC2LU7MuF4=;
 b=RXyRcSxXuPF0EN+oGBho+nA6RmiP/TIvJZbOCNGa/Pa7RdfQNstOLoZDWB1BmzHynq
 BFHYRY7AOTYfjgClkW2Z4W3k0fMYlOEebXv4bZ/LxjnHt8imUttQTr3T9/Gfx0cfpzBl
 mZWRCJJKWe9WWZLVsiAlERjL3I0x/LMp1XoEsCf9bVsmXZiCBur0uYpHfd0Az4b6Lqmo
 1VMHtC5zDpQfUJQ3bO1w4JUnaQ2L3lIxI/F8Fb99kpkYtFOJuZuuYQxOj5X3ZyFYm+9/
 ldX7QmtGY45vARXaFI3rhysjzxKKSSutALyDTTVOrhgkQEltbNZnomuDE3pNBSx/U1y4
 9DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+Z6VNGt9z3xv0ZcVCfN7KPrYK3I7z8tuTUC2LU7MuF4=;
 b=rUY84lU7h95CB9qQQ08Jl87lh50LOqxkQPtOl/vG8cp92ULpCZTVfpTONwNLvGePNQ
 LS7cyfL9bM+o534ZTFNtkg6Br8ZJGTu4MTYx7b9GQ8OV1Mq1STjujkfI097+IFvAJn1a
 LhZD0KnM3SwttolKiJpNYT13xtbXHDV9RW/x8Uwxv9lKCtu8PRdGRRd3ayynInLT7eCw
 o3eenfAX5QEuoWU/jvd57QgNzntpo6T3FB3+lM/Df2/QDiDrwvZ6viO0M6Us7twZ02lM
 dkxvDpk2Kuv8bTTZOI09LBDynquTHEJmMFpgK5HMfm2rNCqXtCpkZAPZqBfL0FPb6VMT
 qBEw==
X-Gm-Message-State: AOAM530eo7EX4JqsothJbpl28MTg3FjYCP9ijoHTZCq1/zTofwJGOJ61
 QNja/z8lUqokbG5Ppgl8BEA=
X-Google-Smtp-Source: ABdhPJyKZOsOjWNeBiikD6RKFubBSP9qJ2tsD2t8Kpuh6IcOdpGF0c3dFBGHVkEh0fSAaJtKNQymRg==
X-Received: by 2002:a05:6512:3226:: with SMTP id
 f6mr18042900lfe.180.1593081128599; 
 Thu, 25 Jun 2020 03:32:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v3sm677030ljc.96.2020.06.25.03.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 03:32:08 -0700 (PDT)
Date: Thu, 25 Jun 2020 13:31:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200625133157.0e749602@eldfell>
In-Reply-To: <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
 <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local>
 <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============2102161138=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2102161138==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GHvRnnZvcYp.p3ts9in0XWh"; protocol="application/pgp-signature"

--Sig_/GHvRnnZvcYp.p3ts9in0XWh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Jun 2020 09:57:44 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jun 25, 2020 at 9:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jun 24, 2020 at 03:40:42PM -0400, Alex Deucher wrote: =20
> > > On Wed, Jun 24, 2020 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote=
: =20
> > > >
> > > > On Wed, Jun 24, 2020 at 5:24 PM Alex Deucher <alexdeucher@gmail.com=
> wrote: =20
> > > > >
> > > > > On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> w=
rote: =20
> > > > > >
> > > > > > On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrot=
e: =20
> > > > > > > Hi Sam,
> > > > > > >
> > > > > > > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:=
 =20
> > > > > > > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart =
wrote: =20
> > > > > > > > > The DRM CRTC helpers add default modes to connectors in t=
he connected
> > > > > > > > > state if no mode can be retrieved from the connector. Thi=
s behaviour is
> > > > > > > > > useful for VGA or DVI outputs that have no connected DDC =
bus. However,
> > > > > > > > > in such cases, the status of the output usually can't be =
retrieved and
> > > > > > > > > is reported as connector_status_unknown.
> > > > > > > > >
> > > > > > > > > Extend the addition of default modes to connectors in an =
unknown state
> > > > > > > > > to support outputs that can retrieve neither the modes no=
r the
> > > > > > > > > connection status.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas=
@ideasonboard.com> =20
> > > > > > > >
> > > > > > > > From your description sounds like an OK approach.
> > > > > > > > But this is not something I feel too familiar with.
> > > > > > > > Acked-by: Sam Ravnborg <sam@ravnborg.org> =20
> > > > > > >
> > > > > > > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedbac=
k on this
> > > > > > > too. =20
> > > > > >
> > > > > > Makes sense, and at least pre-coffee me can't immediately think=
 of a
> > > > > > scenario where we're going to regret this. _unknown status is p=
retty much
> > > > > > limited to old VGA and similar things where load detect somehow=
 isn't well
> > > > > > supported by the hw.
> > > > > >
> > > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > =20
> > > > > > > =20
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > > > > > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > > > > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers=
/gpu/drm/drm_probe_helper.c
> > > > > > > > > index f5d141e0400f..9055d9573c90 100644
> > > > > > > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > > > > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector=
_modes(struct drm_connector *connector,
> > > > > > > > >   if (count =3D=3D 0 && connector->status =3D=3D connecto=
r_status_connected)
> > > > > > > > >           count =3D drm_add_override_edid_modes(connector=
);
> > > > > > > > >
> > > > > > > > > - if (count =3D=3D 0 && connector->status =3D=3D connecto=
r_status_connected)
> > > > > > > > > + if (count =3D=3D 0 && (connector->status =3D=3D connect=
or_status_connected ||
> > > > > > > > > +                    connector->status =3D=3D connector_s=
tatus_unknown))
> > > > > > > > >           count =3D drm_add_modes_noedid(connector, 1024,=
 768);
> > > > > > > > >   count +=3D drm_helper_probe_add_cmdline_mode(connector);
> > > > > > > > >   if (count =3D=3D 0)
> > > > > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/i=
nclude/drm/drm_modeset_helper_vtables.h
> > > > > > > > > index 421a30f08463..afe55e2e93d2 100644
> > > > > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > > > > > > >    * The usual way to implement this is to cache the EDID=
 retrieved in the
> > > > > > > > >    * probe callback somewhere in the driver-private conne=
ctor structure.
> > > > > > > > >    * In this function drivers then parse the modes in the=
 EDID and add
> > > > > > > > > -  * them by calling drm_add_edid_modes(). But connectors=
 that driver a
> > > > > > > > > +  * them by calling drm_add_edid_modes(). But connectors=
 that drive a
> > > > > > > > >    * fixed panel can also manually add specific modes usi=
ng
> > > > > > > > >    * drm_mode_probed_add(). Drivers which manually add mo=
des should also
> > > > > > > > >    * make sure that the &drm_connector.display_info,
> > > > > > > > >    * &drm_connector.width_mm and &drm_connector.height_mm=
 fields are
> > > > > > > > >    * filled in.
> > > > > > > > >    *
> > > > > > > > > +  * Note that the caller function will automatically add=
 standard VESA
> > > > > > > > > +  * DMT modes up to 1024x768 if the .get_modes() helper =
operation returns
> > > > > > > > > +  * no mode and if the connector status is connector_sta=
tus_connected or
> > > > > > > > > +  * connector_status_unknown. There is no need to call
> > > > > > > > > +  * drm_add_edid_modes() manually in that case. =20
> > > > > >
> > > > > > Hm calling drm_add_edid_modes if you have no edid is a bit a fu=
nny idea
> > > > > > ... Personally I'd just leave out the last sentence, I think th=
at only
> > > > > > confuses readers. Or I'm not grasphing what you're trying to te=
ll here. =20
> > > > >
> > > > > IIRC, some drivers used and desktop environments expected unknown
> > > > > rather than off for LVDS/eDP panels when the lid was shut or if t=
he
> > > > > mux was switched to another device in the case of hybrid laptops.=
 =20
> > > >
> > > > We seem to have totally ditched that in
> > > >
> > > > commit 05c72e77ccda89ff624108b1b59a0fc43843f343
> > > > Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > Date:   Tue Jul 17 20:42:14 2018 +0300
> > > >
> > > >     drm/i915: Nuke the LVDS lid notifier
> > > >
> > > > No screaming yet.
> > > >
> > > > But I'm also a bit confused, for a panel there's generally an edid
> > > > around, or a fixed (list of) modes. That's enough to stop this
> > > > fallback from running, so should be all fine. =20
> > >
> > > No, you are right; you will have the EDID so this shouldn't be an
> > > issue.  I was mis-remembering the original issue.  We originally
> > > always reported connected for LVDS in radeon if the panel was present,
> > > but then we got flack because some userspace expected unknown in
> > > certain cases (e.g., lid or muxed displays).  Either way the EDID info
> > > is still there. =20
> >
> > Yeah I think i915 started that habit, but I guess people realized it's
> > unreliable enough that they should have their own lid handler in the
> > desktop enviromnent doing whatever they want to do on lid close.
> >
> > Should we perhaps document that somewhere, that panels are always marked
> > as connected? Not even sure where to put that in the docs ...
> >
> > Maybe adding a few of the usual suspects from the compositor side, Simo=
n,
> > Pekka? =20
>=20
> Actually adding Simon and Pekka this time around ...

I don't know what anyone else does, but Weston (is not a DE) does not
look at any lid switch, and assumes that if connector status is not
DRM_MODE_CONNECTED, then it is disconnected. So, if a driver switched
to "Unknown" status, it would be taken as disconnected.

I never knew what "Unknown" was relevant for. In weston.ini you can
also force a connector on, so users could drive it regardless.

However, I would also say that Weston is not supposed to react to any
lid action exactly because it does not watch the lid switch. Personally
I would expect a built-in screen to stay on even if lid closed.

Panels that are always connected showing up as always connected, sounds
good to me.


Thanks,
pq

--Sig_/GHvRnnZvcYp.p3ts9in0XWh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl70fR0ACgkQI1/ltBGq
qqfGNg/8CtPsg3U7yyKbu3BTB88AaPc4oEEWAWlAI/ZCOXznnXDCgR7qL6JIRUdp
82IzZfi28Qt+PzRlGlQlqvubk72C9xE801a4x2SPldfQ3TsjfyPw9Y7ZfBEgZmup
JDsZo1PdQvBQb+tffTygqR4u+Df1XFfiWcBnHTDlVaKDh/6YPT+ruC0wqTlwT94X
y6IxPftPyT4DFIldmr5MphcDUkPC9S5zatVY5n3/IwhzEjWNThvTC2eZCcmS/DGb
+sGkmQcUj4KH5qhoPkTJZBsLmauuTSvwEN1PpRMZHCd1ZcFjxfI9LREkkpV1sMp3
UTmLORx6c+9s6lkAD8wGzPz1u1y7yPHpkuMx9KksFdcmLW0L1lYppr3aXUN5YjQ4
XrmD+iw3PBvR/d2mWyOveHcccnXEGdJPPdLWiqXS9bb6WSXbLuKEy2En8In/naza
BSoBGEJXamXm0L0uRF1TOo4wMoqYUEO3F60Xbu+QAB74p8Pe1TPS/JqnJiWlnqep
r3626Dv0qQ1hzhzxDV1pnsZ8wEAC8ctI9AaO2/Vu8PfpBJwi+nTWPcFyNpFYRbRz
j+jTIFaBT3xzCeOcxYsm2rWrSE2ipAIBY0yg8YQPTdbHYZh2NPKOKBF4W1C++2Za
qYKsDDYfYPObbm0mQB/64ds9lVF4iTzTw5xtqZlL3jfj3HnUr6A=
=xrVP
-----END PGP SIGNATURE-----

--Sig_/GHvRnnZvcYp.p3ts9in0XWh--

--===============2102161138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2102161138==--
