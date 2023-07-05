Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393047483C8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 14:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C32810E15D;
	Wed,  5 Jul 2023 12:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB9E10E15D;
 Wed,  5 Jul 2023 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688558914; x=1720094914;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xvecff9AxxIOHLAhqVlDZwFBL13hh7YbPk3rgaWL1s8=;
 b=G852LbyuM6+XqpEw9kXpS3fnsup6NJQANXcyxVO5FZz7ZWo+kEh3Qlt7
 h54CyXnpVNj2iyC9htebsVfnFE7DXMOUUq5uDK4ihC8Jf/wHIczRbUesJ
 6Gndi7iBIAfJV4mQVGtvUUukXVeIUx6HTRx/HKZ5FdOBRLRc1U2tZ+jo+
 H/aCVLgy8fciScaRvWogtFHYinTKg29oM7/hKqA2A32LmfpJLC9bMshTn
 OaPOCtX3s3WFhKRxhnEzFRCRRav6b/K/oaigw80xHZwtZTqA4pLsHLagG
 J3Gm9Y6Nhg+xiGRV+Hf6IX3+cuPws09gBND3ALlkzdpzY517ZdgUn5eKw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="449690512"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="449690512"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 05:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="832509248"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="832509248"
Received: from unisar-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.23])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 05:08:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Remove some dead "code"
In-Reply-To: <20230705095518.3690951-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230705095518.3690951-1-tvrtko.ursulin@linux.intel.com>
Date: Wed, 05 Jul 2023 15:08:29 +0300
Message-ID: <87r0pmzhky.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Jul 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Commit 2caffbf11762 ("drm/i915: Revoke mmaps and prevent access to fence
> registers across reset") removed the temporary implementation of a reset
> under stop machine but forgot to remove this one commented out define.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 6916eba3bd33..cdbc08dad7ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -35,9 +35,6 @@
>  
>  #define RESET_MAX_RETRIES 3
>  
> -/* XXX How to handle concurrent GGTT updates using tiling registers? */
> -#define RESET_UNDER_STOP_MACHINE 0
> -
>  static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
>  {
>  	struct drm_i915_file_private *file_priv = ctx->file_priv;

-- 
Jani Nikula, Intel Open Source Graphics Center
