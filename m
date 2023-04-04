Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FA6D68AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A5410E6FD;
	Tue,  4 Apr 2023 16:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932D710E6FD;
 Tue,  4 Apr 2023 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680625437; x=1712161437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DsBcdg//wjPOCE7fgqSfvha9cUscumyHLm4mZ76mi7A=;
 b=aV1Bz28Xp2yErt2VMnn8Lkw8Jt8h3XBTfXz6/O3gGFK28VHZs1oSC7zP
 JgqHSjS2bZTp2DmlbBbzmapPZtv07ovjdNOVYoLjWqfMhDOOMuA4Zzqc4
 in7H45x0oN8VFfpirrrPRxuVvCpu/oTI+OLvNeF6h/ioq458SXwtcegtg
 B4tGNH7Z7hcT7VLx++YPHnX0MKzG1CgTfx8sGMH7SxI172idaAPMfYRsl
 Z4yF9Non5RUKZKNZxrvq1H1lCIjW414DNA3nt4NWCipvXZV22+RaQJEWZ
 wFtt3hJvSbxVrbRqYGE71Vk52igP5AmKyaiL0rQ+ZxD7uYomMBjRMqWvo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322621751"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="322621751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860646790"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="860646790"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:23:47 -0700
Date: Tue, 4 Apr 2023 18:23:17 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Message-ID: <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404143100.10452-1-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Apr 04, 2023 at 04:30:56PM +0200, Nirmoy Das wrote:
> Add a mechanism to keep existing data when creating
> a ttm object with I915_BO_ALLOC_USER flag.

why do we need this mechanism? What was the logic behind? These
are all questions people might have when checking this commit.
Please be a bit more explicative.

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
