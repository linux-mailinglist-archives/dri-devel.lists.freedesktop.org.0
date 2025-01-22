Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73459A18B45
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 06:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671710E660;
	Wed, 22 Jan 2025 05:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8FZeqCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDB810E1D8;
 Wed, 22 Jan 2025 05:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737523353; x=1769059353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bGb3uSuBaIf/MAnGLEfUH4EYMoGQe75OanvumQWUoUE=;
 b=M8FZeqCeTBBpjKlnTFYEjKD0PPQrY2iixSC7hhqsJpYKRu+ujX/wjVpK
 zQT1kaSDOTheYe8ivS8rW7W9yGBD53cJ0jYAolS7ShXCHndffJC2ZSl4X
 UTBDm/Og/s1uotrGtYPT3Qdt+JhRVmRm1ecoCysKE5tnHWUgMj3pDazTk
 I6+ViRtcaCy9bpA3n47K+lVGXlm0v/TxQbog+IsTBdGMY478X+tDRQGQw
 HynUX68zZnx0IY1aoKYhAexB3sXUY0PaE6RAAQ+wSrL6p/j8dX1mTxS1r
 O64YyYLk3faDYm97Txq869nJv5p4tdGxDt0x6NcOHiJJpkM6FyxUe57ho Q==;
X-CSE-ConnectionGUID: KVDxAFc3Slm5mpf8LJZ+BQ==
X-CSE-MsgGUID: R3BIyjePSW22if0eCW+h6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37995042"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37995042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:22:33 -0800
X-CSE-ConnectionGUID: 3wX4WW/XS4ycm8dlpM1JCw==
X-CSE-MsgGUID: MBkDZ6oBT36a7o+Q4DRzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="112023364"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:22:29 -0800
Date: Wed, 22 Jan 2025 07:22:25 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
Message-ID: <Z5CAkXSOpNiiFbv4@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFZQkGy3R0TMY5CARPQZF70fdKGLX8GQjV_YQAHzEXsiuNHj+w@mail.gmail.com>
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

On Tue, Jan 21, 2025 at 02:14:56AM +0100, Xaver Hugl wrote:
> > +It is the responsibility of the consumer to make sure that the device or
> > +its resources are not in use by any process before attempting recovery.
> I'm not convinced this is actually doable in practice, outside of
> killing all apps that aren't the one trying to recover the GPU.
> Is this just about not crashing those processes if they don't handle
> GPU hotunplugs well, about leaks, or something else?

Correct, all of it. And since the compositor is in charge of device resources,
this way it atleast has the opportunity to recover the device and recreate
context without all the userspace violence.

I'm not entirely aware of its feasibility though, perhaps something for the
consumers to experiment.

> > +With IOCTLs blocked and device already 'wedged', all device memory should
> > +be unmapped and file descriptors should be closed to prevent leaks.
> Afaiu from a userspace POV, a rebind is just like a GPU hotunplug +
> hotplug with matching "remove" and "add" udev events. As long as the
> application cleans up resources related to the device when it receives
> the event, there should be no leaks with a normal hotunplug... Is this
> different enough that we can't have the same expectations?

The thing about "remove" event is that it is generated *after* we opt for an
unbind, and at that point it might be already too late if userspace doesn't
get enough time to clean things up while the device is removed with a live
client resulting in unknown consequences.

The idea here is to clean things up *before* we opt for an unbind leaving
no room for side effects.

Raag
