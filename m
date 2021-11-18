Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F24557E0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2E6EC64;
	Thu, 18 Nov 2021 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13E6EC64;
 Thu, 18 Nov 2021 09:19:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y26so22683783lfa.11;
 Thu, 18 Nov 2021 01:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=oAEcrXsZ8YV8JK/loMplX5ZiUEzT3hYIdQgfET2o1z0=;
 b=kQKNVy1h7wKfz55zQ96m/EaJ9YLMuJpHdHd07PlQzHa9Yt8twkElaj2s+MmV1uSNMQ
 Z8KhDlwncpLtHtHKuqJ4BCi+v6wItxIpI/gMCW7Dj80fR7M6LK4gTTwmOb15aBzrxswr
 YWK3HQWTESESel6Soly8SgXtDuEUoni4x1BiqlJ1d0/6jDesOWIHY3rCNe2T5yvBwhIm
 kareU+APuDn+iqRVr4FNWptoJMdjd3s6SeKSQl6fqAu8OCCYqaS4bityCNd6gXAC3Nyj
 XJiHypN4Kj1blE4ie0moVRBY36PPKE+EuAqmXwaAsMaS1wRakvFIUnYf9fMDrPufGzLt
 +lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=oAEcrXsZ8YV8JK/loMplX5ZiUEzT3hYIdQgfET2o1z0=;
 b=FpavJLOXAjIIO3YkJK6+PVr+RwAIlip7V7eUfjaSo+s1NpaoeR9S2cUVjVxEWB6u9F
 Y6D0vozXwnWvRdfO87BRpaek7gxP596gVLlbSG5NG8UQNC7/YCZxEiT6++doyXzlJ8In
 7Fkq8iiF1YAdUXZ/XM1IoNFgpi3fmRIza75u/ywiULWAC9SMHzllteFlQeMIM95aL5ei
 mfKoE42uYn1HiuSjKyP95Wr1jObkZu05rhoWxUdNFDXJtSqNgk7ziPmNOkcsjN+1AEw+
 Yw1ouGtfmEyJgpWBe0ilM3DNiG+B++ZujTu4Mpum5Z4c7bQzickgyaS3NOAnbUnxn733
 gYrw==
X-Gm-Message-State: AOAM531eDDGtHi0IcQQmg+UaTMuedSfSDXZyq//kIZINbV9wQBukCmFk
 uoaWsiYUGdUpdFO+F2gB0Us=
X-Google-Smtp-Source: ABdhPJysKj/uJioQH2NmwWsU0v9deTwk7ETd3xELuYSBntO1Zmp13FSGR4a8GFZcFD0J9FftbKXGAA==
X-Received: by 2002:a05:6512:6d1:: with SMTP id
 u17mr23265050lff.427.1637227184958; 
 Thu, 18 Nov 2021 01:19:44 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z28sm227454ljn.77.2021.11.18.01.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:19:44 -0800 (PST)
Date: Thu, 18 Nov 2021 11:19:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 07/14] tests/kms_color: New negative tests for plane
 level color mgmt
Message-ID: <20211118111941.764737fb@eldfell>
In-Reply-To: <20211115094759.520955-8-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-8-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6wSi2wncVoIw06chR.cibzR";
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
Cc: igt-dev@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6wSi2wncVoIw06chR.cibzR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:52 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Negative check for:
>  * plane gamma lut sizes
>  * plane degamma lut sizes
>  * plane ctm matrix sizes
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index e14b37cb6f..d9fe417ba9 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -736,6 +736,118 @@ static void test_pipe_limited_range_ctm(data_t *dat=
a,
>  }
>  #endif
> =20
> +static bool invalid_plane_gamma_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_display_t *display =3D &data->display;
> +	drmModePropertyPtr gamma_mode =3D NULL;
> +	uint32_t i;
> +
> +	igt_info("Plane invalid gamma test is running on pipe-%s plane-%s(%s)\n=
",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
> +
> +	gamma_mode =3D get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE=
);
> +
> +	/* Iterate all supported gamma modes. */
> +	for (i =3D 0; i < gamma_mode->count_enums; i++) {
> +		segment_data_t *segment_info =3D NULL;
> +		size_t lut_size =3D 0;
> +
> +		/* Ignore 'no gamma' from enum list. */
> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
> +			continue;
> +
> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].na=
me);
> +
> +		segment_info =3D get_segment_data(data, gamma_mode->enums[i].value,
> +				gamma_mode->enums[i].name);
> +		lut_size =3D sizeof(struct drm_color_lut_ext) * segment_info->entries_=
count;
> +
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, gamma_mode->enums=
[i].name);
> +		invalid_plane_lut_sizes(display, plane,
> +					IGT_PLANE_GAMMA_LUT,
> +					lut_size);
> +
> +		clear_segment_data(segment_info);
> +
> +		/* One enum is enough. */
> +		break;
> +	}
> +
> +	drmModeFreeProperty(gamma_mode);
> +
> +	return true;
> +}
> +
> +static bool invalid_plane_degamma_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_display_t *display =3D &data->display;
> +	drmModePropertyPtr degamma_mode =3D NULL;
> +	uint32_t i;
> +
> +	igt_info("Plane invalid degamma test is running on pipe-%s plane-%s(%s)=
\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
> +
> +	degamma_mode =3D get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_=
MODE);
> +
> +	/* Iterate all supported degamma modes. */
> +	for (i =3D 0; i < degamma_mode->count_enums; i++) {
> +		segment_data_t *segment_info =3D NULL;
> +		size_t lut_size =3D 0;
> +
> +		/* Ignore 'no degamma' from enum list. */
> +		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
> +			continue;
> +
> +		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i=
].name);
> +
> +		segment_info =3D get_segment_data(data,
> +						degamma_mode->enums[i].value,
> +						degamma_mode->enums[i].name);
> +		lut_size =3D sizeof(struct drm_color_lut_ext) * segment_info->entries_=
count * 2;
> +
> +		igt_plane_set_prop_enum(plane,
> +					IGT_PLANE_DEGAMMA_MODE,
> +					degamma_mode->enums[i].name);
> +		invalid_plane_lut_sizes(display, plane,
> +					IGT_PLANE_DEGAMMA_LUT,
> +					lut_size);
> +
> +		clear_segment_data(segment_info);
> +
> +		/* One enum is enough. */
> +		break;

