Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMLVCpy3eWlHygEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:15:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E89DA0C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322D310E10A;
	Wed, 28 Jan 2026 07:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfoRz0SH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1910E10A;
 Wed, 28 Jan 2026 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769584535; x=1801120535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gURkbEP+6BQ2GIyBqD5vUzXffhloZZkaIza9UvVs5YQ=;
 b=OfoRz0SHOK3rYXmK7gkYL8QbFcBVIMI4HfWo0FYCiHFpMoXmJq3iHYcp
 mwStGSjJqQqac+lC5Cxd62rZ24pRedGQhgfeGAccN88LHRf97GaLnxDYh
 5vvr+c52pvGMm/j9SpCHKjyhMFj13Q4lR35W3zgbgLaseMrAKrC4YxIo7
 pO85NIUFWE4TlSFpbhwNvfgeiKYc8rMQOKP6XRTY6uNIlGMEcXtENslnp
 ccw15VwjQJU0Y0eRCxQY7F/rQ+7k7eiswpItYDrVi9isU1R0HOQANTqJI
 yo7Wl+rLSqlO8DK0f07NH4wpgZOE9P7iHxU3BnUurd3tJcVmsQxvNSafk g==;
X-CSE-ConnectionGUID: PvgTy7kKQ9OSgitsr7M4Jw==
X-CSE-MsgGUID: NAksh7HqRYSNXlX0uLrDJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82220484"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82220484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:15:35 -0800
X-CSE-ConnectionGUID: Rto8Q8NLS0OjI0jx2OJ07g==
X-CSE-MsgGUID: 8IOlEiECQwy0PuG1pUieTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207435650"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:15:31 -0800
Date: Wed, 28 Jan 2026 08:15:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aXm3kI6tAJkrO30F@black.igk.intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-8-riana.tauro@intel.com>
 <aW-039yu1OXXSrdz@black.igk.intel.com>
 <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 441E89DA0C
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:21:18PM +0530, Riana Tauro wrote:
> On 1/20/2026 10:31 PM, Raag Jadav wrote:
> > On Mon, Jan 19, 2026 at 09:30:24AM +0530, Riana Tauro wrote:
> > > Allocate correctable, uncorrectable nodes for every xe device
> > > Each node contains error classes, counters and respective
> > > query counter functions.
> > 
> > ...
> > 
> > > +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> > > +				  u32 error_id, const char **name, u32 *val)
> > > +{
> > > +	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
> > 
> > This looks like it can be in_range().
> 
> in_range has start+len. Should again use count here.
> This seems simpler

I just had another look at this and wondering if we really need lower
bound check? error_id is already unsigned right?

Raag

> > > +		return -EINVAL;
> > > +
> > > +	if (!info[error_id].name)
> > > +		return -ENOENT;
> > > +
> > > +	*name = info[error_id].name;
> > > +	*val = atomic64_read(&info[error_id].counter);
> > > +
> > > +	return 0;
> > > +}
