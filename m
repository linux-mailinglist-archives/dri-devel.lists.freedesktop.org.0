Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A626436F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 10:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3CB6E0B9;
	Wed, 10 Jul 2019 08:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065316E0B9;
 Wed, 10 Jul 2019 08:16:37 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t28so1144221lje.9;
 Wed, 10 Jul 2019 01:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=OVKyS85YxSkKVC/zZoYQYFC/FZ7lh6A/TZfl/9bNpNg=;
 b=reNQaIi9EXv3xqindx5D1hQ5Q+x1L2hFGraZz+jDSn3RbxowlGWiLVYNJ4yeIgB1k7
 FBysRpaQUHiMkIOC4z0sNZp3tTFe25S8QmNnaOvBtiTZmge4zo3Zp1mQoMb12ZZBX5bQ
 lwyIyAQyXfo8O4BSkVjQEvts/FNhUjBfpuwff464B9ctjGczPSXo6oy+yrBFoSkXsMeG
 /ynlV/YDco05aRlW3EtgY4NIFKJmNv7WD/GAHTRxMPadfOWqIkoICVn6M0udcMSsFSc2
 OA/518IkpjmC6U7d/BZwxuToWb4MrRpF/NGH1dytYjMLf1KUSq+9dDvf5Sb4qECNbJoh
 tvnA==
X-Gm-Message-State: APjAAAWBHDr178gl06C7Ly85CDS/beZEqW4t6X9QuvMKsCq05rQ7hqSx
 OL9OeQ/yvJ1wHMN1ZWCaOKM=
X-Google-Smtp-Source: APXvYqx3aIjQQ9fCotoLZ8z+vQ8Cpjs4IMpAcj74lc8w9V9FAUaGi8Ab3uvH7WgVTu8CbvSiDU3YOQ==
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr16677904ljh.6.1562746595237;
 Wed, 10 Jul 2019 01:16:35 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s21sm337222ljm.28.2019.07.10.01.16.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 01:16:34 -0700 (PDT)
Date: Wed, 10 Jul 2019 11:16:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v9 1/6] drm: Add Content protection type property
Message-ID: <20190710111624.08e527ed@eldfell.localdomain>
In-Reply-To: <20190709124759.GA28326@intel.com>
References: <20190708112116.1780-1-ramalingam.c@intel.com>
 <20190708112116.1780-2-ramalingam.c@intel.com>
 <20190709173110.1f18338d@eldfell.localdomain>
 <20190709124759.GA28326@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=OVKyS85YxSkKVC/zZoYQYFC/FZ7lh6A/TZfl/9bNpNg=;
 b=YEWRfcLYv39QxXaX3carIbQ+x6M0CrBfVzUSSjMCaSrznm/JvfwSS0lbyLSHxOsy+W
 SAhcbk+9DwCTobNQnAc6HrHXrNKTbnvmbMeQgAEJq+/1FzO88qzk8WIDNVEfCqd297WQ
 0jqnFcnj0CI87+RWPcqIl4U5FBkc7gHfRm20pFQgwIxj5uM3ec9OuxTslQk3DBeadH7c
 wAc3xdv0ldOToZkdRH1dydtGc7gDdTSVGNT1ljsfFzaSJZVnvZ0RQZ2/S6rUHwe/ofFa
 IDXqFoKF4Dmf7LNoeR2iGGK2TaGS+ZhOqPeNe8JnRl9u8Rl94UpROzBJKbTRWDpiLcWA
 neUw==
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0109246798=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0109246798==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NU0TOyKmHxFOryYKL14F/gG"; protocol="application/pgp-signature"

