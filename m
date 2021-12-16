Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D8476C05
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647C610E22D;
	Thu, 16 Dec 2021 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182C10E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:34:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 348F732009CC;
 Thu, 16 Dec 2021 03:34:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Dec 2021 03:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=i5jA6zrzD6KhNJNsLnAG5Q9XZV5
 a4aUUIvHw6JpuQ1Y=; b=LqZLurJG/Nq2InCbRqGJbnTu0RxsN+ENPpYNCFSLbp0
 vUfPGw5/pbPaKcVof4HcmsAVydZ+EyqWQ89hOvvd16i2khb4qslLByEPdRIvrlv8
 3falcPnN0YCXznu0f7PRdNqpJIv0x0AscOi7kxJnuwcedjtDdSLGP867FhiPxNVR
 N9JpLSfZd9I4zt+y865rb4RT7i3qfk+oVvvSCLvC7W0wS3tw2mz9e2QdHwZnTYsg
 nRRbILatIXW0IBSYf4hw77AZqJZPOWbsp8yhaGgprSmsN0WEAQvbFDiX7ZiL7dwR
 F6PAIYdKJ/hLEPyoWwIJiYVpwhz5xIV8PoJzTFSotig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i5jA6z
 rzD6KhNJNsLnAG5Q9XZV5a4aUUIvHw6JpuQ1Y=; b=VEKTAFYPVm/FhL+HfKxc/8
 47OjYeJQ6Q4ZRJxaREgg3wDMWEBkLrNGqV7sCWiMLGNyzSw0UFVduawQ020hso12
 2yCf6R6XkdIDR9qRVbag7T68t0Nghga1l76UH8de11o4mi+b68tm6argS55gUyQi
 dfAH++T7ftT3XIYbgo9XbbktSs45vDHGl3vDYIcrPAkJSR6j1riatwnqcHQT/GHZ
 lUSVY0vCrb2bsvah4v3mf5ex6ntuLQcJYJIeUlNV4G7e5jTC1L39j+uMuo0wVi6k
 MtXmMUuEQonJGv32tp2u3OI6vdz0oLhrSCJtqISA4r3PDj4craNNQdyAMuA2gpyw
 ==
X-ME-Sender: <xms:Evq6YUscGEYuw5_0obyQlVRmT5Vhh7jxWkGU4tH6yvLf4NSiYYM4dA>
 <xme:Evq6YReKyehsCxMxtEPLy56FBK3GDPJC4sqGlhXeh9BkeOctu_Sg6QKgIoynXC00L
 MkoqkJ_LLhGDEP4uIo>
X-ME-Received: <xmr:Evq6YfzNdGZ1Ef_hGWhA6xmPZE0ZPt-9LCiZjSbwC87a56-vAWKj1B6rxRPplBPh6H2-p6XCAdS2doZQRVr26WAMdQqRh046DEuaCsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleefgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Evq6YXOI_0FIC_HugXAtVm80Dow3VWDYoOj1GeLNkIRzJlqxuXIh8g>
 <xmx:Evq6YU8vrG6U_64gaGXcC6LqBX99v35GS7yCwW0FQzBJsx0NnLecvA>
 <xmx:Evq6YfW6i3GBDpacTS0bM0cLIQOAm7rmRlhtbiret2_LlCgMQMFdzA>
 <xmx:Evq6YRPIFdM-i5E99Al2xQ3Flx6SvC9JpJ0I7MrQuz_aHnazaD9Dpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 03:34:25 -0500 (EST)
Date: Thu, 16 Dec 2021 09:34:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Message-ID: <20211216083424.hz3fqdrgafmc4dap@houat>
References: <20211215091739.135042-1-maxime@cerno.tech>
 <20211215091739.135042-3-maxime@cerno.tech>
 <d1fc2a05-a1c7-8fcf-3c5f-659a2735b4a4@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yjapqddx42py7bzy"
