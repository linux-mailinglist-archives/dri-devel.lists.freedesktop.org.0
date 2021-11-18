Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C64557A2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4026EB73;
	Thu, 18 Nov 2021 09:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47B6EB71;
 Thu, 18 Nov 2021 09:02:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t26so22483438lfk.9;
 Thu, 18 Nov 2021 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=/OTPrrxqC2xN4BNoipUjYB/ILd/XL3/E8XFBX+HF9N4=;
 b=JKbQjvr7j+lrFP7X6bzzrhiSvf8aCj+1G04YkthOM4RunZXFJqlM4DCjkY3bjqFdtw
 W23j8MFVBI4/ylqrBDbzcXYpRhHWgpWuE7zVgrBxoPGM86KVh/3qjNxncESg92c8ShWI
 PWtaDXJD61lGS1Us+H8aN6xKFoCUh3Xw4WLQcO8KXTjKP9mCEERNilKdZOgpPl3WfH59
 EBYXK3ZjkMH0SUEKHCtJP9WOCRywPlsSdTn3jQwmJs0NRH1YHg7etZsifJ5LVUkC7PDn
 rxpA3PvcG8G2SZ1/747UroC5wIGJUKCVV5eSY8Io5p5DSM9RH9CCG2xa3kNEpybT5+Wb
 tDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=/OTPrrxqC2xN4BNoipUjYB/ILd/XL3/E8XFBX+HF9N4=;
 b=nCipZNysJ0FGUuSV8eFdhgKTPAI3+6g/DKZS8Cr2mf1Y461V1fon8eYx1k6wThkj5B
 jvlNVbdH7o39M/spcGpWPPkmx71EphnIWwK4K6jmYXtsoit45o9B6P/o59E0FlzpMPIq
 24j+d3vDSTX2ibjFGTHREU1PCOChF7Q7Q8UhHMB0rPWCKHm01HJqprRtFHxDy8AopHFd
 z3M62GkWV1rDbJPWMnMc5OBj3BKSy3aIoSmL9h2PFVkXdbkjc57Mslf/PPGalicAA3tY
 2hQWJWZEaWE2tfvzQdRjNM23h056m/ik9VI7HitidTJ44SX0RQPkC4kI9q5fCsr9j0vV
 /2Cg==
X-Gm-Message-State: AOAM533M5RTLuvGWIUQ748OiBmx2uL15VqrSlpI1AQMA/8wUiH9j6aAm
 9hJQgDgKSzwZIValr/42tFY=
X-Google-Smtp-Source: ABdhPJyNky8MtVzDkfalAvE0/HcHOkgDDLsMb/j+aOp+JbDEar3dzl6VlQkdzVNW/zdQvcKa/XUCvw==
X-Received: by 2002:ac2:5932:: with SMTP id v18mr21755401lfi.611.1637226159688; 
 Thu, 18 Nov 2021 01:02:39 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l18sm237831lfc.97.2021.11.18.01.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:02:39 -0800 (PST)
Date: Thu, 18 Nov 2021 11:02:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
Message-ID: <20211118110233.7fdcc066@eldfell>
In-Reply-To: <20211115094759.520955-5-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-5-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Qke0eYh.h6d7MR=cf_zjNa";
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

--Sig_/_Qke0eYh.h6d7MR=cf_zjNa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:49 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
> with a maxed out gamma LUT and verify we have the same CRC as drawing sol=
id
> color rectangles.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 775f35964f..b45d66762f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -24,7 +24,34 @@
> =20
>  #include "kms_color_helper.h"
> =20
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
> +
> +#define MAX_SUPPORTED_PLANES 7
> +#define SDR_PLANE_BASE 3
> +
> +typedef bool (*test_t)(data_t*, igt_plane_t*);
> +
> +static bool is_hdr_plane(const igt_plane_t *plane)
> +{
> +	return plane->index >=3D 0 && plane->index < SDR_PLANE_BASE;

How can this be right for all KMS drivers?

What is a HDR plane?

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

As above, where does this come from? Is this your hardware?

> +	 *
> +	 */
> +	return index >=3D 0 && index < MAX_SUPPORTED_PLANES;
> +}
> =20
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
> @@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t *dat=
a,
>  }
>  #endif
> =20
> +static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display =3D &data->display;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	drmModePropertyPtr gamma_mode =3D NULL;
> +	uint32_t i;
> +	bool ret =3D true;
> +	igt_pipe_crc_t *pipe_crc =3D NULL;
> +	color_t red_green_blue[] =3D {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
> +	};
> +
> +	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
> +			kmstest_pipe_name(plane->pipe->pipe),
> +			kmstest_plane_type_name(plane->type),
> +			is_hdr_plane(plane) ? "hdr":"sdr");
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
> +
> +	pipe_crc =3D igt_pipe_crc_new(data->drm_fd,
> +				  plane->pipe->pipe,
> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	output =3D igt_get_single_output_for_pipe(display, plane->pipe->pipe);
> +	igt_assert(output);
> +
> +	igt_output_set_pipe(output, plane->pipe->pipe);
> +	mode =3D igt_output_get_mode(output);
> +
> +	/* Create a framebuffer at the size of the output. */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &fb));
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_ctm(plane->pipe);
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +
> +	disable_plane_ctm(plane);
> +	disable_plane_degamma(plane);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	gamma_mode =3D get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE=
);
> +
> +	/* Iterate all supported gamma modes. */
> +	for (i =3D 0; i < gamma_mode->count_enums; i++) {
> +		igt_crc_t crc_gamma, crc_fullcolors;
> +		segment_data_t *segment_info =3D NULL;
> +		struct drm_color_lut_ext *lut =3D NULL;
> +		uint32_t lut_size =3D 0;
> +
> +		/* Ignore 'no gamma' from enum list. */
> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
> +			continue;
> +
> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].na=
me);
> +
> +		/* Draw solid colors with no gamma transformation. */
> +		disable_plane_gamma(plane);
> +		paint_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
> +
> +		/* Draw gradient colors with gamma LUT to remap all
> +		 * values to max red/green/blue.
> +		 */
> +		segment_info =3D get_segment_data(data, gamma_mode->enums[i].value,
> +				gamma_mode->enums[i].name);
> +		lut_size =3D sizeof(struct drm_color_lut_ext) * segment_info->entries_=
count;
> +		lut =3D create_max_lut(segment_info);

