Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B6B60788
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 16:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AE16E4CF;
	Fri,  5 Jul 2019 14:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60226E4CF;
 Fri,  5 Jul 2019 14:12:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v85so3487864lfa.6;
 Fri, 05 Jul 2019 07:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=37dbCrZGFIzscXJLXp4SCuMINXTffGIKHwrkQVOzzyo=;
 b=dA6l9FlSP5NA8wdb1NcIWggAz/Iagaksw6e7U0Dn9+PSct7Iv7tGXzISGaw1QtZpOF
 3ZAMEVInCg9tv7YsjB2v3kDYbfPeiKuB7MTrKrZihE1pWWiUojzAaotv1Btst5hjyunb
 NUrdmeR8UMJHbQnsKUfOYCc/wEDJYmvG9TKzD1SWTwsRL0l1tVEcYKW8Jf64lK7Paqvw
 Dv2SrK2RLDkv41maULIusukbUSOUx+yhMbRcWzAC66pUr0TxnhTucHn5ddzNF9SZEqjD
 xJ4T38eUP7BfPmDb2IhmZqW+tw3DPPaouhI/0mZA4RSgVS4mT7sPT8HpUvn+GVBqXryB
 bqmA==
X-Gm-Message-State: APjAAAVgjONsc9xR/KTDBHRMKIg4QZpkNsHeCfphwGriOmaDF3R6ERk0
 VW1X9enZKXzapxduPrzSWiYGKU6l
X-Google-Smtp-Source: APXvYqxsQI8zO5scSaRHLBCK7sxLor2Qj71rWVSXIcyGIn+oH/RsH4VUUvB6rtaVygHBrWWoZo91fA==
X-Received: by 2002:ac2:5a44:: with SMTP id r4mr2146297lfn.118.1562335947155; 
 Fri, 05 Jul 2019 07:12:27 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 25sm1808859ljn.62.2019.07.05.07.12.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 07:12:26 -0700 (PDT)
Date: Fri, 5 Jul 2019 17:12:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 07/11] drm: Add Content protection type property
Message-ID: <20190705171223.6201c30b@eldfell.localdomain>
In-Reply-To: <20190705063318.GA16910@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-8-ramalingam.c@intel.com>
 <20190704141159.2d3116c1@eldfell.localdomain>
 <20190704103603.GA27121@intel.com>
 <20190705160037.23ed7aa7@eldfell.localdomain>
 <20190705063318.GA16910@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=37dbCrZGFIzscXJLXp4SCuMINXTffGIKHwrkQVOzzyo=;
 b=OsTN0kLt5SKnXFV7aniCsfFscbHdvH4VpA43nwkaVtUysfXI1dX73YoYVKC1fXA5RS
 DJeShBKFskgo5JedKzmwthGD12hCfGVCGVK0aqPDTB/EMykhWOj5XYMu/GVbp6zmxwfG
 CveBdjw+ZZ3H1hclIeotxCASKuY3BgyXDaXdwwFuTvwNQMilD2D7d9KPDLBcBFPjkugX
 XEnnwKESjmgUXgriK7QBw4IgWJb8FdEfUPLylMRafGDNyIaFAgSaIQJu/816/iXOsivS
 EmmqvdUsHa68rUH1udyBciu8aYn4MCq0iHHxNL71eASz6PEdyMAuNEv0zmUaq0RxCFTi
 +aTA==
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
Content-Type: multipart/mixed; boundary="===============0977130100=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0977130100==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/66+YKIcbUL.junSQjIvvMTv"; protocol="application/pgp-signature"

