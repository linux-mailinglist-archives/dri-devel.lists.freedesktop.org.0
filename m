Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FB60646
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 15:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555B66E49E;
	Fri,  5 Jul 2019 13:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED886E0A0;
 Fri,  5 Jul 2019 13:00:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so6272337lfm.11;
 Fri, 05 Jul 2019 06:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=C6KM8QIOFrdPBnRcXNsVHqBlKIP2sBGy/HAVa5VyiYE=;
 b=uBNV2O34yiGxjzAaod33OIEocqu/C8ZBJUylX7yrRopKEwFYCwQdRDp7BE4LQVaKiq
 HmJxn2rUPsB6JAmjql8wPNJ2XxDjwl8mZspkyBJeSkPhPgHzcpPxT4KGp9b4eNGZkvf4
 SqaCGraBa2BiB28FUkrcKNDNeAu4Lr/DxoHDnVHlrBvMn5PLPPRqlzmQg4ZdmJDWcl2D
 mGnvV4aNSnOJm6fs/REFz/80/rlFPhI0G1WdxmKbbB1zvT0e/n6wDVlLZTwdDnZ/qy9k
 CYMFJwMMzqKauLzDgdBxj384Jky1nMdpIi9bgZs4f/2lK+U3uBF4/OvInUuc+bC7CT+h
 u/Uw==
X-Gm-Message-State: APjAAAVlbFJIrXqjHjkGlePaf5kw5L7qi1DuVKh6ib9n0L+VGkQ5C7q3
 62iabuO6q/NNVuntyhagzUE=
X-Google-Smtp-Source: APXvYqym4hg7VuyPv9oHGR8vtQagavzH4WpFnb+DrNY4qxd+x9ExW/i9oYywcekPWst3KaAldSsDbw==
X-Received: by 2002:a19:6602:: with SMTP id a2mr1911576lfc.25.1562331652923;
 Fri, 05 Jul 2019 06:00:52 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t21sm1360081lfd.85.2019.07.05.06.00.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 06:00:52 -0700 (PDT)
Date: Fri, 5 Jul 2019 16:00:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>, daniel.vetter@intel.com
Subject: Re: [PATCH v7 07/11] drm: Add Content protection type property
Message-ID: <20190705160037.23ed7aa7@eldfell.localdomain>
In-Reply-To: <20190704103603.GA27121@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-8-ramalingam.c@intel.com>
 <20190704141159.2d3116c1@eldfell.localdomain>
 <20190704103603.GA27121@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=C6KM8QIOFrdPBnRcXNsVHqBlKIP2sBGy/HAVa5VyiYE=;
 b=GCEH0wvs8TA6T7UVbh3kUEgsj3+7NQIi/xWsY/58uheAGyuoAdHoHl8gT8xtGDCDVM
 FEW2oeOmEUpvAStYYfcSspx9um9EqlVbiyEK1WUA/TP24hNkL0iNYKmshm8yJxA2ziDj
 9GzsjmhBJxAQXIuWzKtTnJ4/FkAZnqVGAtdBogDnGS9r1l6t/39DR/5BSecRBVBJJxDq
 1cZikDzhiX3NhjMKrTCcaRmTKv8g34dxqpJo+Wh8uUZfaZe2AOdQ+2lFnfuyaq8HySzk
 52Ml/WhuUpqE44GhzQhSnFVqkMEOvJkzHXu+dXKhDR65vDVnwzLZESGlD8b3JhupvtUR
 d1hw==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com
Content-Type: multipart/mixed; boundary="===============1605959888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1605959888==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5NKsOSVCzHoXyvLKS61L4S8"; protocol="application/pgp-signature"

