Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F397C797090
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57C910E78B;
	Thu,  7 Sep 2023 07:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2AC10E785;
 Thu,  7 Sep 2023 07:49:31 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADBAC66072A2;
 Thu,  7 Sep 2023 08:49:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694072969;
 bh=ZIJfnKxyJrhwkA3M7TnSs0WqP7fDyFYDHeph5tlVMs4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DXvLz2MUXdEMqPC6l/y3xU/OTFWRDEOy44e5xL3B/gBqep+Ay1ORAvlnj0GnDTP4Q
 ZKSyFVmUcfBWx4agGpkuHnG++BfD2hH+Aee/jz4DoJeoQzNFA9RDlPESN+TsY8zdDQ
 92K08kX9V2epWmNApf0f3qPp85qC9H7RTXaoQxiA2eAOmWRfjf6jAJXbEMLlXUhcdz
 /a0wTXNJKJXbCaEYjhI7ptB75jL1f8WDfVZ+WBG8QB9I1IJZ8gl1pAVZurxgRGD/X8
 nmE7X5Eczift4uWCLec2QfVRA2OrQ1jLoXcDDe00GLzHcaZkNwQJ7TYDyE3Huju9zM
 BVz9KUzY7vnMw==
Date: Thu, 7 Sep 2023 10:49:17 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Message-ID: <20230907104917.7cf8e22e.pekka.paalanen@collabora.com>
In-Reply-To: <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
 <20230825141639.vurga52ysal37n2m@mail.igalia.com>
 <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_KsfrGyb4A/tYnFSiA2jZGF";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_KsfrGyb4A/tYnFSiA2jZGF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sep 2023 16:15:10 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-08-25 10:18, Melissa Wen wrote:
> > On 08/22, Pekka Paalanen wrote: =20
> >> On Thu, 10 Aug 2023 15:02:47 -0100
> >> Melissa Wen <mwen@igalia.com> wrote:
> >> =20
> >>> Instead of relying on color block names to get the transfer function
> >>> intention regarding encoding pixel's luminance, define supported
> >>> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> >>> includes pure gamma or standardized transfer functions.
> >>>
> >>> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> >>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>> ---
> >>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
> >>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++--=
--
> >>>  2 files changed, 67 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> index c749c9cb3d94..f6251ed89684 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_=
ip_block;
> >>> =20
> >>>  enum amdgpu_transfer_function {
> >>>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
> >>> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
> >>> -	AMDGPU_TRANSFER_FUNCTION_BT709,
> >>> -	AMDGPU_TRANSFER_FUNCTION_PQ,
> >>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
> >>>  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
> >>>  	AMDGPU_TRANSFER_FUNCTION_UNITY,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
> >>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
> >>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
> >>> +        AMDGPU_TRANSFER_FUNCTION_COUNT
> >>>  };
> >>> =20
> >>>  struct dm_plane_state {
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> index 56ce008b9095..cc2187c0879a 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
> >>>  }
> >>> =20
> >>>  #ifdef AMD_PRIVATE_COLOR
> >>> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum=
_list[] =3D {
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> >>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> >>> +static const char * const
> >>> +amdgpu_transfer_function_names[] =3D {
> >>> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		=3D "Default",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		=3D "Linear", =20
> >>
> >> Hi,
> >>
> >> if the below is identity, then what is linear? Is there a coefficient
> >> (multiplier) somewhere? Offset?
> >> =20
> >>> +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		=3D "Unity", =20
> >>
> >> Should "Unity" be called "Identity"? =20
> >=20
> > AFAIU, AMD treats Linear and Unity as the same: Identity. So, IIUC,
> > indeed merging both as identity sounds the best approach.    =20
>=20
> Agreed.
>=20
> >>
> >> Doesn't unity mean that the output is always 1.0 regardless of input?
> >> =20
> >>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		=3D "sRGB EOTF",
> >>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		=3D "BT.709 EOTF", =20
> >>
> >> BT.709 says about "Overall opto-electronic transfer characteristics at
> >> source":
> >>
> >> 	In typical production practice the encoding function of image
> >> 	sources is adjusted so that the final picture has the desired
> >> 	look, as viewed on a reference monitor having the reference
> >> 	decoding function of Recommendation ITU-R BT.1886, in the
> >> 	reference viewing environment defined in Recommendation ITU-R
> >> 	BT.2035.
> >>
> >> IOW, typically people tweak the encoding function instead of using
> >> BT.709 OETF as is, which means that inverting the BT.709 OETF produces
> >> something slightly unknown. The note about BT.1886 means that that
> >> something is also not quite how it's supposed to be turned into light.
> >>
> >> Should this enum item be "BT.709 inverse OETF" and respectively below a
> >> "BT.709 OETF"?
> >>
> >> What curve does the hardware actually implement? =20
> >=20
> > Hmmmm.. I think I got confused in using OETF here since it's done within
> > a camera. Looking at the coefficients used by AMD color module when not
> > using ROM but build encoding and decoding curves[1] on pre-defined TF
> > setup, I understand it's using OETF parameters for building both sRGB
> > and BT 709:
> >=20
> > ```
> > /*sRGB     709     2.2 2.4 P3*/
> > static const int32_t numerator01[] =3D { 31308,   180000, 0,  0,  0};
> > static const int32_t numerator02[] =3D { 12920,   4500,   0,  0,  0};
> > static const int32_t numerator03[] =3D { 55,      99,     0,  0,  0};
> > static const int32_t numerator04[] =3D { 55,      99,     0,  0,  0};
> > static const int32_t numerator05[] =3D { 2400,    2222,   2200, 2400, 2=
600};
> > ```
> >  =20
>=20
> The first column here looks like the sRGB coefficients in Skia:
> https://skia.googlesource.com/skia/+/19936eb1b23fef5187b07fb2e0e67dcf605c=
0672/include/core/SkColorSpace.h#46
>=20
> The color module uses the same coefficients to calculate the transform
> to linear space and from linear space. So it would support a TF and its
> inverse.
>=20
> From what I understand for sRGB and PQ its the EOTF and its inverse.
>=20
> For BT.709 we should probably call it BT.709 inverse OETF (instead of
> EOTF) and BT.709 OETF (instead of inverse EOTF).
>=20
> While I'm okay to move ahead with these AMD driver-specific properties
> without IGT tests (since they're not enabled and not UABI) we really
> need IGT tests once they become UABI with the Color Pipeline API. And we
> need more than just CRC testing. We'll need to do pixel-by-pixel comparis=
on
> so we can verify that the KMS driver behaves exactly how we expect for a
> large range of values.

Yes, please, very much, about the generic color UAPI.

I believe IGT should contain the reference curve for all named fixed
curves computed with standard libc math functions in double precision,
and compute error statistics between that and hardware results.
The actual test image would iterate through e.g. 1024 (all 10-bit
values for integer format framebuffer) different values - 1024 is
nothing as a number of pixels. Then we decide on acceptable error
thresholds.

It should also be tested with a floating-point framebuffer format, FP16
or FP32, with a value distribution designed to be sensitive to typical
numerical problems. For example, an inverse EOTF should be carefully
tested with values near zero, since those are the most problematic and
likely cause the most visible errors.

Once all that is done, we can be very sure of what curve any hardware
actually implements.

I might even go far enough to suggest that any generic color UAPI with
named fixed curves cannot land without such tests.


Thanks,
pq

>=20
> Harry
>=20
> > Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inverse
> > OETF but called EOTF for HLG[3]. But I'm an external dev, better if
> > Harry can confirm.
> >=20
> > Thank you for pointing it out.
> >=20
> > [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/=
display/modules/color/color_gamma.c#n55
> > [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/=
display/modules/color/color_gamma.c#n106
> > [3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/=
display/modules/color/color_gamma.c#n174
> >  =20
> >>
> >> The others seem fine to me.
> >>
> >>
> >> Thanks,
> >> pq

--Sig_/_KsfrGyb4A/tYnFSiA2jZGF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT5gH0ACgkQI1/ltBGq
qqeLqQ/+NRS9c9EMovhxJR3p9HNdz39dMuBaG/jf6bHcp68pQ4uVblMFj11v2uuV
vEY70YxZS0hiqjHb3NEq3P/FCyH7tss3lFOvMtAkOL/wT0f2CN4367WMKtpXrbEG
WcYyPi68uHvn0vLVxQ1n/F1xblI5HJL6U5ZzhsKo9LkGGzLoieKIL476PeWy3yxx
YKefUzfPgPlx2zOe04PLMYOM0fky2GugMTa8goQcGaj0MAd2DWVjV2JpdGzIBXr4
9iqN1siqMHudL43UnRLQISpTnYUsGHdaFapUDYso1F7UhBVS2kKpw8ouItTMmPBH
Vzu3jGZQD8G348QsacBU3+em6MNre93tRWxIibV/GLC1g5+pWtED7gGxZ9VLB7HW
/sFF/VGY4mvVi6uStwL8McHdQyzBHLeEeZdHVXnut8AGhJ6A7PSOn8AH1Bb7W6cQ
8lnptyeIpTdqjl1H18WaIpATsEoW2hx9PdM/czqz/Ds6/dd/YmExBOUeq0cz4vEW
hGO3xh6E1RnI2Dr+VcVpDrE257h0qBYfaVALYqM0VCCiaybG+1VhXxF/rM5yzbDw
8519JALkomQS915gacrBcjs1fl8KEOgPveCyoX+AOrneVGF19Yj/TJgmZaeceuHG
YvKP3Oc9LyEK93QCRpSAvvN1ekQC1l6RdmTRMV2Pq59qUUohfLg=
=0EKb
-----END PGP SIGNATURE-----

--Sig_/_KsfrGyb4A/tYnFSiA2jZGF--
