Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B888514860
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 13:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327EF10E901;
	Fri, 29 Apr 2022 11:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876C10E1C4;
 Fri, 29 Apr 2022 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651232508; x=1682768508;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VdQFpZNA7FpnPQsSDUTNKVused4DCQuyzq+ujv2qbtY=;
 b=JXY74f/9Wa+a4/cx70l6z0CgqlxFaZEgCvKRxRUaHXUQW4t6lUGrvLCn
 C9q/s+Bm/fspkGq0VuNukxwdLs2o8c59niPPUBsae4+eBYy5d7wlR+Zrh
 lyNE2CTps451WLsJEuJiUMyd1DsaXdI5sVV4+OkMh+bkQV2pCQd6dhtn6
 2pmR3aBRTU/E40alCCoZfWEmLfYf3NNo8SQp2uBghdkKGiXYKtyYG4IWW
 IxAP/iHBlJypqIEbWo+TY9o94tnIe6WuPWJAshXsj1BgjU9HU9Wg4WlNc
 NAVbT10SbmgQexm+FVOA2cXWbAmeiRCqVf9DC1YytEZjTgS8bpNnVLkke g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="264209368"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="264209368"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:41:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534445175"
Received: from agerasym-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.133.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:41:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/edid: fix kernel-doc parameter name mismatches
In-Reply-To: <20220426091913.1339941-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426091913.1339941-1-jani.nikula@intel.com>
Date: Fri, 29 Apr 2022 14:41:43 +0300
Message-ID: <87r15grua0.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Fix the below drm/edid kernel-doc warnings:
>
> drivers/gpu/drm/drm_edid.c:1589: warning: Function parameter or member '_edid' not described in 'drm_edid_header_is_valid'
> drivers/gpu/drm/drm_edid.c:1589: warning: Excess function parameter 'raw_edid' description in 'drm_edid_header_is_valid'
> drivers/gpu/drm/drm_edid.c:1737: warning: Function parameter or member '_block' not described in 'drm_edid_block_valid'
> drivers/gpu/drm/drm_edid.c:1737: warning: Excess function parameter 'raw_edid' description in 'drm_edid_block_valid'
> drivers/gpu/drm/drm_edid.c:2136: warning: Function parameter or member 'read_block' not described in 'drm_do_get_edid'
> drivers/gpu/drm/drm_edid.c:2136: warning: Function parameter or member 'context' not described in 'drm_do_get_edid'
> drivers/gpu/drm/drm_edid.c:2136: warning: Excess function parameter 'get_edid_block' description in 'drm_do_get_edid'
> drivers/gpu/drm/drm_edid.c:2136: warning: Excess function parameter 'data' description in 'drm_do_get_edid'
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> References: https://lore.kernel.org/r/20220406154431.567414c3@canb.auug.org.au
> References: https://lore.kernel.org/r/20220420162431.2b28ddea@canb.auug.org.au
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed both to drm-misc-next with Simon's irc r-b. Thanks for the report
& review.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_edid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 7a8482b75071..6446f5d3944b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1610,7 +1610,7 @@ static void edid_header_fix(void *edid)
>  
>  /**
>   * drm_edid_header_is_valid - sanity check the header of the base EDID block
> - * @raw_edid: pointer to raw base EDID block
> + * @_edid: pointer to raw base EDID block
>   *
>   * Sanity check the header of the base EDID block.
>   *
> @@ -1827,7 +1827,7 @@ static void edid_block_dump(const char *level, const void *block, int block_num)
>  
>  /**
>   * drm_edid_block_valid - Sanity check the EDID block (base or extension)
> - * @raw_edid: pointer to raw EDID block
> + * @_block: pointer to raw EDID block
>   * @block_num: type of block to validate (0 for base, extension otherwise)
>   * @print_bad_edid: if true, dump bad EDID blocks to the console
>   * @edid_corrupt: if true, the header or checksum is invalid
> @@ -2112,8 +2112,8 @@ static enum edid_block_status edid_block_read(void *block, unsigned int block_nu
>  /**
>   * drm_do_get_edid - get EDID data using a custom EDID block read function
>   * @connector: connector we're probing
> - * @get_edid_block: EDID block read function
> - * @data: private data passed to the block read function
> + * @read_block: EDID block read function
> + * @context: private data passed to the block read function
>   *
>   * When the I2C adapter connected to the DDC bus is hidden behind a device that
>   * exposes a different interface to read EDID blocks this function can be used

-- 
Jani Nikula, Intel Open Source Graphics Center