Why is one enum enough?

The same question for the other case in this patch.


> +	}
> +
> +	drmModeFreeProperty(degamma_mode);
> +
> +	return true;
> +}
> +
> +static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_info("Plane invalid CTM test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
> +	invalid_plane_lut_sizes(&data->display, plane,
> +				IGT_PLANE_CTM,
> +				sizeof(struct drm_color_ctm));

The code says you're trying shove a LUT into a CTM blob. I understand
that mechanically this is test you want to do, feed a wrong sized blob,
and in this case the contents do not matter (unlike with actual LUTs),
but reading this code is completely misleading and does not make sense.
It takes a while to think about what you actually want to test here,
and then reverse-engineer the code to understand that that is what
actually happens, too. That is too much mental burden for the reader to
realize that this piece of code actually works.


Thanks,
pq

> +
> +	return true;
> +}
> +
>  static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
>  {
>  	igt_output_t *output;
> @@ -1411,6 +1523,21 @@ static void run_tests_for_plane(data_t *data, enum=
 pipe pipe)
>  					ctm_tests[i].iter);
>  		}
>  	}
> +
> +	igt_describe("Negative check for invalid plane gamma lut sizes");
> +	igt_subtest_f("pipe-%s-invalid-plane-gamma-lut-sizes",
> +			kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, invalid_plane_gamma_test);
> +
> +	igt_describe("Negative check for invalid plane degamma lut sizes");
> +	igt_subtest_f("pipe-%s-invalid-plane-degamma-lut-sizes",
> +			kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, invalid_plane_degamma_test);
> +
> +	igt_describe("Negative check for invalid plane ctm matrix sizes");
> +	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
> +			kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
>  }
> =20
>  igt_main


--Sig_/6wSi2wncVoIw06chR.cibzR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWGq0ACgkQI1/ltBGq
qqcV1A//ZW1h9slYJ0YGb0gkYB5EoCVK8jOtZ/hNt/TV4aot2qNRxGCgQl7JkVe9
ok1qYrxpC31tOWrO6Bi6j5YSnRf6jQwqQHLlpED5IQJQRTvrECWRfH27yQsX37aw
lD6zgJXcJCA3kJiYLxT3Rsmgq/PL7iQ3u903EwO364QnDsLEaSSZ2hdTj1sVueg5
jLb8ec/vZQGILL//zZPYQX8o3IIkUO1hbyRbkLCalVgRWfTL+YwSlrmeH8PRBSHt
BgvZ64M6y1Q70yB5s+uav/CxQQyHUqnB+UHUyfhM0L7Kh/6VkTND2I34wLKqO7yI
iIRehxLYuw8hwALfGnVakml28NoDGaqRORkxM6rw1oroErPM5Skk6sHRDOff4CE8
86ODb+Vg84guXjq3d5PIlE3EoCitx5S8I8/x6rjx6vMwdJKElvT2PqznLmFT+R6P
T8R/JPh80YpzHsU1XI/f5HRLOTe5EoYmmmpe6mQLnMo2+YR1TrYeCisYdca7OOyT
y2E8x/QBWbQLrnaqxvfuB+BsX5/zkWy8cmUkhoZhQanb/v5AA/3lVFYU3aKh0Dly
6xSWrM276mawC6kvKvsilZAzgnbJagyAo079jMwO/JaF1xAfpej+DIx0Xx+G8YoA
sQ1mIM+ojXwJq3pfPYPPoRHfTZC7I6GTZ+7DbW1EKSOidXCgWew=
=lh3s
-----END PGP SIGNATURE-----

--Sig_/6wSi2wncVoIw06chR.cibzR--
