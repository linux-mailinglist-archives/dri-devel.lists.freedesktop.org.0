Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C661CA6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3562B89BF6;
	Mon,  8 Jul 2019 10:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEBA89BF6;
 Mon,  8 Jul 2019 10:00:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x25so8507285ljh.2;
 Mon, 08 Jul 2019 03:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JIsM/ahiCX5OEOsAbLqDOWpSFCZ+GOOvKI5wOV7N9BI=;
 b=GCeuCuFqLO3ldZIvkzaf2Rz2o5GZ13I7jAu3x16/CRb/Kcv7OjoAE6wrPuA+QXw9cB
 aDHH4GEx8HunJuidII3zlwoQcvd4nPtI8rdYHJAHymzMN3pEzAPLG2ugnEx+DLk/N6Qf
 /775OGillfODFgjvkvaGPbp02BXZwJXKZ980AxmzAmoyPQ1BNbcbL1SdtWq3TDldkhjh
 7V0l+e1N6z91sYzsWVqAE5LEeL1Ap0FOD2/XMl2uzgnv85GyhuoK0ueZLzKK3mkJJU8G
 xFfNeEUJ90Wt/pz74XZ7hPQe989ZYPt+S5CIq1LiY/SGQCeVenfNvgEjiLmd/dazR16u
 g3fQ==
X-Gm-Message-State: APjAAAWjht1jWkoBLeQb3UqHR+ZVaEb/PDSfRBbjI7slKpnu0ei90LSo
 2TbtXWj2aff5ScFJ1XUltW1vdHtS
X-Google-Smtp-Source: APXvYqy5stecg9p6U69NwJ0LJdqe+NZYeRaphIxskWfqDvdzKTgUppAf4Tpv+47H0xhJ4qasVsiizw==
X-Received: by 2002:a2e:5dc6:: with SMTP id v67mr6484051lje.240.1562580003165; 
 Mon, 08 Jul 2019 03:00:03 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x137sm2705994lff.23.2019.07.08.03.00.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 03:00:02 -0700 (PDT)
Date: Mon, 8 Jul 2019 12:59:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v8 1/6] drm: Add Content protection type property
Message-ID: <20190708125959.3f35c23e@eldfell.localdomain>
In-Reply-To: <20190708125217.6bc8dc27@eldfell.localdomain>
References: <20190705004642.15822-1-ramalingam.c@intel.com>
 <20190705004642.15822-2-ramalingam.c@intel.com>
 <20190708125217.6bc8dc27@eldfell.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=JIsM/ahiCX5OEOsAbLqDOWpSFCZ+GOOvKI5wOV7N9BI=;
 b=D7AY7AboIaMD21TXJAXmTQMPEztyUPUOHmMG+/IyVbk10iZjcl2zcmTnMteeL6r1Gp
 BC2n+0pVuHx9G1YciQEL02Ff+QYW7zZi2jkYDTnWW4i5wcDJvhcwkR4oqDlitKxbd52j
 0j295ECHF9DplY2oZ57b2yAgbYx+YOTlMF1Ste9gAfFJ5xl/5k2Yg2BP+xiYQpT9XFyy
 m6OKEa/xHPGmGql+AGwYujSu6wbdDcoY3ZmOPAUz8dSit6duabl8/F0ChRvOD3FAluNh
 LY1ziqbscYmSE3v4AsSwjI1QOYbatzC5M9eKvZ7KJu/Hof+RaIQJtyeGZq6jX+5UY9ny
 wFkw==
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
Content-Type: multipart/mixed; boundary="===============1361662533=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1361662533==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tPCX+G_xf0w8SDw/1fED_xw"; protocol="application/pgp-signature"

