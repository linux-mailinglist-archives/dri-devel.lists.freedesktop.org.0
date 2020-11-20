Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B72BA94B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEC26E8AF;
	Fri, 20 Nov 2020 11:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5D6E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:37:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u19so13001132lfr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=cvmOYrWZH8M1+M9FthRkJJ3+PD7XHQNG6Vl5GLxxJk4=;
 b=ifCELjwqzrQ8VS/j81TraPC5vFEjuQz+kNh3RHq6Gdfm6cdyfFXQbTE2WMdBeuiz5V
 icoSHo+MAYo7kQuUheiztwzOywFJiMaG5nvYd7hwDpO5l/2BbmeiH45hiUeQbl0qsygA
 q81OcQIbn+6MaI+wajaPZ5Y62ePbhGzmkGSiaoynHQyKCqT1X+DtcuVXjWY3jsFZei/Y
 LT+T5OlOlP0y6eTCQyal5C/y3qNUyxC7+fXt/S0WaXqxxukYmdC7K+2KKG1U2MuzNPfQ
 zn2CCCTKigjUwzYPaJEaIkOVe+8yiDANlaAOZET4mHcDr3QkmcA7theqFhrmFv8hu8a/
 HVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=cvmOYrWZH8M1+M9FthRkJJ3+PD7XHQNG6Vl5GLxxJk4=;
 b=f2PdPOXt8PDm+IDHUhGYUkPAqx7Bfi2tLptPCS13bqTSpT2PFxwQuo6VqHgNLwRYA1
 xjoK3/id3H7Ohq23p5otd0tTj+Rx9fzWgsPQZpQVBrlLNvvkDou33URmvY0P/m5vu5+t
 aexo/7KH6UxONZVdiKHm1wySgMuZy7hcC43H2hZ3/1NJQA9gdhQ2hG52DswEB72WFjVQ
 vKK+jVjJ0U57kF5VGM/D6DPTAfjd8nDPxlASQO14NYDSL7Hb51vVkJFhRn8O5F3amKZy
 GdxZ3/0vGNSKJlJEUCGFw/JFiEVb0REbQWDLPe0rupUP7kerZ1waeloNeZY+38C3DH9h
 OP7A==
X-Gm-Message-State: AOAM532CtLYIE+PbWKrmLKlHfIvqfWqCRF+k1BwAf6wOzGyr9/6CMQW0
 u1GiWq78HuqteWaGtBEqMtE=
X-Google-Smtp-Source: ABdhPJwZLbK47HZ7u9ZYNyPExaUGSHi/QXxUg71QlAdeUdOtsMOL5N3X+fpqHLQ8rgAW1BUpuBZfXQ==
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr8108939lfm.103.1605872276866; 
 Fri, 20 Nov 2020 03:37:56 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q16sm313175lfc.179.2020.11.20.03.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 03:37:56 -0800 (PST)
Date: Fri, 20 Nov 2020 13:37:46 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm: document drm_mode_get_connector
Message-ID: <20201120133746.5fa5f146@eldfell>
In-Reply-To: <4NxrTtynzPiPX4SOCzxmA1sRB8fVLfeiabVpi5j3Y@cp7-web-041.plabs.ch>
References: <4NxrTtynzPiPX4SOCzxmA1sRB8fVLfeiabVpi5j3Y@cp7-web-041.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1722720195=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1722720195==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Wmg9=PQSHNDlxx7i_m8XIIB"; protocol="application/pgp-signature"

--Sig_/Wmg9=PQSHNDlxx7i_m8XIIB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2020 08:57:33 +0000
Simon Ser <contact@emersion.fr> wrote:

> Document how to perform a GETCONNECTOR ioctl. Document the various
> struct fields. Also document how to perform a forced probe, and when
> should user-space do it.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 78 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 73 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index f29c1d37be67..3979389fcc4f 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -368,27 +368,95 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK	18
>  #define DRM_MODE_CONNECTOR_SPI		19
> =20
> +/**
> + * struct drm_mode_get_connector - Get connector metadata.
> + *
> + * User-space can perform a GETCONNECTOR ioctl to retrieve information a=
bout a
> + * connector. User-space is expected to retrieve encoders, modes and pro=
perties
> + * by performing this ioctl at least twice: the first time to retrieve t=
he
> + * number of elements, the second time to retrieve the elements themselv=
es.
> + *
> + * To retrieve the number of elements, set @count_props and @count_encod=
ers to
> + * zero, set @count_modes to 1, and set @modes_ptr to a temporary struct
> + * drm_mode_modeinfo element.

How are the counts actually returned?

> + *
> + * To retrieve the elements, allocate arrays for @encoders_ptr, @modes_p=
tr,
> + * @props_ptr and @prop_values_ptr, then set @count_modes, @count_props =
and
> + * @count_encoders to their capacity.
> + *
> + * Performing the ioctl only twice may be racy: the number of elements m=
ay have
> + * changed with a hotplug event in-between the two ioctls. User-space is
> + * expected to retry the last ioctl until the number of elements stabili=
zes.
> + * The kernel won't fill any array which doesn't have the expected lengt=
h.

How does userspace realize the kernel didn't fill in the arrays?

> + *
> + * **Force-probing a connector**
> + *
> + * If the @count_modes field is set to zero, the kernel will perform a f=
orced
> + * probe on the connector to refresh the connector status, modes and EDI=
D.
> + * A forced-probe can be slow and the ioctl will block. A force-probe ca=
n cause
> + * flickering and temporary freezes, so it should not be performed
> + * automatically.
> + *
> + * User-space shouldn't need to force-probe connectors in general: the k=
ernel
> + * will automatically take care of probing connectors that don't support
> + * hot-plug detection when appropriate. However, user-space may force-pr=
obe
> + * connectors on user request (e.g. clicking a "Scan connectors" button,=
 or
> + * opening a UI to manage screens).

This is well written.

> + */
>  struct drm_mode_get_connector {
> -
> +	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
>  	__u64 encoders_ptr;
> +	/** @modes_ptr: Pointer to struct drm_mode_modeinfo array. */
>  	__u64 modes_ptr;
> +	/** @props_ptr: Pointer to ``__u32`` array of property IDs. */
>  	__u64 props_ptr;
> +	/** @prop_values_ptr: Pointer to ``__u64`` array of property values. */
>  	__u64 prop_values_ptr;
> =20
> +	/** @count_modes: Number of modes. */
>  	__u32 count_modes;
> +	/** @count_props: Number of properties. */
>  	__u32 count_props;
> +	/** @count_encoders: Number of encoders. */
>  	__u32 count_encoders;
> =20
> -	__u32 encoder_id; /**< Current Encoder */
> -	__u32 connector_id; /**< Id */
> +	/** @encoder_id: Object ID of the current encoder. */
> +	__u32 encoder_id;

This is an out value, not an in value, right?
It's not immediately obvious whether any members here are in, out or
in/out values.

> +	/** @connector_id: Object ID of the connector. */
> +	__u32 connector_id;
> +	/**
> +	 * @connector_type: Type of the connector.
> +	 *
> +	 * See DRM_MODE_CONNECTOR_* defines.
> +	 */
>  	__u32 connector_type;
> +	/**
> +	 * @connector_type_id: Type-specific connector number.
> +	 *
> +	 * This is not an object ID. This is a per-type connector number. Each
> +	 * (type, type_id) combination is unique across all connectors of a DRM
> +	 * device.
> +	 */
>  	__u32 connector_type_id;

Naming facepalm, oh well...

> =20
> +	/**
> +	 * @connection: Status of the connector.
> +	 *
> +	 * See enum drm_connector_status.
> +	 */
>  	__u32 connection;
> -	__u32 mm_width;  /**< width in millimeters */
> -	__u32 mm_height; /**< height in millimeters */
> +	/** @mm_width: Width of the connected sink in millimeters. */
> +	__u32 mm_width;
> +	/** @mm_height: Height of the connected sink in millimeters. */
> +	__u32 mm_height;

These are actually more complicated than this, aren't they?

They could be zero for unknown, or both smaller than 20 (???) to
signify only aspect ratio? I've no idea, I just remember something
funny like that from EDID, do these have the same oddities as EDID?

> +	/**
> +	 * @subpixel: Subpixel order of the connected sink.
> +	 *
> +	 * See enum subpixel_order.
> +	 */
>  	__u32 subpixel;
> =20
> +	/** @pad: Padding, must be zero. */
>  	__u32 pad;
>  };
> =20

Even with these questions open, this is already a huge improvement!


Thanks,
pq

--Sig_/Wmg9=PQSHNDlxx7i_m8XIIB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+3qooACgkQI1/ltBGq
qqfiDQ/+PyNOjwVeqP/Nqv3YSIedt6m3+hijcB3cFD95pXC8sxYfrWXvAqN1DcGP
2a2Ln78Wk4xDwIjlxUAniq0FU57oyw6n3R4lylVIredHD1fZqLrFVn908YRhLJuO
sCRMHjqt12MXd5zEge+zn+h4zlXlg3cnyM6C61yyvlxnyWIijGtfAGjmxSxBlBLB
ZYp/sxxXqyiUf7hKz4Df8MlL/Zxa8KO+zp0309e/s/ijEpAGOpMqmw1a4isFK3I3
WIfDWTp5fcPfmRHT9TWmyXnPCZEVOW+LVxgmW1fxr7tnejFd9vo8x4I4aoKcdb5p
WBq+F1DEzdHsc3NH9bSqsJmTl3DtZJp2Bkbt8CXi0jkv/5Y+R0K2QMsN016/xSyh
JpNLtR0rJx/roNRO/0+D/pgjBv/qNYy7sQduy1MP7J7fah2K/OacbyROVG3ley+d
83d13f2+YVZrCRzBIzzAIi2R7j8sKfYxjDslzpckmKs+PMC6uizLIXFOgeofDFm4
wo0xGVDbFJGqqqCuF3unwsfZhvzOiiQfuVWA2RFf3yiHzwKfwSz3nTjULG7LC14j
lSmL78gbOYyuyODUQwmes0RKqkYiBPI/pdpceYp/7Ukngdce3e0sr8/gUZolxSBs
xC9tglayUN2A3F0HX2r9/1VMCxTZkISciBrTovj67xO51w+KLTU=
=oyCk
-----END PGP SIGNATURE-----

--Sig_/Wmg9=PQSHNDlxx7i_m8XIIB--

--===============1722720195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1722720195==--