--Sig_/5NKsOSVCzHoXyvLKS61L4S8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jul 2019 16:06:05 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-04 at 14:11:59 +0300, Pekka Paalanen wrote:
> > On Tue,  7 May 2019 21:57:41 +0530
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
> > >=20
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> > >  drivers/gpu/drm/drm_connector.c   | 18 ++++++++++++++++
> > >  drivers/gpu/drm/drm_hdcp.c        | 36 +++++++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/i915/intel_hdcp.c |  4 +++-
> > >  include/drm/drm_connector.h       |  7 ++++++
> > >  include/drm/drm_hdcp.h            |  2 +-
> > >  include/drm/drm_mode_config.h     |  6 ++++++
> > >  include/uapi/drm/drm_mode.h       |  4 ++++
> > >  8 files changed, 78 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index 4131e669785a..a85f3ccfe699 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -738,6 +738,8 @@ static int drm_atomic_connector_set_property(stru=
ct drm_connector *connector,
> > >  			return -EINVAL;
> > >  		}
> > >  		state->content_protection =3D val;
> > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > +		state->hdcp_content_type =3D val;
> > >  	} else if (property =3D=3D connector->colorspace_property) {
> > >  		state->colorspace =3D val;
> > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > > @@ -816,6 +818,8 @@ drm_atomic_connector_get_property(struct drm_conn=
ector *connector,
> > >  		*val =3D state->scaling_mode;
> > >  	} else if (property =3D=3D config->content_protection_property) {
> > >  		*val =3D state->content_protection;
> > > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > > +		*val =3D state->hdcp_content_type;
> > >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > >  		/* Writeback framebuffer is one-shot, write and forget */
> > >  		*val =3D 0;
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 764c7903edf6..de9e06583e8c 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c =20
> >=20
> > Hi,
> >=20
> > below I have some comments and questions before I can say whether
> > https://gitlab.freedesktop.org/wayland/weston/merge_requests/48
> > adheres to this specification.
> >  =20
> > > @@ -955,6 +955,24 @@ static const struct drm_prop_enum_list hdmi_colo=
rspaces[] =3D {
> > >   *	  the value transitions from ENABLED to DESIRED. This signifies t=
he link
> > >   *	  is no longer protected and userspace should take appropriate ac=
tion
> > >   *	  (whatever that might be).
> > > + * HDCP Content Type:
> > > + *	This property is used by the userspace to configure the kernel wi=
th
> > > + *	to be displayed stream's content type. Content Type of a stream is
> > > + *	decided by the owner of the stream, as HDCP Type0 or HDCP Type1.
> > > + *
> > > + *	The value of the property can be one the below:
> > > + *	  - DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0 =20
> >=20
> > If this doc is meant as the UAPI doc, it needs to use the string names
> > for enum property values, not the C language definitions (integers). =20

> kernel documentation for all other properties followed this way. We
> could add string associated to the enum state too for this property.

Hi,

I don't really care what kernel internal APIs use, this may well be
correct for them, but the UAPI uses strings.

Because the kernel internal and UAPI docs are mixed up, it will be hard
to write proper docs. I guess can't help it this time.

It would be really good if the enum value strings were explicitly
presented in the docs, so userspace has something to hook on. Or if not
in docs, in the UAPI header, see further below.

I do see the strings in the docs you wrote, but nothing really
highlights them as the literal strings to be used in the API. Even just
quotes "" around them would make them more discoverable, especially
"HDCP Type0" etc.

> >  =20
> > > + *		HDCP Type0 streams can be transmitted on a link which is
> > > + *		encrypted with HDCP 1.4 or HDCP 2.2. =20
> >=20
> > This wording forbids using any future HDCP version for type0. =20
> We could change it to HDCP1.4 and higher version of HDCP.
> >  =20
> > > + *	  - DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > > + *		HDCP Type1 streams can be transmitted on a link which is
> > > + *		encrypted only with HDCP 2.2. =20
> >=20
> > This wording forbids using any future HDCP version for type1. =20
> As of now type 1 is only on HDCP2.2 encrypted link, as no higher version =
is
> available. But as similar to Type 0 we could assume that Type 1 will be
> supported on higher HDCP versions too and correct the sentence here.
> >  =20
> > > + *
> > > + *	Note that the HDCP Content Type property is specific to HDCP 2.2,=
 and
> > > + *	defaults to type 0. It is only exposed by drivers supporting HDCP=
 2.2 =20
> >=20
> > Not possible with a future HDCP version greater than 2.2?
> >=20
> > Is it intended to be possible to add more content types in the future? =
=20
> Possible. As per HDCP2.2 spec, 8bits are reserved for the content Type.

Right. All my three notes above are about future-proofing this for the
"trivial" case of adding one more content type. I think it would be
wise to do, because the cost is very low (no changes in code, just
trivial change in spec), and even if the likelyhood of adding more
types in future might be low, it's not zero.

I think the Weston implementation under review in MR !48 is
future-proof as well, in the sense that enum values it does not know
will be interpreted as Type0.

I suppose it is a reasonable assumption that HDCP spec will not add a
new type that would not be at least as secure as Type0, right?

> >  =20
> > > + *	If content type is changed when content_protection is not UNDESIR=
ED,
> > > + *	then kernel will disable the HDCP and re-enable with new type in =
the
> > > + *	same atomic commit =20
> >=20
> > Ok, very good to mention this.
> >  =20
> > >   *
> > >   * max bpc:
> > >   *	This range property is used by userspace to limit the bit depth. =
When
> > > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> > > index 0da7b3718bad..75402463466b 100644
> > > --- a/drivers/gpu/drm/drm_hdcp.c
> > > +++ b/drivers/gpu/drm/drm_hdcp.c
> > > @@ -342,23 +342,41 @@ static struct drm_prop_enum_list drm_cp_enum_li=
st[] =3D {
> > >  };
> > >  DRM_ENUM_NAME_FN(drm_get_content_protection_name, drm_cp_enum_list)
> > > =20
> > > +static struct drm_prop_enum_list drm_hdcp_content_type_enum_list[] =
=3D {
> > > +	{ DRM_MODE_HDCP_CONTENT_TYPE0, "HDCP Type0" },
> > > +	{ DRM_MODE_HDCP_CONTENT_TYPE1, "HDCP Type1" },
> > > +};
> > > +DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
> > > +		 drm_hdcp_content_type_enum_list)
> > > +
> > >  /**
> > >   * drm_connector_attach_content_protection_property - attach content=
 protection
> > >   * property
> > >   *
> > >   * @connector: connector to attach CP property on.
> > > + * @hdcp_content_type: is HDCP Content Type property needed for conn=
ector
> > >   *
> > >   * This is used to add support for content protection on select conn=
ectors.
> > >   * Content Protection is intentionally vague to allow for different =
underlying
> > >   * technologies, however it is most implemented by HDCP.
> > >   *
> > > + * When hdcp_content_type is true enum property called HDCP Content =
Type is
> > > + * created (if it is not already) and attached to the connector.
> > > + *
> > > + * This property is used for sending the protected content's stream =
type
> > > + * from userspace to kernel on selected connectors. Protected conten=
t provider
> > > + * will decide their type of their content and declare the same to k=
ernel.
> > > + *
> > > + * Content type will be used during the HDCP 2.2 authentication.
> > > + * Content type will be set to &drm_connector_state.hdcp_content_typ=
e.
> > > + *
> > >   * The content protection will be set to &drm_connector_state.conten=
t_protection
> > >   *
> > >   * Returns:
> > >   * Zero on success, negative errno on failure.
> > >   */
> > >  int drm_connector_attach_content_protection_property(
> > > -		struct drm_connector *connector)
> > > +		struct drm_connector *connector, bool hdcp_content_type)
> > >  {
> > >  	struct drm_device *dev =3D connector->dev;
> > >  	struct drm_property *prop =3D
> > > @@ -375,6 +393,22 @@ int drm_connector_attach_content_protection_prop=
erty(
> > >  				   DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
> > >  	dev->mode_config.content_protection_property =3D prop;
> > > =20
> > > +	if (!hdcp_content_type)
> > > +		return 0;
> > > +
> > > +	prop =3D dev->mode_config.hdcp_content_type_property;
> > > +	if (!prop)
> > > +		prop =3D drm_property_create_enum(dev, 0, "HDCP Content Type",
> > > +					drm_hdcp_content_type_enum_list,
> > > +					ARRAY_SIZE(
> > > +					drm_hdcp_content_type_enum_list));
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +
> > > +	drm_object_attach_property(&connector->base, prop,
> > > +				   DRM_MODE_HDCP_CONTENT_TYPE0);
> > > +	dev->mode_config.hdcp_content_type_property =3D prop;
> > > +
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_connector_attach_content_protection_property); =20
> >=20
> > ...
> >  =20
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index 83cd1636b9be..8ac03351fdee 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -209,6 +209,10 @@ extern "C" {
> > >  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
> > >  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> > > =20
> > > +/* Content Type classification for HDCP2.2 vs others */
> > > +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> > > +#define DRM_MODE_HDCP_CONTENT_TYPE1		1 =20
> >=20
> > These should not be in a UAPI header. The C language definitions must
> > never be exposed to userspace, or misguided userspace will start using
> > them.
> >=20
> > Instead, UAPI uses the string names to discover the integers at runtime=
. =20
> This is done as per the usual practice for any existing enum property.

I suspect this is just the cycle of cargo-culting mistakes. Weston
MR !48 does not use these defines either.

Unfortunately the bad examples that are already in the UAPI headers
cannot be removed.

However, I think you could start a new good practice:

#define DRM_MODE_HDCP_CONTENT_TYPE0_STR "HDCP Type0"
#define DRM_MODE_HDCP_CONTENT_TYPE1_STR "HDCP Type1"

It would make a lot of sense for the UAPI header to spell out the
strings that userspace must be using. Even if userspace wouldn't use
these defines, they would have strong documentary value.

Danvet, would you agree with me here?

> >=20
> > ***
> >=20
> > Questions about the already existing "Content Protection" property:
> >=20
> > - What happens if userspace attempts to write "Enabled" into it? =20
>  *      DRM_MODE_CONTENT_PROTECTION_ENABLED =3D 2
>  *              Userspace has requested content protection, and the link =
is
>  *              protected. Only the driver can set the property to this v=
alue.
>  *              If userspace attempts to set to ENABLED, kernel will retu=
rn
>  *              -EINVAL.
> line number 936 @ drivers/gpu/drm/drm_connector.c

Good, I glossed over the last sentence when reading this before.


Thanks,
pq

>=20
> -Ram
>=20
> >=20
> > - Where is the UAPI documentation that explains how userspace should be
> >   using the property? (e.g. telling that you cannot set it to "Enabled")
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20


--Sig_/5NKsOSVCzHoXyvLKS61L4S8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0fSfUACgkQI1/ltBGq
qqd87Q//WVr5EUj7nU2wEUpNm9BeojmUhI6cDQf0lSWsazwnKU85uHn43zPNMEuC
8pl9QzPMeArDvE/0CpScP6uYOiS+Q/AnIGcK3rx5J2py09+zv8UlYHSdpA73iPf3
w2VqfcslSwLLNkXwbYu9eTIQT1MVkvP/YuRkAnySx5eBo+CLEjVh9n6NN+oiVjOV
GNm5c0ZqGmrJZGwlM6pLWx+0jHVNz5fUdAVYrN61zbNc8KP5iVUfqyaAQuHHKmyH
l26xXBNmNdyDjzdWQqm7+xLXHFo599ICB0z+70dxvjfqltQbKTiB95Q/arXlLrpj
VVP9pVPR1fo+Q7Mo8Te0JY/X21BthH3jaOisgz265HHNu/0F5GJWVN4fvNYlZZmf
aCKMePZj5wThcnDSzcrQWAeJEspantxcXWmgiW0AKLjqyzuEoL1n8Qcr7m35y6ce
fyxN+5VEOnOcVSoNjCcneCNHN3UuAv6ad6Y//S8qxkSFgvaqxvp99M5756Ii8AVd
Llcci2XfKT1cO5JhzcC657RGegY6owQ/Nt56DvRiKVxQX0D2d9koXil16YqkE2EP
PY8lTbi3sfSHPzFaJdonBPlSA5gc5TbKe2anmhDFTwEqEwjSqJIkjvs9zI0KrjQN
taZJRJ+PZyms2Frco5zd7fmtsP/eVeFwZgxqaekv43WVU4ZYsws=
=AVSL
-----END PGP SIGNATURE-----

--Sig_/5NKsOSVCzHoXyvLKS61L4S8--

--===============1605959888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1605959888==--
