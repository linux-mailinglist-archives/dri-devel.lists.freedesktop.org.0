Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1C637ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB1589FF6;
	Tue,  9 Jul 2019 14:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384689FF6;
 Tue,  9 Jul 2019 14:31:17 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m23so19759072lje.12;
 Tue, 09 Jul 2019 07:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Wj+MTQBE30CPeh0TJEs+DH41H87J/vFMgsTlRGFpXfk=;
 b=nwVoVo+QMOWvrmSKplmxNM3GFD87AcRYBCFJtwDDbZaiAP8a8/rwON/BZ3eHQ2AJPs
 SRCAB4Rj+7wuy/k/VFxV7xgC3eW89HGEL5Rlo/XvrS0gf7yqQKMZO/AAjVw37ms6njsG
 lzIak9IaAZu1MQAk25Wsr6xLUSiK4gYkwXG+J1CAFd/t984SuFZBKLrDKYH7qHHXoxpI
 d55/9TzKEmw7EbrJLgX38nmRbS9cgfTSGYlDYbjVTfxhuuWS3SJ2LgRdPFXVsiAaJlpK
 eydenrHsEASLcsr896b/mo4NAzbBEofS/hs2bYOdB2k5EljcSDGmFgRYVG13ixg8rymr
 Vpqg==
X-Gm-Message-State: APjAAAXParYl2MQNqazgCdjXg75HNlMkiKnC+wokNWfgBDYsOzXsMBy7
 gMxq75KBbgY9/vmCrvY47GNYGv9j
X-Google-Smtp-Source: APXvYqz/emzHN6ijQ1I6aQMfyU4Wz49e+rUUKicriDwBFX5splC71fYgrZVtRx6SHhDDTIJu9rIPvg==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr13511086ljg.197.1562682675866; 
 Tue, 09 Jul 2019 07:31:15 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 137sm4383442ljj.46.2019.07.09.07.31.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:31:15 -0700 (PDT)
Date: Tue, 9 Jul 2019 17:31:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v9 1/6] drm: Add Content protection type property
Message-ID: <20190709173110.1f18338d@eldfell.localdomain>
In-Reply-To: <20190708112116.1780-2-ramalingam.c@intel.com>
References: <20190708112116.1780-1-ramalingam.c@intel.com>
 <20190708112116.1780-2-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Wj+MTQBE30CPeh0TJEs+DH41H87J/vFMgsTlRGFpXfk=;
 b=mWNhlfPXBjFuoqgUzE9cDOL66UksOJAUOOFqZI/k/3r2B8VnlVMNwYEnoocknH6jng
 xjG0OWbtyAulQvjEMCXm88UHjqzKRfF5C9ecFSVfdQ6LXOi0nZjunnxHTzMV0834YRLa
 D+aujB5J0Otdt0ERKWGI9Otb0UeprycCaghp+VKoX4TPeQYKZA6WWSRDPmGgV7C+3ldK
 0uIqH3/0wy0dlSXqf5xholjEaGY5X26TtUxUZtRWHoimbJKfC3TTHvrBsgEvEbd7yqSN
 bZrTOF83vG8ER7anYd+ZPmxLa84xd9ezO0k3soBedYqQ9aTru8+RBOYwrCBJ6NkwUpJf
 1Kwg==
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
Content-Type: multipart/mixed; boundary="===============0027328732=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0027328732==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FGe=_IKRL4mgv6O1Uv_Pq6_"; protocol="application/pgp-signature"

