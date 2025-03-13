Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F3A5F202
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F5910E106;
	Thu, 13 Mar 2025 11:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gljrNtU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E0B10E106;
 Thu, 13 Mar 2025 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741864084; x=1773400084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DtTOfbnkAVccKUuDS63awzbFYBh5j1+96WX5yegVUyc=;
 b=gljrNtU01sg/b0uPMfHahFh+tVZns/QyWMxIubt13CXLKbok5UmX05Kk
 Kr2vhhITtDddVlhVGPztHKWvDFUDgLshP9Upf2C1iSyBJkBGCUcyj8JRA
 f2/WIci7m/Ggf3mph8Sw12pqcXoAPQb83Ggds6gpTo9Jc9wi27gZVO7YI
 ka9X73U4Qpc/COQlkcJJHS7ep1Zi094rSRnxWAQQg/l8FkbGiqipgZ8Be
 qW9Xsr0MKiQgfIDYMTidn0nJH/Qq/8F+Txmo1ZQyRL5OI30J0yGIHTip4
 uwtCbob/pgcPG02/Q0wPa/EkA+ZyHg8oMCvzgUbJ+UDWuFjr0SIqlHXSK Q==;
X-CSE-ConnectionGUID: Hy/SKhc2S1arP52CAVAIXA==
X-CSE-MsgGUID: sqGjuyLHQW2LEceGez1NVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68328800"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="68328800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:08:03 -0700
X-CSE-ConnectionGUID: AjktYhLsRsm6vhAxfAix0w==
X-CSE-MsgGUID: syYFaxW2RVyXWMwPukIlaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="158080593"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:07:59 -0700
Date: Thu, 13 Mar 2025 13:07:56 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 lucas.demarchi@intel.com, Xaver Hugl <xaver.hugl@kde.org>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Subject: Re: [PATCH 1/2] drm: Create an app info option for wedge events
Message-ID: <Z9K8jHVoOKPoXyuv@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-2-andrealmeid@igalia.com>
 <Z8HGFRGOYvyCCWWu@black.fi.intel.com>
 <58763d8e-46a1-4753-9401-987fb3dac50b@igalia.com>
 <Z8KgwswQQyGxhsR1@black.fi.intel.com>
 <db27ee44-f480-475b-be7e-710bd30eb7a5@igalia.com>
 <Z9BuU3RzMkEE_FL1@black.fi.intel.com>
 <Z9FcmDzSmBbVAsqD@black.fi.intel.com>
 <ef926ea5-ac0e-4f95-b260-84c4102c93ad@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef926ea5-ac0e-4f95-b260-84c4102c93ad@igalia.com>
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

On Wed, Mar 12, 2025 at 06:59:33PM -0300, André Almeida wrote:
> Em 12/03/2025 07:06, Raag Jadav escreveu:
> > On Tue, Mar 11, 2025 at 07:09:45PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 10, 2025 at 06:27:53PM -0300, André Almeida wrote:
> > > > Em 01/03/2025 02:53, Raag Jadav escreveu:
> > > > > On Fri, Feb 28, 2025 at 06:54:12PM -0300, André Almeida wrote:
> > > > > > Hi Raag,
> > > > > > 
> > > > > > On 2/28/25 11:20, Raag Jadav wrote:
> > > > > > > Cc: Lucas
> > > > > > > 
> > > > > > > On Fri, Feb 28, 2025 at 09:13:52AM -0300, André Almeida wrote:
> > > > > > > > When a device get wedged, it might be caused by a guilty application.
> > > > > > > > For userspace, knowing which app was the cause can be useful for some
> > > > > > > > situations, like for implementing a policy, logs or for giving a chance
> > > > > > > > for the compositor to let the user know what app caused the problem.
> > > > > > > > This is an optional argument, when `PID=-1` there's no information about
> > > > > > > > the app caused the problem, or if any app was involved during the hang.
> > > > > > > > 
> > > > > > > > Sometimes just the PID isn't enough giving that the app might be already
> > > > > > > > dead by the time userspace will try to check what was this PID's name,
> > > > > > > > so to make the life easier also notify what's the app's name in the user
> > > > > > > > event.
> > > > > > > > 
> > > > > > > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > > 
> > > > [...]
> > > > 
> > > > > > > >     	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> > > > > > > > @@ -562,6 +564,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> > > > > > > >     	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
> > > > > > > >     		 "but recovered through reset" : "needs recovery");
> > > > > > > > +	if (info) {
> > > > > > > > +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> > > > > > > > +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> > > > > > > > +	} else {
> > > > > > > > +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> > > > > > > > +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> > > > > > > > +	}
> > > > > > > This is not much use for wedge cases that needs recovery, since at that point
> > > > > > > the userspace will need to clean house anyway.
> > > > > > > 
> > > > > > > Which leaves us with only 'none' case and perhaps the need for standardization
> > > > > > > of "optional telemetry collection".
> > > > > > > 
> > > > > > > Thoughts?
> > > > > > 
> > > > > > I had the feeling that 'none' was already meant to be used for that. Do you
> > > > > > think we should move to another naming? Given that we didn't reach the merge
> > > > > > window yet we could potentially change that name without much damage.
> > > > > 
> > > > > No, I meant thoughts on possible telemetry data that the drivers might
> > > > > think is useful for userspace (along with PID) and can be presented in
> > > > > a vendor agnostic manner (just like wedged event).
> > > > 
> > > > I'm not if I agree that this will only be used for telemetry and for the
> > > > `none` use case. As stated by Xaver, there's use case to know which app
> > > > caused the device to get wedged (like switching to software rendering) and
> > > > to display something for the user after the recovery is done (e.g. "The game
> > > > <app name> stopped working and Plasma has reset").
> > > 
> > > Sure, but since this information is already available in coredump, I was
> > > hoping to have something like a standardized DRM level coredump with both
> > > vendor specific and agnostic sections, which the drivers can (and hopefully
> > > transition to) use in conjunction with wedged event to provide wider
> > > telemetry and is useful for all wedge cases.
> > 
> > This is more useful because,
> > 
> > 1. It gives drivers an opportunity to present the telemetry that they are
> >     interested in without needing to add a new event string (like PID or APP)
> >     for their case.
> > 
> > 2. When we consider wedging as a usecase, there's a lot more that goes
> >     into it than an application that might be behaving strangely. So a wider
> >     telemetry is what I would hope to look at in such a scenario.
> > 
> 
> I agree that coredump is the way to go for telemetry, we already have the
> name and PID of the guilty app there, along with more information about the
> GPU state. But I don't think it should be consumed like an uAPI. Even if we
> wire up some common DRM code for that, I don't think we can guarantee the
> stability of it as we can do for an uevent. coredump can be disabled and by
> default is only accessible by root.

Hm, this made me curious about how a pid of a specific user will be dealt
with in a multi-user scenario. I know it's not a common scenario for the
usercase but setting the rules to avoid side-effects (or could there be
any?) might be a good idea.

> So I think that coredump is really good after the fact and if the user is
> willing to go ahead and report a bug somewhere. But for the goal of
> notifying the compositor, the same uevent that the compositor is already
> listening to will have everything they need to deal with this reset.

I agree that having to deal with coredump will be cumbersome for the
usecase. Although I'm still leaning towards the idea that we should
consider the room for new usecases that probably want to expose new data,
and having to add a new string each time might not be the best of the
approach.

But that's just my opinion and we should probably wait for wider feedback.

Raag
