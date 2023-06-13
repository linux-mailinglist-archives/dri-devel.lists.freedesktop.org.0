Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61F772DD56
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 11:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1610E046;
	Tue, 13 Jun 2023 09:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A610E046
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:11:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6334763109;
 Tue, 13 Jun 2023 09:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA14C433EF;
 Tue, 13 Jun 2023 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686647462;
 bh=3x1vQa4C2vZm/aLZjUrKsrmkj7ZCJR2uls+VZCZHrrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nni+VDRcxHMCmL7HaHuIamrAr+jGI5W845fK1XXI/usl+07uT8yr2iucRl71B9dC4
 7CJ04vWx0JZLFRpnZcWiEZ3xhEk3NBJp1jaHE6VeRmf6E858SEuZfimyzYFPg8M0VR
 YfHMlGiyAnsEl2iAzOPKtvDS4ID1z37/dyiIYqkBB3DOEzfWDBsO+dEHCt3104Yei4
 OLANcqsGG52i2UODN0aexcZT9a2/2njvvuk4oqRAMmRRHvlQ3KC1jax5YTcdfPHCZf
 XDvnNJYHVFOV/uxVEUbKL/qDdfwOHY4NsCkwerXxM/t0aBvZV722SDTcm+yRNsTUJ9
 mMyWhc7CZHEQw==
Date: Tue, 13 Jun 2023 11:10:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v14 0/2] drm: add kms driver for loongson display
 controller
Message-ID: <hvfr6qkepf6l3ymqtp6vhlneeqihnli7g5v7nzd6rirwleffk6@4ernj6xng5rt>
References: <20230520105718.325819-1-15330273260@189.cn>
 <d4e647d8-294c-abd7-40c6-37381796203d@loongson.cn>
 <a23d6mgl4fbfa4ucgjvwgw7l3somxo4tkhit7ygy55fldlum56@vm3tyjdsx24l>
 <d2f744b6-e4c9-d1b5-d4ca-470b801c670d@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hpffyxdlrw7g4k3j"
Content-Disposition: inline
In-Reply-To: <d2f744b6-e4c9-d1b5-d4ca-470b801c670d@189.cn>
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
Cc: linaro-mm-sig@lists.linaro.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, loongson-kernel@lists.loongnix.cn,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hpffyxdlrw7g4k3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 04:35:44PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2023/6/13 16:30, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jun 12, 2023 at 10:58:54PM +0800, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> > >=20
> > > Any ideas for this trivial DC driver? Sorry about my broken English.
> > >=20
> > > What to do next? Send a new version?
> > Thomas already told you to merge it in the previous version:
> > https://lore.kernel.org/dri-devel/7b77020f-d543-13bf-e178-bc416bcc728d@=
suse.de/
> >=20
> > So.. do that?
>=20
> Yes, that sound fine.
>=20
> But I can't do it myself, would you like to help?

Why can't you do it yourself?

Maxime

--hpffyxdlrw7g4k3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIgyowAKCRDj7w1vZxhR
xRRuAQCrBuuVG4szTbawSRwgsoNQPfbuzW5fwxdZkFu+rKLDCQD+J6ujT7XS4QIG
mbiB7naiKmWDCd8R0jlmFZzJNw2kDgI=
=nhdu
-----END PGP SIGNATURE-----

--hpffyxdlrw7g4k3j--
