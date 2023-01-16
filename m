Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400E66B71D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 07:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5670C10E1B4;
	Mon, 16 Jan 2023 06:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575D810E16C;
 Mon, 16 Jan 2023 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673849141; x=1705385141;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3DzfFkJlxyL6+WAZYtHcFZtPqjNL1ubLVlcCB3tZvjw=;
 b=R/cVY+IU6lJklO/4PtJYwQmRV1UO34ybI5J54vSq/Rvim2plgEd0vzVC
 OAQWpZ3/mAorqvIvzI6OyvNjv8LIr4mVptV+91M13MgR2Da9xKMKD2KaF
 6+jp/8JtQaIzIaBVTVXC8cDEKssTZCNOpVtxwRINJ786w3ceC/nJ3N9AF
 ZifuofnJE93uBKtF6DOg5RZogtJC7ZsQjXEIh+zjnmC1Rod1z7fCqG6Yr
 FQQNmvChVKU7AFPU4B39EexveDRTLYR4AkFaAjYpNU8DpVBDEqFjyrEEd
 RdsooJywtxzmZtUeMqXWvMRD8R+xLGjWDrFC9Z3psX2Pv2dfVDJ/267ZQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="324451207"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
 d="asc'?scan'208";a="324451207"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2023 22:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="722185818"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
 d="asc'?scan'208";a="722185818"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jan 2023 22:05:36 -0800
Date: Mon, 16 Jan 2023 13:44:46 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for vgpu_status
 debug attributes
Message-ID: <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="MccZDuc/f2Etrv5V"
Content-Disposition: inline
In-Reply-To: <Y72zVXYLVHXuyK05@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, dri-devel@lists.freedesktop.org,
 Deepak R Varma <drv@mailo.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--MccZDuc/f2Etrv5V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.01.10 13:49:57 -0500, Rodrigo Vivi wrote:
> On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > function adds the overhead of introducing a proxy file operation
> > functions to wrap the original read/write inside file removal protection
> > functions. This adds significant overhead in terms of introducing and
> > managing the proxy factory file operations structure and function
> > wrapping at runtime.
> > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > debugfs_file_put() wrappers to protect the original read and write
> > function calls for the debug attributes. There is no need for any
> > runtime proxy file operations to be managed by the debugfs core.
> > Following coccicheck make command helped identify this change:
> >=20
> > make coccicheck M=3Ddrivers/gpu/drm/i915/ MODE=3Dpatch COCCI=3D./script=
s/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> >=20
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
>=20
> I believe these 2 gvt cases could be done in one patch.
> But anyways,
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> for both patches... and will leave these 2 patches for gvt folks
> to apply. Unless they ack and I apply in the drm-intel along with the oth=
er ones.
>

yeah, they're fine with me, feel free to apply them directly.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

> > ---
> >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/=
gvt/debugfs.c
> > index 03f081c3d9a4..baccbf1761b7 100644
> > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> >  	return 0;
> >  }
> > =20
> > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%l=
lx\n");
> > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%=
llx\n");
> > =20
> >  /**
> >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *=
vgpu)
> >  			    &vgpu_mmio_diff_fops);
> >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgp=
u,
> >  				   &vgpu_scan_nonprivbb_fops);
> > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > -			    &vgpu_status_fops);
> > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > +				   &vgpu_status_fops);
> >  }
> > =20
> >  /**
> > --=20
> > 2.34.1
> >=20
> >=20
> >=20

--MccZDuc/f2Etrv5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY8TkSQAKCRCxBBozTXgY
J3FGAJ4wFe9wnMtxUPhaCOCDkSZhBAzzgQCglj/FAfmvPCFfTpHDMapaW6QFeTY=
=AIVR
-----END PGP SIGNATURE-----

--MccZDuc/f2Etrv5V--
