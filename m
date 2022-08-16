Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5259661C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 01:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E1810E02A;
	Tue, 16 Aug 2022 23:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5210E231;
 Tue, 16 Aug 2022 23:43:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M6nlj6wFGz4x1d;
 Wed, 17 Aug 2022 09:43:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1660693411;
 bh=1joVLRurNjXqvg91Uhg67IK/Pr4u5RtG/v1PA3c93Nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hSmcAHHclccdST7TTvOZDeh5DnAFk4PSL6ssZo976eYBRkSoJvWDe9YhnE7xwODDe
 kwKguHM4lc1Y22bAp85OVKHixFkKO56NGqux8Bbsyqu2TgJEyMIebOhStlH/qVXtV6
 sTnFAwwRS7ID52mTxzBMXi/FV09o/TyXt2PMZxVTdU6aa2VIfhEmG+T/QpExPq0lkL
 WFQK5VlsSWbt4KJL8XjQ+ar93fktGIti2EN1fBncNbLPYv3U3E8MEoS5v0zlNh1ZdI
 VWhdb2gAEbmF1aPDSwoxk4d831l+oJW1CcEBIMMWhTW056yRM2A3DbJwJql3q2/GcV
 2BFya4V3NwDjQ==
Date: Wed, 17 Aug 2022 09:43:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexander.deucher@amd.com>, "Sudip Mukherjee (Codethink)"
 <sudipm.mukherjee@gmail.com>
Subject: Re: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
Message-ID: <20220817094309.140c346e@canb.auug.org.au>
In-Reply-To: <20220812090731.31da7d85@oak.ozlabs.ibm.com>
References: <YvU4GD8HtZ1A4dhI@debian>
 <20220812090731.31da7d85@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lf4Tp9XrPgg1rBwr5oUcjJR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 linux-next@vger.kernel.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Lf4Tp9XrPgg1rBwr5oUcjJR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Aug 2022 09:07:31 +1000 Stephen Rothwell <sfr@rothwell.id.au> wr=
ote:
>
> On Thu, 11 Aug 2022 18:10:48 +0100 "Sudip Mukherjee (Codethink)" <sudipm.=
mukherjee@gmail.com> wrote:
> >
> > Not sure if it has been reported, builds of riscv, alpha, s390, arm,
> > arm64, xtensa, mips, csky allmodconfig have failed to build next-202208=
11
> > with the error:
> >=20
> > ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/a=
mdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amd=
gpu/amdgpu.ko] undefined!
> >=20
> > git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass=
-through during mode validation")
> > And, reverting that commit has fixed the build failure.
> >=20
> > I will be happy to test any patch or provide any extra log if needed. =
=20
>=20
> I have reverted that commit in today's linux-next.

I have removed that revert.  Sudip, can you recheck when linux-next is
released, please?

--=20
Cheers,
Stephen Rothwell

--Sig_/Lf4Tp9XrPgg1rBwr5oUcjJR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmL8K44ACgkQAVBC80lX
0GzweQf/YqwUSCDESrTqpmvAAQqipA2BEXb9Zkb2sI5+rD2TDLlBxZfHitvws/1/
RLwL+a/qvXJf86/BISMIUcnKdpJlnWZ+bQ1HOI/u6Qn5Zuxu9SBEk5qk7ET9sgeY
iPXkIFfm7NoD5EHoNkw3DAJMivjYdXlGvuuz4WTNMR0XdwObY7NKqSstf4xcNCFr
Gy7ooodIH75XqQg+07vyv+cBFcMd9bvscIhWaaovpWFWwuNkBu5U4U9Fms/1er6T
GEJFp/V9vllFTQQWmjEpo1lDB9fzdZ1RVkHltTuhY1BibsW+5ULutPjEUr8r1t5K
73jFph69ddwCVxt22n5Dvjabl1V0/w==
=KI4/
-----END PGP SIGNATURE-----

--Sig_/Lf4Tp9XrPgg1rBwr5oUcjJR--
