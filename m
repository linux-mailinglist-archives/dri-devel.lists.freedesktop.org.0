Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D278253F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 10:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304310E212;
	Mon, 21 Aug 2023 08:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C810E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 08:17:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 200F962CF1;
 Mon, 21 Aug 2023 08:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BFBC433C8;
 Mon, 21 Aug 2023 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692605831;
 bh=3ZKJpinIH2/iut+h/CCtDPASeiIXBc799WdevH/qqmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GhLbEeM7EQQhU0UIM04FQCnt5+vhHA6CR0ZGY0uq07g0IgJdYmDFOK4EniRI9rhb3
 orGayhWzwAkYxYJDRRUyzmhRWKQ1Vd8nG3dU3vS6yeB/T2E+d00aCQ0utJ7bKH4YZJ
 /s9aKI8uKtoouKBCGAS7j4cHIF4XO7BJAF23x/8zNQFJkUvtfoDbockCkRfZ2A5wXb
 JfI4iwOcgbqrwWQdxSoIp62ZwsxljM6emsxlo2Z24cTu7NV02NrOK/VPav5QFxX1Uf
 2akPfkHU0hhF8KTU2Rud3Eh002npAOaogioU6RE0xaBZPFXfDIk4Ie9F83+I8NaSa8
 u27Jwa7Kq4oow==
Date: Mon, 21 Aug 2023 10:17:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Message-ID: <giimknikofbipipawfmrcjiar5qfyw3t7sqy3iewjahsm3ktkt@qcn4g23zfcnj>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fbbdtuo55smypndw"
Content-Disposition: inline
In-Reply-To: <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, quic_parellan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fbbdtuo55smypndw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.org wrote:
> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> > On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> > > Sending HS commands will always work on any controller, it's all
> > > about LP commands. The Samsung panels you listed only send HS
> > > commands so they can use prepare_prev_first and work on any
> > > controllers.
> >=20
> > I think there is some misunderstanding there, supported by the
> > description of the flag.
> >=20
> > If I remember correctly, some hosts (sunxi) can not send DCS
> > commands after enabling video stream and switching to HS mode, see
> > [1]. Thus, as you know, most of the drivers have all DSI panel setup
> > commands in drm_panel_funcs::prepare() /
> > drm_bridge_funcs::pre_enable() callbacks, not paying attention
> > whether these commands are to be sent in LP or in HS mode.
> >=20
> > Previously DSI source drivers could power on the DSI link either in
> > mode_set() or in pre_enable() callbacks, with mode_set() being the
> > hack to make panel/bridge drivers to be able to send commands from
> > their prepare() / pre_enable() callbacks.
> >=20
> > With the prev_first flags being introduced, we have established that
> > DSI link should be enabled in DSI host's pre_enable() callback and
> > switched to HS mode (be it command or video) in the enable()
> > callback.
> >
> > So far so good.
>=20
> It seems coherent, I would like first to have a state of all DSI host
> drivers and make this would actually work first before adding the
> prev_first flag to all the required panels.

This is definitely what we should do in an ideal world, but at least for
sunxi there's no easy way for it at the moment. There's no documentation
for it and the driver provided doesn't allow this to happen.

Note that I'm not trying to discourage you or something here, I'm simply
pointing out that this will be something that we will have to take into
account. And it's possible that other drivers are in a similar
situation.

> > Unfortunately this change is not fully backwards-compatible. This
> > requires that all DSI panels sending commands from prepare() should
> > have the prepare_prev_first flag. In some sense, all such patches
> > might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first
> > flag to drm_panel").
>=20
> This kind of migration should be done *before* any possible
> regression, not the other way round.
>=20
> If all panels sending commands from prepare() should have the
> prepare_prev_first flag, then it should be first, check for
> regressions then continue.
>=20
> <snip>
>=20
> > >=20
> > > I understand, but this patch doesn't qualify as a fix for
> > > 9e15123eca79 and is too late to be merged in drm-misc-next for
> > > v6.6, and since 9e15123eca79 actually breaks some support it
> > > should be reverted (+ deps) since we are late in the rc cycles.
> >=20
> > If we go this way, we can never reapply these patches. There will be
> > no guarantee that all panel drivers are completely converted. We
> > already have a story without an observable end -
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>=20
> I don't understand this point, who would block re-applying the patches ?
>=20
> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple
> Linux version and went smoothly because we reverted regressing patches
> and restarted when needed, I don't understand why we can't do this
> here aswell.
>=20
> > I'd consider that the DSI driver is correct here and it is about the
> > panel drivers that require fixes patches. If you care about the
> > particular Fixes tag, I have provided one several lines above.
>=20
> Unfortunately it should be done in the other way round, prepare for
> migration, then migrate,
>=20
> I mean if it's a required migration, then it should be done and I'll
> support it from both bridge and panel PoV.
>=20
> So, first this patch has the wrong Fixes tag, and I would like a
> better explanation on the commit message in any case. Then I would
> like to have an ack from some drm-misc maintainers before applying it
> because it fixes a patch that was sent via the msm tree thus per the
> drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.

Sorry, it's not clear to me what you'd like our feedback on exactly?

Maxime

--fbbdtuo55smypndw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOMdhAAKCRDj7w1vZxhR
xZT/AQCD0eZvXfqc9oKaTnL8HrP+5UOzFRLh0XdZwb5uzpQUhQEAirhafu7tNxGY
OLbi1TOM0JsONkjEE0PCn/teKuS72Q4=
=KHaG
-----END PGP SIGNATURE-----

--fbbdtuo55smypndw--