--Sig_/NU0TOyKmHxFOryYKL14F/gG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Jul 2019 18:17:59 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-09 at 17:31:10 +0300, Pekka Paalanen wrote:
> > On Mon,  8 Jul 2019 16:51:11 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > This patch adds a DRM ENUM property to the selected connectors.
> > > This property is used for mentioning the protected content's type
> > > from userspace to kernel HDCP authentication.
> > >=20
> > > Type of the stream is decided by the protected content providers.
> > > Type 0 content can be rendered on any HDCP protected display wires.
> > > But Type 1 content can be rendered only on HDCP2.2 protected paths.
> > >=20
> > > So when a userspace sets this property to Type 1 and starts the HDCP
> > > enable, kernel will honour it only if HDCP2.2 authentication is throu=
gh
> > > for type 1. Else HDCP enable will be failed.
> > >=20
> > > Need ACK for this new conenctor property from userspace consumer.
> > >=20
> > > v2:
> > >   cp_content_type is replaced with content_protection_type [daniel]
> > >   check at atomic_set_property is removed [Maarten]
> > > v3:
> > >   %s/content_protection_type/hdcp_content_type [Pekka]
> > > v4:
> > >   property is created for the first requested connector and then reus=
ed.
> > > 	[Danvet]
> > > v5:
> > >   kernel doc nits addressed [Daniel]
> > >   Rebased as part of patch reordering.
> > > v6:
> > >   Kernel docs are modified [pekka]
> > > v7:
> > >   More details in Kernel docs. [pekka]
> > >=20
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> > >  drivers/gpu/drm/drm_connector.c           | 39 +++++++++++++++++++++=
++
> > >  drivers/gpu/drm/drm_hdcp.c                | 36 ++++++++++++++++++++-
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 ++-
> > >  include/drm/drm_connector.h               |  7 ++++
> > >  include/drm/drm_hdcp.h                    |  2 +-
> > >  include/drm/drm_mode_config.h             |  6 ++++
> > >  include/uapi/drm/drm_mode.h               |  4 +++
> > >  8 files changed, 99 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index abe38bdf85ae..19ae119f1a5d 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -747,6 +747,8 @@ static int drm_atomic_connector_set_property(stru=
ct drm_connector *connector,
> > >  			return -EINVAL;
> > >  		}
> > >  		state->content_protection =3D val;
> > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > +		state->hdcp_content_type =3D val;
> > >  	} else if (property =3D=3D connector->colorspace_property) {
> > >  		state->colorspace =3D val;
> > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > @@ -831,6 +833,8 @@ drm_atomic_connector_get_property(struct drm_conn=
ector *connector,
> > >  			state->hdr_output_metadata->base.id : 0;
> > >  	} else if (property =3D=3D config->content_protection_property) {
> > >  		*val =3D state->content_protection;
> > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > +		*val =3D state->hdcp_content_type;
> > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > >  		/* Writeback framebuffer is one-shot, write and forget */
> > >  		*val =3D 0;
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 068d4b05f1be..732f6645643d 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -952,6 +952,45 @@ static const struct drm_prop_enum_list hdmi_colo=
rspaces[] =3D {
> > >   *	  is no longer protected and userspace should take appropriate ac=
tion
> > >   *	  (whatever that might be).
> > >   *
> > > + * HDCP Content Type:
> > > + *	This Enum property is used by the userspace to declare the conten=
t type
> > > + *	of the display stream, to kernel. Here display stream stands for =
any
> > > + *	display content that userspace intended to render with HDCP encry=
ption. =20
> >=20
> > Hi,
> >=20
> > I'd suggest s/render with/display through/.
> >=20
> > As a gfx dev, rendering is something quite different to me. =20
> Ok.
> >  =20
> > > + *
> > > + *	Content Type of a stream is decided by the owner of the stream, as
> > > + *	"HDCP Type0" or "HDCP Type1".
> > > + *
> > > + *	The value of the property can be one the below: =20
> >=20
> > *one of the below =20
> Sure.
> >  =20
> > > + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> > > + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > > + *
> > > + *	When kernel starts the HDCP authentication upon the "DESIRED" sta=
te of
> > > + *	the "Content Protection", it refers the "HDCP Content Type" prope=
rty
> > > + *	state. And perform the HDCP authentication with the display sink =
for
> > > + *	the content type mentioned by "HDCP Content Type". =20
> >=20
> > How about:
> >=20
> > 	When kernel starts the HDCP authentication (see "Content Protection"
> > 	for details), it uses the content type in "HDCP Content Type"
> > 	for performing the HDCP authentication with the display sink. =20
> less confusing :) Thanks.
> >  =20
> > > + *
> > > + *	Stream classified as HDCP Type0 can be transmitted on a link whic=
h is
> > > + *	encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> > > + *	and more). =20
> >=20
> > This is where I get confused, see my earlier email from today on the
> > previous revision of this patch series. Is it necessary to talk about
> > HDCP versions here? The only thing that matters for UAPI is the content
> > type, right?
> >=20
> > Previously you said that the kernel will not use Type1 if userspace
> > only asked for Type0, but to me this text reads as quite the opposite. =
=20
> Simple. HDCP2.2 itself support both Type 0 and Type 1. where as HDCP1.4
> by default supports the Type 0 and doesn't support the Type 1.
>=20
> I guess you are getting confused by assigning the type to the versions.

Hi,

yes, I am indeed.

Is the HDCP version ever exposed to userspace in any way?

If it is, then explaining how the types relate to the versions may well
be useful. But if userspace cannot even know what HDCP version is being
used or available, explaining it in the UAPI doc seems to just confuse
the reader.

If the reader is interested in HDCP versions, I suppose it is not too
hard to figure out how the types relate to versions on their own,
right? Just search for the definitions of the types in any spec that
defines them.

> >  =20
> > > + *
> > > + *	Streams classified as HDCP Type1 can be transmitted on a link whi=
ch is
> > > + *	encrypted only with HDCP 2.2. In future, HDCP versions >2.2 also =
might
> > > + *	support Type1 based on their spec.
> > > + *
> > > + *	HDCP2.2 authentication protocol itself takes the "Content Type" a=
s a
> > > + *	parameter, which is a input for the DP HDCP2.2 encryption algo.
> > > + *
> > > + *	Note that the HDCP Content Type property is introduced at HDCP 2.=
2, and
> > > + *	defaults to type 0. It is only exposed by drivers supporting HDCP=
 2.2.
> > > + *	Based on how next versions of HDCP specs are defined content Type=
 could
> > > + *	be used for higher versions too. =20
> >=20
> > Ok, userspace does not have to cope with a "HDCP Content Type" property
> > that is missing the enum value Type1. I think the Weston patch would
> > attempt something silly or misbehave if Type1 value was ever missing.
> > Not having the whole property is fine, of course. =20
>  If the Type1 is not supported then there is no need for the "HDCP
>  Content Type" property itself. Thats why when a driver has the support
>  for Type1( as of now HDCP2.2) only then "HDCP Content Type" will be
>  exposed. So weston is fine at its current state.

Yes. I'm just saying that if the kernel ever exposes "HDCP Content
Type" property without the Type1 value (because it may have e.g. Type3
value from the future but does not support Type1), then it will break
userspace.

