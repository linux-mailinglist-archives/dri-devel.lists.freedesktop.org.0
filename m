Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929F1A4255
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 07:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0ED6EC65;
	Fri, 10 Apr 2020 05:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040956EC63;
 Fri, 10 Apr 2020 05:54:45 +0000 (UTC)
IronPort-SDR: 8H9+uRgCCsJHo7mOCEL4BPmTcXeWMeopOr/iTUtks0EiXtAFhePmRLhgo9N280CxA/zywnaf7Y
 fXIi5xlXa0Yw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 22:54:44 -0700
IronPort-SDR: neQ7V9BrtVs+lpG9al2irFFnbVHHjZ/ITmulTc10fSr/Ts1diyctt1UOZJ8ozUdvILKsu1W89J
 v9yq1WSKecDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,364,1580803200"; 
 d="asc'?scan'208";a="255386528"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 22:54:41 -0700
Date: Fri, 10 Apr 2020 13:41:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915: remove gvt/Makefile
Message-ID: <20200410054108.GK11247@zhen-hp.sh.intel.com>
References: <20200409150627.29205-1-masahiroy@kernel.org>
 <20200409150627.29205-2-masahiroy@kernel.org>
 <87h7xsgw3r.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87h7xsgw3r.fsf@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1354212128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1354212128==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.10 00:58:16 +0300, Jani Nikula wrote:
> On Fri, 10 Apr 2020, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Including subdirectory Makefile from the driver main Makefile does not
> > buy us much because this is not real isolation.
>=20
> The isolation it does buy us is that gvt/ subdirectory is developed and
> maintained on a separate mailing list and separate git repo. I think at
> some point there were plans to make it an actual module too.
>=20
> So while you could quip about Conway's law here, I think it might be
> better to keep this as it is.
>=20
> Zhenyu, Zhi, what do you think?

Yeah, I have the same feeling, maybe we can add some comment in gvt Makefile
to state that point.

Thanks

> >
> > Having a single Makefile at the top of the module is clearer, and
> > it is what this driver almost does.
> >
> > Move all gvt objects to the i915 main Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/gpu/drm/i915/Makefile     | 28 ++++++++++++++++++++++++----
> >  drivers/gpu/drm/i915/gvt/Makefile |  8 --------
> >  2 files changed, 24 insertions(+), 12 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makef=
ile
> > index 6cd1f6253814..74e965882a98 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -275,10 +275,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) +=3D \
> >  # virtual gpu code
> >  i915-y +=3D i915_vgpu.o
> > =20
> > -ifeq ($(CONFIG_DRM_I915_GVT),y)
> > -i915-y +=3D intel_gvt.o
> > -include $(src)/gvt/Makefile
> > -endif
> > +i915-$(CONFIG_DRM_I915_GVT) +=3D \
> > +	intel_gvt.o \
> > +	gvt/gvt.o \
> > +	gvt/aperture_gm.o \
> > +	gvt/handlers.o \
> > +	gvt/vgpu.o \
> > +	gvt/trace_points.o \
> > +	gvt/firmware.o \
> > +	gvt/interrupt.o \
> > +	gvt/gtt.o \
> > +	gvt/cfg_space.o \
> > +	gvt/opregion.o \
> > +	gvt/mmio.o \
> > +	gvt/display.o \
> > +	gvt/edid.o \
> > +	gvt/execlist.o \
> > +	gvt/scheduler.o \
> > +	gvt/sched_policy.o \
> > +	gvt/mmio_context.o \
> > +	gvt/cmd_parser.o \
> > +	gvt/debugfs.o \
> > +	gvt/fb_decoder.o \
> > +	gvt/dmabuf.o \
> > +	gvt/page_track.o
> > =20
> >  obj-$(CONFIG_DRM_I915) +=3D i915.o
> >  obj-$(CONFIG_DRM_I915_GVT_KVMGT) +=3D gvt/kvmgt.o
> > diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/g=
vt/Makefile
> > deleted file mode 100644
> > index 4d70f4689479..000000000000
> > --- a/drivers/gpu/drm/i915/gvt/Makefile
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -# SPDX-License-Identifier: GPL-2.0
> > -GVT_DIR :=3D gvt
> > -GVT_SOURCE :=3D gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o f=
irmware.o \
> > -	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> > -	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o deb=
ugfs.o \
> > -	fb_decoder.o dmabuf.o page_track.o
> > -
> > -i915-y					+=3D $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXpAG9AAKCRCxBBozTXgY
J5rLAJ45nWTbStFQsqc5yvlIr+XX8Ig8YACdFQ67J8jqCGmeYx/Y196ZAH2skGM=
=Zhzu
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--

--===============1354212128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1354212128==--
