Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953954F478
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FE510EE33;
	Fri, 17 Jun 2022 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F117C10EE33;
 Fri, 17 Jun 2022 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655458620; x=1686994620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ue6ykXKrR/+gYom6bOjSh5gfZS84kr8m6d+nWfd5ClY=;
 b=Y7Ty9wO27f3SpJKtZwQ151JYZbFR6uaol5YaxS+w2W8zr8/IgLrdbDE2
 QHLXCn+geYfQ99/HcOTZoJSF8mMSLrHLClmIUKXmMQiLZdUMEysCWLX1f
 eFZKM2AmniZ/cgWNcWzVXYoZZxfjO1SmFDu7abFhQWCgcOLw/73EIr8vI
 S8oPXJfmVkw/FlybM/3r6kWwJjnN2Z94xZsGi5OVlh0bm8xmwjiYm6V3K
 aqRNGu3PjZzXi2Td4lYgPmUgeyphIAvew4JfWZPvSpiTMCQW1EEejPJBm
 SH24ZWJ807Py09ZW+YAyjdvLDKQXrEY+L3g84RwuhbfQnAyiC++g1aVxk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259316738"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259316738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 02:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641968979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2022 02:37:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 02:36:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 02:36:59 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Fri, 17 Jun 2022 02:36:59 -0700
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 7/9] drm/i915/rpm: Enable D3Cold VRAM SR
 Support
Thread-Topic: [Intel-gfx] [PATCH v2 7/9] drm/i915/rpm: Enable D3Cold VRAM SR
 Support
Thread-Index: AQHYgXjaPmRLnHIXt0udMK0/tJgvEq1SjikAgADKP1A=
Date: Fri, 17 Jun 2022 09:36:59 +0000
Message-ID: <5f5cb8ab662249ec9f5454a60ca6223b@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-8-anshuman.gupta@intel.com> <87v8t0vfv1.fsf@intel.com>
In-Reply-To: <87v8t0vfv1.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
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
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, June 16, 2022 8:02 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Wilson, Chris P <chris.p.wilson@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-gfx] [PATCH v2 7/9] drm/i915/rpm: Enable D3Cold VRAM =
SR
> Support
>=20
> On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > Intel Client DGFX card supports D3Cold with two option.
> > D3Cold-off zero watt, D3Cold-VRAM Self Refresh.
> >
> > i915 requires to evict the lmem objects to smem in order to support
> > D3Cold-Off, which increases i915 the suspend/resume latency. Enabling
> > VRAM Self Refresh feature optimize the latency with additional power
> > cost which required to retain the lmem.
> >
> > Adding intel_runtime_idle (runtime_idle callback) to enable VRAM_SR,
> > it will be used for policy to choose between D3Cold-off vs
> > D3Cold-VRAM_SR.
> >
> > Since we have introduced i915 runtime_idle callback.
> > It need to be warranted that Runtime PM Core invokes runtime_idle
> > callback when runtime usages count becomes zero. That requires to use
> > pm_runtime_put instead of pm_runtime_put_autosuspend.
> >
> > TODO: GuC interface state save/restore.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_driver.c      | 26 +++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/intel_runtime_pm.c |  3 +--
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> > b/drivers/gpu/drm/i915/i915_driver.c
> > index aa1fb15b1f11..fcff5f3fe05e 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1557,6 +1557,31 @@ static int i915_pm_restore(struct device *kdev)
> >  	return i915_pm_resume(kdev);
> >  }
> >
> > +static int intel_runtime_idle(struct device *kdev) {
> > +	struct drm_i915_private *dev_priv =3D kdev_to_i915(kdev);
> > +	int ret =3D 1;
> > +
> > +	if (!HAS_LMEM_SR(dev_priv)) {
> > +		/*TODO: Prepare for D3Cold-Off */
> > +		goto out;
> > +	}
> > +
> > +	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > +
> > +	ret =3D intel_pm_vram_sr(dev_priv, true);
> > +	if (!ret)
> > +		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n");
>=20
> Please add the debug in the intel_pm_vram_sr() function instead.
Thanks for review comment, will fix this.
Regards,
Anshuman Gupta.
>=20
> BR,
> Jani.
>=20
> > +
> > +	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > +
> > +out:
> > +	pm_runtime_mark_last_busy(kdev);
> > +	pm_runtime_autosuspend(kdev);
> > +
> > +	return ret;
> > +}
> > +
> >  static int intel_runtime_suspend(struct device *kdev)  {
> >  	struct drm_i915_private *dev_priv =3D kdev_to_i915(kdev); @@ -1742,6
> > +1767,7 @@ const struct dev_pm_ops i915_pm_ops =3D {
> >  	.restore =3D i915_pm_restore,
> >
> >  	/* S0ix (via runtime suspend) event handlers */
> > +	.runtime_idle =3D intel_runtime_idle,
> >  	.runtime_suspend =3D intel_runtime_suspend,
> >  	.runtime_resume =3D intel_runtime_resume,  }; diff --git
> > a/drivers/gpu/drm/i915/intel_runtime_pm.c
> > b/drivers/gpu/drm/i915/intel_runtime_pm.c
> > index 6ed5786bcd29..4dade7e8a795 100644
> > --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> > @@ -492,8 +492,7 @@ static void __intel_runtime_pm_put(struct
> > intel_runtime_pm *rpm,
> >
> >  	intel_runtime_pm_release(rpm, wakelock);
> >
> > -	pm_runtime_mark_last_busy(kdev);
> > -	pm_runtime_put_autosuspend(kdev);
> > +	pm_runtime_put(kdev);
> >  }
> >
> >  /**
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
