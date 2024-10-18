Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E479A37B8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA06710E8C1;
	Fri, 18 Oct 2024 07:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZVkay7Uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471410E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:55:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B72C5C5E8A;
 Fri, 18 Oct 2024 07:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6E9C4CEC5;
 Fri, 18 Oct 2024 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729238128;
 bh=2d/t0Nqc9fQZ9CXdtr2T4TRU96qACbfENGxnN17LDwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVkay7UfUOTGvsIsJpYUNZIiro524TDifhG+oE0EI/URDUKo8hUMu1Ms2X/6nEZbD
 YOfrMn10gIg9Xvt9mzLk5pPtaFG3kOkjnkH67i/Pd9ZKWJbLfVY5uLlXqiOt3O73M7
 s8uHW71Ln7kba6vBl9ktEBXK/mD1AG0YNh7bezLLSVfATpbp+jTusbsPtTAVzVzcok
 uWLcA+EwRPw8rXg6k1nqXOOGIAOw0PC+wwB1yUmonZ9rmw5azb6i/p4nJ61x3iDQ9v
 LPxO0jFww0wYAac/KyLfc3wYkq1Asj6+mIlW/V5JboVY0fcvUuGkvbSTWA1ENII/lx
 c0wG0wq9iAFnQ==
Date: Fri, 18 Oct 2024 09:55:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 quic_jjohnson@quicinc.com, 
 mcanal@igalia.com, davidgow@google.com, skhan@linuxfoundation.org, 
 karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm/tests: Fix some memory leaks
Message-ID: <20241018-gigantic-meticulous-pug-06ec1b@houat>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u44pcnvp3al5wfxk"
Content-Disposition: inline
In-Reply-To: <20241017063125.3080347-1-ruanjinjie@huawei.com>
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


--u44pcnvp3al5wfxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 17, 2024 at 02:31:21PM GMT, Jinjie Ruan wrote:
> Fix some memory leaks in drm tests.
>=20
> Changes in v3:
> - Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
> - Drop the "helper" in the helper name.
> - s/fllowing/following/
> - Add Acked-by.

This creates build failures since drm_display_mode were const before,
and can't anymore.

Maxime

--u44pcnvp3al5wfxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxIUZQAKCRAnX84Zoj2+
dhnrAXwMx3Wn3MEl5WkrmjldVEV1oIryd15E1vPjm/zDPwt1crTCjmnZq4Gb0RPe
txdNf4YBf06Dsz057RiliLhQvZjpdUSkddlwrvH8GekiAPF1jWk13UVpQuwMdWjV
1Zg+noXCtw==
=yjY3
-----END PGP SIGNATURE-----

--u44pcnvp3al5wfxk--
