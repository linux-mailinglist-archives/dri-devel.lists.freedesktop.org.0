Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C6CA102
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 17:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096AF6EA16;
	Thu,  3 Oct 2019 15:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215246EA14
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 15:15:58 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78C542133F;
 Thu,  3 Oct 2019 15:15:57 +0000 (UTC)
Date: Thu, 3 Oct 2019 17:15:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
Message-ID: <20191003151555.64qabct3jmd74ypi@gilmour>
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
 <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
 <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570115758;
 bh=TYOnIuRjzhdf6d/+AussWQ/jrj8Mub0Q/qfG0zOFxO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9Bv8u+dZ3vkxt9uu7BIYGOCnTaR8sUQzSd2GMf//E/hio6zBr/ZX3/1uNSKXwmwC
 He33ej1ByT54C6yQ0ToG1Dv7oO7FsaLJ8XSqG2Rygxs6e8hX08T58RwyUpstqrfuPQ
 n+HknfP9I6Vj4Kwin0VcsSvZ2UWnfgIdax1nR+No=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0313282980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0313282980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7wxihfagc5o75k2e"
Content-Disposition: inline


--7wxihfagc5o75k2e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 03, 2019 at 04:39:39PM +0200, Linus Walleij wrote:
> On Thu, Oct 3, 2019 at 4:34 PM Linus Walleij <linus.walleij@linaro.org> w=
rote:
> > On Wed, Oct 2, 2019 at 5:39 PM Jonathan Neusch=E4fer
> > <j.neuschaefer@gmx.net> wrote:
> >
> > > The :doc: reference did not match the DOC comment's name.
> > >
> > > Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> > > Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
> >
> > Both patches applied!
>
> ...but I can't push the changes:
>
> $ dim push-branch drm-misc-next
> dim: 9fa1f9734e40 ("Revert "drm/sun4i: dsi: Change the start delay
> calculation""): committer Signed-off-by missing.
> dim: ERROR: issues in commits detected, aborting
>
> Not even my commit, apart from that it looks like it does have
> the committer Signed-off-by. I'm confused and don't know what
> to do... anyone has some hints?

Yeah, it's pretty weird, I just pushed without any trouble.

Did you rebase or something?

Maxime

--7wxihfagc5o75k2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZYQqwAKCRDj7w1vZxhR
xfd6AQD/zc6r1v0NTQoKgRKELqgow/1Hm8wGjF422mloLB4VLQEAyokgh0l6DFKA
QgASZMRMHm9asS0gq4v//8nwRHxrUAc=
=ahDz
-----END PGP SIGNATURE-----

--7wxihfagc5o75k2e--

--===============0313282980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0313282980==--
