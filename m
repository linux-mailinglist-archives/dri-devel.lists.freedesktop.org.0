Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12071455810
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B5C6EC67;
	Thu, 18 Nov 2021 09:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FFA6EC51;
 Thu, 18 Nov 2021 09:32:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n12so23040526lfe.1;
 Thu, 18 Nov 2021 01:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=H62YmR0r6qfYVYBLURiWsW7XoSm2BAd19sksFF424Ck=;
 b=QyqqHZwZISovztE/SjwSk/YB6QWa9YprX2SsUEkGsmBj3vpUO2tTB8BX5fZg+nkSUT
 dvhsyXeQXcsyev6F6ZzrOS5vTKmJpX62eo/vAnIVNN7VhUrmzSbTOtgdiUgDFlmwp9dp
 /XvL7/t5N08M6LSt+Tem7Z+dVezsk9f90S8+EczUvFvho8sLI3jXNje1UueR4pgwXZEI
 oB8ijXnQM04oaoUJbNwxKvl/S82u1qx7Qsh++INBffCGoomldUKJ+A0Art2BuIJ7YG4O
 QeklTorwtZjVHngK9loyU9hA7b4xBDZ1G1vRfKJJ1IHyhpYYP4EpghW+PptvhjB/o6yu
 CaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=H62YmR0r6qfYVYBLURiWsW7XoSm2BAd19sksFF424Ck=;
 b=wJ4tm3VEHk2fcA1YAm/pNAdWJl9MbNIJGpaBZBDMF3zA3tcieMzgydtUnxjRwEZ6Az
 ZkL6+u8a+hIKmwGsYpqLpe8RixzCyRZ64VdplIUgqm9aYCeaAnsmzqPAMmUuFfPaqcYC
 lGZpEoYu1Z8qUQTdhcou+lJeymrp/GWlnCyBGiPzL6bxUPrHVbOmhGvQ1+e7ymH6ZhOc
 +nlExsjQfFTrEqDuvrfz/BLSIsr/vsPzPeFHH0Wkcta5IFtKlw7m6kCE0nqMe67pUtQ7
 j1Xzeuzay2IGfKyIjClc7iw+5YP88rktrYRMt5FT9YM2GhGp/9PGSt9n9Umq1tWDQ4Mb
 2pTA==
X-Gm-Message-State: AOAM530nTXD5KBH8tcp0IxJkYVKPlBvzBoMI86ZULLnwKXOy0RgQbAYt
 uX33TeF/Jc8GtlvkdhW5N4c=
X-Google-Smtp-Source: ABdhPJxgJBFj6FcreHn1i7lUZ7HQm9U4HwHhj8Z+LClk4uCGwPD0l2RzqDLvqzEovsISy4Ur81dAJA==
X-Received: by 2002:a05:6512:a8c:: with SMTP id
 m12mr21420413lfu.149.1637227925735; 
 Thu, 18 Nov 2021 01:32:05 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e19sm229557ljn.82.2021.11.18.01.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:32:05 -0800 (PST)
Date: Thu, 18 Nov 2021 11:32:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 08/14] tests/kms_color_chamelium: New subtests for Plane
 gamma
Message-ID: <20211118113202.0ff5dcae@eldfell>
In-Reply-To: <20211115094759.520955-9-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-9-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DM7Ix.e0MwQe2XWOMdbvF+";
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
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:53 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
> with a maxed out gamma LUT and verify we have the same frame dump as
> drawing solid color rectangles.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_chamelium.c | 188 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 187 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> index 76f82d6d35..b506109271 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -24,7 +24,34 @@
> =20
>  #include "kms_color_helper.h"
> =20
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium =
to verify instead of CRC");
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level using Ch=
amelium to verify instead of CRC");

Now that you actually can get a captured image of the result with
Chamelium, I think the tests should be more ambitious. Do not rely on
identity curves or matrices, nor max LUT, because now you can use a
difference threshold per pixel when comparing the result with the
reference.

Use various non-trivial curves, different for each of red, green and
blue. Use non-trivial matrices that actually compute mixtures instead
of just moving red value to the green channel. Use multiple planes
simultaneously. Use different framebuffer formats, particularly with
higher than 8 bits per channel, and check the capture has the same
precision and not truncated to 8 bit.

That kind of tests would have much more proving power, and they also
help assess the precision of the hardware. Precision is important to
userspace.

These are also tests that userspace projects cannot really execute, they
do not have labs with Chamelium boards and not all drivers/hardware
support writeback connectors.

> +
> +#define MAX_SUPPORTED_PLANES 7
> +#define SDR_PLANE_BASE 3
> +
> +typedef bool (*test_t)(data_t*, igt_plane_t*);
> +
> +static bool is_hdr_plane(const igt_plane_t *plane)
> +{
> +	return plane->index >=3D 0 && plane->index < SDR_PLANE_BASE;

This here again. I guess the previous definition of this function was
never used?

The same questions.

> +}
> +
> +static bool is_valid_plane(igt_plane_t *plane)
> +{
> +	int index =3D plane->index;
> +
> +	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> +		return false;
> +
> +	/*
> +	 * Test 1 HDR plane, 1 SDR plane.
> +	 *
> +	 * 0,1,2 HDR planes
> +	 * 3,4,5,6 SDR planes
> +	 *
> +	 */
> +	return index >=3D 0 && index < MAX_SUPPORTED_PLANES;
> +}


Thanks,
pq

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWHZIACgkQI1/ltBGq
qqc3oA//WMsVhJnTNCInZE3ySlFI9iv64HiqC6Zgpy6UBkycCvi/Ugk9LRp9X3CW
AVAGQ3WkNMNdBCo+CxiGrp0zD8ueiKXYg2SScAm97I/YaY6Umiwu/jNJr+fbY+4a
+STLE4vJtUjcVqtpq32Nh5pUHSb/aJTy6sW3gObTHAYSLBmTa6khtTaIlDcbhPAZ
4l1Ybk8nGttlkhAwcDpRRA/nJsk72T5nMOD0wS/0Apk2tWus55Us1nhUsCvoMCkr
gmBIH88f5JsHDG1VAbvPybLu5yBaT+Fscozk0VW53kH08T/VcyvOaUzD83oRz7kT
rZKZWGeM0QARQss7du9rIKcol2RneTmAD04u5Lyq6PuXM3uiDC/jAJK5EAXJjFFv
WY4ygMNcpmg+xwc1gyAQYAz6VycqE3dVPE4QTyD5sX8AancX6SUUrlETUKu+4mQ1
YK/lPoyyBAQDUfrV8LFPmRKlIvxHSGfaA4fwFSZcqAZBNlMiqslkBC7dZaU/LN/G
Cagp4srRU9ksHJrQFEzAANKdVcmJqbYVEPQMqkptMuWIebXqhGT+y9HJm98IZMS4
+hRrr8EonyYOafbP48Q12xYARrBfXb4L3zRfvmyokuTKgMJOlm1zFlVQmcWvqqch
je+imQJh2M54UsC1jnjj6H5pE7HlXUlGkn+XGgWMtoKTAsPc2LU=
=BEwu
-----END PGP SIGNATURE-----

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+--
