Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7366B5F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 13:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DF06E34B;
	Fri, 12 Jul 2019 11:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135B6E34B;
 Fri, 12 Jul 2019 11:11:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m8so8935358lji.7;
 Fri, 12 Jul 2019 04:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4ixGfNvhUk5EFx3K4VZ80zDjUgvIW6zFjh7t5h0UES8=;
 b=d1Ql8ILEEr0DXDapzsgSNYui05npvR3jV4R2O0e+ouBoIsXjXh/QfLDZldze5WNfew
 McjWy/Oed6oMU/ERkHZ3v2E74QHhR5hEdXkzEhABR4TssEMqP19i94+t+vKQERRIfudr
 ab6n513MfjG+3jQZ1Jl7C80pL2CKzErP16mDsFLpo2UKq1PXrcT595JwQSLWbIadQeBF
 sYxDW3dXxEcGSyTZ6a6Jrwc8NoBMh2Y2rp3VH2LJ8+huXhGaeaIRkJxfJDohfW2jiMr4
 wHHuZkyEYlSM3OxFhR4m61TPZwcO26tcyBM5khgiM2HKqDDQHS0/RcH5FFSH7U4rFKBO
 URfw==
X-Gm-Message-State: APjAAAW5LYZc8Jh6I8V/suu16YQAFyiz8ixgsL7IXsus0lLV3b5MxW91
 AW2cTSn1Nd2VkFs+loEqGPM=
X-Google-Smtp-Source: APXvYqxsGxb3jNcNddLyL6bxCDs2XTVPQAQ5/nsxsO057AV++RenKneCs1FgEmkrD42UywTGdqaGNg==
X-Received: by 2002:a2e:9158:: with SMTP id q24mr5683988ljg.119.1562929877320; 
 Fri, 12 Jul 2019 04:11:17 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p76sm1409794ljb.49.2019.07.12.04.11.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 04:11:17 -0700 (PDT)
Date: Fri, 12 Jul 2019 14:11:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v9 1/6] drm: Add Content protection type property
Message-ID: <20190712141105.3302a6fe@eldfell.localdomain>
In-Reply-To: <20190711055049.GA1552@intel.com>
References: <20190708112116.1780-1-ramalingam.c@intel.com>
 <20190708112116.1780-2-ramalingam.c@intel.com>
 <20190709173110.1f18338d@eldfell.localdomain>
 <20190709124759.GA28326@intel.com>
 <20190710111624.08e527ed@eldfell.localdomain>
 <20190711055049.GA1552@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=4ixGfNvhUk5EFx3K4VZ80zDjUgvIW6zFjh7t5h0UES8=;
 b=fP8hyKXobp/LuAu2ItC6SmHVizdalxDfRttkD//LHxYvbs7i2t8J8zlTbaQy3cvkze
 CzJOWR5rsGsxX/GEt7HKpUPVzF0bYPdElc4ra+QjLka4lqkXBAf9mbeG9t6Om+UBWqYT
 5nyjxLxeIEnuX6fw4QsbJZ+Nx01cx6AobPSh2hZDx2zIp5uUwFVU56sPd2oQ5yv5l36X
 0tqOs4CEkKJLMgguHK6Ot34EidooIkvKnNbX1489oyoqCwrOqDqAm1MvEO+5udocytLk
 WGqW/rCRYUCHs6G6GvDErhwxmVb32BZw/NspJ5N6Eb3QyUeajxaJBl4cxANhnsCLhwem
 sE7g==
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
Content-Type: multipart/mixed; boundary="===============1897258867=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1897258867==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MWrC=Iq0aC2Wpb5WsOz46O0"; protocol="application/pgp-signature"