--Sig_/66+YKIcbUL.junSQjIvvMTv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jul 2019 12:03:18 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-05 at 16:00:37 +0300, Pekka Paalanen wrote:
> > On Thu, 4 Jul 2019 16:06:05 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > On 2019-07-04 at 14:11:59 +0300, Pekka Paalanen wrote: =20
> > > > On Tue,  7 May 2019 21:57:41 +0530
> > > > Ramalingam C <ramalingam.c@intel.com> wrote:
> > > >    =20
> > > > > This patch adds a DRM ENUM property to the selected connectors.
> > > > > This property is used for mentioning the protected content's type
> > > > > from userspace to kernel HDCP authentication.
> > > > >=20
> > > > > Type of the stream is decided by the protected content providers.
> > > > > Type 0 content can be rendered on any HDCP protected display wire=
s.
> > > > > But Type 1 content can be rendered only on HDCP2.2 protected path=
s.
> > > > >=20
> > > > > So when a userspace sets this property to Type 1 and starts the H=
DCP
> > > > > enable, kernel will honour it only if HDCP2.2 authentication is t=
hrough
> > > > > for type 1. Else HDCP enable will be failed.
> > > > >=20
> > > > > Need ACK for this new conenctor property from userspace consumer.
> > > > >=20
> > > > > v2:
> > > > >   cp_content_type is replaced with content_protection_type [danie=
l]
> > > > >   check at atomic_set_property is removed [Maarten]
> > > > > v3:
> > > > >   %s/content_protection_type/hdcp_content_type [Pekka]
> > > > > v4:
> > > > >   property is created for the first requested connector and then =
reused.
> > > > > 	[Danvet]
> > > > > v5:
> > > > >   kernel doc nits addressed [Daniel]
> > > > >   Rebased as part of patch reordering.
> > > > >=20
> > > > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> > > > >  drivers/gpu/drm/drm_connector.c   | 18 ++++++++++++++++
> > > > >  drivers/gpu/drm/drm_hdcp.c        | 36 +++++++++++++++++++++++++=
+++++-
> > > > >  drivers/gpu/drm/i915/intel_hdcp.c |  4 +++-
> > > > >  include/drm/drm_connector.h       |  7 ++++++
> > > > >  include/drm/drm_hdcp.h            |  2 +-
> > > > >  include/drm/drm_mode_config.h     |  6 ++++++
> > > > >  include/uapi/drm/drm_mode.h       |  4 ++++
> > > > >  8 files changed, 78 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/=
drm_atomic_uapi.c
> > > > > index 4131e669785a..a85f3ccfe699 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > @@ -738,6 +738,8 @@ static int drm_atomic_connector_set_property(=
struct drm_connector *connector,
> > > > >  			return -EINVAL;
> > > > >  		}
> > > > >  		state->content_protection =3D val;
> > > > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > > > +		state->hdcp_content_type =3D val;
> > > > >  	} else if (property =3D=3D connector->colorspace_property) {
> > > > >  		state->colorspace =3D val;
> > > > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > > > @@ -816,6 +818,8 @@ drm_atomic_connector_get_property(struct drm_=
connector *connector,
> > > > >  		*val =3D state->scaling_mode;
> > > > >  	} else if (property =3D=3D config->content_protection_property)=
 {
> > > > >  		*val =3D state->content_protection;
> > > > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > > > +		*val =3D state->hdcp_content_type;
> > > > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > > >  		/* Writeback framebuffer is one-shot, write and forget */
> > > > >  		*val =3D 0;
> > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/dr=
m_connector.c
> > > > > index 764c7903edf6..de9e06583e8c 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c   =20
> > > >=20
> > > > Hi,
> > > >=20
> > > > below I have some comments and questions before I can say whether
> > > > https://gitlab.freedesktop.org/wayland/weston/merge_requests/48
> > > > adheres to this specification.
> > > >    =20
> > > > > @@ -955,6 +955,24 @@ static const struct drm_prop_enum_list hdmi_=
colorspaces[] =3D {
> > > > >   *	  the value transitions from ENABLED to DESIRED. This signifi=
es the link
> > > > >   *	  is no longer protected and userspace should take appropriat=
e action
> > > > >   *	  (whatever that might be).
> > > > > + * HDCP Content Type:
> > > > > + *	This property is used by the userspace to configure the kerne=
l with
> > > > > + *	to be displayed stream's content type. Content Type of a stre=
am is
> > > > > + *	decided by the owner of the stream, as HDCP Type0 or HDCP Typ=
e1.
> > > > > + *
> > > > > + *	The value of the property can be one the below:
> > > > > + *	  - DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0   =20
> > > >=20
> > > > If this doc is meant as the UAPI doc, it needs to use the string na=
mes
> > > > for enum property values, not the C language definitions (integers)=
.   =20
> >  =20
> > > kernel documentation for all other properties followed this way. We
> > > could add string associated to the enum state too for this property. =
=20
> >=20
> > Hi,
> >=20
> > I don't really care what kernel internal APIs use, this may well be
> > correct for them, but the UAPI uses strings.
> >=20
> > Because the kernel internal and UAPI docs are mixed up, it will be hard
> > to write proper docs. I guess can't help it this time.
> >=20
> > It would be really good if the enum value strings were explicitly
> > presented in the docs, so userspace has something to hook on. Or if not
> > in docs, in the UAPI header, see further below.
> >=20
> > I do see the strings in the docs you wrote, but nothing really
> > highlights them as the literal strings to be used in the API. Even just
> > quotes "" around them would make them more discoverable, especially
> > "HDCP Type0" etc. =20
> In the next version I have added the string too in the kernel
> docuemntation.
>=20
> But when we read the property state we read the enum
> value which is matched agaist the string based on the enum property
> definition. So I feel we should have both detail matched against in the u=
API
> doc.

Hi,

I guess so.

When userspace initializes, it will ask the kernel for the kernel
integers corresponding to all of the name strings they both know about.
When userspace sets an enum property to a value, it looks up the kernel
integer from an internal name for the enum value and submits that to
the kernel. When userspace reads an enum property, it receives a kernel
integer, which it looks up in its value table to translate it into an
internal name which it can handle.

At no point is the kernel integer definition needed outside of the
kernel. It is discovered through the UAPI.

So from UAPI perspective, only the name string is appropriate. From
kernel internal API perspective, I suppose the integer is appropriate.

Another unfortunate confusion caused by mixed internal and UAPI docs.


Thanks,
pq

--Sig_/66+YKIcbUL.junSQjIvvMTv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0fWscACgkQI1/ltBGq
qqd+uA//bM0FE54Gpz9217O6mEK1mLI8OQhSXV7yu18xdS7+K9Jv57I5xCeEX0iQ
aqd3UUb4+GRZ04HNWk/yiJ3h1qKOhdX/E5odn30vLi2Oqu+tU18JiuIsDh8gxuYS
t1NZQKzhSHgQ7ps6DDUmA/nHoie7PuFTCBjD+g/yLXbdKjTbB9XBOoUqbraV0vPx
hOFM7gELOuUK26uBdW6feOco32kVL7mWOrJ/YczmMOWnXhuHHiEHrJqaPP8IhGoc
HiN/kRfUXSVZpRfwS8fZoDBfCx0jMjQXCTjxlVRRPUCxArkd+TDAqGcdlszttwpe
3EyXFKOWNea73JZvSmh2ld5COGzlRTekuvRFRejUFhTs3Ctv6/ZwCjoGw7LbCbT7
8gnYJx3sw1Tz1LO/ggMM87FtxJYQo1TpmoPX5wHVvBicHMth94m/NXje1nTwaio5
IqKxtarVOCR275ZV5BzmsELvf1e+bfunu/YodcNZLVaBojAz+XLwIMUuqhP2aKKt
/e3I4EbnqIcK+bTdrAzC4raT1RDxE3KMbRFHiRHtUHJaOA0pc3q3JdiaYLjOGnZ6
x1bWuHcgEVWwQWl/1dC78yeerTODk3xplKHW6uxugEFYy7RA+MGK/crri6Xg8hz3
N1lGof/Vjpj3bx3PiBJB6VGZ5E6KPSUlnGEbLQ5+5N8YsvG+1B4=
=t6el
-----END PGP SIGNATURE-----

--Sig_/66+YKIcbUL.junSQjIvvMTv--

--===============0977130100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0977130100==--
