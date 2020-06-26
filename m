Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0824F20AED2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCDE6E03B;
	Fri, 26 Jun 2020 09:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B066E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:15:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i3so9579270ljg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=E0fFiTGcQl7WvMKPBAqYQYOoBgNAAmxygc1UjaXy4jc=;
 b=jVe0XJRch2D/DFdm0gKpHuMUDpI7PoDVaT31OwLfaaNF9FIiQFxYXez510NrQ0AH1n
 tB0kAy2B1j0qxylA0BAeTaqmtSKQPdfWsM3V1L/71r9ZmSt5LmoLDJT7I+XTc5YDqXfC
 V86aFuXdZqPEnA3OV+X+8zu93QkCB+8bNcs9NF2Sp2WeFcQ8buv6lgohHaM9Xb6EZvUj
 kD6C+AvwR8FJr7YZEA7UtTzVWvHdmy1BykRCnfgzpqHck9oVK/U+O6Zx3YU9q2fKx6FW
 mPQWeHudcGsmXtuV/bGhgSM92fvmlk/yZOkXrPX8Arkl+klMtZNnMfA1I10h7fZgOMk9
 l5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=E0fFiTGcQl7WvMKPBAqYQYOoBgNAAmxygc1UjaXy4jc=;
 b=jiBLdWa2oVX/JUlkErUQYw6vx+gL95jt5tdkCRaLUcvCnvQcHoHk11TrDIirHiLskP
 t4Sdjh68oa1Iz4fWm+yh1VBOUCtwYl7AZB6xIIeJH3pbzrceIn6uuAJjrU3SCp8VnKXh
 EAqPRxvl4Cp0AiinEaoVlF06tS3FPybqpInnlOKegTNWED0jtRsdg+jexO+SUGALYxAc
 ylHFof9NIcrOAbzgSKidTZDBiE+QuA+prTe1mlyLeg294En94fQuU0IuN4gpOSL+1Mnu
 Xfo5epChFOhoRqpLi7RYNlkBAyZ6i4FM0eNfw2dhwfVw5+LUJVBP6paATEukzRB2IaDq
 LqMA==
X-Gm-Message-State: AOAM533NSDauLfs4c75h8gvR7gJjluKWP4yIlMmVnfmf6S7ru30h1Qvw
 0qTRFYtNMVoAVkG3LoYBE0A=
X-Google-Smtp-Source: ABdhPJz14tlgPpBb6qcDmJd/yADpAsk8IqvBgWLbz3jdabbg4C2vC4D85JRsZmB0/fIN/1ZMds/zwA==
X-Received: by 2002:a2e:9a09:: with SMTP id o9mr922718lji.323.1593162945427;
 Fri, 26 Jun 2020 02:15:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k6sm2885753lfm.89.2020.06.26.02.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 02:15:45 -0700 (PDT)
Date: Fri, 26 Jun 2020 12:15:41 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm: expose connector status values in uapi
Message-ID: <20200626121541.31835549@eldfell>
In-Reply-To: <-LYZxtmyBTf36wklyxa0PphDQ1FecAgEF7TMnSvyCm9Y_EFmz-4AUROX6qc4HKUjomE0HumDgVrSIbHsUMJnRSrBR2c3gPCVDNUmz7klPkE=@emersion.fr>
References: <-LYZxtmyBTf36wklyxa0PphDQ1FecAgEF7TMnSvyCm9Y_EFmz-4AUROX6qc4HKUjomE0HumDgVrSIbHsUMJnRSrBR2c3gPCVDNUmz7klPkE=@emersion.fr>
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
Content-Type: multipart/mixed; boundary="===============0606213309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0606213309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Osc9ZI2fVVS_ei/kIZgkJ0h"; protocol="application/pgp-signature"

--Sig_/Osc9ZI2fVVS_ei/kIZgkJ0h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2020 07:55:12 +0000
Simon Ser <contact@emersion.fr> wrote:

> Right now user-space doesn't have access to connector status definitions.
> This means user-space needs to maintain a separate enum for these, and
> makes it difficult to document the uapi.
>=20
> Introduce defines in drm_mode.h, and copy over the docs. Keep using the
> drm_connector_status enum in drivers, because it allows for nice things
> when using the enum as a type.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>=20
> - Would something like this be desirable?
> - Docs are just copied over for now, not improved
> - Same applies to e.g. the subpixel field

Hi,

xf86drmMode.h in libdrm already has:

typedef enum {
        DRM_MODE_CONNECTED         =3D 1,
        DRM_MODE_DISCONNECTED      =3D 2,
        DRM_MODE_UNKNOWNCONNECTION =3D 3
} drmModeConnection;

I have no opinion really if adding yet another set of the same
definitions is good or not. We do need the UAPI doc, but that does not
necessarily mean we also need definition code in UAPI headers.

I give this one a *shrug*.


Thanks,
pq


