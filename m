Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D772DD58
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 11:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B22710E084;
	Tue, 13 Jun 2023 09:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52E410E084
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 09:11:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3545F630F4;
 Tue, 13 Jun 2023 09:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45984C433D2;
 Tue, 13 Jun 2023 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686647486;
 bh=NMjSzXNKLluKLHGJe1lvDUHDWx8rVkp+8Ry49RSqBsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xlxj2Iw8Th0bn9oqhEpqydffv5ympRO/M0SWtCJ8+UMw89dP09pY/p6LWWwVmv/Ma
 Ktf37wYvaPYoOm71JMFYEaHCXjUlKM//55lt/a8vkqm3oF1pQUQDRcS1wu+vZPzpWY
 VL71mlZka/cDJyRIEtWOw6tfdppAy+egNvpIbl1JwUutF+2Fs3UA34CG+wxZiPYNun
 gfCufdzCCs8QhkAaNoxC39QPTPFO+mhPobVaRH9JsZjLW/KvqhMR7z/c8zZsN7pw9/
 /jqZ4PsD4QAkVFx50JpiTTM6gCFguCOQMOtsC3XcDc1yzHeXIEcwZsEpNlUpX1YZvy
 BcbY0IIjOkwzw==
Date: Tue, 13 Jun 2023 11:11:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v14 0/2] drm: add kms driver for loongson display
 controller
Message-ID: <zxnddcy34246wjs7zj2mdynqaets4oo7tqublnufi7yo5ssz7c@u3z76c5m775v>
References: <20230520105718.325819-1-15330273260@189.cn>
 <d4e647d8-294c-abd7-40c6-37381796203d@loongson.cn>
 <a23d6mgl4fbfa4ucgjvwgw7l3somxo4tkhit7ygy55fldlum56@vm3tyjdsx24l>
 <555e160a-0c9d-9145-88f1-a0ecff62240a@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="svayteyeejfe2ndn"
Content-Disposition: inline
In-Reply-To: <555e160a-0c9d-9145-88f1-a0ecff62240a@189.cn>
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


--svayteyeejfe2ndn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 04:40:07PM +0800, Sui Jingfeng wrote:
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
> OK, I also want to merge this.
>=20
> If there are any other problems, We and other contributor will take the
> responsibility to fixed it with a separate patch.
>=20
> It this OK?

Sure, that's pretty much how it works :)

Maxime

--svayteyeejfe2ndn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIgyvAAKCRDj7w1vZxhR
xR1EAP921S7BWqvuVN6l9ckYu3AHlvFzuVpFxxP4kU1R8ng3hQEAtg1EkLHb7jdz
WVeTn6c09kUK0jgN60fL+U+AzWdxKAs=
=A6nC
-----END PGP SIGNATURE-----

--svayteyeejfe2ndn--
