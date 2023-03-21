Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC16C2E38
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 10:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47E310E0DE;
	Tue, 21 Mar 2023 09:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB8A10E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YC2+/4EQm/xVd44KstXWy+xxjzvPLGHanbp1gp7EHEE=; b=qUDjy+d2aq3Psn2pcHO9LLS7yt
 e3WWAH4EK+iuZHsojMNL+sV+YSH2bj43/KalbNInxH+F96Ce0MRwJcbu3JPxqiwkWE4JToByVwvjx
 o2htecKBFUcirwxVeKIW41MLRlS8ob8/Py+JzUS813msnC8ZHukDq/MkT5dRXrhlwf3mk5VvxvBae
 b1skw6cwEUnVwDRgVC8OJ5oKmdOeU6vg4QiVlvmDQlqUpyA83mfTEO0Y6FLLt1bytwGA9qrF4rDxn
 q29XruWChuvJ+draakmDQXNMkclJPDOU1jNQ3U9GNWnl99/83IT/Frdx2DX3jxdRK/SSsLIOQLWu6
 vjCGaC4A==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1peYd8-001h2N-89; Tue, 21 Mar 2023 10:50:10 +0100
Date: Tue, 21 Mar 2023 08:49:59 -0100
From: Melissa Wen <mwen@igalia.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 06/37] drm/vkms/vkms_composer: Fix a few different
 kerneldoc formatting
Message-ID: <20230321094940.ndf5nhvfr2y67d3x@mail.igalia.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-7-lee@kernel.org>
 <20230320234639.va6an7gton3u6eke@mail.igalia.com>
 <23fe0765-fb3b-9bf4-ecb4-507e6f3edefe@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mszaorulbvh6kbof"
Content-Disposition: inline
In-Reply-To: <23fe0765-fb3b-9bf4-ecb4-507e6f3edefe@infradead.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mszaorulbvh6kbof
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hvarfbsob5fb6dvn"
Content-Disposition: inline


--hvarfbsob5fb6dvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 03/20, Randy Dunlap wrote:
>=20
>=20
> On 3/20/23 16:46, Melissa Wen wrote:
> > On 03/17, Lee Jones wrote:
> >> Fixes the following W=3D1 kernel build warning(s):
> >>
> >>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Function parameter =
or member 'frame_info' not described in 'pre_mul_alpha_blend'
> >>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Excess function par=
ameter 'src_frame_info' description in 'pre_mul_alpha_blend'
> >>  drivers/gpu/drm/vkms/vkms_composer.c:72: warning: Cannot understand  =
* @wb_frame_info: The writeback frame buffer metadata
> >>
> >> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> >> Cc: Melissa Wen <melissa.srw@gmail.com>
> >> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Lee Jones <lee@kernel.org>
> >> ---
> >>  drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vk=
ms/vkms_composer.c
> >> index 8e53fa80742b2..41668eedf4272 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >> @@ -22,7 +22,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u=
16 alpha)
> >> =20
> >>  /**
> >>   * pre_mul_alpha_blend - alpha blending equation
> >> - * @src_frame_info: source framebuffer's metadata
> >> + * @frame_info: source framebuffer's metadata
> >>   * @stage_buffer: The line with the pixels from src_plane
> >>   * @output_buffer: A line buffer that receives all the blends output
> >>   *
> >> @@ -69,11 +69,13 @@ static void fill_background(const struct pixel_arg=
b_u16 *background_color,
> >>  }
> >> =20
> >>  /**
> >> - * @wb_frame_info: The writeback frame buffer metadata
> >> + * blend
> > As we are already here:
> > * blend - blend pixels from a given row and calculate crc
>=20
>  * blend: blend pixels from a given row and calculate CRC
>=20
> preferably.

Hmm.. I didn't get the colon suggestion. This first line is a brief
description of the function blend(), so I understand that a more
accurate doc standard is:

blend() - Blend pixels from a given row and calculate crc

Thanks,

Melissa

>=20
> > Reviewed-by: Melissa Wen <mwen@igalia.com>
> >=20
> >> + * @wb: The writeback frame buffer metadata
> >>   * @crtc_state: The crtc state
> >>   * @crc32: The crc output of the final frame
> >>   * @output_buffer: A buffer of a row that will receive the result of =
the blend(s)
> >>   * @stage_buffer: The line with the pixels from plane being blend to =
the output
> >> + * @row_size: Size of memory taken up by row data (line_width * pixel=
_size)
> >>   *
> >>   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
> >>   * from all planes, calculates the crc32 of the output from the forme=
r step,
> >> --=20
> >> 2.40.0.rc1.284.g88254d51c5-goog
> >>
>=20
> --=20
> ~Randy

--hvarfbsob5fb6dvn--

--mszaorulbvh6kbof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQZfccACgkQwqF3j0dL
ehwgAw//T17cNrIVrWzZVC1UtoRoMvZTisxv51xOE0428x7H937p4RnfQE/kBRsb
auqimM45XwAdY5n2YU4hVhxfFy48neld07VGjD5UoJVMzJl7sN2/cPXljOGe85OI
202/YDOFJ7r7PmX2CdxdInXG/Q/pwXTsptHRgVhQft0aHFFH7N794UfkYFbdNaQC
VB0EMCo3FrBjIVyFh1Vf+MA3r7OPVWDkpBNv7jtiem47VPLxY0onY/UbkRziCuiS
sI1Byh9doxRA9NrwLwOnwy3W2poa21nTqZmuGCZsecAJ1l+hr/06hJ6dSw9dfcV9
JHTRMeS29rJvxQ9arkfho5lbmy9aRBOwmMSMvAAZDSYJzJwbycPcWbG0J4AZP8Rc
H1y9vkV5lVNaFSajr+mCoTENPva3snTBKyUCdGHa5k7hk/24pYudTrMmKk/ac1Aa
T5Sty2+snLmKq3IuXT8LPxvKpEXNXOgwCSh4KabnkV3Uf+Tk1Wj9I+qzwoKgbJkh
1DnoMAp9dWj783CsFKrXvsPbRgKEwpgLi6rQZ8ZbUeqgUxmMmSVB1gy6wmFpOP/S
i8lidJta87Ui1iUXl9qF3/vcImxuYt3JsM5mrJW5C379X7sAyUVQJhxguxlZXGan
jbF3/k9H2rePneOgckRZs1oFLwzp8InjZe6cR3OrjXH6SPcVUxc=
=86St
-----END PGP SIGNATURE-----

--mszaorulbvh6kbof--
