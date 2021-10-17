Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0797430C13
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 22:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A8C6E570;
	Sun, 17 Oct 2021 20:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D736E570;
 Sun, 17 Oct 2021 20:48:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="251591811"
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="251591811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 13:48:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="493329324"
Received: from nidhinms-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.249.44.7])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 13:48:11 -0700
Date: Sun, 17 Oct 2021 22:48:07 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Cc: Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: make a gt sysfs group and move power
 management files
Message-ID: <YWyMB0qWf9/tpxFj@intel.intel>
References: <20211014000817.39227-1-andi@etezian.org>
 <bcb0891f-a648-7ded-0a4e-3ed745253088@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb0891f-a648-7ded-0a4e-3ed745253088@intel.com>
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

Hi Sujaritha,

[...]

> > +void intel_gt_sysfs_unregister(struct intel_gt *gt)
> > +{
> > +}
> 
> Is there a reason for this function to not be populated ?

yes, there is, indeed, something missing here. There has been a
fix bout this floating around from Chris about sysfs_gt kobjects.

I will check if we can add the fix at the next verion.

Thanks,
Andi
