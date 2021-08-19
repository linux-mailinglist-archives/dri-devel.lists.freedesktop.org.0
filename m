Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23D3F159A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 10:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D81892A6;
	Thu, 19 Aug 2021 08:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3FE892A6;
 Thu, 19 Aug 2021 08:52:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="280250121"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
 d="asc'?scan'208";a="280250121"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 01:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
 d="asc'?scan'208";a="489211385"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga008.fm.intel.com with ESMTP; 19 Aug 2021 01:52:12 -0700
Date: Thu, 19 Aug 2021 16:29:29 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210819082929.GB13928@zhen-hp.sh.intel.com>
References: <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="K6Vt3zCKtaqyTnPU"
Content-Disposition: inline
In-Reply-To: <20210817052203.GX13928@zhen-hp.sh.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--K6Vt3zCKtaqyTnPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.17 13:22:03 +0800, Zhenyu Wang wrote:
> > On 2021.08.16 19:34:58 +0200, Christoph Hellwig wrote:
> > > Any updates on this?  I'd really hate to miss this merge window.
> >=20
> > I'm still waiting for our validation team's report on this. I'm afraid
> > it might be missing for next version as i915 merge window is mostly
> > till rc5...and for any change outside of gvt, it still needs to be
> > acked by i915 maintainers.
>=20
> Looks our validation team did have problem against recent i915 change.
> If you like to try, we have a gvt-staging branch on
> https://github.com/intel/gvt-linux which is generated against drm-tip
> with gvt changes for testing, currently it's broken.
>=20
> One issue is with i915 export that intel_context_unpin has been
> changed into static inline function. Another is that intel_gvt.c
> should be part of i915 for gvt interface instead of depending on KVMGT
> config.

I'm working on below patch to resolve this. But I met a weird issue in
case when building i915 as module and also kvmgt module, it caused
busy wait on request_module("kvmgt") when boot, it doesn't happen if
building i915 into kernel. I'm not sure what could be the reason?

> But the problem I see is that after moving gvt device model (gvt/*.c
> except kvmgt.c) into kvmgt module, we'll have issue with initial mmio
> state which current gvt relies on, that is in design supposed to get
> initial HW state before i915 driver has taken any operation.  Before
> we can ensure that, I think we may only remove MPT part first but
> still keep gvt device model as part of i915 with config. I'll try to
> split that out.

Sorry I misread the code that as we always request kvmgt module when
gvt init, so it should still apply original method that this isn't a
problem. Our current validation result has shown no regression as well.

---8<---
=46rom 58ff84572f1a0f9d79ca1d7ec0cff5ecbe78d280 Mon Sep 17 00:00:00 2001
=46rom: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Thu, 19 Aug 2021 16:36:33 +0800
Subject: [PATCH] TESTONLY:drm/i915/gvt: potential fix for refactor against
 current tip

---
 drivers/gpu/drm/i915/Makefile           | 4 +++-
 drivers/gpu/drm/i915/gt/intel_context.c | 5 +++++
 drivers/gpu/drm/i915/gt/intel_context.h | 3 ++-
 drivers/gpu/drm/i915/i915_trace.h       | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c4f953837f72..2248574428a1 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -296,7 +296,9 @@ i915-$(CONFIG_DRM_I915_SELFTEST) +=3D \
=20
 # virtual gpu code
 i915-y +=3D i915_vgpu.o
-i915-$(CONFIG_DRM_I915_GVT_KVMGT) +=3D intel_gvt.o
+ifneq ($(CONFIG_DRM_I915_GVT_KVMGT),)
+i915-y +=3D intel_gvt.o
+endif
=20
 kvmgt-y +=3D gvt/kvmgt.o \
 	gvt/gvt.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915=
/gt/intel_context.c
index 745e84c72c90..20e7522fed84 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -328,6 +328,11 @@ void __intel_context_do_unpin(struct intel_context *ce=
, int sub)
 	intel_context_put(ce);
 }
=20
+void intel_context_unpin(struct intel_context *ce)
+{
+	_intel_context_unpin(ce);
+}
+
 static void __intel_context_retire(struct i915_active *active)
 {
 	struct intel_context *ce =3D container_of(active, typeof(*ce), active);
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915=
/gt/intel_context.h
index c41098950746..f942cbf6300a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -131,7 +131,7 @@ static inline void intel_context_sched_disable_unpin(st=
ruct intel_context *ce)
 	__intel_context_do_unpin(ce, 2);
 }
=20
-static inline void intel_context_unpin(struct intel_context *ce)
+static inline void _intel_context_unpin(struct intel_context *ce)
 {
 	if (!ce->ops->sched_disable) {
 		__intel_context_do_unpin(ce, 1);
@@ -150,6 +150,7 @@ static inline void intel_context_unpin(struct intel_con=
text *ce)
 		}
 	}
 }
+void intel_context_unpin(struct intel_context *ce);
=20
 void intel_context_enter_engine(struct intel_context *ce);
 void intel_context_exit_engine(struct intel_context *ce);
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_=
trace.h
index 806ad688274b..2c6a8bcef7c1 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -17,6 +17,7 @@
=20
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM i915
+#undef TRACE_INCLUDE_FILE
 #define TRACE_INCLUDE_FILE i915_trace
=20
 /* watermark/fifo updates */
--=20
2.32.0
---8<---



--K6Vt3zCKtaqyTnPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYR4WYwAKCRCxBBozTXgY
Jz5wAJ0Y4scJuN6eaj1LfxVvM10MGHqLWQCfbKjmCTtsgpFG9klYOK1/9x0p4Nc=
=kW5F
-----END PGP SIGNATURE-----

--K6Vt3zCKtaqyTnPU--
