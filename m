Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979E8A16CF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723E10F0FD;
	Thu, 11 Apr 2024 14:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOZW+E4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A890810F0FA;
 Thu, 11 Apr 2024 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844692; x=1744380692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4bDQwB3VMhxcew6dnmy1Bt6yzMtFxNo+0uH/M/JbTzk=;
 b=lOZW+E4OY0x5qENpyPGYIyzm20sBBBR/TqJ5IbvjNYI6Gm1SMPHTBtDt
 QCNKfjSzOqWYnHukWG98s59ys+r2kXLh5JYLT1vtf4FTlGZueenLnJBys
 nocUKW24p6p+iNi4Y+ixJ1QL4H8ED9i4CoKh+q9N+wMkRRuMNscSBm0HK
 rIJSAiScZANeYlyzxXqIj7+8IZpnAsixSGYe7Z886eir56/46OAjMgKyj
 EoEy9zKAqNbP5BmEZ2436jVlj/46V1nDd+AM+//qTwQCvFylilu6skHSZ
 mBD9grMHM5wCMWmAk0Fi7Nl+RHGIO8hSBFTcEMDf0DgOgBMvv+JngHolZ w==;
X-CSE-ConnectionGUID: R9j0KK1BQWq/ZJD/ejFiAQ==
X-CSE-MsgGUID: yywlQKLbSZ2ZKJxviub+Jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12034662"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12034662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:11:31 -0700
X-CSE-ConnectionGUID: GAoiNYFWTg+ODnKzqLakdQ==
X-CSE-MsgGUID: R1wmNJR6Ss2IGBsuhfczJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25684372"
Received: from unknown (HELO intel.com) ([10.247.119.2])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:11:26 -0700
Date: Thu, 11 Apr 2024 16:11:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: Re: [PATCH 03/10] drm: move i915_gsc_proxy_mei_interface.h under
 include/drm/intel
Message-ID: <ZhfviEwxCx_18k1H@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <63ebb7decdd99568bf8c3162be2e9fa88e3fc9de.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63ebb7decdd99568bf8c3162be2e9fa88e3fc9de.1712743191.git.jani.nikula@intel.com>
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

On Wed, Apr 10, 2024 at 01:05:10PM +0300, Jani Nikula wrote:
> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
