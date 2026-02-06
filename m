Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGVvEPGzhWmbFQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:27:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0502FC02F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEEB10E62B;
	Fri,  6 Feb 2026 09:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O+yU2Fmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A04E10E62B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770370027;
 bh=Zb061o2u6T+vuh50BQT1sN23+REvX+tZuhCJzw9gTjw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O+yU2Fmba/0Uqa7CxrYjq4dF3Ig5B87cLICGMConuDVjMOJvkQ5ktzjHKhA3Sp15c
 BhXDb6CMIFn2xV3/dLhZfeXQM4gPaGrQipAuf4mqn+kJ+u+9jidAeNJIwIKHUaWBKc
 e8y5JBsnF7vP8RTY3Bmu0QuFSM/W18XLbwuthHjBtfEGMVWyYpbEeUUIXG36uNqm8X
 pkLu3f8cB9SSoll2LClzyg8QDixvkg8AzGtBkFME3RbfmTGbEdsrbTpB91o6Hq8BtZ
 7vUXzeu1VGiMEqJkVhSE4R+9qkN9vLUPBQd0nTrhoUkfTCmflcGelcuLU5OGgJLVJY
 C2xE0kd9fp6og==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CD64C17E14F1;
 Fri,  6 Feb 2026 10:27:06 +0100 (CET)
Date: Fri, 6 Feb 2026 11:27:02 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com,
 ariel.dalessandro@collabora.com, kernel@collabora.com
Subject: Re: [PATCH 09/11] drm/colorop: Introduce 3x3 Matrix
Message-ID: <20260206112702.4afdbc48@eldfell>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-9-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-9-0cb99bd0ab33@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2.yaxaBipUpZeYQZFdVp59S";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:nfraprado@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A0502FC02F
X-Rspamd-Action: no action

--Sig_/2.yaxaBipUpZeYQZFdVp59S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Dec 2025 16:44:50 -0300
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:

> Introduce a 3x3 Matrix colorop analogous to the 3x4 Matrix colorop, with
> the difference of not supporting offset coefficients.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  drivers/gpu/drm/drm_colorop.c     | 21 +++++++++++++++++++++
>  include/drm/drm_colorop.h         |  3 +++
>  include/uapi/drm/drm_mode.h       | 16 ++++++++++++++++
>  5 files changed, 44 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 6d3ea8056b60..bf4a31c02b70 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -802,6 +802,7 @@ static void drm_atomic_colorop_print_state(struct drm=
_printer *p,
>  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data->base=
.id : 0);
>  		break;
>  	case DRM_COLOROP_CTM_3X4:
> +	case DRM_COLOROP_CTM_3X3:
>  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data->base=
.id : 0);
>  		break;
>  	case DRM_COLOROP_MULTIPLIER:
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 7320db4b8489..7a70e894a2ef 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -709,6 +709,9 @@ static int drm_atomic_color_set_data_property(struct =
drm_colorop *colorop,
>  		size =3D colorop->size * colorop->size * colorop->size *
>  		       sizeof(struct drm_color_lut32);
>  		break;
> +	case DRM_COLOROP_CTM_3X3:
> +		size =3D sizeof(struct drm_color_ctm);
> +		break;
>  	default:
>  		/* should never get here */
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index a19e03fb9c7c..51c1a0726dfa 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -68,6 +68,7 @@ static const struct drm_prop_enum_list drm_colorop_type=
_enum_list[] =3D {
>  	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
>  	{ DRM_COLOROP_3D_LUT, "3D LUT"},
> +	{ DRM_COLOROP_CTM_3X3, "3x3 Matrix"},
>  };
> =20
>  static const char * const colorop_curve_1d_type_names[] =3D {
> @@ -377,6 +378,26 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device=
 *dev, struct drm_colorop *c
>  }
>  EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
> =20
> +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
> +				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				   uint32_t flags)
> +{
> +	int ret;
> +
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_=
CTM_3X3, flags);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_ctm_3x3_init);
> +
>  /**
>   * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 8ec98521607d..ee7fa0eb5dbf 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -426,6 +426,9 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_de=
vice *dev, struct drm_color
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
>  				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
>  				   uint32_t flags);
> +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
> +				   struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
> +				   uint32_t flags);
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op *colorop,
>  				struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
>  				uint32_t flags);
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index cbbbfc1dfe2b..b894b19eb9f8 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -964,6 +964,22 @@ enum drm_colorop_type {
>  	 *         color =3D lut3d[index]
>  	 */
>  	DRM_COLOROP_3D_LUT,
> +
> +	/**
> +	 * @DRM_COLOROP_CTM_3X3:
> +	 *
> +	 * enum string "3x3 Matrix"
> +	 *
> +	 * A 3x3 matrix. Its values are specified via the
> +	 * &drm_color_ctm struct provided via the DATA property.
> +	 *
> +	 * The DATA blob is a float[9]:
> +	 * out   matrix          in
> +	 * | R |   | 0  1  2 |   | R |
> +	 * | G | =3D | 3  4  5 | x | G |
> +	 * | B |   | 6  7  8 |   | B |
> +	 */
> +	DRM_COLOROP_CTM_3X3,
>  };
> =20
>  /**
>=20

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

FWIW, the statement "The DATA blob is a float[9]" is incorrect, but the
same wording exists already with the DRM_COLOROP_CTM_3X4. The data type
is not a float, nor is it a float reinterpreted as __u64 (they are not
even the same size). Documentation for the structs explains the correct
type, which is a fixed-point number.

The struct types document also the layout, so there is no need to
repeat the layout here. It may be worth mentioning that the blob must
contain exactly one instance of the struct.


Thanks,
pq


--Sig_/2.yaxaBipUpZeYQZFdVp59S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmFs+YACgkQI1/ltBGq
qqdLZxAAowBRehNNDn134OdW3p9/J7Ov6M3ZRZJ5mvJHhy+9eQuv4tao6jp/IM4o
eEOex+lXfrOtImJqaUuTN8o1HNQXZCuI55utd84lIhpk6Vd6DH//nM6VL79eRQUR
iyTybLFjztX+TzSA0tUA+tneFOK7oUJwT8TL4r02loEsTgf+R9lHWM3FpbJZZTPX
DD2WcArBLo4BDaw80jQtziXPiCAFFPae0syhAoer1lirJYfvQBGTRf7sGC//TEAW
yN3le0djZZpotHkaOaZR9T0p+7E+LjfsimVlTDxPjDFzo5X8zAebIcoBRdusAQcp
qYF3PGHRkChjcjL731IGmq86ximudssjo5CYY5P8W4XfZUBd4LJRaP7OvDf+0zfO
S/JBpJFjQN1zPhojqVOQ3Tc/zL7PqoU3TUrRKPID2OQqSPPOMTSch+xbrdTuAFhC
mGTZ3bXk0LIfztAyoGjvw7itFdGOuw3dU0hQ2acqrlFnFyKHT0Xj8S/If9JpQW/L
OnoOH5MSh29ZVrpn4/SO7iRfof1n96lROvOXT9NYfZOLVr4lbG1SeQQX1T3Qk6F9
iHVQSfAha+xSK2MbwbygjSsosxAS7qHgWY7mfjVgqCBXv2kfA0GDEZsfmhNS5eB5
zd2JaHP8WoH6xaYTxkUBNcMH3iFbqlxO8xwEbi1XLAfC8ajYe8g=
=7wMB
-----END PGP SIGNATURE-----

--Sig_/2.yaxaBipUpZeYQZFdVp59S--
