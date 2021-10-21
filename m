Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60B43582F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 03:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2180E6EA25;
	Thu, 21 Oct 2021 01:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97CE6EA24;
 Thu, 21 Oct 2021 01:27:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZVFm2b3Rz4xbL;
 Thu, 21 Oct 2021 12:27:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1634779629;
 bh=/P3sXv3gg+XWwVuNNFzsys4NuZ1Yv/74orig70uJzH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o6UOh8UKYL9dHZPIkbY5Goqo8g0WDASq0S9rVYBWjy/R+yUoe8yVCxCCoEsjY4kyH
 6yr3lTwN3LP8Zy924fHKfJUSsROszJ2rCjaQPv2LS7Re0DGPQX7ELnYBnKuOlJU0l9
 cxyqGrYDtaar8WEeaGbO9d513ytVaJ4kXlFvLycWSyUwQxBmOe2PILlM1bfD8eG3Nc
 +ym7tJ/OQzC6vZijFNxGEjPBF2Ygycfh0lINu4JVkLxywqL7fKvfcZtLXE3aiCVX5h
 DAPX2Dhyv/zz0Un78T6V1U4O2mglL+33HHqqP1LldqnwQZr9IJR4YCQ8rofXzKqEW+
 H5zuuiHwlgrag==
Date: Thu, 21 Oct 2021 12:27:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211021122705.2282c49b@canb.auug.org.au>
In-Reply-To: <f9b1b7e6-94ab-50f8-d16c-a3581096687d@amd.com>
References: <20211005185940.382720e7@canb.auug.org.au>
 <f9b1b7e6-94ab-50f8-d16c-a3581096687d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gnfe75AE3eq1OYO7JPRDy2e";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gnfe75AE3eq1OYO7JPRDy2e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Oct 2021 10:23:23 +0200 Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
>
> Am 05.10.21 um 09:59 schrieb Stephen Rothwell:
> >
> > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_=
in' not described in 'dma_buf'
> > include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_=
out' not described in 'dma_buf'
> >
> > Introduced by commit
> >
> >    6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
>
> Thanks for the notice, going to fix this.

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/gnfe75AE3eq1OYO7JPRDy2e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFwwekACgkQAVBC80lX
0GyV5gf/S+g93X5+pnzfg+sMV1u6Z81Eki3YB95pwwcQpaGQFYtBBKi+wrp+NlJg
9Z8HSyE7JDD5Fzv13vC6fEQsufrBn8haG7GNDcI9SVOCtaPMsvtzbtYg3sktR9al
TjISf3cac7B7pqjEmx3DfcUhP2DvD9vMyiHsPd9beJU8PAFW991ChMz0iDEiaOQ9
IGg1SzAUohuIet+IyFhgUd9OKr4dyYUF5TDtXMO+UmRQhnqoGf4h7FOnmc2+GVYO
JeNwoVgPHq1jSH5rXm5SBPWFF7T+8BOmo874yFDaKwMsieiGnylwjuzWkYg/n8i9
fAuXp5RwIGCD9pnvMH9oZ9Z6y76ttA==
=AusU
-----END PGP SIGNATURE-----

--Sig_/gnfe75AE3eq1OYO7JPRDy2e--
