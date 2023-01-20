Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193FB674DD2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 08:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865710EA58;
	Fri, 20 Jan 2023 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA1710EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674198563; x=1705734563;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tKm+bO/Vgerfp3hhNVj9ktg62zDE7O3jfNPDVmPjMMI=;
 b=idZsro9cF+GQGAIxylx7ZnUcAp7FAEExrkH/7PFw3/88SI/jcNLqeYb1
 mV5gXkyPi5Nie9PVi01XAH9vHWQAkeL8CYI4fLqEt2JfxQLSrCouEFYxS
 z4W+myt88TSgZ+KlCUo/AEvWpkjW0ytAY1g2x2BLHaa8tupSHvc/POwms
 4N4cOo5SgXrcIchx43+rRy4GCnszLZbL1gUwe5hAdmJvtfVy3oDduA0Gh
 0cvuMmkH0A9mXRV0WsnEtYGFdEo671Caz9JKZNurcsuCKHcwo/gHdOSLH
 JmQlbJV1thOiLfwYT6VVNCgEBNaYj+tDxeeGWOwoz+MwBSxxJmdeU0oaC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390036146"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="390036146"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 23:09:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692773205"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692773205"
Received: from bjforde-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.29.176])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 23:09:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: pr-tracker-bot for drm subsystem?
In-Reply-To: <87a670spdw.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87a670spdw.fsf@intel.com>
Date: Fri, 20 Jan 2023 09:09:18 +0200
Message-ID: <87a62dadi9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Konstantin?

On Thu, 15 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Hey all, I'd be interested in having the pr-tracker-bot [1] set up for
> the drm subsystem, following the dri-devel mailing list [2] and
> notifying when the pull requests have been merged to either the drm-next
> or drm-fixes branches of the main drm repository [3].
>
> What would this require in terms of the tracker bot code?
>
> Is the idea that the service could be expanded to cover subsystems
> instead of just LKML and mainline, or would all subsystems have to set
> it up for themselves with their own cron jobs on their own servers?
>
> Other considerations?
>
>
> BR,
> Jani.
>
>
> [1] https://korg.docs.kernel.org/prtracker.html
> [2] https://lists.freedesktop.org/mailman/listinfo/dri-devel
> [3] https://cgit.freedesktop.org/drm/drm/

-- 
Jani Nikula, Intel Open Source Graphics Center
