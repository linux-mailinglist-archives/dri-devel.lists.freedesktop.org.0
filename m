Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C730E6B02D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FB310E5E9;
	Wed,  8 Mar 2023 09:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F9510E06A;
 Wed,  8 Mar 2023 09:24:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t11so20487721lfr.1;
 Wed, 08 Mar 2023 01:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678267472;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uxbbdgsaeX2SJFAau96Av8LR1f6xTscUwN+mV0QH0Rk=;
 b=EVxM3RSCrYqvkulcdEsUxnSa6yq/7gDQ3fmkA501JIUUyOSzdQqIY8z1vze0NkmFp0
 xrS8Uw8PaZiZXEuciAQp4tJvP2nItrBBgd4aJhhxspf/jGLRNV55bUIVu57I/T8usRd+
 4klc0B1Ddk6EEwTjqhUpuwwOHnGEIxoWMXRTOa9/O4meSLynjSpGFZgEWcayCdxXITNv
 g+xcTweC+7/XfutCuk2PaCKybc6kx6C+8I5VnoZe+sULzOcCFjWdVsrXmK1z81PIwoTh
 lV7kozh25Cnx6JOLMdMprKT3DfARDaxVLNgOS6fsE2GtC51xQNz+D28n3QN7oDsZz+Ib
 8oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678267472;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxbbdgsaeX2SJFAau96Av8LR1f6xTscUwN+mV0QH0Rk=;
 b=AEmwhewr6Gbn9AMwK9xSmDQ9CCLWZra2TRje1FbcPuJwfeQ3c9DZGv9xvJMl0BEd27
 bmiFQvK3gUoTvkGYVrQDUyqpAEPSZx3T7mZ9ip9XcuQS63fTbd51IjE6FHtcbgySdASf
 7LDhQKeWJJuLvBvwf0+r3/g/8A/dyY21GVUdZB/UPJre9ZHcBlybo4nZ3vd3DH8TuYdz
 onQxmgt6k5EcK57WS6KPHsAkp/a/whEnb7BlJioOEXDiTsdgFXmdII4ITJCNbETmV9Fg
 zEaQbLAeASm5llkS7pHvgXrE9pxTpEhcmMxtS5xL2YB3LdV/kuGC4jEUYx+d3ImZ/6Be
 IUrA==
X-Gm-Message-State: AO0yUKV6VpQv0JrTing2LVkw3++St2zeg+3VrLRGVBq9Cv1En69/pUGA
 8a3I8Yf+ZG8ZLQo5P4pltXY=
X-Google-Smtp-Source: AK7set/TcUCsHit7D7nWxfo+2cMWAM6dWqEZKxdFPBxlJXiRUPMdeU/xNydiocC9TKPdKC42ThklJA==
X-Received: by 2002:ac2:5969:0:b0:4d8:65c5:8684 with SMTP id
 h9-20020ac25969000000b004d865c58684mr5994748lfp.58.1678267472226; 
 Wed, 08 Mar 2023 01:24:32 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h23-20020ac250d7000000b004db3eff4b12sm2289945lfm.171.2023.03.08.01.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:24:31 -0800 (PST)
Date: Wed, 8 Mar 2023 11:24:28 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230308112428.162e4160@eldfell>
In-Reply-To: <20230307151107.49649-10-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k4s_qTmYcInQhGdePE0z+yW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/k4s_qTmYcInQhGdePE0z+yW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:59 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> We want compositors to be able to set the output
> colorspace on DP and HDMI outputs, based on the
> caps reported from the receiver via EDID.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f91b2ea13d96..2d883c6dae90 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struct dr=
m_connector *connector)
>  	return amdgpu_dm_connector->num_modes;
>  }
> =20
> +static const u32 supported_colorspaces =3D
> +	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020) |
> +	BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);

No DEFAULT?
No BT.709 RGB, i.e. sRGB?

Doesn't DRM core reject enum uint values that are not listed in the enum
property?


Thanks,
pq

> +
>  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>  				     struct amdgpu_dm_connector *aconnector,
>  				     int connector_type,
> @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu=
_display_manager *dm,
>  				adev->mode_info.abm_level_property, 0);
>  	}
> =20
> +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> +		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, suppo=
rted_colorspaces))
> +			drm_connector_attach_colorspace_property(&aconnector->base);
> +	} else if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> +		   connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> +		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, support=
ed_colorspaces))
> +			drm_connector_attach_colorspace_property(&aconnector->base);
> +	}
> +
>  	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
>  	    connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
>  	    connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {


--Sig_/k4s_qTmYcInQhGdePE0z+yW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIVEwACgkQI1/ltBGq
qqcOaBAAl/ZpEailuwu0FeJfKEqJXUrK+Wdzuyikckhg7RGGEKY5FssVVFurfAwy
lczbWcKKu2u9ZcaYjR6UjIlH5DenSewcIRP34Rp9vnw1rLTn6W6kpmGCpzHOpU/8
Re1cuCSSDgtKOK4+28XjdI1eNiw+EWcsVkSe6wvcfiCAjDi9eBr8/Nuq2Xhjfo60
g509l8KiuEPf6FGNrFsDZ9lHIcDvCBeVbqPbbnKn6Lpe7BJCFQoj8oLynz7o9xac
ecGvACZkh+NUQ/7Y9ADEuRZS0kNXUVKT1fhz40N8KICy4c6DaZrspVQSXXnNyY4d
bQ6BXb83xjfXfwbbaIIRvz2mmf8HGRwrZidJzrlWpz06/J5PTIGQqyFgJxGeOyQy
tqZSBocMC9kbBipvT0hwAvHH2NP+UwJhLlGl+jq8SxnPGBuAM4tsQeEjK4yOZUM/
G8pooP6HavUNnrRMwoEEhKM6gYjjXzeta8G5gq4vbeRmpICeyDr18E3Xb/0b8rpR
sd0y1HuMeJoE6ShKV+T9957W9XR8SX8RVgQKdEzREWoNyTpT9gihgeub4zJ4MRs1
L1n1fJnipNHJVum6tl+E6POvPc+ByMuDNL61jnKxq6+VXq4PjNEul+1pMDMSg+su
xuxd8FnwqXy8E4ljTh08A9cz0Td5dgZcF2wUdimtbFMIOFPNF/U=
=sCEb
-----END PGP SIGNATURE-----

--Sig_/k4s_qTmYcInQhGdePE0z+yW--
