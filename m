Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7914327749
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 06:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BB96E4E6;
	Mon,  1 Mar 2021 05:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4806E1BD;
 Mon,  1 Mar 2021 05:56:55 +0000 (UTC)
IronPort-SDR: iOACNDwJxB1GPBVmQn0xpIMZcGmzz51jzbwxOTaS2RVpdh/dOi9xSJNCQ20MqBnyWIdYZSXhHp
 81k7jhGm41aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="186481463"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
 d="asc'?scan'208";a="186481463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 21:56:54 -0800
IronPort-SDR: 0e5BwTNgXfL2LVjlSP/ux6lnLjyplCJvL982EGCFNXANgH0XHrezRXu5Gr3rPSWDS9plgShfFW
 9fbpa7OSX2VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
 d="asc'?scan'208";a="435291292"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2021 21:56:16 -0800
Date: Mon, 1 Mar 2021 13:40:00 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drivers: gnu: drm: i915: gvt: Fixed couple of spellings
 in the file gtt.c
Message-ID: <20210301054000.GT1551@zhen-hp.sh.intel.com>
References: <20210222081838.30328-1-unixbhaskar@gmail.com>
 <c4d15313-78a6-a7c8-97c9-8291600f6264@infradead.org>
 <0a95e99c-57c0-cede-f9c7-9d76711596fd@infradead.org>
MIME-Version: 1.0
In-Reply-To: <0a95e99c-57c0-cede-f9c7-9d76711596fd@infradead.org>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1732750772=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1732750772==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.02.22 06:22:37 -0800, Randy Dunlap wrote:
> On 2/22/21 6:21 AM, Randy Dunlap wrote:
> > On 2/22/21 12:18 AM, Bhaskar Chowdhury wrote:
> >>
> >> s/negtive/negative/
> >> s/possilbe/possible/
> >>
> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> >=20
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
>=20
> except the Subject has a typo in it.
> s/gnu/gpu/
>

And pls follow gvt subsys's subject line as drm/i915/gvt: xxx in future.
I'll fix the title and queue this.

Thanks!

> >> ---
> >>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt=
/gtt.c
> >> index 897c007ea96a..dc5834bf4de2 100644
> >> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> >> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> >> @@ -1159,8 +1159,8 @@ static inline void ppgtt_generate_shadow_entry(s=
truct intel_gvt_gtt_entry *se,
> >>   * @vgpu: target vgpu
> >>   * @entry: target pfn's gtt entry
> >>   *
> >> - * Return 1 if 2MB huge gtt shadowing is possilbe, 0 if miscondition,
> >> - * negtive if found err.
> >> + * Return 1 if 2MB huge gtt shadowing is possible, 0 if miscondition,
> >> + * negative if found err.
> >>   */
> >>  static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
> >>  	struct intel_gvt_gtt_entry *entry)
> >> --
> >=20
> >=20
>=20
>=20
> --=20
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYDx+MAAKCRCxBBozTXgY
JxNLAJ9H8QRJ+FiCVfWFQbRijCYqCK83nACdEp+fCWBweP3cPc4NS/o5Bez6KZg=
=qKgC
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--

--===============1732750772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1732750772==--
