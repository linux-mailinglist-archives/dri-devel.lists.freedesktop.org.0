Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA464BA38
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F95A10E0EF;
	Tue, 13 Dec 2022 16:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4F710E0EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 16:51:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47C43B812A2;
 Tue, 13 Dec 2022 16:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18D1C433EF;
 Tue, 13 Dec 2022 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670950278;
 bh=38VTaeAeREdNBefz5BIemCTjwdzdm3fTwDkhBzaoWtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUmUzEUR8WL3z2UY0VUeJ63NfrKpiD0Tvg6GXeLxdvumzx90Pfa4K6PKKP9GzXSLr
 2ltW5utOhS9Fd0+kLXGu9pBNA7hC7SNEWwsIs5GlmGPsJmwhMQWE9WBHUAMbsbMqb2
 DHiARUKg0/I2qnMb5kV+UHnuIylJFDU9gFLnJL0HYSqYTKS7EHMD9Jk9JMnvIe5LB7
 kxYK0Wh2RTVcjDD978lVQ4Gb0VC7ZvyEpOly+CGndt7pCX8csyP8MUvxo1T6VtaOoe
 fHx3joK2b9JpJnT1uNJTK97W+xB2hk0eijcD+4NxfiFsOUgUnkXMocTVCbYXIbFF6D
 dd7CsKmkHprzQ==
Date: Tue, 13 Dec 2022 16:51:11 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, bot@kernelci.org,
 Brian Norris <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y5itf0+yNIQa6fU4@sirena.org.uk>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sSRNVLM6Eflr8yEO"
Content-Disposition: inline
In-Reply-To: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sSRNVLM6Eflr8yEO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:

The KernelCI bisection bot found regressions in at least two KMS tests
in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
merged up mainline:

   igt-kms-rockchip.kms_vblank.pipe-A-wait-forked=20
   igt-kms-rockchip.kms_vblank.pipe-A-query-busy

which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
PSR-exit to disable transition").  I'm not *100%* sure I trust the
bisection but it sure is suspicous that two separate bisects for related
issues landed on the same commit.

Below is the full report for the bisect for the first test, the bisect
for the latter looks identical.  It's got links to full logs for the
test run and a Reported-by for the bot - I do see some backtraces from
userspace in the output, the first is:

| IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
| <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
| Starting subtest: short-buffer-wakeup
|=20
| (| drm_read:350) CRITICAL: Test assertion failure function generate_event=
, file ../tests/drm_read.c:65:
| (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=
=3D98
| Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
|=20
| (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
| Stack trace:
|=20
|   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
|   #1 [<unknown>+0xd5362770]
|   #2 [<unknown>+0xd536193c]
|   #3 [__libc_start_main+0xe8]
|   #4 [<unknown>+0xd5361974]
|   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer=
 device 300x100>+0xd5361974]
| Subtest short-buffer-wakeup failed.

Unfortunately we don't have current results from mainline or -next.

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> renesas/master bisection: igt-kms-rockchip.kms_vblank.pipe-A-wait-forked =
on rk3399-gru-kevin
>=20
> Summary:
>   Start:      710ce3a8a6fbfc Merge tag 'v6.1' into renesas-devel
>   Plain log:  https://storage.kernelci.org/renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.txt
>   HTML log:   https://storage.kernelci.org/renesas/master/renesas-devel-2=
022-12-12-v6.1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-km=
s-rockchip-rk3399-gru-kevin.html
>   Result:     ca871659ec1606 drm/bridge: analogix_dp: Support PSR-exit to=
 disable transition
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       renesas
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/geert/renes=
as-devel.git
>   Branch:     master
>   Target:     rk3399-gru-kevin
>   CPU arch:   arm64
>   Lab:        lab-collabora
>   Compiler:   gcc-10
>   Config:     defconfig+arm64-chromebook
>   Test case:  igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit ca871659ec1606d33b1e76de8d4cf924cf627e34
> Author: Brian Norris <briannorris@chromium.org>
> Date:   Mon Feb 28 12:25:31 2022 -0800
>=20
>     drm/bridge: analogix_dp: Support PSR-exit to disable transition
>    =20
>     Most eDP panel functions only work correctly when the panel is not in
>     self-refresh. In particular, analogix_dp_bridge_disable() tends to hit
>     AUX channel errors if the panel is in self-refresh.
>    =20
>     Given the above, it appears that so far, this driver assumes that we =
are
>     never in self-refresh when it comes time to fully disable the bridge.
>     Prior to commit 846c7dfc1193 ("drm/atomic: Try to preserve the crtc
>     enabled state in drm_atomic_remove_fb, v2."), this tended to be true,
>     because we would automatically disable the pipe when framebuffers were
>     removed, and so we'd typically disable the bridge shortly after the l=
ast
>     display activity.
>    =20
>     However, that is not guaranteed: an idle (self-refresh) display pipe =
may
>     be disabled, e.g., when switching CRTCs. We need to exit PSR first.
>    =20
>     Stable notes: this is definitely a bugfix, and the bug has likely
>     existed in some form for quite a while. It may predate the "PSR helpe=
rs"
>     refactor, but the code looked very different before that, and it's
>     probably not worth rewriting the fix.
>    =20
>     Cc: <stable@vger.kernel.org>
>     Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
>     Signed-off-by: Brian Norris <briannorris@chromium.org>
>     Reviewed-by: Sean Paul <seanpaul@chromium.org>
>     Signed-off-by: Douglas Anderson <dianders@chromium.org>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20220228122522.v2=
=2E1.I161904be17ba14526f78536ccd78b85818449b51@changeid
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index eb590fb8e8d0dd..0300f670a4fde7 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1268,6 +1268,25 @@ static int analogix_dp_bridge_attach(struct drm_br=
idge *bridge,
>  	return 0;
>  }
> =20
> +static
> +struct drm_crtc *analogix_dp_get_old_crtc(struct analogix_dp_device *dp,
> +					  struct drm_atomic_state *state)
> +{
> +	struct drm_encoder *encoder =3D dp->encoder;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +
> +	connector =3D drm_atomic_get_old_connector_for_encoder(state, encoder);
> +	if (!connector)
> +		return NULL;
> +
> +	conn_state =3D drm_atomic_get_old_connector_state(state, connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	return conn_state->crtc;
> +}
> +
>  static
>  struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
>  					  struct drm_atomic_state *state)
> @@ -1448,14 +1467,16 @@ analogix_dp_bridge_atomic_disable(struct drm_brid=
ge *bridge,
>  {
>  	struct drm_atomic_state *old_state =3D old_bridge_state->base.state;
>  	struct analogix_dp_device *dp =3D bridge->driver_private;
> -	struct drm_crtc *crtc;
> +	struct drm_crtc *old_crtc, *new_crtc;
> +	struct drm_crtc_state *old_crtc_state =3D NULL;
>  	struct drm_crtc_state *new_crtc_state =3D NULL;
> +	int ret;
> =20
> -	crtc =3D analogix_dp_get_new_crtc(dp, old_state);
> -	if (!crtc)
> +	new_crtc =3D analogix_dp_get_new_crtc(dp, old_state);
> +	if (!new_crtc)
>  		goto out;
> =20
> -	new_crtc_state =3D drm_atomic_get_new_crtc_state(old_state, crtc);
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(old_state, new_crtc);
>  	if (!new_crtc_state)
>  		goto out;
> =20
> @@ -1464,6 +1485,19 @@ analogix_dp_bridge_atomic_disable(struct drm_bridg=
e *bridge,
>  		return;
> =20
>  out:
> +	old_crtc =3D analogix_dp_get_old_crtc(dp, old_state);
> +	if (old_crtc) {
> +		old_crtc_state =3D drm_atomic_get_old_crtc_state(old_state,
> +							       old_crtc);
> +
> +		/* When moving from PSR to fully disabled, exit PSR first. */
> +		if (old_crtc_state && old_crtc_state->self_refresh_active) {
> +			ret =3D analogix_dp_disable_psr(dp);
> +			if (ret)
> +				DRM_ERROR("Failed to disable psr (%d)\n", ret);
> +		}
> +	}
> +
>  	analogix_dp_bridge_disable(bridge);
>  }
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch 'renesas-=
next' into renesas-devel
> git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
> # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag 'v6.1' into r=
enesas-devel
> git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
> # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag 'ata-6.0-rc2'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
> git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
> # bad: [12b68040a5e468068fd7f4af1150eab8f6e96235] Merge tag 'media/v5.20-=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> git bisect bad 12b68040a5e468068fd7f4af1150eab8f6e96235
> # bad: [416e05e5b7ce63402a2c342472799d340559f10e] Merge tag 'regulator-v5=
=2E20' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
> git bisect bad 416e05e5b7ce63402a2c342472799d340559f10e
> # bad: [2b18593e4b9f5781a7683fca256036515bd9b946] Merge tag 'perf_urgent_=
for_v5.19_rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect bad 2b18593e4b9f5781a7683fca256036515bd9b946
> # bad: [be129fab66f284c239251ec5b6e30c6e903d8881] Merge tag 'for-5.19/fbd=
ev-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
> git bisect bad be129fab66f284c239251ec5b6e30c6e903d8881
> # bad: [5c0cd3d4a976b906c3953ff0a0595ba37e04aaa6] Merge tag 'fs_for_v5.19=
-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
> git bisect bad 5c0cd3d4a976b906c3953ff0a0595ba37e04aaa6
> # bad: [cfd80687a5388e731b3db65ad6a557ede9b45905] net: hns3: modify the r=
ing param print info
> git bisect bad cfd80687a5388e731b3db65ad6a557ede9b45905
> # good: [68171bbd1a9adaadac0c6a85c8558eaf0b718387] Merge tag 'net-5.19-rc=
2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> git bisect good 68171bbd1a9adaadac0c6a85c8558eaf0b718387
> # bad: [8f7ac50c97d30ae5ae48da3b516510d05a67b9e5] Merge tag 'sound-5.19-r=
c2' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> git bisect bad 8f7ac50c97d30ae5ae48da3b516510d05a67b9e5
> # good: [0a178750647e47de1700edb2cbd9b0854122f4b9] Merge tag 'amd-drm-fix=
es-5.19-2022-06-08' of https://gitlab.freedesktop.org/agd5f/linux into drm-=
fixes
> git bisect good 0a178750647e47de1700edb2cbd9b0854122f4b9
> # good: [2abdf9f80019e8244d3806ed0e1c9f725e50b452] ASoC: wm_adsp: Fix eve=
nt generation for wm_adsp_fw_put()
> git bisect good 2abdf9f80019e8244d3806ed0e1c9f725e50b452
> # bad: [8dd77d44795d708f5f4f783b81c5197c5b994d74] Merge tag 'drm-fixes-20=
22-06-10' of git://anongit.freedesktop.org/drm/drm
> git bisect bad 8dd77d44795d708f5f4f783b81c5197c5b994d74
> # bad: [e54a4424925a27ed94dff046db3ce5caf4b1e748] drm/atomic: Force bridg=
e self-refresh-exit on CRTC switch
> git bisect bad e54a4424925a27ed94dff046db3ce5caf4b1e748
> # good: [6e516faf04317db2c46cbec4e3b78b4653a5b109] drm/panfrost: Job shou=
ld reference MMU not file_priv
> git bisect good 6e516faf04317db2c46cbec4e3b78b4653a5b109
> # bad: [ca871659ec1606d33b1e76de8d4cf924cf627e34] drm/bridge: analogix_dp=
: Support PSR-exit to disable transition
> git bisect bad ca871659ec1606d33b1e76de8d4cf924cf627e34
> # first bad commit: [ca871659ec1606d33b1e76de8d4cf924cf627e34] drm/bridge=
: analogix_dp: Support PSR-exit to disable transition
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#35500): https://groups.io/g/kernelci-results/message/=
35500
> Mute This Topic: https://groups.io/mt/95644443/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--sSRNVLM6Eflr8yEO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYrX8ACgkQJNaLcl1U
h9DdEgf/fkopO3dVrEI98mCSWIYT8PO0g4H4zttYFRXXMHyKJxVeZaQzve2qdaRr
0l6ScY90A7oWhikQpuJjpFesL59z70DOaqEzcOIDsUh3zxlD6Wy985zedxRB/TJm
yJGrpq3lmWQh0KqjQeKSdJtmmirQP+RvsHnPkpWYU1yn/ZaWaS+TG6C0wQdPrKui
KFON1JOlnZFX92QcRrnVKCHIinLsv7bf1Dt4Y39FJggDq7iWQIDclU1/7z7Bdu2r
bZnh28HjHqNXCS/XSnL0t0635guI698fuaVac4kb70j/LbgrVXl+P4LTVA+CI+rZ
qKtPABXfImjsR4hGXU1Zskt+WCxWEA==
=2O2c
-----END PGP SIGNATURE-----

--sSRNVLM6Eflr8yEO--
