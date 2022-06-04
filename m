Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BEC53D41A
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 02:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC32A11253E;
	Sat,  4 Jun 2022 00:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1D0112570
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jun 2022 00:38:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LFLSl07YHz4xXF;
 Sat,  4 Jun 2022 10:37:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1654303081;
 bh=tbCrXUpHfvEvlqq1o1SG9c0DMviyBQ3CvzOvpIIJroA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o2aebxC5KKbEl3eRFLExapin+TqKAQ6gVn0z+BIcp3vyBgXvkre0izG23ktawWal2
 UxShhH1J0CmoEJUPVOoAvAAQzYJA+jGiqyB1AgWm5LXAkECy33ImX2N3qeY/8d+Gnk
 0oGbRvzy1Mdlpfzemo9f11lDEbFZPjaQdZIlAV018iQp6OZfvuxvQMTolxZ/mMRl9b
 dxZe+BENNPHaKoRgbVs+8HYcDQxMdYMnIOChYzjU+oBdv5xRYNpukvhVc1oL1msPKK
 XYwvm5wty3Mne6Pnvz90wMgrdfbVybmeoGKl3BUXMllG1z/T/lKVZ7lpdvRot01GNN
 8//t1keP9y75g==
Date: Sat, 4 Jun 2022 10:37:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm tree
Message-ID: <20220604103757.29d0b048@canb.auug.org.au>
In-Reply-To: <CAF6AEGtYS1LYowjf-OiN-C1+4JFTWwOOpP__4iDLo-dFy0t0Tg@mail.gmail.com>
References: <20220603151600.19cfa617@canb.auug.org.au>
 <CAF6AEGtYS1LYowjf-OiN-C1+4JFTWwOOpP__4iDLo-dFy0t0Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e_YH8od_GObSxcrR9wOXMw+";
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
Cc: Rob Clark <robdclark@chromium.org>, Haowen Bai <baihaowen@meizu.com>,
 Dave Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/e_YH8od_GObSxcrR9wOXMw+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 3 Jun 2022 07:58:14 -0700 Rob Clark <robdclark@gmail.com> wrote:
>
> will the truncated subject confuse the scripts that look for patches
> to backport to stable, ie. do we *really* have to rewrite history to
> fix this?

I don't know what scripts are being used and what they expect, but our
documentation says (Documentation/process/submitting-patches.rst):

  If your patch fixes a bug in a specific commit, e.g. you found an issue u=
sing
  ``git bisect``, please use the 'Fixes:' tag with the first 12 characters =
of
  the SHA-1 ID, and the one line summary.  Do not split the tag across mult=
iple
  lines, tags are exempt from the "wrap at 75 columns" rule in order to sim=
plify
  parsing scripts.

But, that being said, doing the rewrite is up to the maintainer.  You
could just look at this as a learning experience and do better in the
future.

BTW, my script reacted to the missing closing quotes and parentheses,
which is more like to confuse any scripts that the actual truncation.
--=20
Cheers,
Stephen Rothwell

--Sig_/e_YH8od_GObSxcrR9wOXMw+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKaqWUACgkQAVBC80lX
0Gw5mAf/TwvrqpX9h9B2646RLernspdTcY3nPmjQD/BqjNYThjAPEBDx3+3ICluT
xTeWaSdhKu4B9HBu889ZKRXYLUcllNsaCE3rmIeXZFgZyEZzDKrTGznJ0LKGMRf0
GdH2pWQon6W49mXV5Lq2BRsEegUV7lDrZ2GhsdvgbRqXQyU/QxcVDIafE5xXVAIH
ogLV03FBWzD1nCiJPYa0P//J6R4fImN61nYR3w/c3kXuhHmbcmiNelgoeZnwwifO
Ucj3gGhn6ihl7WsGGmF/oa5agoN3XvAhTBjFTX9HFbZtJQJOpUUboWKAA6th+O2N
0a5Z1svKJBQhTiiFCxHplUmtWA6ttg==
=AZ0f
-----END PGP SIGNATURE-----

--Sig_/e_YH8od_GObSxcrR9wOXMw+--
