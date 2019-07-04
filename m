Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA115F71F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD2B6E329;
	Thu,  4 Jul 2019 11:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38E06E328;
 Thu,  4 Jul 2019 11:12:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i21so5785201ljj.3;
 Thu, 04 Jul 2019 04:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=y7hdyQl2ktepBjbWnHCWr8sRFRXA/+4K6fLuiy0hxqY=;
 b=PQYSfxQHkJXoul/2uOn17KZtRot/3Tw9Z9y7KK6/mPPcGw6FJ6IyTWQnHBvz4XnEcd
 OukyYSaZ/Yx/07TI8Hw8YFEnV4/2wE7ZvnFT9rAwwBCpKjTewIUNi/aGL1adlYFA1Nai
 XwT3DBWZTRjyXWPNANhdtYkiKYbcFwWsBhGJSitqPsESs+trgfQlAJBJdfbAMNxWxnGS
 VHQpyh+yRAjeRG2AKDAxg99vMzDUJZbLcG8Y+Fn1zInuW6Oc9znx7LY14rJU9Ndsr928
 vvkvHS6ZJ5ZaEOUMOZsILAjUGKeCmHONxOf6Z90weHabEKj2bgFNWcWFQ9Eo3yYnGiJG
 LzCw==
X-Gm-Message-State: APjAAAUgOHoM24xv/o7Mc6v5M5Vxii+KcIZH9rKDO9yRInehih/1dD6v
 m92qm8ChSbYNtxr8/mKm3fcQHHhC
X-Google-Smtp-Source: APXvYqzHTc4dX1CFonu4MzxRILWccBRj/wUgGJ7LA/1iiUNaGTgFIglQxeXilY1woJCeXf3ASteXFA==
X-Received: by 2002:a2e:988b:: with SMTP id b11mr12921938ljj.110.1562238723243; 
 Thu, 04 Jul 2019 04:12:03 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o8sm1046865ljh.100.2019.07.04.04.12.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 04:12:02 -0700 (PDT)
Date: Thu, 4 Jul 2019 14:11:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 07/11] drm: Add Content protection type property
Message-ID: <20190704141159.2d3116c1@eldfell.localdomain>
In-Reply-To: <20190507162745.25600-8-ramalingam.c@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-8-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=y7hdyQl2ktepBjbWnHCWr8sRFRXA/+4K6fLuiy0hxqY=;
 b=JDLsQQ/NMwO1OznsxqRl1lBIISoDMQOaiX+jr8/2LTT5hS8w5mCHvwcHVAf3ETdNpk
 rff99q4ToCc1YgYSk4T8WTfhvDuHrpbAOjfTaru0VYALq1kGQClw3XhUrLvWCvN3Pnlg
 Cdb9icjdparYlDC+hEDhGwD+wUCtcF/McofF45lVcw+vca0imOn8FQwEzS+sEnI6sQMk
 l3gkl8ipA2Vh/dOMrhjiffAAkMtBbjFeWO86MzJxahYEpWSd4mU39CycfwL5490dWOqh
 R3tEd/EHXyhQsh9fk4QlzlB8C7Z0jocLkaZF6NKJdB9089Mv7k3yhYd34gBorTV4e/Xe
 g8fw==
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
Content-Type: multipart/mixed; boundary="===============1640980832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1640980832==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fOimk1YEttPvrI=._6TGfNO"; protocol="application/pgp-signature"

