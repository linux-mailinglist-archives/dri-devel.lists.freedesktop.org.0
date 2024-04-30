Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C48B7757
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5910FD0C;
	Tue, 30 Apr 2024 13:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaMWfvRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3A110FCCB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714484341; x=1746020341;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TgcTeCnrb1yc5Pk9cx7aGx9RLAxkw7ZTtOyH0qNCDwg=;
 b=VaMWfvROxzUwe28A7ysYLQbfMFr15Ib/yqUbFH2m7FF1gSmrYe3AtSiW
 KY9s1uSbv28z/E5eNeWlCVbm6n+NA3wd2LbQOXPZ+BVRmBMItrpsUhoVN
 jm0MtP8rQSgNYdwVuNoIQGe6Y8irIQji/sd+mJOG1Xuk8+swcGtWYW4Jx
 k7WkhLCDxL362hqmJye73CBtJ3nOfMC/gBNL1/6/DR3//NcpczPxP6q1C
 +sgYvIuLo86oiQ+prqPp3+pCueRFGiqHt1PHnH9dEv9x9aKQMrE1kQhCx
 tm7yDCXZz6+bemAflM7tuHp8dx+zTWl3FKNsUW9tkogquvN42c4n3oCX2 Q==;
X-CSE-ConnectionGUID: AGyEFSxqR46SBcZAKdarEA==
X-CSE-MsgGUID: mQH0OUiEQOSVJgklMRYhuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10119834"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10119834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:39:00 -0700
X-CSE-ConnectionGUID: W0Cn2URGTfC5xFtSgepOag==
X-CSE-MsgGUID: evATzAKYTGWRGr/i3bXkNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="30931974"
Received: from vkats-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.167])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:38:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
In-Reply-To: <ZjDtOVHquxhWeNfo@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <c6f1677d-6fdd-4a64-9072-5ecf6dae1966@amd.com> <87v8402gz8.fsf@intel.com>
 <ZjDtOVHquxhWeNfo@phenom.ffwll.local>
Date: Tue, 30 Apr 2024 16:38:55 +0300
Message-ID: <878r0v2cnk.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Apr 2024, Daniel Vetter <daniel@ffwll.ch> wrote:
> Might also be a good idea to wait a bit in case there's any regression
> reports for really old userspace. But I guess there's not a high chance
> for that to happen here, so imo fine to just go ahead right away.

This small bit is definitely easier to revert if needed than the whole
shebang.

BR,
Jani.


-- 
Jani Nikula, Intel