--Sig_/FGe=_IKRL4mgv6O1Uv_Pq6_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  8 Jul 2019 16:51:11 +0530
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
> v6:
>   Kernel docs are modified [pekka]
> v7:
>   More details in Kernel docs. [pekka]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>  drivers/gpu/drm/drm_connector.c           | 39 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_hdcp.c                | 36 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 ++-
>  include/drm/drm_connector.h               |  7 ++++
>  include/drm/drm_hdcp.h                    |  2 +-
>  include/drm/drm_mode_config.h             |  6 ++++
>  include/uapi/drm/drm_mode.h               |  4 +++
>  8 files changed, 99 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index abe38bdf85ae..19ae119f1a5d 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -747,6 +747,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  			return -EINVAL;
>  		}
>  		state->content_protection =3D val;
> +	} else if (property =3D=3D config->hdcp_content_type_property) {
> +		state->hdcp_content_type =3D val;
>  	} else if (property =3D=3D connector->colorspace_property) {
>  		state->colorspace =3D val;
>  	} else if (property =3D=3D config->writeback_fb_id_property) {
> @@ -831,6 +833,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  			state->hdr_output_metadata->base.id : 0;
>  	} else if (property =3D=3D config->content_protection_property) {
>  		*val =3D state->content_protection;
> +	} else if (property =3D=3D config->hdcp_content_type_property) {
> +		*val =3D state->hdcp_content_type;
>  	} else if (property =3D=3D config->writeback_fb_id_property) {
>  		/* Writeback framebuffer is one-shot, write and forget */
>  		*val =3D 0;
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 068d4b05f1be..732f6645643d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -952,6 +952,45 @@ static const struct drm_prop_enum_list hdmi_colorspa=
ces[] =3D {
>   *	  is no longer protected and userspace should take appropriate action
>   *	  (whatever that might be).
>   *
> + * HDCP Content Type:
> + *	This Enum property is used by the userspace to declare the content ty=
pe
> + *	of the display stream, to kernel. Here display stream stands for any
> + *	display content that userspace intended to render with HDCP encryptio=
n.

Hi,

I'd suggest s/render with/display through/.

As a gfx dev, rendering is something quite different to me.

> + *
> + *	Content Type of a stream is decided by the owner of the stream, as
> + *	"HDCP Type0" or "HDCP Type1".
> + *
> + *	The value of the property can be one the below:

*one of the below

> + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> + *
> + *	When kernel starts the HDCP authentication upon the "DESIRED" state of
> + *	the "Content Protection", it refers the "HDCP Content Type" property
> + *	state. And perform the HDCP authentication with the display sink for
> + *	the content type mentioned by "HDCP Content Type".

How about:

	When kernel starts the HDCP authentication (see "Content Protection"
	for details), it uses the content type in "HDCP Content Type"
	for performing the HDCP authentication with the display sink.

> + *
> + *	Stream classified as HDCP Type0 can be transmitted on a link which is
> + *	encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> + *	and more).

This is where I get confused, see my earlier email from today on the
previous revision of this patch series. Is it necessary to talk about
HDCP versions here? The only thing that matters for UAPI is the content
type, right?

Previously you said that the kernel will not use Type1 if userspace
only asked for Type0, but to me this text reads as quite the opposite.

> + *
> + *	Streams classified as HDCP Type1 can be transmitted on a link which is
> + *	encrypted only with HDCP 2.2. In future, HDCP versions >2.2 also might
> + *	support Type1 based on their spec.
> + *
> + *	HDCP2.2 authentication protocol itself takes the "Content Type" as a
> + *	parameter, which is a input for the DP HDCP2.2 encryption algo.
> + *
> + *	Note that the HDCP Content Type property is introduced at HDCP 2.2, a=
nd
> + *	defaults to type 0. It is only exposed by drivers supporting HDCP 2.2.
> + *	Based on how next versions of HDCP specs are defined content Type cou=
ld
> + *	be used for higher versions too.

Ok, userspace does not have to cope with a "HDCP Content Type" property
that is missing the enum value Type1. I think the Weston patch would
attempt something silly or misbehave if Type1 value was ever missing.
Not having the whole property is fine, of course.

> + *
> + *	If content type is changed when "Content Protection" is not UNDESIRED,
> + *	then kernel will disable the HDCP and re-enable with new type in the
> + *	same atomic commit. And when "Content Protection" is ENABLED, it means
> + *	that link is HDCP authenticated and encrypted, for the transmission of
> + *	the Type of stream mentioned at "HDCP Content Type".
> + *

Very good! This wording is much better already.


Thanks,
pq


>   * HDR_OUTPUT_METADATA:
>   *	Connector property to enable userspace to send HDR Metadata to
>   *	driver. This metadata is based on the composition and blending
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index cd837bd409f7..ce235fd1c844 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -344,23 +344,41 @@ static struct drm_prop_enum_list drm_cp_enum_list[]=
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
> @@ -377,6 +395,22 @@ int drm_connector_attach_content_protection_property(
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
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/=
i915/display/intel_hdcp.c
> index bc3a94d491c4..2a4d10952b74 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1829,7 +1829,9 @@ int intel_hdcp_init(struct intel_connector *connect=
or,
>  	if (!shim)
>  		return -EINVAL;
> =20
> -	ret =3D drm_connector_attach_content_protection_property(&connector->ba=
se);
> +	ret =3D
> +	drm_connector_attach_content_protection_property(&connector->base,
> +							 false);
>  	if (ret)
>  		return ret;
> =20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4c30d751487a..d6432967a2a9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -601,6 +601,12 @@ struct drm_connector_state {
>  	 */
>  	unsigned int content_type;
> =20
> +	/**
> +	 * @hdcp_content_type: Connector property to pass the type of
> +	 * protected content. This is most commonly used for HDCP.
> +	 */
> +	unsigned int hdcp_content_type;
> +
>  	/**
>  	 * @scaling_mode: Connector property to control the
>  	 * upscaling, mostly used for built-in panels.
> @@ -1484,6 +1490,7 @@ const char *drm_get_dvi_i_select_name(int val);
>  const char *drm_get_tv_subconnector_name(int val);
>  const char *drm_get_tv_select_name(int val);
>  const char *drm_get_content_protection_name(int val);
> +const char *drm_get_hdcp_content_type_name(int val);
> =20
>  int drm_mode_create_dvi_i_properties(struct drm_device *dev);
>  int drm_mode_create_tv_margin_properties(struct drm_device *dev);
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 13771a496e2b..2970abdfaf12 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -291,5 +291,5 @@ struct drm_connector;
>  bool drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
>  				 u8 *ksvs, u32 ksv_count);
>  int drm_connector_attach_content_protection_property(
> -		struct drm_connector *connector);
> +		struct drm_connector *connector, bool hdcp_content_type);
>  #endif
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 759d462d028b..6c4b5bc85951 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -849,6 +849,12 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *content_protection_property;
> =20
> +	/**
> +	 * @hdcp_content_type_property: DRM ENUM property for type of
> +	 * Protected Content.
> +	 */
> +	struct drm_property *hdcp_content_type_property;
> +
>  	/* dumb ioctl parameters */
>  	uint32_t preferred_depth, prefer_shadow;
> =20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ab331e5dc23..5c954394093f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -218,6 +218,10 @@ extern "C" {
>  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
>  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> =20
> +/* Content Type classification for HDCP2.2 vs others */
> +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> +#define DRM_MODE_HDCP_CONTENT_TYPE1		1
> +
>  struct drm_mode_modeinfo {
>  	__u32 clock;
>  	__u16 hdisplay;


--Sig_/FGe=_IKRL4mgv6O1Uv_Pq6_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0kpS4ACgkQI1/ltBGq
qqdBKw/9EJWsPkr+tR2hu2A484hQkRV/KzyyBOClJbe7BPY2GSr391PTbO51u+5N
IBxeNW+SxKXwVzDHsn1rwozvMD8e1FjAhQhWndMcfsgEkQqvp3RN8a6gQqxlxsiD
CrfiG2eK6v0KVK3nv+xJAth/RVMAAKj5PYl1CFbhQ4gRa0e3GbQ7AjuTESXRvw7S
FWnxZF6+pTbKFot6L5Rjt/C7RJYzqEDCfipDOLjHmQpZunHOjo3eT3FbbKgzCXMQ
whi/+L+zQSUv/e8Lywk7UG252CVdLFADa+eAaJ0HtgwqO++h2qNEjFpB1JQkoau7
gt6K6VQRCPC7/ir1QYmQ84h4c3/Wo5teRRkw5L1XiG8jwtEnuJ3zI4sYuw/v2Ovf
5dRhxlYA2r4iZcqW4BYNsXXTSHCIMU1mLLRHP7WbQFtDPhbs0TfRvL8WMCLsoMMY
gzBtGVhO0BVln3H5ZLNleAi6Qam1GOEjPFGSa+hNmkY1qmvl18BXaPFeY7xf+0jc
4+AMsz1MYYcnQjC9b3HlyOgy4EHr4Vef5Ibr75FoFsIxaV3Db06xz0HWeOz9mgBP
v5dCwzhsPP0oc65j4l53X6+BNCsCJ2yGxGFcBPbzfRPl9kiLKPrT5O7ZofMBE1He
4Q2FPpJwvFutrnKySD1n3GHoonjJFGj9wuGDFlyuaJDGg4AGhwE=
=5RTL
-----END PGP SIGNATURE-----

--Sig_/FGe=_IKRL4mgv6O1Uv_Pq6_--

--===============0027328732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0027328732==--
