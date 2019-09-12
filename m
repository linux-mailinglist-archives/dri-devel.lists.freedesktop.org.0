Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C43B0DD7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 13:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8796ECCE;
	Thu, 12 Sep 2019 11:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FA56ECCE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 11:32:02 +0000 (UTC)
Received: from 195-23-252-136.net.novis.pt ([195.23.252.136]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i8NKR-0006cF-1e; Thu, 12 Sep 2019 11:31:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6250CD0046D; Thu, 12 Sep 2019 12:31:58 +0100 (BST)
Date: Thu, 12 Sep 2019 12:31:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Use generic code for devfreq
Message-ID: <20190912113158.GM2036@sirena.org.uk>
References: <20190912112804.10104-1-steven.price@arm.com>
 <20190912112804.10104-2-steven.price@arm.com>
MIME-Version: 1.0
In-Reply-To: <20190912112804.10104-2-steven.price@arm.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hax8S8P5CnNLhHFnRUK2Qi7PYJyXGpWmegiJgrXYQGs=; b=n318wRq5Qe2aiE5vsduwGZsa4
 UZAQm1NPZ4eUcCeAj/yqddmGocdXajU+gStAS7FRRKbLNV0MJJ8qlvK7omIFhWrE7vwzU8lIzg8sT
 WTUYHK3H+QHn6gn0T/mmzwKND9dsMu9UlhwWrRYSBHcLXL7PViurmqQpNO48uvp7a3id8=;
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: multipart/mixed; boundary="===============0158942219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0158942219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M9YpAf2t6OxtMGzg"
Content-Disposition: inline


--M9YpAf2t6OxtMGzg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2019 at 12:28:03PM +0100, Steven Price wrote:
> Use dev_pm_opp_set_rate() instead of open coding the devfreq
> integration, simplifying the code.

Reviewed-by: Mark Brown <broonie@kernel.org>

--M9YpAf2t6OxtMGzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl16LK0ACgkQJNaLcl1U
h9C7GAf/UGcKiroXHB6Xwu6c+wguKxFe/pZn9YGxbP3rwdlfRXtcfdis0NRxZadm
z/iFjpjb38DFwwZfPycG27ebaREs5TQGA5adin1rHrgCLmgxj7PIWXSMOA+cLWiB
wy9Wx8wwQRPU39FCLnY2iLMnCSedJONOXSjTVzt7D8goCt99je2N97D0wxmw46lc
nW31A/3bHJbxEfWOe2YT0UFj/HSvdkR8Mu7dFwdWUHDHFrfuxMsukFmBCvh/BW12
M1+C8KF7nnvVZjYbwgGbsPaiwP+MyEeH6v8TEUOJ8ThGKr3zf2kKFp57gWMVwt+p
kRiXFavXN51n+vAwTZ6XoiBk2RdDoA==
=LFv8
-----END PGP SIGNATURE-----

--M9YpAf2t6OxtMGzg--

--===============0158942219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0158942219==--
