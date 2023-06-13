Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FD72DDA4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 11:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B0710E042;
	Tue, 13 Jun 2023 09:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF5B10E042
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:28:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F2B861FD4;
 Tue, 13 Jun 2023 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70438C433D2;
 Tue, 13 Jun 2023 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686648493;
 bh=WrUaJlwPOdtH8Grtb3bcTqhOd6ZRH6ivcqiAJBGA61A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtlBEDlInPiJlEo/p+6W2w8iVMXBB22HyclMjkfcITxusrVvmqDFUEuYUUZPxc1Vm
 DTcPGiAyzmxCRrsp0VnF2bzZx7bUByoo90KmsgR0MkVDkuFefTzWtNIX4g7jTBWkR6
 B4zk5+zqCTaex4SDzxWPGIb8g104LSPq59B/IExiBEERUpPUrX2c4TyBW5PlkMEQjl
 dPo0z3nRcN7+5XcZutQiaHun1uwKML5YrvXObDjUPUTFdJ10Wumn5p7SVMsSoJih9G
 BvDpTvoOe5D2JvLuWFPtka8Nagz1pzfa0SoKOgQ/8qB102ITVqPQvc0Yu4br3/0eIy
 o91t+00olmZkg==
Date: Tue, 13 Jun 2023 11:28:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v14 0/2] drm: add kms driver for loongson display
 controller
Message-ID: <7rbtdidyfpctz22pw2mnt2a6yp34hwp2bdp7usp52ft5mfrfud@nokbyxjip5by>
References: <20230520105718.325819-1-15330273260@189.cn>
 <d4e647d8-294c-abd7-40c6-37381796203d@loongson.cn>
 <a23d6mgl4fbfa4ucgjvwgw7l3somxo4tkhit7ygy55fldlum56@vm3tyjdsx24l>
 <d2f744b6-e4c9-d1b5-d4ca-470b801c670d@189.cn>
 <hvfr6qkepf6l3ymqtp6vhlneeqihnli7g5v7nzd6rirwleffk6@4ernj6xng5rt>
 <42c54caf-0ab9-a075-b641-9e3e21b2a2f3@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="efolnwkilneuxbv7"
Content-Disposition: inline
In-Reply-To: <42c54caf-0ab9-a075-b641-9e3e21b2a2f3@loongson.cn>
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Koenig <christian.koenig@amd.com>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, Nathan Chancellor <nathan@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--efolnwkilneuxbv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 05:17:00PM +0800, Sui Jingfeng wrote:
>=20
> On 2023/6/13 17:10, Maxime Ripard wrote:
> > On Tue, Jun 13, 2023 at 04:35:44PM +0800, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> > > On 2023/6/13 16:30, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, Jun 12, 2023 at 10:58:54PM +0800, Sui Jingfeng wrote:
> > > > > Hi,
> > > > >=20
> > > > >=20
> > > > > Any ideas for this trivial DC driver? Sorry about my broken Engli=
sh.
> > > > >=20
> > > > > What to do next? Send a new version?
> > > > Thomas already told you to merge it in the previous version:
> > > > https://lore.kernel.org/dri-devel/7b77020f-d543-13bf-e178-bc416bcc7=
28d@suse.de/
> > > >=20
> > > > So.. do that?
> > > Yes, that sound fine.
> > >=20
> > > But I can't do it myself, would you like to help?
> > Why can't you do it yourself?
>=20
> I don't have a commit access to the drm-misc,
>=20
> I think, I can get the commit access in a letter time when I good enough,
>=20
> But get the code merged, just merge the latest version is OK.

Look at the link in Thomas mail, it's the documentation on how to get
commit access.

Maxime

--efolnwkilneuxbv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIg2qgAKCRDj7w1vZxhR
xe2oAP4gD4M8YGkmV6iqul3AbWlc89QdI9EkMzUDaxAdh2wwhAD/RciCYKO5vjJ4
wHadgVBEHDBjHiKxJ5t/84BRjU5WewY=
=45xg
-----END PGP SIGNATURE-----

--efolnwkilneuxbv7--
