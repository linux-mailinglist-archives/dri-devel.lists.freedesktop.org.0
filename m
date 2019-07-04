Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8465F6D3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 12:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC76E2F9;
	Thu,  4 Jul 2019 10:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA256E2F9;
 Thu,  4 Jul 2019 10:53:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so3926401lfm.11;
 Thu, 04 Jul 2019 03:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4fGdmAcyEGjwfierR0qUvMKQkhMW8a91s2mnsUs9zGg=;
 b=jTtTbZQzxLMMr5yCpcAL3pAax8jJmQ6wknSKrv7I+0lobk3RjoHQ9UGuuHTRSP3TJp
 H8VFfoowLitBoQLe7gnh9VSn3uOdBSgYWXtZ22IkbnGFiIWVcjEsCs722/8/iQWDaukm
 3K3zdlC4qNMSnSj3euMpoOpyBC9xwtrhcANJkuCKF3ZppE+XR7OPYzHLnASzDC5niXAj
 fIzZ0cLib52lgP/KbHvd8ANVOvFXaSgOAn1hSYLxGJw7a0zzDAMZqPX4kFclVJ6M+jmq
 0Pihu0VMtpGsbuBu/xTeC6Qnh5eSnsV7yJs31B9/5CdiZZB/8Nc/n3dNk9vEe/y+WCu5
 ovJA==
X-Gm-Message-State: APjAAAVsTAAmyLRMZjM/CS5SIlwO+1gmd3Zh5ejIqihFIHPJZfRFE16c
 gJ3PjPlQyegktmi7xLD7sTMPLCWH
X-Google-Smtp-Source: APXvYqx+mNVjZNwRdTW6ItFvK01X21wHRhPZ3C+JoAHjtdGuUo7b14T0QH56KT8CLfLKCOJNZIVTbw==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr19708390lfh.177.1562237595112; 
 Thu, 04 Jul 2019 03:53:15 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n24sm1053882ljc.25.2019.07.04.03.53.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 03:53:14 -0700 (PDT)
Date: Thu, 4 Jul 2019 13:53:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 04/11] drm: revocation check at drm subsystem
Message-ID: <20190704135304.6d3437fa@eldfell.localdomain>
In-Reply-To: <20190507162745.25600-5-ramalingam.c@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-5-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=4fGdmAcyEGjwfierR0qUvMKQkhMW8a91s2mnsUs9zGg=;
 b=KugJuPOT8OXJKdkj9WUQDANbpKZ4P5DDHQUQMOGPPRsvw7rM6JqNZWCtcNFtYevf8y
 8VdVWQcWBc+/yA9gWR4nUiyE1sIQdCP5Mr7d3ME8HxbI9L8Da1YMuRx2S3YMVmoW7lWK
 VIVA6k92Anwhp6kGtmmxkYtRjqbo7KMNDinkGFZ8y5VtS1aStrclIBSjCEKynnFt2R22
 n9PazDPv+AzQbZefRJAHVZugAra/boXxp9fSGGnWkriWABYrSR4mBqducebymbT6Pb0V
 JAr6ixvzMtmjA3tzvJIeXLUM3JVN89woN5oz6FvoO6UaxYu4KO3lGOzCoMWgxot0OCcj
 Rp4A==
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
Content-Type: multipart/mixed; boundary="===============1613158578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1613158578==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rG08eCFvcTCUGi931qb70JQ"; protocol="application/pgp-signature"

--Sig_/rG08eCFvcTCUGi931qb70JQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 May 2019 21:57:38 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On every hdcp revocation check request SRM is read from fw file
> /lib/firmware/display_hdcp_srm.bin
>=20
> SRM table is parsed and stored at drm_hdcp.c, with functions exported
> for the services for revocation check from drivers (which
> implements the HDCP authentication)
>=20
> This patch handles the HDCP1.4 and 2.2 versions of SRM table.
>=20
> v2:
>   moved the uAPI to request_firmware_direct() [Daniel]
> v3:
>   kdoc added. [Daniel]
>   srm_header unified and bit field definitions are removed. [Daniel]
>   locking improved. [Daniel]
>   vrl length violation is fixed. [Daniel]
> v4:
>   s/__swab16/be16_to_cpu [Daniel]
>   be24_to_cpu is done through a global func [Daniel]
>   Unused variables are removed. [Daniel]
>   unchecked return values are dropped from static funcs [Daniel]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Acked-by: Satyeshwar Singh <satyeshwar.singh@intel.com>
> Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |   6 +
>  drivers/gpu/drm/Makefile              |   2 +-
>  drivers/gpu/drm/drm_hdcp.c            | 333 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h        |   4 +
>  drivers/gpu/drm/drm_sysfs.c           |   2 +
>  include/drm/drm_hdcp.h                |  24 ++
>  6 files changed, 370 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_hdcp.c
>=20
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/dr=
m-kms-helpers.rst
> index 14102ae035dc..0fe726a6ee67 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -181,6 +181,12 @@ Panel Helper Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
>     :export:
> =20
> +HDCP Helper Functions Reference
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_hdcp.c
> +   :export:
> +
>  Display Port Helper Functions Reference
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