--Sig_/MWrC=Iq0aC2Wpb5WsOz46O0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jul 2019 11:20:49 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-10 at 11:16:24 +0300, Pekka Paalanen wrote:
> > On Tue, 9 Jul 2019 18:17:59 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > On 2019-07-09 at 17:31:10 +0300, Pekka Paalanen wrote: =20
> > > > On Mon,  8 Jul 2019 16:51:11 +0530
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
> > > > > v6:
> > > > >   Kernel docs are modified [pekka]
> > > > > v7:
> > > > >   More details in Kernel docs. [pekka]
> > > > >=20
> > > > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> > > > >  drivers/gpu/drm/drm_connector.c           | 39 +++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/drm_hdcp.c                | 36 +++++++++++++++++=
+++-
> > > > >  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 ++-
> > > > >  include/drm/drm_connector.h               |  7 ++++
> > > > >  include/drm/drm_hdcp.h                    |  2 +-
> > > > >  include/drm/drm_mode_config.h             |  6 ++++
> > > > >  include/uapi/drm/drm_mode.h               |  4 +++
> > > > >  8 files changed, 99 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/=
drm_atomic_uapi.c
> > > > > index abe38bdf85ae..19ae119f1a5d 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > > @@ -747,6 +747,8 @@ static int drm_atomic_connector_set_property(=
struct drm_connector *connector,
> > > > >  			return -EINVAL;
> > > > >  		}
> > > > >  		state->content_protection =3D val;
> > > > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > > > +		state->hdcp_content_type =3D val;
> > > > >  	} else if (property =3D=3D connector->colorspace_property) {
> > > > >  		state->colorspace =3D val;
> > > > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > > > @@ -831,6 +833,8 @@ drm_atomic_connector_get_property(struct drm_=
connector *connector,
> > > > >  			state->hdr_output_metadata->base.id : 0;
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
> > > > > index 068d4b05f1be..732f6645643d 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -952,6 +952,45 @@ static const struct drm_prop_enum_list hdmi_=
colorspaces[] =3D {
> > > > >   *	  is no longer protected and userspace should take appropriat=
e action
> > > > >   *	  (whatever that might be).
> > > > >   *
> > > > > + * HDCP Content Type:
> > > > > + *	This Enum property is used by the userspace to declare the co=
ntent type
> > > > > + *	of the display stream, to kernel. Here display stream stands =
for any
> > > > > + *	display content that userspace intended to render with HDCP e=
ncryption.   =20
> > > >=20
> > > > Hi,
> > > >=20
> > > > I'd suggest s/render with/display through/.
> > > >=20
> > > > As a gfx dev, rendering is something quite different to me.   =20
> > > Ok. =20
> > > >    =20
> > > > > + *
> > > > > + *	Content Type of a stream is decided by the owner of the strea=
m, as
> > > > > + *	"HDCP Type0" or "HDCP Type1".
> > > > > + *
> > > > > + *	The value of the property can be one the below:   =20
> > > >=20
> > > > *one of the below   =20
> > > Sure. =20
> > > >    =20
> > > > > + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> > > > > + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > > > > + *
> > > > > + *	When kernel starts the HDCP authentication upon the "DESIRED"=
 state of
> > > > > + *	the "Content Protection", it refers the "HDCP Content Type" p=
roperty
> > > > > + *	state. And perform the HDCP authentication with the display s=
ink for
> > > > > + *	the content type mentioned by "HDCP Content Type".   =20
> > > >=20
> > > > How about:
> > > >=20
> > > > 	When kernel starts the HDCP authentication (see "Content Protectio=
n"
> > > > 	for details), it uses the content type in "HDCP Content Type"
> > > > 	for performing the HDCP authentication with the display sink.   =20
> > > less confusing :) Thanks. =20
> > > >    =20
> > > > > + *
> > > > > + *	Stream classified as HDCP Type0 can be transmitted on a link =
which is
> > > > > + *	encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> > > > > + *	and more).   =20
> > > >=20
> > > > This is where I get confused, see my earlier email from today on the
> > > > previous revision of this patch series. Is it necessary to talk abo=
ut
> > > > HDCP versions here? The only thing that matters for UAPI is the con=
tent
> > > > type, right?
> > > >=20
> > > > Previously you said that the kernel will not use Type1 if userspace
> > > > only asked for Type0, but to me this text reads as quite the opposi=
te.   =20
> > > Simple. HDCP2.2 itself support both Type 0 and Type 1. where as HDCP1=
.4
> > > by default supports the Type 0 and doesn't support the Type 1.
> > >=20
> > > I guess you are getting confused by assigning the type to the version=
s. =20
> >=20
> > Hi,
> >=20
> > yes, I am indeed.
> >=20
> > Is the HDCP version ever exposed to userspace in any way?
> >=20
> > If it is, then explaining how the types relate to the versions may well
> > be useful. But if userspace cannot even know what HDCP version is being
> > used or available, =20
> Hi,
>=20
> Implicitly content type capability is exposing the HDCP version capabilit=
y.
> Say if HDCP Type 1 is supported we infer that underlying kernel support
> HDCP2.2.

Hi,

this is kind of a circular argument. ;-)

Do you think that userspace would actually use the HDCP version
information for anything?

E.g. telling the end user that HDCP 2.2 is available if the display
server finds "HDCP Content Type" property? Is this expected use of the
property?

I also understand that this would only mean HDCP 2.2 support in the
display driver and hardware, but it says nothing about the sinks, so
userspace cannot know if HDCP 2.2 is actually being used unless it
configures Type1 encryption and succeeds.

So if the HDCP version is useful to userspace, then this property is
not enough to communicate it. But if it is not useful to userspace,
then why mention it at all?

