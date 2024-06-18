Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EB90C4C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107D410E5CF;
	Tue, 18 Jun 2024 08:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gI5uDg89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A210E5C4;
 Tue, 18 Jun 2024 08:13:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EB049CE1011;
 Tue, 18 Jun 2024 08:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E995CC3277B;
 Tue, 18 Jun 2024 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718698430;
 bh=t0kXkFe+Uc+4GyW6huB1OnZkTwf/7K7wQ3TQ7GFxz8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gI5uDg89tWwDrb9mh+iOh94c41ap2tYpemNO3yEoQ2j4LfGyNwWn4v3d0hobbgdIv
 YX+9fmakY/HMJuZK0mO+Yz8BtC6vGEQZqEWztJYNrNCA4mD7/cSSFGMcsqB7Dv7HN4
 vXZpH15jlt23tsVcZflLYr6V/gh7xNSAjYpoumxoceDQXF6/638FBliUuB+0MxqukH
 KuMHaVNnqPXZ+hXDpu0jTN8/SbPFKCzkNLY2aIfsJf1sRRnSHH0MNDIQi4zCwjBO5C
 K45OVEPZD3xxQPjzrMCBnAU4qw9IfVyhti6kWnevfZeuuv6x5X6uFRu2ph6olaECdz
 G+FSvNWPgLiYg==
Date: Tue, 18 Jun 2024 10:13:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Qiang Yu <yuq825@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org, 
 Philip Muller <philm@manjaro.org>,
 Oliver Smith <ollieparanoid@postmarketos.org>, 
 Daniel Smith <danct12@disroot.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
Message-ID: <20240618-great-hissing-skink-b7950e@houat>
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
 <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
 <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vdvduvkbze4vvc46"
Content-Disposition: inline
In-Reply-To: <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
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


--vdvduvkbze4vvc46
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 04:01:26PM GMT, Qiang Yu wrote:
> On Tue, Jun 18, 2024 at 12:33=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrot=
e:
> >
> > I see the problem that initramfs need to build a module dependency chai=
n,
> > but lima does not call any symbol from simpleondemand governor module.
> >
> > softdep module seems to be optional while our dependency is hard one,
> > can we just add MODULE_INFO(depends, _depends), or create a new
> > macro called MODULE_DEPENDS()?
> >
> This doesn't work on my side because depmod generates modules.dep
> by symbol lookup instead of modinfo section. So softdep may be our only
> choice to add module dependency manually. I can accept the softdep
> first, then make PM optional later.

It's still super fragile, and depends on the user not changing the
policy. It should be solved in some other, more robust way.

Maxime

--vdvduvkbze4vvc46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFBugAKCRDj7w1vZxhR
xV4WAQDox5ZaFopBrVQDS59ucBA0YRDGyi9gKRYE808rydy9pAD+LJeN/tR71dDU
hC6/d8te9teLVZ8K4fkmbqxOwOu/HwU=
=uQvC
-----END PGP SIGNATURE-----

--vdvduvkbze4vvc46--
