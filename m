Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEA486F0F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 03:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BFA6ECE9;
	Fri,  9 Aug 2019 01:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622A6ECE7;
 Fri,  9 Aug 2019 01:02:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 18:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,363,1559545200"; 
 d="asc'?scan'208";a="258892297"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 08 Aug 2019 18:02:40 -0700
Date: Fri, 9 Aug 2019 08:58:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Message-ID: <20190809005840.GA7032@zhen-hp.sh.intel.com>
References: <20190808103236.GB30506@mwanda>
 <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Xiong Zhang <xiong.y.zhang@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: multipart/mixed; boundary="===============1661766532=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1661766532==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.08 11:44:21 +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2019-08-08 11:32:36)
> > We can't free "workload" until after the printk or it's a use after
> > free.
> >=20
> > Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> That's the simpler patch,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks a lot, will queue this up.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXUzFQAAKCRCxBBozTXgY
J5EAAJkBRaKvljSknayoIbjCoWwSQK+1XgCeKPC2dx9VcLD8Sd9OLXGHqHyWtS8=
=O1aB
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============1661766532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1661766532==--
