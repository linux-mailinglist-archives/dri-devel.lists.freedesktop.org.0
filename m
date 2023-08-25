Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D847A788B7A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C780410E6A5;
	Fri, 25 Aug 2023 14:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D4E10E6A5;
 Fri, 25 Aug 2023 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LI+2DyWKDcxxWJ3+c1vC0avb/vM5e0DV1lblZ4Oiy3g=; b=sn6MfXaB6bJs6wwSHCcw+TtuBC
 OP6BVFjBdyG0KC/Wb2NTVikAPQyJa7IwXl0Ni3n3f+UkI/e1G9BK19FLWbCljHHTJ78CIFAOdLoqR
 3o2OPVsJloeyMDR42wuBdq4BvIW/TIKfWmgASNuJWtI/tiLSuhCi00X+Cb/Cc71Kat83j2WiUpMdA
 iDD/0SM5J+sEvyB+J18Vb+olcrr3W2l8aet8M3pOQU3jnw/hvOm6ibs5F3e6q+7OJf8R2vxEebXh0
 5AYig8hlITj4KMsemnCBlWaArrla5fGmNH99k5xleAufV/eG5XIhsd8kUE5YKMgw+++x9IDpCFShE
 TZ1COosg==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qZXdW-00FJ7l-Gp; Fri, 25 Aug 2023 16:18:06 +0200
Date: Fri, 25 Aug 2023 13:18:01 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Message-ID: <20230825141639.vurga52ysal37n2m@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tjqmalwjcqtfbizu"
Content-Disposition: inline
In-Reply-To: <20230822140242.162a843a.pekka.paalanen@collabora.com>
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
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tjqmalwjcqtfbizu
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="duwjnf2i3barzrhk"
Content-Disposition: inline