Adding new enum values is not a problem for the Weston code I have been
reviewing. It simply won't use values it doesn't know, resetting
unknown values to some value it does know.

Setting the rules on both whether enum values can be removed and added
is important for reviewing the userspace, because those need to be
explicitly taken care of in userspace code.

(It's not actually that different from reviewing Wayland protocol
extensions.)


Thanks,
pq

--Sig_/NU0TOyKmHxFOryYKL14F/gG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0lntgACgkQI1/ltBGq
qqdHpQ//XiBK5xpRecqrUjCrDESQw/xTK03GiFDw54ZTgMOaU8QJN8vZg7QiH55D
cA7ij3wCFpKhxN9PFrQLVQQn/zHJK+VYBOcNb+YryQiosOWaod36DPqocdi+7qUZ
L20y3692+17p/881xLcgIHguPe8ki3Ouxq5A0rz8nRImspEEI+xaadWN0jRp3NVU
e6sI7ZZkF52wW5BrLR6udwGw8T+L6hFVok6BBWU9FBnIa3fk6Age9y4U9s2Xbqla
uX8DZv+953kjVjCVd9TWh8Gkk1FnVt2gyYGvrERWvVWsKpd6WQ+paCvCGhQoOspX
XhWSgCkXt9uEG0IA/K2MFs6++iILtdScM5yFITjA3xJfPOrGKuhHERrqXiTdRybz
XBSLYIdZjjERWZYyfYC9om8x/KYsf3JZOs3+25W9LFM0GWiLsLj9Z3/bnr55nJWN
+gm0e0w2kXwfN1mJhgmFAq2ZIQXkkvDI5pwDE9GUd4kuyRIXDxHUHz86gtfKfoMI
41ACENqHZIrErNwXKjoOxPimi9m5i+/tRHFm9lqlBGarxrKQmJh01S5YCwVMug5K
Xe8BsgEgDjZFvWKoMgVc14OuKL6npTO4syvYead7VlC4pkLIMnmoSmsQdtRGzkfR
rraHsSKoKZA78DekpwG11eczIDFQm9RTKn1E9edw0u6sE3lL9hs=
=SRrL
-----END PGP SIGNATURE-----

--Sig_/NU0TOyKmHxFOryYKL14F/gG--

--===============0109246798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0109246798==--