--Sig_/fOimk1YEttPvrI=._6TGfNO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 May 2019 21:57:41 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> This patch adds a DRM ENUM property to the selected connectors.
> This property is used for mentioning the protected content's type
> from userspace to kernel HDCP authentication.
>=20
> Type of the stream is decided by the protected content providers.
> Type 0 content can be rendered on any HDCP protected display wires.
> But Type 1 content can be rendered only on HDCP2.2 protected paths.
>=20
> So when a userspace sets this property to Type 1 and starts the HDCP
> enable, kernel will honour it only if HDCP2.2 authentication is through
> for type 1. Else HDCP enable will be failed.
>=20
> Need ACK for this new conenctor property from userspace consumer.
>=20
> v2:
>   cp_content_type is replaced with content_protection_type [daniel]
>   check at atomic_set_property is removed [Maarten]
> v3:
>   %s/content_protection_type/hdcp_content_type [Pekka]
> v4:
>   property is created for the first requested connector and then reused.
> 	[Danvet]
> v5:
>   kernel doc nits addressed [Daniel]
>   Rebased as part of patch reordering.
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>  drivers/gpu/drm/drm_connector.c   | 18 ++++++++++++++++
>  drivers/gpu/drm/drm_hdcp.c        | 36 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/intel_hdcp.c |  4 +++-
>  include/drm/drm_connector.h       |  7 ++++++
>  include/drm/drm_hdcp.h            |  2 +-
>  include/drm/drm_mode_config.h     |  6 ++++++
>  include/uapi/drm/drm_mode.h       |  4 ++++
>  8 files changed, 78 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 4131e669785a..a85f3ccfe699 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -738,6 +738,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  			return -EINVAL;
>  		}
>  		state->content_protection =3D val;
> +	} else if (property =3D=3D config->hdcp_content_type_property) {
> +		state->hdcp_content_type =3D val;
>  	} else if (property =3D=3D connector->colorspace_property) {
>  		state->colorspace =3D val;
>  	} else if (property =3D=3D config->writeback_fb_id_property) {
> @@ -816,6 +818,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D state->scaling_mode;
>  	} else if (property =3D=3D config->content_protection_property) {
>  		*val =3D state->content_protection;
> +	} else if (property =3D=3D config->hdcp_content_type_property) {
> +		*val =3D state->hdcp_content_type;
>  	} else if (property =3D=3D config->writeback_fb_id_property) {
>  		/* Writeback framebuffer is one-shot, write and forget */
>  		*val =3D 0;
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 764c7903edf6..de9e06583e8c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

Hi,

below I have some comments and questions before I can say whether
https://gitlab.freedesktop.org/wayland/weston/merge_requests/48
adheres to this specification.

> @@ -955,6 +955,24 @@ static const struct drm_prop_enum_list hdmi_colorspa=
ces[] =3D {
>   *	  the value transitions from ENABLED to DESIRED. This signifies the l=
ink
>   *	  is no longer protected and userspace should take appropriate action
>   *	  (whatever that might be).
> + * HDCP Content Type:
> + *	This property is used by the userspace to configure the kernel with
> + *	to be displayed stream's content type. Content Type of a stream is
> + *	decided by the owner of the stream, as HDCP Type0 or HDCP Type1.
> + *
> + *	The value of the property can be one the below:
> + *	  - DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0

If this doc is meant as the UAPI doc, it needs to use the string names
for enum property values, not the C language definitions (integers).

> + *		HDCP Type0 streams can be transmitted on a link which is
> + *		encrypted with HDCP 1.4 or HDCP 2.2.

This wording forbids using any future HDCP version for type0.

> + *	  - DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> + *		HDCP Type1 streams can be transmitted on a link which is
> + *		encrypted only with HDCP 2.2.

This wording forbids using any future HDCP version for type1.

> + *
> + *	Note that the HDCP Content Type property is specific to HDCP 2.2, and
> + *	defaults to type 0. It is only exposed by drivers supporting HDCP 2.2

Not possible with a future HDCP version greater than 2.2?

Is it intended to be possible to add more content types in the future?

> + *	If content type is changed when content_protection is not UNDESIRED,
> + *	then kernel will disable the HDCP and re-enable with new type in the
> + *	same atomic commit

Ok, very good to mention this.

>   *
>   * max bpc:
>   *	This range property is used by userspace to limit the bit depth. When
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 0da7b3718bad..75402463466b 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -342,23 +342,41 @@ static struct drm_prop_enum_list drm_cp_enum_list[]=
 =3D {
>  };
>  DRM_ENUM_NAME_FN(drm_get_content_protection_name, drm_cp_enum_list)
> =20
> +static struct drm_prop_enum_list drm_hdcp_content_type_enum_list[] =3D {
> +	{ DRM_MODE_HDCP_CONTENT_TYPE0, "HDCP Type0" },
> +	{ DRM_MODE_HDCP_CONTENT_TYPE1, "HDCP Type1" },
> +};
> +DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
> +		 drm_hdcp_content_type_enum_list)
> +
>  /**
>   * drm_connector_attach_content_protection_property - attach content pro=
tection
>   * property
>   *
>   * @connector: connector to attach CP property on.
> + * @hdcp_content_type: is HDCP Content Type property needed for connector
>   *
>   * This is used to add support for content protection on select connecto=
rs.
>   * Content Protection is intentionally vague to allow for different unde=
rlying
>   * technologies, however it is most implemented by HDCP.
>   *
> + * When hdcp_content_type is true enum property called HDCP Content Type=
 is
> + * created (if it is not already) and attached to the connector.
> + *
> + * This property is used for sending the protected content's stream type
> + * from userspace to kernel on selected connectors. Protected content pr=
ovider
> + * will decide their type of their content and declare the same to kerne=
l.
> + *
> + * Content type will be used during the HDCP 2.2 authentication.
> + * Content type will be set to &drm_connector_state.hdcp_content_type.
> + *
>   * The content protection will be set to &drm_connector_state.content_pr=
otection
>   *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
>  int drm_connector_attach_content_protection_property(
> -		struct drm_connector *connector)
> +		struct drm_connector *connector, bool hdcp_content_type)
>  {
>  	struct drm_device *dev =3D connector->dev;
>  	struct drm_property *prop =3D
> @@ -375,6 +393,22 @@ int drm_connector_attach_content_protection_property(
>  				   DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
>  	dev->mode_config.content_protection_property =3D prop;
> =20
> +	if (!hdcp_content_type)
> +		return 0;
> +
> +	prop =3D dev->mode_config.hdcp_content_type_property;
> +	if (!prop)
> +		prop =3D drm_property_create_enum(dev, 0, "HDCP Content Type",
> +					drm_hdcp_content_type_enum_list,
> +					ARRAY_SIZE(
> +					drm_hdcp_content_type_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&connector->base, prop,
> +				   DRM_MODE_HDCP_CONTENT_TYPE0);
> +	dev->mode_config.hdcp_content_type_property =3D prop;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_attach_content_protection_property);

...

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 83cd1636b9be..8ac03351fdee 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -209,6 +209,10 @@ extern "C" {
>  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
>  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> =20
> +/* Content Type classification for HDCP2.2 vs others */
> +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> +#define DRM_MODE_HDCP_CONTENT_TYPE1		1

These should not be in a UAPI header. The C language definitions must
never be exposed to userspace, or misguided userspace will start using
them.

Instead, UAPI uses the string names to discover the integers at runtime.

***

Questions about the already existing "Content Protection" property:

- What happens if userspace attempts to write "Enabled" into it?

- Where is the UAPI documentation that explains how userspace should be
  using the property? (e.g. telling that you cannot set it to "Enabled")


Thanks,
pq

--Sig_/fOimk1YEttPvrI=._6TGfNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0d3v8ACgkQI1/ltBGq
qqdYoA/9EryBVsYuBm3RIlEqBu0gHxYba/fum6/+Toa01QpAIE6Xp4VuAioM0auz
GSuKh+oHjqGOeLT6fLtz+yelK2uzZQvkRlAz/v2czYihWGEa9sitiNiU1y+IeGKW
UKO26Y6jIjx40FIhkWL14lPIa5Rxr2ZWF22nGvtHLdT00ACFz8lxKab3WUdqSDrr
wA3/KHhRi6jzUjR7lVzOiNLnvrv3EYEoo/G3qdA6DqrS2+B4J9rcRzyWXqizWmeV
1EAOcSJnTM5WDHTFteh4cxAw7dYN4XkpR5AsOBDFeDX/HuvLpICO32ZNLn7j69VD
FAPCiJInm4KzLvjzTXGZXHliQ0hHVPRh2d9lR36OedO7IDSpcgPISC9i2FSboN0e
N/PJUMZeccUa3qHx6A38eYA0fl3H/mzlUjt+S6CT1UJgXtPAiyH9d3dnuGjvHvau
wmOtTP1Vufsq6rd+2n0ocOhjOuiWAMUvoh9rrAqizpQDdkfDgpUxIyqIOdXfS9G3
H6JJs2WGr71yM+kwlrvRc5QqGuBUnoZbZUYWWRvsq4JbXzByE+tcvP4Id99qR1ot
Dq0gXx59DrkmcCY93Psv9V3XtgMcEC7wGDPVEg8izzgkZwCRghf6MDFAr/WBPuXe
rDh0h/49zxvHQukbwNRJXbM7Zf2EusUDkSte9mE3qTtRRYl8g7I=
=dxBU
-----END PGP SIGNATURE-----

--Sig_/fOimk1YEttPvrI=._6TGfNO--

--===============1640980832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1640980832==--
