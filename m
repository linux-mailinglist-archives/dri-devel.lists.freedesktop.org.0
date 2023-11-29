Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B6D7FD6CD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9799F10E082;
	Wed, 29 Nov 2023 12:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942BC10E082
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:32:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E718E61AF9;
 Wed, 29 Nov 2023 12:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF37C433C9;
 Wed, 29 Nov 2023 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701261170;
 bh=3rg6InLFJYoj0t56EbSzonGCmEtUIs3+UyoC8G9109k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJlY2rBoX/wUunC8QosbeZWCaearH7/13ya1mqQXLqYSRWaNk6vTPX37FlaTuOvQw
 pJmuZ46UWl8lXat1EEuUg7gYCOJSdxSTEvbZyk8s/mD0FiuGmP0Bor0304jfbMox+M
 BbU7LXd/o7peBNq++BKgkUhipr1dnlmBktw89Ba8mbX2AJqgKTh1udfDED5bjSVao4
 /qD84HoSYXilbTniRywx3EEd2Tz21kPJqDwKgQu9pF47KtIGyGkoV4m+XL9SNfk9a5
 RVn+4Sa+xqJM4IPKiFenquD5EbVP1r9VAMex54H7sCexwXz9sTTmGBxa5/cL1AwEPF
 Q2tzV0QoCberA==
Date: Wed, 29 Nov 2023 13:32:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, daniel@ffwll.ch
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
 <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrzhzqk3x47g4p6g"
Content-Disposition: inline
In-Reply-To: <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 Liu Ying <victor.liu@nxp.com>, gregkh@linuxfoundation.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yrzhzqk3x47g4p6g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Nov 27, 2023 at 11:13:31PM +0100, Linus Walleij wrote:
> On Mon, Nov 27, 2023 at 5:29=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:
>=20
> > > > Liu Ying (2):
> > > >   driver core: Export device_is_dependent() to modules
> > > >   drm/bridge: panel: Check device dependency before managing device=
 link
> > >
> > > I just applied patch 1 directly to the drm-misc-fixes so we don't hav=
e to
> > > revert and then re-apply patches, because that is a bigger evil. (We =
can't
> > > rebase these branches...)
> >
> > Erm, you did wait for GKH or Rafael's ACK to do that, right?
>=20
> No.
>=20
> It is a bigger evil to leave the tree broken than to enforce formal proce=
ss,
> and it is pretty self-evident. If any of them get annoyed about it we can
> revert the patch, or both.

Yeah, I definitely understand why you did it, but I don't think it's
something we would encourage in drm-misc.

We've discussed it with Sima yesterday, and I think we would even need
the extra check in dim to make sure that a committer shouldn't do that
without dim complaining.

Sima played a bit with it, and it should be doable to get something
fairly reliable if you use get_maintainers.pl to retrieve the git tree
(through scripts/get_maintainer.pl --no-email --no-l --scm) and figuring
out if only drm.git, drm-intel.git or drm-misc.git is involved.

If it isn't, then we should check that there's the ack of one of the
maintainers.

Could you write a patch to do so?

Thanks!
Maxime

--yrzhzqk3x47g4p6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcvbwAKCRDj7w1vZxhR
xXfXAQD+NPkwoY0m8+ozRhmrZbtB+qRlugYpDd5BPUriECj8VgEAk7LOfR+2wGYS
hf8XQcHi0BQQjrr2sfXIgq5DKevijgI=
=CWHT
-----END PGP SIGNATURE-----

--yrzhzqk3x47g4p6g--
