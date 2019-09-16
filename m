Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99EBB4402
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3DE6EA9F;
	Mon, 16 Sep 2019 22:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0246EA9D;
 Mon, 16 Sep 2019 22:32:02 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9zXF-0005vZ-9X; Mon, 16 Sep 2019 22:31:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 813572741A12; Mon, 16 Sep 2019 23:31:52 +0100 (BST)
Date: Mon, 16 Sep 2019 23:31:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] drm/amd/display: Fix compile error due to 'endif' missing
Message-ID: <20190916223152.GO4352@sirena.co.uk>
References: <20190916044651.GA72121@LGEARND20B15>
 <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNARZMr5ZKGufi63GZrZ45k60faAiXr4mBB_mU9h_QifjxQ@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msLh9WbxBA7EbuXEsQM1F8/XWc+BFLvXBH9jc3Uggd8=; b=VMCIikLP6xHgM6dCFwKl27qn8
 YLLMuBCGHFk9swkyMK8zSODwb1q9D8ICqjyXcVs4Jy1XBKsDoHliZbNaUz+v8tdyg2559+9xS72OF
 tGyVs6Y0c4ValEGmSU4hWUzrC2bAbhslN2DJMDJDvIBKfJTuzTlcvXhHJaMRzh9YRLgJo=;
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 Austin Kim <austindh.kim@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1285980555=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1285980555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dBmMfAlnUmK8h9+K"
Content-Disposition: inline


--dBmMfAlnUmK8h9+K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2019 at 02:46:48AM +0900, Masahiro Yamada wrote:
> On Mon, Sep 16, 2019 at 1:46 PM Austin Kim <austindh.kim@gmail.com> wrote:

> > gcc throws compile error with below message:

> GNU Make throws ...

Xinpeng Liu via Nick Desaulniers sent a description of the problem and a
patch so I think I'll be able to fix this.  However...

> This is probably a merge mistake in linux-next.

> If so, this should be directly fixed in the linux-next.

> If it is not fixed in time,
> please inform Linus to *not* follow the linux-next.

...as I said before I think you definitely need to coordinate with the
DRM people - Nick Desaulniers' patch 0f0727d971f6f (drm/amd/display:
readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
routines) breaks in places that don't have merge conflicts due to this
change.  I wouldn't rely on the merge going well if things are sent
as-is, the only reason this one showed up was that other people were
adding new files to the Makefile.

I've CCed Nick.

--dBmMfAlnUmK8h9+K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ADVcACgkQJNaLcl1U
h9CpTAf/WVlKZHB2Ctr3ilkr7vpfMjEg59XRGkehdnNZnbqDxT4ydz27T7yuIHCw
mtoSmDyKi0sUOxW3Jj09CRuMhmbu56hfaNodbB6Mf2fj7InHXHbJ+32kxgHg5wlS
QIPMHLqU9w7wvidN6Ry6d6sinfokqcaiZVbmp0Q7sGcEb4CpVUGK64zuS2thwjSO
7WdhJ55MC6yV2co4FYS8yp0hSFeSnudaMG1/n7yniVUKpRkCF/F0r+XdS0i/kfrf
uE7cqXSfgk/DqnwscbZwuiFo0QcPuUfAuc7nJRrJkIXxQjAacepligIXioedCkQ1
PK7Hsf/bRVBAE+piKlcp1DJe6TcPaw==
=valx
-----END PGP SIGNATURE-----

--dBmMfAlnUmK8h9+K--

--===============1285980555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1285980555==--
