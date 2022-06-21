Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E540552ADD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 08:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E21510F06F;
	Tue, 21 Jun 2022 06:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E710F06F;
 Tue, 21 Jun 2022 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655792041; x=1687328041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ToHiA7hoTB29A58OclPgT0TmnnaYSDq2jH4pmMIexUI=;
 b=N1OKIPSFX7KiKDOnz8/RMFTUyXclSLYB1eixnpAT7irtx8bokwRSckjm
 D8BZ28f69idiAH1YgNvB0YqGu4so/lCemCGliZBCfP633sJCvCj1QJd/q
 fTrrd+mOw8ZDtOAEZ6+R3Y+FSiljvfIiKCWgn4OXWecbAYX1W3qUH6aAi
 Pe5DSc+mQtU7z4AJG1hHxj4T0tCrNORQAx6SIoYVFmI3bg8V1ovPlMVGd
 xB8VCZEF4keizT0qktIsSh3ezcUfgFSFVyu+Pd4RXq7Kk4WL7qRMLRuMc
 ZukR4bqYX0hOEo/mSNhw7JgpxAefxZSptXe3olCBn5O+91yBl/kSLStE8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280767794"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="280767794"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 23:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562227100"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 20 Jun 2022 23:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 23:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 23:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Mon, 20 Jun 2022 23:14:00 -0700
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 9/9] drm/i915/rpm: d3cold Policy
Thread-Topic: [Intel-gfx] [PATCH v2 9/9] drm/i915/rpm: d3cold Policy
Thread-Index: AQHYgXjedbT4lS+vmUqexpAD5ifJ7q1SjRAAgAbZpPA=
Date: Tue, 21 Jun 2022 06:14:00 +0000
Message-ID: <131a5729bf5549168ea6595c6a67ea79@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-10-anshuman.gupta@intel.com> <871qvowum1.fsf@intel.com>
In-Reply-To: <871qvowum1.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, June 16, 2022 7:58 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-gfx] [PATCH v2 9/9] drm/i915/rpm: d3cold Policy
>=20
> On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > Add d3cold_sr_lmem_threshold modparam to choose between d3cold-off
> > zero watt and d3cold-VRAM Self Refresh.
> > i915 requires to evict the lmem objects to smem in order to support
> > d3cold-Off.
> >
> > If gfx root port is not capable of sending PME from d3cold then i915
> > don't need to program d3cold-off/d3cold-vram_sr sequence.
> >
> > FIXME: Eviction of lmem objects in case of D3Cold off is wip.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_driver.c | 27 ++++++++++++++++++++++++---
> > drivers/gpu/drm/i915/i915_params.c |  4 ++++
> > drivers/gpu/drm/i915/i915_params.h |  3 ++-
> >  3 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> > b/drivers/gpu/drm/i915/i915_driver.c
> > index fcff5f3fe05e..aef4b17efdbe 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1560,15 +1560,36 @@ static int i915_pm_restore(struct device
> > *kdev)  static int intel_runtime_idle(struct device *kdev)  {
> >  	struct drm_i915_private *dev_priv =3D kdev_to_i915(kdev);
> > +	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
> > +	u64 lmem_total =3D to_gt(dev_priv)->lmem->total;
> > +	u64 lmem_avail =3D to_gt(dev_priv)->lmem->avail;
> > +	u64 lmem_used =3D lmem_total - lmem_avail;
> > +	struct pci_dev *root_pdev;
> >  	int ret =3D 1;
> >
> > -	if (!HAS_LMEM_SR(dev_priv)) {
> > -		/*TODO: Prepare for D3Cold-Off */
> > +	root_pdev =3D pcie_find_root_port(pdev);
> > +	if (!root_pdev)
> > +		goto out;
> > +
> > +	if (!pci_pme_capable(root_pdev, PCI_D3cold))
> >  		goto out;
> > -	}
> >
> >  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> >
> > +	if (lmem_used < dev_priv->params.d3cold_sr_lmem_threshold  * 1024 *
> 1024) {
> > +		drm_dbg(&dev_priv->drm, "Prepare for D3Cold off\n");
> > +		pci_d3cold_enable(root_pdev);
> > +		/* FIXME: Eviction of lmem objects and guc reset is wip */
> > +		intel_pm_vram_sr(dev_priv, false);
> > +		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > +		goto out;
> > +	} else if (!HAS_LMEM_SR(dev_priv)) {
> > +		/* Disable D3Cold to reduce the eviction latency */
> > +		pci_d3cold_disable(root_pdev);
> > +		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > +		goto out;
> > +	}
>=20
> This is *way* too low level code for such high level function. This needs=
 to be
> abstracted better.
>=20
> > +
> >  	ret =3D intel_pm_vram_sr(dev_priv, true);
> >  	if (!ret)
> >  		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n"); diff
> --git
> > a/drivers/gpu/drm/i915/i915_params.c
> > b/drivers/gpu/drm/i915/i915_params.c
> > index 701fbc98afa0..6c6b3c372d4d 100644
> > --- a/drivers/gpu/drm/i915/i915_params.c
> > +++ b/drivers/gpu/drm/i915/i915_params.c
> > @@ -197,6 +197,10 @@ i915_param_named(enable_gvt, bool, 0400,
> >  	"Enable support for Intel GVT-g graphics virtualization host
> > support(default:false)");  #endif
> >
> > +i915_param_named_unsafe(d3cold_sr_lmem_threshold, int, 0400,
> > +	"Enable Vidoe RAM Self refresh when size of lmem is greater to this
> threshold. "
> > +	"It helps to optimize the suspend/resume latecy. (default: 300mb)");
> > +
> >  #if CONFIG_DRM_I915_REQUEST_TIMEOUT
> >  i915_param_named_unsafe(request_timeout_ms, uint, 0600,
> >  			"Default request/fence/batch buffer expiration
> timeout."); diff
> > --git a/drivers/gpu/drm/i915/i915_params.h
> > b/drivers/gpu/drm/i915/i915_params.h
> > index b5e7ea45d191..28f20ebaf41f 100644
> > --- a/drivers/gpu/drm/i915/i915_params.h
> > +++ b/drivers/gpu/drm/i915/i915_params.h
> > @@ -83,7 +83,8 @@ struct drm_printer;
> >  	param(bool, verbose_state_checks, true, 0) \
> >  	param(bool, nuclear_pageflip, false, 0400) \
> >  	param(bool, enable_dp_mst, true, 0600) \
> > -	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ?
> 0400 : 0)
> > +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ?
> 0400 : 0) \
> > +	param(int, d3cold_sr_lmem_threshold, 300, 0600) \
>=20
> What's the point of the parameter?
We want a configurable option to choose an optimum lmem usages threshold on=
 which, i915
can choose lmem self-refresh. This threshold value would require some profi=
ling as well.=20
That is the reason this threshold kept as module param. =20
>=20
> Also, please read the comment /* leave bools at the end to not create hol=
es */
> above.
Thanks for review comment , I will re order the module param.
Regards ,
Anshuman Gupta.
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >
> >  #define MEMBER(T, member, ...) T member;  struct i915_params {
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