...

> +/**
> + * drm_hdcp_check_ksvs_revoked - Check the revoked status of the IDs
> + *
> + * @drm_dev: drm_device for which HDCP revocation check is requested
> + * @ksvs: List of KSVs (HDCP receiver IDs)
> + * @ksv_count: KSV count passed in through @ksvs
> + *
> + * This function reads the HDCP System renewability Message(SRM Table)
> + * from userspace as a firmware and parses it for the revoked HDCP
> + * KSVs(Receiver IDs) detected by DCP LLC. Once the revoked KSVs are kno=
wn,
> + * revoked state of the KSVs in the list passed in by display drivers are
> + * decided and response is sent.
> + *
> + * SRM should be presented in the name of "display_hdcp_srm.bin".
> + *
> + * Returns:
> + * TRUE on any of the KSV is revoked, else FALSE.

Hi,

this does not seem to be specifying the file format. Since this file is
expected to be provided by vendors and not the driver developers AFAIU,
I think the file format counts as UAPI and needs to be explicitly and
unambiguously specified. Especially as the file or the file format are
not tied to a specific DRM driver or any driver. A searchable reference
to a particular revision of a public specification document could
suffice if such exists.

This doc comment is only kernel internal API. I would also expect UAPI
documentation for the same reason as above.

The Weston work[1] does not validate the UAPI added in this patch.


[1] https://gitlab.freedesktop.org/wayland/weston/merge_requests/48

Thanks,
pq

> + */
> +bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
> +				 u32 ksv_count)
> +{
> +	u32 rev_ksv_cnt, cnt, i, j;
> +	u8 *rev_ksv_list;
> +
> +	if (!srm_data)
> +		return false;
> +
> +	mutex_lock(&srm_data->mutex);
> +	drm_hdcp_request_srm(drm_dev);
> +
> +	rev_ksv_cnt =3D srm_data->revoked_ksv_cnt;
> +	rev_ksv_list =3D srm_data->revoked_ksv_list;
> +
> +	/* If the Revoked ksv list is empty */
> +	if (!rev_ksv_cnt || !rev_ksv_list) {
> +		mutex_unlock(&srm_data->mutex);
> +		return false;
> +	}
> +
> +	for  (cnt =3D 0; cnt < ksv_count; cnt++) {
> +		rev_ksv_list =3D srm_data->revoked_ksv_list;
> +		for (i =3D 0; i < rev_ksv_cnt; i++) {
> +			for (j =3D 0; j < DRM_HDCP_KSV_LEN; j++)
> +				if (ksvs[j] !=3D rev_ksv_list[j]) {
> +					break;
> +				} else if (j =3D=3D (DRM_HDCP_KSV_LEN - 1)) {
> +					DRM_DEBUG("Revoked KSV is ");
> +					drm_hdcp_print_ksv(ksvs);
> +					mutex_unlock(&srm_data->mutex);
> +					return true;
> +				}
> +			/* Move the offset to next KSV in the revoked list */
> +			rev_ksv_list +=3D DRM_HDCP_KSV_LEN;
> +		}
> +
> +		/* Iterate to next ksv_offset */
> +		ksvs +=3D DRM_HDCP_KSV_LEN;
> +	}
> +	mutex_unlock(&srm_data->mutex);
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
> +
> +int drm_setup_hdcp_srm(struct class *drm_class)
> +{
> +	srm_data =3D kzalloc(sizeof(*srm_data), GFP_KERNEL);
> +	if (!srm_data)
> +		return -ENOMEM;
> +	mutex_init(&srm_data->mutex);
> +
> +	return 0;
> +}
> +
> +void drm_teardown_hdcp_srm(struct class *drm_class)
> +{
> +	if (srm_data) {
> +		kfree(srm_data->revoked_ksv_list);
> +		kfree(srm_data);
> +	}
> +}
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index e19ac7ca602d..476a422414f6 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -201,3 +201,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, v=
oid *data,
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int inde=
nt,
>  				const struct drm_framebuffer *fb);
>  int drm_framebuffer_debugfs_init(struct drm_minor *minor);
> +
> +/* drm_hdcp.c */
> +int drm_setup_hdcp_srm(struct class *drm_class);
> +void drm_teardown_hdcp_srm(struct class *drm_class);
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index ecb7b33002bb..18b1ac442997 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -78,6 +78,7 @@ int drm_sysfs_init(void)
>  	}
> =20
>  	drm_class->devnode =3D drm_devnode;
> +	drm_setup_hdcp_srm(drm_class);
>  	return 0;
>  }
> =20
> @@ -90,6 +91,7 @@ void drm_sysfs_destroy(void)
>  {
>  	if (IS_ERR_OR_NULL(drm_class))
>  		return;
> +	drm_teardown_hdcp_srm(drm_class);
>  	class_remove_file(drm_class, &class_attr_version.attr);
>  	class_destroy(drm_class);
>  	drm_class =3D NULL;
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 1cc66df05a43..2f0335d0a50f 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -265,4 +265,28 @@ void drm_hdcp_cpu_to_be24(u8 seq_num[HDCP_2_2_SEQ_NU=
M_LEN], u32 val)
>  	seq_num[2] =3D val;
>  }
> =20
> +#define DRM_HDCP_SRM_GEN1_MAX_BYTES		(5 * 1024)
> +#define DRM_HDCP_1_4_SRM_ID			0x8
> +#define DRM_HDCP_SRM_ID_MASK			(0xF << 4)
> +#define DRM_HDCP_1_4_VRL_LENGTH_SIZE		3
> +#define DRM_HDCP_1_4_DCP_SIG_SIZE		40
> +#define DRM_HDCP_2_SRM_ID			0x9
> +#define DRM_HDCP_2_INDICATOR			0x1
> +#define DRM_HDCP_2_INDICATOR_MASK		0xF
> +#define DRM_HDCP_2_VRL_LENGTH_SIZE		3
> +#define DRM_HDCP_2_DCP_SIG_SIZE			384
> +#define DRM_HDCP_2_NO_OF_DEV_PLUS_RESERVED_SZ	4
> +#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)	(((byte) & 0xC) >> 6)
> +
> +struct hdcp_srm_header {
> +	u8 srm_id;
> +	u8 reserved;
> +	__be16 srm_version;
> +	u8 srm_gen_no;
> +} __packed;
> +
> +struct drm_device;
> +
> +bool drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
> +				 u8 *ksvs, u32 ksv_count);
>  #endif


