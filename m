Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01C7483BC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191D10E152;
	Wed,  5 Jul 2023 12:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA95810E152;
 Wed,  5 Jul 2023 12:04:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6027F6149F;
 Wed,  5 Jul 2023 12:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C41C433C8;
 Wed,  5 Jul 2023 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688558643;
 bh=zpQHiah5pU5ivi5QnyiHH3I+kbG+Eq4swtcEgTjXUaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZsPAFsMvzkFtlDcZtJDpGIX2qQVVvXrwaEzMc7YGvKZhROXNuKvg722OlAweWXL/Z
 j/jjr5q2t1u9HoihkQya58R90kZ8PdgAnd8yduFaPMAyXzRdjHcwUMfWJeFXrfIJ3G
 EjC2RAZc6dMyu2vTUkhLFprfZWTXvfJ96Wi2veiK2ujOoYv4keYHeszKrCwk5uXp9Z
 fDKdRi4Mtl+hulGM3htJArlZxOiz07hCizRGXwqFm6LXkHSfc7u8w8yTPDRbRer9RX
 3mpjgitDz4YcBfN48skVFGVMqzApFLpaGUrl/wa9xzf94H/A7MXMOVghnRJEJfUUkP
 HfXztUJE8FJPA==
Date: Wed, 5 Jul 2023 14:04:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel:
 Add LGD panel driver for Sony Xperia XZ3)
Message-ID: <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vjd4hy6ibnmkekav"
Content-Disposition: inline
In-Reply-To: <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vjd4hy6ibnmkekav
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 30, 2023 at 03:36:04PM +0300, Dmitry Baryshkov wrote:
> On 30/05/2023 15:15, AngeloGioacchino Del Regno wrote:
> > Il 30/05/23 13:44, Dmitry Baryshkov ha scritto:
> > > On Tue, 30 May 2023 at 10:24, Neil Armstrong
> > > <neil.armstrong@linaro.org> wrote:
> > > >=20
> > > > Hi Marijn, Dmitry, Caleb, Jessica,
> > > >=20
> > > > On 29/05/2023 23:11, Marijn Suijten wrote:
> > > > > On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> > > > > <snip>
> > > > > > > +=A0=A0 if (ctx->dsi->dsc) {
> > > > > >=20
> > > > > > dsi->dsc is always set, thus this condition can be dropped.
> > > > >=20
> > > > > I want to leave room for possibly running the panel without DSC (=
at a
> > > > > lower resolution/refresh rate, or at higher power consumption if =
there
> > > > > is enough BW) by not assigning the pointer, if we get access to p=
anel
> > > > > documentation: probably one of the magic commands sent in this dr=
iver
> > > > > controls it but we don't know which.
> > > >=20
> > > > I'd like to investigate if DSC should perhaps only be enabled if we
> > > > run non certain platforms/socs ?
> > > >=20
> > > > I mean, we don't know if the controller supports DSC and those
> > > > particular
> > > > DSC parameters so we should probably start adding something like :
> > > >=20
> > > > static drm_dsc_config dsc_params_qcom =3D {}
> > > >=20
> > > > static const struct of_device_id panel_of_dsc_params[] =3D {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "qcom,sm8150", , .data =
=3D &dsc_params_qcom },
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "qcom,sm8250", , .data =
=3D &dsc_params_qcom },
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "qcom,sm8350", , .data =
=3D &dsc_params_qcom },
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "qcom,sm8450", , .data =
=3D &dsc_params_qcom },
> > > > };
> > >=20
> > > I think this would damage the reusability of the drivers. The panel
> > > driver does not actually care if the SoC is SM8350, sunxi-something or
> > > RCar.
> > > Instead it cares about host capabilities.
> > >=20
> > > I think instead we should extend mipi_dsi_host:
> > >=20
> > > #define MIPI_DSI_HOST_MODE_VIDEO BIT(0)
> > > #define MIPI_DSI_HOST_MODE_CMD=A0 BIT(1)
> > > #define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
> > > // FIXME: do we need to provide additional caps here ?
> > >=20
> > > #define MIPI_DSI_DSC_1_1 BIT(0)
> > > #define MIPI_DSI_DSC_1_2 BIT(1)
> > > #define MIPI_DSI_DSC_NATIVE_422 BIT(2)
> > > #define MIPI_DSI_DSC_NATIVE_420 BIT(3)
> > > #define MIPI_DSI_DSC_FRAC_BPP BIT(4)
> > > // etc.
> > >=20
> > > struct mipi_dsi_host {
> > > =A0 // new fields only
> > > =A0=A0 unsigned long mode_flags;
> > > =A0=A0 unsigned long dsc_flags;
> > > };
> > >=20
> > > Then the panel driver can adapt itself to the host capabilities and
> > > (possibly) select one of the internally supported DSC profiles.
> > >=20
> >=20
> > I completely agree about extending mipi_dsi_host, other SoCs could reuse
> > that and
> > support for DSC panels would become a lot cleaner.
>=20
> Sounds good. I will wait for one or two more days (to get the possible
> feedback on fields/flags/etc) and post an RFC patch to dri-devel.

I just came across that discussion, and couldn't find those patches, did
you ever send them?

Either way, I'm not really sure it's a good idea to multiply the
capabilities flags of the DSI host, and we should just stick to the
spec. If the spec says that we have to support DSC while video is
output, then that's what the panels should expect.

If a host isn't able to provide that, it's a bug and we should fix the
controller driver instead of creating a workaround in the core for
broken drivers.

Another concern I have is that, those broken drivers are usually the
undocumented ones that already have trouble supporting the most trivial
setup. Creating more combinations both at the controller and panel level
will just make it harder for those drivers.

Maxime

--vjd4hy6ibnmkekav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKVcMAAKCRDj7w1vZxhR
xeVgAQDMoWfOkJ4iYKGDevKKuJrt/Yox11zWBcNz3kO+JHvKCgEA1xY50FGJLaT2
cS39fgkgt4dP5e/C3mtQGra1z+NhNgM=
=LKUp
-----END PGP SIGNATURE-----

--vjd4hy6ibnmkekav--
