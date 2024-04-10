Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6B89F979
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803911291C;
	Wed, 10 Apr 2024 14:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6UeiAuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D03B10FF25;
 Wed, 10 Apr 2024 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712758146; x=1744294146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KgQTJUyXjYeoG6WlEkT6Hvk3sthSjdbGKQj/2LcgW6I=;
 b=V6UeiAuCG3r2sT6FoitR6sxi72Q7eEOCg9USkGSSIyhnNATg+YYtaa9/
 gliLjKM1gy3TFVcHZzEelqmuWB7cZZe5fhmg8MasWCybR2hNHp3fMgkfh
 Xoa7/MtEenONlPI4y2YUnjPU+6sqyY8Uh4vTvM4WleWcIetpvYyZjvHFv
 B4DZGrjz87TtrTlQDrIQBcFb/eiPXuT4GxCAuVGg0SXOYMOuZlQ/K2K5p
 Y+60fbe7DBWrp5WE3fhQZHgwi+v2TSyEqnGWcv43q8gEf5iP/dtQcIBGC
 b4OZy54GKMpg5r0GsORFWhC68umrYs2TzDuxQKloU/JYDyCrb8gpyYw9j Q==;
X-CSE-ConnectionGUID: NB/bTg6BQIGYFq3xsj6SWA==
X-CSE-MsgGUID: LpDeed6zRKG2tcQ5Lr8wjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11900756"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11900756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:06:19 -0700
X-CSE-ConnectionGUID: TA56WqCGScq9x5d5PpoTVg==
X-CSE-MsgGUID: UI6Di26GR7SJEar4pqRrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25089577"
Received: from unknown (HELO intel.com) ([10.247.118.254])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:06:15 -0700
Date: Wed, 10 Apr 2024 16:06:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/10] drm/i915: use system include for drm headers
Message-ID: <Zhac0Ax1EF9JKJoE@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <ed02b81fcbbc0d27be4af460c521aefbfdc76375.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed02b81fcbbc0d27be4af460c521aefbfdc76375.1712743191.git.jani.nikula@intel.com>
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

Hi Jani,

On Wed, Apr 10, 2024 at 01:05:08PM +0300, Jani Nikula wrote:
> Use <> instead of "" for including headers from include/, even if the
> file is in the same directory.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