Content-Disposition: inline
In-Reply-To: <d1fc2a05-a1c7-8fcf-3c5f-659a2735b4a4@suse.de>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yjapqddx42py7bzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review

On Wed, Dec 15, 2021 at 04:11:50PM +0100, Thomas Zimmermann wrote:
> Hi,
>=20
> I have a number of comments below. But if you want, you can add
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks :)

> Am 15.12.21 um 10:17 schrieb Maxime Ripard:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >=20
> > The P030 format, used with the DRM_FORMAT_MOD_BROADCOM_SAND128 modifier,
> > is a format output by the video decoder on the BCM2711.
> >=20
> > Add native support to the KMS planes for that format.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_plane.c | 127 ++++++++++++++++++++++++--------
> >   1 file changed, 96 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> > index ac761c683663..022cd12f561e 100644
> > --- a/drivers/gpu/drm/vc4/vc4_plane.c
> > +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> > @@ -33,6 +33,7 @@ static const struct hvs_format {
> >   	u32 hvs; /* HVS_FORMAT_* */
> >   	u32 pixel_order;
> >   	u32 pixel_order_hvs5;
> > +	bool hvs5_only;
> >   } hvs_formats[] =3D {
> >   	{
> >   		.drm =3D DRM_FORMAT_XRGB8888,
> > @@ -128,6 +129,12 @@ static const struct hvs_format {
> >   		.hvs =3D HVS_PIXEL_FORMAT_YCBCR_YUV422_2PLANE,
> >   		.pixel_order =3D HVS_PIXEL_ORDER_XYCRCB,
> >   	},
> > +	{
> > +		.drm =3D DRM_FORMAT_P030,
> > +		.hvs =3D HVS_PIXEL_FORMAT_YCBCR_10BIT,
> > +		.pixel_order =3D HVS_PIXEL_ORDER_XYCBCR,
> > +		.hvs5_only =3D true,
> > +	},
> >   };
> >   static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
> > @@ -762,47 +769,90 @@ static int vc4_plane_mode_set(struct drm_plane *p=
lane,
> >   	case DRM_FORMAT_MOD_BROADCOM_SAND128:
> >   	case DRM_FORMAT_MOD_BROADCOM_SAND256: {
> >   		uint32_t param =3D fourcc_mod_broadcom_param(fb->modifier);
> > -		u32 tile_w, tile, x_off, pix_per_tile;
> > -
> > -		hvs_format =3D HVS_PIXEL_FORMAT_H264;
> > -
> > -		switch (base_format_mod) {
> > -		case DRM_FORMAT_MOD_BROADCOM_SAND64:
> > -			tiling =3D SCALER_CTL0_TILING_64B;
> > -			tile_w =3D 64;
> > -			break;
> > -		case DRM_FORMAT_MOD_BROADCOM_SAND128:
> > -			tiling =3D SCALER_CTL0_TILING_128B;
> > -			tile_w =3D 128;
> > -			break;
> > -		case DRM_FORMAT_MOD_BROADCOM_SAND256:
> > -			tiling =3D SCALER_CTL0_TILING_256B_OR_T;
> > -			tile_w =3D 256;
> > -			break;
> > -		default:
> > -			break;
> > -		}
> >   		if (param > SCALER_TILE_HEIGHT_MASK) {
> > -			DRM_DEBUG_KMS("SAND height too large (%d)\n", param);
> > +			DRM_DEBUG_KMS("SAND height too large (%d)\n",
> > +				      param);
>=20
> Should be good for the 100-character limit.
>=20
> >   			return -EINVAL;
> >   		}
> > -		pix_per_tile =3D tile_w / fb->format->cpp[0];
> > -		tile =3D vc4_state->src_x / pix_per_tile;
> > -		x_off =3D vc4_state->src_x % pix_per_tile;
> > +		if (fb->format->format =3D=3D DRM_FORMAT_P030) {
> > +			hvs_format =3D HVS_PIXEL_FORMAT_YCBCR_10BIT;
> > +			tiling =3D SCALER_CTL0_TILING_128B;
> > +		} else {
> > +			hvs_format =3D HVS_PIXEL_FORMAT_H264;
> > +
> > +			switch (base_format_mod) {
> > +			case DRM_FORMAT_MOD_BROADCOM_SAND64:
> > +				tiling =3D SCALER_CTL0_TILING_64B;
> > +				break;
> > +			case DRM_FORMAT_MOD_BROADCOM_SAND128:
> > +				tiling =3D SCALER_CTL0_TILING_128B;
> > +				break;
> > +			case DRM_FORMAT_MOD_BROADCOM_SAND256:
> > +				tiling =3D SCALER_CTL0_TILING_256B_OR_T;
> > +				break;
> > +			default:
> > +				return -EINVAL;
>=20
> It's not atomic modesetting? I'm asking because the code returns errno co=
des
> in several places.

This is atomic modesetting, but we're allowed to return an error at this
point :)

The function name is a bit confusing but it's mostly due to how the
hardware operates. We don't have the usual register set for the
composition but instead we have a list of hardware descriptors that will
describe the next frame.

The driver builds it here, at atomic_check time, and then copy it to the
hardware at atomic_commit time. So even though it's called
vc4_plane_mode_set, and does the operations needed to setup the
composition properly, we're still in atomic_check at this point.

> > +			}
> > +		}
> >   		/* Adjust the base pointer to the first pixel to be scanned
> >   		 * out.
> > +		 *
> > +		 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
> > +		 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
> > +		 * word that should be taken as the first pixel.
> > +		 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
> > +		 * element within the 128bit word, eg for pixel 3 the value
> > +		 * should be 6.
> >   		 */
> >   		for (i =3D 0; i < num_planes; i++) {
> > +			u32 tile_w, tile, x_off, pix_per_tile;
> > +
> > +			if (fb->format->format =3D=3D DRM_FORMAT_P030) {
> > +				/*
> > +				 * Spec says: bits [31:4] of the given address
> > +				 * should point to the 128-bit word containing
> > +				 * the desired starting pixel, and bits[3:0]
> > +				 * should be between 0 and 11, indicating which
> > +				 * of the 12-pixels in that 128-bit word is the
> > +				 * first pixel to be used
> > +				 */
> > +				u32 remaining_pixels =3D vc4_state->src_x % 96;
> > +				u32 aligned =3D remaining_pixels / 12;
> > +				u32 last_bits =3D remaining_pixels % 12;
> > +
> > +				x_off =3D aligned * 16 + last_bits;
> > +				tile_w =3D 128;
> > +				pix_per_tile =3D 96;
> > +			} else {
> > +				switch (base_format_mod) {
> > +				case DRM_FORMAT_MOD_BROADCOM_SAND64:
> > +					tile_w =3D 64;
> > +					break;
> > +				case DRM_FORMAT_MOD_BROADCOM_SAND128:
> > +					tile_w =3D 128;
> > +					break;
> > +				case DRM_FORMAT_MOD_BROADCOM_SAND256:
> > +					tile_w =3D 256;
> > +					break;
> > +				default:
> > +					return -EINVAL;
> > +				}
> > +				pix_per_tile =3D tile_w / fb->format->cpp[0];
> > +				x_off =3D (vc4_state->src_x % pix_per_tile) /
> > +					(i ? h_subsample : 1) *
> > +					fb->format->cpp[i];
> > +			}
> > +
> > +			tile =3D vc4_state->src_x / pix_per_tile;
> > +
>=20
> It's hard to read. If you can put some of these switches into helpers, it
> might be worth it.

Indeed. The whole function would need some though, is it ok if I send a
subsequent patch to fix it after merging this one?

> >   			vc4_state->offsets[i] +=3D param * tile_w * tile;
> >   			vc4_state->offsets[i] +=3D src_y /
> >   						 (i ? v_subsample : 1) *
> >   						 tile_w;
> > -			vc4_state->offsets[i] +=3D x_off /
> > -						 (i ? h_subsample : 1) *
> > -						 fb->format->cpp[i];
> > +			vc4_state->offsets[i] +=3D x_off & ~(i ? 1 : 0);
> >   		}
> >   		pitch0 =3D VC4_SET_FIELD(param, SCALER_TILE_HEIGHT);
> > @@ -955,7 +1005,8 @@ static int vc4_plane_mode_set(struct drm_plane *pl=
ane,
> >   	/* Pitch word 1/2 */
> >   	for (i =3D 1; i < num_planes; i++) {
> > -		if (hvs_format !=3D HVS_PIXEL_FORMAT_H264) {
> > +		if (hvs_format !=3D HVS_PIXEL_FORMAT_H264 &&
> > +		    hvs_format !=3D HVS_PIXEL_FORMAT_YCBCR_10BIT) {
>=20
> This branch's condition looks like is could be a little helper.
>=20
> >   			vc4_dlist_write(vc4_state,
> >   					VC4_SET_FIELD(fb->pitches[i],
> >   						      SCALER_SRC_PITCH));
> > @@ -1315,6 +1366,13 @@ static bool vc4_format_mod_supported(struct drm_=
plane *plane,
> >   		default:
> >   			return false;
> >   		}
> > +	case DRM_FORMAT_P030:
> > +		switch (fourcc_mod_broadcom_mod(modifier)) {
> > +		case DRM_FORMAT_MOD_BROADCOM_SAND128:
> > +			return true;
> > +		default:
> > +			return false;
> > +		}
> >   	case DRM_FORMAT_RGBX1010102:
> >   	case DRM_FORMAT_BGRX1010102:
> >   	case DRM_FORMAT_RGBA1010102:
> > @@ -1347,8 +1405,11 @@ struct drm_plane *vc4_plane_init(struct drm_devi=
ce *dev,
> >   	struct drm_plane *plane =3D NULL;
> >   	struct vc4_plane *vc4_plane;
> >   	u32 formats[ARRAY_SIZE(hvs_formats)];
> > +	int num_formats =3D 0;
> >   	int ret =3D 0;
> >   	unsigned i;
> > +	bool hvs5 =3D of_device_is_compatible(dev->dev->of_node,
> > +					    "brcm,bcm2711-vc5");
>=20
> Maybe also a little helper function?
>=20
> >   	static const uint64_t modifiers[] =3D {
> >   		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
> >   		DRM_FORMAT_MOD_BROADCOM_SAND128,
> > @@ -1363,13 +1424,17 @@ struct drm_plane *vc4_plane_init(struct drm_dev=
ice *dev,
> >   	if (!vc4_plane)
> >   		return ERR_PTR(-ENOMEM);
> > -	for (i =3D 0; i < ARRAY_SIZE(hvs_formats); i++)
> > -		formats[i] =3D hvs_formats[i].drm;
> > +	for (i =3D 0; i < ARRAY_SIZE(hvs_formats); i++) {
> > +		if (!hvs_formats[i].hvs5_only || hvs5) {
> > +			formats[num_formats] =3D hvs_formats[i].drm;
> > +			num_formats++;
> > +		}
> > +	}
>=20
> With this loop, could num_formats ever be 0?

It shouldn't no, unless the older generation didn't define any format,
which is highly unlikely.

Maxime

--yjapqddx42py7bzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbr6EAAKCRDj7w1vZxhR
xepIAQDqK8gZkS6jL/qeXIAJFeEUZ3e6tJrQyotg6KpY7A6m5QD/TmhXCFnxkPwK
NBNQP7z8jiIFRzlS+zVRRdusO8n2UgM=
=DDtZ
-----END PGP SIGNATURE-----

--yjapqddx42py7bzy--
