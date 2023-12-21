Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B839981B18A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34710E14D;
	Thu, 21 Dec 2023 09:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807C610E689
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DED28B81F9D;
 Thu, 21 Dec 2023 09:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BAAC433C8;
 Thu, 21 Dec 2023 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703149626;
 bh=e4HwI+rYcJHOJPcuJl4AqF12SZkaucHI/9Vovq6T6p8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b856BG6L9vLS0sdCXBgb52Gt/Pt4sqc+2n2ncutFNWVGpa3KsxOb01pBpalzXQ/1m
 jPzxgTVD8CtRJTrcunmi7c3f0smXiR2+O2+uEx8e4M6iLXfvbb5PeHncqjArNYmclK
 lEKUemErrE0JOuQv5OQ9xNHh+Qy3T9Gsy0yT1Jg3SJOZ66xqjYMUJOzWqXk8hjsdE4
 p746EmlkTIaqEN54KIp2WjlFuCYvhi3LJ4ShAFuL+Qu8Jwa9OttanUZhwjCe8pY5pf
 Zbv4lpw8PgS2QweswLZ4Dn+i5+7Ads+HdObObzi9QCITFtlG5AZMKFw4Cv/AOaZ31I
 YuhgD45wOJ1Yw==
Date: Thu, 21 Dec 2023 10:07:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/rockchip: rk3066_hdmi: drop custom fill_modes
 hook
Message-ID: <j2cpes3kyssj6cw34v5z6clef4buzb2j6srvmrniumbn2kptqx@ovf2yvhxlslr>
References: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
 <410b116b-cb63-7ba7-3689-4f0832ab5796@gmail.com>
 <evaq3yfbqf4gchsps2qoojemtii7tmcss24aruiuze5kkzlnhy@mih7rky7viqz>
 <4aeef6df-2616-0741-00a3-6e45ec63f920@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6x4c6jydyzhxy4vm"
Content-Disposition: inline
In-Reply-To: <4aeef6df-2616-0741-00a3-6e45ec63f920@gmail.com>
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de, andy.yan@rock-chips.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6x4c6jydyzhxy4vm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 04:40:12PM +0100, Johan Jonker wrote:
>=20
>=20
> On 12/19/23 13:55, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Dec 18, 2023 at 04:49:06PM +0100, Johan Jonker wrote:
> >> CRTC size validation for the display controller has been added with
> >> Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
> >> hardware capabilities"), so we can drop the custom fill_modes hook.
> >>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >=20
>=20
> > I'm not sure those two are equivalent. CRTC and connectors usually have
> > different requirements and capabilities, and thus different,
> > supplementary, mode_valid/atomic_check implementations.
>=20
> Rockchip RK3066 CRTC and connector resolution max_output are equivalent.
>=20
> From Rockchip PX2 TRM V1.0.pdf page 17:
> - Video Encoder
>   Maximum frame rate is up to 30fps@1920x1080
>=20
> - Display Interface
>   Support LCD or TFT interfaces up to 1920x1080
>=20
> - HDMI TX Interface
>    HDMI version 1.4a, HDCP revision 1.4 and DVI version 1.0 compliant tra=
nsmitter
>    Supports DTV from 480i to 1080i/p HD resolution, and PC from VGA to UX=
GA by LCDC0 or LCDC1 in RK PX2

My point is that there's two limits: the CRTC and HDMI controller ones.
You should put the CRTC ones in the CRTC driver, and the HDMI controller
ones in the HDMI controller driver.

If they are equivalent, great, it's going to filter out the same things, bu=
t...

> Compared to the drm_helper_probe_single_connector_modes() this function a=
dded an extra max_output
>=20
> Checked in rockchip_drm_vop.c is:
> https://lore.kernel.org/linux-rockchip/20230216102447.582905-2-s.hauer@pe=
ngutronix.de/
>=20
> +	if (vop->data->max_output.width && mode->hdisplay > vop->data->max_outp=
ut.width)
> +		return MODE_BAD_HVALUE;
> +
> +	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_out=
put.height)
> +		return MODE_BAD_VVALUE;
>=20
> For RK3066 VOP max_output:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/rockchip/rockchip_vop_reg.c#n506
>=20
> This patch was made with HDMI in mind.
>=20
> 	.max_output =3D { 1920, 1080 },
>=20
> This first part was added by Heiko, but not was not part my patch that I =
submitted:
> -	if (maxX > 1920)
> -		maxX =3D 1920;
> -	if (maxY > 1080)
> -		maxY =3D 1080;
> -
> -	return drm_helper_probe_single_connector_modes(connector, maxX, maxY);
> -}
>=20
> Original patch:
> https://patchwork.freedesktop.org/patch/msgid/20190330095639.14626-2-jbx6=
244@gmail.com
>=20
> +static int
> +rk3066_hdmi_probe_single_connector_modes(struct drm_connector *connector,
> +					 uint32_t maxX, uint32_t maxY)
> +{
> +	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
> +}
>=20
> Rockchip RK3066 CRTC and connector resolution max_output are equivalent.

=2E.. a user / dev unfamiliar with the SoC won't have to go through that
to figure out how it's handled, it will be obvious.

Maxime

--6x4c6jydyzhxy4vm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYQANwAKCRDj7w1vZxhR
xSAjAQC/cny6EDPS6Yo2LIqQuLPlGA1yohiqkZolkGVOCEB3rgEA+W93tTlZ5lV2
ZZIvJUVxNMzYtlqJpZ9Tk7HKVNiPegk=
=tcho
-----END PGP SIGNATURE-----

--6x4c6jydyzhxy4vm--