--duwjnf2i3barzrhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/22, Pekka Paalanen wrote:
> On Thu, 10 Aug 2023 15:02:47 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > Instead of relying on color block names to get the transfer function
> > intention regarding encoding pixel's luminance, define supported
> > Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> > includes pure gamma or standardized transfer functions.
> >=20
> > Suggested-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++----
> >  2 files changed, 67 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index c749c9cb3d94..f6251ed89684 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_ip=
_block;
> > =20
> >  enum amdgpu_transfer_function {
> >  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
> > -	AMDGPU_TRANSFER_FUNCTION_SRGB,
> > -	AMDGPU_TRANSFER_FUNCTION_BT709,
> > -	AMDGPU_TRANSFER_FUNCTION_PQ,
> > +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
> >  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
> >  	AMDGPU_TRANSFER_FUNCTION_UNITY,
> > -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
> > -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
> > -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
> > +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
> > +        AMDGPU_TRANSFER_FUNCTION_COUNT
> >  };
> > =20
> >  struct dm_plane_state {
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 56ce008b9095..cc2187c0879a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
> >  }
> > =20
> >  #ifdef AMD_PRIVATE_COLOR
> > -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_l=
ist[] =3D {
> > -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> > -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> > +static const char * const
> > +amdgpu_transfer_function_names[] =3D {
> > +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		=3D "Default",
> > +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		=3D "Linear",
>=20
> Hi,
>=20
> if the below is identity, then what is linear? Is there a coefficient
> (multiplier) somewhere? Offset?
>=20
> > +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		=3D "Unity",
>=20
> Should "Unity" be called "Identity"?

AFAIU, AMD treats Linear and Unity as the same: Identity. So, IIUC,
indeed merging both as identity sounds the best approach.  =20
>=20
> Doesn't unity mean that the output is always 1.0 regardless of input?
>=20
> > +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		=3D "sRGB EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		=3D "BT.709 EOTF",
>=20
> BT.709 says about "Overall opto-electronic transfer characteristics at
> source":
>=20
> 	In typical production practice the encoding function of image
> 	sources is adjusted so that the final picture has the desired
> 	look, as viewed on a reference monitor having the reference
> 	decoding function of Recommendation ITU-R BT.1886, in the
> 	reference viewing environment defined in Recommendation ITU-R
> 	BT.2035.
>=20
> IOW, typically people tweak the encoding function instead of using
> BT.709 OETF as is, which means that inverting the BT.709 OETF produces
> something slightly unknown. The note about BT.1886 means that that
> something is also not quite how it's supposed to be turned into light.
>=20
> Should this enum item be "BT.709 inverse OETF" and respectively below a
> "BT.709 OETF"?
>=20
> What curve does the hardware actually implement?

Hmmmm.. I think I got confused in using OETF here since it's done within
a camera. Looking at the coefficients used by AMD color module when not
using ROM but build encoding and decoding curves[1] on pre-defined TF
setup, I understand it's using OETF parameters for building both sRGB
and BT 709:

```
/*sRGB     709     2.2 2.4 P3*/
static const int32_t numerator01[] =3D { 31308,   180000, 0,  0,  0};
static const int32_t numerator02[] =3D { 12920,   4500,   0,  0,  0};
static const int32_t numerator03[] =3D { 55,      99,     0,  0,  0};
static const int32_t numerator04[] =3D { 55,      99,     0,  0,  0};
static const int32_t numerator05[] =3D { 2400,    2222,   2200, 2400, 2600};
```

Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inverse
OETF but called EOTF for HLG[3]. But I'm an external dev, better if
Harry can confirm.

Thank you for pointing it out.

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/disp=
lay/modules/color/color_gamma.c#n55
[2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/disp=
lay/modules/color/color_gamma.c#n106
[3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/disp=
lay/modules/color/color_gamma.c#n174

>=20
> The others seem fine to me.
>=20
>=20
> Thanks,
> pq
>=20
> > +	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		=3D "PQ EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		=3D "Gamma 2.2 EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		=3D "Gamma 2.4 EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		=3D "Gamma 2.6 EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	=3D "sRGB inv_EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF]	=3D "BT.709 inv_EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		=3D "PQ inv_EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	=3D "Gamma 2.2 inv_EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	=3D "Gamma 2.4 inv_EOTF",
> > +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	=3D "Gamma 2.6 inv_EOTF",
> >  };
> > =20
> > +static const u32 amdgpu_eotf =3D
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
> > +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
> > +
> > +static struct drm_property *
> > +amdgpu_create_tf_property(struct drm_device *dev,
> > +			  const char *name,
> > +			  u32 supported_tf)
> > +{
> > +	u32 transfer_functions =3D supported_tf |
> > +				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
> > +				 BIT(AMDGPU_TRANSFER_FUNCTION_LINEAR) |
> > +				 BIT(AMDGPU_TRANSFER_FUNCTION_UNITY);
> > +	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
> > +	int i, len;
> > +
> > +	len =3D 0;
> > +	for (i =3D 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
> > +		if ((transfer_functions & BIT(i)) =3D=3D 0)
> > +			continue;
> > +
> > +		enum_list[len].type =3D i;
> > +		enum_list[len].name =3D amdgpu_transfer_function_names[i];
> > +		len++;
> > +	}
> > +
> > +	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> > +					name, enum_list, len);
> > +}
> > +
> >  int
> >  amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >  {
> > @@ -116,11 +157,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_de=
vice *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_degamma_lut_size_property =3D prop;
> > =20
> > -	prop =3D drm_property_create_enum(adev_to_drm(adev),
> > -					DRM_MODE_PROP_ENUM,
> > -					"AMD_PLANE_DEGAMMA_TF",
> > -					amdgpu_transfer_function_enum_list,
> > -					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
> > +	prop =3D amdgpu_create_tf_property(adev_to_drm(adev),
> > +					 "AMD_PLANE_DEGAMMA_TF",
> > +					 amdgpu_eotf);
> >  	if (!prop)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_degamma_tf_property =3D prop;
>=20



--duwjnf2i3barzrhk--

--tjqmalwjcqtfbizu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTouBkACgkQwqF3j0dL
ehwe+w//X5vJS0wuw7mVT7cmgRN923olGU4+ipV/7Fqf6PKgBaxV6/w7WsAWu4jQ
wb1huOTgvSznOH86XQpxpgujBjTt0B6x1U5Lb/S250Ti5Q/Aeqw5WvIsHp3ZBlkF
VviTqzV61+BzDxBcDllwL3U4kX14gu4aVDmPPO76r6upAjyc7nKPSLNUQNff2Ymo
CmF6E0ef2c7L6swDBjfDMSn4YIxeYAbulQ0BhqgyMc0YF7dqUMxUAczwYBkWTNYt
tnmdwv7IkqnwruaSM+Rv3/J+lQ0Ct7zbFrP8sJdNxReHqcIE7bYJZeWfx88AjiVf
LqNVNmDe0vvl3GnG16dENr/sN2tTi5+j7tHsKRNnOAlO+i0mpJy7Eu4j/ES6u6BY
U2W6RNTbeder8mJV5Led4zsIGlkf2JOIEsImjXYpgrI+Muq0LnJR4vFmQKJyjSOY
NLXq65SB3d5raM/uvSaU0lefYX+nA4ZJGyFUnRYf9+YdPPsLNNsnNr9RXnTlZMAD
xhlnGZQi8Kvq+IbfX7cM3FCFUQvKKboQa5AXSto+TGTtX6X+3JGMfnNKMcsZyxpG
1uOIiDbnrDVVhW/AToM9GruG3Isp42C0ZW9XOQKBrd+rDEdxDSdSdkfGiFOHux1o
LG4U8gNIC4sT7OfmpB4uzCtZjoaHqdQb1ld3s52dtwpIJWbLM0E=
=ceJG
-----END PGP SIGNATURE-----

--tjqmalwjcqtfbizu--
