Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD699853C7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015C210E7A9;
	Wed, 25 Sep 2024 07:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dXtY1RiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAABD10E220;
 Wed, 25 Sep 2024 07:22:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22D225C0144;
 Wed, 25 Sep 2024 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F941C4CED1;
 Wed, 25 Sep 2024 07:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727248941;
 bh=wvJN4WdNJq+ikyWCYooPu29ShgLTqdXMZAS91sR2sxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dXtY1RiNIfJbjT9NSyn6wxR3HW364xA0bnVyIitS8v7S0QbowK3L3+dxa6xdn4a2J
 xT+5QAcx8VKo7oZRIt2Kll/4qo3BeJJ8h2qsMdNNaMNUbo7NPtNjp9MXg1Vk5iN3gt
 PBd+9e/SLaQRbol82QL462RHDbiUyiId1zitWo0UntLQrgkINJ3mDDehQdQ5rxY1+f
 nklEvwzRiIBL82X2q2nGu7RtBPgw/H45E4SYlvjfJL6VJp/TRc7DgLrtJdHFErLtxo
 hhv0EXSzUJuG+u6OZLinCg5qF6QUq0ygduKO/R5mb9OMLoDCcq7aClaWXBt8rsd+zx
 +FZx4YcFDvTBg==
Date: Wed, 25 Sep 2024 09:22:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 01/22] drm: add clone mode check for CRTC
Message-ID: <20240925-energetic-pink-bullmastiff-90dc6c@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
 <y2apz5arp5d7jv2fqujh2qyl2gqovmpvkpvpvpxewitfcreke2@ihung7uzmcwu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6a7ni6cfznndywsv"
Content-Disposition: inline
In-Reply-To: <y2apz5arp5d7jv2fqujh2qyl2gqovmpvkpvpvpxewitfcreke2@ihung7uzmcwu>
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


--6a7ni6cfznndywsv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Wed, Sep 25, 2024 at 02:06:35AM GMT, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 03:59:17PM GMT, Jessica Zhang wrote:
> > Add helper to check if the given CRTC state is in clone mode
> >=20
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  include/drm/drm_crtc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 8b48a1974da3..ecb93e2c4afc 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(str=
uct drm_device *dev,
> > =20
> >  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> >  					    unsigned int supported_filters);
>=20
> Missing kerneldoc

Also, a proper commit log to describe what this will be used for, and
ideally some kunit tests.

Maxime

--6a7ni6cfznndywsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvO6JgAKCRAnX84Zoj2+
doTvAX9SOFmrk/9TfYM9NXyPJ9lcJzxAl1/XcDNnQdUxvHqrbgknFw8Xe4olazwF
1uUH1IcBgJIxlwLNu5GkTg2rDOw9kOX7sdqd8wicKJUaU3xY/e6ABsGLvlTGvd1C
V9mRLwWF7w==
=Z/MV
-----END PGP SIGNATURE-----

--6a7ni6cfznndywsv--