--Sig_/tPCX+G_xf0w8SDw/1fED_xw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jul 2019 12:52:17 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri,  5 Jul 2019 06:16:37 +0530
> Ramalingam C <ramalingam.c@intel.com> wrote:
>=20
> > This patch adds a DRM ENUM property to the selected connectors.
> > This property is used for mentioning the protected content's type
> > from userspace to kernel HDCP authentication.
> >=20
> > Type of the stream is decided by the protected content providers.
> > Type 0 content can be rendered on any HDCP protected display wires.
> > But Type 1 content can be rendered only on HDCP2.2 protected paths.
> >=20
> > So when a userspace sets this property to Type 1 and starts the HDCP
> > enable, kernel will honour it only if HDCP2.2 authentication is through
> > for type 1. Else HDCP enable will be failed.
> >=20
> > Need ACK for this new conenctor property from userspace consumer.
> >=20
> > v2:
> >   cp_content_type is replaced with content_protection_type [daniel]
> >   check at atomic_set_property is removed [Maarten]
> > v3:
> >   %s/content_protection_type/hdcp_content_type [Pekka]
> > v4:
> >   property is created for the first requested connector and then reused.
> > 	[Danvet]
> > v5:
> >   kernel doc nits addressed [Daniel]
> >   Rebased as part of patch reordering.
> > v6:
> >   Kernel docs are modified [pekka]
> >=20
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> >  drivers/gpu/drm/drm_connector.c           | 22 ++++++++++++++
> >  drivers/gpu/drm/drm_hdcp.c                | 36 ++++++++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 ++-
> >  include/drm/drm_connector.h               |  7 +++++
> >  include/drm/drm_hdcp.h                    |  2 +-
> >  include/drm/drm_mode_config.h             |  6 ++++
> >  include/uapi/drm/drm_mode.h               |  4 +++
> >  8 files changed, 82 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index abe38bdf85ae..19ae119f1a5d 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -747,6 +747,8 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  			return -EINVAL;
> >  		}
> >  		state->content_protection =3D val;
> > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > +		state->hdcp_content_type =3D val;
> >  	} else if (property =3D=3D connector->colorspace_property) {
> >  		state->colorspace =3D val;
> >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> > @@ -831,6 +833,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  			state->hdr_output_metadata->base.id : 0;
> >  	} else if (property =3D=3D config->content_protection_property) {
> >  		*val =3D state->content_protection;
> > +	} else if (property =3D=3D config->hdcp_content_type_property) {
> > +		*val =3D state->hdcp_content_type;
> >  	} else if (property =3D=3D config->writeback_fb_id_property) {
> >  		/* Writeback framebuffer is one-shot, write and forget */
> >  		*val =3D 0;
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 068d4b05f1be..17aef88c03a6 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -951,6 +951,28 @@ static const struct drm_prop_enum_list hdmi_colors=
paces[] =3D {
> >   *	  the value transitions from ENABLED to DESIRED. This signifies the=
 link
> >   *	  is no longer protected and userspace should take appropriate acti=
on
> >   *	  (whatever that might be).
> > + * HDCP Content Type:
> > + *	This property is used by the userspace to configure the kernel with
> > + *	to be displayed stream's content type. Content Type of a stream is
> > + *	decided by the owner of the stream, as "HDCP Type0" or "HDCP Type1".
> > + *
> > + *	The value of the property can be one the below:
> > + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> > + *		HDCP Type0 streams can be transmitted on a link which is
> > + *		encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> > + *		and more).
> > + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > + *		HDCP Type1 streams can be transmitted on a link which is
> > + *		encrypted only with HDCP 2.2. In future higher versions also
> > + *		might support Type1 based on their spec.
> > + *
> > + *	Note that the HDCP Content Type property is introduced at HDCP 2.2,=
 and
> > + *	defaults to type 0. It is only exposed by drivers supporting HDCP 2=
.2.
> > + *	Based on how next versions of HDCP specs are defined content Type c=
ould
> > + *	be used for higher versions too.
> > + *	If content type is changed when content_protection is not UNDESIRED,
> > + *	then kernel will disable the HDCP and re-enable with new type in the
> > + *	same atomic commit =20
>=20
> Hi,
>=20
> I think this doc covers all my previous comments on this patch now. One
> more thing, the wording here reads as:
> - userspace configures the content type
> - the kernel transmits the content if the link satisfies the type
>   requirement
> - if the link does not satisfy the type requirement, the kernel will
>   not transmit the content
>=20
> This is of course false, the kernel transmits anyway, but that is how
> the text reads from the "stream's content type" and "can be transmitted
> on". The problem is, that a userspace developer will think the stream
> is what he pushes into KMS, not what goes on the wire. The text also
> magnifies that misconception because it sounds like the stream is
> something different from the link. Actually, I don't understand what
> "the stream" is supposed to be here.
>=20
> Instead, I think you should explain how the content type property
> guides the kernel driver's attempts in negotiating the link encryption
> and how that then reflects in the content protection property (DESIRED
> vs. ENABLED). It might be best to not say anything about any "stream".

Btw. this UAPI has the following fundamental flaws:

- userspace cannot know which encryption is used on the link
- userspace cannot force Type0 if the driver succeeds enabling Type1

To me this seems like poor UAPI design. Why was this designed like this?


Thanks,
pq

> >   *
> >   * HDR_OUTPUT_METADATA:
> >   *	Connector property to enable userspace to send HDR Metadata to
> > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> > index cd837bd409f7..ce235fd1c844 100644
> > --- a/drivers/gpu/drm/drm_hdcp.c
> > +++ b/drivers/gpu/drm/drm_hdcp.c
> > @@ -344,23 +344,41 @@ static struct drm_prop_enum_list drm_cp_enum_list=
[] =3D {
> >  };
> >  DRM_ENUM_NAME_FN(drm_get_content_protection_name, drm_cp_enum_list)
> > =20
> > +static struct drm_prop_enum_list drm_hdcp_content_type_enum_list[] =3D=
 {
> > +	{ DRM_MODE_HDCP_CONTENT_TYPE0, "HDCP Type0" },
> > +	{ DRM_MODE_HDCP_CONTENT_TYPE1, "HDCP Type1" },
> > +};
> > +DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
> > +		 drm_hdcp_content_type_enum_list)
> > +
> >  /**
> >   * drm_connector_attach_content_protection_property - attach content p=
rotection
> >   * property
> >   *
> >   * @connector: connector to attach CP property on.
> > + * @hdcp_content_type: is HDCP Content Type property needed for connec=
tor
> >   *
> >   * This is used to add support for content protection on select connec=
tors.
> >   * Content Protection is intentionally vague to allow for different un=
derlying
> >   * technologies, however it is most implemented by HDCP.
> >   *
> > + * When hdcp_content_type is true enum property called HDCP Content Ty=
pe is
> > + * created (if it is not already) and attached to the connector.
> > + *
> > + * This property is used for sending the protected content's stream ty=
pe
> > + * from userspace to kernel on selected connectors. Protected content =
provider
> > + * will decide their type of their content and declare the same to ker=
nel.
> > + *
> > + * Content type will be used during the HDCP 2.2 authentication.
> > + * Content type will be set to &drm_connector_state.hdcp_content_type.
> > + *
> >   * The content protection will be set to &drm_connector_state.content_=
protection
> >   *
> >   * Returns:
> >   * Zero on success, negative errno on failure.
> >   */
> >  int drm_connector_attach_content_protection_property(
> > -		struct drm_connector *connector)
> > +		struct drm_connector *connector, bool hdcp_content_type)
> >  {
> >  	struct drm_device *dev =3D connector->dev;
> >  	struct drm_property *prop =3D
> > @@ -377,6 +395,22 @@ int drm_connector_attach_content_protection_proper=
ty(
> >  				   DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
> >  	dev->mode_config.content_protection_property =3D prop;
> > =20
> > +	if (!hdcp_content_type)
> > +		return 0;
> > +
> > +	prop =3D dev->mode_config.hdcp_content_type_property;
> > +	if (!prop)
> > +		prop =3D drm_property_create_enum(dev, 0, "HDCP Content Type",
> > +					drm_hdcp_content_type_enum_list,
> > +					ARRAY_SIZE(
> > +					drm_hdcp_content_type_enum_list));
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	drm_object_attach_property(&connector->base, prop,
> > +				   DRM_MODE_HDCP_CONTENT_TYPE0);
> > +	dev->mode_config.hdcp_content_type_property =3D prop;
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_connector_attach_content_protection_property);
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/dr=
m/i915/display/intel_hdcp.c
> > index bc3a94d491c4..2a4d10952b74 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -1829,7 +1829,9 @@ int intel_hdcp_init(struct intel_connector *conne=
ctor,
> >  	if (!shim)
> >  		return -EINVAL;
> > =20
> > -	ret =3D drm_connector_attach_content_protection_property(&connector->=
base);
> > +	ret =3D
> > +	drm_connector_attach_content_protection_property(&connector->base,
> > +							 false);
> >  	if (ret)
> >  		return ret;
> > =20
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 4c30d751487a..d6432967a2a9 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -601,6 +601,12 @@ struct drm_connector_state {
> >  	 */
> >  	unsigned int content_type;
> > =20
> > +	/**
> > +	 * @hdcp_content_type: Connector property to pass the type of
> > +	 * protected content. This is most commonly used for HDCP.
> > +	 */
> > +	unsigned int hdcp_content_type;
> > +
> >  	/**
> >  	 * @scaling_mode: Connector property to control the
> >  	 * upscaling, mostly used for built-in panels.
> > @@ -1484,6 +1490,7 @@ const char *drm_get_dvi_i_select_name(int val);
> >  const char *drm_get_tv_subconnector_name(int val);
> >  const char *drm_get_tv_select_name(int val);
> >  const char *drm_get_content_protection_name(int val);
> > +const char *drm_get_hdcp_content_type_name(int val);
> > =20
> >  int drm_mode_create_dvi_i_properties(struct drm_device *dev);
> >  int drm_mode_create_tv_margin_properties(struct drm_device *dev);
> > diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> > index 13771a496e2b..2970abdfaf12 100644
> > --- a/include/drm/drm_hdcp.h
> > +++ b/include/drm/drm_hdcp.h
> > @@ -291,5 +291,5 @@ struct drm_connector;
> >  bool drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
> >  				 u8 *ksvs, u32 ksv_count);
> >  int drm_connector_attach_content_protection_property(
> > -		struct drm_connector *connector);
> > +		struct drm_connector *connector, bool hdcp_content_type);
> >  #endif
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_confi=
g.h
> > index 759d462d028b..6c4b5bc85951 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -849,6 +849,12 @@ struct drm_mode_config {
> >  	 */
> >  	struct drm_property *content_protection_property;
> > =20
> > +	/**
> > +	 * @hdcp_content_type_property: DRM ENUM property for type of
> > +	 * Protected Content.
> > +	 */
> > +	struct drm_property *hdcp_content_type_property;
> > +
> >  	/* dumb ioctl parameters */
> >  	uint32_t preferred_depth, prefer_shadow;
> > =20
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 5ab331e5dc23..5c954394093f 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -218,6 +218,10 @@ extern "C" {
> >  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
> >  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> > =20
> > +/* Content Type classification for HDCP2.2 vs others */
> > +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> > +#define DRM_MODE_HDCP_CONTENT_TYPE1		1
> > +
> >  struct drm_mode_modeinfo {
> >  	__u32 clock;
> >  	__u16 hdisplay; =20
>=20


--Sig_/tPCX+G_xf0w8SDw/1fED_xw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0jFB8ACgkQI1/ltBGq
qqd5eBAAsTAJXKXI3PpFY4sEJ6HMVN8voiaKFMww8wR8E/464KhbgNA8GGDToL+w
5gDpdI/RIKgWCoU5z5Sg/7Ptj9MJh0SZJK1hapxGdLdc7lO13jJ6BGH6ZRB7lTNI
48JZ8Kfskf7JOsY4qafah0Rj8HFUc+ksAuveaIiYDqkNvcw7Gj/QaGymNfVMYdk2
y6KDGqDnKtPU7nENyCX3CSiUI2uGSvoPWC9BIysTWMG0ZtcCfUf5foUZySl7W9I1
lVOUzPgTVKkhKO8XlVIX8SVxtl+xg5/ympjGu7CCXWepzWEyZ7zmBMj5xm97JoKr
8JjvkuPGjrtI2JXVZCShRGE542Zf1xrl1K4NfVPF377IK8OCvgliLZxhxSQ/AxTr
cvUhoFx4IPg9wo6h0IviqkvWFzAo2XbImcN70JFq/rxc7fMv9fteTEKEmJw+hGa4
2JGyavTw0hHL+dz8XlTCPpIzZyQFOLMGP5xUDqPv8WAEudw3zNvXxLSZV1tDUrgi
fZK3VoE8XurXxFiquEfevuEimApE8Ep0N3ogCegyYATTE7cfhGW9W8nLkINh90GE
ivQUIGK4nYbHZhKqmVi+amwvjWVD/xZzwQibdXVE7jQjBRcdTN7RQrewQ/eFEzla
78hlQU+epOeWUVUWiLQkh+izhEd8EWPPGxs2er987eHacYXJJ/Y=
=oqx6
-----END PGP SIGNATURE-----

--Sig_/tPCX+G_xf0w8SDw/1fED_xw--

--===============1361662533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1361662533==--
