Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA2A74FBC2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987E10E45F;
	Tue, 11 Jul 2023 23:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ED310E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689117311;
 bh=7EmUJJ6QfZLss1Mdil6Tl1TauaGf33Y1rfrV6vxUPBE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UvnJwTuI3h/QlAFkTp8bQ2Hql99MYdnBoRc0BvYDEpWl87Iq8C1HKS/UwYACElsbJ
 KPMbc4C5GWbv4MBoWebkvJdOoL7fwY/K8CcPjK+TO7OsUMmlDTqMFAeqKnXqX6Kg6S
 bgO8l09adxvtFtazRSRgxcyMWQNWytH9XLBXJLaEwiKGsGSVmMIaLEcMKIyg9UDKzz
 Bm2TezlRQXA5ZTZLrKV1n9WHcmbyKaJ4AqFAWGGt9QdfVWPrZx0rqxSzVJWYDD/bda
 W5ZNzWh8ciLOPkKjmrycatLV6lOuYQn7uUBY8dBL/0bAQay7Ii9Ly2xhEs98OQNR3j
 yRXKScCNozO7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R0xYC0Bhyz4wxx;
 Wed, 12 Jul 2023 09:15:10 +1000 (AEST)
Date: Wed, 12 Jul 2023 09:15:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20230712091509.4f6f7a19@canb.auug.org.au>
In-Reply-To: <20221118175545.762d1a20@canb.auug.org.au>
References: <20221118175545.762d1a20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zAyimXdKaV=bjBL.tJPRxxH";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zAyimXdKaV=bjBL.tJPRxxH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Nov 2022 17:55:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dispclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'actual_dispclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dppclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'actual_dppclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'disp_dpp_voltage_level_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dcfclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'socclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dcfclk_deep_sleep_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'fclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'phyclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dramclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'p_state_change_support' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'zstate_support' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dtbclk_en' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'ref_dtbclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'fclk_p_state_change_support' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'pwr_state' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'prev_p_state_change_support' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'fclk_prev_p_state_change_support' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'num_ways' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'fw_based_mclk_switching' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'fw_based_mclk_switching_shut_down' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'prev_num_ways' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'dtm_level' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'max_supported_dppclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'max_supported_dispclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'bw_dppclk_khz' not described in 'dc_clocks'
> drivers/gpu/drm/amd/display/dc/dc.h:548: warning: Function parameter or m=
ember 'bw_dispclk_khz' not described in 'dc_clocks'
>=20
> Introduced by commit
>=20
>   1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
>=20
> (now also in the drm tree) but revealed by commit
>=20
>   ef8d147fd442 ("drm/amd/display: fix kernel-doc issues in dc.h")

I am still getting these warnings (presumably now from Linus' tree).
The line number has changed to 558.

--=20
Cheers,
Stephen Rothwell

--Sig_/zAyimXdKaV=bjBL.tJPRxxH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSt4n0ACgkQAVBC80lX
0GzS9Af/fAr8505kTtFwrbfX+7ec/rLvR1chBIYqGHRZqa/2hEcbijpl4MOsjcaK
zlppGaWDGpk0h6ZTyZaOEvS/YgFIRQ40kbUv12itx8kMdS8X+0X18rFomdk2e39Z
w9yD1bCtR0T9Q7c62SH7gTmFSUJI4Noz51rXVQrQgcZmDJ6PPaFKOlLq7+qFj4r7
vn1eZZtP0Dbk2ChHAwQhAbyKIHg7lmHb3H1+mfZVP4dW8m5T+alyLtWp7KziP1+n
mw0jLvu6bHdA5ckuCaaNl8RErbsQr5AhQLcGwFvvhWsIvxK2RA/+5RTCee/xNRUC
faGQux7ZYJq52naCkG/pQ9i3FJBL4g==
=me1t
-----END PGP SIGNATURE-----

--Sig_/zAyimXdKaV=bjBL.tJPRxxH--
