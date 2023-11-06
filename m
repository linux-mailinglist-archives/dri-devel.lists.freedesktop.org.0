Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62577E1D71
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 10:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D7010E297;
	Mon,  6 Nov 2023 09:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CED10E2AB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 09:49:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8021FB80D87;
 Mon,  6 Nov 2023 09:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8104CC433C7;
 Mon,  6 Nov 2023 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699264187;
 bh=cLEcDzMmgDnltoPawbkaC3ZhhEclzqWc/rDLbtNRidk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k4ij/9DqNG/7ToGNHmtvrWqSZVIWCySxJnhGyg+oJuK6+f/o64GjnJzwAWmUh3oRG
 70WFGaLFL467Yk4syzM1CFUZGybsq8ndEZ6dgxX03KTKWO+cx2gDMay/ajRwQQNj0L
 SLdcaUCjheNPxbsORPMxeMeeHvPvnv08xVMIR9sqsWUuwo7EU22o6dTyvcjFEvqmAJ
 DL8P34TaHdIuI9mogMoQyoCYRZzGxA7PzdihwZtFUsR4mdxaWwrNZ6FZyTUNrpW3lk
 sTDR0kgM/IsFjacXR6ye04wVVy6oPZr2t+ujXER9n1c1FuGWF9YKgtXiTlktnQxEq3
 aZ8S2t14Z/jWA==
Date: Mon, 6 Nov 2023 10:49:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/qxl: prevent memory leak
Message-ID: <4k4x5grw7tjgzvwlyxxnqt67cfxfggwc4iimrz5hrcond2fhug@phbquwgukj3g>
References: <20230322085847.3385930-1-zhouzongmin@kylinos.cn>
 <CAPM=9ty9h1_XS47tbFHVppnWQJkGntQwv0Zc0YUZmAQODh5MGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d62lmak56tv325sk"
Content-Disposition: inline
In-Reply-To: <CAPM=9ty9h1_XS47tbFHVppnWQJkGntQwv0Zc0YUZmAQODh5MGA@mail.gmail.com>
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
Cc: Zongmin Zhou <zhouzongmin@kylinos.cn>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d62lmak56tv325sk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 01, 2023 at 12:58:17PM +1000, Dave Airlie wrote:
> On Wed, 22 Mar 2023 at 19:04, Zongmin Zhou <zhouzongmin@kylinos.cn> wrote:
> >
> > The allocated memory for qdev->dumb_heads should be released
> > in qxl_destroy_monitors_object before qxl suspend.
> > otherwise,qxl_create_monitors_object will be called to
> > reallocate memory for qdev->dumb_heads after qxl resume,
> > it will cause memory leak.
> >
> > Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
>=20
> Sorry for nobody picking up on this, qxl isn't really well staffed,
>=20
> Reviewed-by: Dave Airlie <airlied@redhat.com>
>=20
> Could one of the misc maintainers pick this up?

I just applied it to drm-misc-fixes

Maxime

--d62lmak56tv325sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUi2uQAKCRDj7w1vZxhR
xZwpAP4wB1EObpvrvp0YUf5+Zb1A2zjV23dwrTfdPsMX0a+ZMwEAlj6kdHNmw8/9
62kfqknPesHGZISVKFGVC47uVtb6Hg8=
=fv0T
-----END PGP SIGNATURE-----

--d62lmak56tv325sk--
