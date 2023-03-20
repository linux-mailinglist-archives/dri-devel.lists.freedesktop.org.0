Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9086C25FB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AB10E680;
	Mon, 20 Mar 2023 23:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE7510E680
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qjGlj36AhIGSa1AAZAAOCOTrRhlZerUf2MbFUxVqE20=; b=mdeyyDTB91teN928KUFNlDOjMB
 bNrqQM5hLEULPQZAPEHSKvqn9OrI1NkaijHMpdBUS72Ums+HyQxVqwaDHd9y0UYj8RNXavNl16eEn
 z+nqgmBQVdvm+HCFLYfK1gKa6KfXIElFxUBC395h91yN2zcouBMaHmrNslhGonGEm09AvTj9p9UIY
 RS5w7LMpEoiGVUW+K6uQpRL0VsvLrzpUIU5qaSHApSOseuVZufspm4NVGE0aGkKGrmcDbxGsxCN9L
 A5bn5PVxhH7MBXes94qKQOdZAXDyWF63Im87NPZYPQ/BZol3+two2fUekD6ZD8Er+70NSNXQDIaAe
 eF8Lm38g==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pePDD-001Nc0-8E; Tue, 21 Mar 2023 00:46:47 +0100
Date: Mon, 20 Mar 2023 22:46:39 -0100
From: Melissa Wen <mwen@igalia.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 06/37] drm/vkms/vkms_composer: Fix a few different
 kerneldoc formatting
Message-ID: <20230320234639.va6an7gton3u6eke@mail.igalia.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-7-lee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="crh4fbey2rj7tisg"
Content-Disposition: inline
In-Reply-To: <20230317081718.2650744-7-lee@kernel.org>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--crh4fbey2rj7tisg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/17, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Function parameter or =
member 'frame_info' not described in 'pre_mul_alpha_blend'
>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Excess function parame=
ter 'src_frame_info' description in 'pre_mul_alpha_blend'
>  drivers/gpu/drm/vkms/vkms_composer.c:72: warning: Cannot understand  * @=
wb_frame_info: The writeback frame buffer metadata
>=20
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 8e53fa80742b2..41668eedf4272 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -22,7 +22,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 =
alpha)
> =20
>  /**
>   * pre_mul_alpha_blend - alpha blending equation
> - * @src_frame_info: source framebuffer's metadata
> + * @frame_info: source framebuffer's metadata
>   * @stage_buffer: The line with the pixels from src_plane
>   * @output_buffer: A line buffer that receives all the blends output
>   *
> @@ -69,11 +69,13 @@ static void fill_background(const struct pixel_argb_u=
16 *background_color,
>  }
> =20
>  /**
> - * @wb_frame_info: The writeback frame buffer metadata
> + * blend
As we are already here:
* blend - blend pixels from a given row and calculate crc

Reviewed-by: Melissa Wen <mwen@igalia.com>

> + * @wb: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
>   * @crc32: The crc output of the final frame
>   * @output_buffer: A buffer of a row that will receive the result of the=
 blend(s)
>   * @stage_buffer: The line with the pixels from plane being blend to the=
 output
> + * @row_size: Size of memory taken up by row data (line_width * pixel_si=
ze)
>   *
>   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>   * from all planes, calculates the crc32 of the output from the former s=
tep,
> --=20
> 2.40.0.rc1.284.g88254d51c5-goog
>=20

--crh4fbey2rj7tisg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQY8FcACgkQwqF3j0dL
ehxK+BAApuPXoLtr8GnXAFyOAoewA7QqIHpu2g1NWQqVTrPBD4CATrh1hqatgwOB
K5Emv+0dkVwdlggEmhemq6yPs0Tr1ZUVisWqnXXvDTqvVSPXgqgjvQsea/cuygyh
RLD2tLCRFz0Cf2rq7J2hTuoMXz4w4DXeqpN+v2TbDvJoGMER17bNJ0Yu6zTaP2z1
37Mu1e1yCu9h2MjUTPJVhjLIMVBsfCUrEVmE3CyrQRf5fRhWk9fkVHI/YQq5Qwm+
zpGyPC0yPidGVXaHw+8cw1EaeKj5zo4UYs/5FbXK7VFVLijbos66iDdQi4mTrJbV
tsv21LjG4cXtNlk69syrr3HLF/V7GaEQBWGJlw9AxW8hZeMu5OfRD/mknwnDJzT5
ca7XHATQQI1FcMA/ynXTpGBxsaJIqxpCPpz5pLgs67X2IoWtQL9Lp1D3yiqtGpfP
JI2xKnvzHiePnOQ4GDo2OKb5wrfCoSFdU/1sEdkb1N/qJZUfBhfoJpwqe7KiSz/8
nO+CAiU2U3ys9x2w08KPIVWBEPtgLFsF+IssGlTxHSVj9Rbk1XGUgP2KEsCtvSnl
h7aiWaZNHboIQJsu4hqlHjcTduhIylhn5YCIuSwo5F4l1zct/2FIfwCCtM5vK1QF
HE1PCzani4c9Ka/4m3uhnmq6XfYXFrNkXBoEMTeXM8LkxM4C/nc=
=LlH9
-----END PGP SIGNATURE-----

--crh4fbey2rj7tisg--
