Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD68B03EC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 10:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332D91138EB;
	Wed, 24 Apr 2024 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnIFr8OD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1081138EA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 08:12:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B91DCCE04F0;
 Wed, 24 Apr 2024 08:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD73C113CE;
 Wed, 24 Apr 2024 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713946334;
 bh=w9gDjHiR93JtjxkVNN+g1V++LXSozLGwZwTEig0SE1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnIFr8ODEv8akqrjo5p1YsA+KRMCp70mWNMoJRuKAftUQnHY3HojFhJvke1cqTC9Y
 bmgYUcAkxOMsPwyDmVQ2EJM+0FsPBhhdW48tU9TIwqq/yWHdCoa9G6gpTRHzwovCv9
 VWHLd9RhEXDuM8vtOOy6u24ErHF91rO3MbO29rkLHAf35RdMrO4k/+13PRicV7XZNK
 XykbNqxxWJfNu5wbVp0GqpHYfNQZ4P70evC7xI1SxrWdAsFe18F0pELg7KAkdVlQr5
 WE4ad/DVcuDYDR68EmevPVrVZARkZO8db058CifVmvwQAV9ixLBueLc20lVF5YFHoG
 +Vn1rmlh66MEg==
Date: Wed, 24 Apr 2024 10:12:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] drm/panel/lg-sw43408: depends on
 CONFIG_DRM_DISPLAY_DP_HELPER
Message-ID: <20240424-fierce-stallion-of-promotion-f0fd4e@houat>
References: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
 <20240420-panel-sw43408-fix-v1-1-b282ff725242@linaro.org>
 <d377e5c4-7716-4f4e-8fe4-472e3230eebe@linaro.org>
 <CAA8EJpr-uTiLNbYxq2e7X7-QWaa83Rh3NhZa2ALMxTPPb2Nx0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sh2v2docknokt4s5"
Content-Disposition: inline
In-Reply-To: <CAA8EJpr-uTiLNbYxq2e7X7-QWaa83Rh3NhZa2ALMxTPPb2Nx0Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sh2v2docknokt4s5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 24, 2024 at 10:43:32AM +0300, Dmitry Baryshkov wrote:
> On Wed, 24 Apr 2024 at 09:54, Neil Armstrong <neil.armstrong@linaro.org> =
wrote:
> >
> > On 20/04/2024 04:41, Dmitry Baryshkov wrote:
> > > This panel driver uses DSC PPS functions and as such depends on the
> > > DRM_DISPLAY_DP_HELPER. Add missing dependency
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-l=
kp@intel.com/
> >
> > No Fixes ?
>=20
> I'll add Fixes for v2. I'm waiting for the discussion on Kconfig to settl=
e.
>=20
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/panel/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kc=
onfig
> > > index ab67789e59a2..5e6692207beb 100644
> > > --- a/drivers/gpu/drm/panel/Kconfig
> > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > @@ -340,6 +340,7 @@ config DRM_PANEL_LG_SW43408
> > >       depends on OF
> > >       depends on DRM_MIPI_DSI
> > >       depends on BACKLIGHT_CLASS_DEVICE
> > > +     depends on DRM_DISPLAY_DP_HELPER
> > >       help
> > >         Say Y here if you want to enable support for LG sw43408 panel.
> > >         The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB=
 per
> > >
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

There's an ongoing discussion about reverting the whole Kconfig rework
thing here and the dust hasn't settled yet:

https://lore.kernel.org/r/cover.1713780345.git.geert+renesas@glider.be

I don't think there's anything you need to do now, but it's probably
good to keep it in mind.

Maxime

--sh2v2docknokt4s5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZii+1wAKCRAnX84Zoj2+
dj45AX9YDnQNMOAubQ4yOjRGAj+leeiQG60uJ2t4qDkGTzIp98vsJr3tqea0J1w7
f9H19M0BfRZkOf2rgD06JLuKzLIu/iHxzRNZDgRlHFS5mPEZ2EvwGpjz3XuBlzTS
RsIIS1YrtA==
=B3DS
-----END PGP SIGNATURE-----

--sh2v2docknokt4s5--
