Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0806E6C0B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1341410E046;
	Tue, 18 Apr 2023 18:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7507C10E046
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 18:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 923B162CC3;
 Tue, 18 Apr 2023 18:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E87C433D2;
 Tue, 18 Apr 2023 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681842306;
 bh=S/6EHOWuc1OCwzBu01MncxoGAJA8FJBP3KrCQHngqO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GQg2kFUFfcu5bOhTS43y7mdyWRs7j5c0oxTqEEubBG1iBKoNlWYJhIqz4cOoeKYAP
 eq95hFYDqApk1TUbjtTnvhSV+VM+U2lSZYDwG1IoyLK9lA8lA9oO17VSms8Us9H65U
 7L+r2zx7OlrLjBuLsTM2Y+xoaBTglkU1oWVaiZVytBn0Vajrp3VxajOH+CAFN6lXf4
 hvJ4Jl0zXscl5PZt2TBtrWPqTBzF8kkJpVLWjx1ZVWFH31eD4HrN42KXt8yxjq//Td
 x7EpEGi/DesNWxv5oDbVasvOya7tpb1EWLH65FPVRiwNggMxAV+ru7Rh5hJAMWoPaP
 FaWX1BnoiIRHg==
Date: Tue, 18 Apr 2023 19:25:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
 <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
 <20230418182145.GA1392657@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KkoPfe6++y+jT109"
Content-Disposition: inline
In-Reply-To: <20230418182145.GA1392657@dev-arch.thelio-3990X>
X-Cookie: Just to have it is enough.
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KkoPfe6++y+jT109
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2023 at 11:21:45AM -0700, Nathan Chancellor wrote:
> On Fri, Apr 14, 2023 at 05:55:10PM +0100, Mark Brown wrote:

> > Done.

> Thanks a lot, sorry for not saying it sooner! It looks like this
> regressed in next-20230417 and next-20230418 though.

Someone sent a mail saying they thought they'd fixed the DRM tree - is
that not the case?

--KkoPfe6++y+jT109
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ+4HsACgkQJNaLcl1U
h9Dolgf9E0lWvdvQD52i+syGYJf2isilo7NBP53wBNSydmOquDJx4/ptdtiLrWOW
BBQ95h285PWT0c+J/2ugnim1/1YTF0DUJcG7JfLYgj9vnGS5BZTtSDGcT3Mccqq5
UF8ljlkOnyJTr2l+XIZlS+9fQUOAJl6omg2RT22llIR2x6TUrYyp8Ua+me7coBwl
auVrJP5m3LANJgsggwZ2W4Iz8cRiBoEiuASuNmPjTHhxQ6j73j+qHOD7rTEAT+c1
WiL8arTNwJNNmq3z4axe+DWdTl0XW0OoHAjpk/bg29YGkGWXITOA0r6OwWcfpRTG
NTa0ZLF2WiCRxaNZK1SCknDkhAaPyQ==
=yab6
-----END PGP SIGNATURE-----

--KkoPfe6++y+jT109--