>  include/drm/drm_connector.h | 30 ++++--------------------------
>  include/uapi/drm/drm_mode.h | 27 ++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 27 deletions(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fd543d1db9b2..f48f8072aa89 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -53,34 +53,12 @@ enum drm_connector_force {
>  /**
>   * enum drm_connector_status - status for a &drm_connector
>   *
> - * This enum is used to track the connector status. There are no separate
> - * #defines for the uapi!
> + * This enum is used to track the connector status. See the uapi docs.
>   */
>  enum drm_connector_status {
> -	/**
> -	 * @connector_status_connected: The connector is definitely connected to
> -	 * a sink device, and can be enabled.
> -	 */
> -	connector_status_connected =3D 1,
> -	/**
> -	 * @connector_status_disconnected: The connector isn't connected to a
> -	 * sink device which can be autodetect. For digital outputs like DP or
> -	 * HDMI (which can be realiable probed) this means there's really
> -	 * nothing there. It is driver-dependent whether a connector with this
> -	 * status can be lit up or not.
> -	 */
> -	connector_status_disconnected =3D 2,
> -	/**
> -	 * @connector_status_unknown: The connector's status could not be
> -	 * reliably detected. This happens when probing would either cause
> -	 * flicker (like load-detection when the connector is in use), or when a
> -	 * hardware resource isn't available (like when load-detection needs a
> -	 * free CRTC). It should be possible to light up the connector with one
> -	 * of the listed fallback modes. For default configuration userspace
> -	 * should only try to light up connectors with unknown status when
> -	 * there's not connector with @connector_status_connected.
> -	 */
> -	connector_status_unknown =3D 3,
> +	connector_status_connected =3D DRM_MODE_STATUS_CONNECTED,
> +	connector_status_disconnected =3D DRM_MODE_STATUS_DISCONNECTED,
> +	connector_status_unknown =3D DRM_MODE_STATUS_UNKNOWN,
>  };
> =20
>  /**
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 735c8cfdaaa1..0deffda35487 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -363,6 +363,31 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK	18
>  #define DRM_MODE_CONNECTOR_SPI		19
> =20
> +/**
> + * @DRM_MODE_STATUS_CONNECTED: The connector is definitely connected to
> + * a sink device, and can be enabled.
> + */
> +#define DRM_MODE_STATUS_CONNECTED 1
> +/**
> + * @DRM_MODE_STATUS_DISCONNECTED: The connector isn't connected to a
> + * sink device which can be autodetect. For digital outputs like DP or
> + * HDMI (which can be realiable probed) this means there's really
> + * nothing there. It is driver-dependent whether a connector with this
> + * status can be lit up or not.
> + */
> +#define DRM_MODE_STATUS_DISCONNECTED 2
> +/**
> + * @DRM_MODE_STATUS_UNKNOWN: The connector's status could not be
> + * reliably detected. This happens when probing would either cause
> + * flicker (like load-detection when the connector is in use), or when a
> + * hardware resource isn't available (like when load-detection needs a
> + * free CRTC). It should be possible to light up the connector with one
> + * of the listed fallback modes. For default configuration userspace
> + * should only try to light up connectors with unknown status when
> + * there's not connector with @connector_status_connected.
> + */
> +#define DRM_MODE_STATUS_UNKNOWN 3
> +
>  struct drm_mode_get_connector {
> =20
>  	__u64 encoders_ptr;
> @@ -379,7 +404,7 @@ struct drm_mode_get_connector {
>  	__u32 connector_type;
>  	__u32 connector_type_id;
> =20
> -	__u32 connection;
> +	__u32 connection; /**< see DRM_MODE_STATUS_* */
>  	__u32 mm_width;  /**< width in millimeters */
>  	__u32 mm_height; /**< height in millimeters */
>  	__u32 subpixel;


--Sig_/Osc9ZI2fVVS_ei/kIZgkJ0h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl71vL0ACgkQI1/ltBGq
qqdTyQ/+OhQPefSXEyazVgLGoYsESjjnLfQOLDEcRMU0HgUErj/OhXpyxq/UEzju
/uuu+kQ3IIHhR9OKEmoDZstSUKAB6Hu/RVPz4LHIIeRf7N9WjgvUXXSmRQ3KSCm7
RVy6j4sdrTZyKlnIoacFkoKZgD5BhjufA3PqOT7790Y/6RN2ISxfogpFOskAjD9r
97c10kpUqyZbyDW1X4k6KLOCkBcW+2JZboHrPEL+ztSJCLkkrkZ5eDXUztypGJN6
e1oMDuHs5IUgM1lYfdooLBY/gbNi6sAcyU72iEXsK5UVjrUt8mMxTVLYGhlgAqb2
VerB5VlFoapY3hYNApXPr/XYXimY217zaKpEghZy+RAB2fNBASw1IfH1QErwqU7Q
7FvQaH07Y7s5xfdAQyeFKoRoCV238XsH4nLm5+f3HSyJSWrxKqOb3+dQW1p/9FyL
+GpFrvKe/3KjcGGdCT4GRRWU3DQwzCyJ8rFCrSbc9z6KmYddKloGPWngEY97lOrN
qPHCSfr/KuAC/cV3xgH8cTXhLLEtoxtzaSDA3TkMVJcqlwqFUarrHn825BPOHSEL
ZoEMtaRxlYmfGpbFpxNK7OXFylEnKE6I4tKbYYxAmUeuc+fbhWeySMzUuIkDQ9Ww
sL4rgGthetcz4dz6K8L0ltbWlJz9llMoKYz+nWXw870Id4n7dzA=
=xwSE
-----END PGP SIGNATURE-----

--Sig_/Osc9ZI2fVVS_ei/kIZgkJ0h--

--===============0606213309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0606213309==--
