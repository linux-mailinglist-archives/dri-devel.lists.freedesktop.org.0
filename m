Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888014EEA07
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 10:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26F112230;
	Fri,  1 Apr 2022 08:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F2111222D;
 Fri,  1 Apr 2022 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648803327; x=1680339327;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NCf3mq/EG7TwjTVVaxiDN8Un9Pu1SN2XV/dpj+qF3Kk=;
 b=nMvAIXNz5+3Jdd1MopmEzGb4sVV1AwAWhtXe6kw3n7wRYJW2vxf1EnBM
 2cWO2nxTITlsyrk84OHmEhKseMkjKe6htcty1bgVBvpmYYoRvgml3YJRw
 LyhPTlSEBNga9f8C4WP9k3gkqFrwXXtvOp6Fh9ySt+0/Y4mMXKq6AH5S3
 NLBib3kxnptPUvu18h2/EpJHNK3ghycmAIV3llkKgDpIAw9+Vx5yf0aQi
 pKE4mkuE0MqCI3E3pA0X695fLCtJPkG0AdVRrchn+oKGOyCskVLvo+in+
 3dXBRPEhR6eq+TjP+gHsEHctzNNoe+wBSrUxkQfTcxYUGCPDQeP4XVOYB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258914773"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="258914773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 01:55:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="547720659"
Received: from ltoropov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.40.29])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 01:55:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/12] drm/edid: cleanup and refactoring around
 validity checks
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648752228.git.jani.nikula@intel.com>
Date: Fri, 01 Apr 2022 11:55:21 +0300
Message-ID: <877d8989om.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/101931/
>
> Rebased, review comments addressed.

Ville, care to double check patches 1 & 7 please?

Thanks,
Jani.


>
> BR,
> Jani.
>
>
>
> Jani Nikula (12):
>   drm/edid: use struct edid * in drm_do_get_edid()
>   drm/edid: clean up EDID block checksum functions
>   drm/edid: add edid_block_tag() helper to get the EDID extension tag
>   drm/edid: make drm_edid_header_is_valid() accept void pointer
>   drm/edid: clean up edid_is_zero()
>   drm/edid: split out edid_header_fix()
>   drm/edid: split drm_edid_block_valid() to check and act parts
>   drm/edid: use a better variable name for EDID block read retries
>   drm/edid: simplify block check when filtering invalid blocks
>   drm/edid: split out invalid block filtering to a separate function
>   drm/edid: track invalid blocks in drm_do_get_edid()
>   drm/edid: reduce magic when updating the EDID block checksum
>
>  drivers/gpu/drm/drm_edid.c | 295 +++++++++++++++++++++----------------
>  include/drm/drm_edid.h     |   2 +-
>  2 files changed, 173 insertions(+), 124 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
