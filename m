Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509ABA61312
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8110E9F6;
	Fri, 14 Mar 2025 13:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mJ3Yqk4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17E510E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:52:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 14BB4A47452;
 Fri, 14 Mar 2025 13:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E679C4CEE3;
 Fri, 14 Mar 2025 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741960364;
 bh=CaPV8/DUO42Un9C1VboHhkm+TZPcBTQ9zJaqy+mFrgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJ3Yqk4/wMoEP3MlA8qq5PtLHzCiq/rJpOJNLC/IeypEotMw4qQQgEc3a62+5Zv2d
 5O7bCvxRSI2xwSPj7CnrVSbwy0sZMX8s/Pqr3b6LBUzNpEFruA13Fq1yydUL8MnrTl
 Y7oKt9/mREVzVTypBLJg3xwzuR3RhD5rcB+WpFPTKzjUsuH/JM/xRuNaIfC9NWnLsM
 kuny6X7eyKsp6nrKeCanSadCcHPQd/AA4keKxO0/z4pGPe67sAkFXiV27UCG0fc3cJ
 ZGjzkpZ8gZD/1yjfYXy6u8m+5TBkyBb2SuPxaMG0MqanEzfC4u2VpRFGCJ8RWcbSfz
 R6SEsNYmHVXlw==
Date: Fri, 14 Mar 2025 14:52:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
Message-ID: <20250314-didactic-bandicoot-of-perspective-e077ae@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-6-fbdb94f02562@collabora.com>
 <20250311-burgundy-cat-of-diversity-b89681@houat>
 <dca413e0-bad5-485d-9c77-402d806e97a5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3qcnnqf3voxkluic"
Content-Disposition: inline
In-Reply-To: <dca413e0-bad5-485d-9c77-402d806e97a5@collabora.com>
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


--3qcnnqf3voxkluic
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/7] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
MIME-Version: 1.0

On Wed, Mar 12, 2025 at 12:54:51AM +0200, Cristian Ciocaltea wrote:
> On 3/11/25 6:17 PM, Maxime Ripard wrote:
> > On Tue, Mar 11, 2025 at 12:57:38PM +0200, Cristian Ciocaltea wrote:
> >> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
> >> helper behaviour when using YUV420 output format is to always set the
> >> limited RGB quantization range to 'limited', no matter what the value =
of
> >> Broadcast RGB property is.
>=20
> [...]
>=20
> > We need more tests than that to test the various combinations, whether
> > the fallback to YUV420 should work or not depending on the EDID, the
> > driver capabilities, YUV420-only vs YUV420-also, etc.
>=20
> Some fallback tests were provided in the next patch, including checks lik=
e:
>=20
>   KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
>   KUNIT_ASSERT_TRUE(test, drm_mode_is_420_also(info, preferred));
>=20
> I'll try to further extend the test coverage.

Yeah, sorry, I saw them after reviewing this patch. Still, I think we'll
need more, especially to deal with the fallback cases. IIRC, you were
testing the cases where you're forced to take YUV420 because of the
monitors (or drivers) limit, but we should also try the tests where
you're forced to take YUV420 but the driver implements HDMI 1.4 only for
example, and thus we can't.

Maxime

--3qcnnqf3voxkluic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9Q0qQAKCRAnX84Zoj2+
djFTAYCuCBkdca3mDmyZr8j1d6GofqJ5n0Bb8bJklVbWIbH7K+7imNbVo3T+A9mB
K/vjC3oBf35IdeIrLSQ8RShZCAynMcSLfo2Oi2WrGtjbVt8aT2fKukV1hGlkB1eu
eI6OqsWeHg==
=qXNN
-----END PGP SIGNATURE-----

--3qcnnqf3voxkluic--
