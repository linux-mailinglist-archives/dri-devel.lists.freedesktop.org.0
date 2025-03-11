Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F8A5CBC2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A1910E647;
	Tue, 11 Mar 2025 17:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqD3PbXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733510E62B;
 Tue, 11 Mar 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741713067; x=1773249067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QA4pFW1oxdkWwb6tOCXzPFVdqvzGDBgMwXg9IWYanfI=;
 b=UqD3PbXdB3yg1M6skBnqGWrftJyGZRdAKzEb8DhtjlQSC3dgQ9AGFmKT
 /aCErLB8kol6YF4RttbLuYHnrNFZoM1QkumD6eUv+SjsvmjwgPjjRzQwT
 PkHuf9D9HWMIXjzAWyNRWasghdEhDpq7jF2MQm2rLJoDnWN3IEPg1eudB
 qQvLv/NMCDh6mGeTf+QXuShhWYMpP9UOtZzDy42zaYOfAIAlJ3LT2L0vd
 6jN195hWKBPHjQpKJbYP8FAL7WEK1X79DMWsq+lOk/DkZsGqlx5Y5DyP0
 jmALt8sEaZePdLc19AD9gUIgqsBj770EFWbunTOvaMlO0VbRwWq3/yOmA Q==;
X-CSE-ConnectionGUID: S+4UmAFZRJeKnL0nQaYzQA==
X-CSE-MsgGUID: wHtnMbbnSSmBW2Hj24vdpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42676076"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42676076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:10:49 -0700
X-CSE-ConnectionGUID: fNbKLCRzRoyzfzsju+JhNg==
X-CSE-MsgGUID: qhOq77r8RHqgvWz9Guzl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120407156"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:09:42 -0700
Date: Tue, 11 Mar 2025 19:09:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 lucas.demarchi@intel.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: Re: [PATCH 1/2] drm: Create an app info option for wedge events
Message-ID: <Z9BuU3RzMkEE_FL1@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-2-andrealmeid@igalia.com>
 <Z8HGFRGOYvyCCWWu@black.fi.intel.com>
 <58763d8e-46a1-4753-9401-987fb3dac50b@igalia.com>
 <Z8KgwswQQyGxhsR1@black.fi.intel.com>
 <db27ee44-f480-475b-be7e-710bd30eb7a5@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db27ee44-f480-475b-be7e-710bd30eb7a5@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 10, 2025 at 06:27:53PM -0300, André Almeida wrote:
> Em 01/03/2025 02:53, Raag Jadav escreveu:
> > On Fri, Feb 28, 2025 at 06:54:12PM -0300, André Almeida wrote:
> > > Hi Raag,
> > > 
> > > On 2/28/25 11:20, Raag Jadav wrote:
> > > > Cc: Lucas
> > > > 
> > > > On Fri, Feb 28, 2025 at 09:13:52AM -0300, André Almeida wrote:
> > > > > When a device get wedged, it might be caused by a guilty application.
> > > > > For userspace, knowing which app was the cause can be useful for some
> > > > > situations, like for implementing a policy, logs or for giving a chance
> > > > > for the compositor to let the user know what app caused the problem.
> > > > > This is an optional argument, when `PID=-1` there's no information about
> > > > > the app caused the problem, or if any app was involved during the hang.
> > > > > 
> > > > > Sometimes just the PID isn't enough giving that the app might be already
> > > > > dead by the time userspace will try to check what was this PID's name,
> > > > > so to make the life easier also notify what's the app's name in the user
> > > > > event.
> > > > > 
> > > > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> [...]
> 
> > > > >    	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> > > > > @@ -562,6 +564,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> > > > >    	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
> > > > >    		 "but recovered through reset" : "needs recovery");
> > > > > +	if (info) {
> > > > > +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> > > > > +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> > > > > +	} else {
> > > > > +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> > > > > +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> > > > > +	}
> > > > This is not much use for wedge cases that needs recovery, since at that point
> > > > the userspace will need to clean house anyway.
> > > > 
> > > > Which leaves us with only 'none' case and perhaps the need for standardization
> > > > of "optional telemetry collection".
> > > > 
> > > > Thoughts?
> > > 
> > > I had the feeling that 'none' was already meant to be used for that. Do you
> > > think we should move to another naming? Given that we didn't reach the merge
> > > window yet we could potentially change that name without much damage.
> > 
> > No, I meant thoughts on possible telemetry data that the drivers might
> > think is useful for userspace (along with PID) and can be presented in
> > a vendor agnostic manner (just like wedged event).
> 
> I'm not if I agree that this will only be used for telemetry and for the
> `none` use case. As stated by Xaver, there's use case to know which app
> caused the device to get wedged (like switching to software rendering) and
> to display something for the user after the recovery is done (e.g. "The game
> <app name> stopped working and Plasma has reset").

Sure, but since this information is already available in coredump, I was
hoping to have something like a standardized DRM level coredump with both
vendor specific and agnostic sections, which the drivers can (and hopefully
transition to) use in conjunction with wedged event to provide wider
telemetry and is useful for all wedge cases.

Would that serve the usecase here?

Raag
