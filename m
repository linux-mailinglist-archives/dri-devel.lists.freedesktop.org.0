Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52515113B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7F16ED06;
	Mon,  3 Feb 2020 20:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765196ED03;
 Mon,  3 Feb 2020 20:43:06 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u19so7991255qku.8;
 Mon, 03 Feb 2020 12:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JB5uHQw1J4sRAGvv5N+NclAp27+FxAP/ILtnurNfAww=;
 b=fUTpdrQQ84L47+CtICvABIN6sIWJnNzE2xfhD4rOtKbMjtfmb3Ewns2D2V+8lsAVm4
 +kV70nDHQF5tiiiqOD9qxuZX6/QPF7624PLHHB+8622ufmCkAv4ZCcFP9N7qRrFAxIjm
 cZcpZCtPNC9DAP+zt+3QRIP4C+wPPVT1/csdsleNKplVqClUYJKpU6mHGEoZ9dsI2u9I
 Yck3trHBrIp15Y3DJdCjB5qP8BADaZV3v/09MDgJKPh+zu6JGCKoZ9RC7/Cp86JJRBAf
 8eKZJloBlGynknJeSVsfcg14yR4NlEAZjW1kRQoe+mFJvvsqVWlokxazeIkUvvwHYYiG
 ii/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JB5uHQw1J4sRAGvv5N+NclAp27+FxAP/ILtnurNfAww=;
 b=ksMt1ZDSCU8h6paMaFr3pevB5HwzKbZrm8sMnB3S6QGyJb08cuz7lRiTSZ+ArKMvTu
 veTox/ZNtBFvatjUFHkhymgnxvT3uBd26ln3R7h3jMRtNpFe/oZbvf5wFNNQa/RnlJxS
 FUeXD/ye47c3LGd1hs0OrMGoooPzU2PDD00ZesIQPB4p7tpSs5FCzcgnIVBMwsm8tOZF
 hRh7WeEtmOKe+mSQP7P3Lt4eKdK6YljdWFqKRhvqWM03LYJBbHc1Pxei2yygyZHoqBEp
 PkiLruGh6MEo/McTxtTyM5/WFjq/Nl9ZmF7HiT0KqYvrWswncqhYouDCSmJsPtUf1i/U
 UBtQ==
X-Gm-Message-State: APjAAAWpDpMjh5TmF66T7ZHOSWb3hEqkF/q9sdU58BhEy3+i0jbb3qnH
 dicysfdGCsi75woUMYM1rkk=
X-Google-Smtp-Source: APXvYqyfRn82DOpRc7Y1pDwt2dTsj6ijLX7wWXXI0PUPv+PA6UPE2NF34u4ENkQzxZgkfDCJIKoXlw==
X-Received: by 2002:a05:620a:2050:: with SMTP id
 d16mr25614121qka.473.1580762585516; 
 Mon, 03 Feb 2020 12:43:05 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id m10sm9821960qki.74.2020.02.03.12.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 12:43:04 -0800 (PST)
Date: Mon, 3 Feb 2020 15:43:01 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
Subject: Re: [PATCH V5] drm: Add support for DP 1.4 Compliance edid
 corruption test
Message-ID: <20200203204301.6hqg7xglumvvugwz@smtp.gmail.com>
References: <20200131202451.8994-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
In-Reply-To: <20200131202451.8994-1-Jerry.Zuo@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, rodrigo.siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, manasi.d.navare@intel.com,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============0325820986=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0325820986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjlxqyjqd4bclb7n"
Content-Disposition: inline


--jjlxqyjqd4bclb7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jerry,

First of all, thanks for your patch. You can see some comments inline,
just simple things.

On 01/31, Jerry (Fangzhi) Zuo wrote:
> Unlike DP 1.2 edid corruption test, DP 1.4 requires to calculate
> real CRC value of the last edid data block, and write it back.
> Current edid CRC calculates routine adds the last CRC byte,
> and check if non-zero.
>=20
> This behavior is not accurate; actually, we need to return
> the actual CRC value when corruption is detected.
> This commit changes this issue by returning the calculated CRC,
> and initiate the required sequence.
>=20
> Change since v5
> - Obtain real CRC value before dumping bad edid
>=20
> Change since v4
> - Fix for CI.CHECKPATCH
>=20
> Change since v3
> - Fix a minor typo.
>=20
> Change since v2
> - Rewrite checksum computation routine to avoid duplicated code.
> - Rename to avoid confusion.
>=20
> Change since v1
> - Have separate routine for returning real CRC.
>=20
> Signed-off-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 35 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++++++++----
>  include/drm/drm_connector.h     |  6 ++++++
>  include/drm/drm_dp_helper.h     |  3 +++
>  4 files changed, 63 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index f629fc5494a4..18b285fa1a42 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -351,6 +351,41 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *=
aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
> =20
> +/**
> + * drm_dp_send_real_edid_checksum() - send back real edid checksum value
> + * @aux: DisplayPort AUX channel
> + * @real_edid_checksum: real edid checksum for the last block
> + *
> + * Returns true on success

I think this should be:

Returns:
True on success...

> + */
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +                                    u8 real_edid_checksum)

Use tabs intead of space

> +{
> +	u8 link_edid_read =3D 0, auto_test_req =3D 0, test_resp =3D 0;
> +
> +	drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);

drm_dp_dpcd_read() documentation says:

 [..]
 Returns the number of bytes transferred on success, or a negative error
 code on failure. [..][1]

How about catching the return value of drm_dp_dpcd_read() and handle it?

