Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A75E5FB07B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809C10E365;
	Tue, 11 Oct 2022 10:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601AB10E34E;
 Tue, 11 Oct 2022 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665484360; x=1697020360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PmoXsfsuU1g2vWiW+wkOkDnJcfLzJAQp/lvee/CHGEg=;
 b=EMFJT4kVcQa5Ak3RuhIKdSvA93mdWFyaBjVqPUCpxU9NpBTJTxCGc3Pu
 RLEhm7hqAf+ekb3JZcns7aOK9j6Xt5RZrVhJZQqNslLlRkfF/Ns6QehLz
 K63yeTO5yCzY3yTCZ8GUcZFPTSsa7Mo6DGR8YAJ31IK2UiC5p5EgFkT0B
 cwMs0REafcvvKChdGW3IqCweJk3MR/gu1ddTodTXf3bN3JBXklHdMevCb
 mOGoyNGy0nzEDlVC44+L1AwRbaTkiqsOVtH++IUdFfW91k7L2ZteFEBEN
 VYm2QOF/ZihKWf0eWgnKMqgtz8oNxr2Za3N2BMOvrzBDwve6eJlSAW7io g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="304457168"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="304457168"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="801410639"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="801410639"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 11 Oct 2022 03:32:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Oct 2022 13:32:35 +0300
Date: Tue, 11 Oct 2022 13:32:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use graphics ver, rel info for
 media on old platforms
Message-ID: <Y0VGQ3jFguGOlh2w@intel.com>
References: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
 <87pmeyyg3n.fsf@intel.com>
 <DM4PR11MB59714D6C8D496B5538DA27AB87239@DM4PR11MB5971.namprd11.prod.outlook.com>
 <87k056y8kt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k056y8kt.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sripada,
 Radhakrishna" <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 01:10:26PM +0300, Jani Nikula wrote:
> On Tue, 11 Oct 2022, "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com> wrote:
> > Hi Jani,
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Tuesday, October 11, 2022 12:28 AM
> >> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> >> gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> >> <radhakrishna.sripada@intel.com>; De Marchi, Lucas
> >> <lucas.demarchi@intel.com>; Roper, Matthew D
> >> <matthew.d.roper@intel.com>
> >> Subject: Re: [PATCH] drm/i915: Use graphics ver, rel info for media on old
> >> platforms
> >> 
> >> On Mon, 10 Oct 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >> wrote:
> >> > Platforms prior to MTL do not have a separate media and graphics version.
> >> > On platforms where GMD id is not supported, reuse the graphics ip version,
> >> > release info for media.
> >> >
> >> > The rest of the IP graphics, display versions would be copied during driver
> >> > creation.
> >> >
> >> > While at it warn if GMD is not used for platforms greater than gen12.
> >> >
> >> > Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version
> >> from hw")
> >> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> > Cc: Matt Roper <matthew.d.roper@intel.com>
> >> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
> >> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> >> b/drivers/gpu/drm/i915/intel_device_info.c
> >> > index 090097bb3c0a..ba178b61bceb 100644
> >> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> >> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> >> > @@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct
> >> drm_i915_private *i915)
> >> >  {
> >> >  	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
> >> >
> >> > -	if (!HAS_GMD_ID(i915))
> >> > +	if (!HAS_GMD_ID(i915)) {
> >> > +		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)-
> >> >graphics.ip.ver > 12);
> >> > +		/*
> >> > +		 * On older platforms, graphics and media share the same ip
> >> > +		 * version and release.
> >> > +		 */
> >> > +		RUNTIME_INFO(i915)->media.ip.ver =
> >> > +			RUNTIME_INFO(i915)->graphics.ip.ver;
> >> > +		RUNTIME_INFO(i915)->media.ip.rel =
> >> > +			RUNTIME_INFO(i915)->graphics.ip.rel;
> >> 
> >> You could assign the whole struct ip_version (*) at once, or is there a
> >> reason you're intentionally not assigning step?
> > Step info would anyways be determined later in the function intel_step_init.
> > We already have macros in place to handle common gt and media steps there.
> >
> > Do you suggest we memcpy(&RUNTIME_INFO(i915)->media.ip, &RUNTIME_INFO->graphics.ip, sizeof(struct ip_version)) here?
> 
> Simple assign should do it for such a small struct.

IMO for any struct. Only use memcpy() when copying arrays and such.

-- 
Ville Syrjälä
Intel
