Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC19F463A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7635B10E875;
	Tue, 17 Dec 2024 08:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPl4Nlru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BA110E874;
 Tue, 17 Dec 2024 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734424941; x=1765960941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BJwwV+JKRVVo6A8J15fzPuynNtM72ZFLBWyeF2JRjoY=;
 b=CPl4NlruPdPUi//61SDxBx8uKK9by8fgASadVRXAuMsJnfr4Jj8YfPP4
 qC6EMTltBEx/InMy0uQCn8Qo10bHIZipprAcwKdkRP0O/WeMsgFsobRJa
 K35c8Oagnin5mATwkPeWZIPZUvakRX7TYzGGJP0sYg1Td8+FBYUM3/JfD
 mpVT72RFYkzca29i4K9y/PmLT6FkhJWTZqoF8l3XRcsnyP29fHoTmh90I
 VMGGDjmAtOjmZ2GYpYAoV242roUkLkIWQu3Qll0v8r8aQY7TjmWba+uCq
 47euw8Y9n/gjHVVHQgR2RR2UtO36wYTx4XCzdeOJtIoFF8Eh9akciliBD A==;
X-CSE-ConnectionGUID: kJ5HwdNRTx60VPHhhU2E8w==
X-CSE-MsgGUID: O9ADQUBcQACpgnXM1ro2aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57319441"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="57319441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 00:42:20 -0800
X-CSE-ConnectionGUID: qgWdjvXrTueQ8toSr4Bzhw==
X-CSE-MsgGUID: 1fleBUQ/R322AJufww8MGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="102315451"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 00:42:16 -0800
Date: Tue, 17 Dec 2024 10:42:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
Message-ID: <Z2E5ZbRym80khid2@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <cfb07238-841c-45ca-9a8e-c5aca80ee47c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfb07238-841c-45ca-9a8e-c5aca80ee47c@igalia.com>
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

On Thu, Dec 12, 2024 at 03:50:29PM -0300, André Almeida wrote:
> Em 28/11/2024 12:37, Raag Jadav escreveu:
> > Add documentation for device wedged event in a new 'Device wedging'
> > chapter. The describes basic definitions, prerequisites and consumer
> > expectations along with an example.
> > 
> >   v8: Improve documentation (Christian, Rodrigo)
> >   v9: Add prerequisites section (Christian)
> > v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > ---
> >   Documentation/gpu/drm-uapi.rst | 112 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 109 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index b75cc9a70d1f..da2927cde53d 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -371,9 +371,115 @@ Reporting causes of resets
> 
> I think it's a good idea to add a note about "device wedged event" in the
> section "Device reset > Kernel Mode Driver" since the idea is to explain
> what should kernel developer add to their kernel drivers to be used when a
> device resets.

Wouldn't that be just a repetition of below? Also, I'm not sure if it's a hard
requirement.

> >   Apart from propagating the reset through the stack so apps can recover, it's
> >   really useful for driver developers to learn more about what caused the reset in
> > -the first place. DRM devices should make use of devcoredump to store relevant
> > -information about the reset, so this information can be added to user bug
> > -reports.
> > +the first place. For this, drivers can make use of devcoredump to store relevant
> > +information about the reset and send device wedged event without recovery method
> 
> and send a device wedged event with recovery method as "none" (as explained
> in the chapter "Device wedging")

Sure.

> > +(as explained in next chapter) to notify userspace, so this information can be
> > +collected and added to user bug reports.
> > +
> 
> With those changes applied:
> 
> Reviewed-by: André Almeida <andrealmeid@igalia.com>

Thanks.

Raag
