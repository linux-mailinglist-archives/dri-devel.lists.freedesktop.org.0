Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8578280E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70B10E08B;
	Mon, 21 Aug 2023 11:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D191710E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 11:36:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DEBD631C0;
 Mon, 21 Aug 2023 11:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A74C433C9;
 Mon, 21 Aug 2023 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692617799;
 bh=s4tqcywFY5x1xGLeQKFZevnSfrIFMKwbbnMDg6Jc8Fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A2W7gJBzoEw+B7iH/bPkybSUxVGzK2rgbPbYdD/aJPiZDUu7WB4+DsNuJDcnmtaq2
 h9ji5rU+BCw34ddba8x95xa4VB/HyquWE+Fxo/DIX/wB6w8uOzNlSwVPV1fC3KYtpE
 QEMX5uVZURRb/Vg8K1rNWhUIkqsFQbyev2ZLBawGbJzBdpbz+xs0gZz7zVIRicCuWy
 03yj+TlZEpAsl+0Pt/GILSvbi6pc/DRFNdJgAQyvJdSwn7obu0LXXdJcakLfCBz56N
 RbWpYOsKvk538cmB/kMM2oDIRgGB6+w8XwvBCAI6qTL9wmuhVlB20Vr5EAmHVfaHUi
 26GwOU13TO4BQ==
Date: Mon, 21 Aug 2023 13:36:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Message-ID: <kfslzajqd3y3zjreivjbku7lhtqgook7r24mvkcm2dre6yzrsh@6w4iprh7qqbx>
References: <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
 <giimknikofbipipawfmrcjiar5qfyw3t7sqy3iewjahsm3ktkt@qcn4g23zfcnj>
 <76e76728-974e-46ff-8046-c61c54d07c76@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="puzmiyi66lskaags"
Content-Disposition: inline
In-Reply-To: <76e76728-974e-46ff-8046-c61c54d07c76@linaro.org>
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


--puzmiyi66lskaags
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 12:01:19PM +0200, neil.armstrong@linaro.org wrote:
> Hi Maxime,
>=20
> On 21/08/2023 10:17, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.org wro=
te:
> > > On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> > > > On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> > > > > Sending HS commands will always work on any controller, it's all
> > > > > about LP commands. The Samsung panels you listed only send HS
> > > > > commands so they can use prepare_prev_first and work on any
> > > > > controllers.
> > > >=20
> > > > I think there is some misunderstanding there, supported by the
> > > > description of the flag.
> > > >=20
> > > > If I remember correctly, some hosts (sunxi) can not send DCS
> > > > commands after enabling video stream and switching to HS mode, see
> > > > [1]. Thus, as you know, most of the drivers have all DSI panel setup
> > > > commands in drm_panel_funcs::prepare() /
> > > > drm_bridge_funcs::pre_enable() callbacks, not paying attention
> > > > whether these commands are to be sent in LP or in HS mode.
> > > >=20
> > > > Previously DSI source drivers could power on the DSI link either in
> > > > mode_set() or in pre_enable() callbacks, with mode_set() being the
> > > > hack to make panel/bridge drivers to be able to send commands from
> > > > their prepare() / pre_enable() callbacks.
> > > >=20
> > > > With the prev_first flags being introduced, we have established that
> > > > DSI link should be enabled in DSI host's pre_enable() callback and
> > > > switched to HS mode (be it command or video) in the enable()
> > > > callback.
> > > >=20
> > > > So far so good.
> > >=20
> > > It seems coherent, I would like first to have a state of all DSI host
> > > drivers and make this would actually work first before adding the
> > > prev_first flag to all the required panels.
> >=20
> > This is definitely what we should do in an ideal world, but at least for
> > sunxi there's no easy way for it at the moment. There's no documentation
> > for it and the driver provided doesn't allow this to happen.
> >=20
> > Note that I'm not trying to discourage you or something here, I'm simply
> > pointing out that this will be something that we will have to take into
> > account. And it's possible that other drivers are in a similar
> > situation.
> >=20
> > > > Unfortunately this change is not fully backwards-compatible. This
> > > > requires that all DSI panels sending commands from prepare() should
> > > > have the prepare_prev_first flag. In some sense, all such patches
> > > > might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first
> > > > flag to drm_panel").
> > >=20
> > > This kind of migration should be done *before* any possible
> > > regression, not the other way round.
> > >=20
> > > If all panels sending commands from prepare() should have the
> > > prepare_prev_first flag, then it should be first, check for
> > > regressions then continue.
> > >=20
> > > <snip>
> > >=20
> > > > >=20
> > > > > I understand, but this patch doesn't qualify as a fix for
> > > > > 9e15123eca79 and is too late to be merged in drm-misc-next for
> > > > > v6.6, and since 9e15123eca79 actually breaks some support it
> > > > > should be reverted (+ deps) since we are late in the rc cycles.
> > > >=20
> > > > If we go this way, we can never reapply these patches. There will be
> > > > no guarantee that all panel drivers are completely converted. We
> > > > already have a story without an observable end -
> > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> > >=20
> > > I don't understand this point, who would block re-applying the patche=
s ?
> > >=20
> > > The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple
> > > Linux version and went smoothly because we reverted regressing patches
> > > and restarted when needed, I don't understand why we can't do this
> > > here aswell.
> > >=20
> > > > I'd consider that the DSI driver is correct here and it is about the
> > > > panel drivers that require fixes patches. If you care about the
> > > > particular Fixes tag, I have provided one several lines above.
> > >=20
> > > Unfortunately it should be done in the other way round, prepare for
> > > migration, then migrate,
> > >=20
> > > I mean if it's a required migration, then it should be done and I'll
> > > support it from both bridge and panel PoV.
> > >=20
> > > So, first this patch has the wrong Fixes tag, and I would like a
> > > better explanation on the commit message in any case. Then I would
> > > like to have an ack from some drm-misc maintainers before applying it
> > > because it fixes a patch that was sent via the msm tree thus per the
> > > drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.
> >=20
> > Sorry, it's not clear to me what you'd like our feedback on exactly?
>=20
> So let me resume the situation:
>=20
> - pre_enable_prev_first was introduced in [1]
> - some panels made use of pre_enable_prev_first
> - Visionox VTDR6130 was enabled on SM8550 systems and works on v6.5 kerne=
ls and before
> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 on SM8550 s=
ystems (and probably other Video mode panels on Qcom platforms)
> - this fix was sent late, and is now too late to be merged via drm-misc-n=
ext
>=20
> I do not consider it's the right way to fix regression caused by [2] I
> consider [2] should be reverted, panels migrated to
> pre_enable_prev_first when needed, tested and the [2] applied again
>=20
> I have no objection about [2] and it should be done widely over the
> whole DSI controllers and DSI Video panels.
>
> I also object about the Fixes tag of this patch, which is wrong, and
> Dmitry considers [1] should be used but it's even more wrong since [2]
> really caused the regression.

Ok.

> And if [2] was to correct one to use, it was pushed via the MSM tree so i=
t couldn't be
> applied via drm-misc-next-fixes, right ?

AFAICT, 2 is in 6.5 now, so it would be drm-misc-fixes. But yeah, it
would make more sense to take it through the MSM tree.

Maxime

--puzmiyi66lskaags
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZONMRAAKCRDj7w1vZxhR
xdAAAQC8k6mwvjiPF0bwlparlXC2d1HvJZEGd+BDvNZYQuAD9gD/VWvY/lZjqtf7
XK1hEg2W7jitmdtigOE4XxRm45JdRgo=
=sZ74
-----END PGP SIGNATURE-----

--puzmiyi66lskaags--
