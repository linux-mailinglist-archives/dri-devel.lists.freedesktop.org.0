Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC885BEB1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E732D10E447;
	Tue, 20 Feb 2024 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElilJcPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566DF10E037;
 Tue, 20 Feb 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708439044; x=1739975044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W9VQKihaZMC7U1Rw/MLDCDASL2zahkiIpd5gl7fzUOw=;
 b=ElilJcPmqPth0tOpwlxvaNo88JbU3iYbYc5K32n+efO0BDMusBfQKIe4
 xYatmHX1l9ATS7YJVwjxdTfB9LD/teqKsJIlMEoW7WUwGGNtk/9vZn45h
 ShUF+S7KIeDgEOP8b3osbQVM/WsgfOF9RhXBk5DiLToGKZc0jtr20BPUt
 io+DgNCuN7/lVkJLx1UVsi624n/7Zl0ixlIAtqAdnGLrQzorV1HrlGRt5
 WUpJPsS+DB6sEnr1WNNNdbEgCE2DpLQvh0P7n2ZcfttZVVyf1trvQFRmk
 GCsNl13v1EfhDlcxUHWN0Vw521Biry9trtJZDDzWDMYlC2u07tA7iCKGW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="20075087"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="20075087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="9433618"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:24:01 -0800
Date: Tue, 20 Feb 2024 15:23:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 0/2] Disable automatic load CCS load balancing
Message-ID: <ZdS1_mEbYMDNCloi@ashyti-mobl2.lan>
References: <20240220142034.257370-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220142034.257370-1-andi.shyti@linux.intel.com>
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

Hi,

I'm sorry, I forgot to add the changelog. Here it is:

v1 -> v2
========
- In Patch 1 use the correct workaround number (thanks Matt).
- In Patch 2 do not add the extra CCS engines to the exposed UABI
  engine list and adapt the engine counting accordingly (thanks
  Tvrtko).
- Reword the commit of Patch 2 (thanks John).

On Tue, Feb 20, 2024 at 03:20:32PM +0100, Andi Shyti wrote:
> Hi,
> 
> this series does basically two things:
> 
> 1. Disables automatic load balancing as adviced by the hardware
>    workaround.
> 
> 2. Forces the sharing of the load submitted to CCS among all the
>    CCS available (as of now only DG2 has more than one CCS). This
>    way the user, when sending a query, will see only one CCS
>    available.
> 
> Andi
> 
> Andi Shyti (2):
>   drm/i915/gt: Disable HW load balancing for CCS
>   drm/i915/gt: Set default CCS mode '1'
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 +++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  6 ++++++
>  drivers/gpu/drm/i915/i915_drv.h             | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/i915_query.c           |  5 +++--
>  5 files changed, 40 insertions(+), 2 deletions(-)
> 
> -- 
> 2.43.0