--Sig_/rG08eCFvcTCUGi931qb70JQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0d2pAACgkQI1/ltBGq
qqd9Gg//b3bZmP0zy7eE2o+TrNCygmK/vcktpfXtffSXUHKLxcdhPlVqz1eMHmIm
mOI1CSg32xkgwiFfNtCZ4JzKv4mokYyuQpnlFd4/kiRVPdqM0fboN4qeh+7b5FO7
+mN9kMgPQ0m2CoLkkYalHMbz4vM1PjBad1jSeAFcDnXWek3XLbc8AyIpVpFAxUkH
wg2Bjz3u5sKhMLYXAB8wAOp/5ReLRA/57qghJmjKIj1wXsw2JWbvnHylzqmx2ToK
pNeDidefvxub2l5rdc2s7jtIWdLPJmphgLiRPSeIdsW6ryIgNRIL/oyOB4MTgZm5
45PEcLOopPa1WsQBHu7C4Ph+frxM1TGm1E4+r/aEHx4xzlKWvJfugKh9/2HP6DCS
01I7ee8fraUJkr/YDgAfkKjlNGt17bomWZq0W0LsCiyNhmW8pjLQl1gJTuTv6SY/
9bceuBWOrAqQyyiz1/Jzg4Vl1sSJEjathcdraarUDLgXCPs2HPSUf1robr5E+Yuh
c8mPr2nZS0FyQg2dwCF1CwWOvxUsDN1KTHbs+6BjPW2YD9bbxDmuHA1W2Ghe9W/N
e8sCwwdrKdgSeiGxhqokQNqPoJLDGlzrrNVaetvZC/+pvkmteqfqcr2Ipd6SqitH
mQ14ZQ2cqQ+VZMJ5tqMLD4iSQ8EcBGuUcx0tejy3lR4tQir+Swo=
=21yO
-----END PGP SIGNATURE-----

--Sig_/rG08eCFvcTCUGi931qb70JQ--

--===============1613158578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1613158578==--
