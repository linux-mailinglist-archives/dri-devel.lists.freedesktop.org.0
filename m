Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A194A9B43F2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295E10E5CC;
	Tue, 29 Oct 2024 08:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W79BwF2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EB910E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:15:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63911A41848;
 Tue, 29 Oct 2024 08:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB81C4CECD;
 Tue, 29 Oct 2024 08:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730189734;
 bh=Re+MDXtcVE8bjwH91xYXXaAonR+wVRYRG/DIzrjk0b0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W79BwF2zUWa8O5pH1qu/q+K7UkCg1cL4w25XMvvGaJWFBCDXzc23uJ53wi7d4+Vhi
 bOdQsAIoa/ML4A//LzLch7KsVXpnC70XO26Pm1NbFaLUmNBHm9bkPQiFv6AmOEQIfX
 fmMMGnN+eyDUvDEeJzJg1EUsoexxqSCuK7zv1tQn+vgYbh4jiRix310uvLyE5LsCd7
 eMNgF5l/27ZlohWnTJphlEU7vwdvLePECnw+b3CbVE1MXn9PosSji1rDyhBryUjukK
 2AYuOghKKyLnGvUkdSpUsUtAN+4QWjLYWyOHt8uskj0ORYO6BkKysE8rKzMH5MaWFE
 412fPjiPImGSw==
Date: Tue, 29 Oct 2024 09:15:31 +0100
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
Message-ID: <20241029-heavy-scallop-of-jest-1fcfd4@houat>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
 <20241018-gigantic-meticulous-pug-06ec1b@houat>
 <f7519595-8080-44c5-0477-e1281266b80b@huawei.com>
 <80114de7-19c0-d860-c888-35e535915f78@huawei.com>
 <20241025-bold-light-vicugna-c30ecf@houat>
 <fb6c6e6d-18ad-344d-c8ad-a9b90c6c2f28@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ddtzjmtot4x35duc"
Content-Disposition: inline
In-Reply-To: <fb6c6e6d-18ad-344d-c8ad-a9b90c6c2f28@huawei.com>
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


--ddtzjmtot4x35duc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/4] drm/tests: Fix some memory leaks
MIME-Version: 1.0

On Sat, Oct 26, 2024 at 10:02:51AM +0800, Jinjie Ruan wrote:
>=20
>=20
> On 2024/10/25 22:33, Maxime Ripard wrote:
> > On Wed, Oct 23, 2024 at 09:35:59AM +0800, Jinjie Ruan wrote:
> >>
> >>
> >> On 2024/10/18 16:12, Jinjie Ruan wrote:
> >>>
> >>>
> >>> On 2024/10/18 15:55, Maxime Ripard wrote:
> >>>> Hi,
> >>>>
> >>>> On Thu, Oct 17, 2024 at 02:31:21PM GMT, Jinjie Ruan wrote:
> >>>>> Fix some memory leaks in drm tests.
> >>>>>
> >>>>> Changes in v3:
> >>>>> - Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
> >>>>> - Drop the "helper" in the helper name.
> >>>>> - s/fllowing/following/
> >>>>> - Add Acked-by.
> >>>>
> >>>> This creates build failures since drm_display_mode were const before,
> >>>> and can't anymore.
> >>>
> >>> It seems it came from bellowing v1, and this v3 has not reported the
> >>> issue yet.
> >>>
> >>> https://lore.kernel.org/all/202410180830.oitxTsOv-lkp@intel.com/
> >>
> >> Hi, Maxime,
> >>
> >> Should this series send again? The issue seems not related to this ver=
sion.
> >=20
> > As far as I know, the issues reported still apply there, so yes
>
> I make this version code with "C=3D2", there is no these build failures.

Sorry, you're right. I still have a comment on the first patch

Maxime

--ddtzjmtot4x35duc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyCZngAKCRAnX84Zoj2+
dq32AYCl7QmrfN3pfj027QXZ8TGQ+8c8LyDuRgYyH8YTib+XzneLzB4O7/yMzsQC
6vZy91oBgIRpmNU1EOPfVKJjjgqZnAu0Gze+3rUqf0oN+HYU3T3WBoH/l52/9KsM
9psGrWsF7A==
=5jYc
-----END PGP SIGNATURE-----

--ddtzjmtot4x35duc--
