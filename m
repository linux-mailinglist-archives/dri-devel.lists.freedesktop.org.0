Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982409B05E4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567610EAF9;
	Fri, 25 Oct 2024 14:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WWuXdZGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B7910EAF9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 14:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA9585C589C;
 Fri, 25 Oct 2024 14:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496C7C4CEC3;
 Fri, 25 Oct 2024 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729866796;
 bh=Fot4mbrkSUk9Tft+x74a5ztFO1CiXvQ02g6A0wq9mEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WWuXdZGFFOP1AJDTXdW4oMpWsVsEbGkK89Z/pqrTeLq43y/1dqrbFmDvG77iM9aUV
 ksQS/OO7jOu1FdZ3NuCvqDR1GXt1PDm/148Zevl3uYBGq/vJ6JF7M6QziW1pEQ9njH
 xFp0W8wqdcDHGCg5LASbwACYOZ5/tktpCAPRMzC50RvmgEZYMKKQ3jeFpDMFbhVlJ0
 aIliNDo1JL+rAygwZHFUidfPSr3QK1dVMp6903N59VdmIGHfwJfEA3J9/DLnDstfux
 j/Yfp4HvdJWW+oVgnNIpVv05KNZZLtZTSF/herTBf0zZAaCIfR1SsPbDVtPSRtOZMB
 2hxoiG6DTns6g==
Date: Fri, 25 Oct 2024 16:33:13 +0200
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
Message-ID: <20241025-bold-light-vicugna-c30ecf@houat>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
 <20241018-gigantic-meticulous-pug-06ec1b@houat>
 <f7519595-8080-44c5-0477-e1281266b80b@huawei.com>
 <80114de7-19c0-d860-c888-35e535915f78@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5ue4enxlgmjc635d"
Content-Disposition: inline
In-Reply-To: <80114de7-19c0-d860-c888-35e535915f78@huawei.com>
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


--5ue4enxlgmjc635d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/4] drm/tests: Fix some memory leaks
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 09:35:59AM +0800, Jinjie Ruan wrote:
>=20
>=20
> On 2024/10/18 16:12, Jinjie Ruan wrote:
> >=20
> >=20
> > On 2024/10/18 15:55, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Thu, Oct 17, 2024 at 02:31:21PM GMT, Jinjie Ruan wrote:
> >>> Fix some memory leaks in drm tests.
> >>>
> >>> Changes in v3:
> >>> - Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
> >>> - Drop the "helper" in the helper name.
> >>> - s/fllowing/following/
> >>> - Add Acked-by.
> >>
> >> This creates build failures since drm_display_mode were const before,
> >> and can't anymore.
> >=20
> > It seems it came from bellowing v1, and this v3 has not reported the
> > issue yet.
> >=20
> > https://lore.kernel.org/all/202410180830.oitxTsOv-lkp@intel.com/
>=20
> Hi, Maxime,
>=20
> Should this series send again? The issue seems not related to this versio=
n.

As far as I know, the issues reported still apply there, so yes

Maxime

--5ue4enxlgmjc635d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxusIQAKCRAnX84Zoj2+
dif2AYCFv3s14Iv+Eh/yGMeO60Js+HXqQ6Z76YpyULOmtFTGRF0Im/XWIbuxI65t
UahKIV4BgMviSMlgiXbldN/GRdHb1VRFwdKek8Bde/JwhZIUOotseWUcti2Ohs6Z
g+JTYIcF+A==
=7kUl
-----END PGP SIGNATURE-----

--5ue4enxlgmjc635d--