1. drivers/gpu/drm/drm_dp_helper.c

> +	auto_test_req &=3D DP_AUTOMATED_TEST_REQUEST;
> +
> +	drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1);

Same

> +	link_edid_read &=3D DP_TEST_LINK_EDID_READ;
> +
> +	if (!auto_test_req || !link_edid_read) {
> +		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");

I'm not 100% sure, but I think that drm_dbg_kms() represents the new
approach for handling debug messages. Could you confirm that? If so,
could you update it?

> +		return false;
> +	}
> +
> +	drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req, 1);
> +
> +	/* send back checksum for the last edid extension block data */
> +	drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, 1);

Again, how about handling the return from drm_dp_dpcd_write?

> +
> +	test_resp |=3D DP_TEST_EDID_CHECKSUM_WRITE;
> +	drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1);
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> +
>  /**
>   * drm_dp_downstream_max_clock() - extract branch device max
>   *                                 pixel rate for legacy VGA
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6c9f84..f064e75fb4c5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1590,11 +1590,22 @@ static int validate_displayid(u8 *displayid, int =
length, int idx);
>  static int drm_edid_block_checksum(const u8 *raw_edid)
>  {
>  	int i;
> -	u8 csum =3D 0;
> -	for (i =3D 0; i < EDID_LENGTH; i++)
> +	u8 csum =3D 0, crc =3D 0;
> +
> +	for (i =3D 0; i < EDID_LENGTH - 1; i++)
>  		csum +=3D raw_edid[i];
> =20
> -	return csum;
> +	crc =3D 0x100 - csum;
> +
> +	return crc;
> +}
> +
> +static bool drm_edid_block_checksum_diff(const u8 *raw_edid, u8 real_che=
cksum)
> +{
> +	if (raw_edid[EDID_LENGTH - 1] !=3D real_checksum)
> +		return true;
> +	else
> +		return false;
>  }
> =20
>  static bool drm_edid_is_zero(const u8 *in_edid, int length)
> @@ -1652,7 +1663,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, =
bool print_bad_edid,
>  	}
> =20
>  	csum =3D drm_edid_block_checksum(raw_edid);
> -	if (csum) {
> +	if (drm_edid_block_checksum_diff(raw_edid, csum)) {
>  		if (edid_corrupt)
>  			*edid_corrupt =3D true;
> =20
> @@ -1793,6 +1804,10 @@ static void connector_bad_edid(struct drm_connecto=
r *connector,
>  			       u8 *edid, int num_blocks)
>  {
>  	int i;
> +	u8 num_of_ext =3D edid[0x7e];
> +
> +	/* Calculate real checksum for the last edid extension block data */
> +	connector->real_edid_checksum =3D drm_edid_block_checksum(edid + num_of=
_ext * EDID_LENGTH);
> =20
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 2113500b4075..b3815371c271 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1357,6 +1357,12 @@ struct drm_connector {
>  	 * rev1.1 4.2.2.6
>  	 */
>  	bool edid_corrupt;
> +	/**
> +	 * @real_edid_checksum: real edid checksum for corrupted edid block.
> +	 * Required in Displayport 1.4 compliance testing
> +	 * rev1.1 4.2.2.6
> +	 */
> +	u8 real_edid_checksum;
> =20
>  	/** @debugfs_entry: debugfs directory for this connector */
>  	struct dentry *debugfs_entry;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 127d6e1d3338..957a3d00ee05 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1459,6 +1459,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm=
_dp_aux *aux,
>  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  				 u8 status[DP_LINK_STATUS_SIZE]);
> =20
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +				    u8 real_edid_checksum);
> +
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4]);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--jjlxqyjqd4bclb7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl44hc8ACgkQWJzP/com
vP9H2BAAxSjPX2v0rVLB7w/jUsBH/vhW77H40YOLnonnoRhxs2fbAkX5ispMo17m
LnzZzAOWO+LXFC3Q8PyXE9th+9fMi8mMA6RTKHa/0EOfRqYEEa0Kz1JWVrRl5qlw
i1MWSGtovlGfK72MoRaIF1GQwIynV5voId/FMuJlHrthJRQWq0CZbfizeZNW/YCC
qlxpoUQ38Iy3Ehf3UHOzYzmOUKm+ub3BLZ6bUxIf6c1v3bkJt4UdVuV7R+q/9rLN
icvbcQGg/GIRRlX27HHFGLEO61YWRCV7/aotLcq9Fr/a7xY3BVy/ZwpWEHGxpcV4
1exdNfDsYSoOq16pr2rA1qLrpLN9XtH/DpCjlHwZIn/xo2UX7436EttmOOg0hlvi
ID2V4C35FLyg1Xi70IVc6S6UIbW35MIfs6yIIxd1r92ayglxgHUxhN6by0PlppeA
4TV2+lyshleAPpzsBnS/90v7s4jiMhy6l46KM+eZi7q1IqqxzmruL3eOfPkQq2M6
eVG8/vkxw8hdaHWLd1X8gfHT00MmKSUx9WM4QZ8jh6d7dhoYX7DSormQzZj5vL4P
uiHGYM2fhnKotQVNenpnUby/yq1vgAH2ygfIX/MOwhAMnG20hLwnrErHYnmBXEMd
pN6ksMGo1vLwfXqd2m+uZPVA5VY6uikQrlqWUkeuQPqmXOYUZWU=
=UJNw
-----END PGP SIGNATURE-----

--jjlxqyjqd4bclb7n--

--===============0325820986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0325820986==--