> And content type is introduced to restrict few catagories of the content
> with few HDCP versions' protection, IMHO it is better to capture the
> relationship between Type and the underlying HDCP versions.
>=20
> See if the below para will do this task with out any ambiguous.
>=20
>  * HDCP Content Type:
>  *      This Enum property is used by the userspace to declare the conten=
t type
>  *      of the display stream, to kernel. Here display stream stands for =
any
>  *      display content that userspace intended to display through HDCP
>  *      encryption.
>  *
>  *      Content Type of a stream is decided by the owner of the stream, as
>  *      "HDCP Type0" or "HDCP Type1".
>  *
>  *      The value of the property can be one of the below:
>  *        - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
>  *        - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
>  *
>  *      When kernel starts the HDCP authentication (see "Content Protecti=
on"
>  *      for details), it uses the content type in "HDCP Content Type"
>  *      for performing the HDCP authentication with the display sink.
>  *
>  *      Please note in HDCP spec versions, a link can be authenticated wi=
th
>  *      HDCP 2.2 for Content Type 0/Content Type 1. Where as a link can be
>  *      authenticated with HDCP1.4 only for Content Type 0(though it is i=
mplicit
>  *      in nature. As there is no reference for Content Type in HDCP1.4).

Ok, this makes it perfectly clear to me.

>  *
>  *     HDCP2.2 authentication protocol itself takes the "Content Type" as=
 a
>  *      parameter, which is a input for the DP HDCP2.2 encryption algo.
>  *
>  *      In case of Type 0 content protection request, kernel driver can c=
hoose
>  *      either of HDCP spec versions 1.4 and 2.2. When HDCP2.2 is used for
>  *      "HDCP Type 0", a HDCP 2.2 capable repeater in the downstream can =
send
>  *      that content to a HDCP 1.4 authenticated HDCP sink (Type0 link).
>  *      But if the content is classified as "HDCP Type 1", above mentioned
>  *      HDCP 2.2 repeater wont send the content to the HDCP sink as it ca=
n't
>  *      authenticate the HDCP1.4 capable sink for "HDCP Type 1".
>  *

Right, but are these details meaningful to the userspace using this
API? I mean, are these the property of this API rather than just
mandated by HDCP spec 2.2 in general?

>  *      Please note userspace can be ignorant of the HDCP versions used b=
y the
>  *      kernel driver to achieve the "HDCP Content Type".
>  *
>  *      At current scenario, classifying a content as Type 1 ensures that=
 the
>  *      content will be displayed only through the HDCP2.2 encrypted link.
>  *
>  *      Note that the HDCP Content Type property is introduced at HDCP 2.=
2, and
>  *      defaults to type 0. It is only exposed by drivers supporting HDCP=
 2.2
>  *      (hence supporting Type 0 and Type 1). Based on how next versions =
of
>  *      HDCP specs are defined content Type could be used for higher vers=
ions too.
>  *
>  *      If content type is changed when "Content Protection" is not UNDES=
IRED,
>  *      then kernel will disable the HDCP and re-enable with new type in =
the
>  *      same atomic commit. And when "Content Protection" is ENABLED, it =
means
>  *      that link is HDCP authenticated and encrypted, for the transmissi=
on of
>  *      the Type of stream mentioned at "HDCP Content Type".
>=20
> Please share your view on this.

That is a big piece of well-written doc. If you believe all these
details can be relevant to userspace using this property, then I am
happy see this in the UAPI doc. It is detailed and clear. My only
objection is whether it is all relevant, and I'm ok giving that up.


Thanks,
pq

--Sig_/MWrC=Iq0aC2Wpb5WsOz46O0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0oaskACgkQI1/ltBGq
qqeFVw//SAXAv1mhGomjlCxxDRVKCQPCNVvywEkzHc6gHmGKZqiBNsJQNPaItEnu
q8BWqDkF8P6Dc0ylpE31uaBjYONZyigDBa/TypPt8GYD16SWb2CvdoomVrVIrwYK
rodYValLywezR87iYiz0BKEpkm+wRaY8uHHSgGpSguDiGwn+KCA1CSYEerY+8XO3
vP+ifuJRj3kRjAl2yKwyFKIBAPhQHSa/EcASIzv1WmBNGtb4LAJTGLW9y746s51L
vHuisWawxxSiNOHLxHOIEKCo0/es+zWT8r15WoU65bka+pyC82JWROPPH+OLXoEo
+cHpjX0YwxiCEmNqpINlDKNpkLX+QWOneIL7ROXiFfWrGLKZsWyfaK7B4Z8oTDYz
gqA600j/6Mg5kkraR1MLKdKOcNvar8apDgh4VCo0j4yC9FKtJUCG17BItFhGbjQx
SRIrN53mvnVkCxcMe09OnpDAplUTGrW1L+sx4hMkl/A+LZB7pFdr9Iad8mlLBScP
L0Q4eaENI5ohWV3l+UcscKavJMay0Wk7vi4WBakFSCEcglQkwNxbR8VfcDU60ux2
aeBMxN5ZcXrsRiz3lm6gauMl16C4h+GpLwpEYSfKf8s79a4/tD9k1vmEUoCF81N1
v0b7ikhLPKhAwXPJicEhGJw/6wEg999EfSh5hJ+cLEtXCgR98LM=
=akxp
-----END PGP SIGNATURE-----

--Sig_/MWrC=Iq0aC2Wpb5WsOz46O0--

--===============1897258867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1897258867==--