Using max LUT seems like a weak test. I recall seeing problem reports
related to alpha blending where trying to display an alpha gradient
essentially resulted in what max LUT would produce.


Thanks,
pq

> +		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
> +
> +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_wait_for_vblank(data->drm_fd,
> +			display->pipes[plane->pipe->pipe].crtc_offset);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
> +
> +		/* Verify that the CRC of the software computed output is
> +		 * equal to the CRC of the gamma LUT transformation output.
> +		 */
> +		ret &=3D igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
> +
> +		free(lut);
> +		clear_segment_data(segment_info);
> +	}
> +
> +	disable_plane_gamma(plane);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ?
> +					COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +	drmModeFreeProperty(gamma_mode);
> +
> +	return ret;
> +}
> +
>  static void
>  prep_pipe(data_t *data, enum pipe p)
>  {
> @@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe =
p)
>  		invalid_ctm_matrix_sizes(data, p);
>  }
> =20
> +static void run_plane_color_test(data_t *data, enum pipe pipe, test_t te=
st)
> +{
> +	igt_plane_t *plane;
> +	int count =3D 0;
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;
> +
> +		igt_assert(test(data, plane));
> +
> +		count++;
> +	}
> +
> +	igt_require_f(count, "No valid planes found.\n");
> +}
> +
> +static void run_tests_for_plane(data_t *data, enum pipe pipe)
> +{
> +	igt_fixture {
> +		igt_require_pipe(&data->display, pipe);
> +		igt_require_pipe_crc(data->drm_fd);
> +		igt_require(data->display.pipes[pipe].n_planes > 0);
> +		igt_display_require_output_on_pipe(&data->display, pipe);
> +	}
> +
> +	igt_describe("Compare maxed out plane gamma LUT and solid color linear =
LUT");
> +	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
> +		run_plane_color_test(data, pipe, plane_gamma_test);
> +}
> +
>  igt_main
>  {
>  	data_t data =3D {};
> @@ -910,6 +1084,9 @@ igt_main
> =20
>  		igt_subtest_group
>  			run_invalid_tests_for_pipe(&data, pipe);
> +
> +		igt_subtest_group
> +			run_tests_for_plane(&data, pipe);
>  	}
> =20
>  	igt_fixture {


--Sig_/_Qke0eYh.h6d7MR=cf_zjNa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWFqoACgkQI1/ltBGq
qqdT7hAAieL4HIkO/pSjrzX4715OJka9906A8VZRElGpnydpwLpc4jX1whNr0PiT
qiYDVhWW9yY7RPzpsPQutraCTmRCzx/rXEaVktb1mrq/behfVt8/qlTOf74USStO
TAVXWpsiXjZWvichJ5XAtE8lB3yi2phZqCq3kl06LgsbgD3hlfNfCpMvHEi0B54f
kftOvPFGTvqlT1kX5a4xz+RBUTI5b70JPrnG7f5kPF2URD4kIAZ0NH75xpGUknts
2g03GCQvFILxfZecPlqeoxGilSZ7oYXndws1dXPdgPuKW50aISDAjYgMmMItZoiR
D1TCK6hZbvmy8mK3qkF331Xhg4Zjlhi5pl1OkKbaiABsvie3VPFSWOAp6trDFS0B
VKmawZYotfaEwGzfzhhdhwDqZeue00kpu2G6SndaFXkFBSzuwaYWitv9soiGbool
LScJ6yZ8nW+NfYMoFrDZ73BpOqZa1nXr+GgIWzye7ozORcuk+iIgyLTpiaoX5NPM
bRazlmRCWkuSbciUupNMRh0M/LYEEV+B8qlScFWTy9RKaTAq41KjK+G+ZZ+4TJVy
WYD6EGGJwli+nR4CKUODcfQeXbSQy1+nQIlIarGxmnKPRtx/OC9NGzMKP30U/ccx
c2MVZ6q6ROEDfOFDBEXbo9zKe6me7B7t+EjDHxboUd6DYnrxWQ4=
=5cGO
-----END PGP SIGNATURE-----

--Sig_/_Qke0eYh.h6d7MR=cf_zjNa--
